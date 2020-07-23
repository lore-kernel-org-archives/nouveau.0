From: Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v4 5/6] mm/hmm/test: use the new migration invalidation
Date: Thu, 23 Jul 2020 15:30:03 -0700
Message-ID: <20200723223004.9586-6-rcampbell@nvidia.com>
References: <20200723223004.9586-1-rcampbell@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-rdma-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200723223004.9586-1-rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-rdma-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, kvm-ppc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kselftest-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Jerome Glisse <jglisse-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, John Hubbard <jhubbard-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>, Jason Gunthorpe <jgg-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Shuah Khan <shuah-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Bharata B Rao <bharata-tEXmvtCZX7AybS5Ee8rs3A@public.gmane.org>, Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Use the new MMU_NOTIFY_MIGRATE event to skip MMU invalidations of device
private memory and handle the invalidation in the driver as part of
migrating device private memory.

Signed-off-by: Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 lib/test_hmm.c                         | 30 +++++++++++++++-----------
 tools/testing/selftests/vm/hmm-tests.c | 18 ++++++++++++----
 2 files changed, 31 insertions(+), 17 deletions(-)

diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index e78a1414f58e..e7dc3de355b7 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -214,6 +214,14 @@ static bool dmirror_interval_invalidate(struct mmu_int=
erval_notifier *mni,
 {
 	struct dmirror *dmirror =3D container_of(mni, struct dmirror, notifier);
=20
+	/*
+	 * Ignore invalidation callbacks for device private pages since
+	 * the invalidation is handled as part of the migration process.
+	 */
+	if (range->event =3D=3D MMU_NOTIFY_MIGRATE &&
+	    range->migrate_pgmap_owner =3D=3D dmirror->mdevice)
+		return true;
+
 	if (mmu_notifier_range_blockable(range))
 		mutex_lock(&dmirror->mutex);
 	else if (!mutex_trylock(&dmirror->mutex))
@@ -693,7 +701,7 @@ static int dmirror_migrate(struct dmirror *dmirror,
 		args.dst =3D dst_pfns;
 		args.start =3D addr;
 		args.end =3D next;
-		args.pgmap_owner =3D NULL;
+		args.pgmap_owner =3D dmirror->mdevice;
 		args.flags =3D MIGRATE_VMA_SELECT_SYSTEM;
 		ret =3D migrate_vma_setup(&args);
 		if (ret)
@@ -983,7 +991,7 @@ static void dmirror_devmem_free(struct page *page)
 }
=20
 static vm_fault_t dmirror_devmem_fault_alloc_and_copy(struct migrate_vma *=
args,
-						struct dmirror_device *mdevice)
+						      struct dmirror *dmirror)
 {
 	const unsigned long *src =3D args->src;
 	unsigned long *dst =3D args->dst;
@@ -1005,6 +1013,7 @@ static vm_fault_t dmirror_devmem_fault_alloc_and_copy=
(struct migrate_vma *args,
 			continue;
=20
 		lock_page(dpage);
+		xa_erase(&dmirror->pt, addr >> PAGE_SHIFT);
 		copy_highpage(dpage, spage);
 		*dst =3D migrate_pfn(page_to_pfn(dpage)) | MIGRATE_PFN_LOCKED;
 		if (*src & MIGRATE_PFN_WRITE)
@@ -1013,15 +1022,6 @@ static vm_fault_t dmirror_devmem_fault_alloc_and_cop=
y(struct migrate_vma *args,
 	return 0;
 }
=20
-static void dmirror_devmem_fault_finalize_and_map(struct migrate_vma *args=
,
-						  struct dmirror *dmirror)
-{
-	/* Invalidate the device's page table mapping. */
-	mutex_lock(&dmirror->mutex);
-	dmirror_do_update(dmirror, args->start, args->end);
-	mutex_unlock(&dmirror->mutex);
-}
-
 static vm_fault_t dmirror_devmem_fault(struct vm_fault *vmf)
 {
 	struct migrate_vma args;
@@ -1051,11 +1051,15 @@ static vm_fault_t dmirror_devmem_fault(struct vm_fa=
ult *vmf)
 	if (migrate_vma_setup(&args))
 		return VM_FAULT_SIGBUS;
=20
-	ret =3D dmirror_devmem_fault_alloc_and_copy(&args, dmirror->mdevice);
+	ret =3D dmirror_devmem_fault_alloc_and_copy(&args, dmirror);
 	if (ret)
 		return ret;
 	migrate_vma_pages(&args);
-	dmirror_devmem_fault_finalize_and_map(&args, dmirror);
+	/*
+	 * No device finalize step is needed since
+	 * dmirror_devmem_fault_alloc_and_copy() will have already
+	 * invalidated the device page table.
+	 */
 	migrate_vma_finalize(&args);
 	return 0;
 }
diff --git a/tools/testing/selftests/vm/hmm-tests.c b/tools/testing/selftes=
ts/vm/hmm-tests.c
index b533dd08da1d..91d38a29956b 100644
--- a/tools/testing/selftests/vm/hmm-tests.c
+++ b/tools/testing/selftests/vm/hmm-tests.c
@@ -881,8 +881,9 @@ TEST_F(hmm, migrate)
 }
=20
 /*
- * Migrate anonymous memory to device private memory and fault it back to =
system
- * memory.
+ * Migrate anonymous memory to device private memory and fault some of it =
back
+ * to system memory, then try migrating the resulting mix of system and de=
vice
+ * private memory to the device.
  */
 TEST_F(hmm, migrate_fault)
 {
@@ -924,8 +925,17 @@ TEST_F(hmm, migrate_fault)
 	for (i =3D 0, ptr =3D buffer->mirror; i < size / sizeof(*ptr); ++i)
 		ASSERT_EQ(ptr[i], i);
=20
-	/* Fault pages back to system memory and check them. */
-	for (i =3D 0, ptr =3D buffer->ptr; i < size / sizeof(*ptr); ++i)
+	/* Fault half the pages back to system memory and check them. */
+	for (i =3D 0, ptr =3D buffer->ptr; i < size / (2 * sizeof(*ptr)); ++i)
+		ASSERT_EQ(ptr[i], i);
+
+	/* Migrate memory to the device again. */
+	ret =3D hmm_dmirror_cmd(self->fd, HMM_DMIRROR_MIGRATE, buffer, npages);
+	ASSERT_EQ(ret, 0);
+	ASSERT_EQ(buffer->cpages, npages);
+
+	/* Check what the device read. */
+	for (i =3D 0, ptr =3D buffer->mirror; i < size / sizeof(*ptr); ++i)
 		ASSERT_EQ(ptr[i], i);
=20
 	hmm_buffer_free(buffer);
--=20
2.20.1

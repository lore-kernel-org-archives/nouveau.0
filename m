From: Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 5/5] mm/hmm/test: use the new migration invalidation
Date: Mon, 6 Jul 2020 15:23:47 -0700
Message-ID: <20200706222347.32290-6-rcampbell@nvidia.com>
References: <20200706222347.32290-1-rcampbell@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-rdma-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200706222347.32290-1-rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-rdma-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, kvm-ppc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kselftest-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Jerome Glisse <jglisse-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, John Hubbard <jhubbard-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>, Jason Gunthorpe <jgg-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Shuah Khan <shuah-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Bharata B Rao <bharata-tEXmvtCZX7AybS5Ee8rs3A@public.gmane.org>, Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Use the new MMU_NOTIFY_MIGRATE event to skip MMU invalidations of device
private memory and handle the invalidation in the driver as part of
migrating device private memory.

Signed-off-by: Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 lib/test_hmm.c | 31 ++++++++++++++++++-------------
 1 file changed, 18 insertions(+), 13 deletions(-)

diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index 1bd60cfb5a25..a170e5f7fb2e 100644
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
+	    range->data =3D=3D dmirror->mdevice)
+		return true;
+
 	if (mmu_notifier_range_blockable(range))
 		mutex_lock(&dmirror->mutex);
 	else if (!mutex_trylock(&dmirror->mutex))
@@ -702,7 +710,7 @@ static int dmirror_migrate(struct dmirror *dmirror,
 		args.dst =3D dst_pfns;
 		args.start =3D addr;
 		args.end =3D next;
-		args.src_owner =3D NULL;
+		args.src_owner =3D dmirror->mdevice;
 		args.dir =3D MIGRATE_VMA_FROM_SYSTEM;
 		ret =3D migrate_vma_setup(&args);
 		if (ret)
@@ -992,7 +1000,7 @@ static void dmirror_devmem_free(struct page *page)
 }
=20
 static vm_fault_t dmirror_devmem_fault_alloc_and_copy(struct migrate_vma *=
args,
-						struct dmirror_device *mdevice)
+						      struct dmirror *dmirror)
 {
 	const unsigned long *src =3D args->src;
 	unsigned long *dst =3D args->dst;
@@ -1014,6 +1022,7 @@ static vm_fault_t dmirror_devmem_fault_alloc_and_copy=
(struct migrate_vma *args,
 			continue;
=20
 		lock_page(dpage);
+		xa_erase(&dmirror->pt, addr >> PAGE_SHIFT);
 		copy_highpage(dpage, spage);
 		*dst =3D migrate_pfn(page_to_pfn(dpage)) | MIGRATE_PFN_LOCKED;
 		if (*src & MIGRATE_PFN_WRITE)
@@ -1022,15 +1031,6 @@ static vm_fault_t dmirror_devmem_fault_alloc_and_cop=
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
@@ -1060,11 +1060,16 @@ static vm_fault_t dmirror_devmem_fault(struct vm_fa=
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
+	 * invalidated the device page table. We could reinstate device MMU
+	 * entries for pages that didn't migrate but that should be rare.
+	 */
 	migrate_vma_finalize(&args);
 	return 0;
 }
--=20
2.20.1

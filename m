From: Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 06/16] mm/hmm: test mixed normal and device private migrations
Date: Fri, 19 Jun 2020 14:56:39 -0700
Message-ID: <20200619215649.32297-7-rcampbell@nvidia.com>
References: <20200619215649.32297-1-rcampbell@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-rdma-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200619215649.32297-1-rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-rdma-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, linux-kselftest-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Jerome Glisse <jglisse-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, John Hubbard <jhubbard-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>, Jason Gunthorpe <jgg-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Shuah Khan <shuah-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Add a test to check that migrating a range of addresses with mixed
device private pages and normal anonymous pages are all migrated.

Signed-off-by: Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 lib/test_hmm.c                         | 22 +++++++++++++++++-----
 tools/testing/selftests/vm/hmm-tests.c | 18 ++++++++++++++----
 2 files changed, 31 insertions(+), 9 deletions(-)

diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index f7c2b51a7a9d..50bdf041770a 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -588,12 +588,24 @@ static void dmirror_migrate_alloc_and_copy(struct mig=
rate_vma *args,
=20
 		/*
 		 * Don't migrate device private pages from our own driver or
-		 * others. For our own we would do a device private memory copy
-		 * not a migration and for others, we would need to fault the
-		 * other device's page into system memory first.
+		 * others. Other device's private pages are skipped because
+		 * the src_owner field won't match. The migrate_vma_setup()
+		 * will have invalidated our page tables for our own device
+		 * private pages as part of isolating and locking the pages.
+		 * In this case, repopulate our page table.
 		 */
-		if (spage && is_zone_device_page(spage))
+		if (spage && is_zone_device_page(spage)) {
+			unsigned long pfn =3D addr >> PAGE_SHIFT;
+			void *entry;
+
+			mutex_lock(&dmirror->mutex);
+			entry =3D spage->zone_device_data;
+			if (*src & MIGRATE_PFN_WRITE)
+				entry =3D xa_tag_pointer(entry, DPT_XA_TAG_WRITE);
+			xa_store(&dmirror->pt, pfn, entry, GFP_ATOMIC);
+			mutex_unlock(&dmirror->mutex);
 			continue;
+		}
=20
 		dpage =3D dmirror_devmem_alloc_page(mdevice);
 		if (!dpage)
@@ -703,7 +715,7 @@ static int dmirror_migrate(struct dmirror *dmirror,
 		args.dst =3D dst_pfns;
 		args.start =3D addr;
 		args.end =3D next;
-		args.src_owner =3D NULL;
+		args.src_owner =3D dmirror->mdevice;
 		ret =3D migrate_vma_setup(&args);
 		if (ret)
 			goto out;
diff --git a/tools/testing/selftests/vm/hmm-tests.c b/tools/testing/selftes=
ts/vm/hmm-tests.c
index bdfa95ac9a7d..e2a36783e99d 100644
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

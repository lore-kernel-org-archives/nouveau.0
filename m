From: Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 11/16] hmm: add tests for HMM_PFN_COMPOUND flag
Date: Fri, 19 Jun 2020 14:56:44 -0700
Message-ID: <20200619215649.32297-12-rcampbell@nvidia.com>
References: <20200619215649.32297-1-rcampbell@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20200619215649.32297-1-rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, linux-kselftest-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jason Gunthorpe <jgg-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Shuah Khan <shuah-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Add some sanity tests for hmm_range_fault() returning the HMM_PFN_COMPOUND
flag.

Signed-off-by: Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 lib/test_hmm.c                         |  2 +
 lib/test_hmm_uapi.h                    |  2 +
 tools/testing/selftests/vm/hmm-tests.c | 76 ++++++++++++++++++++++++++
 3 files changed, 80 insertions(+)

diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index 50bdf041770a..db5d2e8d7420 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -779,6 +779,8 @@ static void dmirror_mkentry(struct dmirror *dmirror, struct hmm_range *range,
 		*perm |= HMM_DMIRROR_PROT_WRITE;
 	else
 		*perm |= HMM_DMIRROR_PROT_READ;
+	if (entry & HMM_PFN_COMPOUND)
+		*perm |= HMM_DMIRROR_PROT_COMPOUND;
 }
 
 static bool dmirror_snapshot_invalidate(struct mmu_interval_notifier *mni,
diff --git a/lib/test_hmm_uapi.h b/lib/test_hmm_uapi.h
index 67b3b2e6ff5d..21cf4da6f020 100644
--- a/lib/test_hmm_uapi.h
+++ b/lib/test_hmm_uapi.h
@@ -40,6 +40,7 @@ struct hmm_dmirror_cmd {
  * HMM_DMIRROR_PROT_NONE: unpopulated PTE or PTE with no access
  * HMM_DMIRROR_PROT_READ: read-only PTE
  * HMM_DMIRROR_PROT_WRITE: read/write PTE
+ * HMM_DMIRROR_PROT_COMPOUND: compound page is fully mapped by same permissions
  * HMM_DMIRROR_PROT_ZERO: special read-only zero page
  * HMM_DMIRROR_PROT_DEV_PRIVATE_LOCAL: Migrated device private page on the
  *					device the ioctl() is made
@@ -51,6 +52,7 @@ enum {
 	HMM_DMIRROR_PROT_NONE			= 0x00,
 	HMM_DMIRROR_PROT_READ			= 0x01,
 	HMM_DMIRROR_PROT_WRITE			= 0x02,
+	HMM_DMIRROR_PROT_COMPOUND		= 0x04,
 	HMM_DMIRROR_PROT_ZERO			= 0x10,
 	HMM_DMIRROR_PROT_DEV_PRIVATE_LOCAL	= 0x20,
 	HMM_DMIRROR_PROT_DEV_PRIVATE_REMOTE	= 0x30,
diff --git a/tools/testing/selftests/vm/hmm-tests.c b/tools/testing/selftests/vm/hmm-tests.c
index e2a36783e99d..e0fa864d03fa 100644
--- a/tools/testing/selftests/vm/hmm-tests.c
+++ b/tools/testing/selftests/vm/hmm-tests.c
@@ -1301,6 +1301,82 @@ TEST_F(hmm2, snapshot)
 	hmm_buffer_free(buffer);
 }
 
+/*
+ * Test the hmm_range_fault() HMM_PFN_COMPOUND flag for large pages that
+ * should be mapped by a large page table entry.
+ */
+TEST_F(hmm, compound)
+{
+	struct hmm_buffer *buffer;
+	unsigned long npages;
+	unsigned long size;
+	int *ptr;
+	unsigned char *m;
+	int ret;
+	long pagesizes[4];
+	int n, idx;
+	unsigned long i;
+
+	/* Skip test if we can't allocate a hugetlbfs page. */
+
+	n = gethugepagesizes(pagesizes, 4);
+	if (n <= 0)
+		return;
+	for (idx = 0; --n > 0; ) {
+		if (pagesizes[n] < pagesizes[idx])
+			idx = n;
+	}
+	size = ALIGN(TWOMEG, pagesizes[idx]);
+	npages = size >> self->page_shift;
+
+	buffer = malloc(sizeof(*buffer));
+	ASSERT_NE(buffer, NULL);
+
+	buffer->ptr = get_hugepage_region(size, GHR_STRICT);
+	if (buffer->ptr == NULL) {
+		free(buffer);
+		return;
+	}
+
+	buffer->size = size;
+	buffer->mirror = malloc(npages);
+	ASSERT_NE(buffer->mirror, NULL);
+
+	/* Initialize the pages the device will snapshot in buffer->ptr. */
+	for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
+		ptr[i] = i;
+
+	/* Simulate a device snapshotting CPU pagetables. */
+	ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_SNAPSHOT, buffer, npages);
+	ASSERT_EQ(ret, 0);
+	ASSERT_EQ(buffer->cpages, npages);
+
+	/* Check what the device saw. */
+	m = buffer->mirror;
+	for (i = 0; i < npages; ++i)
+		ASSERT_EQ(m[i], HMM_DMIRROR_PROT_WRITE |
+				HMM_DMIRROR_PROT_COMPOUND);
+
+	/* Make the region read-only. */
+	ret = mprotect(buffer->ptr, size, PROT_READ);
+	ASSERT_EQ(ret, 0);
+
+	/* Simulate a device snapshotting CPU pagetables. */
+	ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_SNAPSHOT, buffer, npages);
+	ASSERT_EQ(ret, 0);
+	ASSERT_EQ(buffer->cpages, npages);
+
+	/* Check what the device saw. */
+	m = buffer->mirror;
+	for (i = 0; i < npages; ++i)
+		ASSERT_EQ(m[i], HMM_DMIRROR_PROT_READ |
+				HMM_DMIRROR_PROT_COMPOUND);
+
+	free_hugepage_region(buffer->ptr);
+	buffer->ptr = NULL;
+	hmm_buffer_free(buffer);
+}
+
 /*
  * Test two devices reading the same memory (double mapped).
  */
-- 
2.20.1

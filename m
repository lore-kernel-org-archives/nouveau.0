From: Christoph Hellwig <hch@lst.de>
Subject: [PATCH 3/6] nouveau: remove the block parameter to nouveau_range_fault
Date: Mon, 22 Jul 2019 11:44:23 +0200
Message-ID: <20190722094426.18563-4-hch@lst.de>
References: <20190722094426.18563-1-hch@lst.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190722094426.18563-1-hch@lst.de>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>
Cc: Ralph Campbell <rcampbell@nvidia.com>, linux-mm@kvack.org, nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

The parameter is always false, so remove it as well as the -EAGAIN
handling that can only happen for the non-blocking case.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/gpu/drm/nouveau/nouveau_svm.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
index cde09003c06b..5dd83a46578f 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
@@ -484,8 +484,7 @@ static inline bool nouveau_range_done(struct hmm_range *range)
 }
 
 static int
-nouveau_range_fault(struct hmm_mirror *mirror, struct hmm_range *range,
-		    bool block)
+nouveau_range_fault(struct hmm_mirror *mirror, struct hmm_range *range)
 {
 	long ret;
 
@@ -503,7 +502,7 @@ nouveau_range_fault(struct hmm_mirror *mirror, struct hmm_range *range,
 		return -EAGAIN;
 	}
 
-	ret = hmm_range_fault(range, block);
+	ret = hmm_range_fault(range, true);
 	if (ret <= 0) {
 		if (ret == -EBUSY || !ret) {
 			up_read(&range->vma->vm_mm->mmap_sem);
@@ -690,7 +689,7 @@ nouveau_svm_fault(struct nvif_notify *notify)
 		range.values = nouveau_svm_pfn_values;
 		range.pfn_shift = NVIF_VMM_PFNMAP_V0_ADDR_SHIFT;
 again:
-		ret = nouveau_range_fault(&svmm->mirror, &range, true);
+		ret = nouveau_range_fault(&svmm->mirror, &range);
 		if (ret == 0) {
 			mutex_lock(&svmm->mutex);
 			if (!nouveau_range_done(&range)) {
-- 
2.20.1

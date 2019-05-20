From: Souptick Joarder <jrdr.linux@gmail.com>
Subject: [PATCH] drm/nouveau/svm: Convert to use hmm_range_fault()
Date: Tue, 21 May 2019 00:31:58 +0530
Message-ID: <1558378918-25279-1-git-send-email-jrdr.linux@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: bskeggs@redhat.com, airlied@linux.ie, daniel@ffwll.ch, jglisse@redhat.com
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, Souptick Joarder <jrdr.linux@gmail.com>
List-Id: nouveau.vger.kernel.org

Convert to use hmm_range_fault().

Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
---
 drivers/gpu/drm/nouveau/nouveau_svm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
index 93ed43c..8d56bd6 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
@@ -649,7 +649,7 @@ struct nouveau_svmm {
 		range.values = nouveau_svm_pfn_values;
 		range.pfn_shift = NVIF_VMM_PFNMAP_V0_ADDR_SHIFT;
 again:
-		ret = hmm_vma_fault(&range, true);
+		ret = hmm_range_fault(&range, true);
 		if (ret == 0) {
 			mutex_lock(&svmm->mutex);
 			if (!hmm_vma_range_done(&range)) {
-- 
1.9.1

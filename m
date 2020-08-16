From: Gaurav Singh <gaurav1086@gmail.com>
Subject: [PATCH] drivers/nouveau_svm: fix bounds check in nouveau_svm_fault_buffer_dtor
Date: Sun, 16 Aug 2020 10:51:41 -0400
Message-ID: <20200816145142.25062-1-gaurav1086@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: gaurav1086@gmail.com, Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, "open list:DRM DRIVER FOR NVIDIA
        GEFORCE/QUADRO GPUS" <dri-devel@lists.freedesktop.org>, "open list:DRM DRIVER FOR NVIDIA
        GEFORCE/QUADRO GPUS" <nouveau@lists.freedesktop.org>, open list <linux-kernel@vger.kernel.org>
List-Id: nouveau.vger.kernel.org

do the bounds check before accessing the buffer element.

Fixes: eeaf06ac1a558 ("drm/nouveau/svm: initial support for shared virtual memory")
Signed-off-by: Gaurav Singh <gaurav1086@gmail.com>
---
 drivers/gpu/drm/nouveau/nouveau_svm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
index 6586d9d39874..35d24946787d 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
@@ -897,7 +897,7 @@ nouveau_svm_fault_buffer_dtor(struct nouveau_svm *svm, int id)
 	int i;
 
 	if (buffer->fault) {
-		for (i = 0; buffer->fault[i] && i < buffer->entries; i++)
+		for (i = 0; i < buffer->entries && buffer->fault[i]; i++)
 			kfree(buffer->fault[i]);
 		kvfree(buffer->fault);
 	}
-- 
2.17.1

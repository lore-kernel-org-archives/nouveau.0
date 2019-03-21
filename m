From: jglisse@redhat.com
Subject: [PATCH] gpu/nouveau: empty chunk do not have a buffer object associated with them.
Date: Thu, 21 Mar 2019 15:42:18 -0400
Message-ID: <20190321194218.2716-1-jglisse@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>, Ben Skeggs <bskeggs@redhat.com>, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
List-Id: nouveau.vger.kernel.org

From: Jérôme Glisse <jglisse@redhat.com>

Empty chunk do not have a bo associated with them so no need to pin/unpin
on suspend/resume.

This fix suspend/resume on 5.1rc1 when NOUVEAU_SVM is enabled.

Signed-off-by: Jérôme Glisse <jglisse@redhat.com>
Reviewed-by: Tobias Klausmann <tobias.johannes.klausmann@mni.thm.de>
Tested-by: Tobias Klausmann <tobias.johannes.klausmann@mni.thm.de>
Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 drivers/gpu/drm/nouveau/nouveau_dmem.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
index aa9fec80492d..a510dbe9a9cb 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -456,11 +456,6 @@ nouveau_dmem_resume(struct nouveau_drm *drm)
 		/* FIXME handle pin failure */
 		WARN_ON(ret);
 	}
-	list_for_each_entry (chunk, &drm->dmem->chunk_empty, list) {
-		ret = nouveau_bo_pin(chunk->bo, TTM_PL_FLAG_VRAM, false);
-		/* FIXME handle pin failure */
-		WARN_ON(ret);
-	}
 	mutex_unlock(&drm->dmem->mutex);
 }
 
@@ -479,9 +474,6 @@ nouveau_dmem_suspend(struct nouveau_drm *drm)
 	list_for_each_entry (chunk, &drm->dmem->chunk_full, list) {
 		nouveau_bo_unpin(chunk->bo);
 	}
-	list_for_each_entry (chunk, &drm->dmem->chunk_empty, list) {
-		nouveau_bo_unpin(chunk->bo);
-	}
 	mutex_unlock(&drm->dmem->mutex);
 }
 
-- 
2.17.1

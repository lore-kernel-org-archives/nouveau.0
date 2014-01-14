From: Maarten Lankhorst <maarten.lankhorst@canonical.com>
Subject: [PATCH 1/2] drm/nouveau: hold mutex while syncing to kernel channel
Date: Tue, 14 Jan 2014 16:48:58 +0100
Message-ID: <52D55C6A.80804@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
To: Ben Skeggs <bskeggs@redhat.com>
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

Not holding the mutex potentially causes corruption of the kernel
channel when page flipping.

Cc: stable@vger.kernel.org #3.13
Signed-off-by: Maarten Lankhorst <maarten.lankhorst@canonical.com>
---
diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
index 29c3efdfc7dd..76e3cf025c10 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.c
+++ b/drivers/gpu/drm/nouveau/nouveau_display.c
@@ -603,6 +603,14 @@ nouveau_crtc_page_flip(struct drm_crtc *crtc, struct drm_framebuffer *fb,
  	if (!s)
  		return -ENOMEM;
  
+	if (new_bo != old_bo) {
+		ret = nouveau_bo_pin(new_bo, TTM_PL_FLAG_VRAM);
+		if (ret)
+			goto fail_free;
+	}
+
+	mutex_lock(&chan->cli->mutex);
+
  	/* synchronise rendering channel with the kernel's channel */
  	spin_lock(&new_bo->bo.bdev->fence_lock);
  	fence = nouveau_fence_ref(new_bo->bo.sync_obj);
@@ -612,13 +620,6 @@ nouveau_crtc_page_flip(struct drm_crtc *crtc, struct drm_framebuffer *fb,
  	if (ret)
  		return ret;
  
-	if (new_bo != old_bo) {
-		ret = nouveau_bo_pin(new_bo, TTM_PL_FLAG_VRAM);
-		if (ret)
-			goto fail_free;
-	}
-
-	mutex_lock(&chan->cli->mutex);
  	ret = ttm_bo_reserve(&old_bo->bo, true, false, false, NULL);
  	if (ret)
  		goto fail_unpin;

From: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH 31/37] drm/vmwgfx: add proper framebuffer refcounting
Date: Wed, 12 Dec 2012 14:07:11 +0100
Message-ID: <1355317637-16742-32-git-send-email-daniel.vetter@ffwll.ch>
References: <1355317637-16742-1-git-send-email-daniel.vetter@ffwll.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <1355317637-16742-1-git-send-email-daniel.vetter@ffwll.ch>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: DRI Development <dri-devel@lists.freedesktop.org>
Cc: Nouveau Dev <nouveau@lists.freedesktop.org>, Intel Graphics Development <intel-gfx@lists.freedesktop.org>, Radeon Dev <xorg-driver-ati@lists.x.org>, Daniel Vetter <daniel.vetter@ffwll.ch>
List-Id: nouveau.vger.kernel.org

Afact vmwgfx already has all the right refcounting implemented on the
backing storage, and we only need to ensure that the drm fb doesn't
disappear untimely. So holding onto the fb reference from _lookup
until vmw_kms_present has completed should be enough.

Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_ioctl.c |    8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ioctl.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ioctl.c
index 4a73e9e..4a16b79 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ioctl.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ioctl.c
@@ -169,8 +169,6 @@ int vmw_present_ioctl(struct drm_device *dev, void *data,
 		ret = -EINVAL;
 		goto out_no_fb;
 	}
-	/* fb is protect by the mode_config lock, so drop the ref immediately */
-	drm_framebuffer_unreference(fb);
 	vfb = vmw_framebuffer_to_vfb(fb);
 
 	ret = ttm_read_lock(&vmaster->lock, true);
@@ -195,6 +193,7 @@ int vmw_present_ioctl(struct drm_device *dev, void *data,
 out_no_surface:
 	ttm_read_unlock(&vmaster->lock);
 out_no_ttm_lock:
+	drm_framebuffer_unreference(fb);
 out_no_fb:
 	drm_modeset_unlock_all(dev);
 out_no_copy:
@@ -254,14 +253,12 @@ int vmw_present_readback_ioctl(struct drm_device *dev, void *data,
 		ret = -EINVAL;
 		goto out_no_fb;
 	}
-	/* fb is protect by the mode_config lock, so drop the ref immediately */
-	drm_framebuffer_unreference(fb);
 
 	vfb = vmw_framebuffer_to_vfb(fb);
 	if (!vfb->dmabuf) {
 		DRM_ERROR("Framebuffer not dmabuf backed.\n");
 		ret = -EINVAL;
-		goto out_no_fb;
+		goto out_no_ttm_lock;
 	}
 
 	ret = ttm_read_lock(&vmaster->lock, true);
@@ -274,6 +271,7 @@ int vmw_present_readback_ioctl(struct drm_device *dev, void *data,
 
 	ttm_read_unlock(&vmaster->lock);
 out_no_ttm_lock:
+	drm_framebuffer_unreference(fb);
 out_no_fb:
 	drm_modeset_unlock_all(dev);
 out_no_copy:
-- 
1.7.10.4

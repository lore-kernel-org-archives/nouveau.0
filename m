From: Matthew Garrett <mjg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 4/4] nouveau: Allocate existing framebuffers on
	nv50
Date: Fri,  3 Feb 2012 13:22:22 -0500
Message-ID: <1328293342-1643-4-git-send-email-mjg@redhat.com>
References: <1328293342-1643-1-git-send-email-mjg@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1328293342-1643-1-git-send-email-mjg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Matthew Garrett <mjg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Performing a flicker-free boot involves being able to ensure that we don't
write to the memory that's currently being scanned out, which means we need
to be able to allocate a block that matches the current framebuffer in
order to prevent that. This adds support for reading out the current
framebuffer state on nv50 and avoids graphical glitches appearing during
modesetting.

Signed-off-by: Matthew Garrett <mjg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_reg.h   |    1 +
 drivers/gpu/drm/nouveau/nouveau_state.c |    2 ++
 drivers/gpu/drm/nouveau/nv50_display.c  |   30 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/nouveau/nv50_display.h  |    1 +
 4 files changed, 34 insertions(+), 0 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_reg.h b/drivers/gpu/drm/nouveau/nouveau_reg.h
index 43a96b9..0c8e2c4 100644
--- a/drivers/gpu/drm/nouveau/nouveau_reg.h
+++ b/drivers/gpu/drm/nouveau/nouveau_reg.h
@@ -757,6 +757,7 @@
 #define NV50_PDISPLAY_CRTC_SCALE_CTRL                                0x00610a50
 #define NV50_PDISPLAY_CRTC_CURSOR_CTRL                               0x00610a58
 #define NV50_PDISPLAY_CRTC_UNK0A78 /* mthd 0x0904 */                 0x00610a78
+#define NV50_PDISPLAY_CRTC_FB_OFFSET				     0x00610a84
 #define NV50_PDISPLAY_CRTC_UNK0AB8                                   0x00610ab8
 #define NV50_PDISPLAY_CRTC_DEPTH                                     0x00610ac8
 #define NV50_PDISPLAY_CRTC_CLOCK                                     0x00610ad0
diff --git a/drivers/gpu/drm/nouveau/nouveau_state.c b/drivers/gpu/drm/nouveau/nouveau_state.c
index 65e4c21..f521081 100644
--- a/drivers/gpu/drm/nouveau/nouveau_state.c
+++ b/drivers/gpu/drm/nouveau/nouveau_state.c
@@ -335,6 +335,7 @@ static int nouveau_init_engine_ptrs(struct drm_device *dev)
 		engine->display.destroy		= nv50_display_destroy;
 		engine->display.init		= nv50_display_init;
 		engine->display.fini		= nv50_display_fini;
+		engine->display.reserve_fbs	= nv50_display_reserve_fbs;
 		engine->gpio.init		= nv50_gpio_init;
 		engine->gpio.fini		= nv50_gpio_fini;
 		engine->gpio.drive		= nv50_gpio_drive;
@@ -409,6 +410,7 @@ static int nouveau_init_engine_ptrs(struct drm_device *dev)
 		engine->display.destroy		= nv50_display_destroy;
 		engine->display.init		= nv50_display_init;
 		engine->display.fini		= nv50_display_fini;
+		engine->display.reserve_fbs	= nv50_display_reserve_fbs;
 		engine->gpio.init		= nv50_gpio_init;
 		engine->gpio.fini		= nv50_gpio_fini;
 		engine->gpio.drive		= nv50_gpio_drive;
diff --git a/drivers/gpu/drm/nouveau/nv50_display.c b/drivers/gpu/drm/nouveau/nv50_display.c
index ce440e2..40783bd 100644
--- a/drivers/gpu/drm/nouveau/nv50_display.c
+++ b/drivers/gpu/drm/nouveau/nv50_display.c
@@ -1036,3 +1036,33 @@ nv50_display_isr(struct drm_device *dev)
 		}
 	}
 }
+
+void nv50_display_reserve_fbs(struct drm_device *dev)
+{
+	struct drm_nouveau_private *dev_priv = dev->dev_private;
+	int i, ret;
+	u32 offset, height, pitch;
+
+	for (i = 0; i < 2; i++) {
+		offset = nv_rd32(dev, NV50_PDISPLAY_CRTC_P(i, FB_OFFSET));
+		height = nv_rd32(dev, NV50_PDISPLAY_CRTC_P(i, FB_SIZE)) >> 16;
+		pitch = nv_rd32(dev, NV50_PDISPLAY_CRTC_P(i, FB_PITCH));
+		pitch = (pitch >> 4) * 4;
+
+		if (!height || !pitch)
+			continue;
+
+		ret = nouveau_bo_new(dev, offset, pitch * height, 0,
+				     TTM_PL_FLAG_VRAM, 0, 0,
+				     &dev_priv->old_fb[i]);
+
+		if (ret == 0)
+			ret = nouveau_bo_pin(dev_priv->old_fb[i],
+					     TTM_PL_FLAG_VRAM);
+
+		if (ret) {
+			NV_WARN(dev, "Failed to reserve old fb on CRTC %d\n", i);
+			nouveau_bo_ref(NULL, &dev_priv->old_fb[i]);
+		}
+	}
+}
diff --git a/drivers/gpu/drm/nouveau/nv50_display.h b/drivers/gpu/drm/nouveau/nv50_display.h
index 5d3dd14..1eb13e2 100644
--- a/drivers/gpu/drm/nouveau/nv50_display.h
+++ b/drivers/gpu/drm/nouveau/nv50_display.h
@@ -71,6 +71,7 @@ int nv50_display_create(struct drm_device *dev);
 int nv50_display_init(struct drm_device *dev);
 void nv50_display_fini(struct drm_device *dev);
 void nv50_display_destroy(struct drm_device *dev);
+void nv50_display_reserve_fbs(struct drm_device *dev);
 int nv50_crtc_blank(struct nouveau_crtc *, bool blank);
 int nv50_crtc_set_clock(struct drm_device *, int head, int pclk);
 
-- 
1.7.7.6

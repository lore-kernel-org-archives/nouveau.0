From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: [PATCH] drm/nouveau: fix loading for
 CONFIG_BACKLIGHT_CLASS_DEVICE=n
Date: Sat, 4 Jul 2009 19:53:44 +0300
Message-ID: <20090704195344.36d9416d@daedalus.pq.iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

From 658956848afeff909915f9251c5c68eeafa447e2 Mon Sep 17 00:00:00 2001
From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Date: Sat, 4 Jul 2009 19:39:23 +0300
Subject: [PATCH] drm/nouveau: fix loading for CONFIG_BACKLIGHT_CLASS_DEVICE=n

nouveau.ko was silently and unconditionally depending on
CONFIG_BACKLIGHT_CLASS_DEVICE features, failing to load due to missing
symbols, if the kernel did not have backlight class support.

Fix this by making the build of nouveau_backlight.o conditional on
CONFIG_BACKLIGHT_CLASS_DEVICE, and letting
nouveau_backlight_{init,exit}() compile to nothing if backlight class
support is not enabled.

Signed-off-by: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
---

Not even compile-tested, so sent it for review instead of pushing it.

 drivers/gpu/drm/nouveau/Makefile      |    5 +++--
 drivers/gpu/drm/nouveau/nouveau_drv.h |   13 +++++++++++++
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/Makefile b/drivers/gpu/drm/nouveau/Makefile
index 96688cf..8b9074b 100644
--- a/drivers/gpu/drm/nouveau/Makefile
+++ b/drivers/gpu/drm/nouveau/Makefile
@@ -8,7 +8,7 @@ nouveau-y := nouveau_drv.o nouveau_state.o nouveau_fifo.o nouveau_mem.o \
              nouveau_swmthd.o nouveau_sgdma.o nouveau_dma.o \
              nouveau_bo.o nouveau_fence.o nouveau_gem.o nouveau_ttm.o \
              nouveau_hw.o nouveau_calc.o nouveau_bios.o nouveau_i2c.o \
-	     nouveau_display.o nouveau_fbcon.o nouveau_backlight.o \
+             nouveau_display.o nouveau_fbcon.o \
              nv04_timer.o \
              nv04_mc.o nv40_mc.o nv50_mc.o \
              nv04_fb.o nv10_fb.o nv40_fb.o \
@@ -19,8 +19,9 @@ nouveau-y := nouveau_drv.o nouveau_state.o nouveau_fifo.o nouveau_mem.o \
              nv50_crtc.o nv50_dac.o nv50_sor.o nv50_connector.o \
              nv50_cursor.o nv50_display.o nv50_fbcon.o \
              nv04_display.o nv04_output.o nv04_crtc.o nv04_cursor.o \
-	     nv04_fbcon.o
+             nv04_fbcon.o
 
 nouveau-$(CONFIG_COMPAT) += nouveau_ioc32.o
+nouveau-$(CONFIG_BACKLIGHT_CLASS_DEVICE) += nouveau_backlight.o
 
 obj-$(CONFIG_DRM_NOUVEAU)+= nouveau.o
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index b751d3d..88abcac 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -682,8 +682,21 @@ extern int  nouveau_dma_init(struct nouveau_channel *);
 extern int  nouveau_dma_wait(struct nouveau_channel *, int size);
 
 /* nouveau_backlight.c */
+#ifdef CONFIG_BACKLIGHT_CLASS_DEVICE
 extern int nouveau_backlight_init(struct drm_device *);
 extern void nouveau_backlight_exit(struct drm_device *);
+#else
+static inline int nouveau_backlight_init(struct drm_device *dev)
+{
+	(void)dev;
+	return 0;
+}
+
+static inline void nouveau_backlight_exit(struct drm_device *dev);
+{
+	(void)dev;
+}
+#endif
 
 /* nouveau_bios.c */
 extern int nouveau_parse_bios(struct drm_device *);
-- 
1.6.3.3

From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] nouveau: get rid of winsys object
Date: Fri, 2 Dec 2011 23:08:50 +0100
Message-ID: <20111202220850.GE3302@joi.lan>
References: <20111202184659.GA3302@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20111202184659.GA3302-OI9uyE9O0yo@public.gmane.org>
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
List-Id: nouveau.vger.kernel.org

Its only purpose was to destroy itself.
---
 src/gallium/drivers/nouveau/Android.mk             |    4 ++-
 src/gallium/drivers/nouveau/Makefile               |    3 ++
 src/gallium/drivers/nouveau/nouveau_screen.c       |    7 ++--
 src/gallium/drivers/nouveau/nouveau_winsys.h       |    6 ++--
 src/gallium/drivers/nv50/nv50_context.c            |    2 -
 src/gallium/drivers/nv50/nv50_screen.c             |    3 +-
 src/gallium/drivers/nv50/nv50_screen.h             |    1 -
 src/gallium/drivers/nvc0/nvc0_context.c            |    2 -
 src/gallium/drivers/nvc0/nvc0_screen.c             |    3 +-
 src/gallium/drivers/nvc0/nvc0_screen.h             |    1 -
 src/gallium/drivers/nvfx/nvfx_context.c            |    5 ---
 src/gallium/drivers/nvfx/nvfx_context.h            |    1 -
 src/gallium/drivers/nvfx/nvfx_screen.c             |    3 +-
 src/gallium/drivers/nvfx/nvfx_screen.h             |    1 -
 src/gallium/winsys/nouveau/drm/nouveau_dri.h       |   28 -----------------
 .../winsys/nouveau/drm/nouveau_drm_winsys.c        |   32 +------------------
 .../winsys/nouveau/drm/nouveau_drm_winsys.h        |   28 -----------------
 17 files changed, 17 insertions(+), 113 deletions(-)
 delete mode 100644 src/gallium/winsys/nouveau/drm/nouveau_dri.h
 delete mode 100644 src/gallium/winsys/nouveau/drm/nouveau_drm_winsys.h

diff --git a/src/gallium/drivers/nouveau/Android.mk b/src/gallium/drivers/nouveau/Android.mk
index 1094497..782b7ce 100644
--- a/src/gallium/drivers/nouveau/Android.mk
+++ b/src/gallium/drivers/nouveau/Android.mk
@@ -29,7 +29,9 @@ include $(LOCAL_PATH)/Makefile.sources
 include $(CLEAR_VARS)
 
 LOCAL_SRC_FILES := $(C_SOURCES)
-LOCAL_C_INCLUDES := $(DRM_TOP)
+LOCAL_C_INCLUDES := $(DRM_TOP) \
+	$(DRM_TOP)/include/drm \
+	$(DRM_TOP)/nouveau
 
 LOCAL_MODULE := libmesa_pipe_nouveau
 
diff --git a/src/gallium/drivers/nouveau/Makefile b/src/gallium/drivers/nouveau/Makefile
index eb35c1f..d583324 100644
--- a/src/gallium/drivers/nouveau/Makefile
+++ b/src/gallium/drivers/nouveau/Makefile
@@ -7,6 +7,9 @@ LIBRARY_INCLUDES = \
 	$(LIBDRM_CFLAGS) \
 	-I$(TOP)/src/gallium/drivers/nouveau/include
 
+LIBRARY_INCLUDES += $(shell $(PKG_CONFIG) libdrm libdrm_nouveau --cflags-only-I)
+LIBRARY_DEFINES += $(shell $(PKG_CONFIG) libdrm libdrm_nouveau --cflags-only-other)
+
 # get C_SOURCES
 include Makefile.sources
 
diff --git a/src/gallium/drivers/nouveau/nouveau_screen.c b/src/gallium/drivers/nouveau/nouveau_screen.c
index cdc2bff..99546a2 100644
--- a/src/gallium/drivers/nouveau/nouveau_screen.c
+++ b/src/gallium/drivers/nouveau/nouveau_screen.c
@@ -22,6 +22,8 @@
 #include "state_tracker/drm_driver.h"
 #include "util/u_simple_screen.h"
 
+#include "nouveau_drmif.h"
+
 int nouveau_mesa_debug = 0;
 
 static const char *
@@ -234,14 +236,11 @@ nouveau_screen_init(struct nouveau_screen *screen, struct nouveau_device *dev)
 void
 nouveau_screen_fini(struct nouveau_screen *screen)
 {
-	struct pipe_winsys *ws = screen->base.winsys;
-
 	nouveau_mm_destroy(screen->mm_GART);
 	nouveau_mm_destroy(screen->mm_VRAM);
 
 	nouveau_channel_free(&screen->channel);
 
-	if (ws)
-		ws->destroy(ws);
+	nouveau_device_close(&screen->device);
 }
 
diff --git a/src/gallium/drivers/nouveau/nouveau_winsys.h b/src/gallium/drivers/nouveau/nouveau_winsys.h
index 524e636..1abfa79 100644
--- a/src/gallium/drivers/nouveau/nouveau_winsys.h
+++ b/src/gallium/drivers/nouveau/nouveau_winsys.h
@@ -42,12 +42,12 @@ nouveau_screen_transfer_flags(unsigned pipe)
 }
 
 extern struct pipe_screen *
-nvfx_screen_create(struct pipe_winsys *ws, struct nouveau_device *);
+nvfx_screen_create(struct nouveau_device *);
 
 extern struct pipe_screen *
-nv50_screen_create(struct pipe_winsys *ws, struct nouveau_device *);
+nv50_screen_create(struct nouveau_device *);
 
 extern struct pipe_screen *
-nvc0_screen_create(struct pipe_winsys *ws, struct nouveau_device *);
+nvc0_screen_create(struct nouveau_device *);
 
 #endif
diff --git a/src/gallium/drivers/nv50/nv50_context.c b/src/gallium/drivers/nv50/nv50_context.c
index a48b864..3b0f8f0 100644
--- a/src/gallium/drivers/nv50/nv50_context.c
+++ b/src/gallium/drivers/nv50/nv50_context.c
@@ -109,7 +109,6 @@ nv50_destroy(struct pipe_context *pipe)
 struct pipe_context *
 nv50_create(struct pipe_screen *pscreen, void *priv)
 {
-   struct pipe_winsys *pipe_winsys = pscreen->winsys;
    struct nv50_screen *screen = nv50_screen(pscreen);
    struct nv50_context *nv50;
    struct pipe_context *pipe;
@@ -124,7 +123,6 @@ nv50_create(struct pipe_screen *pscreen, void *priv)
    nv50->base.copy_data = nv50_m2mf_copy_linear;
    nv50->base.push_data = nv50_sifc_linear_u8;
 
-   pipe->winsys = pipe_winsys;
    pipe->screen = pscreen;
    pipe->priv = priv;
 
diff --git a/src/gallium/drivers/nv50/nv50_screen.c b/src/gallium/drivers/nv50/nv50_screen.c
index 3cd5fdf..f1dec35 100644
--- a/src/gallium/drivers/nv50/nv50_screen.c
+++ b/src/gallium/drivers/nv50/nv50_screen.c
@@ -298,7 +298,7 @@ nv50_screen_fence_update(struct pipe_screen *pscreen)
    } while(0)
 
 struct pipe_screen *
-nv50_screen_create(struct pipe_winsys *ws, struct nouveau_device *dev)
+nv50_screen_create(struct nouveau_device *dev)
 {
    struct nv50_screen *screen;
    struct nouveau_channel *chan;
@@ -323,7 +323,6 @@ nv50_screen_create(struct pipe_winsys *ws, struct nouveau_device *dev)
    chan = screen->base.channel;
    chan->user_private = screen;
 
-   pscreen->winsys = ws;
    pscreen->destroy = nv50_screen_destroy;
    pscreen->context_create = nv50_create;
    pscreen->is_format_supported = nv50_screen_is_format_supported;
diff --git a/src/gallium/drivers/nv50/nv50_screen.h b/src/gallium/drivers/nv50/nv50_screen.h
index 315ca80..cb7e956 100644
--- a/src/gallium/drivers/nv50/nv50_screen.h
+++ b/src/gallium/drivers/nv50/nv50_screen.h
@@ -25,7 +25,6 @@ struct nv50_blitctx;
 
 struct nv50_screen {
    struct nouveau_screen base;
-   struct nouveau_winsys *nvws;
 
    struct nv50_context *cur_ctx;
 
diff --git a/src/gallium/drivers/nvc0/nvc0_context.c b/src/gallium/drivers/nvc0/nvc0_context.c
index 2927a09..1bb90a3 100644
--- a/src/gallium/drivers/nvc0/nvc0_context.c
+++ b/src/gallium/drivers/nvc0/nvc0_context.c
@@ -110,7 +110,6 @@ nvc0_default_flush_notify(struct nouveau_channel *chan)
 struct pipe_context *
 nvc0_create(struct pipe_screen *pscreen, void *priv)
 {
-   struct pipe_winsys *pipe_winsys = pscreen->winsys;
    struct nvc0_screen *screen = nvc0_screen(pscreen);
    struct nvc0_context *nvc0;
    struct pipe_context *pipe;
@@ -126,7 +125,6 @@ nvc0_create(struct pipe_screen *pscreen, void *priv)
    nvc0->base.push_data = nvc0_m2mf_push_linear;
    nvc0->base.push_cb = nvc0_cb_push;
 
-   pipe->winsys = pipe_winsys;
    pipe->screen = pscreen;
    pipe->priv = priv;
 
diff --git a/src/gallium/drivers/nvc0/nvc0_screen.c b/src/gallium/drivers/nvc0/nvc0_screen.c
index 79c3e36..190737e 100644
--- a/src/gallium/drivers/nvc0/nvc0_screen.c
+++ b/src/gallium/drivers/nvc0/nvc0_screen.c
@@ -367,7 +367,7 @@ nvc0_screen_fence_update(struct pipe_screen *pscreen)
    } while(0)
 
 struct pipe_screen *
-nvc0_screen_create(struct pipe_winsys *ws, struct nouveau_device *dev)
+nvc0_screen_create(struct nouveau_device *dev)
 {
    struct nvc0_screen *screen;
    struct nouveau_channel *chan;
@@ -390,7 +390,6 @@ nvc0_screen_create(struct pipe_winsys *ws, struct nouveau_device *dev)
    chan = screen->base.channel;
    chan->user_private = screen;
 
-   pscreen->winsys = ws;
    pscreen->destroy = nvc0_screen_destroy;
    pscreen->context_create = nvc0_create;
    pscreen->is_format_supported = nvc0_screen_is_format_supported;
diff --git a/src/gallium/drivers/nvc0/nvc0_screen.h b/src/gallium/drivers/nvc0/nvc0_screen.h
index 98a94c6..be42970 100644
--- a/src/gallium/drivers/nvc0/nvc0_screen.h
+++ b/src/gallium/drivers/nvc0/nvc0_screen.h
@@ -23,7 +23,6 @@ struct nvc0_blitctx;
 
 struct nvc0_screen {
    struct nouveau_screen base;
-   struct nouveau_winsys *nvws;
 
    struct nvc0_context *cur_ctx;
 
diff --git a/src/gallium/drivers/nvfx/nvfx_context.c b/src/gallium/drivers/nvfx/nvfx_context.c
index 37425b1..36209cb 100644
--- a/src/gallium/drivers/nvfx/nvfx_context.c
+++ b/src/gallium/drivers/nvfx/nvfx_context.c
@@ -71,18 +71,13 @@ struct pipe_context *
 nvfx_create(struct pipe_screen *pscreen, void *priv)
 {
 	struct nvfx_screen *screen = nvfx_screen(pscreen);
-	struct pipe_winsys *ws = pscreen->winsys;
 	struct nvfx_context *nvfx;
-	struct nouveau_winsys *nvws = screen->nvws;
 
 	nvfx = CALLOC(1, sizeof(struct nvfx_context));
 	if (!nvfx)
 		return NULL;
 	nvfx->screen = screen;
 
-	nvfx->nvws = nvws;
-
-	nvfx->pipe.winsys = ws;
 	nvfx->pipe.screen = pscreen;
 	nvfx->pipe.priv = priv;
 	nvfx->pipe.destroy = nvfx_destroy;
diff --git a/src/gallium/drivers/nvfx/nvfx_context.h b/src/gallium/drivers/nvfx/nvfx_context.h
index 3d05ecc..09d394b 100644
--- a/src/gallium/drivers/nvfx/nvfx_context.h
+++ b/src/gallium/drivers/nvfx/nvfx_context.h
@@ -138,7 +138,6 @@ struct nvfx_render_target {
 struct nvfx_context {
 	struct pipe_context pipe;
 
-	struct nouveau_winsys *nvws;
 	struct nvfx_screen *screen;
 
 	unsigned is_nv4x; /* either 0 or ~0 */
diff --git a/src/gallium/drivers/nvfx/nvfx_screen.c b/src/gallium/drivers/nvfx/nvfx_screen.c
index f56c697..94222b5 100644
--- a/src/gallium/drivers/nvfx/nvfx_screen.c
+++ b/src/gallium/drivers/nvfx/nvfx_screen.c
@@ -460,7 +460,7 @@ static void nvfx_channel_flush_notify(struct nouveau_channel* chan)
 }
 
 struct pipe_screen *
-nvfx_screen_create(struct pipe_winsys *ws, struct nouveau_device *dev)
+nvfx_screen_create(struct nouveau_device *dev)
 {
 	static const unsigned query_sizes[] = {(4096 - 4 * 32) / 32, 3 * 1024 / 32, 2 * 1024 / 32, 1024 / 32};
 	struct nvfx_screen *screen = CALLOC_STRUCT(nvfx_screen);
@@ -484,7 +484,6 @@ nvfx_screen_create(struct pipe_winsys *ws, struct nouveau_device *dev)
 	chan->user_private = screen;
 	chan->flush_notify = nvfx_channel_flush_notify;
 
-	pscreen->winsys = ws;
 	pscreen->destroy = nvfx_screen_destroy;
 	pscreen->get_param = nvfx_screen_get_param;
 	pscreen->get_shader_param = nvfx_screen_get_shader_param;
diff --git a/src/gallium/drivers/nvfx/nvfx_screen.h b/src/gallium/drivers/nvfx/nvfx_screen.h
index 02e7c5d..35c9d91 100644
--- a/src/gallium/drivers/nvfx/nvfx_screen.h
+++ b/src/gallium/drivers/nvfx/nvfx_screen.h
@@ -10,7 +10,6 @@ struct pipe_screen;
 struct nvfx_screen {
 	struct nouveau_screen base;
 
-	struct nouveau_winsys *nvws;
 	struct nouveau_bo *fence;
 
 	struct nvfx_context *cur_ctx;
diff --git a/src/gallium/winsys/nouveau/drm/nouveau_dri.h b/src/gallium/winsys/nouveau/drm/nouveau_dri.h
deleted file mode 100644
index 1207c2d..0000000
--- a/src/gallium/winsys/nouveau/drm/nouveau_dri.h
+++ /dev/null
@@ -1,28 +0,0 @@
-#ifndef _NOUVEAU_DRI_
-#define _NOUVEAU_DRI_
-
-#include "xf86drm.h"
-#include "drm.h"
-#include "nouveau_drm.h"
-
-struct nouveau_dri {
-	uint32_t device_id;	/**< \brief PCI device ID */
-	uint32_t width;		/**< \brief width in pixels of display */
-	uint32_t height;	/**< \brief height in scanlines of display */
-	uint32_t depth;		/**< \brief depth of display (8, 15, 16, 24) */
-	uint32_t bpp;		/**< \brief bit depth of display (8, 16, 24, 32) */
-
-	uint32_t bus_type;	/**< \brief ths bus type */
-	uint32_t bus_mode;	/**< \brief bus mode (used for AGP, maybe also for PCI-E ?) */
-
-	uint32_t front_offset;	/**< \brief front buffer offset */
-	uint32_t front_pitch;	/**< \brief front buffer pitch */
-	uint32_t back_offset;	/**< \brief private back buffer offset */
-	uint32_t back_pitch;	/**< \brief private back buffer pitch */
-	uint32_t depth_offset;	/**< \brief private depth buffer offset */
-	uint32_t depth_pitch;	/**< \brief private depth buffer pitch */
-
-};
-
-#endif
-
diff --git a/src/gallium/winsys/nouveau/drm/nouveau_drm_winsys.c b/src/gallium/winsys/nouveau/drm/nouveau_drm_winsys.c
index 7d7a276..084eda9 100644
--- a/src/gallium/winsys/nouveau/drm/nouveau_drm_winsys.c
+++ b/src/gallium/winsys/nouveau/drm/nouveau_drm_winsys.c
@@ -4,7 +4,6 @@
 #include "util/u_memory.h"
 #include "util/u_inlines.h"
 
-#include "nouveau_drm_winsys.h"
 #include "nouveau_drm_public.h"
 
 #include "nouveau_drmif.h"
@@ -14,24 +13,11 @@
 #include "nouveau/nouveau_winsys.h"
 #include "nouveau/nouveau_screen.h"
 
-static void
-nouveau_drm_destroy_winsys(struct pipe_winsys *s)
-{
-	struct nouveau_winsys *nv_winsys = nouveau_winsys(s);
-	struct nouveau_screen *nv_screen= nouveau_screen(nv_winsys->pscreen);
-	if (nv_screen)
-		nouveau_device_close(&nv_screen->device);
-	FREE(nv_winsys);
-}
-
 struct pipe_screen *
 nouveau_drm_screen_create(int fd)
 {
-	struct nouveau_winsys *nvws;
-	struct pipe_winsys *ws;
 	struct nouveau_device *dev = NULL;
-	struct pipe_screen *(*init)(struct pipe_winsys *,
-				    struct nouveau_device *);
+	struct pipe_screen *(*init)(struct nouveau_device *);
 	int ret;
 
 	ret = nouveau_device_open_existing(&dev, 0, fd, 0);
@@ -60,19 +46,5 @@ nouveau_drm_screen_create(int fd)
 		return NULL;
 	}
 
-	nvws = CALLOC_STRUCT(nouveau_winsys);
-	if (!nvws) {
-		nouveau_device_close(&dev);
-		return NULL;
-	}
-	ws = &nvws->base;
-	ws->destroy = nouveau_drm_destroy_winsys;
-
-	nvws->pscreen = init(ws, dev);
-	if (!nvws->pscreen) {
-		ws->destroy(ws);
-		return NULL;
-	}
-
-	return nvws->pscreen;
+	return init(dev);
 }
diff --git a/src/gallium/winsys/nouveau/drm/nouveau_drm_winsys.h b/src/gallium/winsys/nouveau/drm/nouveau_drm_winsys.h
deleted file mode 100644
index 9e529ec..0000000
--- a/src/gallium/winsys/nouveau/drm/nouveau_drm_winsys.h
+++ /dev/null
@@ -1,28 +0,0 @@
-#ifndef __NOUVEAU_DRM_WINSYS_H__
-#define __NOUVEAU_DRM_WINSYS_H__
-
-#include "util/u_simple_screen.h"
-
-#include "nouveau_dri.h"
-
-struct nouveau_winsys {
-	struct pipe_winsys base;
-
-	struct pipe_screen *pscreen;
-
-	struct pipe_surface *front;
-};
-
-static INLINE struct nouveau_winsys *
-nouveau_winsys(struct pipe_winsys *ws)
-{
-	return (struct nouveau_winsys *)ws;
-}
-
-static INLINE struct nouveau_winsys *
-nouveau_winsys_screen(struct pipe_screen *pscreen)
-{
-	return nouveau_winsys(pscreen->winsys);
-}
-
-#endif
-- 
1.7.8.rc3

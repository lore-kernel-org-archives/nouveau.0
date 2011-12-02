From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [mesa PATCH] nouveau: fix double free when
	nvXX_screen_create fails
Date: Fri, 2 Dec 2011 19:46:59 +0100
Message-ID: <20111202184659.GA3302@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
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

When nvXX_screen_create fails, it destroys winsys object,
so nouveau_drm_screen_create should not try to destroy it again.

Note: This is a candidate for the 7.11 branch.
---
 src/gallium/drivers/nv50/nv50_screen.c             |    7 +++++--
 src/gallium/drivers/nvc0/nvc0_screen.c             |    7 +++++--
 src/gallium/drivers/nvfx/nvfx_screen.c             |    6 ++++--
 .../winsys/nouveau/drm/nouveau_drm_winsys.c        |   10 ++++++----
 4 files changed, 20 insertions(+), 10 deletions(-)

diff --git a/src/gallium/drivers/nv50/nv50_screen.c b/src/gallium/drivers/nv50/nv50_screen.c
index 3cd5fdf..156054b 100644
--- a/src/gallium/drivers/nv50/nv50_screen.c
+++ b/src/gallium/drivers/nv50/nv50_screen.c
@@ -22,6 +22,7 @@
 
 #include "util/u_format.h"
 #include "util/u_format_s3tc.h"
+#include "util/u_simple_screen.h"
 #include "pipe/p_screen.h"
 
 #include "nv50_context.h"
@@ -310,9 +311,12 @@ nv50_screen_create(struct pipe_winsys *ws, struct nouveau_device *dev)
    unsigned i, base;
 
    screen = CALLOC_STRUCT(nv50_screen);
-   if (!screen)
+   if (!screen) {
+      ws->destroy(ws);
       return NULL;
+   }
    pscreen = &screen->base.base;
+   pscreen->winsys = ws;
 
    screen->base.sysmem_bindings = PIPE_BIND_CONSTANT_BUFFER;
 
@@ -323,7 +327,6 @@ nv50_screen_create(struct pipe_winsys *ws, struct nouveau_device *dev)
    chan = screen->base.channel;
    chan->user_private = screen;
 
-   pscreen->winsys = ws;
    pscreen->destroy = nv50_screen_destroy;
    pscreen->context_create = nv50_create;
    pscreen->is_format_supported = nv50_screen_is_format_supported;
diff --git a/src/gallium/drivers/nvc0/nvc0_screen.c b/src/gallium/drivers/nvc0/nvc0_screen.c
index 79c3e36..9268a7a 100644
--- a/src/gallium/drivers/nvc0/nvc0_screen.c
+++ b/src/gallium/drivers/nvc0/nvc0_screen.c
@@ -22,6 +22,7 @@
 
 #include "util/u_format.h"
 #include "util/u_format_s3tc.h"
+#include "util/u_simple_screen.h"
 #include "pipe/p_screen.h"
 
 #include "vl/vl_decoder.h"
@@ -376,9 +377,12 @@ nvc0_screen_create(struct pipe_winsys *ws, struct nouveau_device *dev)
    unsigned i;
 
    screen = CALLOC_STRUCT(nvc0_screen);
-   if (!screen)
+   if (!screen) {
+      ws->destroy(ws);
       return NULL;
+   }
    pscreen = &screen->base.base;
+   pscreen->winsys = ws;
 
    screen->base.sysmem_bindings = PIPE_BIND_CONSTANT_BUFFER;
 
@@ -390,7 +394,6 @@ nvc0_screen_create(struct pipe_winsys *ws, struct nouveau_device *dev)
    chan = screen->base.channel;
    chan->user_private = screen;
 
-   pscreen->winsys = ws;
    pscreen->destroy = nvc0_screen_destroy;
    pscreen->context_create = nvc0_create;
    pscreen->is_format_supported = nvc0_screen_is_format_supported;
diff --git a/src/gallium/drivers/nvfx/nvfx_screen.c b/src/gallium/drivers/nvfx/nvfx_screen.c
index f56c697..4085ec7 100644
--- a/src/gallium/drivers/nvfx/nvfx_screen.c
+++ b/src/gallium/drivers/nvfx/nvfx_screen.c
@@ -469,10 +469,13 @@ nvfx_screen_create(struct pipe_winsys *ws, struct nouveau_device *dev)
 	unsigned eng3d_class = 0;
 	int ret, i;
 
-	if (!screen)
+	if (!screen) {
+		ws->destroy(ws);
 		return NULL;
+	}
 
 	pscreen = &screen->base.base;
+	pscreen->winsys = ws;
 
 	ret = nouveau_screen_init(&screen->base, dev);
 	if (ret) {
@@ -484,7 +487,6 @@ nvfx_screen_create(struct pipe_winsys *ws, struct nouveau_device *dev)
 	chan->user_private = screen;
 	chan->flush_notify = nvfx_channel_flush_notify;
 
-	pscreen->winsys = ws;
 	pscreen->destroy = nvfx_screen_destroy;
 	pscreen->get_param = nvfx_screen_get_param;
 	pscreen->get_shader_param = nvfx_screen_get_shader_param;
diff --git a/src/gallium/winsys/nouveau/drm/nouveau_drm_winsys.c b/src/gallium/winsys/nouveau/drm/nouveau_drm_winsys.c
index 7d7a276..d7a6bf7 100644
--- a/src/gallium/winsys/nouveau/drm/nouveau_drm_winsys.c
+++ b/src/gallium/winsys/nouveau/drm/nouveau_drm_winsys.c
@@ -30,6 +30,7 @@ nouveau_drm_screen_create(int fd)
 	struct nouveau_winsys *nvws;
 	struct pipe_winsys *ws;
 	struct nouveau_device *dev = NULL;
+	struct pipe_screen *screen;
 	struct pipe_screen *(*init)(struct pipe_winsys *,
 				    struct nouveau_device *);
 	int ret;
@@ -68,11 +69,12 @@ nouveau_drm_screen_create(int fd)
 	ws = &nvws->base;
 	ws->destroy = nouveau_drm_destroy_winsys;
 
-	nvws->pscreen = init(ws, dev);
-	if (!nvws->pscreen) {
-		ws->destroy(ws);
+	screen = init(ws, dev);
+	if (!screen)
+		/* winsys was destroyed by init */
 		return NULL;
-	}
+
+	nvws->pscreen = screen;
 
 	return nvws->pscreen;
 }
-- 
1.7.8.rc3

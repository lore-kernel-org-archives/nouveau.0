From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [mesa PATCH] nouveau: fix winsys object leak
Date: Sun, 17 Jan 2010 23:50:50 +0100
Message-ID: <20100117225050.GE14113@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


---
 src/gallium/drivers/nouveau/nouveau_screen.c       |    2 ++
 .../winsys/drm/nouveau/drm/nouveau_drm_api.c       |    9 +++++++++
 2 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/src/gallium/drivers/nouveau/nouveau_screen.c b/src/gallium/drivers/nouveau/nouveau_screen.c
index 7ebc94e..1ad539d 100644
--- a/src/gallium/drivers/nouveau/nouveau_screen.c
+++ b/src/gallium/drivers/nouveau/nouveau_screen.c
@@ -260,6 +260,8 @@ nouveau_screen_init(struct nouveau_screen *screen, struct nouveau_device *dev)
 void
 nouveau_screen_fini(struct nouveau_screen *screen)
 {
+	struct pipe_winsys *ws = screen->base.winsys;
 	nouveau_channel_free(&screen->channel);
+	ws->destroy(ws);
 }
 
diff --git a/src/gallium/winsys/drm/nouveau/drm/nouveau_drm_api.c b/src/gallium/winsys/drm/nouveau/drm/nouveau_drm_api.c
index 4b2c6a1..39b985c 100644
--- a/src/gallium/winsys/drm/nouveau/drm/nouveau_drm_api.c
+++ b/src/gallium/winsys/drm/nouveau/drm/nouveau_drm_api.c
@@ -54,6 +54,14 @@ static struct dri1_api nouveau_dri1_api = {
 	nouveau_dri1_front_surface,
 };
 
+static void
+nouveau_drm_destroy_winsys(struct pipe_winsys *s)
+{
+	struct nouveau_winsys *nv_winsys = nouveau_winsys(s);
+	FREE(nv_winsys->pctx);
+	FREE(nv_winsys);
+}
+
 static struct pipe_screen *
 nouveau_drm_create_screen(struct drm_api *api, int fd,
 			  struct drm_create_screen_arg *arg)
@@ -105,6 +113,7 @@ nouveau_drm_create_screen(struct drm_api *api, int fd,
 		return NULL;
 	}
 	ws = &nvws->base;
+	ws->destroy = nouveau_drm_destroy_winsys;
 
 	nvws->pscreen = init(ws, dev);
 	if (!nvws->pscreen) {
-- 
1.6.6

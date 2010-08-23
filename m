From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [mesa PATCH] nouveau: handle early initialization errors
Date: Mon, 23 Aug 2010 22:40:58 +0200
Message-ID: <20100823204058.GA8160@joi.lan>
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

handle very early errors in pipe_screen creation (failure of
nouveau_screen_init in nv50_screen_create)
---
 src/gallium/drivers/nouveau/nouveau_screen.c       |    3 ++-
 .../winsys/nouveau/drm/nouveau_drm_winsys.c        |    3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/src/gallium/drivers/nouveau/nouveau_screen.c b/src/gallium/drivers/nouveau/nouveau_screen.c
index 513e5e0..ebb21a6 100644
--- a/src/gallium/drivers/nouveau/nouveau_screen.c
+++ b/src/gallium/drivers/nouveau/nouveau_screen.c
@@ -258,6 +258,7 @@ nouveau_screen_fini(struct nouveau_screen *screen)
 {
 	struct pipe_winsys *ws = screen->base.winsys;
 	nouveau_channel_free(&screen->channel);
-	ws->destroy(ws);
+	if (ws)
+		ws->destroy(ws);
 }
 
diff --git a/src/gallium/winsys/nouveau/drm/nouveau_drm_winsys.c b/src/gallium/winsys/nouveau/drm/nouveau_drm_winsys.c
index 660dbd0..d4bf124 100644
--- a/src/gallium/winsys/nouveau/drm/nouveau_drm_winsys.c
+++ b/src/gallium/winsys/nouveau/drm/nouveau_drm_winsys.c
@@ -19,7 +19,8 @@ nouveau_drm_destroy_winsys(struct pipe_winsys *s)
 {
 	struct nouveau_winsys *nv_winsys = nouveau_winsys(s);
 	struct nouveau_screen *nv_screen= nouveau_screen(nv_winsys->pscreen);
-	nouveau_device_close(&nv_screen->device);
+	if (nv_screen)
+		nouveau_device_close(&nv_screen->device);
 	FREE(nv_winsys);
 }
 
-- 
1.7.1.1

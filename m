From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [mesa PATCH] nouveau/winsys: be nice and close the device
 on destroy
Date: Sun, 17 Jan 2010 23:51:22 +0100
Message-ID: <20100117225122.GF14113@joi.lan>
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
this patch depends on "nouveau: fix winsys object leak"
---
 .../winsys/drm/nouveau/drm/nouveau_drm_api.c       |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/src/gallium/winsys/drm/nouveau/drm/nouveau_drm_api.c b/src/gallium/winsys/drm/nouveau/drm/nouveau_drm_api.c
index 39b985c..868d1ca 100644
--- a/src/gallium/winsys/drm/nouveau/drm/nouveau_drm_api.c
+++ b/src/gallium/winsys/drm/nouveau/drm/nouveau_drm_api.c
@@ -58,6 +58,8 @@ static void
 nouveau_drm_destroy_winsys(struct pipe_winsys *s)
 {
 	struct nouveau_winsys *nv_winsys = nouveau_winsys(s);
+	struct nouveau_screen *nv_screen= nouveau_screen(nv_winsys->pscreen);
+	nouveau_device_close(&nv_screen->device);
 	FREE(nv_winsys->pctx);
 	FREE(nv_winsys);
 }
-- 
1.6.6

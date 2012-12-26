From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] drm/nv17-50: restore fence buffer on resume
Date: Wed, 26 Dec 2012 20:57:56 +0100
Message-ID: <20121226195756.GA3156@joi.lan>
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

Since commit 5e120f6e4b3f35b741c5445dfc755f50128c3c44 "drm/nouveau/fence:
convert to exec engine, and improve channel sync" nouveau fence sync
implementation for nv17-50 and nvc0+ started to rely on state of fence buffer
left by previous sync operation. But as pinned bo's (where fence state is
stored) are not saved+restored across suspend/resume, we need to do it
manually.

nvc0+ was fixed by commit d6ba6d215a538a58f0f0026f0961b0b9125e8042
"drm/nvc0/fence: restore pre-suspend fence buffer context on resume".

Fixes: https://bugs.freedesktop.org/show_bug.cgi?id=50121

Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
---
 drivers/gpu/drm/nouveau/nouveau_fence.h | 1 +
 drivers/gpu/drm/nouveau/nv10_fence.c    | 9 +++++++++
 drivers/gpu/drm/nouveau/nv50_fence.c    | 2 ++
 3 files changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.h b/drivers/gpu/drm/nouveau/nouveau_fence.h
index bedafd1..cdb83ac 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.h
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.h
@@ -60,6 +60,7 @@ u32  nv10_fence_read(struct nouveau_channel *);
 void nv10_fence_context_del(struct nouveau_channel *);
 void nv10_fence_destroy(struct nouveau_drm *);
 int  nv10_fence_create(struct nouveau_drm *);
+void nv17_fence_resume(struct nouveau_drm *drm);
 
 int nv50_fence_create(struct nouveau_drm *);
 int nv84_fence_create(struct nouveau_drm *);
diff --git a/drivers/gpu/drm/nouveau/nv10_fence.c b/drivers/gpu/drm/nouveau/nv10_fence.c
index 7ae7f97..0619c02 100644
--- a/drivers/gpu/drm/nouveau/nv10_fence.c
+++ b/drivers/gpu/drm/nouveau/nv10_fence.c
@@ -162,6 +162,13 @@ nv10_fence_destroy(struct nouveau_drm *drm)
 	kfree(priv);
 }
 
+void nv17_fence_resume(struct nouveau_drm *drm)
+{
+	struct nv10_fence_priv *priv = drm->fence;
+
+	nouveau_bo_wr32(priv->bo, 0, priv->sequence);
+}
+
 int
 nv10_fence_create(struct nouveau_drm *drm)
 {
@@ -197,6 +204,8 @@ nv10_fence_create(struct nouveau_drm *drm)
 		if (ret == 0) {
 			nouveau_bo_wr32(priv->bo, 0x000, 0x00000000);
 			priv->base.sync = nv17_fence_sync;
+
+			priv->base.resume = nv17_fence_resume;
 		}
 	}
 
diff --git a/drivers/gpu/drm/nouveau/nv50_fence.c b/drivers/gpu/drm/nouveau/nv50_fence.c
index c20f272..4cc0ce6 100644
--- a/drivers/gpu/drm/nouveau/nv50_fence.c
+++ b/drivers/gpu/drm/nouveau/nv50_fence.c
@@ -122,6 +122,8 @@ nv50_fence_create(struct nouveau_drm *drm)
 	if (ret == 0) {
 		nouveau_bo_wr32(priv->bo, 0x000, 0x00000000);
 		priv->base.sync = nv17_fence_sync;
+
+		priv->base.resume = nv17_fence_resume;
 	}
 
 	if (ret)
-- 
1.8.0.2

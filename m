From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] nouveau: fix channel closing
Date: Tue, 1 May 2012 23:24:45 +0200
Message-ID: <20120501212445.GA6212@joi.lan>
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

Restore code lost in libdrm_nouveau rewrite.
---
 nouveau/nouveau.c |   17 ++++++++++++-----
 1 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/nouveau/nouveau.c b/nouveau/nouveau.c
index f0bc2c3..5aa4107 100644
--- a/nouveau/nouveau.c
+++ b/nouveau/nouveau.c
@@ -278,15 +278,22 @@ nouveau_object_new(struct nouveau_object *parent, uint64_t handle,
 void
 nouveau_object_del(struct nouveau_object **pobj)
 {
-	struct drm_nouveau_gpuobj_free req;
 	struct nouveau_object *obj = *pobj;
 	struct nouveau_device *dev;
 	if (obj) {
 		dev = nouveau_object_find(obj, NOUVEAU_DEVICE_CLASS);
-		req.channel = obj->parent->handle;
-		req.handle  = obj->handle;
-		drmCommandWrite(dev->fd, DRM_NOUVEAU_GPUOBJ_FREE,
-				&req, sizeof(req));
+		if (obj->oclass == NOUVEAU_FIFO_CHANNEL_CLASS) {
+			struct drm_nouveau_channel_free req;
+			req.channel = obj->handle;
+			drmCommandWrite(dev->fd, DRM_NOUVEAU_CHANNEL_FREE,
+					&req, sizeof(req));
+		} else {
+			struct drm_nouveau_gpuobj_free req;
+			req.channel = obj->parent->handle;
+			req.handle  = obj->handle;
+			drmCommandWrite(dev->fd, DRM_NOUVEAU_GPUOBJ_FREE,
+					&req, sizeof(req));
+		}
 	}
 	free(obj);
 	*pobj = NULL;
-- 
1.7.8.5

From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] drm/nouveau: add locking around instobj list
	operations
Date: Sun, 2 Dec 2012 14:53:01 +0100
Message-ID: <20121202135301.GA3094@joi.lan>
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

Fixes memory corruptions (unrelated to nouveau!), oopses, gpu lockups and
xserver crashes when multiple gpuobjs are simultaneously created / destroyed.

Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
Piglit, with concurrency enabled, can finally finish without crashes or lockups
(most of the time :).

---
 drivers/gpu/drm/nouveau/core/subdev/instmem/base.c | 35 +++++++++++++++++-----
 1 file changed, 27 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/core/subdev/instmem/base.c b/drivers/gpu/drm/nouveau/core/subdev/instmem/base.c
index 1188227..6565f3d 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/instmem/base.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/instmem/base.c
@@ -40,15 +40,21 @@ nouveau_instobj_create_(struct nouveau_object *parent,
 	if (ret)
 		return ret;
 
+	mutex_lock(&imem->base.mutex);
 	list_add(&iobj->head, &imem->list);
+	mutex_unlock(&imem->base.mutex);
 	return 0;
 }
 
 void
 nouveau_instobj_destroy(struct nouveau_instobj *iobj)
 {
-	if (iobj->head.prev)
-		list_del(&iobj->head);
+	struct nouveau_subdev *subdev = nv_subdev(iobj->base.engine);
+
+	mutex_lock(&subdev->mutex);
+	list_del(&iobj->head);
+	mutex_unlock(&subdev->mutex);
+
 	return nouveau_object_destroy(&iobj->base);
 }
 
@@ -88,6 +94,8 @@ nouveau_instmem_init(struct nouveau_instmem *imem)
 	if (ret)
 		return ret;
 
+	mutex_lock(&imem->base.mutex);
+
 	list_for_each_entry(iobj, &imem->list, head) {
 		if (iobj->suspend) {
 			for (i = 0; i < iobj->size; i += 4)
@@ -97,6 +105,8 @@ nouveau_instmem_init(struct nouveau_instmem *imem)
 		}
 	}
 
+	mutex_unlock(&imem->base.mutex);
+
 	return 0;
 }
 
@@ -104,17 +114,26 @@ int
 nouveau_instmem_fini(struct nouveau_instmem *imem, bool suspend)
 {
 	struct nouveau_instobj *iobj;
-	int i;
+	int i, ret = 0;
 
 	if (suspend) {
+		mutex_lock(&imem->base.mutex);
+
 		list_for_each_entry(iobj, &imem->list, head) {
 			iobj->suspend = vmalloc(iobj->size);
-			if (iobj->suspend) {
-				for (i = 0; i < iobj->size; i += 4)
-					iobj->suspend[i / 4] = nv_ro32(iobj, i);
-			} else
-				return -ENOMEM;
+			if (!iobj->suspend) {
+				ret = -ENOMEM;
+				break;
+			}
+
+			for (i = 0; i < iobj->size; i += 4)
+				iobj->suspend[i / 4] = nv_ro32(iobj, i);
 		}
+
+		mutex_unlock(&imem->base.mutex);
+
+		if (ret)
+			return ret;
 	}
 
 	return nouveau_subdev_fini(&imem->base, suspend);
-- 
1.7.12

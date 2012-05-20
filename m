From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 05/14] drm/nouveau/gpuobj: Do not handle
	gpuobj_init during fail path in gpuobj_fini
Date: Mon, 21 May 2012 00:14:54 +0100
Message-ID: <1337555703-18925-6-git-send-email-emil.l.velikov@gmail.com>
References: <1337555703-18925-1-git-send-email-emil.l.velikov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1337555703-18925-1-git-send-email-emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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

This approach is already handled by the subdev system. Remove
unneeded variable in the process

Signed-off-by: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_gpuobj.c |   12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_gpuobj.c b/drivers/gpu/drm/nouveau/nouveau_gpuobj.c
index 2eed5c3..43a7cd2 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gpuobj.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gpuobj.c
@@ -757,7 +757,7 @@ nouveau_gpuobj_fini(struct nouveau_device *ndev, int subdev, bool suspend)
 {
 	struct nouveau_gpuobj_priv *priv = nv_subdev(ndev, subdev);
 	struct nouveau_gpuobj *gpuobj;
-	int i, ret = 0;
+	int i;
 
 	if (suspend) {
 		list_for_each_entry(gpuobj, &priv->list, list) {
@@ -766,8 +766,7 @@ nouveau_gpuobj_fini(struct nouveau_device *ndev, int subdev, bool suspend)
 
 			gpuobj->suspend = vmalloc(gpuobj->size);
 			if (!gpuobj->suspend) {
-				ret = -ENOMEM;
-				goto error;
+				return -ENOMEM;
 			}
 
 			for (i = 0; i < gpuobj->size; i += 4)
@@ -775,16 +774,13 @@ nouveau_gpuobj_fini(struct nouveau_device *ndev, int subdev, bool suspend)
 		}
 	}
 
-error:
-	if (ret)
-		priv->base.init(ndev, subdev);
-	return ret;
+	return 0;
 }
 
 static void
 nouveau_gpuobj_destroy(struct nouveau_device *ndev, int subdev)
 {
-	struct nouveau_gpuobj_priv *priv = nv_subdev(ndev, NVDEV_SUBDEV_GPUOBJ);
+	struct nouveau_gpuobj_priv *priv = nv_subdev(ndev, subdev);
 	struct nouveau_gpuobj_method *om, *tm;
 	struct nouveau_gpuobj_class *oc, *tc;
 
-- 
1.7.10.2

From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH 4/5] drm/nv31/mpeg: store chan singleton in engine,
	use it for dispatch
Date: Sat,  7 Sep 2013 21:04:11 -0400
Message-ID: <1378602252-11521-4-git-send-email-imirkin@alum.mit.edu>
References: <1378602252-11521-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1378602252-11521-1-git-send-email-imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

This makes nv31+ able to actually perform the nv_call, since previously
the inst was not available.

Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
---
 drivers/gpu/drm/nouveau/core/engine/mpeg/nv31.c | 27 +++++++++++++++----------
 drivers/gpu/drm/nouveau/core/engine/mpeg/nv31.h |  9 +++++----
 2 files changed, 21 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/core/engine/mpeg/nv31.c b/drivers/gpu/drm/nouveau/core/engine/mpeg/nv31.c
index 2f80b223..9330fc4 100644
--- a/drivers/gpu/drm/nouveau/core/engine/mpeg/nv31.c
+++ b/drivers/gpu/drm/nouveau/core/engine/mpeg/nv31.c
@@ -147,6 +147,8 @@ nv31_mpeg_context_ctor(struct nouveau_object *parent,
 	if (ret)
 		return ret;
 
+	priv->chan = chan;
+
 	return 0;
 }
 
@@ -155,8 +157,11 @@ nv31_mpeg_context_dtor(struct nouveau_object *object)
 {
 	struct nv31_mpeg_priv *priv = (void *)object->engine;
 	struct nv31_mpeg_chan *chan = (void *)object;
-	atomic_dec(&priv->refcount);
+
+	WARN_ON(priv->chan != chan);
+	priv->chan = NULL;
 	nouveau_object_destroy(&chan->base);
+	atomic_dec(&priv->refcount);
 }
 
 struct nouveau_oclass
@@ -189,20 +194,19 @@ void
 nv31_mpeg_intr(struct nouveau_subdev *subdev)
 {
 	struct nouveau_fifo *pfifo = nouveau_fifo(subdev);
-	struct nouveau_engine *engine = nv_engine(subdev);
-	struct nouveau_object *engctx;
 	struct nouveau_handle *handle;
 	struct nv31_mpeg_priv *priv = (void *)subdev;
-	u32 inst = nv_rd32(priv, 0x00b318) & 0x000fffff;
+	struct nouveau_object *engctx = &priv->chan->base;
 	u32 stat = nv_rd32(priv, 0x00b100);
 	u32 type = nv_rd32(priv, 0x00b230);
 	u32 mthd = nv_rd32(priv, 0x00b234);
 	u32 data = nv_rd32(priv, 0x00b238);
 	u32 show = stat;
-	int chid;
+	int chid = pfifo->chid(pfifo, engctx);
 
-	engctx = nouveau_engctx_get(engine, inst);
-	chid   = pfifo->chid(pfifo, engctx);
+	if (engctx)
+		if (nouveau_object_inc(engctx))
+			engctx = NULL;
 
 	if (stat & 0x01000000) {
 		/* happens on initial binding of the object */
@@ -211,7 +215,7 @@ nv31_mpeg_intr(struct nouveau_subdev *subdev)
 			show &= ~0x01000000;
 		}
 
-		if (type == 0x00000010) {
+		if (type == 0x00000010 && engctx) {
 			handle = nouveau_handle_get_class(engctx, 0x3174);
 			if (handle && !nv_call(handle->object, mthd, data))
 				show &= ~0x01000000;
@@ -224,12 +228,13 @@ nv31_mpeg_intr(struct nouveau_subdev *subdev)
 
 	if (show) {
 		nv_error(priv,
-			 "ch %d [0x%08x %s] 0x%08x 0x%08x 0x%08x 0x%08x\n",
-			 chid, inst << 4, nouveau_client_name(engctx), stat,
+			 "ch %d [%s] 0x%08x 0x%08x 0x%08x 0x%08x\n",
+			 chid, nouveau_client_name(engctx), stat,
 			 type, mthd, data);
 	}
 
-	nouveau_engctx_put(engctx);
+	if (engctx)
+		WARN_ON(nouveau_object_dec(engctx, false));
 }
 
 static int
diff --git a/drivers/gpu/drm/nouveau/core/engine/mpeg/nv31.h b/drivers/gpu/drm/nouveau/core/engine/mpeg/nv31.h
index a488c13..62d04e4 100644
--- a/drivers/gpu/drm/nouveau/core/engine/mpeg/nv31.h
+++ b/drivers/gpu/drm/nouveau/core/engine/mpeg/nv31.h
@@ -3,13 +3,14 @@
 
 #include <engine/mpeg.h>
 
+struct nv31_mpeg_chan {
+	struct nouveau_object base;
+};
+
 struct nv31_mpeg_priv {
 	struct nouveau_mpeg base;
 	atomic_t refcount;
-};
-
-struct nv31_mpeg_chan {
-	struct nouveau_object base;
+	struct nv31_mpeg_chan *chan;
 };
 
 #endif
-- 
1.8.1.5

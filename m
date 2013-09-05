From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH 6/7] drm/nv31-nv44/mpeg: inst not available on
	pre-nv44
Date: Thu,  5 Sep 2013 04:45:05 -0400
Message-ID: <1378370706-18599-6-git-send-email-imirkin@alum.mit.edu>
References: <1378370706-18599-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1378370706-18599-1-git-send-email-imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
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

The inst variable (and thus engctx) will not be properly populated for
pre-NV44 cards. The dma setter method didn't need it anyways, so call it
directly instead of the nv_call indirection.

Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
---

An alternative is to move this logic into the nv44 intr handler, but I
don't think that's justified.

 drivers/gpu/drm/nouveau/core/engine/mpeg/nv31.c | 50 ++++++++++++-------------
 1 file changed, 24 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/core/engine/mpeg/nv31.c b/drivers/gpu/drm/nouveau/core/engine/mpeg/nv31.c
index 30dc047..b966728 100644
--- a/drivers/gpu/drm/nouveau/core/engine/mpeg/nv31.c
+++ b/drivers/gpu/drm/nouveau/core/engine/mpeg/nv31.c
@@ -72,11 +72,10 @@ nv31_mpeg_object_ctor(struct nouveau_object *parent,
 }
 
 static int
-nv31_mpeg_mthd_dma(struct nouveau_object *object, u32 mthd, void *arg, u32 len)
+nv31_mpeg_mthd_dma(struct nv31_mpeg_priv *priv, u32 mthd, u32 arg)
 {
-	struct nouveau_instmem *imem = nouveau_instmem(object);
-	struct nv31_mpeg_priv *priv = (void *)object->engine;
-	u32 inst = *(u32 *)arg << 4;
+	struct nouveau_instmem *imem = nouveau_instmem(priv);
+	u32 inst = arg << 4;
 	u32 dma0 = nv_ro32(imem, inst + 0);
 	u32 dma1 = nv_ro32(imem, inst + 4);
 	u32 dma2 = nv_ro32(imem, inst + 8);
@@ -106,13 +105,16 @@ nv31_mpeg_mthd_dma(struct nouveau_object *object, u32 mthd, void *arg, u32 len)
 			nv_mask(priv, 0x00b300, 0x000c0000, mem_target << 2);
 		nv_wr32(priv, 0x00b360, base);
 		nv_wr32(priv, 0x00b364, size);
-	} else {
+	} else
+	if (mthd == 0x01b0) {
 		/* DMA_IMAGE, VRAM only */
 		if (mem_target)
 			return -EINVAL;
 
 		nv_wr32(priv, 0x00b370, base);
 		nv_wr32(priv, 0x00b374, size);
+	} else {
+	  return -EINVAL;
 	}
 
 	return 0;
@@ -128,17 +130,9 @@ nv31_mpeg_ofuncs = {
 	.wr32 = _nouveau_gpuobj_wr32,
 };
 
-static struct nouveau_omthds
-nv31_mpeg_omthds[] = {
-	{ 0x0190, 0x0190, nv31_mpeg_mthd_dma },
-	{ 0x01a0, 0x01a0, nv31_mpeg_mthd_dma },
-	{ 0x01b0, 0x01b0, nv31_mpeg_mthd_dma },
-	{}
-};
-
 struct nouveau_oclass
 nv31_mpeg_sclass[] = {
-	{ 0x3174, &nv31_mpeg_ofuncs, nv31_mpeg_omthds },
+	{ 0x3174, &nv31_mpeg_ofuncs },
 	{}
 };
 
@@ -208,9 +202,8 @@ nv31_mpeg_intr(struct nouveau_subdev *subdev)
 	struct nouveau_fifo *pfifo = nouveau_fifo(subdev);
 	struct nouveau_engine *engine = nv_engine(subdev);
 	struct nouveau_object *engctx;
-	struct nouveau_handle *handle;
 	struct nv31_mpeg_priv *priv = (void *)subdev;
-	u32 inst = nv_rd32(priv, 0x00b318) & 0x000fffff;
+	u32 inst;
 	u32 stat = nv_rd32(priv, 0x00b100);
 	u32 type = nv_rd32(priv, 0x00b230);
 	u32 mthd = nv_rd32(priv, 0x00b234);
@@ -218,9 +211,6 @@ nv31_mpeg_intr(struct nouveau_subdev *subdev)
 	u32 show = stat;
 	int chid;
 
-	engctx = nouveau_engctx_get(engine, inst);
-	chid   = pfifo->chid(pfifo, engctx);
-
 	if (stat & 0x01000000) {
 		/* happens on initial binding of the object */
 		if (type == 0x00000020 && mthd == 0x0000) {
@@ -229,23 +219,31 @@ nv31_mpeg_intr(struct nouveau_subdev *subdev)
 		}
 
 		if (type == 0x00000010) {
-			handle = nouveau_handle_get_class(engctx, 0x3174);
-			if (handle && !nv_call(handle->object, mthd, data))
+			if (!nv31_mpeg_mthd_dma(priv, mthd, data))
 				show &= ~0x01000000;
-			nouveau_handle_put(handle);
 		}
 	}
 
 	nv_wr32(priv, 0x00b100, stat);
 	nv_wr32(priv, 0x00b230, 0x00000001);
 
-	if (show) {
+	if (!show)
+		return;
+
+	if (nv_device(engine)->chipset < 0x44) {
 		nv_error(priv,
-			 "ch %d [0x%08x %s] 0x%08x 0x%08x 0x%08x 0x%08x\n",
-			 chid, inst << 4, nouveau_client_name(engctx), stat,
-			 type, mthd, data);
+			 "0x%08x 0x%08x 0x%08x 0x%08x\n",
+			 stat, type, mthd, data);
+		return;
 	}
 
+	inst = nv_rd32(priv, 0x00b318) & 0x000fffff;
+	engctx = nouveau_engctx_get(engine, inst);
+	chid = pfifo->chid(pfifo, engctx);
+	nv_error(priv,
+		 "ch %d [0x%08x %s] 0x%08x 0x%08x 0x%08x 0x%08x\n",
+		 chid, inst << 4, nouveau_client_name(engctx), stat,
+		 type, mthd, data);
 	nouveau_engctx_put(engctx);
 }
 
-- 
1.8.1.5

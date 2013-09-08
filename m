From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH 5/5] drm/nv31/mpeg: split the nv31 and nv40 dma
	setting implementations
Date: Sat,  7 Sep 2013 21:04:12 -0400
Message-ID: <1378602252-11521-5-git-send-email-imirkin@alum.mit.edu>
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

NV31 has different config bits than NV40+ do. Also fix the DMA_IMAGE
VRAM-only setting to check the right bits.

Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
---

Sadly this doesn't cause things to start working on my NV34 PCI-E, even when I
make the gallium driver use VRAM for the cmd/data bo's (since otherwise they
fail the "linear" check). But I think these changes push things in the right
direction.

 drivers/gpu/drm/nouveau/core/engine/mpeg/nv31.c    |  8 +--
 drivers/gpu/drm/nouveau/core/engine/mpeg/nv40.c    | 59 +++++++++++++++++++++-
 drivers/gpu/drm/nouveau/core/engine/mpeg/nv44.c    |  2 +-
 drivers/gpu/drm/nouveau/core/include/engine/mpeg.h |  2 +
 4 files changed, 65 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/core/engine/mpeg/nv31.c b/drivers/gpu/drm/nouveau/core/engine/mpeg/nv31.c
index 9330fc4..77b6308 100644
--- a/drivers/gpu/drm/nouveau/core/engine/mpeg/nv31.c
+++ b/drivers/gpu/drm/nouveau/core/engine/mpeg/nv31.c
@@ -80,18 +80,18 @@ nv31_mpeg_mthd_dma(struct nouveau_object *object, u32 mthd, void *arg, u32 len)
 
 	if (mthd == 0x0190) {
 		/* DMA_CMD */
-		nv_mask(priv, 0x00b300, 0x00030000, (dma0 & 0x00030000));
+		nv_mask(priv, 0x00b300, 0x00010000, (dma0 & 0x00030000) ? 0x00010000 : 0);
 		nv_wr32(priv, 0x00b334, base);
 		nv_wr32(priv, 0x00b324, size);
 	} else
 	if (mthd == 0x01a0) {
 		/* DMA_DATA */
-		nv_mask(priv, 0x00b300, 0x000c0000, (dma0 & 0x00030000) << 2);
+		nv_mask(priv, 0x00b300, 0x00020000, (dma0 & 0x00030000) ? 0x00020000 : 0);
 		nv_wr32(priv, 0x00b360, base);
 		nv_wr32(priv, 0x00b364, size);
 	} else {
 		/* DMA_IMAGE, VRAM only */
-		if (dma0 & 0x000c0000)
+		if (dma0 & 0x00030000)
 			return -EINVAL;
 
 		nv_wr32(priv, 0x00b370, base);
@@ -101,7 +101,7 @@ nv31_mpeg_mthd_dma(struct nouveau_object *object, u32 mthd, void *arg, u32 len)
 	return 0;
 }
 
-static struct nouveau_ofuncs
+struct nouveau_ofuncs
 nv31_mpeg_ofuncs = {
 	.ctor = nv31_mpeg_object_ctor,
 	.dtor = _nouveau_gpuobj_dtor,
diff --git a/drivers/gpu/drm/nouveau/core/engine/mpeg/nv40.c b/drivers/gpu/drm/nouveau/core/engine/mpeg/nv40.c
index 26f3262..d4e7ec0 100644
--- a/drivers/gpu/drm/nouveau/core/engine/mpeg/nv40.c
+++ b/drivers/gpu/drm/nouveau/core/engine/mpeg/nv40.c
@@ -34,6 +34,63 @@
 #include <engine/mpeg/nv31.h>
 
 /*******************************************************************************
+ * MPEG object classes
+ ******************************************************************************/
+
+static int
+nv40_mpeg_mthd_dma(struct nouveau_object *object, u32 mthd, void *arg, u32 len)
+{
+	struct nouveau_instmem *imem = nouveau_instmem(object);
+	struct nv31_mpeg_priv *priv = (void *)object->engine;
+	u32 inst = *(u32 *)arg << 4;
+	u32 dma0 = nv_ro32(imem, inst + 0);
+	u32 dma1 = nv_ro32(imem, inst + 4);
+	u32 dma2 = nv_ro32(imem, inst + 8);
+	u32 base = (dma2 & 0xfffff000) | (dma0 >> 20);
+	u32 size = dma1 + 1;
+
+	/* only allow linear DMA objects */
+	if (!(dma0 & 0x00002000))
+		return -EINVAL;
+
+	if (mthd == 0x0190) {
+		/* DMA_CMD */
+		nv_mask(priv, 0x00b300, 0x00030000, (dma0 & 0x00030000));
+		nv_wr32(priv, 0x00b334, base);
+		nv_wr32(priv, 0x00b324, size);
+	} else
+	if (mthd == 0x01a0) {
+		/* DMA_DATA */
+		nv_mask(priv, 0x00b300, 0x000c0000, (dma0 & 0x00030000) << 2);
+		nv_wr32(priv, 0x00b360, base);
+		nv_wr32(priv, 0x00b364, size);
+	} else {
+		/* DMA_IMAGE, VRAM only */
+		if (dma0 & 0x00030000)
+			return -EINVAL;
+
+		nv_wr32(priv, 0x00b370, base);
+		nv_wr32(priv, 0x00b374, size);
+	}
+
+	return 0;
+}
+
+static struct nouveau_omthds
+nv40_mpeg_omthds[] = {
+	{ 0x0190, 0x0190, nv40_mpeg_mthd_dma },
+	{ 0x01a0, 0x01a0, nv40_mpeg_mthd_dma },
+	{ 0x01b0, 0x01b0, nv40_mpeg_mthd_dma },
+	{}
+};
+
+struct nouveau_oclass
+nv40_mpeg_sclass[] = {
+	{ 0x3174, &nv31_mpeg_ofuncs, nv40_mpeg_omthds },
+	{}
+};
+
+/*******************************************************************************
  * PMPEG engine/subdev functions
  ******************************************************************************/
 
@@ -68,7 +125,7 @@ nv40_mpeg_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 	nv_subdev(priv)->unit = 0x00000002;
 	nv_subdev(priv)->intr = nv40_mpeg_intr;
 	nv_engine(priv)->cclass = &nv31_mpeg_cclass;
-	nv_engine(priv)->sclass = nv31_mpeg_sclass;
+	nv_engine(priv)->sclass = nv40_mpeg_sclass;
 	nv_engine(priv)->tile_prog = nv31_mpeg_tile_prog;
 	return 0;
 }
diff --git a/drivers/gpu/drm/nouveau/core/engine/mpeg/nv44.c b/drivers/gpu/drm/nouveau/core/engine/mpeg/nv44.c
index 012b95d..3d8c213 100644
--- a/drivers/gpu/drm/nouveau/core/engine/mpeg/nv44.c
+++ b/drivers/gpu/drm/nouveau/core/engine/mpeg/nv44.c
@@ -177,7 +177,7 @@ nv44_mpeg_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 	nv_subdev(priv)->unit = 0x00000002;
 	nv_subdev(priv)->intr = nv44_mpeg_me_intr;
 	nv_engine(priv)->cclass = &nv44_mpeg_cclass;
-	nv_engine(priv)->sclass = nv31_mpeg_sclass;
+	nv_engine(priv)->sclass = nv40_mpeg_sclass;
 	nv_engine(priv)->tile_prog = nv31_mpeg_tile_prog;
 	return 0;
 }
diff --git a/drivers/gpu/drm/nouveau/core/include/engine/mpeg.h b/drivers/gpu/drm/nouveau/core/include/engine/mpeg.h
index 8b7560e..9b0d938 100644
--- a/drivers/gpu/drm/nouveau/core/include/engine/mpeg.h
+++ b/drivers/gpu/drm/nouveau/core/include/engine/mpeg.h
@@ -45,8 +45,10 @@ extern struct nouveau_oclass nv40_mpeg_oclass;
 extern struct nouveau_oclass nv44_mpeg_oclass;
 extern struct nouveau_oclass nv50_mpeg_oclass;
 extern struct nouveau_oclass nv84_mpeg_oclass;
+extern struct nouveau_ofuncs nv31_mpeg_ofuncs;
 extern struct nouveau_oclass nv31_mpeg_cclass;
 extern struct nouveau_oclass nv31_mpeg_sclass[];
+extern struct nouveau_oclass nv40_mpeg_sclass[];
 void nv31_mpeg_intr(struct nouveau_subdev *);
 void nv31_mpeg_tile_prog(struct nouveau_engine *, int);
 int  nv31_mpeg_init(struct nouveau_object *);
-- 
1.8.1.5

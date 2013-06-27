From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH] nouveau: Load firmware for BSP/VP engines on
	NV84-NV96, NVA0
Date: Thu, 27 Jun 2013 02:29:49 -0400
Message-ID: <1372314589-4324-1-git-send-email-imirkin@alum.mit.edu>
References: <1371974938-21234-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1371974938-21234-1-git-send-email-imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
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

v2 -> v3:
  - Changed firmware naming convention to be more similar to falcon
  - Removed setting of 0x2090, it was out of place and seemingly
    unnecessary
  - Load firmware only once and then keep it around until dtor

Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
---

Ben, as you requested, incremental diff against your other tree. I
manually touched up the patch off of the linux tree, but this does
seem to apply correctly.

Pretty sure I addressed all your comments, let me know if I missed
anything.

 nvkm/engine/xtensa.c         | 73 +++++++++++++---------
 nvkm/engine/bsp/nv84.c       |  2 -
 nvkm/engine/vp/nv84.c        |  2 -
 nvkm/include/engine/xtensa.h |  4 +-
 4 files changed, 43 insertions(+), 38 deletions(-)

diff --git a/nvkm/engine/xtensa.c b/nvkm/engine/xtensa.c
index 2dfab98..b8191e1 100644
--- a/nvkm/engine/xtensa.c
+++ b/nvkm/engine/xtensa.c
@@ -56,12 +56,11 @@ void
 _nouveau_xtensa_intr(struct nouveau_subdev *subdev)
 {
 	struct nouveau_xtensa *xtensa = (void *)subdev;
-	u32 intr, unk104, unk10c, chan;
+	u32 unk104 = nv_ro32(xtensa, 0xd04);
+	u32 intr = nv_ro32(xtensa, 0xc20);
+	u32 chan = nv_ro32(xtensa, 0xc28);
+	u32 unk10c = nv_ro32(xtensa, 0xd0c);
 
-	unk104 = nv_ro32(xtensa, 0xd04);
-	intr = nv_ro32(xtensa, 0xc20);
-	chan = nv_ro32(xtensa, 0xc28);
-	unk10c = nv_ro32(xtensa, 0xd0c);
 	if (intr & 0x10)
 		nv_warn(xtensa, "Watchdog interrupt, engine hung.\n");
 	nv_wo32(xtensa, 0xc20, intr);
@@ -101,6 +100,7 @@ _nouveau_xtensa_init(struct nouveau_object *object)
 	struct nouveau_device *device = nv_device(object);
 	struct nouveau_xtensa *xtensa = (void *)object;
 	const struct firmware *fw;
+	char name[32];
 	int i, ret;
 	u32 tmp;
 
@@ -108,37 +108,40 @@ _nouveau_xtensa_init(struct nouveau_object *object)
 	if (ret)
 		return ret;
 
-	ret = nouveau_gpuobj_new(object, NULL, 0x40000, 0x1000, 0,
-				 &xtensa->gpu_fw);
-	if (ret)
-		return ret;
-
-	ret = request_firmware(&fw, xtensa->firmware_fname, &device->pdev->dev);
-	if (ret) {
-		nv_warn(xtensa, "Firmware file %s unavailable.\n",
-			xtensa->firmware_fname);
-		return ret;
+	if (!xtensa->gpu_fw) {
+		ret = nouveau_gpuobj_new(object, NULL, 0x40000, 0x1000, 0,
+					 &xtensa->gpu_fw);
+		if (ret)
+			return ret;
+
+		snprintf(name, sizeof(name), "nouveau/nv84_xuc%03x",
+			 xtensa->addr >> 12);
+		ret = request_firmware(&fw, name, &device->pdev->dev);
+		if (ret) {
+			nv_warn(xtensa, "Firmware file %s unavailable.\n",
+				name);
+			nouveau_gpuobj_ref(NULL, &xtensa->gpu_fw);
+			return ret;
+		} else if (fw->size > 0x40000) {
+			nv_warn(xtensa, "Firmware file %s too large.\n", name);
+			release_firmware(fw);
+			nouveau_gpuobj_ref(NULL, &xtensa->gpu_fw);
+			return ret;
+		}
+
+		nv_debug(xtensa, "Loading firmware to address: 0x%llx\n",
+			 xtensa->gpu_fw->addr);
+
+		for (i = 0; i < fw->size / 4; i++)
+			nv_wo32(xtensa->gpu_fw, i * 4, *((u32 *)fw->data + i));
+
+		release_firmware(fw);
 	}
 
-	nv_debug(xtensa, "Loading firmware to address: 0x%llx\n",
-		 xtensa->gpu_fw->addr);
-
-	for (i = 0; i < fw->size / 4; i++)
-		nv_wo32(xtensa->gpu_fw, i * 4, *((u32 *)fw->data + i));
-
-	release_firmware(fw);
-
-	tmp = nv_ro32(xtensa, 0xc20); /* INTR */
-	if (tmp)
-		nv_warn(xtensa, "Unexpected read from XTENSA.INTR: 0x%x", tmp);
-
 	nv_wo32(xtensa, 0xd10, 0x1fffffff); /* ?? */
 	nv_wo32(xtensa, 0xd08, 0x0fffffff); /* ?? */
 
 	nv_wo32(xtensa, 0xd28, xtensa->unkd28); /* ?? */
-	nv_mask(xtensa, 0x2090,
-		0xf << (xtensa->fifo_nibble * 4),
-		0x8 << (xtensa->fifo_nibble * 4)); /* PFIFO.UNK90 */
 	nv_wo32(xtensa, 0xc20, 0x3f); /* INTR */
 	nv_wo32(xtensa, 0xd84, 0x3f); /* INTR_EN */
 
@@ -165,7 +168,15 @@ _nouveau_xtensa_fini(struct nouveau_object *object, bool suspend)
 	nv_wo32(xtensa, 0xd84, 0); /* INTR_EN */
 	nv_wo32(xtensa, 0xd94, 0); /* FIFO_CTRL */
 
+	return nouveau_engine_fini(&xtensa->base, suspend);
+}
+
+void
+_nouveau_xtensa_dtor(struct nouveau_object *object)
+{
+	struct nouveau_xtensa *xtensa = (void *)object;
+
 	nouveau_gpuobj_ref(NULL, &xtensa->gpu_fw);
 
-	return nouveau_engine_fini(&xtensa->base, suspend);
+	return nouveau_engine_destroy(&xtensa->base);
 }
diff --git a/nvkm/engine/bsp/nv84.c b/nvkm/engine/bsp/nv84.c
index ee4cff1..90d8c13 100644
--- a/nvkm/engine/bsp/nv84.c
+++ b/nvkm/engine/bsp/nv84.c
@@ -75,9 +75,7 @@ nv84_bsp_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 	nv_engine(priv)->cclass = &nv84_bsp_cclass;
 	nv_engine(priv)->sclass = nv84_bsp_sclass;
 	priv->fifo_val = 0x1111;
-	priv->fifo_nibble = 7;
 	priv->unkd28 = 0x90044;
-	priv->firmware_fname = "nouveau/nv84_bsp";
 	return 0;
 }
 
diff --git a/nvkm/engine/vp/nv84.c b/nvkm/engine/vp/nv84.c
index 0450a2d..9ec0ace 100644
--- a/nvkm/engine/vp/nv84.c
+++ b/nvkm/engine/vp/nv84.c
@@ -75,9 +75,7 @@ nv84_vp_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 	nv_engine(priv)->cclass = &nv84_vp_cclass;
 	nv_engine(priv)->sclass = nv84_vp_sclass;
 	priv->fifo_val = 0x111;
-	priv->fifo_nibble = 3;
 	priv->unkd28 = 0x9c544;
-	priv->firmware_fname = "nouveau/nv84_vp";
 	return 0;
 }
 
diff --git a/nvkm/include/engine/xtensa.h b/nvkm/include/engine/xtensa.h
index bc7eaf8..a13eaf8 100644
--- a/nvkm/include/engine/xtensa.h
+++ b/nvkm/include/engine/xtensa.h
@@ -10,9 +10,7 @@ struct nouveau_xtensa {
 
 	u32 addr;
 	struct nouveau_gpuobj *gpu_fw;
-	const char *firmware_fname;
 	u32 fifo_val;
-	u8 fifo_nibble;
 	u32 unkd28;
 };
 
@@ -31,7 +29,7 @@ int nouveau_xtensa_create_(struct nouveau_object *,
 			   struct nouveau_oclass *, u32, bool,
 			   const char *, const char *,
 			   int, void **);
-#define _nouveau_xtensa_dtor _nouveau_engine_dtor
+void _nouveau_xtensa_dtor(struct nouveau_object *);
 int _nouveau_xtensa_init(struct nouveau_object *);
 int _nouveau_xtensa_fini(struct nouveau_object *, bool);
 u32  _nouveau_xtensa_rd32(struct nouveau_object *, u64);
-- 
1.8.1.5

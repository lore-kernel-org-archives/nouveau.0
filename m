From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH] nouveau: Load firmware for BSP/VP engines on
	NV84-NV96, NVA0
Date: Mon,  3 Jun 2013 05:02:24 -0400
Message-ID: <1370250144-3303-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Maarten Lankhorst <maarten.lankhorst-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

These chipsets include the VP2 engine which is composed of a bitstream
processor (BSP) that decodes H.264 and a video processor (VP) which can
do iDCT/mo-comp/etc for MPEG1/2, H.264, and VC-1. Both of these are
driven by separate xtensa chips embedded in the hardware. This patch
provides the mechanism to load the kernel for the xtensa chips and
provide the necessary interactions to do the rest of the work.

Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
---

This patch applies on top of nouveau/master (16a41bcc8).

This seems to work for me. There was one boot where my userspace
component didn't work right, but it could just as well be a bug
there. Subsequent attempts seem to work fine. Note that I'm not
particularly familiar with any of this stuff, so if something looks
odd, I probably didn't know any better. I did try to faithfully
reproduce whatever the blob did. A few questions/thoughts:

1. There's a LOT of similarity between BSP and VP setup/etc. Is it
   worth it to create a core/xtensa.c or some such, similar to
   falcon.c? Since it's only in two places, not that much code, and
   there _are_ differences, I decided to keep them separate.

2. Firmware naming. Maarten suggested to use the falcon naming style,
   which is nv$chipset_fuc$offset. However here, all the chips share
   the same firmware. Also the offset would be 103 vs 00f, and is a
   little arbitrary. (And fuc doesn't apply here... xt? xtensa?) I've
   left it the way I had it: nv84_bsp and nv84_vp.

3. Firmware load time. I chose to load the fw into memory in the ctor,
   and then copy it in in init, due to some potentially bogus
   suspend/resume concerns. Also e.g. mplayer likes to create/destroy
   decoders at startup a few times. The downside is that ~200KB of
   memory is gone. Let me know if I should change it to do the
   request_firmware in init.

There's obviously a userspace piece to this, which I'm still working
on. But right now I have it working within certain parameters
(e.g. 1280x544 videos), and I'm relatively confident it can be
completed without further kernel-side changes.

There's also a hypothetical concern of "what if we create an open
firmware with a different user API". Ideally there'd be some way to
expose what kind of firmware is loaded, but I think that can be left
for "later".

 drivers/gpu/drm/nouveau/core/engine/bsp/nv84.c  | 139 ++++++++++++++++++++++-
 drivers/gpu/drm/nouveau/core/engine/fifo/nv84.c |   4 +
 drivers/gpu/drm/nouveau/core/engine/vp/nv84.c   | 140 +++++++++++++++++++++++-
 drivers/gpu/drm/nouveau/core/subdev/mc/nv50.c   |   1 +
 drivers/gpu/drm/nouveau/core/subdev/vm/nv50.c   |   2 +
 5 files changed, 278 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/core/engine/bsp/nv84.c b/drivers/gpu/drm/nouveau/core/engine/bsp/nv84.c
index 1d9f614..04880d9 100644
--- a/drivers/gpu/drm/nouveau/core/engine/bsp/nv84.c
+++ b/drivers/gpu/drm/nouveau/core/engine/bsp/nv84.c
@@ -29,6 +29,10 @@
 
 struct nv84_bsp_priv {
 	struct nouveau_engine base;
+	u32 *fw;
+	long fw_size;
+	struct nouveau_gpuobj *gpu_fw;
+	void *vm_gpu_fw;
 };
 
 /*******************************************************************************
@@ -37,6 +41,7 @@ struct nv84_bsp_priv {
 
 static struct nouveau_oclass
 nv84_bsp_sclass[] = {
+	{ 0x74b0, &nouveau_object_ofuncs },
 	{},
 };
 
@@ -44,11 +49,28 @@ nv84_bsp_sclass[] = {
  * BSP context
  ******************************************************************************/
 
+static int
+nv84_bsp_engctx_ctor(struct nouveau_object *parent,
+		     struct nouveau_object *engine,
+		     struct nouveau_oclass *oclass, void *data, u32 size,
+		     struct nouveau_object **pobject)
+{
+	struct nouveau_engctx *engctx;
+	int ret;
+
+	ret = nouveau_engctx_create(parent, engine, oclass, NULL,
+				    0x10000, 0x1000,
+				    NVOBJ_FLAG_ZERO_ALLOC, &engctx);
+	*pobject = nv_object(engctx);
+	return ret;
+}
+
+
 static struct nouveau_oclass
 nv84_bsp_cclass = {
 	.handle = NV_ENGCTX(BSP, 0x84),
 	.ofuncs = &(struct nouveau_ofuncs) {
-		.ctor = _nouveau_engctx_ctor,
+		.ctor = nv84_bsp_engctx_ctor,
 		.dtor = _nouveau_engctx_dtor,
 		.init = _nouveau_engctx_init,
 		.fini = _nouveau_engctx_fini,
@@ -61,6 +83,24 @@ nv84_bsp_cclass = {
  * BSP engine/subdev functions
  ******************************************************************************/
 
+static void
+nv84_bsp_intr(struct nouveau_subdev *subdev)
+{
+	struct nv84_bsp_priv *priv = (void *)subdev;
+	u32 intr, unk104, unk10c, chan;
+
+	unk104 = nv_rd32(priv, 0x103d04);
+	intr = nv_rd32(priv, 0x103c20);
+	chan = nv_rd32(priv, 0x103c28);
+	unk10c = nv_rd32(priv, 0x103d0c);
+	nv_wr32(priv, 0x103c20, intr);
+	intr = nv_rd32(priv, 0x103c20);
+	if (unk104 == 0x10001 && unk10c == 0x200 && chan && !intr) {
+		nv_debug(priv, "Enabling BSP.FIFO_CTRL\n");
+		nv_mask(priv, 0x103d94, 0, 0x1111); /* FIFO_CTRL */
+	}
+}
+
 static int
 nv84_bsp_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 	      struct nouveau_oclass *oclass, void *data, u32 size,
@@ -68,6 +108,8 @@ nv84_bsp_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 {
 	struct nv84_bsp_priv *priv;
 	int ret;
+	const struct firmware *fw;
+	struct nouveau_device *device = nv_device(parent);
 
 	ret = nouveau_engine_create(parent, engine, oclass, true,
 				    "PBSP", "bsp", &priv);
@@ -78,16 +120,105 @@ nv84_bsp_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 	nv_subdev(priv)->unit = 0x04008000;
 	nv_engine(priv)->cclass = &nv84_bsp_cclass;
 	nv_engine(priv)->sclass = nv84_bsp_sclass;
+
+	ret = request_firmware(&fw, "nouveau/nv84_bsp", &device->pdev->dev);
+	if (ret) {
+		nv_warn(priv, "Firmware for NV84 BSP unavailable.\n");
+		return 0;
+	}
+
+	nv_subdev(priv)->intr = nv84_bsp_intr;
+
+	priv->fw = kmemdup(fw->data, fw->size, GFP_KERNEL);
+	priv->fw_size = fw->size;
+	release_firmware(fw);
+	if (!priv->fw)
+		return -ENOMEM;
+
 	return 0;
 }
 
+static void
+nv84_bsp_dtor(struct nouveau_object *object)
+{
+	struct nv84_bsp_priv *priv = (void *)object;
+	kfree(priv->fw);
+}
+
+static int
+nv84_bsp_init(struct nouveau_object *object)
+{
+	struct nouveau_device *device = nv_device(object);
+	struct nv84_bsp_priv *priv = (void *)object;
+	int i, ret;
+	u32 tmp;
+
+	if (!priv->fw)
+		return -EINVAL;
+
+	ret = nouveau_engine_init(&priv->base);
+	if (ret)
+		return ret;
+
+	ret = nouveau_gpuobj_new(object, NULL, 0x40000, 0x1000, 0,
+				 &priv->gpu_fw);
+	if (ret)
+		return ret;
+
+	tmp = nv_rd32(device, 0x103c20); /* INTR */
+	if (tmp)
+		nv_warn(priv, "Unexpected read from XTENSA.INTR: 0x%x", tmp);
+
+	nv_wr32(device, 0x103d10, 0x1fffffff); /* ?? */
+	nv_wr32(device, 0x103d08, 0x0fffffff); /* ?? */
+
+	nv_wr32(device, 0x103d28, 0x90044); /* ?? */
+	nv_mask(device, 0x2090, 0xf0000000, 0x8 << 28); /* PFIFO.UNK90 */
+	nv_wr32(device, 0x103c20, 0x3f); /* INTR */
+	nv_wr32(device, 0x103d84, 0x3f); /* INTR_EN */
+
+	nv_debug(priv, "Loading firmware to address: 0x%llx\n",
+		 priv->gpu_fw->addr);
+
+	for (i = 0; i < priv->fw_size / 4; i++)
+		nv_wo32(priv->gpu_fw, i * 4, priv->fw[i]);
+
+	nv_wr32(device, 0x103cc0, priv->gpu_fw->addr >> 8); /* REGION_BASE */
+	nv_wr32(device, 0x103cc4, 0x1c); /* XT_REGION_SETUP */
+	nv_wr32(device, 0x103cc8, priv->gpu_fw->size >> 8); /* REGION_LIMIT */
+
+	tmp = nv_rd32(device, 0x0);
+	nv_wr32(device, 0x103de0, tmp); /* SCRATCH_H2X */
+
+	nv_wr32(device, 0x103ce8, 0xf); /* XT_REGION_SETUP */
+
+	nv_wr32(device, 0x103c20, 0x3f); /* INTR */
+	nv_wr32(device, 0x103d84, 0x3f); /* INTR_EN */
+
+	return 0;
+}
+
+static int
+nv84_bsp_fini(struct nouveau_object *object, bool suspend)
+{
+	struct nouveau_device *device = nv_device(object);
+	struct nv84_bsp_priv *priv = (void *)object;
+
+	nv_wr32(device, 0x103d84, 0); /* INTR_EN */
+	nv_wr32(device, 0x103d94, 0); /* FIFO_CTRL */
+
+	nouveau_gpuobj_ref(NULL, &priv->gpu_fw);
+
+	return nouveau_engine_fini(&priv->base, suspend);
+}
+
 struct nouveau_oclass
 nv84_bsp_oclass = {
 	.handle = NV_ENGINE(BSP, 0x84),
 	.ofuncs = &(struct nouveau_ofuncs) {
 		.ctor = nv84_bsp_ctor,
-		.dtor = _nouveau_engine_dtor,
-		.init = _nouveau_engine_init,
-		.fini = _nouveau_engine_fini,
+		.dtor = nv84_bsp_dtor,
+		.init = nv84_bsp_init,
+		.fini = nv84_bsp_fini,
 	},
 };
diff --git a/drivers/gpu/drm/nouveau/core/engine/fifo/nv84.c b/drivers/gpu/drm/nouveau/core/engine/fifo/nv84.c
index 35b94bd..7f53196 100644
--- a/drivers/gpu/drm/nouveau/core/engine/fifo/nv84.c
+++ b/drivers/gpu/drm/nouveau/core/engine/fifo/nv84.c
@@ -56,7 +56,9 @@ nv84_fifo_context_attach(struct nouveau_object *parent,
 	switch (nv_engidx(object->engine)) {
 	case NVDEV_ENGINE_SW   : return 0;
 	case NVDEV_ENGINE_GR   : addr = 0x0020; break;
+	case NVDEV_ENGINE_VP   : addr = 0x0040; break;
 	case NVDEV_ENGINE_MPEG : addr = 0x0060; break;
+	case NVDEV_ENGINE_BSP  : addr = 0x0080; break;
 	case NVDEV_ENGINE_CRYPT: addr = 0x00a0; break;
 	case NVDEV_ENGINE_COPY0: addr = 0x00c0; break;
 	default:
@@ -89,7 +91,9 @@ nv84_fifo_context_detach(struct nouveau_object *parent, bool suspend,
 	switch (nv_engidx(object->engine)) {
 	case NVDEV_ENGINE_SW   : return 0;
 	case NVDEV_ENGINE_GR   : engn = 0; addr = 0x0020; break;
+	case NVDEV_ENGINE_VP   : engn = 3; addr = 0x0040; break;
 	case NVDEV_ENGINE_MPEG : engn = 1; addr = 0x0060; break;
+	case NVDEV_ENGINE_BSP  : engn = 5; addr = 0x0080; break;
 	case NVDEV_ENGINE_CRYPT: engn = 4; addr = 0x00a0; break;
 	case NVDEV_ENGINE_COPY0: engn = 2; addr = 0x00c0; break;
 	default:
diff --git a/drivers/gpu/drm/nouveau/core/engine/vp/nv84.c b/drivers/gpu/drm/nouveau/core/engine/vp/nv84.c
index 261cd96..c0fa8e7 100644
--- a/drivers/gpu/drm/nouveau/core/engine/vp/nv84.c
+++ b/drivers/gpu/drm/nouveau/core/engine/vp/nv84.c
@@ -29,6 +29,10 @@
 
 struct nv84_vp_priv {
 	struct nouveau_engine base;
+	u32 *fw;
+	long fw_size;
+	struct nouveau_gpuobj *gpu_fw;
+	void *vm_gpu_fw;
 };
 
 /*******************************************************************************
@@ -37,6 +41,7 @@ struct nv84_vp_priv {
 
 static struct nouveau_oclass
 nv84_vp_sclass[] = {
+	{ 0x7476, &nouveau_object_ofuncs },
 	{},
 };
 
@@ -44,11 +49,27 @@ nv84_vp_sclass[] = {
  * PVP context
  ******************************************************************************/
 
+static int
+nv84_vp_engctx_ctor(struct nouveau_object *parent,
+		    struct nouveau_object *engine,
+		    struct nouveau_oclass *oclass, void *data, u32 size,
+		    struct nouveau_object **pobject)
+{
+	struct nouveau_engctx *engctx;
+	int ret;
+
+	ret = nouveau_engctx_create(parent, engine, oclass, NULL,
+				    0x10000, 0x1000,
+				    NVOBJ_FLAG_ZERO_ALLOC, &engctx);
+	*pobject = nv_object(engctx);
+	return ret;
+}
+
 static struct nouveau_oclass
 nv84_vp_cclass = {
 	.handle = NV_ENGCTX(VP, 0x84),
 	.ofuncs = &(struct nouveau_ofuncs) {
-		.ctor = _nouveau_engctx_ctor,
+		.ctor = nv84_vp_engctx_ctor,
 		.dtor = _nouveau_engctx_dtor,
 		.init = _nouveau_engctx_init,
 		.fini = _nouveau_engctx_fini,
@@ -61,6 +82,24 @@ nv84_vp_cclass = {
  * PVP engine/subdev functions
  ******************************************************************************/
 
+static void
+nv84_vp_intr(struct nouveau_subdev *subdev)
+{
+	struct nv84_vp_priv *priv = (void *)subdev;
+	u32 intr, unk104, unk10c, chan;
+
+	unk104 = nv_rd32(priv, 0xfd04);
+	intr = nv_rd32(priv, 0xfc20);
+	chan = nv_rd32(priv, 0xfc28);
+	unk10c = nv_rd32(priv, 0xfd0c);
+	nv_wr32(priv, 0xfc20, intr);
+	intr = nv_rd32(priv, 0xfc20);
+	if (unk104 == 0x10001 && unk10c == 0x200 && chan && !intr) {
+		nv_debug(priv, "Enabling VP.FIFO_CTRL\n");
+		nv_mask(priv, 0xfd94, 0, 0x111); /* FIFO_CTRL */
+	}
+}
+
 static int
 nv84_vp_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 	     struct nouveau_oclass *oclass, void *data, u32 size,
@@ -68,6 +107,8 @@ nv84_vp_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 {
 	struct nv84_vp_priv *priv;
 	int ret;
+	const struct firmware *fw;
+	struct nouveau_device *device = nv_device(parent);
 
 	ret = nouveau_engine_create(parent, engine, oclass, true,
 				    "PVP", "vp", &priv);
@@ -78,16 +119,107 @@ nv84_vp_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 	nv_subdev(priv)->unit = 0x01020000;
 	nv_engine(priv)->cclass = &nv84_vp_cclass;
 	nv_engine(priv)->sclass = nv84_vp_sclass;
+	ret = request_firmware(&fw, "nouveau/nv84_vp", &device->pdev->dev);
+	if (ret) {
+		nv_warn(priv, "Firmware for NV84 VP unavailable.\n");
+		return 0;
+	}
+
+	nv_subdev(priv)->intr = nv84_vp_intr;
+
+	priv->fw = kmemdup(fw->data, fw->size, GFP_KERNEL);
+	priv->fw_size = fw->size;
+	release_firmware(fw);
+	if (!priv->fw)
+		return -ENOMEM;
+
 	return 0;
 }
 
+static void
+nv84_vp_dtor(struct nouveau_object *object)
+{
+	struct nv84_vp_priv *priv = (void *)object;
+	kfree(priv->fw);
+}
+
+static int
+nv84_vp_init(struct nouveau_object *object)
+{
+	struct nouveau_device *device = nv_device(object);
+	struct nv84_vp_priv *priv = (void *)object;
+	int i, ret;
+	u32 tmp;
+
+	if (!priv->fw)
+		return -EINVAL;
+
+	ret = nouveau_engine_init(&priv->base);
+	if (ret)
+		return ret;
+
+	ret = nouveau_gpuobj_new(object, NULL, 0x40000, 0x1000, 0,
+				 &priv->gpu_fw);
+	if (ret)
+		return ret;
+
+	tmp = nv_rd32(device, 0xfc20); /* INTR */
+	if (tmp)
+		nv_warn(priv, "Unexpected read from XTENSA.INTR: 0x%x", tmp);
+
+	nv_mask(device, 0x2090, 0x0000f000, 0x8 << 12); /* PFIFO.UNK90 */
+	nv_wr32(device, 0xfd10, 0x1fffffff); /* ?? */
+	nv_wr32(device, 0xfd08, 0x0fffffff); /* ?? */
+	nv_wr32(device, 0xf010, 0x30); /* ?? */
+	nv_wr32(device, 0xfd00, 0x4); /* ?? */
+	nv_mask(device, 0xfd98, 0x10, 0x10); /* ?? */
+
+	nv_wr32(device, 0xfd28, 0x9c544); /* ?? */
+	nv_wr32(device, 0xfc20, 0x3f); /* INTR */
+	nv_wr32(device, 0xfd84, 0x3f); /* INTR_EN */
+
+	nv_debug(priv, "Loading firmware to address: 0x%llx\n",
+		 priv->gpu_fw->addr);
+
+	for (i = 0; i < priv->fw_size / 4; i++)
+		nv_wo32(priv->gpu_fw, i * 4, priv->fw[i]);
+
+	nv_wr32(device, 0xfcc0, priv->gpu_fw->addr >> 8); /* XT_REGION_BASE */
+	nv_wr32(device, 0xfcc4, 0x1c); /* XT_REGION_SETUP */
+	nv_wr32(device, 0xfcc8, priv->gpu_fw->size >> 8); /* REGION_LIMIT */
+
+	tmp = nv_rd32(device, 0x0);
+	nv_wr32(device, 0xfde0, tmp); /* SCRATCH_H2X */
+
+	nv_wr32(device, 0xfce8, 0xf); /* XT_REGION_SETUP */
+
+	nv_wr32(device, 0xfc20, 0x3f); /* INTR */
+	nv_wr32(device, 0xfd84, 0x3f); /* INTR_EN */
+
+	return 0;
+}
+
+static int
+nv84_vp_fini(struct nouveau_object *object, bool suspend)
+{
+	struct nouveau_device *device = nv_device(object);
+	struct nv84_vp_priv *priv = (void *)object;
+
+	nv_wr32(device, 0xfd84, 0); /* INTR_EN */
+	nv_wr32(device, 0xfd94, 0); /* FIFO_CTRL */
+
+	nouveau_gpuobj_ref(NULL, &priv->gpu_fw);
+
+	return nouveau_engine_fini(&priv->base, suspend);
+}
+
 struct nouveau_oclass
 nv84_vp_oclass = {
 	.handle = NV_ENGINE(VP, 0x84),
 	.ofuncs = &(struct nouveau_ofuncs) {
 		.ctor = nv84_vp_ctor,
-		.dtor = _nouveau_engine_dtor,
-		.init = _nouveau_engine_init,
-		.fini = _nouveau_engine_fini,
+		.dtor = nv84_vp_dtor,
+		.init = nv84_vp_init,
+		.fini = nv84_vp_fini,
 	},
 };
diff --git a/drivers/gpu/drm/nouveau/core/subdev/mc/nv50.c b/drivers/gpu/drm/nouveau/core/subdev/mc/nv50.c
index d796924..0cb322a 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/mc/nv50.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/mc/nv50.c
@@ -35,6 +35,7 @@ nv50_mc_intr[] = {
 	{ 0x00001000, NVDEV_ENGINE_GR },
 	{ 0x00004000, NVDEV_ENGINE_CRYPT },	/* NV84- */
 	{ 0x00008000, NVDEV_ENGINE_BSP },	/* NV84- */
+	{ 0x00020000, NVDEV_ENGINE_VP },	/* NV84- */
 	{ 0x00100000, NVDEV_SUBDEV_TIMER },
 	{ 0x00200000, NVDEV_SUBDEV_GPIO },
 	{ 0x04000000, NVDEV_ENGINE_DISP },
diff --git a/drivers/gpu/drm/nouveau/core/subdev/vm/nv50.c b/drivers/gpu/drm/nouveau/core/subdev/vm/nv50.c
index 83c62a7..f88287a 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/vm/nv50.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/vm/nv50.c
@@ -168,8 +168,10 @@ nv50_vm_flush(struct nouveau_vm *vm)
 
 		switch (i) {
 		case NVDEV_ENGINE_GR   : vme = 0x00; break;
+		case NVDEV_ENGINE_VP   : vme = 0x01; break;
 		case NVDEV_SUBDEV_BAR  : vme = 0x06; break;
 		case NVDEV_ENGINE_MPEG : vme = 0x08; break;
+		case NVDEV_ENGINE_BSP  : vme = 0x09; break;
 		case NVDEV_ENGINE_CRYPT: vme = 0x0a; break;
 		case NVDEV_ENGINE_COPY0: vme = 0x0d; break;
 		default:
-- 
1.8.1.5

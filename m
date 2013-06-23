From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: [PATCH v2] nouveau: Load firmware for BSP/VP engines on NV84-NV96,
	NVA0
Date: Sun, 23 Jun 2013 04:08:58 -0400
Message-ID: <1371974938-21234-1-git-send-email-imirkin@alum.mit.edu>
References: <1370250144-3303-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <1370250144-3303-1-git-send-email-imirkin@alum.mit.edu>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Ben Skeggs <bskeggs@redhat.com>, Maarten Lankhorst <maarten.lankhorst@ubuntu.com>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

These chipsets include the VP2 engine which is composed of a bitstream
processor (BSP) that decodes H.264 and a video processor (VP) which can
do iDCT/mo-comp/etc for MPEG1/2, H.264, and VC-1. Both of these are
driven by separate xtensa chips embedded in the hardware. This patch
provides the mechanism to load the kernel for the xtensa chips and
provide the necessary interactions to do the rest of the work.

Signed-off-by: Ilia Mirkin <imirkin@alum.mit.edu>
---

v1 -> v2:
 - factored out similar logic between vp and bsp into a new xtensa.c, similar
   to falcon
 - moved firmware loading to init rather than ctor (kinda wonder what happens
   if you suspend while playing a video... hmm.)
 - created new "blank" copies of vp/bsp for nv98+, identical to the old nv84
   ones, but s/84/98/g

At this point I have H.264 and MPEG1/2 working fairly well. Back when
there were bugs in my mesa code, VP would freeze up sometimes and the
watchdog would fire. I have no idea how to actually reset the engine
though... so it's just a notification for now. These would happen when
buffers were incorrectly sized, wrong addresses were passed in, etc.

Also it's worth pointing out that the blob firmware being used allows
arbitrary xtensa code to be uploaded by a user (with dri access),
which in turn could enable that code to have all the system memory
access that the card has (e.g. no iommu). It's a giant security hole,
but without rewriting the firmware, there's not a whole lot that can
be done. In any case, the kernel driver isn't affected. But just
wanted to point that out.

 drivers/gpu/drm/nouveau/Makefile                   |   3 +
 drivers/gpu/drm/nouveau/core/core/xtensa.c         | 171 +++++++++++++++++++++
 drivers/gpu/drm/nouveau/core/engine/bsp/nv84.c     |  28 ++--
 .../drm/nouveau/core/engine/bsp/{nv84.c => nv98.c} |  22 +--
 drivers/gpu/drm/nouveau/core/engine/device/nv50.c  |  28 ++--
 drivers/gpu/drm/nouveau/core/engine/fifo/nv84.c    |   4 +
 drivers/gpu/drm/nouveau/core/engine/vp/nv84.c      |  28 ++--
 .../drm/nouveau/core/engine/vp/{nv84.c => nv98.c}  |  22 +--
 drivers/gpu/drm/nouveau/core/include/core/xtensa.h |  40 +++++
 drivers/gpu/drm/nouveau/core/include/engine/bsp.h  |   1 +
 drivers/gpu/drm/nouveau/core/include/engine/vp.h   |   1 +
 drivers/gpu/drm/nouveau/core/subdev/mc/nv50.c      |   1 +
 drivers/gpu/drm/nouveau/core/subdev/vm/nv50.c      |   2 +
 13 files changed, 289 insertions(+), 62 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/core/core/xtensa.c
 copy drivers/gpu/drm/nouveau/core/engine/bsp/{nv84.c => nv98.c} (87%)
 copy drivers/gpu/drm/nouveau/core/engine/vp/{nv84.c => nv98.c} (88%)
 create mode 100644 drivers/gpu/drm/nouveau/core/include/core/xtensa.h

diff --git a/drivers/gpu/drm/nouveau/Makefile b/drivers/gpu/drm/nouveau/Makefile
index 998e8b4..3d9d484 100644
--- a/drivers/gpu/drm/nouveau/Makefile
+++ b/drivers/gpu/drm/nouveau/Makefile
@@ -23,6 +23,7 @@ nouveau-y += core/core/parent.o
 nouveau-y += core/core/printk.o
 nouveau-y += core/core/ramht.o
 nouveau-y += core/core/subdev.o
+nouveau-y += core/core/xtensa.o
 
 nouveau-y += core/subdev/bar/base.o
 nouveau-y += core/subdev/bar/nv50.o
@@ -135,6 +136,7 @@ nouveau-y += core/engine/dmaobj/nv50.o
 nouveau-y += core/engine/dmaobj/nvc0.o
 nouveau-y += core/engine/dmaobj/nvd0.o
 nouveau-y += core/engine/bsp/nv84.o
+nouveau-y += core/engine/bsp/nv98.o
 nouveau-y += core/engine/bsp/nvc0.o
 nouveau-y += core/engine/bsp/nve0.o
 nouveau-y += core/engine/copy/nva3.o
@@ -209,6 +211,7 @@ nouveau-y += core/engine/software/nv10.o
 nouveau-y += core/engine/software/nv50.o
 nouveau-y += core/engine/software/nvc0.o
 nouveau-y += core/engine/vp/nv84.o
+nouveau-y += core/engine/vp/nv98.o
 nouveau-y += core/engine/vp/nvc0.o
 nouveau-y += core/engine/vp/nve0.o
 
diff --git a/drivers/gpu/drm/nouveau/core/core/xtensa.c b/drivers/gpu/drm/nouveau/core/core/xtensa.c
new file mode 100644
index 0000000..2dfab98
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/core/core/xtensa.c
@@ -0,0 +1,171 @@
+/*
+ * Copyright 2013 Ilia Mirkin
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ */
+
+#include <core/xtensa.h>
+
+u32
+_nouveau_xtensa_rd32(struct nouveau_object *object, u64 addr)
+{
+	struct nouveau_xtensa *xtensa = (void *)object;
+	return nv_rd32(xtensa, xtensa->addr + addr);
+}
+
+void
+_nouveau_xtensa_wr32(struct nouveau_object *object, u64 addr, u32 data)
+{
+	struct nouveau_xtensa *xtensa = (void *)object;
+	nv_wr32(xtensa, xtensa->addr + addr, data);
+}
+
+int
+_nouveau_xtensa_engctx_ctor(struct nouveau_object *parent,
+			    struct nouveau_object *engine,
+			    struct nouveau_oclass *oclass, void *data, u32 size,
+			    struct nouveau_object **pobject)
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
+void
+_nouveau_xtensa_intr(struct nouveau_subdev *subdev)
+{
+	struct nouveau_xtensa *xtensa = (void *)subdev;
+	u32 intr, unk104, unk10c, chan;
+
+	unk104 = nv_ro32(xtensa, 0xd04);
+	intr = nv_ro32(xtensa, 0xc20);
+	chan = nv_ro32(xtensa, 0xc28);
+	unk10c = nv_ro32(xtensa, 0xd0c);
+	if (intr & 0x10)
+		nv_warn(xtensa, "Watchdog interrupt, engine hung.\n");
+	nv_wo32(xtensa, 0xc20, intr);
+	intr = nv_ro32(xtensa, 0xc20);
+	if (unk104 == 0x10001 && unk10c == 0x200 && chan && !intr) {
+		nv_debug(xtensa, "Enabling FIFO_CTRL\n");
+		nv_mask(xtensa, xtensa->addr + 0xd94, 0, xtensa->fifo_val);
+	}
+}
+
+int
+nouveau_xtensa_create_(struct nouveau_object *parent,
+		       struct nouveau_object *engine,
+		       struct nouveau_oclass *oclass, u32 addr, bool enable,
+		       const char *iname, const char *fname,
+		       int length, void **pobject)
+{
+	struct nouveau_xtensa *xtensa;
+	int ret;
+
+	ret = nouveau_engine_create_(parent, engine, oclass, enable, iname,
+				     fname, length, pobject);
+	xtensa = *pobject;
+	if (ret)
+		return ret;
+
+	nv_subdev(xtensa)->intr = _nouveau_xtensa_intr;
+
+	xtensa->addr = addr;
+
+	return 0;
+}
+
+int
+_nouveau_xtensa_init(struct nouveau_object *object)
+{
+	struct nouveau_device *device = nv_device(object);
+	struct nouveau_xtensa *xtensa = (void *)object;
+	const struct firmware *fw;
+	int i, ret;
+	u32 tmp;
+
+	ret = nouveau_engine_init(&xtensa->base);
+	if (ret)
+		return ret;
+
+	ret = nouveau_gpuobj_new(object, NULL, 0x40000, 0x1000, 0,
+				 &xtensa->gpu_fw);
+	if (ret)
+		return ret;
+
+	ret = request_firmware(&fw, xtensa->firmware_fname, &device->pdev->dev);
+	if (ret) {
+		nv_warn(xtensa, "Firmware file %s unavailable.\n",
+			xtensa->firmware_fname);
+		return ret;
+	}
+
+	nv_debug(xtensa, "Loading firmware to address: 0x%llx\n",
+		 xtensa->gpu_fw->addr);
+
+	for (i = 0; i < fw->size / 4; i++)
+		nv_wo32(xtensa->gpu_fw, i * 4, *((u32 *)fw->data + i));
+
+	release_firmware(fw);
+
+	tmp = nv_ro32(xtensa, 0xc20); /* INTR */
+	if (tmp)
+		nv_warn(xtensa, "Unexpected read from XTENSA.INTR: 0x%x", tmp);
+
+	nv_wo32(xtensa, 0xd10, 0x1fffffff); /* ?? */
+	nv_wo32(xtensa, 0xd08, 0x0fffffff); /* ?? */
+
+	nv_wo32(xtensa, 0xd28, xtensa->unkd28); /* ?? */
+	nv_mask(xtensa, 0x2090,
+		0xf << (xtensa->fifo_nibble * 4),
+		0x8 << (xtensa->fifo_nibble * 4)); /* PFIFO.UNK90 */
+	nv_wo32(xtensa, 0xc20, 0x3f); /* INTR */
+	nv_wo32(xtensa, 0xd84, 0x3f); /* INTR_EN */
+
+	nv_wo32(xtensa, 0xcc0, xtensa->gpu_fw->addr >> 8); /* XT_REGION_BASE */
+	nv_wo32(xtensa, 0xcc4, 0x1c); /* XT_REGION_SETUP */
+	nv_wo32(xtensa, 0xcc8, xtensa->gpu_fw->size >> 8); /* XT_REGION_LIMIT */
+
+	tmp = nv_rd32(xtensa, 0x0);
+	nv_wo32(xtensa, 0xde0, tmp); /* SCRATCH_H2X */
+
+	nv_wo32(xtensa, 0xce8, 0xf); /* XT_REGION_SETUP */
+
+	nv_wo32(xtensa, 0xc20, 0x3f); /* INTR */
+	nv_wo32(xtensa, 0xd84, 0x3f); /* INTR_EN */
+
+	return 0;
+}
+
+int
+_nouveau_xtensa_fini(struct nouveau_object *object, bool suspend)
+{
+	struct nouveau_xtensa *xtensa = (void *)object;
+
+	nv_wo32(xtensa, 0xd84, 0); /* INTR_EN */
+	nv_wo32(xtensa, 0xd94, 0); /* FIFO_CTRL */
+
+	nouveau_gpuobj_ref(NULL, &xtensa->gpu_fw);
+
+	return nouveau_engine_fini(&xtensa->base, suspend);
+}
diff --git a/drivers/gpu/drm/nouveau/core/engine/bsp/nv84.c b/drivers/gpu/drm/nouveau/core/engine/bsp/nv84.c
index 1d9f614..ee4cff1 100644
--- a/drivers/gpu/drm/nouveau/core/engine/bsp/nv84.c
+++ b/drivers/gpu/drm/nouveau/core/engine/bsp/nv84.c
@@ -19,24 +19,20 @@
  * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
  * OTHER DEALINGS IN THE SOFTWARE.
  *
- * Authors: Ben Skeggs
+ * Authors: Ben Skeggs, Ilia Mirkin
  */
 
-#include <core/engctx.h>
-#include <core/class.h>
+#include <core/xtensa.h>
 
 #include <engine/bsp.h>
 
-struct nv84_bsp_priv {
-	struct nouveau_engine base;
-};
-
 /*******************************************************************************
  * BSP object classes
  ******************************************************************************/
 
 static struct nouveau_oclass
 nv84_bsp_sclass[] = {
+	{ 0x74b0, &nouveau_object_ofuncs },
 	{},
 };
 
@@ -48,7 +44,7 @@ static struct nouveau_oclass
 nv84_bsp_cclass = {
 	.handle = NV_ENGCTX(BSP, 0x84),
 	.ofuncs = &(struct nouveau_ofuncs) {
-		.ctor = _nouveau_engctx_ctor,
+		.ctor = _nouveau_xtensa_engctx_ctor,
 		.dtor = _nouveau_engctx_dtor,
 		.init = _nouveau_engctx_init,
 		.fini = _nouveau_engctx_fini,
@@ -66,10 +62,10 @@ nv84_bsp_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 	      struct nouveau_oclass *oclass, void *data, u32 size,
 	      struct nouveau_object **pobject)
 {
-	struct nv84_bsp_priv *priv;
+	struct nouveau_xtensa *priv;
 	int ret;
 
-	ret = nouveau_engine_create(parent, engine, oclass, true,
+	ret = nouveau_xtensa_create(parent, engine, oclass, 0x103000, true,
 				    "PBSP", "bsp", &priv);
 	*pobject = nv_object(priv);
 	if (ret)
@@ -78,6 +74,10 @@ nv84_bsp_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 	nv_subdev(priv)->unit = 0x04008000;
 	nv_engine(priv)->cclass = &nv84_bsp_cclass;
 	nv_engine(priv)->sclass = nv84_bsp_sclass;
+	priv->fifo_val = 0x1111;
+	priv->fifo_nibble = 7;
+	priv->unkd28 = 0x90044;
+	priv->firmware_fname = "nouveau/nv84_bsp";
 	return 0;
 }
 
@@ -86,8 +86,10 @@ nv84_bsp_oclass = {
 	.handle = NV_ENGINE(BSP, 0x84),
 	.ofuncs = &(struct nouveau_ofuncs) {
 		.ctor = nv84_bsp_ctor,
-		.dtor = _nouveau_engine_dtor,
-		.init = _nouveau_engine_init,
-		.fini = _nouveau_engine_fini,
+		.dtor = _nouveau_xtensa_dtor,
+		.init = _nouveau_xtensa_init,
+		.fini = _nouveau_xtensa_fini,
+		.rd32 = _nouveau_xtensa_rd32,
+		.wr32 = _nouveau_xtensa_wr32,
 	},
 };
diff --git a/drivers/gpu/drm/nouveau/core/engine/bsp/nv84.c b/drivers/gpu/drm/nouveau/core/engine/bsp/nv98.c
similarity index 87%
copy from drivers/gpu/drm/nouveau/core/engine/bsp/nv84.c
copy to drivers/gpu/drm/nouveau/core/engine/bsp/nv98.c
index 1d9f614..8bf92b0 100644
--- a/drivers/gpu/drm/nouveau/core/engine/bsp/nv84.c
+++ b/drivers/gpu/drm/nouveau/core/engine/bsp/nv98.c
@@ -27,7 +27,7 @@
 
 #include <engine/bsp.h>
 
-struct nv84_bsp_priv {
+struct nv98_bsp_priv {
 	struct nouveau_engine base;
 };
 
@@ -36,7 +36,7 @@ struct nv84_bsp_priv {
  ******************************************************************************/
 
 static struct nouveau_oclass
-nv84_bsp_sclass[] = {
+nv98_bsp_sclass[] = {
 	{},
 };
 
@@ -45,8 +45,8 @@ nv84_bsp_sclass[] = {
  ******************************************************************************/
 
 static struct nouveau_oclass
-nv84_bsp_cclass = {
-	.handle = NV_ENGCTX(BSP, 0x84),
+nv98_bsp_cclass = {
+	.handle = NV_ENGCTX(BSP, 0x98),
 	.ofuncs = &(struct nouveau_ofuncs) {
 		.ctor = _nouveau_engctx_ctor,
 		.dtor = _nouveau_engctx_dtor,
@@ -62,11 +62,11 @@ nv84_bsp_cclass = {
  ******************************************************************************/
 
 static int
-nv84_bsp_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
+nv98_bsp_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 	      struct nouveau_oclass *oclass, void *data, u32 size,
 	      struct nouveau_object **pobject)
 {
-	struct nv84_bsp_priv *priv;
+	struct nv98_bsp_priv *priv;
 	int ret;
 
 	ret = nouveau_engine_create(parent, engine, oclass, true,
@@ -76,16 +76,16 @@ nv84_bsp_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 		return ret;
 
 	nv_subdev(priv)->unit = 0x04008000;
-	nv_engine(priv)->cclass = &nv84_bsp_cclass;
-	nv_engine(priv)->sclass = nv84_bsp_sclass;
+	nv_engine(priv)->cclass = &nv98_bsp_cclass;
+	nv_engine(priv)->sclass = nv98_bsp_sclass;
 	return 0;
 }
 
 struct nouveau_oclass
-nv84_bsp_oclass = {
-	.handle = NV_ENGINE(BSP, 0x84),
+nv98_bsp_oclass = {
+	.handle = NV_ENGINE(BSP, 0x98),
 	.ofuncs = &(struct nouveau_ofuncs) {
-		.ctor = nv84_bsp_ctor,
+		.ctor = nv98_bsp_ctor,
 		.dtor = _nouveau_engine_dtor,
 		.init = _nouveau_engine_init,
 		.fini = _nouveau_engine_fini,
diff --git a/drivers/gpu/drm/nouveau/core/engine/device/nv50.c b/drivers/gpu/drm/nouveau/core/engine/device/nv50.c
index 5e8c3de..024d47c 100644
--- a/drivers/gpu/drm/nouveau/core/engine/device/nv50.c
+++ b/drivers/gpu/drm/nouveau/core/engine/device/nv50.c
@@ -227,9 +227,9 @@ nv50_identify(struct nouveau_device *device)
 		device->oclass[NVDEV_ENGINE_FIFO   ] = &nv84_fifo_oclass;
 		device->oclass[NVDEV_ENGINE_SW     ] = &nv50_software_oclass;
 		device->oclass[NVDEV_ENGINE_GR     ] = &nv50_graph_oclass;
-		device->oclass[NVDEV_ENGINE_VP     ] = &nv84_vp_oclass;
+		device->oclass[NVDEV_ENGINE_VP     ] = &nv98_vp_oclass;
 		device->oclass[NVDEV_ENGINE_CRYPT  ] = &nv98_crypt_oclass;
-		device->oclass[NVDEV_ENGINE_BSP    ] = &nv84_bsp_oclass;
+		device->oclass[NVDEV_ENGINE_BSP    ] = &nv98_bsp_oclass;
 		device->oclass[NVDEV_ENGINE_PPP    ] = &nv98_ppp_oclass;
 		device->oclass[NVDEV_ENGINE_DISP   ] = &nv94_disp_oclass;
 		break;
@@ -279,9 +279,9 @@ nv50_identify(struct nouveau_device *device)
 		device->oclass[NVDEV_ENGINE_FIFO   ] = &nv84_fifo_oclass;
 		device->oclass[NVDEV_ENGINE_SW     ] = &nv50_software_oclass;
 		device->oclass[NVDEV_ENGINE_GR     ] = &nv50_graph_oclass;
-		device->oclass[NVDEV_ENGINE_VP     ] = &nv84_vp_oclass;
+		device->oclass[NVDEV_ENGINE_VP     ] = &nv98_vp_oclass;
 		device->oclass[NVDEV_ENGINE_CRYPT  ] = &nv98_crypt_oclass;
-		device->oclass[NVDEV_ENGINE_BSP    ] = &nv84_bsp_oclass;
+		device->oclass[NVDEV_ENGINE_BSP    ] = &nv98_bsp_oclass;
 		device->oclass[NVDEV_ENGINE_PPP    ] = &nv98_ppp_oclass;
 		device->oclass[NVDEV_ENGINE_DISP   ] = &nv94_disp_oclass;
 		break;
@@ -305,9 +305,9 @@ nv50_identify(struct nouveau_device *device)
 		device->oclass[NVDEV_ENGINE_FIFO   ] = &nv84_fifo_oclass;
 		device->oclass[NVDEV_ENGINE_SW     ] = &nv50_software_oclass;
 		device->oclass[NVDEV_ENGINE_GR     ] = &nv50_graph_oclass;
-		device->oclass[NVDEV_ENGINE_VP     ] = &nv84_vp_oclass;
+		device->oclass[NVDEV_ENGINE_VP     ] = &nv98_vp_oclass;
 		device->oclass[NVDEV_ENGINE_CRYPT  ] = &nv98_crypt_oclass;
-		device->oclass[NVDEV_ENGINE_BSP    ] = &nv84_bsp_oclass;
+		device->oclass[NVDEV_ENGINE_BSP    ] = &nv98_bsp_oclass;
 		device->oclass[NVDEV_ENGINE_PPP    ] = &nv98_ppp_oclass;
 		device->oclass[NVDEV_ENGINE_DISP   ] = &nv94_disp_oclass;
 		break;
@@ -332,8 +332,8 @@ nv50_identify(struct nouveau_device *device)
 		device->oclass[NVDEV_ENGINE_SW     ] = &nv50_software_oclass;
 		device->oclass[NVDEV_ENGINE_GR     ] = &nv50_graph_oclass;
 		device->oclass[NVDEV_ENGINE_MPEG   ] = &nv84_mpeg_oclass;
-		device->oclass[NVDEV_ENGINE_VP     ] = &nv84_vp_oclass;
-		device->oclass[NVDEV_ENGINE_BSP    ] = &nv84_bsp_oclass;
+		device->oclass[NVDEV_ENGINE_VP     ] = &nv98_vp_oclass;
+		device->oclass[NVDEV_ENGINE_BSP    ] = &nv98_bsp_oclass;
 		device->oclass[NVDEV_ENGINE_PPP    ] = &nv98_ppp_oclass;
 		device->oclass[NVDEV_ENGINE_COPY0  ] = &nva3_copy_oclass;
 		device->oclass[NVDEV_ENGINE_DISP   ] = &nva3_disp_oclass;
@@ -358,8 +358,8 @@ nv50_identify(struct nouveau_device *device)
 		device->oclass[NVDEV_ENGINE_FIFO   ] = &nv84_fifo_oclass;
 		device->oclass[NVDEV_ENGINE_SW     ] = &nv50_software_oclass;
 		device->oclass[NVDEV_ENGINE_GR     ] = &nv50_graph_oclass;
-		device->oclass[NVDEV_ENGINE_VP     ] = &nv84_vp_oclass;
-		device->oclass[NVDEV_ENGINE_BSP    ] = &nv84_bsp_oclass;
+		device->oclass[NVDEV_ENGINE_VP     ] = &nv98_vp_oclass;
+		device->oclass[NVDEV_ENGINE_BSP    ] = &nv98_bsp_oclass;
 		device->oclass[NVDEV_ENGINE_PPP    ] = &nv98_ppp_oclass;
 		device->oclass[NVDEV_ENGINE_COPY0  ] = &nva3_copy_oclass;
 		device->oclass[NVDEV_ENGINE_DISP   ] = &nva3_disp_oclass;
@@ -384,8 +384,8 @@ nv50_identify(struct nouveau_device *device)
 		device->oclass[NVDEV_ENGINE_FIFO   ] = &nv84_fifo_oclass;
 		device->oclass[NVDEV_ENGINE_SW     ] = &nv50_software_oclass;
 		device->oclass[NVDEV_ENGINE_GR     ] = &nv50_graph_oclass;
-		device->oclass[NVDEV_ENGINE_VP     ] = &nv84_vp_oclass;
-		device->oclass[NVDEV_ENGINE_BSP    ] = &nv84_bsp_oclass;
+		device->oclass[NVDEV_ENGINE_VP     ] = &nv98_vp_oclass;
+		device->oclass[NVDEV_ENGINE_BSP    ] = &nv98_bsp_oclass;
 		device->oclass[NVDEV_ENGINE_PPP    ] = &nv98_ppp_oclass;
 		device->oclass[NVDEV_ENGINE_COPY0  ] = &nva3_copy_oclass;
 		device->oclass[NVDEV_ENGINE_DISP   ] = &nva3_disp_oclass;
@@ -410,8 +410,8 @@ nv50_identify(struct nouveau_device *device)
 		device->oclass[NVDEV_ENGINE_FIFO   ] = &nv84_fifo_oclass;
 		device->oclass[NVDEV_ENGINE_SW     ] = &nv50_software_oclass;
 		device->oclass[NVDEV_ENGINE_GR     ] = &nv50_graph_oclass;
-		device->oclass[NVDEV_ENGINE_VP     ] = &nv84_vp_oclass;
-		device->oclass[NVDEV_ENGINE_BSP    ] = &nv84_bsp_oclass;
+		device->oclass[NVDEV_ENGINE_VP     ] = &nv98_vp_oclass;
+		device->oclass[NVDEV_ENGINE_BSP    ] = &nv98_bsp_oclass;
 		device->oclass[NVDEV_ENGINE_PPP    ] = &nv98_ppp_oclass;
 		device->oclass[NVDEV_ENGINE_COPY0  ] = &nva3_copy_oclass;
 		device->oclass[NVDEV_ENGINE_DISP   ] = &nva3_disp_oclass;
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
index 261cd96..0450a2d 100644
--- a/drivers/gpu/drm/nouveau/core/engine/vp/nv84.c
+++ b/drivers/gpu/drm/nouveau/core/engine/vp/nv84.c
@@ -19,24 +19,20 @@
  * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
  * OTHER DEALINGS IN THE SOFTWARE.
  *
- * Authors: Ben Skeggs
+ * Authors: Ben Skeggs, Ilia Mirkin
  */
 
-#include <core/engctx.h>
-#include <core/class.h>
+#include <core/xtensa.h>
 
 #include <engine/vp.h>
 
-struct nv84_vp_priv {
-	struct nouveau_engine base;
-};
-
 /*******************************************************************************
  * VP object classes
  ******************************************************************************/
 
 static struct nouveau_oclass
 nv84_vp_sclass[] = {
+	{ 0x7476, &nouveau_object_ofuncs },
 	{},
 };
 
@@ -48,7 +44,7 @@ static struct nouveau_oclass
 nv84_vp_cclass = {
 	.handle = NV_ENGCTX(VP, 0x84),
 	.ofuncs = &(struct nouveau_ofuncs) {
-		.ctor = _nouveau_engctx_ctor,
+		.ctor = _nouveau_xtensa_engctx_ctor,
 		.dtor = _nouveau_engctx_dtor,
 		.init = _nouveau_engctx_init,
 		.fini = _nouveau_engctx_fini,
@@ -66,10 +62,10 @@ nv84_vp_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 	     struct nouveau_oclass *oclass, void *data, u32 size,
 	     struct nouveau_object **pobject)
 {
-	struct nv84_vp_priv *priv;
+	struct nouveau_xtensa *priv;
 	int ret;
 
-	ret = nouveau_engine_create(parent, engine, oclass, true,
+	ret = nouveau_xtensa_create(parent, engine, oclass, 0xf000, true,
 				    "PVP", "vp", &priv);
 	*pobject = nv_object(priv);
 	if (ret)
@@ -78,6 +74,10 @@ nv84_vp_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 	nv_subdev(priv)->unit = 0x01020000;
 	nv_engine(priv)->cclass = &nv84_vp_cclass;
 	nv_engine(priv)->sclass = nv84_vp_sclass;
+	priv->fifo_val = 0x111;
+	priv->fifo_nibble = 3;
+	priv->unkd28 = 0x9c544;
+	priv->firmware_fname = "nouveau/nv84_vp";
 	return 0;
 }
 
@@ -86,8 +86,10 @@ nv84_vp_oclass = {
 	.handle = NV_ENGINE(VP, 0x84),
 	.ofuncs = &(struct nouveau_ofuncs) {
 		.ctor = nv84_vp_ctor,
-		.dtor = _nouveau_engine_dtor,
-		.init = _nouveau_engine_init,
-		.fini = _nouveau_engine_fini,
+		.dtor = _nouveau_xtensa_dtor,
+		.init = _nouveau_xtensa_init,
+		.fini = _nouveau_xtensa_fini,
+		.rd32 = _nouveau_xtensa_rd32,
+		.wr32 = _nouveau_xtensa_wr32,
 	},
 };
diff --git a/drivers/gpu/drm/nouveau/core/engine/vp/nv84.c b/drivers/gpu/drm/nouveau/core/engine/vp/nv98.c
similarity index 88%
copy from drivers/gpu/drm/nouveau/core/engine/vp/nv84.c
copy to drivers/gpu/drm/nouveau/core/engine/vp/nv98.c
index 261cd96..8a8236b 100644
--- a/drivers/gpu/drm/nouveau/core/engine/vp/nv84.c
+++ b/drivers/gpu/drm/nouveau/core/engine/vp/nv98.c
@@ -27,7 +27,7 @@
 
 #include <engine/vp.h>
 
-struct nv84_vp_priv {
+struct nv98_vp_priv {
 	struct nouveau_engine base;
 };
 
@@ -36,7 +36,7 @@ struct nv84_vp_priv {
  ******************************************************************************/
 
 static struct nouveau_oclass
-nv84_vp_sclass[] = {
+nv98_vp_sclass[] = {
 	{},
 };
 
@@ -45,8 +45,8 @@ nv84_vp_sclass[] = {
  ******************************************************************************/
 
 static struct nouveau_oclass
-nv84_vp_cclass = {
-	.handle = NV_ENGCTX(VP, 0x84),
+nv98_vp_cclass = {
+	.handle = NV_ENGCTX(VP, 0x98),
 	.ofuncs = &(struct nouveau_ofuncs) {
 		.ctor = _nouveau_engctx_ctor,
 		.dtor = _nouveau_engctx_dtor,
@@ -62,11 +62,11 @@ nv84_vp_cclass = {
  ******************************************************************************/
 
 static int
-nv84_vp_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
+nv98_vp_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 	     struct nouveau_oclass *oclass, void *data, u32 size,
 	     struct nouveau_object **pobject)
 {
-	struct nv84_vp_priv *priv;
+	struct nv98_vp_priv *priv;
 	int ret;
 
 	ret = nouveau_engine_create(parent, engine, oclass, true,
@@ -76,16 +76,16 @@ nv84_vp_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 		return ret;
 
 	nv_subdev(priv)->unit = 0x01020000;
-	nv_engine(priv)->cclass = &nv84_vp_cclass;
-	nv_engine(priv)->sclass = nv84_vp_sclass;
+	nv_engine(priv)->cclass = &nv98_vp_cclass;
+	nv_engine(priv)->sclass = nv98_vp_sclass;
 	return 0;
 }
 
 struct nouveau_oclass
-nv84_vp_oclass = {
-	.handle = NV_ENGINE(VP, 0x84),
+nv98_vp_oclass = {
+	.handle = NV_ENGINE(VP, 0x98),
 	.ofuncs = &(struct nouveau_ofuncs) {
-		.ctor = nv84_vp_ctor,
+		.ctor = nv98_vp_ctor,
 		.dtor = _nouveau_engine_dtor,
 		.init = _nouveau_engine_init,
 		.fini = _nouveau_engine_fini,
diff --git a/drivers/gpu/drm/nouveau/core/include/core/xtensa.h b/drivers/gpu/drm/nouveau/core/include/core/xtensa.h
new file mode 100644
index 0000000..bc7eaf8
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/core/include/core/xtensa.h
@@ -0,0 +1,40 @@
+#ifndef __NOUVEAU_XTENSA_H__
+#define __NOUVEAU_XTENSA_H__
+
+#include <core/engine.h>
+#include <core/engctx.h>
+#include <core/gpuobj.h>
+
+struct nouveau_xtensa {
+	struct nouveau_engine base;
+
+	u32 addr;
+	struct nouveau_gpuobj *gpu_fw;
+	const char *firmware_fname;
+	u32 fifo_val;
+	u8 fifo_nibble;
+	u32 unkd28;
+};
+
+#define nouveau_xtensa_create(p,e,c,b,d,i,f,r)				\
+	nouveau_xtensa_create_((p), (e), (c), (b), (d), (i), (f),	\
+			       sizeof(**r),(void **)r)
+
+int _nouveau_xtensa_engctx_ctor(struct nouveau_object *,
+				struct nouveau_object *,
+				struct nouveau_oclass *, void *, u32,
+				struct nouveau_object **);
+
+void _nouveau_xtensa_intr(struct nouveau_subdev *);
+int nouveau_xtensa_create_(struct nouveau_object *,
+			   struct nouveau_object *,
+			   struct nouveau_oclass *, u32, bool,
+			   const char *, const char *,
+			   int, void **);
+#define _nouveau_xtensa_dtor _nouveau_engine_dtor
+int _nouveau_xtensa_init(struct nouveau_object *);
+int _nouveau_xtensa_fini(struct nouveau_object *, bool);
+u32  _nouveau_xtensa_rd32(struct nouveau_object *, u64);
+void _nouveau_xtensa_wr32(struct nouveau_object *, u64, u32);
+
+#endif
diff --git a/drivers/gpu/drm/nouveau/core/include/engine/bsp.h b/drivers/gpu/drm/nouveau/core/include/engine/bsp.h
index 13ccdf5..67662e2 100644
--- a/drivers/gpu/drm/nouveau/core/include/engine/bsp.h
+++ b/drivers/gpu/drm/nouveau/core/include/engine/bsp.h
@@ -2,6 +2,7 @@
 #define __NOUVEAU_BSP_H__
 
 extern struct nouveau_oclass nv84_bsp_oclass;
+extern struct nouveau_oclass nv98_bsp_oclass;
 extern struct nouveau_oclass nvc0_bsp_oclass;
 extern struct nouveau_oclass nve0_bsp_oclass;
 
diff --git a/drivers/gpu/drm/nouveau/core/include/engine/vp.h b/drivers/gpu/drm/nouveau/core/include/engine/vp.h
index d7b287b..39baebe 100644
--- a/drivers/gpu/drm/nouveau/core/include/engine/vp.h
+++ b/drivers/gpu/drm/nouveau/core/include/engine/vp.h
@@ -2,6 +2,7 @@
 #define __NOUVEAU_VP_H__
 
 extern struct nouveau_oclass nv84_vp_oclass;
+extern struct nouveau_oclass nv98_vp_oclass;
 extern struct nouveau_oclass nvc0_vp_oclass;
 extern struct nouveau_oclass nve0_vp_oclass;
 
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
index 5de0756..9ecc5f9 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/vm/nv50.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/vm/nv50.c
@@ -172,8 +172,10 @@ nv50_vm_flush(struct nouveau_vm *vm)
 
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

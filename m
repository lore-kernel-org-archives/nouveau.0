From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH 2/5] drm/nv44/mpeg: create a copy of the nv31/nv40
	impls
Date: Sat,  7 Sep 2013 21:04:09 -0400
Message-ID: <1378602252-11521-2-git-send-email-imirkin@alum.mit.edu>
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

The nv31/nv40 impls are actually fairly nv44-specific, since they assume
the presence of the instance register/context switching. Create a copy
before nv31/nv40 get fixed.

Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
---
 drivers/gpu/drm/nouveau/Makefile                   |   1 +
 drivers/gpu/drm/nouveau/core/engine/device/nv40.c  |  24 +--
 drivers/gpu/drm/nouveau/core/engine/mpeg/nv44.c    | 194 +++++++++++++++++++++
 drivers/gpu/drm/nouveau/core/include/engine/mpeg.h |   1 +
 4 files changed, 208 insertions(+), 12 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/core/engine/mpeg/nv44.c

diff --git a/drivers/gpu/drm/nouveau/Makefile b/drivers/gpu/drm/nouveau/Makefile
index d939a1d..56b35b2 100644
--- a/drivers/gpu/drm/nouveau/Makefile
+++ b/drivers/gpu/drm/nouveau/Makefile
@@ -227,6 +227,7 @@ nouveau-y += core/engine/graph/nve4.o
 nouveau-y += core/engine/graph/nvf0.o
 nouveau-y += core/engine/mpeg/nv31.o
 nouveau-y += core/engine/mpeg/nv40.o
+nouveau-y += core/engine/mpeg/nv44.o
 nouveau-y += core/engine/mpeg/nv50.o
 nouveau-y += core/engine/mpeg/nv84.o
 nouveau-y += core/engine/ppp/nv98.o
diff --git a/drivers/gpu/drm/nouveau/core/engine/device/nv40.c b/drivers/gpu/drm/nouveau/core/engine/device/nv40.c
index 1719cb0..daf492c 100644
--- a/drivers/gpu/drm/nouveau/core/engine/device/nv40.c
+++ b/drivers/gpu/drm/nouveau/core/engine/device/nv40.c
@@ -150,7 +150,7 @@ nv40_identify(struct nouveau_device *device)
 		device->oclass[NVDEV_ENGINE_FIFO   ] = &nv40_fifo_oclass;
 		device->oclass[NVDEV_ENGINE_SW     ] = &nv10_software_oclass;
 		device->oclass[NVDEV_ENGINE_GR     ] = &nv40_graph_oclass;
-		device->oclass[NVDEV_ENGINE_MPEG   ] = &nv40_mpeg_oclass;
+		device->oclass[NVDEV_ENGINE_MPEG   ] = &nv44_mpeg_oclass;
 		device->oclass[NVDEV_ENGINE_DISP   ] = &nv04_disp_oclass;
 		break;
 	case 0x47:
@@ -171,7 +171,7 @@ nv40_identify(struct nouveau_device *device)
 		device->oclass[NVDEV_ENGINE_FIFO   ] = &nv40_fifo_oclass;
 		device->oclass[NVDEV_ENGINE_SW     ] = &nv10_software_oclass;
 		device->oclass[NVDEV_ENGINE_GR     ] = &nv40_graph_oclass;
-		device->oclass[NVDEV_ENGINE_MPEG   ] = &nv40_mpeg_oclass;
+		device->oclass[NVDEV_ENGINE_MPEG   ] = &nv44_mpeg_oclass;
 		device->oclass[NVDEV_ENGINE_DISP   ] = &nv04_disp_oclass;
 		break;
 	case 0x49:
@@ -192,7 +192,7 @@ nv40_identify(struct nouveau_device *device)
 		device->oclass[NVDEV_ENGINE_FIFO   ] = &nv40_fifo_oclass;
 		device->oclass[NVDEV_ENGINE_SW     ] = &nv10_software_oclass;
 		device->oclass[NVDEV_ENGINE_GR     ] = &nv40_graph_oclass;
-		device->oclass[NVDEV_ENGINE_MPEG   ] = &nv40_mpeg_oclass;
+		device->oclass[NVDEV_ENGINE_MPEG   ] = &nv44_mpeg_oclass;
 		device->oclass[NVDEV_ENGINE_DISP   ] = &nv04_disp_oclass;
 		break;
 	case 0x4b:
@@ -213,7 +213,7 @@ nv40_identify(struct nouveau_device *device)
 		device->oclass[NVDEV_ENGINE_FIFO   ] = &nv40_fifo_oclass;
 		device->oclass[NVDEV_ENGINE_SW     ] = &nv10_software_oclass;
 		device->oclass[NVDEV_ENGINE_GR     ] = &nv40_graph_oclass;
-		device->oclass[NVDEV_ENGINE_MPEG   ] = &nv40_mpeg_oclass;
+		device->oclass[NVDEV_ENGINE_MPEG   ] = &nv44_mpeg_oclass;
 		device->oclass[NVDEV_ENGINE_DISP   ] = &nv04_disp_oclass;
 		break;
 	case 0x44:
@@ -234,7 +234,7 @@ nv40_identify(struct nouveau_device *device)
 		device->oclass[NVDEV_ENGINE_FIFO   ] = &nv40_fifo_oclass;
 		device->oclass[NVDEV_ENGINE_SW     ] = &nv10_software_oclass;
 		device->oclass[NVDEV_ENGINE_GR     ] = &nv40_graph_oclass;
-		device->oclass[NVDEV_ENGINE_MPEG   ] = &nv40_mpeg_oclass;
+		device->oclass[NVDEV_ENGINE_MPEG   ] = &nv44_mpeg_oclass;
 		device->oclass[NVDEV_ENGINE_DISP   ] = &nv04_disp_oclass;
 		break;
 	case 0x46:
@@ -255,7 +255,7 @@ nv40_identify(struct nouveau_device *device)
 		device->oclass[NVDEV_ENGINE_FIFO   ] = &nv40_fifo_oclass;
 		device->oclass[NVDEV_ENGINE_SW     ] = &nv10_software_oclass;
 		device->oclass[NVDEV_ENGINE_GR     ] = &nv40_graph_oclass;
-		device->oclass[NVDEV_ENGINE_MPEG   ] = &nv40_mpeg_oclass;
+		device->oclass[NVDEV_ENGINE_MPEG   ] = &nv44_mpeg_oclass;
 		device->oclass[NVDEV_ENGINE_DISP   ] = &nv04_disp_oclass;
 		break;
 	case 0x4a:
@@ -276,7 +276,7 @@ nv40_identify(struct nouveau_device *device)
 		device->oclass[NVDEV_ENGINE_FIFO   ] = &nv40_fifo_oclass;
 		device->oclass[NVDEV_ENGINE_SW     ] = &nv10_software_oclass;
 		device->oclass[NVDEV_ENGINE_GR     ] = &nv40_graph_oclass;
-		device->oclass[NVDEV_ENGINE_MPEG   ] = &nv40_mpeg_oclass;
+		device->oclass[NVDEV_ENGINE_MPEG   ] = &nv44_mpeg_oclass;
 		device->oclass[NVDEV_ENGINE_DISP   ] = &nv04_disp_oclass;
 		break;
 	case 0x4c:
@@ -297,7 +297,7 @@ nv40_identify(struct nouveau_device *device)
 		device->oclass[NVDEV_ENGINE_FIFO   ] = &nv40_fifo_oclass;
 		device->oclass[NVDEV_ENGINE_SW     ] = &nv10_software_oclass;
 		device->oclass[NVDEV_ENGINE_GR     ] = &nv40_graph_oclass;
-		device->oclass[NVDEV_ENGINE_MPEG   ] = &nv40_mpeg_oclass;
+		device->oclass[NVDEV_ENGINE_MPEG   ] = &nv44_mpeg_oclass;
 		device->oclass[NVDEV_ENGINE_DISP   ] = &nv04_disp_oclass;
 		break;
 	case 0x4e:
@@ -318,7 +318,7 @@ nv40_identify(struct nouveau_device *device)
 		device->oclass[NVDEV_ENGINE_FIFO   ] = &nv40_fifo_oclass;
 		device->oclass[NVDEV_ENGINE_SW     ] = &nv10_software_oclass;
 		device->oclass[NVDEV_ENGINE_GR     ] = &nv40_graph_oclass;
-		device->oclass[NVDEV_ENGINE_MPEG   ] = &nv40_mpeg_oclass;
+		device->oclass[NVDEV_ENGINE_MPEG   ] = &nv44_mpeg_oclass;
 		device->oclass[NVDEV_ENGINE_DISP   ] = &nv04_disp_oclass;
 		break;
 	case 0x63:
@@ -339,7 +339,7 @@ nv40_identify(struct nouveau_device *device)
 		device->oclass[NVDEV_ENGINE_FIFO   ] = &nv40_fifo_oclass;
 		device->oclass[NVDEV_ENGINE_SW     ] = &nv10_software_oclass;
 		device->oclass[NVDEV_ENGINE_GR     ] = &nv40_graph_oclass;
-		device->oclass[NVDEV_ENGINE_MPEG   ] = &nv40_mpeg_oclass;
+		device->oclass[NVDEV_ENGINE_MPEG   ] = &nv44_mpeg_oclass;
 		device->oclass[NVDEV_ENGINE_DISP   ] = &nv04_disp_oclass;
 		break;
 	case 0x67:
@@ -360,7 +360,7 @@ nv40_identify(struct nouveau_device *device)
 		device->oclass[NVDEV_ENGINE_FIFO   ] = &nv40_fifo_oclass;
 		device->oclass[NVDEV_ENGINE_SW     ] = &nv10_software_oclass;
 		device->oclass[NVDEV_ENGINE_GR     ] = &nv40_graph_oclass;
-		device->oclass[NVDEV_ENGINE_MPEG   ] = &nv40_mpeg_oclass;
+		device->oclass[NVDEV_ENGINE_MPEG   ] = &nv44_mpeg_oclass;
 		device->oclass[NVDEV_ENGINE_DISP   ] = &nv04_disp_oclass;
 		break;
 	case 0x68:
@@ -381,7 +381,7 @@ nv40_identify(struct nouveau_device *device)
 		device->oclass[NVDEV_ENGINE_FIFO   ] = &nv40_fifo_oclass;
 		device->oclass[NVDEV_ENGINE_SW     ] = &nv10_software_oclass;
 		device->oclass[NVDEV_ENGINE_GR     ] = &nv40_graph_oclass;
-		device->oclass[NVDEV_ENGINE_MPEG   ] = &nv40_mpeg_oclass;
+		device->oclass[NVDEV_ENGINE_MPEG   ] = &nv44_mpeg_oclass;
 		device->oclass[NVDEV_ENGINE_DISP   ] = &nv04_disp_oclass;
 		break;
 	default:
diff --git a/drivers/gpu/drm/nouveau/core/engine/mpeg/nv44.c b/drivers/gpu/drm/nouveau/core/engine/mpeg/nv44.c
new file mode 100644
index 0000000..012b95d
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/core/engine/mpeg/nv44.c
@@ -0,0 +1,194 @@
+/*
+ * Copyright 2012 Red Hat Inc.
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
+ *
+ * Authors: Ben Skeggs
+ */
+
+#include <core/os.h>
+#include <core/class.h>
+#include <core/client.h>
+#include <core/engctx.h>
+#include <core/handle.h>
+
+#include <subdev/fb.h>
+#include <subdev/timer.h>
+#include <subdev/instmem.h>
+
+#include <engine/fifo.h>
+#include <engine/mpeg.h>
+
+struct nv44_mpeg_priv {
+	struct nouveau_mpeg base;
+};
+
+struct nv44_mpeg_chan {
+	struct nouveau_mpeg_chan base;
+};
+
+/*******************************************************************************
+ * PMPEG context
+ ******************************************************************************/
+
+static int
+nv44_mpeg_context_ctor(struct nouveau_object *parent,
+		       struct nouveau_object *engine,
+		       struct nouveau_oclass *oclass, void *data, u32 size,
+		       struct nouveau_object **pobject)
+{
+	struct nv44_mpeg_chan *chan;
+	int ret;
+
+	ret = nouveau_mpeg_context_create(parent, engine, oclass, NULL,
+					  264 * 4, 16,
+					  NVOBJ_FLAG_ZERO_ALLOC, &chan);
+	*pobject = nv_object(chan);
+	if (ret)
+		return ret;
+
+	nv_wo32(&chan->base.base, 0x78, 0x02001ec1);
+	return 0;
+}
+
+static int
+nv44_mpeg_context_fini(struct nouveau_object *object, bool suspend)
+{
+
+	struct nv44_mpeg_priv *priv = (void *)object->engine;
+	struct nv44_mpeg_chan *chan = (void *)object;
+	u32 inst = 0x80000000 | nv_gpuobj(chan)->addr >> 4;
+
+	nv_mask(priv, 0x00b32c, 0x00000001, 0x00000000);
+	if (nv_rd32(priv, 0x00b318) == inst)
+		nv_mask(priv, 0x00b318, 0x80000000, 0x00000000);
+	nv_mask(priv, 0x00b32c, 0x00000001, 0x00000001);
+	return 0;
+}
+
+static struct nouveau_oclass
+nv44_mpeg_cclass = {
+	.handle = NV_ENGCTX(MPEG, 0x44),
+	.ofuncs = &(struct nouveau_ofuncs) {
+		.ctor = nv44_mpeg_context_ctor,
+		.dtor = _nouveau_mpeg_context_dtor,
+		.init = _nouveau_mpeg_context_init,
+		.fini = nv44_mpeg_context_fini,
+		.rd32 = _nouveau_mpeg_context_rd32,
+		.wr32 = _nouveau_mpeg_context_wr32,
+	},
+};
+
+/*******************************************************************************
+ * PMPEG engine/subdev functions
+ ******************************************************************************/
+
+static void
+nv44_mpeg_intr(struct nouveau_subdev *subdev)
+{
+	struct nouveau_fifo *pfifo = nouveau_fifo(subdev);
+	struct nouveau_engine *engine = nv_engine(subdev);
+	struct nouveau_object *engctx;
+	struct nouveau_handle *handle;
+	struct nv44_mpeg_priv *priv = (void *)subdev;
+	u32 inst = nv_rd32(priv, 0x00b318) & 0x000fffff;
+	u32 stat = nv_rd32(priv, 0x00b100);
+	u32 type = nv_rd32(priv, 0x00b230);
+	u32 mthd = nv_rd32(priv, 0x00b234);
+	u32 data = nv_rd32(priv, 0x00b238);
+	u32 show = stat;
+	int chid;
+
+	engctx = nouveau_engctx_get(engine, inst);
+	chid   = pfifo->chid(pfifo, engctx);
+
+	if (stat & 0x01000000) {
+		/* happens on initial binding of the object */
+		if (type == 0x00000020 && mthd == 0x0000) {
+			nv_mask(priv, 0x00b308, 0x00000000, 0x00000000);
+			show &= ~0x01000000;
+		}
+
+		if (type == 0x00000010) {
+			handle = nouveau_handle_get_class(engctx, 0x3174);
+			if (handle && !nv_call(handle->object, mthd, data))
+				show &= ~0x01000000;
+			nouveau_handle_put(handle);
+		}
+	}
+
+	nv_wr32(priv, 0x00b100, stat);
+	nv_wr32(priv, 0x00b230, 0x00000001);
+
+	if (show) {
+		nv_error(priv,
+			 "ch %d [0x%08x %s] 0x%08x 0x%08x 0x%08x 0x%08x\n",
+			 chid, inst << 4, nouveau_client_name(engctx), stat,
+			 type, mthd, data);
+	}
+
+	nouveau_engctx_put(engctx);
+}
+
+static void
+nv44_mpeg_me_intr(struct nouveau_subdev *subdev)
+{
+	struct nv44_mpeg_priv *priv = (void *)subdev;
+	u32 stat;
+
+	if ((stat = nv_rd32(priv, 0x00b100)))
+		nv44_mpeg_intr(subdev);
+
+	if ((stat = nv_rd32(priv, 0x00b800))) {
+		nv_error(priv, "PMSRCH 0x%08x\n", stat);
+		nv_wr32(priv, 0x00b800, stat);
+	}
+}
+
+static int
+nv44_mpeg_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
+	       struct nouveau_oclass *oclass, void *data, u32 size,
+	       struct nouveau_object **pobject)
+{
+	struct nv44_mpeg_priv *priv;
+	int ret;
+
+	ret = nouveau_mpeg_create(parent, engine, oclass, &priv);
+	*pobject = nv_object(priv);
+	if (ret)
+		return ret;
+
+	nv_subdev(priv)->unit = 0x00000002;
+	nv_subdev(priv)->intr = nv44_mpeg_me_intr;
+	nv_engine(priv)->cclass = &nv44_mpeg_cclass;
+	nv_engine(priv)->sclass = nv31_mpeg_sclass;
+	nv_engine(priv)->tile_prog = nv31_mpeg_tile_prog;
+	return 0;
+}
+
+struct nouveau_oclass
+nv44_mpeg_oclass = {
+	.handle = NV_ENGINE(MPEG, 0x44),
+	.ofuncs = &(struct nouveau_ofuncs) {
+		.ctor = nv44_mpeg_ctor,
+		.dtor = _nouveau_mpeg_dtor,
+		.init = nv31_mpeg_init,
+		.fini = _nouveau_mpeg_fini,
+	},
+};
diff --git a/drivers/gpu/drm/nouveau/core/include/engine/mpeg.h b/drivers/gpu/drm/nouveau/core/include/engine/mpeg.h
index 1d1a89a..6f4263d 100644
--- a/drivers/gpu/drm/nouveau/core/include/engine/mpeg.h
+++ b/drivers/gpu/drm/nouveau/core/include/engine/mpeg.h
@@ -42,6 +42,7 @@ struct nouveau_mpeg {
 
 extern struct nouveau_oclass nv31_mpeg_oclass;
 extern struct nouveau_oclass nv40_mpeg_oclass;
+extern struct nouveau_oclass nv44_mpeg_oclass;
 extern struct nouveau_oclass nv50_mpeg_oclass;
 extern struct nouveau_oclass nv84_mpeg_oclass;
 
-- 
1.8.1.5

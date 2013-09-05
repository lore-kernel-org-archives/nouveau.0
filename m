From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH 7/7] drm/nv40/mpeg: nv40 -> nv44,
	and point nv40-nv43 to the nv31 impl
Date: Thu,  5 Sep 2013 04:45:06 -0400
Message-ID: <1378370706-18599-7-git-send-email-imirkin@alum.mit.edu>
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

This enables the one-decoder-at-a-time logic for nv40-nv43, and
removes the unnecessary context setup.

Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
---
 drivers/gpu/drm/nouveau/Makefile                   |  2 +-
 drivers/gpu/drm/nouveau/core/engine/device/nv40.c  | 32 +++++++++---------
 .../nouveau/core/engine/mpeg/{nv40.c => nv44.c}    | 38 +++++++++++-----------
 drivers/gpu/drm/nouveau/core/include/engine/mpeg.h |  2 +-
 4 files changed, 37 insertions(+), 37 deletions(-)
 rename drivers/gpu/drm/nouveau/core/engine/mpeg/{nv40.c => nv44.c} (82%)

diff --git a/drivers/gpu/drm/nouveau/Makefile b/drivers/gpu/drm/nouveau/Makefile
index d939a1d..e8cb578 100644
--- a/drivers/gpu/drm/nouveau/Makefile
+++ b/drivers/gpu/drm/nouveau/Makefile
@@ -226,7 +226,7 @@ nouveau-y += core/engine/graph/nvd9.o
 nouveau-y += core/engine/graph/nve4.o
 nouveau-y += core/engine/graph/nvf0.o
 nouveau-y += core/engine/mpeg/nv31.o
-nouveau-y += core/engine/mpeg/nv40.o
+nouveau-y += core/engine/mpeg/nv44.o
 nouveau-y += core/engine/mpeg/nv50.o
 nouveau-y += core/engine/mpeg/nv84.o
 nouveau-y += core/engine/ppp/nv98.o
diff --git a/drivers/gpu/drm/nouveau/core/engine/device/nv40.c b/drivers/gpu/drm/nouveau/core/engine/device/nv40.c
index 1719cb0..0e52942 100644
--- a/drivers/gpu/drm/nouveau/core/engine/device/nv40.c
+++ b/drivers/gpu/drm/nouveau/core/engine/device/nv40.c
@@ -66,7 +66,7 @@ nv40_identify(struct nouveau_device *device)
 		device->oclass[NVDEV_ENGINE_FIFO   ] = &nv40_fifo_oclass;
 		device->oclass[NVDEV_ENGINE_SW     ] = &nv10_software_oclass;
 		device->oclass[NVDEV_ENGINE_GR     ] = &nv40_graph_oclass;
-		device->oclass[NVDEV_ENGINE_MPEG   ] = &nv40_mpeg_oclass;
+		device->oclass[NVDEV_ENGINE_MPEG   ] = &nv31_mpeg_oclass;
 		device->oclass[NVDEV_ENGINE_DISP   ] = &nv04_disp_oclass;
 		break;
 	case 0x41:
@@ -87,7 +87,7 @@ nv40_identify(struct nouveau_device *device)
 		device->oclass[NVDEV_ENGINE_FIFO   ] = &nv40_fifo_oclass;
 		device->oclass[NVDEV_ENGINE_SW     ] = &nv10_software_oclass;
 		device->oclass[NVDEV_ENGINE_GR     ] = &nv40_graph_oclass;
-		device->oclass[NVDEV_ENGINE_MPEG   ] = &nv40_mpeg_oclass;
+		device->oclass[NVDEV_ENGINE_MPEG   ] = &nv31_mpeg_oclass;
 		device->oclass[NVDEV_ENGINE_DISP   ] = &nv04_disp_oclass;
 		break;
 	case 0x42:
@@ -108,7 +108,7 @@ nv40_identify(struct nouveau_device *device)
 		device->oclass[NVDEV_ENGINE_FIFO   ] = &nv40_fifo_oclass;
 		device->oclass[NVDEV_ENGINE_SW     ] = &nv10_software_oclass;
 		device->oclass[NVDEV_ENGINE_GR     ] = &nv40_graph_oclass;
-		device->oclass[NVDEV_ENGINE_MPEG   ] = &nv40_mpeg_oclass;
+		device->oclass[NVDEV_ENGINE_MPEG   ] = &nv31_mpeg_oclass;
 		device->oclass[NVDEV_ENGINE_DISP   ] = &nv04_disp_oclass;
 		break;
 	case 0x43:
@@ -129,7 +129,7 @@ nv40_identify(struct nouveau_device *device)
 		device->oclass[NVDEV_ENGINE_FIFO   ] = &nv40_fifo_oclass;
 		device->oclass[NVDEV_ENGINE_SW     ] = &nv10_software_oclass;
 		device->oclass[NVDEV_ENGINE_GR     ] = &nv40_graph_oclass;
-		device->oclass[NVDEV_ENGINE_MPEG   ] = &nv40_mpeg_oclass;
+		device->oclass[NVDEV_ENGINE_MPEG   ] = &nv31_mpeg_oclass;
 		device->oclass[NVDEV_ENGINE_DISP   ] = &nv04_disp_oclass;
 		break;
 	case 0x45:
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
diff --git a/drivers/gpu/drm/nouveau/core/engine/mpeg/nv40.c b/drivers/gpu/drm/nouveau/core/engine/mpeg/nv44.c
similarity index 82%
rename from drivers/gpu/drm/nouveau/core/engine/mpeg/nv40.c
rename to drivers/gpu/drm/nouveau/core/engine/mpeg/nv44.c
index dd61960..8a2fb65 100644
--- a/drivers/gpu/drm/nouveau/core/engine/mpeg/nv40.c
+++ b/drivers/gpu/drm/nouveau/core/engine/mpeg/nv44.c
@@ -33,11 +33,11 @@
 #include <engine/mpeg.h>
 #include <engine/graph/nv40.h>
 
-struct nv40_mpeg_priv {
+struct nv44_mpeg_priv {
 	struct nouveau_mpeg base;
 };
 
-struct nv40_mpeg_chan {
+struct nv44_mpeg_chan {
 	struct nouveau_mpeg_chan base;
 };
 
@@ -46,12 +46,12 @@ struct nv40_mpeg_chan {
  ******************************************************************************/
 
 static int
-nv40_mpeg_context_ctor(struct nouveau_object *parent,
+nv44_mpeg_context_ctor(struct nouveau_object *parent,
 		       struct nouveau_object *engine,
 		       struct nouveau_oclass *oclass, void *data, u32 size,
 		       struct nouveau_object **pobject)
 {
-	struct nv40_mpeg_chan *chan;
+	struct nv44_mpeg_chan *chan;
 	int ret;
 
 	ret = nouveau_mpeg_context_create(parent, engine, oclass, NULL,
@@ -66,11 +66,11 @@ nv40_mpeg_context_ctor(struct nouveau_object *parent,
 }
 
 static int
-nv40_mpeg_context_fini(struct nouveau_object *object, bool suspend)
+nv44_mpeg_context_fini(struct nouveau_object *object, bool suspend)
 {
 
-	struct nv40_mpeg_priv *priv = (void *)object->engine;
-	struct nv40_mpeg_chan *chan = (void *)object;
+	struct nv44_mpeg_priv *priv = (void *)object->engine;
+	struct nv44_mpeg_chan *chan = (void *)object;
 	u32 inst = 0x80000000 | nv_gpuobj(chan)->addr >> 4;
 
 	nv_mask(priv, 0x00b32c, 0x00000001, 0x00000000);
@@ -81,13 +81,13 @@ nv40_mpeg_context_fini(struct nouveau_object *object, bool suspend)
 }
 
 static struct nouveau_oclass
-nv40_mpeg_cclass = {
+nv44_mpeg_cclass = {
 	.handle = NV_ENGCTX(MPEG, 0x40),
 	.ofuncs = &(struct nouveau_ofuncs) {
-		.ctor = nv40_mpeg_context_ctor,
+		.ctor = nv44_mpeg_context_ctor,
 		.dtor = _nouveau_mpeg_context_dtor,
 		.init = _nouveau_mpeg_context_init,
-		.fini = nv40_mpeg_context_fini,
+		.fini = nv44_mpeg_context_fini,
 		.rd32 = _nouveau_mpeg_context_rd32,
 		.wr32 = _nouveau_mpeg_context_wr32,
 	},
@@ -98,9 +98,9 @@ nv40_mpeg_cclass = {
  ******************************************************************************/
 
 static void
-nv40_mpeg_intr(struct nouveau_subdev *subdev)
+nv44_mpeg_intr(struct nouveau_subdev *subdev)
 {
-	struct nv40_mpeg_priv *priv = (void *)subdev;
+	struct nv44_mpeg_priv *priv = (void *)subdev;
 	u32 stat;
 
 	if ((stat = nv_rd32(priv, 0x00b100)))
@@ -113,11 +113,11 @@ nv40_mpeg_intr(struct nouveau_subdev *subdev)
 }
 
 static int
-nv40_mpeg_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
+nv44_mpeg_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 	       struct nouveau_oclass *oclass, void *data, u32 size,
 	       struct nouveau_object **pobject)
 {
-	struct nv40_mpeg_priv *priv;
+	struct nv44_mpeg_priv *priv;
 	int ret;
 
 	ret = nouveau_mpeg_create(parent, engine, oclass, &priv);
@@ -126,18 +126,18 @@ nv40_mpeg_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 		return ret;
 
 	nv_subdev(priv)->unit = 0x00000002;
-	nv_subdev(priv)->intr = nv40_mpeg_intr;
-	nv_engine(priv)->cclass = &nv40_mpeg_cclass;
+	nv_subdev(priv)->intr = nv44_mpeg_intr;
+	nv_engine(priv)->cclass = &nv44_mpeg_cclass;
 	nv_engine(priv)->sclass = nv31_mpeg_sclass;
 	nv_engine(priv)->tile_prog = nv31_mpeg_tile_prog;
 	return 0;
 }
 
 struct nouveau_oclass
-nv40_mpeg_oclass = {
-	.handle = NV_ENGINE(MPEG, 0x40),
+nv44_mpeg_oclass = {
+	.handle = NV_ENGINE(MPEG, 0x44),
 	.ofuncs = &(struct nouveau_ofuncs) {
-		.ctor = nv40_mpeg_ctor,
+		.ctor = nv44_mpeg_ctor,
 		.dtor = _nouveau_mpeg_dtor,
 		.init = nv31_mpeg_init,
 		.fini = _nouveau_mpeg_fini,
diff --git a/drivers/gpu/drm/nouveau/core/include/engine/mpeg.h b/drivers/gpu/drm/nouveau/core/include/engine/mpeg.h
index 1d1a89a..d97a1b5 100644
--- a/drivers/gpu/drm/nouveau/core/include/engine/mpeg.h
+++ b/drivers/gpu/drm/nouveau/core/include/engine/mpeg.h
@@ -41,7 +41,7 @@ struct nouveau_mpeg {
 #define _nouveau_mpeg_fini _nouveau_engine_fini
 
 extern struct nouveau_oclass nv31_mpeg_oclass;
-extern struct nouveau_oclass nv40_mpeg_oclass;
+extern struct nouveau_oclass nv44_mpeg_oclass;
 extern struct nouveau_oclass nv50_mpeg_oclass;
 extern struct nouveau_oclass nv84_mpeg_oclass;
 
-- 
1.8.1.5

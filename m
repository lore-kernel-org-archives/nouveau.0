From: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
Subject: [PATCH 2/4] drm/nouveau: support
	NOUVEAU_GETPARAM_GRAPH_UNITS on >= nvc0
Date: Wed, 27 Mar 2013 22:16:54 +0100
Message-ID: <1364419016-18275-2-git-send-email-e0425955@student.tuwien.ac.at>
References: <1364419016-18275-1-git-send-email-e0425955@student.tuwien.ac.at>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1364419016-18275-1-git-send-email-e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
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

---
 drivers/gpu/drm/nouveau/core/engine/graph/nv40.c   |   10 ++++++++++
 drivers/gpu/drm/nouveau/core/engine/graph/nv50.c   |   10 ++++++++++
 drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c   |   15 +++++++++++++++
 drivers/gpu/drm/nouveau/core/engine/graph/nvc0.h   |    2 ++
 drivers/gpu/drm/nouveau/core/engine/graph/nve0.c   |    2 ++
 .../gpu/drm/nouveau/core/include/engine/graph.h    |    4 ++++
 drivers/gpu/drm/nouveau/nouveau_abi16.c            |   12 ++++--------
 7 files changed, 47 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/core/engine/graph/nv40.c b/drivers/gpu/drm/nouveau/core/engine/graph/nv40.c
index 17049d5..193a5de 100644
--- a/drivers/gpu/drm/nouveau/core/engine/graph/nv40.c
+++ b/drivers/gpu/drm/nouveau/core/engine/graph/nv40.c
@@ -46,6 +46,14 @@ struct nv40_graph_chan {
 	struct nouveau_graph_chan base;
 };
 
+static u64
+nv40_graph_units(struct nouveau_graph *graph)
+{
+	struct nv40_graph_priv *priv = (void *)graph;
+
+	return nv_rd32(priv, 0x1540);
+}
+
 /*******************************************************************************
  * Graphics object classes
  ******************************************************************************/
@@ -359,6 +367,8 @@ nv40_graph_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 	else
 		nv_engine(priv)->sclass = nv40_graph_sclass;
 	nv_engine(priv)->tile_prog = nv40_graph_tile_prog;
+
+	priv->base.units = nv40_graph_units;
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/nouveau/core/engine/graph/nv50.c b/drivers/gpu/drm/nouveau/core/engine/graph/nv50.c
index f2b1a7a..1ac3611 100644
--- a/drivers/gpu/drm/nouveau/core/engine/graph/nv50.c
+++ b/drivers/gpu/drm/nouveau/core/engine/graph/nv50.c
@@ -48,6 +48,14 @@ struct nv50_graph_chan {
 	struct nouveau_graph_chan base;
 };
 
+static u64
+nv50_graph_units(struct nouveau_graph *graph)
+{
+	struct nv50_graph_priv *priv = (void *)graph;
+
+	return nv_rd32(priv, 0x1540);
+}
+
 /*******************************************************************************
  * Graphics object classes
  ******************************************************************************/
@@ -819,6 +827,8 @@ nv50_graph_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 	nv_subdev(priv)->intr = nv50_graph_intr;
 	nv_engine(priv)->cclass = &nv50_graph_cclass;
 
+	priv->base.units = nv50_graph_units;
+
 	switch (nv_device(priv)->chipset) {
 	case 0x50:
 		nv_engine(priv)->sclass = nv50_graph_sclass;
diff --git a/drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c b/drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c
index 0de0dd7..5ce4941 100644
--- a/drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c
+++ b/drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c
@@ -60,6 +60,19 @@ nvc8_graph_sclass[] = {
 	{}
 };
 
+u64
+nvc0_graph_units(struct nouveau_graph *graph)
+{
+	struct nvc0_graph_priv *priv = (void *)graph;
+	u64 cfg;
+
+	cfg  = (u32)priv->gpc_nr;
+	cfg |= (u32)priv->tpc_total << 8;
+	cfg |= (u64)priv->rop_nr << 32;
+
+	return cfg;
+}
+
 /*******************************************************************************
  * PGRAPH context
  ******************************************************************************/
@@ -529,6 +542,8 @@ nvc0_graph_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 	nv_subdev(priv)->intr = nvc0_graph_intr;
 	nv_engine(priv)->cclass = &nvc0_graph_cclass;
 
+	priv->base.units = nvc0_graph_units;
+
 	if (nouveau_boolopt(device->cfgopt, "NvGrUseFW", false)) {
 		nv_info(priv, "using external firmware\n");
 		if (nvc0_graph_ctor_fw(priv, "fuc409c", &priv->fuc409c) ||
diff --git a/drivers/gpu/drm/nouveau/core/engine/graph/nvc0.h b/drivers/gpu/drm/nouveau/core/engine/graph/nvc0.h
index a1e78de..af033dc 100644
--- a/drivers/gpu/drm/nouveau/core/engine/graph/nvc0.h
+++ b/drivers/gpu/drm/nouveau/core/engine/graph/nvc0.h
@@ -169,4 +169,6 @@ int  nvc0_graph_context_ctor(struct nouveau_object *, struct nouveau_object *,
 			     struct nouveau_object **);
 void nvc0_graph_context_dtor(struct nouveau_object *);
 
+u64 nvc0_graph_units(struct nouveau_graph *);
+
 #endif
diff --git a/drivers/gpu/drm/nouveau/core/engine/graph/nve0.c b/drivers/gpu/drm/nouveau/core/engine/graph/nve0.c
index 4857f91..4b45afb 100644
--- a/drivers/gpu/drm/nouveau/core/engine/graph/nve0.c
+++ b/drivers/gpu/drm/nouveau/core/engine/graph/nve0.c
@@ -217,6 +217,8 @@ nve0_graph_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 	nv_engine(priv)->cclass = &nve0_graph_cclass;
 	nv_engine(priv)->sclass = nve0_graph_sclass;
 
+	priv->base.units = nvc0_graph_units;
+
 	if (nouveau_boolopt(device->cfgopt, "NvGrUseFW", false)) {
 		nv_info(priv, "using external firmware\n");
 		if (nvc0_graph_ctor_fw(priv, "fuc409c", &priv->fuc409c) ||
diff --git a/drivers/gpu/drm/nouveau/core/include/engine/graph.h b/drivers/gpu/drm/nouveau/core/include/engine/graph.h
index 6943b40..5d39243 100644
--- a/drivers/gpu/drm/nouveau/core/include/engine/graph.h
+++ b/drivers/gpu/drm/nouveau/core/include/engine/graph.h
@@ -26,6 +26,10 @@ struct nouveau_graph_chan {
 
 struct nouveau_graph {
 	struct nouveau_engine base;
+
+	/* Returns chipset-specific counts of units packed into an u64.
+	 */
+	u64 (*units)(struct nouveau_graph *);
 };
 
 static inline struct nouveau_graph *
diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c b/drivers/gpu/drm/nouveau/nouveau_abi16.c
index 3b6dc88..f19f0a4 100644
--- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
+++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
@@ -30,6 +30,7 @@
 #include <subdev/fb.h>
 #include <subdev/timer.h>
 #include <subdev/instmem.h>
+#include <engine/graph.h>
 
 #include "nouveau_drm.h"
 #include "nouveau_dma.h"
@@ -168,6 +169,7 @@ nouveau_abi16_ioctl_getparam(ABI16_IOCTL_ARGS)
 	struct nouveau_drm *drm = nouveau_drm(dev);
 	struct nouveau_device *device = nv_device(drm->device);
 	struct nouveau_timer *ptimer = nouveau_timer(device);
+	struct nouveau_graph *graph = (void *)nouveau_engine(device, NVDEV_ENGINE_GR);
 	struct drm_nouveau_getparam *getparam = data;
 
 	switch (getparam->param) {
@@ -208,14 +210,8 @@ nouveau_abi16_ioctl_getparam(ABI16_IOCTL_ARGS)
 		getparam->value = 1;
 		break;
 	case NOUVEAU_GETPARAM_GRAPH_UNITS:
-		/* NV40 and NV50 versions are quite different, but register
-		 * address is the same. User is supposed to know the card
-		 * family anyway... */
-		if (device->chipset >= 0x40) {
-			getparam->value = nv_rd32(device, 0x001540);
-			break;
-		}
-		/* FALLTHRU */
+		getparam->value = graph->units ? graph->units(graph) : 0;
+		break;
 	default:
 		nv_debug(device, "unknown parameter %lld\n", getparam->param);
 		return -EINVAL;
-- 
1.7.3.4

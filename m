From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCHv2 4/4] drm/nouveau: report channel owner in error
	messages
Date: Sun,  9 Dec 2012 15:45:22 +0100
Message-ID: <1355064322-23025-4-git-send-email-marcin.slusarz@gmail.com>
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
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/nouveau/core/engine/copy/nva3.c  |  6 ++--
 drivers/gpu/drm/nouveau/core/engine/crypt/nv84.c |  6 ++--
 drivers/gpu/drm/nouveau/core/engine/crypt/nv98.c |  6 ++--
 drivers/gpu/drm/nouveau/core/engine/fifo/nv04.c  | 22 +++++++-----
 drivers/gpu/drm/nouveau/core/engine/fifo/nv50.c  |  3 +-
 drivers/gpu/drm/nouveau/core/engine/fifo/nv84.c  |  3 +-
 drivers/gpu/drm/nouveau/core/engine/fifo/nvc0.c  | 42 +++++++++++++++-------
 drivers/gpu/drm/nouveau/core/engine/fifo/nve0.c  | 29 +++++++++++----
 drivers/gpu/drm/nouveau/core/engine/graph/nv04.c |  8 +++--
 drivers/gpu/drm/nouveau/core/engine/graph/nv10.c |  8 +++--
 drivers/gpu/drm/nouveau/core/engine/graph/nv20.c |  7 ++--
 drivers/gpu/drm/nouveau/core/engine/graph/nv40.c |  8 +++--
 drivers/gpu/drm/nouveau/core/engine/graph/nv50.c | 34 +++++++++---------
 drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c | 24 +++++++------
 drivers/gpu/drm/nouveau/core/engine/graph/nve0.c | 44 ++++++++++++-----------
 drivers/gpu/drm/nouveau/core/engine/mpeg/nv31.c  |  7 ++--
 drivers/gpu/drm/nouveau/core/subdev/fb/nv50.c    | 45 ++++++++++++++++++------
 drivers/gpu/drm/nouveau/nouveau_chan.c           |  3 +-
 18 files changed, 198 insertions(+), 107 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/core/engine/copy/nva3.c b/drivers/gpu/drm/nouveau/core/engine/copy/nva3.c
index 6068f5f..d6dc2a6 100644
--- a/drivers/gpu/drm/nouveau/core/engine/copy/nva3.c
+++ b/drivers/gpu/drm/nouveau/core/engine/copy/nva3.c
@@ -22,6 +22,7 @@
  * Authors: Ben Skeggs
  */
 
+#include <core/client.h>
 #include <core/falcon.h>
 #include <core/class.h>
 #include <core/enum.h>
@@ -100,8 +101,9 @@ nva3_copy_intr(struct nouveau_subdev *subdev)
 	if (stat & 0x00000040) {
 		nv_error(falcon, "DISPATCH_ERROR [");
 		nouveau_enum_print(nva3_copy_isr_error_name, ssta);
-		pr_cont("] ch %d [0x%010llx] subc %d mthd 0x%04x data 0x%08x\n",
-		       chid, inst << 12, subc, mthd, data);
+		pr_cont("] ch %d [0x%010llx %s] subc %d mthd 0x%04x data 0x%08x\n",
+		       chid, inst << 12, nouveau_client_name(engctx), subc,
+		       mthd, data);
 		nv_wo32(falcon, 0x004, 0x00000040);
 		stat &= ~0x00000040;
 	}
diff --git a/drivers/gpu/drm/nouveau/core/engine/crypt/nv84.c b/drivers/gpu/drm/nouveau/core/engine/crypt/nv84.c
index 8d0a440..f431759 100644
--- a/drivers/gpu/drm/nouveau/core/engine/crypt/nv84.c
+++ b/drivers/gpu/drm/nouveau/core/engine/crypt/nv84.c
@@ -22,6 +22,7 @@
  * Authors: Ben Skeggs
  */
 
+#include <core/client.h>
 #include <core/os.h>
 #include <core/enum.h>
 #include <core/class.h>
@@ -128,8 +129,9 @@ nv84_crypt_intr(struct nouveau_subdev *subdev)
 	if (stat) {
 		nv_error(priv, "");
 		nouveau_bitfield_print(nv84_crypt_intr_mask, stat);
-		pr_cont(" ch %d [0x%010llx] mthd 0x%04x data 0x%08x\n",
-		       chid, (u64)inst << 12, mthd, data);
+		pr_cont(" ch %d [0x%010llx %s] mthd 0x%04x data 0x%08x\n",
+		       chid, (u64)inst << 12, nouveau_client_name(engctx),
+		       mthd, data);
 	}
 
 	nv_wr32(priv, 0x102130, stat);
diff --git a/drivers/gpu/drm/nouveau/core/engine/crypt/nv98.c b/drivers/gpu/drm/nouveau/core/engine/crypt/nv98.c
index 1b33c20..8bf8955 100644
--- a/drivers/gpu/drm/nouveau/core/engine/crypt/nv98.c
+++ b/drivers/gpu/drm/nouveau/core/engine/crypt/nv98.c
@@ -22,6 +22,7 @@
  * Authors: Ben Skeggs
  */
 
+#include <core/client.h>
 #include <core/os.h>
 #include <core/enum.h>
 #include <core/class.h>
@@ -102,8 +103,9 @@ nv98_crypt_intr(struct nouveau_subdev *subdev)
 	if (stat & 0x00000040) {
 		nv_error(priv, "DISPATCH_ERROR [");
 		nouveau_enum_print(nv98_crypt_isr_error_name, ssta);
-		pr_cont("] ch %d [0x%010llx] subc %d mthd 0x%04x data 0x%08x\n",
-		       chid, (u64)inst << 12, subc, mthd, data);
+		pr_cont("] ch %d [0x%010llx %s] subc %d mthd 0x%04x data 0x%08x\n",
+		       chid, (u64)inst << 12, nouveau_client_name(engctx),
+		       subc, mthd, data);
 		nv_wr32(priv, 0x087004, 0x00000040);
 		stat &= ~0x00000040;
 	}
diff --git a/drivers/gpu/drm/nouveau/core/engine/fifo/nv04.c b/drivers/gpu/drm/nouveau/core/engine/fifo/nv04.c
index 76944c4..874fa9a 100644
--- a/drivers/gpu/drm/nouveau/core/engine/fifo/nv04.c
+++ b/drivers/gpu/drm/nouveau/core/engine/fifo/nv04.c
@@ -421,9 +421,12 @@ nv04_fifo_cache_error(struct nouveau_device *device,
 	}
 
 	if (!nv04_fifo_swmthd(priv, chid, mthd, data)) {
+		const char *client_name =
+			nouveau_client_name_for_fifo_chid(&priv->base, chid);
 		nv_error(priv,
-			 "CACHE_ERROR - Ch %d/%d Mthd 0x%04x Data 0x%08x\n",
-			 chid, (mthd >> 13) & 7, mthd & 0x1ffc, data);
+			 "CACHE_ERROR - ch %d [%s] subc %d mthd 0x%04x data 0x%08x\n",
+			 chid, client_name, (mthd >> 13) & 7, mthd & 0x1ffc,
+			 data);
 	}
 
 	nv_wr32(priv, NV04_PFIFO_CACHE1_DMA_PUSH, 0);
@@ -445,11 +448,14 @@ static void
 nv04_fifo_dma_pusher(struct nouveau_device *device, struct nv04_fifo_priv *priv,
 		u32 chid)
 {
+	const char *client_name;
 	u32 dma_get = nv_rd32(priv, 0x003244);
 	u32 dma_put = nv_rd32(priv, 0x003240);
 	u32 push = nv_rd32(priv, 0x003220);
 	u32 state = nv_rd32(priv, 0x003228);
 
+	client_name = nouveau_client_name_for_fifo_chid(&priv->base, chid);
+
 	if (device->card_type == NV_50) {
 		u32 ho_get = nv_rd32(priv, 0x003328);
 		u32 ho_put = nv_rd32(priv, 0x003320);
@@ -457,9 +463,9 @@ nv04_fifo_dma_pusher(struct nouveau_device *device, struct nv04_fifo_priv *priv,
 		u32 ib_put = nv_rd32(priv, 0x003330);
 
 		nv_error(priv,
-			 "DMA_PUSHER - Ch %d Get 0x%02x%08x Put 0x%02x%08x IbGet 0x%08x IbPut 0x%08x State 0x%08x (err: %s) Push 0x%08x\n",
-			 chid, ho_get, dma_get, ho_put, dma_put, ib_get, ib_put,
-			 state, nv_dma_state_err(state), push);
+			 "DMA_PUSHER - ch %d [%s] get 0x%02x%08x put 0x%02x%08x ib_get 0x%08x ib_put 0x%08x state 0x%08x (err: %s) push 0x%08x\n",
+			 chid, client_name, ho_get, dma_get, ho_put, dma_put,
+			 ib_get, ib_put, state, nv_dma_state_err(state), push);
 
 		/* METHOD_COUNT, in DMA_STATE on earlier chipsets */
 		nv_wr32(priv, 0x003364, 0x00000000);
@@ -471,9 +477,9 @@ nv04_fifo_dma_pusher(struct nouveau_device *device, struct nv04_fifo_priv *priv,
 			nv_wr32(priv, 0x003334, ib_put);
 	} else {
 		nv_error(priv,
-			 "DMA_PUSHER - Ch %d Get 0x%08x Put 0x%08x State 0x%08x (err: %s) Push 0x%08x\n",
-			 chid, dma_get, dma_put, state, nv_dma_state_err(state),
-			 push);
+			 "DMA_PUSHER - ch %d [%s] get 0x%08x put 0x%08x state 0x%08x (err: %s) push 0x%08x\n",
+			 chid, client_name, dma_get, dma_put, state,
+			 nv_dma_state_err(state), push);
 
 		if (dma_get != dma_put)
 			nv_wr32(priv, 0x003244, dma_put);
diff --git a/drivers/gpu/drm/nouveau/core/engine/fifo/nv50.c b/drivers/gpu/drm/nouveau/core/engine/fifo/nv50.c
index 536e763..6473566 100644
--- a/drivers/gpu/drm/nouveau/core/engine/fifo/nv50.c
+++ b/drivers/gpu/drm/nouveau/core/engine/fifo/nv50.c
@@ -137,7 +137,8 @@ nv50_fifo_context_detach(struct nouveau_object *parent, bool suspend,
 	/* do the kickoff... */
 	nv_wr32(priv, 0x0032fc, nv_gpuobj(base)->addr >> 12);
 	if (!nv_wait_ne(priv, 0x0032fc, 0xffffffff, 0xffffffff)) {
-		nv_error(priv, "channel %d unload timeout\n", chan->base.chid);
+		nv_error(priv, "channel %d [%s] unload timeout\n",
+			 chan->base.chid, nouveau_client_name(chan));
 		if (suspend)
 			ret = -EBUSY;
 	}
diff --git a/drivers/gpu/drm/nouveau/core/engine/fifo/nv84.c b/drivers/gpu/drm/nouveau/core/engine/fifo/nv84.c
index b4fd26d..8d60e9d 100644
--- a/drivers/gpu/drm/nouveau/core/engine/fifo/nv84.c
+++ b/drivers/gpu/drm/nouveau/core/engine/fifo/nv84.c
@@ -108,7 +108,8 @@ nv84_fifo_context_detach(struct nouveau_object *parent, bool suspend,
 	done = nv_wait_ne(priv, 0x0032fc, 0xffffffff, 0xffffffff);
 	nv_wr32(priv, 0x002520, save);
 	if (!done) {
-		nv_error(priv, "channel %d unload timeout\n", chan->base.chid);
+		nv_error(priv, "channel %d [%s] unload timeout\n",
+			 chan->base.chid, nouveau_client_name(chan));
 		if (suspend)
 			return -EBUSY;
 	}
diff --git a/drivers/gpu/drm/nouveau/core/engine/fifo/nvc0.c b/drivers/gpu/drm/nouveau/core/engine/fifo/nvc0.c
index 151706b..dd234fd 100644
--- a/drivers/gpu/drm/nouveau/core/engine/fifo/nvc0.c
+++ b/drivers/gpu/drm/nouveau/core/engine/fifo/nvc0.c
@@ -153,7 +153,8 @@ nvc0_fifo_context_detach(struct nouveau_object *parent, bool suspend,
 
 	nv_wr32(priv, 0x002634, chan->base.chid);
 	if (!nv_wait(priv, 0x002634, 0xffffffff, chan->base.chid)) {
-		nv_error(priv, "channel %d kick timeout\n", chan->base.chid);
+		nv_error(priv, "channel %d [%s] kick timeout\n",
+			 chan->base.chid, nouveau_client_name(chan));
 		if (suspend)
 			return -EBUSY;
 	}
@@ -334,17 +335,17 @@ nvc0_fifo_cclass = {
  ******************************************************************************/
 
 static const struct nouveau_enum nvc0_fifo_fault_unit[] = {
-	{ 0x00, "PGRAPH" },
+	{ 0x00, "PGRAPH", NULL, NVDEV_ENGINE_GR },
 	{ 0x03, "PEEPHOLE" },
 	{ 0x04, "BAR1" },
 	{ 0x05, "BAR3" },
-	{ 0x07, "PFIFO" },
-	{ 0x10, "PBSP" },
-	{ 0x11, "PPPP" },
+	{ 0x07, "PFIFO", NULL, NVDEV_ENGINE_FIFO },
+	{ 0x10, "PBSP", NULL, NVDEV_ENGINE_BSP },
+	{ 0x11, "PPPP", NULL, NVDEV_ENGINE_PPP },
 	{ 0x13, "PCOUNTER" },
-	{ 0x14, "PVP" },
-	{ 0x15, "PCOPY0" },
-	{ 0x16, "PCOPY1" },
+	{ 0x14, "PVP", NULL, NVDEV_ENGINE_VP },
+	{ 0x15, "PCOPY0", NULL, NVDEV_ENGINE_COPY0 },
+	{ 0x16, "PCOPY1", NULL, NVDEV_ENGINE_COPY1 },
 	{ 0x17, "PDAEMON" },
 	{}
 };
@@ -403,6 +404,9 @@ nvc0_fifo_isr_vm_fault(struct nvc0_fifo_priv *priv, int unit)
 	u32 vahi = nv_rd32(priv, 0x002808 + (unit * 0x10));
 	u32 stat = nv_rd32(priv, 0x00280c + (unit * 0x10));
 	u32 client = (stat & 0x00001f00) >> 8;
+	const struct nouveau_enum *en;
+	struct nouveau_engine *engine;
+	struct nouveau_object *engctx = NULL;
 
 	switch (unit) {
 	case 3: /* PEEPHOLE */
@@ -422,7 +426,7 @@ nvc0_fifo_isr_vm_fault(struct nvc0_fifo_priv *priv, int unit)
 		 "write" : "read", (u64)vahi << 32 | valo);
 	nouveau_enum_print(nvc0_fifo_fault_reason, stat & 0x0000000f);
 	pr_cont("] from ");
-	nouveau_enum_print(nvc0_fifo_fault_unit, unit);
+	en = nouveau_enum_print(nvc0_fifo_fault_unit, unit);
 	if (stat & 0x00000040) {
 		pr_cont("/");
 		nouveau_enum_print(nvc0_fifo_fault_hubclient, client);
@@ -430,7 +434,17 @@ nvc0_fifo_isr_vm_fault(struct nvc0_fifo_priv *priv, int unit)
 		pr_cont("/GPC%d/", (stat & 0x1f000000) >> 24);
 		nouveau_enum_print(nvc0_fifo_fault_gpcclient, client);
 	}
-	pr_cont(" on channel 0x%010llx\n", (u64)inst << 12);
+
+	if (en && en->data2) {
+		engine = nouveau_engine(priv, en->data2);
+		if (engine)
+			engctx = nouveau_engctx_get(engine, inst);
+
+	}
+	pr_cont(" on channel 0x%010llx [%s]\n", (u64)inst << 12,
+			nouveau_client_name(engctx));
+
+	nouveau_engctx_put(engctx);
 }
 
 static int
@@ -486,9 +500,11 @@ nvc0_fifo_isr_subfifo_intr(struct nvc0_fifo_priv *priv, int unit)
 		nv_error(priv, "SUBFIFO%d:", unit);
 		nouveau_bitfield_print(nvc0_fifo_subfifo_intr, show);
 		pr_cont("\n");
-		nv_error(priv, "SUBFIFO%d: ch %d subc %d mthd 0x%04x "
-			       "data 0x%08x\n",
-			 unit, chid, subc, mthd, data);
+		nv_error(priv,
+			 "SUBFIFO%d: ch %d [%s] subc %d mthd 0x%04x data 0x%08x\n",
+			 unit, chid,
+			 nouveau_client_name_for_fifo_chid(&priv->base, chid),
+			 subc, mthd, data);
 	}
 
 	nv_wr32(priv, 0x0400c0 + (unit * 0x2000), 0x80600008);
diff --git a/drivers/gpu/drm/nouveau/core/engine/fifo/nve0.c b/drivers/gpu/drm/nouveau/core/engine/fifo/nve0.c
index c23f7ba..0264755 100644
--- a/drivers/gpu/drm/nouveau/core/engine/fifo/nve0.c
+++ b/drivers/gpu/drm/nouveau/core/engine/fifo/nve0.c
@@ -188,7 +188,8 @@ nve0_fifo_context_detach(struct nouveau_object *parent, bool suspend,
 
 	nv_wr32(priv, 0x002634, chan->base.chid);
 	if (!nv_wait(priv, 0x002634, 0xffffffff, chan->base.chid)) {
-		nv_error(priv, "channel %d kick timeout\n", chan->base.chid);
+		nv_error(priv, "channel %d [%s] kick timeout\n",
+			 chan->base.chid, nouveau_client_name(chan));
 		if (suspend)
 			return -EBUSY;
 	}
@@ -413,12 +414,15 @@ nve0_fifo_isr_vm_fault(struct nve0_fifo_priv *priv, int unit)
 	u32 vahi = nv_rd32(priv, 0x2808 + (unit * 0x10));
 	u32 stat = nv_rd32(priv, 0x280c + (unit * 0x10));
 	u32 client = (stat & 0x00001f00) >> 8;
+	const struct nouveau_enum *en;
+	struct nouveau_engine *engine;
+	struct nouveau_object *engctx = NULL;
 
 	nv_error(priv, "PFIFO: %s fault at 0x%010llx [", (stat & 0x00000080) ?
 		       "write" : "read", (u64)vahi << 32 | valo);
 	nouveau_enum_print(nve0_fifo_fault_reason, stat & 0x0000000f);
 	pr_cont("] from ");
-	nouveau_enum_print(nve0_fifo_fault_unit, unit);
+	en = nouveau_enum_print(nve0_fifo_fault_unit, unit);
 	if (stat & 0x00000040) {
 		pr_cont("/");
 		nouveau_enum_print(nve0_fifo_fault_hubclient, client);
@@ -426,7 +430,18 @@ nve0_fifo_isr_vm_fault(struct nve0_fifo_priv *priv, int unit)
 		pr_cont("/GPC%d/", (stat & 0x1f000000) >> 24);
 		nouveau_enum_print(nve0_fifo_fault_gpcclient, client);
 	}
-	pr_cont(" on channel 0x%010llx\n", (u64)inst << 12);
+
+	if (en && en->data2) {
+		engine = nouveau_engine(priv, en->data2);
+		if (engine)
+			engctx = nouveau_engctx_get(engine, inst);
+
+	}
+
+	pr_cont(" on channel 0x%010llx [%s]\n", (u64)inst << 12,
+			nouveau_client_name(engctx));
+
+	nouveau_engctx_put(engctx);
 }
 
 static int
@@ -482,9 +497,11 @@ nve0_fifo_isr_subfifo_intr(struct nve0_fifo_priv *priv, int unit)
 		nv_error(priv, "SUBFIFO%d:", unit);
 		nouveau_bitfield_print(nve0_fifo_subfifo_intr, show);
 		pr_cont("\n");
-		nv_error(priv, "SUBFIFO%d: ch %d subc %d mthd 0x%04x "
-			       "data 0x%08x\n",
-			 unit, chid, subc, mthd, data);
+		nv_error(priv,
+			 "SUBFIFO%d: ch %d [%s] subc %d mthd 0x%04x data 0x%08x\n",
+			 unit, chid,
+			 nouveau_client_name_for_fifo_chid(&priv->base, chid),
+			 subc, mthd, data);
 	}
 
 	nv_wr32(priv, 0x0400c0 + (unit * 0x2000), 0x80600008);
diff --git a/drivers/gpu/drm/nouveau/core/engine/graph/nv04.c b/drivers/gpu/drm/nouveau/core/engine/graph/nv04.c
index f4fb844..2ea3d14 100644
--- a/drivers/gpu/drm/nouveau/core/engine/graph/nv04.c
+++ b/drivers/gpu/drm/nouveau/core/engine/graph/nv04.c
@@ -22,6 +22,7 @@
  * DEALINGS IN THE SOFTWARE.
  */
 
+#include <core/client.h>
 #include <core/os.h>
 #include <core/class.h>
 #include <core/handle.h>
@@ -1304,9 +1305,10 @@ nv04_graph_intr(struct nouveau_subdev *subdev)
 		pr_cont(" nstatus:");
 		nouveau_bitfield_print(nv04_graph_nstatus, nstatus);
 		pr_cont("\n");
-		nv_error(priv, "ch %d/%d class 0x%04x "
-			       "mthd 0x%04x data 0x%08x\n",
-			 chid, subc, class, mthd, data);
+		nv_error(priv,
+			 "ch %d [%s] subc %d class 0x%04x mthd 0x%04x data 0x%08x\n",
+			 chid, nouveau_client_name(chan), subc, class, mthd,
+			 data);
 	}
 
 	nouveau_namedb_put(handle);
diff --git a/drivers/gpu/drm/nouveau/core/engine/graph/nv10.c b/drivers/gpu/drm/nouveau/core/engine/graph/nv10.c
index deea80f..e5afc8f 100644
--- a/drivers/gpu/drm/nouveau/core/engine/graph/nv10.c
+++ b/drivers/gpu/drm/nouveau/core/engine/graph/nv10.c
@@ -22,6 +22,7 @@
  * DEALINGS IN THE SOFTWARE.
  */
 
+#include <core/client.h>
 #include <core/os.h>
 #include <core/class.h>
 #include <core/handle.h>
@@ -1200,9 +1201,10 @@ nv10_graph_intr(struct nouveau_subdev *subdev)
 		pr_cont(" nstatus:");
 		nouveau_bitfield_print(nv10_graph_nstatus, nstatus);
 		pr_cont("\n");
-		nv_error(priv, "ch %d/%d class 0x%04x "
-			       "mthd 0x%04x data 0x%08x\n",
-			 chid, subc, class, mthd, data);
+		nv_error(priv,
+			 "ch %d [%s] subc %d class 0x%04x mthd 0x%04x data 0x%08x\n",
+			 chid, nouveau_client_name(chan), subc, class, mthd,
+			 data);
 	}
 
 	nouveau_namedb_put(handle);
diff --git a/drivers/gpu/drm/nouveau/core/engine/graph/nv20.c b/drivers/gpu/drm/nouveau/core/engine/graph/nv20.c
index 4c0d79c..8cc01c1 100644
--- a/drivers/gpu/drm/nouveau/core/engine/graph/nv20.c
+++ b/drivers/gpu/drm/nouveau/core/engine/graph/nv20.c
@@ -1,3 +1,4 @@
+#include <core/client.h>
 #include <core/os.h>
 #include <core/class.h>
 #include <core/engctx.h>
@@ -231,8 +232,10 @@ nv20_graph_intr(struct nouveau_subdev *subdev)
 		pr_cont(" nstatus:");
 		nouveau_bitfield_print(nv10_graph_nstatus, nstatus);
 		pr_cont("\n");
-		nv_error(priv, "ch %d/%d class 0x%04x mthd 0x%04x data 0x%08x\n",
-			chid, subc, class, mthd, data);
+		nv_error(priv,
+			 "ch %d [%s] subc %d class 0x%04x mthd 0x%04x data 0x%08x\n",
+			 chid, nouveau_client_name(engctx), subc, class, mthd,
+			 data);
 	}
 
 	nouveau_engctx_put(engctx);
diff --git a/drivers/gpu/drm/nouveau/core/engine/graph/nv40.c b/drivers/gpu/drm/nouveau/core/engine/graph/nv40.c
index 961a073..81f0f5d 100644
--- a/drivers/gpu/drm/nouveau/core/engine/graph/nv40.c
+++ b/drivers/gpu/drm/nouveau/core/engine/graph/nv40.c
@@ -22,6 +22,7 @@
  * Authors: Ben Skeggs
  */
 
+#include <core/client.h>
 #include <core/os.h>
 #include <core/class.h>
 #include <core/handle.h>
@@ -328,9 +329,10 @@ nv40_graph_intr(struct nouveau_subdev *subdev)
 		pr_cont(" nstatus:");
 		nouveau_bitfield_print(nv10_graph_nstatus, nstatus);
 		pr_cont("\n");
-		nv_error(priv, "ch %d [0x%08x] subc %d class 0x%04x "
-			       "mthd 0x%04x data 0x%08x\n",
-			 chid, inst << 4, subc, class, mthd, data);
+		nv_error(priv,
+			 "ch %d [0x%08x %s] subc %d class 0x%04x mthd 0x%04x data 0x%08x\n",
+			 chid, inst << 4, nouveau_client_name(engctx), subc,
+			 class, mthd, data);
 	}
 
 	nouveau_engctx_put(engctx);
diff --git a/drivers/gpu/drm/nouveau/core/engine/graph/nv50.c b/drivers/gpu/drm/nouveau/core/engine/graph/nv50.c
index 2c9e9ad..c1c14d8 100644
--- a/drivers/gpu/drm/nouveau/core/engine/graph/nv50.c
+++ b/drivers/gpu/drm/nouveau/core/engine/graph/nv50.c
@@ -24,6 +24,7 @@
 
 #include <core/os.h>
 #include <core/class.h>
+#include <core/client.h>
 #include <core/handle.h>
 #include <core/engctx.h>
 #include <core/enum.h>
@@ -532,7 +533,7 @@ nv50_priv_tp_trap(struct nv50_graph_priv *priv, int type, u32 ustatus_old,
 
 static int
 nv50_graph_trap_handler(struct nv50_graph_priv *priv, u32 display,
-			int chid, u64 inst)
+			int chid, u64 inst, struct nouveau_object *engctx)
 {
 	u32 status = nv_rd32(priv, 0x400108);
 	u32 ustatus;
@@ -565,12 +566,11 @@ nv50_graph_trap_handler(struct nv50_graph_priv *priv, u32 display,
 
 			nv_error(priv, "TRAP DISPATCH_FAULT\n");
 			if (display && (addr & 0x80000000)) {
-				nv_error(priv, "ch %d [0x%010llx] "
-					     "subc %d class 0x%04x mthd 0x%04x "
-					     "data 0x%08x%08x "
-					     "400808 0x%08x 400848 0x%08x\n",
-					chid, inst, subc, class, mthd, datah,
-					datal, addr, r848);
+				nv_error(priv,
+					 "ch %d [0x%010llx %s] subc %d class 0x%04x mthd 0x%04x data 0x%08x%08x 400808 0x%08x 400848 0x%08x\n",
+					 chid, inst,
+					 nouveau_client_name(engctx), subc,
+					 class, mthd, datah, datal, addr, r848);
 			} else
 			if (display) {
 				nv_error(priv, "no stuck command?\n");
@@ -591,11 +591,11 @@ nv50_graph_trap_handler(struct nv50_graph_priv *priv, u32 display,
 
 			nv_error(priv, "TRAP DISPATCH_QUERY\n");
 			if (display && (addr & 0x80000000)) {
-				nv_error(priv, "ch %d [0x%010llx] "
-					     "subc %d class 0x%04x mthd 0x%04x "
-					     "data 0x%08x 40084c 0x%08x\n",
-					chid, inst, subc, class, mthd,
-					data, addr);
+				nv_error(priv,
+					 "ch %d [0x%010llx %s] subc %d class 0x%04x mthd 0x%04x data 0x%08x 40084c 0x%08x\n",
+					 chid, inst,
+					 nouveau_client_name(engctx), subc,
+					 class, mthd, data, addr);
 			} else
 			if (display) {
 				nv_error(priv, "no stuck command?\n");
@@ -778,7 +778,8 @@ nv50_graph_intr(struct nouveau_subdev *subdev)
 	}
 
 	if (stat & 0x00200000) {
-		if (!nv50_graph_trap_handler(priv, show, chid, (u64)inst << 12))
+		if (!nv50_graph_trap_handler(priv, show, chid, (u64)inst << 12,
+				engctx))
 			show &= ~0x00200000;
 	}
 
@@ -789,9 +790,10 @@ nv50_graph_intr(struct nouveau_subdev *subdev)
 		nv_error(priv, "");
 		nouveau_bitfield_print(nv50_graph_intr_name, show);
 		pr_cont("\n");
-		nv_error(priv, "ch %d [0x%010llx] subc %d class 0x%04x "
-			       "mthd 0x%04x data 0x%08x\n",
-			 chid, (u64)inst << 12, subc, class, mthd, data);
+		nv_error(priv,
+			 "ch %d [0x%010llx %s] subc %d class 0x%04x mthd 0x%04x data 0x%08x\n",
+			 chid, (u64)inst << 12, nouveau_client_name(engctx),
+			 subc, class, mthd, data);
 	}
 
 	if (nv_rd32(priv, 0x400824) & (1 << 31))
diff --git a/drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c b/drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c
index 5ab6645..4c5b085 100644
--- a/drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c
+++ b/drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c
@@ -433,10 +433,10 @@ nvc0_graph_intr(struct nouveau_subdev *subdev)
 	if (stat & 0x00000010) {
 		handle = nouveau_handle_get_class(engctx, class);
 		if (!handle || nv_call(handle->object, mthd, data)) {
-			nv_error(priv, "ILLEGAL_MTHD ch %d [0x%010llx] "
-				     "subc %d class 0x%04x mthd 0x%04x "
-				     "data 0x%08x\n",
-				 chid, inst << 12, subc, class, mthd, data);
+			nv_error(priv,
+				 "ILLEGAL_MTHD ch %d [0x%010llx %s] subc %d class 0x%04x mthd 0x%04x data 0x%08x\n",
+				 chid, inst << 12, nouveau_client_name(engctx),
+				 subc, class, mthd, data);
 		}
 		nouveau_handle_put(handle);
 		nv_wr32(priv, 0x400100, 0x00000010);
@@ -444,9 +444,10 @@ nvc0_graph_intr(struct nouveau_subdev *subdev)
 	}
 
 	if (stat & 0x00000020) {
-		nv_error(priv, "ILLEGAL_CLASS ch %d [0x%010llx] subc %d "
-			     "class 0x%04x mthd 0x%04x data 0x%08x\n",
-			chid, inst << 12, subc, class, mthd, data);
+		nv_error(priv,
+			 "ILLEGAL_CLASS ch %d [0x%010llx %s] subc %d class 0x%04x mthd 0x%04x data 0x%08x\n",
+			 chid, inst << 12, nouveau_client_name(engctx), subc,
+			 class, mthd, data);
 		nv_wr32(priv, 0x400100, 0x00000020);
 		stat &= ~0x00000020;
 	}
@@ -454,15 +455,16 @@ nvc0_graph_intr(struct nouveau_subdev *subdev)
 	if (stat & 0x00100000) {
 		nv_error(priv, "DATA_ERROR [");
 		nouveau_enum_print(nv50_data_error_names, code);
-		pr_cont("] ch %d [0x%010llx] subc %d class 0x%04x "
-		       "mthd 0x%04x data 0x%08x\n",
-		       chid, inst << 12, subc, class, mthd, data);
+		pr_cont("] ch %d [0x%010llx %s] subc %d class 0x%04x mthd 0x%04x data 0x%08x\n",
+			chid, inst << 12, nouveau_client_name(engctx), subc,
+			class, mthd, data);
 		nv_wr32(priv, 0x400100, 0x00100000);
 		stat &= ~0x00100000;
 	}
 
 	if (stat & 0x00200000) {
-		nv_error(priv, "TRAP ch %d [0x%010llx]\n", chid, inst << 12);
+		nv_error(priv, "TRAP ch %d [0x%010llx %s]\n", chid, inst << 12,
+			 nouveau_client_name(engctx));
 		nvc0_graph_trap_intr(priv);
 		nv_wr32(priv, 0x400100, 0x00200000);
 		stat &= ~0x00200000;
diff --git a/drivers/gpu/drm/nouveau/core/engine/graph/nve0.c b/drivers/gpu/drm/nouveau/core/engine/graph/nve0.c
index 8aba211..9265b70 100644
--- a/drivers/gpu/drm/nouveau/core/engine/graph/nve0.c
+++ b/drivers/gpu/drm/nouveau/core/engine/graph/nve0.c
@@ -78,15 +78,16 @@ nve0_graph_ctxctl_isr(struct nvc0_graph_priv *priv)
 }
 
 static void
-nve0_graph_trap_isr(struct nvc0_graph_priv *priv, int chid, u64 inst)
+nve0_graph_trap_isr(struct nvc0_graph_priv *priv, int chid, u64 inst,
+		struct nouveau_object *engctx)
 {
 	u32 trap = nv_rd32(priv, 0x400108);
 	int rop;
 
 	if (trap & 0x00000001) {
 		u32 stat = nv_rd32(priv, 0x404000);
-		nv_error(priv, "DISPATCH ch %d [0x%010llx] 0x%08x\n",
-			 chid, inst, stat);
+		nv_error(priv, "DISPATCH ch %d [0x%010llx %s] 0x%08x\n",
+			 chid, inst, nouveau_client_name(engctx), stat);
 		nv_wr32(priv, 0x404000, 0xc0000000);
 		nv_wr32(priv, 0x400108, 0x00000001);
 		trap &= ~0x00000001;
@@ -94,8 +95,8 @@ nve0_graph_trap_isr(struct nvc0_graph_priv *priv, int chid, u64 inst)
 
 	if (trap & 0x00000010) {
 		u32 stat = nv_rd32(priv, 0x405840);
-		nv_error(priv, "SHADER ch %d [0x%010llx] 0x%08x\n",
-			 chid, inst, stat);
+		nv_error(priv, "SHADER ch %d [0x%010llx %s] 0x%08x\n",
+			 chid, inst, nouveau_client_name(engctx), stat);
 		nv_wr32(priv, 0x405840, 0xc0000000);
 		nv_wr32(priv, 0x400108, 0x00000010);
 		trap &= ~0x00000010;
@@ -105,8 +106,10 @@ nve0_graph_trap_isr(struct nvc0_graph_priv *priv, int chid, u64 inst)
 		for (rop = 0; rop < priv->rop_nr; rop++) {
 			u32 statz = nv_rd32(priv, ROP_UNIT(rop, 0x070));
 			u32 statc = nv_rd32(priv, ROP_UNIT(rop, 0x144));
-			nv_error(priv, "ROP%d ch %d [0x%010llx] 0x%08x 0x%08x\n",
-				 rop, chid, inst, statz, statc);
+			nv_error(priv,
+				 "ROP%d ch %d [0x%010llx %s] 0x%08x 0x%08x\n",
+				 rop, chid, inst, nouveau_client_name(engctx),
+				 statz, statc);
 			nv_wr32(priv, ROP_UNIT(rop, 0x070), 0xc0000000);
 			nv_wr32(priv, ROP_UNIT(rop, 0x144), 0xc0000000);
 		}
@@ -115,8 +118,8 @@ nve0_graph_trap_isr(struct nvc0_graph_priv *priv, int chid, u64 inst)
 	}
 
 	if (trap) {
-		nv_error(priv, "TRAP ch %d [0x%010llx] 0x%08x\n",
-			 chid, inst, trap);
+		nv_error(priv, "TRAP ch %d [0x%010llx %s] 0x%08x\n",
+			 chid, inst, nouveau_client_name(engctx), trap);
 		nv_wr32(priv, 0x400108, trap);
 	}
 }
@@ -145,10 +148,10 @@ nve0_graph_intr(struct nouveau_subdev *subdev)
 	if (stat & 0x00000010) {
 		handle = nouveau_handle_get_class(engctx, class);
 		if (!handle || nv_call(handle->object, mthd, data)) {
-			nv_error(priv, "ILLEGAL_MTHD ch %d [0x%010llx] "
-				     "subc %d class 0x%04x mthd 0x%04x "
-				     "data 0x%08x\n",
-				 chid, inst, subc, class, mthd, data);
+			nv_error(priv,
+				 "ILLEGAL_MTHD ch %d [0x%010llx %s] subc %d class 0x%04x mthd 0x%04x data 0x%08x\n",
+				 chid, inst, nouveau_client_name(engctx), subc,
+				 class, mthd, data);
 		}
 		nouveau_handle_put(handle);
 		nv_wr32(priv, 0x400100, 0x00000010);
@@ -156,9 +159,10 @@ nve0_graph_intr(struct nouveau_subdev *subdev)
 	}
 
 	if (stat & 0x00000020) {
-		nv_error(priv, "ILLEGAL_CLASS ch %d [0x%010llx] subc %d "
-			     "class 0x%04x mthd 0x%04x data 0x%08x\n",
-			 chid, inst, subc, class, mthd, data);
+		nv_error(priv,
+			 "ILLEGAL_CLASS ch %d [0x%010llx %s] subc %d class 0x%04x mthd 0x%04x data 0x%08x\n",
+			 chid, inst, nouveau_client_name(engctx), subc, class,
+			 mthd, data);
 		nv_wr32(priv, 0x400100, 0x00000020);
 		stat &= ~0x00000020;
 	}
@@ -166,15 +170,15 @@ nve0_graph_intr(struct nouveau_subdev *subdev)
 	if (stat & 0x00100000) {
 		nv_error(priv, "DATA_ERROR [");
 		nouveau_enum_print(nv50_data_error_names, code);
-		pr_cont("] ch %d [0x%010llx] subc %d class 0x%04x "
-		       "mthd 0x%04x data 0x%08x\n",
-		       chid, inst, subc, class, mthd, data);
+		pr_cont("] ch %d [0x%010llx %s] subc %d class 0x%04x mthd 0x%04x data 0x%08x\n",
+			chid, inst, nouveau_client_name(engctx), subc, class,
+			mthd, data);
 		nv_wr32(priv, 0x400100, 0x00100000);
 		stat &= ~0x00100000;
 	}
 
 	if (stat & 0x00200000) {
-		nve0_graph_trap_isr(priv, chid, inst);
+		nve0_graph_trap_isr(priv, chid, inst, engctx);
 		nv_wr32(priv, 0x400100, 0x00200000);
 		stat &= ~0x00200000;
 	}
diff --git a/drivers/gpu/drm/nouveau/core/engine/mpeg/nv31.c b/drivers/gpu/drm/nouveau/core/engine/mpeg/nv31.c
index 9fd8637..49ecbb8 100644
--- a/drivers/gpu/drm/nouveau/core/engine/mpeg/nv31.c
+++ b/drivers/gpu/drm/nouveau/core/engine/mpeg/nv31.c
@@ -22,6 +22,7 @@
  * Authors: Ben Skeggs
  */
 
+#include <core/client.h>
 #include <core/os.h>
 #include <core/class.h>
 #include <core/engctx.h>
@@ -231,8 +232,10 @@ nv31_mpeg_intr(struct nouveau_subdev *subdev)
 	nv_wr32(priv, 0x00b230, 0x00000001);
 
 	if (show) {
-		nv_error(priv, "ch %d [0x%08x] 0x%08x 0x%08x 0x%08x 0x%08x\n",
-			 chid, inst << 4, stat, type, mthd, data);
+		nv_error(priv,
+			 "ch %d [0x%08x %s] 0x%08x 0x%08x 0x%08x 0x%08x\n",
+			 chid, inst << 4, nouveau_client_name(engctx), stat,
+			 type, mthd, data);
 	}
 
 	nouveau_engctx_put(engctx);
diff --git a/drivers/gpu/drm/nouveau/core/subdev/fb/nv50.c b/drivers/gpu/drm/nouveau/core/subdev/fb/nv50.c
index 88bdb02..f33133a 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/fb/nv50.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/fb/nv50.c
@@ -22,8 +22,10 @@
  * Authors: Ben Skeggs
  */
 
-#include <core/object.h>
+#include <core/client.h>
 #include <core/enum.h>
+#include <core/engctx.h>
+#include <core/object.h>
 
 #include <subdev/fb.h>
 #include <subdev/bios.h>
@@ -302,17 +304,18 @@ static const struct nouveau_enum vm_client[] = {
 };
 
 static const struct nouveau_enum vm_engine[] = {
-	{ 0x00000000, "PGRAPH", NULL },
-	{ 0x00000001, "PVP", NULL },
+	{ 0x00000000, "PGRAPH", NULL, NVDEV_ENGINE_GR },
+	{ 0x00000001, "PVP", NULL, NVDEV_ENGINE_VP },
 	{ 0x00000004, "PEEPHOLE", NULL },
-	{ 0x00000005, "PFIFO", vm_pfifo_subclients },
+	{ 0x00000005, "PFIFO", vm_pfifo_subclients, NVDEV_ENGINE_FIFO },
 	{ 0x00000006, "BAR", vm_bar_subclients },
-	{ 0x00000008, "PPPP", NULL },
-	{ 0x00000009, "PBSP", NULL },
-	{ 0x0000000a, "PCRYPT", NULL },
+	{ 0x00000008, "PPPP", NULL, NVDEV_ENGINE_PPP },
+	{ 0x00000008, "PMPEG", NULL, NVDEV_ENGINE_MPEG },
+	{ 0x00000009, "PBSP", NULL, NVDEV_ENGINE_BSP },
+	{ 0x0000000a, "PCRYPT", NULL, NVDEV_ENGINE_CRYPT },
 	{ 0x0000000b, "PCOUNTER", NULL },
 	{ 0x0000000c, "SEMAPHORE_BG", NULL },
-	{ 0x0000000d, "PCOPY", NULL },
+	{ 0x0000000d, "PCOPY", NULL, NVDEV_ENGINE_COPY0 },
 	{ 0x0000000e, "PDAEMON", NULL },
 	{}
 };
@@ -334,8 +337,10 @@ static void
 nv50_fb_intr(struct nouveau_subdev *subdev)
 {
 	struct nouveau_device *device = nv_device(subdev);
+	struct nouveau_engine *engine;
 	struct nv50_fb_priv *priv = (void *)subdev;
 	const struct nouveau_enum *en, *cl;
+	struct nouveau_object *engctx = NULL;
 	u32 trap[6], idx, chan;
 	u8 st0, st1, st2, st3;
 	int i;
@@ -366,11 +371,29 @@ nv50_fb_intr(struct nouveau_subdev *subdev)
 	}
 	chan = (trap[2] << 16) | trap[1];
 
-	nv_error(priv, "trapped %s at 0x%02x%04x%04x on channel 0x%08x ",
+	en = nouveau_enum_find(vm_engine, st0);
+
+	if (en && en->data2) {
+		while (en->name && en->value == st0 && en->data2) {
+			engine = nouveau_engine(subdev, en->data2);
+			if (engine) {
+				engctx = nouveau_engctx_get(engine, chan);
+				if (engctx)
+					break;
+			}
+			en++;
+		}
+		if (en->value != st0)
+			en = NULL;
+	}
+
+	nv_error(priv, "trapped %s at 0x%02x%04x%04x on channel 0x%08x [%s] ",
 		 (trap[5] & 0x00000100) ? "read" : "write",
-		 trap[5] & 0xff, trap[4] & 0xffff, trap[3] & 0xffff, chan);
+		 trap[5] & 0xff, trap[4] & 0xffff, trap[3] & 0xffff, chan,
+		 nouveau_client_name(engctx));
+
+	nouveau_engctx_put(engctx);
 
-	en = nouveau_enum_find(vm_engine, st0);
 	if (en)
 		pr_cont("%s/", en->name);
 	else
diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.c b/drivers/gpu/drm/nouveau/nouveau_chan.c
index 174300b..525a517 100644
--- a/drivers/gpu/drm/nouveau/nouveau_chan.c
+++ b/drivers/gpu/drm/nouveau/nouveau_chan.c
@@ -58,7 +58,8 @@ nouveau_channel_idle(struct nouveau_channel *chan)
 	}
 
 	if (ret)
-		NV_ERROR(cli, "failed to idle channel 0x%08x\n", chan->handle);
+		NV_ERROR(cli, "failed to idle channel 0x%08x [%s]\n",
+			 chan->handle, cli->base.name);
 	return ret;
 }
 
-- 
1.7.12

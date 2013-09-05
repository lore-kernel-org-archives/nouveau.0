From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH 4/7] drm/nv10: fix chipset checks,
	mostly for the benefit of nv1a
Date: Thu,  5 Sep 2013 04:45:03 -0400
Message-ID: <1378370706-18599-4-git-send-email-imirkin@alum.mit.edu>
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

NV1A is numerically higher than NV17 but generationally lower. Use the
new card type to help disambiguate.

Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
---

A previous version, not based on card type, was found to help NV1A users.

 drivers/gpu/drm/nouveau/core/engine/device/base.c  |  2 +-
 drivers/gpu/drm/nouveau/core/engine/graph/nv10.c   | 14 +++++++++-----
 drivers/gpu/drm/nouveau/core/subdev/devinit/nv04.c |  3 ++-
 drivers/gpu/drm/nouveau/core/subdev/devinit/nv10.c | 10 ++++++++--
 drivers/gpu/drm/nouveau/nouveau_drm.c              |  3 ++-
 5 files changed, 22 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/core/engine/device/base.c b/drivers/gpu/drm/nouveau/core/engine/device/base.c
index 652cc3b..3d57731 100644
--- a/drivers/gpu/drm/nouveau/core/engine/device/base.c
+++ b/drivers/gpu/drm/nouveau/core/engine/device/base.c
@@ -219,7 +219,7 @@ nouveau_devobj_ctor(struct nouveau_object *parent,
 		nv_info(device, "Family : NV%02X\n", device->card_type);
 
 		/* determine frequency of timing crystal */
-		if ( device->chipset < 0x17 ||
+		if ( device->card_type <= NV_10 || device->chipset < 0x17 ||
 		    (device->chipset >= 0x20 && device->chipset < 0x25))
 			strap &= 0x00000040;
 		else
diff --git a/drivers/gpu/drm/nouveau/core/engine/graph/nv10.c b/drivers/gpu/drm/nouveau/core/engine/graph/nv10.c
index 23c143a..4532f7e 100644
--- a/drivers/gpu/drm/nouveau/core/engine/graph/nv10.c
+++ b/drivers/gpu/drm/nouveau/core/engine/graph/nv10.c
@@ -945,7 +945,8 @@ nv10_graph_load_context(struct nv10_graph_chan *chan, int chid)
 	for (i = 0; i < ARRAY_SIZE(nv10_graph_ctx_regs); i++)
 		nv_wr32(priv, nv10_graph_ctx_regs[i], chan->nv10[i]);
 
-	if (nv_device(priv)->chipset >= 0x17) {
+	if (nv_device(priv)->card_type >= NV_11 &&
+	    nv_device(priv)->chipset >= 0x17) {
 		for (i = 0; i < ARRAY_SIZE(nv17_graph_ctx_regs); i++)
 			nv_wr32(priv, nv17_graph_ctx_regs[i], chan->nv17[i]);
 	}
@@ -970,7 +971,8 @@ nv10_graph_unload_context(struct nv10_graph_chan *chan)
 	for (i = 0; i < ARRAY_SIZE(nv10_graph_ctx_regs); i++)
 		chan->nv10[i] = nv_rd32(priv, nv10_graph_ctx_regs[i]);
 
-	if (nv_device(priv)->chipset >= 0x17) {
+	if (nv_device(priv)->card_type >= NV_11 &&
+	    nv_device(priv)->chipset >= 0x17) {
 		for (i = 0; i < ARRAY_SIZE(nv17_graph_ctx_regs); i++)
 			chan->nv17[i] = nv_rd32(priv, nv17_graph_ctx_regs[i]);
 	}
@@ -1052,7 +1054,8 @@ nv10_graph_context_ctor(struct nouveau_object *parent,
 	NV_WRITE_CTX(0x00400e14, 0x00001000);
 	NV_WRITE_CTX(0x00400e30, 0x00080008);
 	NV_WRITE_CTX(0x00400e34, 0x00080008);
-	if (nv_device(priv)->chipset >= 0x17) {
+	if (nv_device(priv)->card_type >= NV_11 &&
+	    nv_device(priv)->chipset >= 0x17) {
 		/* is it really needed ??? */
 		NV17_WRITE_CTX(NV10_PGRAPH_DEBUG_4,
 					nv_rd32(priv, NV10_PGRAPH_DEBUG_4));
@@ -1231,7 +1234,7 @@ nv10_graph_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 		nv_engine(priv)->sclass = nv10_graph_sclass;
 	else
 	if (nv_device(priv)->chipset <  0x17 ||
-	    nv_device(priv)->chipset == 0x1a)
+	    nv_device(priv)->card_type < NV_11)
 		nv_engine(priv)->sclass = nv15_graph_sclass;
 	else
 		nv_engine(priv)->sclass = nv17_graph_sclass;
@@ -1270,7 +1273,8 @@ nv10_graph_init(struct nouveau_object *object)
 	nv_wr32(priv, NV04_PGRAPH_DEBUG_2, 0x25f92ad9);
 	nv_wr32(priv, NV04_PGRAPH_DEBUG_3, 0x55DE0830 | (1 << 29) | (1 << 31));
 
-	if (nv_device(priv)->chipset >= 0x17) {
+	if (nv_device(priv)->card_type >= NV_11 &&
+	    nv_device(priv)->chipset >= 0x17) {
 		nv_wr32(priv, NV10_PGRAPH_DEBUG_4, 0x1f000000);
 		nv_wr32(priv, 0x400a10, 0x03ff3fb6);
 		nv_wr32(priv, 0x400838, 0x002f8684);
diff --git a/drivers/gpu/drm/nouveau/core/subdev/devinit/nv04.c b/drivers/gpu/drm/nouveau/core/subdev/devinit/nv04.c
index b22357d..27c8235 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/devinit/nv04.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/devinit/nv04.c
@@ -168,7 +168,8 @@ setPLL_single(struct nouveau_devinit *devinit, u32 reg,
 		/* downclock -- write new NM first */
 		nv_wr32(devinit, reg, (oldpll & 0xffff0000) | pv->NM1);
 
-	if (chip_version < 0x17 && chip_version != 0x11)
+	if ((chip_version < 0x17 || chip_version == 0x1a) &&
+	    chip_version != 0x11)
 		/* wait a bit on older chips */
 		msleep(64);
 	nv_rd32(devinit, reg);
diff --git a/drivers/gpu/drm/nouveau/core/subdev/devinit/nv10.c b/drivers/gpu/drm/nouveau/core/subdev/devinit/nv10.c
index 463b08f..8d274db 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/devinit/nv10.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/devinit/nv10.c
@@ -38,12 +38,18 @@ static void
 nv10_devinit_meminit(struct nouveau_devinit *devinit)
 {
 	struct nv10_devinit_priv *priv = (void *)devinit;
-	const int mem_width[] = { 0x10, 0x00, 0x20 };
-	const int mem_width_count = nv_device(priv)->chipset >= 0x17 ? 3 : 2;
+	static const int mem_width[] = { 0x10, 0x00, 0x20 };
+	int mem_width_count;
 	uint32_t patt = 0xdeadbeef;
 	struct io_mapping *fb;
 	int i, j, k;
 
+	if (nv_device(priv)->card_type >= NV_11 &&
+	    nv_device(priv)->chipset >= 0x17)
+		mem_width_count = 3;
+	else
+		mem_width_count = 2;
+
 	/* Map the framebuffer aperture */
 	fb = fbmem_init(nv_device(priv)->pdev);
 	if (!fb) {
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 6197266..33773f9 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -170,7 +170,8 @@ nouveau_accel_init(struct nouveau_drm *drm)
 
 	/* initialise synchronisation routines */
 	if      (device->card_type < NV_10) ret = nv04_fence_create(drm);
-	else if (device->chipset   <  0x17) ret = nv10_fence_create(drm);
+	else if (device->card_type < NV_11 ||
+		 device->chipset   <  0x17) ret = nv10_fence_create(drm);
 	else if (device->card_type < NV_50) ret = nv17_fence_create(drm);
 	else if (device->chipset   <  0x84) ret = nv50_fence_create(drm);
 	else if (device->card_type < NV_C0) ret = nv84_fence_create(drm);
-- 
1.8.1.5

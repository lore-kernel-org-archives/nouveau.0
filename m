From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/5] nouveau: Fix checkpatch.pl error messages
Date: Sat, 19 Mar 2011 23:31:51 +0000
Message-ID: <1300577514-6833-2-git-send-email-emil.l.velikov@gmail.com>
References: <1300577514-6833-1-git-send-email-emil.l.velikov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1300577514-6833-1-git-send-email-emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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

Fix 'ERROR: code indent should use tabs where possible'
Fix 'ERROR: space required before the open parenthesis ('

Signed-off-by: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_drv.h |    6 +++---
 drivers/gpu/drm/nouveau/nouveau_mem.c |   14 +++++++-------
 drivers/gpu/drm/nouveau/nv50_grctx.c  |    4 ++--
 drivers/gpu/drm/nouveau/nvc0_graph.c  |   18 +++++++++---------
 4 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index 0611188..0c18a06 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -884,13 +884,13 @@ extern void nouveau_channel_idle(struct nouveau_channel *chan);
 	int ret = nouveau_gpuobj_class_new((d), (c), NVOBJ_ENGINE_##e);        \
 	if (ret)                                                               \
 		return ret;                                                    \
-} while(0)
+} while (0)
 
 #define NVOBJ_MTHD(d,c,m,e) do {                                               \
 	int ret = nouveau_gpuobj_mthd_new((d), (c), (m), (e));                 \
 	if (ret)                                                               \
 		return ret;                                                    \
-} while(0)
+} while (0)
 
 extern int  nouveau_gpuobj_early_init(struct drm_device *);
 extern int  nouveau_gpuobj_init(struct drm_device *);
@@ -900,7 +900,7 @@ extern void nouveau_gpuobj_resume(struct drm_device *dev);
 extern int  nouveau_gpuobj_class_new(struct drm_device *, u32 class, u32 eng);
 extern int  nouveau_gpuobj_mthd_new(struct drm_device *, u32 class, u32 mthd,
 				    int (*exec)(struct nouveau_channel *,
-					        u32 class, u32 mthd, u32 data));
+						u32 class, u32 mthd, u32 data));
 extern int  nouveau_gpuobj_mthd_call(struct nouveau_channel *, u32, u32, u32);
 extern int  nouveau_gpuobj_mthd_call2(struct drm_device *, int, u32, u32, u32);
 extern int nouveau_gpuobj_channel_init(struct nouveau_channel *,
diff --git a/drivers/gpu/drm/nouveau/nouveau_mem.c b/drivers/gpu/drm/nouveau/nouveau_mem.c
index 12f511e..fd4752b 100644
--- a/drivers/gpu/drm/nouveau/nouveau_mem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_mem.c
@@ -603,7 +603,7 @@ nouveau_mem_timing_init(struct drm_device *dev)
 
 	/* Get "some number" from the timing reg for NV_40
 	 * Used in calculations later */
-	if(dev_priv->card_type == NV_40) {
+	if (dev_priv->card_type == NV_40) {
 		magic_number = (nv_rd32(dev,0x100228) & 0x0f000000) >> 24;
 	}
 
@@ -649,22 +649,22 @@ nouveau_mem_timing_init(struct drm_device *dev)
 		timing->reg_100224 = (tUNK_0 + tUNK_19 + 1 + magic_number) << 24 |
 				      tUNK_18 << 16 |
 				      (tUNK_1 + tUNK_19 + 1 + magic_number) << 8;
-		if(dev_priv->chipset == 0xa8) {
+		if (dev_priv->chipset == 0xa8) {
 			timing->reg_100224 |= (tUNK_2 - 1);
 		} else {
 			timing->reg_100224 |= (tUNK_2 + 2 - magic_number);
 		}
 
 		timing->reg_100228 = (tUNK_12 << 16 | tUNK_11 << 8 | tUNK_10);
-		if(dev_priv->chipset >= 0xa3 && dev_priv->chipset < 0xaa) {
+		if (dev_priv->chipset >= 0xa3 && dev_priv->chipset < 0xaa) {
 			timing->reg_100228 |= (tUNK_19 - 1) << 24;
 		}
 
-		if(dev_priv->card_type == NV_40) {
+		if (dev_priv->card_type == NV_40) {
 			/* NV40: don't know what the rest of the regs are..
 			 * And don't need to know either */
 			timing->reg_100228 |= 0x20200000 | magic_number << 24;
-		} else if(dev_priv->card_type >= NV_50) {
+		} else if (dev_priv->card_type >= NV_50) {
 			/* XXX: reg_10022c */
 			timing->reg_10022c = tUNK_2 - 1;
 
@@ -674,7 +674,7 @@ nouveau_mem_timing_init(struct drm_device *dev)
 			timing->reg_100234 = (tRAS << 24 | tRC);
 			timing->reg_100234 += max(tUNK_10,tUNK_11) << 16;
 
-			if(dev_priv->chipset < 0xa3) {
+			if (dev_priv->chipset < 0xa3) {
 				timing->reg_100234 |= (tUNK_2 + 2) << 8;
 			} else {
 				/* XXX: +6? */
@@ -685,7 +685,7 @@ nouveau_mem_timing_init(struct drm_device *dev)
 			 * reg_100238: 0x00??????
 			 * reg_10023c: 0x!!??0202 for NV50+ cards (empirical evidence) */
 			timing->reg_10023c = 0x202;
-			if(dev_priv->chipset < 0xa3) {
+			if (dev_priv->chipset < 0xa3) {
 				timing->reg_10023c |= 0x4000000 | (tUNK_2 - 1) << 16;
 			} else {
 				/* currently unknown
diff --git a/drivers/gpu/drm/nouveau/nv50_grctx.c b/drivers/gpu/drm/nouveau/nv50_grctx.c
index 6a4290a..9d1f6ba 100644
--- a/drivers/gpu/drm/nouveau/nv50_grctx.c
+++ b/drivers/gpu/drm/nouveau/nv50_grctx.c
@@ -748,7 +748,7 @@ nv50_graph_construct_mmio(struct nouveau_grctx *ctx)
 				gr_def(ctx, offset + 0x64, 0x0000001f);
 				gr_def(ctx, offset + 0x68, 0x0000000f);
 				gr_def(ctx, offset + 0x6c, 0x0000000f);
-			} else if(dev_priv->chipset < 0xa0) {
+			} else if (dev_priv->chipset < 0xa0) {
 				cp_ctx(ctx, offset + 0x50, 1);
 				cp_ctx(ctx, offset + 0x70, 1);
 			} else {
@@ -2837,7 +2837,7 @@ nv50_graph_construct_xfer_tprop(struct nouveau_grctx *ctx)
 	xf_emit(ctx, 1, 1);		/* 00000001 DST_LINEAR */
 	if (IS_NVA3F(dev_priv->chipset))
 		xf_emit(ctx, 1, 1);	/* 0000001f tesla UNK169C */
-	if(dev_priv->chipset == 0x50)
+	if (dev_priv->chipset == 0x50)
 		xf_emit(ctx, 1, 0);	/* ff */
 	else
 		xf_emit(ctx, 3, 0);	/* 1, 7, 3ff */
diff --git a/drivers/gpu/drm/nouveau/nvc0_graph.c b/drivers/gpu/drm/nouveau/nvc0_graph.c
index 3de9b72..c19ff30 100644
--- a/drivers/gpu/drm/nouveau/nvc0_graph.c
+++ b/drivers/gpu/drm/nouveau/nvc0_graph.c
@@ -200,15 +200,15 @@ nvc0_graph_create_context(struct nouveau_channel *chan)
 	for (i = 0; i < priv->grctx_size; i += 4)
 		nv_wo32(grctx, i, priv->grctx_vals[i / 4]);
 
-        nv_wo32(grctx, 0xf4, 0);
-        nv_wo32(grctx, 0xf8, 0);
-        nv_wo32(grctx, 0x10, grch->mmio_nr);
-        nv_wo32(grctx, 0x14, lower_32_bits(grch->mmio->vinst));
-        nv_wo32(grctx, 0x18, upper_32_bits(grch->mmio->vinst));
-        nv_wo32(grctx, 0x1c, 1);
-        nv_wo32(grctx, 0x20, 0);
-        nv_wo32(grctx, 0x28, 0);
-        nv_wo32(grctx, 0x2c, 0);
+	nv_wo32(grctx, 0xf4, 0);
+	nv_wo32(grctx, 0xf8, 0);
+	nv_wo32(grctx, 0x10, grch->mmio_nr);
+	nv_wo32(grctx, 0x14, lower_32_bits(grch->mmio->vinst));
+	nv_wo32(grctx, 0x18, upper_32_bits(grch->mmio->vinst));
+	nv_wo32(grctx, 0x1c, 1);
+	nv_wo32(grctx, 0x20, 0);
+	nv_wo32(grctx, 0x28, 0);
+	nv_wo32(grctx, 0x2c, 0);
 	pinstmem->flush(dev);
 	return 0;
 
-- 
1.7.1

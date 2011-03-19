From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 5/5] nouveau: Silence checkpatch.pl error messages
Date: Sat, 19 Mar 2011 23:31:54 +0000
Message-ID: <1300577514-6833-5-git-send-email-emil.l.velikov@gmail.com>
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

This patch fixes messages such as
ERROR: space required after that ','
ERROR: spaces required around that '='

Signed-off-by: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_drv.h   |    4 ++--
 drivers/gpu/drm/nouveau/nouveau_grctx.h |   10 +++++-----
 drivers/gpu/drm/nouveau/nouveau_mem.c   |    4 ++--
 drivers/gpu/drm/nouveau/nouveau_reg.h   |   14 +++++++-------
 drivers/gpu/drm/nouveau/nv50_graph.c    |    2 +-
 drivers/gpu/drm/nouveau/nvc0_graph.h    |   10 +++++-----
 6 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index 0c18a06..383093e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -880,13 +880,13 @@ extern void nouveau_channel_ref(struct nouveau_channel *chan,
 extern void nouveau_channel_idle(struct nouveau_channel *chan);
 
 /* nouveau_object.c */
-#define NVOBJ_CLASS(d,c,e) do {                                                \
+#define NVOBJ_CLASS(d, c, e) do {                                              \
 	int ret = nouveau_gpuobj_class_new((d), (c), NVOBJ_ENGINE_##e);        \
 	if (ret)                                                               \
 		return ret;                                                    \
 } while (0)
 
-#define NVOBJ_MTHD(d,c,m,e) do {                                               \
+#define NVOBJ_MTHD(d, c, m, e) do {                                            \
 	int ret = nouveau_gpuobj_mthd_new((d), (c), (m), (e));                 \
 	if (ret)                                                               \
 		return ret;                                                    \
diff --git a/drivers/gpu/drm/nouveau/nouveau_grctx.h b/drivers/gpu/drm/nouveau/nouveau_grctx.h
index 4a8ad13..86c2e37 100644
--- a/drivers/gpu/drm/nouveau/nouveau_grctx.h
+++ b/drivers/gpu/drm/nouveau/nouveau_grctx.h
@@ -87,10 +87,10 @@ _cp_bra(struct nouveau_grctx *ctx, u32 mod, int flag, int state, int name)
 	cp_out(ctx, CP_BRA | (mod << 18) | ip | flag |
 		    (state ? 0 : CP_BRA_IF_CLEAR));
 }
-#define cp_bra(c,f,s,n) _cp_bra((c), 0, CP_FLAG_##f, CP_FLAG_##f##_##s, n)
+#define cp_bra(c, f, s, n) _cp_bra((c), 0, CP_FLAG_##f, CP_FLAG_##f##_##s, n)
 #ifdef CP_BRA_MOD
-#define cp_cal(c,f,s,n) _cp_bra((c), 1, CP_FLAG_##f, CP_FLAG_##f##_##s, n)
-#define cp_ret(c,f,s) _cp_bra((c), 2, CP_FLAG_##f, CP_FLAG_##f##_##s, 0)
+#define cp_cal(c, f, s, n) _cp_bra((c), 1, CP_FLAG_##f, CP_FLAG_##f##_##s, n)
+#define cp_ret(c, f, s) _cp_bra((c), 2, CP_FLAG_##f, CP_FLAG_##f##_##s, 0)
 #endif
 
 static inline void
@@ -98,14 +98,14 @@ _cp_wait(struct nouveau_grctx *ctx, int flag, int state)
 {
 	cp_out(ctx, CP_WAIT | flag | (state ? CP_WAIT_SET : 0));
 }
-#define cp_wait(c,f,s) _cp_wait((c), CP_FLAG_##f, CP_FLAG_##f##_##s)
+#define cp_wait(c, f, s) _cp_wait((c), CP_FLAG_##f, CP_FLAG_##f##_##s)
 
 static inline void
 _cp_set(struct nouveau_grctx *ctx, int flag, int state)
 {
 	cp_out(ctx, CP_SET | flag | (state ? CP_SET_1 : 0));
 }
-#define cp_set(c,f,s) _cp_set((c), CP_FLAG_##f, CP_FLAG_##f##_##s)
+#define cp_set(c, f, s) _cp_set((c), CP_FLAG_##f, CP_FLAG_##f##_##s)
 
 static inline void
 cp_pos(struct nouveau_grctx *ctx, int offset)
diff --git a/drivers/gpu/drm/nouveau/nouveau_mem.c b/drivers/gpu/drm/nouveau/nouveau_mem.c
index fd4752b..2154e40 100644
--- a/drivers/gpu/drm/nouveau/nouveau_mem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_mem.c
@@ -604,7 +604,7 @@ nouveau_mem_timing_init(struct drm_device *dev)
 	/* Get "some number" from the timing reg for NV_40
 	 * Used in calculations later */
 	if (dev_priv->card_type == NV_40) {
-		magic_number = (nv_rd32(dev,0x100228) & 0x0f000000) >> 24;
+		magic_number = (nv_rd32(dev, 0x100228) & 0x0f000000) >> 24;
 	}
 
 	entry = mem + mem[1];
@@ -672,7 +672,7 @@ nouveau_mem_timing_init(struct drm_device *dev)
 						  tUNK_13 << 8  | tUNK_13);
 
 			timing->reg_100234 = (tRAS << 24 | tRC);
-			timing->reg_100234 += max(tUNK_10,tUNK_11) << 16;
+			timing->reg_100234 += max(tUNK_10, tUNK_11) << 16;
 
 			if (dev_priv->chipset < 0xa3) {
 				timing->reg_100234 |= (tUNK_2 + 2) << 8;
diff --git a/drivers/gpu/drm/nouveau/nouveau_reg.h b/drivers/gpu/drm/nouveau/nouveau_reg.h
index 04e8fb7..f18cdfc 100644
--- a/drivers/gpu/drm/nouveau/nouveau_reg.h
+++ b/drivers/gpu/drm/nouveau/nouveau_reg.h
@@ -639,9 +639,9 @@
 #    define NV50_PCONNECTOR_I2C_PORT_4                      0x0000e240
 #    define NV50_PCONNECTOR_I2C_PORT_5                      0x0000e258
 
-#define NV50_AUXCH_DATA_OUT(i,n)             ((n) * 4 + (i) * 0x50 + 0x0000e4c0)
+#define NV50_AUXCH_DATA_OUT(i, n)            ((n) * 4 + (i) * 0x50 + 0x0000e4c0)
 #define NV50_AUXCH_DATA_OUT__SIZE                                             4
-#define NV50_AUXCH_DATA_IN(i,n)              ((n) * 4 + (i) * 0x50 + 0x0000e4d0)
+#define NV50_AUXCH_DATA_IN(i, n)             ((n) * 4 + (i) * 0x50 + 0x0000e4d0)
 #define NV50_AUXCH_DATA_IN__SIZE                                              4
 #define NV50_AUXCH_ADDR(i)                             ((i) * 0x50 + 0x0000e4e0)
 #define NV50_AUXCH_CTRL(i)                             ((i) * 0x50 + 0x0000e4e4)
@@ -829,7 +829,7 @@
 #define NV50_PDISPLAY_SOR_BACKLIGHT                                  0x0061c084
 #define NV50_PDISPLAY_SOR_BACKLIGHT_ENABLE                           0x80000000
 #define NV50_PDISPLAY_SOR_BACKLIGHT_LEVEL                            0x00000fff
-#define NV50_SOR_DP_CTRL(i,l)            (0x0061c10c + (i) * 0x800 + (l) * 0x80)
+#define NV50_SOR_DP_CTRL(i, l)           (0x0061c10c + (i) * 0x800 + (l) * 0x80)
 #define NV50_SOR_DP_CTRL_ENABLED                                     0x00000001
 #define NV50_SOR_DP_CTRL_ENHANCED_FRAME_ENABLED                      0x00004000
 #define NV50_SOR_DP_CTRL_LANE_MASK                                   0x001f0000
@@ -841,10 +841,10 @@
 #define NV50_SOR_DP_CTRL_TRAINING_PATTERN_DISABLED                   0x00000000
 #define NV50_SOR_DP_CTRL_TRAINING_PATTERN_1                          0x01000000
 #define NV50_SOR_DP_CTRL_TRAINING_PATTERN_2                          0x02000000
-#define NV50_SOR_DP_UNK118(i,l)          (0x0061c118 + (i) * 0x800 + (l) * 0x80)
-#define NV50_SOR_DP_UNK120(i,l)          (0x0061c120 + (i) * 0x800 + (l) * 0x80)
-#define NV50_SOR_DP_UNK128(i,l)          (0x0061c128 + (i) * 0x800 + (l) * 0x80)
-#define NV50_SOR_DP_UNK130(i,l)          (0x0061c130 + (i) * 0x800 + (l) * 0x80)
+#define NV50_SOR_DP_UNK118(i, l)         (0x0061c118 + (i) * 0x800 + (l) * 0x80)
+#define NV50_SOR_DP_UNK120(i, l)         (0x0061c120 + (i) * 0x800 + (l) * 0x80)
+#define NV50_SOR_DP_UNK128(i, l)         (0x0061c128 + (i) * 0x800 + (l) * 0x80)
+#define NV50_SOR_DP_UNK130(i, l)         (0x0061c130 + (i) * 0x800 + (l) * 0x80)
 
 #define NV50_PDISPLAY_USER(i)                        ((i) * 0x1000 + 0x00640000)
 #define NV50_PDISPLAY_USER_PUT(i)                    ((i) * 0x1000 + 0x00640000)
diff --git a/drivers/gpu/drm/nouveau/nv50_graph.c b/drivers/gpu/drm/nouveau/nv50_graph.c
index 614177c..80130e6 100644
--- a/drivers/gpu/drm/nouveau/nv50_graph.c
+++ b/drivers/gpu/drm/nouveau/nv50_graph.c
@@ -662,7 +662,7 @@ nv50_pgraph_mp_trap(struct drm_device *dev, int tpid, int display)
 			nv_rd32(dev, addr + 0x20);
 			pc = nv_rd32(dev, addr + 0x24);
 			oplow = nv_rd32(dev, addr + 0x70);
-			ophigh= nv_rd32(dev, addr + 0x74);
+			ophigh = nv_rd32(dev, addr + 0x74);
 			NV_INFO(dev, "PGRAPH_TRAP_MP_EXEC - "
 					"TP %d MP %d: ", tpid, i);
 			nouveau_enum_print(nv50_mp_exec_error_names, status);
diff --git a/drivers/gpu/drm/nouveau/nvc0_graph.h b/drivers/gpu/drm/nouveau/nvc0_graph.h
index 93c8777..d32b385 100644
--- a/drivers/gpu/drm/nouveau/nvc0_graph.h
+++ b/drivers/gpu/drm/nouveau/nvc0_graph.h
@@ -28,11 +28,11 @@
 #define GPC_MAX 4
 #define TP_MAX 32
 
-#define ROP_BCAST(r)   (0x408800 + (r))
-#define ROP_UNIT(u,r)  (0x410000 + (u) * 0x400 + (r))
-#define GPC_BCAST(r)   (0x418000 + (r))
-#define GPC_UNIT(t,r)  (0x500000 + (t) * 0x8000 + (r))
-#define TP_UNIT(t,m,r) (0x504000 + (t) * 0x8000 + (m) * 0x800 + (r))
+#define ROP_BCAST(r)     (0x408800 + (r))
+#define ROP_UNIT(u, r)   (0x410000 + (u) * 0x400 + (r))
+#define GPC_BCAST(r)     (0x418000 + (r))
+#define GPC_UNIT(t, r)   (0x500000 + (t) * 0x8000 + (r))
+#define TP_UNIT(t, m, r) (0x504000 + (t) * 0x8000 + (m) * 0x800 + (r))
 
 struct nvc0_graph_priv {
 	u8 gpc_nr;
-- 
1.7.1

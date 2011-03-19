From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/5] nouveau: Fix checkpatch.pl error messages
Date: Sat, 19 Mar 2011 23:31:50 +0000
Message-ID: <1300577514-6833-1-git-send-email-emil.l.velikov@gmail.com>
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

Fix the following message
'ERROR: trailing statements should be on next line'

Signed-off-by: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_display.c |   20 +++++++--
 drivers/gpu/drm/nouveau/nouveau_mem.c     |   12 ++++--
 drivers/gpu/drm/nouveau/nouveau_object.c  |    8 +++-
 drivers/gpu/drm/nouveau/nv50_display.c    |   64 +++++++++++++++++++++-------
 drivers/gpu/drm/nouveau/nv50_fb.c         |    9 +++-
 drivers/gpu/drm/nouveau/nv50_grctx.c      |    3 +-
 drivers/gpu/drm/nouveau/nvc0_grctx.c      |    4 +-
 7 files changed, 88 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
index 764c15d..2dca746 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.c
+++ b/drivers/gpu/drm/nouveau/nouveau_display.c
@@ -91,12 +91,22 @@ nouveau_framebuffer_init(struct drm_device *dev,
 			nv_fb->r_dma = NvEvoVRAM_LP;
 
 		switch (fb->depth) {
-		case  8: nv_fb->r_format = NV50_EVO_CRTC_FB_DEPTH_8; break;
-		case 15: nv_fb->r_format = NV50_EVO_CRTC_FB_DEPTH_15; break;
-		case 16: nv_fb->r_format = NV50_EVO_CRTC_FB_DEPTH_16; break;
+		case  8:
+			nv_fb->r_format = NV50_EVO_CRTC_FB_DEPTH_8;
+			break;
+		case 15:
+			nv_fb->r_format = NV50_EVO_CRTC_FB_DEPTH_15;
+			break;
+		case 16:
+			nv_fb->r_format = NV50_EVO_CRTC_FB_DEPTH_16;
+			break;
 		case 24:
-		case 32: nv_fb->r_format = NV50_EVO_CRTC_FB_DEPTH_24; break;
-		case 30: nv_fb->r_format = NV50_EVO_CRTC_FB_DEPTH_30; break;
+		case 32:
+			nv_fb->r_format = NV50_EVO_CRTC_FB_DEPTH_24;
+			break;
+		case 30:
+			nv_fb->r_format = NV50_EVO_CRTC_FB_DEPTH_30;
+			break;
 		default:
 			 NV_ERROR(dev, "unknown depth %d\n", fb->depth);
 			 return -EINVAL;
diff --git a/drivers/gpu/drm/nouveau/nouveau_mem.c b/drivers/gpu/drm/nouveau/nouveau_mem.c
index 8af07c4..12f511e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_mem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_mem.c
@@ -432,10 +432,14 @@ nouveau_mem_vram_init(struct drm_device *dev)
 		u32 rsvd;
 
 		/* estimate grctx size, the magics come from nv40_grctx.c */
-		if      (dev_priv->chipset == 0x40) rsvd = 0x6aa0 * vs;
-		else if (dev_priv->chipset  < 0x43) rsvd = 0x4f00 * vs;
-		else if (nv44_graph_class(dev))	    rsvd = 0x4980 * vs;
-		else				    rsvd = 0x4a40 * vs;
+		if (dev_priv->chipset == 0x40)
+			rsvd = 0x6aa0 * vs;
+		else if (dev_priv->chipset  < 0x43)
+			rsvd = 0x4f00 * vs;
+		else if (nv44_graph_class(dev))
+			rsvd = 0x4980 * vs;
+		else
+			rsvd = 0x4a40 * vs;
 		rsvd += 16 * 1024;
 		rsvd *= dev_priv->engine.fifo.channels;
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_object.c b/drivers/gpu/drm/nouveau/nouveau_object.c
index 823800d..a89256e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_object.c
+++ b/drivers/gpu/drm/nouveau/nouveau_object.c
@@ -416,9 +416,13 @@ nv50_gpuobj_dma_init(struct nouveau_gpuobj *obj, u32 offset, int class,
 	flags0 |= 0x00100000;
 
 	switch (access) {
-	case NV_MEM_ACCESS_RO: flags0 |= 0x00040000; break;
+	case NV_MEM_ACCESS_RO:
+		flags0 |= 0x00040000;
+		break;
 	case NV_MEM_ACCESS_RW:
-	case NV_MEM_ACCESS_WO: flags0 |= 0x00080000; break;
+	case NV_MEM_ACCESS_WO:
+		flags0 |= 0x00080000;
+		break;
 	default:
 		break;
 	}
diff --git a/drivers/gpu/drm/nouveau/nv50_display.c b/drivers/gpu/drm/nouveau/nv50_display.c
index 75a376c..031116c 100644
--- a/drivers/gpu/drm/nouveau/nv50_display.c
+++ b/drivers/gpu/drm/nouveau/nv50_display.c
@@ -629,8 +629,12 @@ nv50_display_unk10_handler(struct drm_device *dev)
 			continue;
 
 		switch ((mc & 0x00000f00) >> 8) {
-		case 0: type = OUTPUT_ANALOG; break;
-		case 1: type = OUTPUT_TV; break;
+		case 0:
+			type = OUTPUT_ANALOG;
+			break;
+		case 1:
+			type = OUTPUT_TV;
+			break;
 		default:
 			NV_ERROR(dev, "invalid mc, DAC-%d: 0x%08x\n", i, mc);
 			goto ack;
@@ -652,12 +656,24 @@ nv50_display_unk10_handler(struct drm_device *dev)
 			continue;
 
 		switch ((mc & 0x00000f00) >> 8) {
-		case 0: type = OUTPUT_LVDS; break;
-		case 1: type = OUTPUT_TMDS; break;
-		case 2: type = OUTPUT_TMDS; break;
-		case 5: type = OUTPUT_TMDS; break;
-		case 8: type = OUTPUT_DP; break;
-		case 9: type = OUTPUT_DP; break;
+		case 0:
+			type = OUTPUT_LVDS;
+			break;
+		case 1:
+			type = OUTPUT_TMDS;
+			break;
+		case 2:
+			type = OUTPUT_TMDS;
+			break;
+		case 5:
+			type = OUTPUT_TMDS;
+			break;
+		case 8:
+			type = OUTPUT_DP;
+			break;
+		case 9:
+			type = OUTPUT_DP;
+			break;
 		default:
 			NV_ERROR(dev, "invalid mc, SOR-%d: 0x%08x\n", i, mc);
 			goto ack;
@@ -761,8 +777,12 @@ nv50_display_unk20_handler(struct drm_device *dev)
 			continue;
 
 		switch ((mc & 0x00000f00) >> 8) {
-		case 0: type = OUTPUT_ANALOG; break;
-		case 1: type = OUTPUT_TV; break;
+		case 0:
+			type = OUTPUT_ANALOG;
+			break;
+		case 1:
+			type = OUTPUT_TV;
+			break;
 		default:
 			NV_ERROR(dev, "invalid mc, DAC-%d: 0x%08x\n", i, mc);
 			goto ack;
@@ -784,12 +804,24 @@ nv50_display_unk20_handler(struct drm_device *dev)
 			continue;
 
 		switch ((mc & 0x00000f00) >> 8) {
-		case 0: type = OUTPUT_LVDS; break;
-		case 1: type = OUTPUT_TMDS; break;
-		case 2: type = OUTPUT_TMDS; break;
-		case 5: type = OUTPUT_TMDS; break;
-		case 8: type = OUTPUT_DP; break;
-		case 9: type = OUTPUT_DP; break;
+		case 0:
+			type = OUTPUT_LVDS;
+			break;
+		case 1:
+			type = OUTPUT_TMDS;
+			break;
+		case 2:
+			type = OUTPUT_TMDS;
+			break;
+		case 5:
+			type = OUTPUT_TMDS;
+			break;
+		case 8:
+			type = OUTPUT_DP;
+			break;
+		case 9:
+			type = OUTPUT_DP;
+			break;
 		default:
 			NV_ERROR(dev, "invalid mc, SOR-%d: 0x%08x\n", i, mc);
 			goto ack;
diff --git a/drivers/gpu/drm/nouveau/nv50_fb.c b/drivers/gpu/drm/nouveau/nv50_fb.c
index ddebd71..d6880e4 100644
--- a/drivers/gpu/drm/nouveau/nv50_fb.c
+++ b/drivers/gpu/drm/nouveau/nv50_fb.c
@@ -277,9 +277,12 @@ nv50_fb_vm_trap(struct drm_device *dev, int display)
 	else
 		printk("%02x/", st2);
 
-	if      (cl && cl->data) cl = nouveau_enum_find(cl->data, st3);
-	else if (en && en->data) cl = nouveau_enum_find(en->data, st3);
-	else                     cl = NULL;
+	if (cl && cl->data)
+		cl = nouveau_enum_find(cl->data, st3);
+	else if (en && en->data)
+		cl = nouveau_enum_find(en->data, st3);
+	else
+		cl = NULL;
 	if (cl)
 		printk("%s", cl->name);
 	else
diff --git a/drivers/gpu/drm/nouveau/nv50_grctx.c b/drivers/gpu/drm/nouveau/nv50_grctx.c
index 336aab2..6a4290a 100644
--- a/drivers/gpu/drm/nouveau/nv50_grctx.c
+++ b/drivers/gpu/drm/nouveau/nv50_grctx.c
@@ -572,7 +572,8 @@ nv50_graph_construct_mmio(struct nouveau_grctx *ctx)
 
 			/* per-MP state */
 			for (j = 0; j < (dev_priv->chipset < 0xa0 ? 2 : 4); j++) {
-				if (!(units & (1 << (j+24)))) continue;
+				if (!(units & (1 << (j+24))))
+					continue;
 				if (dev_priv->chipset < 0xa0)
 					offset = base + 0x200 + (j<<7);
 				else
diff --git a/drivers/gpu/drm/nouveau/nvc0_grctx.c b/drivers/gpu/drm/nouveau/nvc0_grctx.c
index f880ff7..7aa0cbf 100644
--- a/drivers/gpu/drm/nouveau/nvc0_grctx.c
+++ b/drivers/gpu/drm/nouveau/nvc0_grctx.c
@@ -32,7 +32,9 @@ nv_icmd(struct drm_device *dev, u32 icmd, u32 data)
 {
 	nv_wr32(dev, 0x400204, data);
 	nv_wr32(dev, 0x400200, icmd);
-	while (nv_rd32(dev, 0x400700) & 2) {}
+	while (nv_rd32(dev, 0x400700) & 2) {
+		/* by design */
+	}
 }
 
 static void
-- 
1.7.1

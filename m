From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: [PATCH 3/3] drm/nv04: Context switching fixes.
Date: Sat, 26 Dec 2009 19:21:49 +0100
Message-ID: <1261851709-10677-3-git-send-email-currojerez@riseup.net>
References: <1261851709-10677-1-git-send-email-currojerez@riseup.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1261851709-10677-1-git-send-email-currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Signed-off-by: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nv04_graph.c |  152 +++++++++++++++++----------------
 1 files changed, 78 insertions(+), 74 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nv04_graph.c b/drivers/gpu/drm/nouveau/nv04_graph.c
index 82c77f9..98f3b40 100644
--- a/drivers/gpu/drm/nouveau/nv04_graph.c
+++ b/drivers/gpu/drm/nouveau/nv04_graph.c
@@ -28,6 +28,10 @@
 #include "nouveau_drv.h"
 
 static uint32_t nv04_graph_ctx_regs[] = {
+	0x0040053c,
+	0x00400544,
+	0x00400540,
+	0x00400548,
 	NV04_PGRAPH_CTX_SWITCH1,
 	NV04_PGRAPH_CTX_SWITCH2,
 	NV04_PGRAPH_CTX_SWITCH3,
@@ -102,69 +106,69 @@ static uint32_t nv04_graph_ctx_regs[] = {
 	NV04_PGRAPH_PATT_COLOR0,
 	NV04_PGRAPH_PATT_COLOR1,
 	NV04_PGRAPH_PATT_COLORRAM+0x00,
-	NV04_PGRAPH_PATT_COLORRAM+0x01,
-	NV04_PGRAPH_PATT_COLORRAM+0x02,
-	NV04_PGRAPH_PATT_COLORRAM+0x03,
 	NV04_PGRAPH_PATT_COLORRAM+0x04,
-	NV04_PGRAPH_PATT_COLORRAM+0x05,
-	NV04_PGRAPH_PATT_COLORRAM+0x06,
-	NV04_PGRAPH_PATT_COLORRAM+0x07,
 	NV04_PGRAPH_PATT_COLORRAM+0x08,
-	NV04_PGRAPH_PATT_COLORRAM+0x09,
-	NV04_PGRAPH_PATT_COLORRAM+0x0A,
-	NV04_PGRAPH_PATT_COLORRAM+0x0B,
-	NV04_PGRAPH_PATT_COLORRAM+0x0C,
-	NV04_PGRAPH_PATT_COLORRAM+0x0D,
-	NV04_PGRAPH_PATT_COLORRAM+0x0E,
-	NV04_PGRAPH_PATT_COLORRAM+0x0F,
+	NV04_PGRAPH_PATT_COLORRAM+0x0c,
 	NV04_PGRAPH_PATT_COLORRAM+0x10,
-	NV04_PGRAPH_PATT_COLORRAM+0x11,
-	NV04_PGRAPH_PATT_COLORRAM+0x12,
-	NV04_PGRAPH_PATT_COLORRAM+0x13,
 	NV04_PGRAPH_PATT_COLORRAM+0x14,
-	NV04_PGRAPH_PATT_COLORRAM+0x15,
-	NV04_PGRAPH_PATT_COLORRAM+0x16,
-	NV04_PGRAPH_PATT_COLORRAM+0x17,
 	NV04_PGRAPH_PATT_COLORRAM+0x18,
-	NV04_PGRAPH_PATT_COLORRAM+0x19,
-	NV04_PGRAPH_PATT_COLORRAM+0x1A,
-	NV04_PGRAPH_PATT_COLORRAM+0x1B,
-	NV04_PGRAPH_PATT_COLORRAM+0x1C,
-	NV04_PGRAPH_PATT_COLORRAM+0x1D,
-	NV04_PGRAPH_PATT_COLORRAM+0x1E,
-	NV04_PGRAPH_PATT_COLORRAM+0x1F,
+	NV04_PGRAPH_PATT_COLORRAM+0x1c,
 	NV04_PGRAPH_PATT_COLORRAM+0x20,
-	NV04_PGRAPH_PATT_COLORRAM+0x21,
-	NV04_PGRAPH_PATT_COLORRAM+0x22,
-	NV04_PGRAPH_PATT_COLORRAM+0x23,
 	NV04_PGRAPH_PATT_COLORRAM+0x24,
-	NV04_PGRAPH_PATT_COLORRAM+0x25,
-	NV04_PGRAPH_PATT_COLORRAM+0x26,
-	NV04_PGRAPH_PATT_COLORRAM+0x27,
 	NV04_PGRAPH_PATT_COLORRAM+0x28,
-	NV04_PGRAPH_PATT_COLORRAM+0x29,
-	NV04_PGRAPH_PATT_COLORRAM+0x2A,
-	NV04_PGRAPH_PATT_COLORRAM+0x2B,
-	NV04_PGRAPH_PATT_COLORRAM+0x2C,
-	NV04_PGRAPH_PATT_COLORRAM+0x2D,
-	NV04_PGRAPH_PATT_COLORRAM+0x2E,
-	NV04_PGRAPH_PATT_COLORRAM+0x2F,
+	NV04_PGRAPH_PATT_COLORRAM+0x2c,
 	NV04_PGRAPH_PATT_COLORRAM+0x30,
-	NV04_PGRAPH_PATT_COLORRAM+0x31,
-	NV04_PGRAPH_PATT_COLORRAM+0x32,
-	NV04_PGRAPH_PATT_COLORRAM+0x33,
 	NV04_PGRAPH_PATT_COLORRAM+0x34,
-	NV04_PGRAPH_PATT_COLORRAM+0x35,
-	NV04_PGRAPH_PATT_COLORRAM+0x36,
-	NV04_PGRAPH_PATT_COLORRAM+0x37,
 	NV04_PGRAPH_PATT_COLORRAM+0x38,
-	NV04_PGRAPH_PATT_COLORRAM+0x39,
-	NV04_PGRAPH_PATT_COLORRAM+0x3A,
-	NV04_PGRAPH_PATT_COLORRAM+0x3B,
-	NV04_PGRAPH_PATT_COLORRAM+0x3C,
-	NV04_PGRAPH_PATT_COLORRAM+0x3D,
-	NV04_PGRAPH_PATT_COLORRAM+0x3E,
-	NV04_PGRAPH_PATT_COLORRAM+0x3F,
+	NV04_PGRAPH_PATT_COLORRAM+0x3c,
+	NV04_PGRAPH_PATT_COLORRAM+0x40,
+	NV04_PGRAPH_PATT_COLORRAM+0x44,
+	NV04_PGRAPH_PATT_COLORRAM+0x48,
+	NV04_PGRAPH_PATT_COLORRAM+0x4c,
+	NV04_PGRAPH_PATT_COLORRAM+0x50,
+	NV04_PGRAPH_PATT_COLORRAM+0x54,
+	NV04_PGRAPH_PATT_COLORRAM+0x58,
+	NV04_PGRAPH_PATT_COLORRAM+0x5c,
+	NV04_PGRAPH_PATT_COLORRAM+0x60,
+	NV04_PGRAPH_PATT_COLORRAM+0x64,
+	NV04_PGRAPH_PATT_COLORRAM+0x68,
+	NV04_PGRAPH_PATT_COLORRAM+0x6c,
+	NV04_PGRAPH_PATT_COLORRAM+0x70,
+	NV04_PGRAPH_PATT_COLORRAM+0x74,
+	NV04_PGRAPH_PATT_COLORRAM+0x78,
+	NV04_PGRAPH_PATT_COLORRAM+0x7c,
+	NV04_PGRAPH_PATT_COLORRAM+0x80,
+	NV04_PGRAPH_PATT_COLORRAM+0x84,
+	NV04_PGRAPH_PATT_COLORRAM+0x88,
+	NV04_PGRAPH_PATT_COLORRAM+0x8c,
+	NV04_PGRAPH_PATT_COLORRAM+0x90,
+	NV04_PGRAPH_PATT_COLORRAM+0x94,
+	NV04_PGRAPH_PATT_COLORRAM+0x98,
+	NV04_PGRAPH_PATT_COLORRAM+0x9c,
+	NV04_PGRAPH_PATT_COLORRAM+0xa0,
+	NV04_PGRAPH_PATT_COLORRAM+0xa4,
+	NV04_PGRAPH_PATT_COLORRAM+0xa8,
+	NV04_PGRAPH_PATT_COLORRAM+0xac,
+	NV04_PGRAPH_PATT_COLORRAM+0xb0,
+	NV04_PGRAPH_PATT_COLORRAM+0xb4,
+	NV04_PGRAPH_PATT_COLORRAM+0xb8,
+	NV04_PGRAPH_PATT_COLORRAM+0xbc,
+	NV04_PGRAPH_PATT_COLORRAM+0xc0,
+	NV04_PGRAPH_PATT_COLORRAM+0xc4,
+	NV04_PGRAPH_PATT_COLORRAM+0xc8,
+	NV04_PGRAPH_PATT_COLORRAM+0xcc,
+	NV04_PGRAPH_PATT_COLORRAM+0xd0,
+	NV04_PGRAPH_PATT_COLORRAM+0xd4,
+	NV04_PGRAPH_PATT_COLORRAM+0xd8,
+	NV04_PGRAPH_PATT_COLORRAM+0xdc,
+	NV04_PGRAPH_PATT_COLORRAM+0xe0,
+	NV04_PGRAPH_PATT_COLORRAM+0xe4,
+	NV04_PGRAPH_PATT_COLORRAM+0xe8,
+	NV04_PGRAPH_PATT_COLORRAM+0xec,
+	NV04_PGRAPH_PATT_COLORRAM+0xf0,
+	NV04_PGRAPH_PATT_COLORRAM+0xf4,
+	NV04_PGRAPH_PATT_COLORRAM+0xf8,
+	NV04_PGRAPH_PATT_COLORRAM+0xfc,
 	NV04_PGRAPH_PATTERN,
 	0x0040080c,
 	NV04_PGRAPH_PATTERN_SHAPE,
@@ -247,14 +251,6 @@ static uint32_t nv04_graph_ctx_regs[] = {
 	0x004004f8,
 	0x0040047c,
 	0x004004fc,
-	0x0040053c,
-	0x00400544,
-	0x00400540,
-	0x00400548,
-	0x00400560,
-	0x00400568,
-	0x00400564,
-	0x0040056c,
 	0x00400534,
 	0x00400538,
 	0x00400514,
@@ -341,9 +337,8 @@ static uint32_t nv04_graph_ctx_regs[] = {
 	0x00400500,
 	0x00400504,
 	NV04_PGRAPH_VALID1,
-	NV04_PGRAPH_VALID2
-
-
+	NV04_PGRAPH_VALID2,
+	NV04_PGRAPH_DEBUG_3
 };
 
 struct graph_state {
@@ -388,6 +383,18 @@ nv04_graph_context_switch(struct drm_device *dev)
 	pgraph->fifo_access(dev, true);
 }
 
+static uint32_t *ctx_reg(struct graph_state *ctx, uint32_t reg)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(nv04_graph_ctx_regs); i++) {
+		if (nv04_graph_ctx_regs[i] == reg)
+			return &ctx->nv04[i];
+	}
+
+	return NULL;
+}
+
 int nv04_graph_create_context(struct nouveau_channel *chan)
 {
 	struct graph_state *pgraph_ctx;
@@ -398,15 +405,8 @@ int nv04_graph_create_context(struct nouveau_channel *chan)
 	if (pgraph_ctx == NULL)
 		return -ENOMEM;
 
-	/* dev_priv->fifos[channel].pgraph_ctx_user = channel << 24; */
-	pgraph_ctx->nv04[0] = 0x0001ffff;
-	/* is it really needed ??? */
-#if 0
-	dev_priv->fifos[channel].pgraph_ctx[1] =
-					nv_rd32(dev, NV_PGRAPH_DEBUG_4);
-	dev_priv->fifos[channel].pgraph_ctx[2] =
-					nv_rd32(dev, 0x004006b0);
-#endif
+	*ctx_reg(pgraph_ctx, NV04_PGRAPH_DEBUG_3) = 0xfad4ff31;
+
 	return 0;
 }
 
@@ -429,9 +429,13 @@ int nv04_graph_load_context(struct nouveau_channel *chan)
 		nv_wr32(dev, nv04_graph_ctx_regs[i], pgraph_ctx->nv04[i]);
 
 	nv_wr32(dev, NV04_PGRAPH_CTX_CONTROL, 0x10010100);
-	nv_wr32(dev, NV04_PGRAPH_CTX_USER, chan->id << 24);
+
+	tmp  = nv_rd32(dev, NV04_PGRAPH_CTX_USER) & 0x00ffffff;
+	nv_wr32(dev, NV04_PGRAPH_CTX_USER, tmp | chan->id << 24);
+
 	tmp = nv_rd32(dev, NV04_PGRAPH_FFINTFC_ST2);
 	nv_wr32(dev, NV04_PGRAPH_FFINTFC_ST2, tmp & 0x000fffff);
+
 	return 0;
 }
 
@@ -494,7 +498,7 @@ int nv04_graph_init(struct drm_device *dev)
 	nv_wr32(dev, NV04_PGRAPH_STATE        , 0xFFFFFFFF);
 	nv_wr32(dev, NV04_PGRAPH_CTX_CONTROL  , 0x10000100);
 	tmp  = nv_rd32(dev, NV04_PGRAPH_CTX_USER) & 0x00ffffff;
-	tmp |= dev_priv->engine.fifo.channels << 24;
+	tmp |= (dev_priv->engine.fifo.channels - 1) << 24;
 	nv_wr32(dev, NV04_PGRAPH_CTX_USER, tmp);
 
 	/* These don't belong here, they're part of a per-channel context */
-- 
1.6.4.4

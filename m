From: Roy Spliet <rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org>
Subject: [PATCH 3/7] clock/nva3: HOST clock
Date: Thu, 21 Aug 2014 13:45:14 +0200
Message-ID: <1408621518-32350-4-git-send-email-rspliet@eclipso.eu>
References: <1408621518-32350-1-git-send-email-rspliet@eclipso.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1408621518-32350-1-git-send-email-rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Nouveau Mailinglist <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Cc: Roy Spliet <rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Signed-off-by: Roy Spliet <rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org>
---
 drivers/gpu/drm/nouveau/core/subdev/clock/nva3.c | 82 +++++++++++++++++++++---
 drivers/gpu/drm/nouveau/core/subdev/clock/nva3.h |  4 ++
 2 files changed, 78 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/core/subdev/clock/nva3.c b/drivers/gpu/drm/nouveau/core/subdev/clock/nva3.c
index b9ab90a..eeab2d5 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/clock/nva3.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/clock/nva3.c
@@ -136,12 +136,11 @@ static int
 nva3_clock_read(struct nouveau_clock *clk, enum nv_clk_src src)
 {
 	struct nva3_clock_priv *priv = (void *)clk;
+	u32 hsrc;
 
 	switch (src) {
 	case nv_clk_src_crystal:
 		return nv_device(priv)->crystal;
-	case nv_clk_src_href:
-		return 100000;
 	case nv_clk_src_core:
 		return read_pll(priv, 0x00, 0x4200);
 	case nv_clk_src_shader:
@@ -154,6 +153,18 @@ nva3_clock_read(struct nouveau_clock *clk, enum nv_clk_src src)
 		return read_clk(priv, 0x21, false);
 	case nv_clk_src_daemon:
 		return read_clk(priv, 0x25, false);
+	case nv_clk_src_host:
+		hsrc = (nv_rd32(priv, 0xc040) & 0x30000000) >> 28;
+		switch (hsrc) {
+		case 0:
+			return read_clk(priv, 0x1d, false);
+		case 2:
+		case 3:
+			return 277000;
+		default:
+			nv_error(clk, "unknown HOST clock source %d\n", hsrc);
+			return -EINVAL;
+		}
 	default:
 		nv_error(clk, "invalid clock source %d\n", src);
 		return -EINVAL;
@@ -258,6 +269,34 @@ calc_clk(struct nva3_clock_priv *priv, struct nouveau_cstate *cstate,
 	return ret;
 }
 
+static int
+calc_host(struct nva3_clock_priv *priv, struct nouveau_cstate *cstate)
+{
+	int ret = 0;
+	u32 kHz = cstate->domain[nv_clk_src_host];
+	struct nva3_clock_info *info = &priv->eng[nv_clk_src_host];
+
+	if (kHz == 277000) {
+		info->clk = 0;
+		info->host_out = NVA3_HOST_277;
+		return 0;
+	}
+
+	info->host_out = NVA3_HOST_CLK;
+
+	ret = nva3_clk_info(&priv->base, 0x1d, kHz, info);
+	if (ret >= 0)
+		return 0;
+	return ret;
+}
+
+static void
+disable_clk_src(struct nva3_clock_priv *priv, u32 src)
+{
+	nv_mask(priv, src, 0x00000100, 0x00000000);
+	nv_mask(priv, src, 0x00000001, 0x00000000);
+}
+
 static void
 prog_pll(struct nva3_clock_priv *priv, int clk, u32 pll, int idx)
 {
@@ -275,15 +314,13 @@ prog_pll(struct nva3_clock_priv *priv, int clk, u32 pll, int idx)
 		nv_wait(priv, ctrl, 0x00020000, 0x00020000);
 		nv_mask(priv, ctrl, 0x00000010, 0x00000010);
 		nv_mask(priv, ctrl, 0x00000008, 0x00000000);
-		nv_mask(priv, src1, 0x00000100, 0x00000000);
-		nv_mask(priv, src1, 0x00000001, 0x00000000);
+		disable_clk_src(priv, src1);
 	} else {
 		nv_mask(priv, src1, 0x003f3141, 0x00000101 | info->clk);
 		nv_mask(priv, ctrl, 0x00000018, 0x00000018);
 		udelay(20);
 		nv_mask(priv, ctrl, 0x00000001, 0x00000000);
-		nv_mask(priv, src0, 0x00000100, 0x00000000);
-		nv_mask(priv, src0, 0x00000001, 0x00000000);
+		disable_clk_src(priv, src0);
 	}
 }
 
@@ -294,6 +331,33 @@ prog_clk(struct nva3_clock_priv *priv, int clk, int idx)
 	nv_mask(priv, 0x004120 + (clk * 4), 0x003f3141, 0x00000101 | info->clk);
 }
 
+static void
+prog_host(struct nva3_clock_priv *priv)
+{
+	struct nva3_clock_info *info = &priv->eng[nv_clk_src_host];
+	u32 hsrc = (nv_rd32(priv, 0xc040));
+
+	switch (info->host_out) {
+	case NVA3_HOST_277:
+		if ((hsrc & 0x30000000) == 0) {
+			nv_wr32(priv, 0xc040, hsrc | 0x20000000);
+			disable_clk_src(priv, 0x4194);
+		}
+		break;
+	case NVA3_HOST_CLK:
+		prog_clk(priv, 0x1d, nv_clk_src_host);
+		if ((hsrc & 0x30000000) >= 0x20000000) {
+			nv_wr32(priv, 0xc040, hsrc & ~0x30000000);
+		}
+		break;
+	default:
+		break;
+	}
+
+	/* This seems to be a clock gating factor on idle, always set to 64 */
+	nv_wr32(priv, 0xc044, 0x3e);
+}
+
 static int
 nva3_clock_calc(struct nouveau_clock *clk, struct nouveau_cstate *cstate)
 {
@@ -303,7 +367,8 @@ nva3_clock_calc(struct nouveau_clock *clk, struct nouveau_cstate *cstate)
 	if ((ret = calc_clk(priv, cstate, 0x10, 0x4200, nv_clk_src_core)) ||
 	    (ret = calc_clk(priv, cstate, 0x11, 0x4220, nv_clk_src_shader)) ||
 	    (ret = calc_clk(priv, cstate, 0x20, 0x0000, nv_clk_src_disp)) ||
-	    (ret = calc_clk(priv, cstate, 0x21, 0x0000, nv_clk_src_vdec)))
+	    (ret = calc_clk(priv, cstate, 0x21, 0x0000, nv_clk_src_vdec)) ||
+	    (ret = calc_host(priv, cstate)))
 		return ret;
 
 	return 0;
@@ -317,6 +382,7 @@ nva3_clock_prog(struct nouveau_clock *clk)
 	prog_pll(priv, 0x01, 0x004220, nv_clk_src_shader);
 	prog_clk(priv, 0x20, nv_clk_src_disp);
 	prog_clk(priv, 0x21, nv_clk_src_vdec);
+	prog_host(priv);
 	return 0;
 }
 
@@ -328,12 +394,12 @@ nva3_clock_tidy(struct nouveau_clock *clk)
 static struct nouveau_clocks
 nva3_domain[] = {
 	{ nv_clk_src_crystal, 0xff },
-	{ nv_clk_src_href   , 0xff },
 	{ nv_clk_src_core   , 0x00, 0, "core", 1000 },
 	{ nv_clk_src_shader , 0x01, 0, "shader", 1000 },
 	{ nv_clk_src_mem    , 0x02, 0, "memory", 1000 },
 	{ nv_clk_src_vdec   , 0x03 },
 	{ nv_clk_src_disp   , 0x04 },
+	{ nv_clk_src_host   , 0x05 },
 	{ nv_clk_src_max }
 };
 
diff --git a/drivers/gpu/drm/nouveau/core/subdev/clock/nva3.h b/drivers/gpu/drm/nouveau/core/subdev/clock/nva3.h
index 2b4b3ea..54f9949 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/clock/nva3.h
+++ b/drivers/gpu/drm/nouveau/core/subdev/clock/nva3.h
@@ -6,6 +6,10 @@
 struct nva3_clock_info {
 	u32 clk;
 	u32 pll;
+	enum {
+		NVA3_HOST_277,
+		NVA3_HOST_CLK,
+	} host_out;
 };
 
 int nva3_pll_info(struct nouveau_clock *, int, u32, u32,
-- 
1.9.3

From: Roy Spliet <rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org>
Subject: [PATCH 6/7] clock/nva3: Set intermediate core clock on
	reclocking
Date: Thu, 21 Aug 2014 13:45:17 +0200
Message-ID: <1408621518-32350-7-git-send-email-rspliet@eclipso.eu>
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
 .../gpu/drm/nouveau/core/include/subdev/clock.h    |  1 +
 drivers/gpu/drm/nouveau/core/subdev/clock/nva3.c   | 63 +++++++++++++++++-----
 drivers/gpu/drm/nouveau/core/subdev/clock/nva3.h   |  1 +
 3 files changed, 51 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/core/include/subdev/clock.h b/drivers/gpu/drm/nouveau/core/include/subdev/clock.h
index c01e29c..676b49e 100644
--- a/drivers/gpu/drm/nouveau/core/include/subdev/clock.h
+++ b/drivers/gpu/drm/nouveau/core/include/subdev/clock.h
@@ -29,6 +29,7 @@ enum nv_clk_src {
 	nv_clk_src_mdiv,
 
 	nv_clk_src_core,
+	nv_clk_src_core_intm,
 	nv_clk_src_shader,
 
 	nv_clk_src_mem,
diff --git a/drivers/gpu/drm/nouveau/core/subdev/clock/nva3.c b/drivers/gpu/drm/nouveau/core/subdev/clock/nva3.c
index 3e1164c..14a5060 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/clock/nva3.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/clock/nva3.c
@@ -142,6 +142,7 @@ nva3_clock_read(struct nouveau_clock *clk, enum nv_clk_src src)
 	case nv_clk_src_crystal:
 		return nv_device(priv)->crystal;
 	case nv_clk_src_core:
+	case nv_clk_src_core_intm:
 		return read_pll(priv, 0x00, 0x4200);
 	case nv_clk_src_shader:
 		return read_pll(priv, 0x01, 0x4220);
@@ -226,7 +227,6 @@ nva3_pll_info(struct nouveau_clock *clock, int clk, u32 pll, u32 khz,
 {
 	struct nouveau_bios *bios = nouveau_bios(clock);
 	struct nva3_clock_priv *priv = (void *)clock;
-	int clk_khz;
 	struct nvbios_pll limits;
 	int P, N, M, diff;
 	int ret;
@@ -235,10 +235,10 @@ nva3_pll_info(struct nouveau_clock *clock, int clk, u32 pll, u32 khz,
 
 	/* If we can get a within [-2, 3) MHz of a divider, we'll disable the
 	 * PLL and use the divider instead. */
-	clk_khz = nva3_clk_info(clock, clk, khz, info);
-	diff = khz - clk_khz;
+	ret = nva3_clk_info(clock, clk, khz, info);
+	diff = khz - ret;
 	if (!pll || (diff >= -2000 && diff < 3000)) {
-		return clk_khz;
+		goto out;
 	}
 
 	/* Try with PLL */
@@ -246,8 +246,8 @@ nva3_pll_info(struct nouveau_clock *clock, int clk, u32 pll, u32 khz,
 	if (ret)
 		return ret;
 
-	clk_khz = nva3_clk_info(clock, clk - 0x10, limits.refclk, info);
-	if (clk_khz != limits.refclk)
+	ret = nva3_clk_info(clock, clk - 0x10, limits.refclk, info);
+	if (ret != limits.refclk)
 		return -EINVAL;
 
 	ret = nva3_pll_calc(nv_subdev(priv), &limits, khz, &N, NULL, &M, &P);
@@ -255,6 +255,9 @@ nva3_pll_info(struct nouveau_clock *clock, int clk, u32 pll, u32 khz,
 		info->pll = (P << 16) | (N << 8) | M;
 	}
 
+out:
+	info->fb_delay = max(((khz + 7566) / 15133), (u32) 18);
+
 	return ret ? ret : -ERANGE;
 }
 
@@ -371,10 +374,26 @@ prog_host(struct nva3_clock_priv *priv)
 	nv_wr32(priv, 0xc044, 0x3e);
 }
 
+static void
+prog_core(struct nva3_clock_priv *priv, int idx)
+{
+	struct nva3_clock_info *info = &priv->eng[idx];
+	u32 fb_delay = nv_rd32(priv, 0x10002c);
+
+	if (fb_delay < info->fb_delay)
+		nv_wr32(priv, 0x10002c, info->fb_delay);
+
+	prog_pll(priv, 0x00, 0x004200, idx);
+
+	if (fb_delay > info->fb_delay)
+		nv_wr32(priv, 0x10002c, info->fb_delay);
+}
+
 static int
 nva3_clock_calc(struct nouveau_clock *clk, struct nouveau_cstate *cstate)
 {
 	struct nva3_clock_priv *priv = (void *)clk;
+	struct nva3_clock_info *core = &priv->eng[nv_clk_src_core];
 	int ret;
 
 	if ((ret = calc_clk(priv, cstate, 0x10, 0x4200, nv_clk_src_core)) ||
@@ -384,6 +403,16 @@ nva3_clock_calc(struct nouveau_clock *clk, struct nouveau_cstate *cstate)
 	    (ret = calc_host(priv, cstate)))
 		return ret;
 
+	/* XXX: Should be reading the highest bit in the VBIOS clock to decide
+	 * whether to use a PLL or not... but using a PLL defeats the purpose */
+	if (core->pll) {
+		ret = nva3_clk_info(clk, 0x10,
+				cstate->domain[nv_clk_src_core_intm],
+				&priv->eng[nv_clk_src_core_intm]);
+		if (ret < 0)
+			return ret;
+	}
+
 	return 0;
 }
 
@@ -391,7 +420,12 @@ static int
 nva3_clock_prog(struct nouveau_clock *clk)
 {
 	struct nva3_clock_priv *priv = (void *)clk;
-	prog_pll(priv, 0x00, 0x004200, nv_clk_src_core);
+	struct nva3_clock_info *core = &priv->eng[nv_clk_src_core];
+
+	if (core->pll)
+		prog_core(priv, nv_clk_src_core_intm);
+
+	prog_core(priv,  nv_clk_src_core);
 	prog_pll(priv, 0x01, 0x004220, nv_clk_src_shader);
 	prog_clk(priv, 0x20, nv_clk_src_disp);
 	prog_clk(priv, 0x21, nv_clk_src_vdec);
@@ -406,13 +440,14 @@ nva3_clock_tidy(struct nouveau_clock *clk)
 
 static struct nouveau_clocks
 nva3_domain[] = {
-	{ nv_clk_src_crystal, 0xff },
-	{ nv_clk_src_core   , 0x00, 0, "core", 1000 },
-	{ nv_clk_src_shader , 0x01, 0, "shader", 1000 },
-	{ nv_clk_src_mem    , 0x02, 0, "memory", 1000 },
-	{ nv_clk_src_vdec   , 0x03 },
-	{ nv_clk_src_disp   , 0x04 },
-	{ nv_clk_src_host   , 0x05 },
+	{ nv_clk_src_crystal  , 0xff },
+	{ nv_clk_src_core     , 0x00, 0, "core", 1000 },
+	{ nv_clk_src_shader   , 0x01, 0, "shader", 1000 },
+	{ nv_clk_src_mem      , 0x02, 0, "memory", 1000 },
+	{ nv_clk_src_vdec     , 0x03 },
+	{ nv_clk_src_disp     , 0x04 },
+	{ nv_clk_src_host     , 0x05 },
+	{ nv_clk_src_core_intm, 0x06 },
 	{ nv_clk_src_max }
 };
 
diff --git a/drivers/gpu/drm/nouveau/core/subdev/clock/nva3.h b/drivers/gpu/drm/nouveau/core/subdev/clock/nva3.h
index 54f9949..0539be4 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/clock/nva3.h
+++ b/drivers/gpu/drm/nouveau/core/subdev/clock/nva3.h
@@ -10,6 +10,7 @@ struct nva3_clock_info {
 		NVA3_HOST_277,
 		NVA3_HOST_CLK,
 	} host_out;
+	u32 fb_delay;
 };
 
 int nva3_pll_info(struct nouveau_clock *, int, u32, u32,
-- 
1.9.3

From: Roy Spliet <rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org>
Subject: [PATCH 2/7] clock/nva3: Set PLL refclk
Date: Thu, 21 Aug 2014 13:45:13 +0200
Message-ID: <1408621518-32350-3-git-send-email-rspliet@eclipso.eu>
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
 drivers/gpu/drm/nouveau/core/subdev/clock/nva3.c | 73 +++++++++++++++---------
 drivers/gpu/drm/nouveau/core/subdev/clock/nva3.h |  2 +-
 drivers/gpu/drm/nouveau/core/subdev/fb/ramnva3.c |  2 +-
 3 files changed, 48 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/core/subdev/clock/nva3.c b/drivers/gpu/drm/nouveau/core/subdev/clock/nva3.c
index a08011c..b9ab90a 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/clock/nva3.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/clock/nva3.c
@@ -163,17 +163,12 @@ nva3_clock_read(struct nouveau_clock *clk, enum nv_clk_src src)
 }
 
 int
-nva3_clock_info(struct nouveau_clock *clock, int clk, u32 pll, u32 khz,
+nva3_clk_info(struct nouveau_clock *clock, int clk, u32 khz,
 		struct nva3_clock_info *info)
 {
-	struct nouveau_bios *bios = nouveau_bios(clock);
 	struct nva3_clock_priv *priv = (void *)clock;
-	struct nvbios_pll limits;
-	u32 oclk, sclk, sdiv;
-	int P, N, M, diff;
-	int ret;
+	u32 oclk, sclk, sdiv, diff;
 
-	info->pll = 0;
 	info->clk = 0;
 
 	switch (khz) {
@@ -188,40 +183,64 @@ nva3_clock_info(struct nouveau_clock *clock, int clk, u32 pll, u32 khz,
 		return khz;
 	default:
 		sclk = read_vco(priv, clk);
-		sdiv = min((sclk * 2) / (khz - 2999), (u32)65);
-		/* if the clock has a PLL attached, and we can get a within
-		 * [-2, 3) MHz of a divider, we'll disable the PLL and use
-		 * the divider instead.
-		 *
-		 * divider can go as low as 2, limited here because NVIDIA
+		sdiv = min((sclk * 2) / khz, (u32)65);
+		oclk = (sclk * 2) / sdiv;
+		diff = ((khz + 3000) - oclk);
+
+		/* When imprecise, play it safe and aim for a clock lower than
+		 * desired rather than higher */
+		if (diff < 0) {
+			sdiv++;
+			oclk = (sclk * 2) / sdiv;
+		}
+
+		/* divider can go as low as 2, limited here because NVIDIA
 		 * and the VBIOS on my NVA8 seem to prefer using the PLL
 		 * for 810MHz - is there a good reason?
-		 */
+		 * XXX: PLLs with refclk 810MHz?  */
 		if (sdiv > 4) {
-			oclk = (sclk * 2) / sdiv;
-			diff = khz - oclk;
-			if (!pll || (diff >= -2000 && diff < 3000)) {
-				info->clk = (((sdiv - 2) << 16) | 0x00003100);
-				return oclk;
-			}
+			info->clk = (((sdiv - 2) << 16) | 0x00003100);
+			return oclk;
 		}
 
-		if (!pll)
-			return -ERANGE;
 		break;
 	}
 
+	return -ERANGE;
+}
+
+int
+nva3_pll_info(struct nouveau_clock *clock, int clk, u32 pll, u32 khz,
+		struct nva3_clock_info *info)
+{
+	struct nouveau_bios *bios = nouveau_bios(clock);
+	struct nva3_clock_priv *priv = (void *)clock;
+	int clk_khz;
+	struct nvbios_pll limits;
+	int P, N, M, diff;
+	int ret;
+
+	info->pll = 0;
+
+	/* If we can get a within [-2, 3) MHz of a divider, we'll disable the
+	 * PLL and use the divider instead. */
+	clk_khz = nva3_clk_info(clock, clk, khz, info);
+	diff = khz - clk_khz;
+	if (!pll || (diff >= -2000 && diff < 3000)) {
+		return clk_khz;
+	}
+
+	/* Try with PLL */
 	ret = nvbios_pll_parse(bios, pll, &limits);
 	if (ret)
 		return ret;
 
-	limits.refclk = read_clk(priv, clk - 0x10, true);
-	if (!limits.refclk)
+	clk_khz = nva3_clk_info(clock, clk - 0x10, limits.refclk, info);
+	if (clk_khz != limits.refclk)
 		return -EINVAL;
 
 	ret = nva3_pll_calc(nv_subdev(priv), &limits, khz, &N, NULL, &M, &P);
 	if (ret >= 0) {
-		info->clk = nv_rd32(priv, 0x4120 + (clk * 4));
 		info->pll = (P << 16) | (N << 8) | M;
 	}
 
@@ -232,7 +251,7 @@ static int
 calc_clk(struct nva3_clock_priv *priv, struct nouveau_cstate *cstate,
 	 int clk, u32 pll, int idx)
 {
-	int ret = nva3_clock_info(&priv->base, clk, pll, cstate->domain[idx],
+	int ret = nva3_pll_info(&priv->base, clk, pll, cstate->domain[idx],
 				  &priv->eng[idx]);
 	if (ret >= 0)
 		return 0;
@@ -249,7 +268,7 @@ prog_pll(struct nva3_clock_priv *priv, int clk, u32 pll, int idx)
 	const u32 coef = pll + 4;
 
 	if (info->pll) {
-		nv_mask(priv, src0, 0x00000101, 0x00000101);
+		nv_mask(priv, src0, 0x003f3141, 0x00000101 | info->clk);
 		nv_wr32(priv, coef, info->pll);
 		nv_mask(priv, ctrl, 0x00000015, 0x00000015);
 		nv_mask(priv, ctrl, 0x00000010, 0x00000000);
diff --git a/drivers/gpu/drm/nouveau/core/subdev/clock/nva3.h b/drivers/gpu/drm/nouveau/core/subdev/clock/nva3.h
index 6229a50..2b4b3ea 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/clock/nva3.h
+++ b/drivers/gpu/drm/nouveau/core/subdev/clock/nva3.h
@@ -8,7 +8,7 @@ struct nva3_clock_info {
 	u32 pll;
 };
 
-int nva3_clock_info(struct nouveau_clock *, int, u32, u32,
+int nva3_pll_info(struct nouveau_clock *, int, u32, u32,
 		    struct nva3_clock_info *);
 
 #endif
diff --git a/drivers/gpu/drm/nouveau/core/subdev/fb/ramnva3.c b/drivers/gpu/drm/nouveau/core/subdev/fb/ramnva3.c
index 8076fb1..686e0d6 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/fb/ramnva3.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/fb/ramnva3.c
@@ -123,7 +123,7 @@ nva3_ram_calc(struct nouveau_fb *pfb, u32 freq)
 		timing.data = 0;
 	}
 
-	ret = nva3_clock_info(nouveau_clock(pfb), 0x12, 0x4000, freq, &mclk);
+	ret = nva3_pll_info(nouveau_clock(pfb), 0x12, 0x4000, freq, &mclk);
 	if (ret < 0) {
 		nv_error(pfb, "failed mclk calculation\n");
 		return ret;
-- 
1.9.3

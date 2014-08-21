From: Roy Spliet <rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org>
Subject: [PATCH 5/7] clock/nva3: For PLL clocks always make sure
	the PLL is not in use
Date: Thu, 21 Aug 2014 13:45:16 +0200
Message-ID: <1408621518-32350-6-git-send-email-rspliet@eclipso.eu>
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
 drivers/gpu/drm/nouveau/core/subdev/clock/nva3.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/core/subdev/clock/nva3.c b/drivers/gpu/drm/nouveau/core/subdev/clock/nva3.c
index 2d75212..3e1164c 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/clock/nva3.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/clock/nva3.c
@@ -305,8 +305,17 @@ prog_pll(struct nva3_clock_priv *priv, int clk, u32 pll, int idx)
 	const u32 src1 = 0x004160 + (clk * 4);
 	const u32 ctrl = pll + 0;
 	const u32 coef = pll + 4;
+	u32 bypass;
 
 	if (info->pll) {
+		/* Always start from a non-PLL clock */
+		bypass = nv_rd32(priv, ctrl)  & 0x00000008;
+		if (!bypass) {
+			nv_mask(priv, src1, 0x00000101, 0x00000101);
+			nv_mask(priv, ctrl, 0x00000008, 0x00000008);
+			udelay(20);
+		}
+
 		nv_mask(priv, src0, 0x003f3141, 0x00000101 | info->clk);
 		nv_wr32(priv, coef, info->pll);
 		nv_mask(priv, ctrl, 0x00000015, 0x00000015);
-- 
1.9.3

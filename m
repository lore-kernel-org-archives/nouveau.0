From: Roy Spliet <rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org>
Subject: [PATCH 1/7] clock/nva3: Parse clock control registers
	more accurately
Date: Thu, 21 Aug 2014 13:45:12 +0200
Message-ID: <1408621518-32350-2-git-send-email-rspliet@eclipso.eu>
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
 drivers/gpu/drm/nouveau/core/subdev/clock/nva3.c | 32 +++++++++++++++++++++---
 1 file changed, 28 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/core/subdev/clock/nva3.c b/drivers/gpu/drm/nouveau/core/subdev/clock/nva3.c
index 9fb5835..a08011c 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/clock/nva3.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/clock/nva3.c
@@ -20,6 +20,7 @@
  * OTHER DEALINGS IN THE SOFTWARE.
  *
  * Authors: Ben Skeggs
+ *          Roy Spliet
  */
 
 #include <subdev/bios.h>
@@ -42,9 +43,17 @@ static u32
 read_vco(struct nva3_clock_priv *priv, int clk)
 {
 	u32 sctl = nv_rd32(priv, 0x4120 + (clk * 4));
-	if ((sctl & 0x00000030) != 0x00000030)
+
+	switch (sctl & 0x00000030) {
+	case 0x00000000:
+		return nv_device(priv)->crystal;
+	case 0x00000020:
 		return read_pll(priv, 0x41, 0x00e820);
-	return read_pll(priv, 0x42, 0x00e8a0);
+	case 0x00000030:
+		return read_pll(priv, 0x42, 0x00e8a0);
+	default:
+		return 0;
+	}
 }
 
 static u32
@@ -66,14 +75,25 @@ read_clk(struct nva3_clock_priv *priv, int clk, bool ignore_en)
 	if (!ignore_en && !(sctl & 0x00000100))
 		return 0;
 
+	/* out_alt */
+	if (sctl & 0x00000400)
+		return 108000;
+
+	/* vco_out */
 	switch (sctl & 0x00003000) {
 	case 0x00000000:
-		return nv_device(priv)->crystal;
+		if (!(sctl & 0x00000200))
+			return nv_device(priv)->crystal;
+		return 0;
 	case 0x00002000:
 		if (sctl & 0x00000040)
 			return 108000;
 		return 100000;
 	case 0x00003000:
+		/* vco_enable */
+		if (!(sctl & 0x00000001))
+			return 0;
+
 		sclk = read_vco(priv, clk);
 		sdiv = ((sctl & 0x003f0000) >> 16) + 2;
 		return (sclk * 2) / sdiv;
@@ -95,7 +115,9 @@ read_pll(struct nva3_clock_priv *priv, int clk, u32 pll)
 			N = (coef & 0x0000ff00) >> 8;
 			P = (coef & 0x003f0000) >> 16;
 
-			/* no post-divider on these.. */
+			/* no post-divider on these..
+			 * XXX: it looks more like two post-"dividers" that
+			 * cross each other out in the default RPLL config */
 			if ((pll & 0x00ff00) == 0x00e800)
 				P = 1;
 
@@ -136,6 +158,8 @@ nva3_clock_read(struct nouveau_clock *clk, enum nv_clk_src src)
 		nv_error(clk, "invalid clock source %d\n", src);
 		return -EINVAL;
 	}
+
+	return 0;
 }
 
 int
-- 
1.9.3

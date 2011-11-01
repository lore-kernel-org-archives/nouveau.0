From: Martin Peres <martin.peres-Iz16wY1oaNPLSKGbIzaifA@public.gmane.org>
Subject: [PATCH] drm/nv50/pm: fix a typo in clock calculation
Date: Tue,  1 Nov 2011 11:41:17 +0100
Message-ID: <1320144077-13569-1-git-send-email-martin.peres@ensi-bourges.fr>
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
Cc: Martin Peres <martin.peres-BktLLJ5BOkI@public.gmane.org>, Martin Peres <martin.peres-Iz16wY1oaNPLSKGbIzaifA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Signed-off-by: Martin Peres <martin.peres-BktLLJ5BOkI@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nv50_pm.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nv50_pm.c b/drivers/gpu/drm/nouveau/nv50_pm.c
index e7ff5ac..e025cae 100644
--- a/drivers/gpu/drm/nouveau/nv50_pm.c
+++ b/drivers/gpu/drm/nouveau/nv50_pm.c
@@ -295,7 +295,7 @@ read_clk(struct drm_device *dev, enum clk_src src)
 			case 0x00000800:
 				return read_clk(dev, clk_src_hclkm3d2) >> P;
 			case 0x00000c00:
-				return read_pll(dev, clk_src_mclk) >> P;
+				return read_clk(dev, clk_src_mclk) >> P;
 			}
 			break;
 		}
-- 
1.7.7.1

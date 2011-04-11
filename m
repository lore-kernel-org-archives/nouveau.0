From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] nv50: improve nv50_pm_get_clock()
Date: Mon, 11 Apr 2011 20:43:23 +0100
Message-ID: <1302551003-4516-1-git-send-email-emil.l.velikov@gmail.com>
References: <op.vsny08pg7cbmmg@emo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <op.vsny08pg7cbmmg@emo>
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

Many of the nv50 cards have their shader and/or memory pll
disabled at some stage.
This patch addresses those cases, so that the function
returns the correct frequency.

When the shader pll is disabled, the blob reports 2*core clock
Whereas for memory, the data stored in the vbios. This action
is incorrect as some vbioses store a clock value that is less
than the refference clock of the pll.

Thus we are reporting the reff_clk as it is the frequency the
pll actually operates

v2 - Convert NV_INFO() messages to NV_DEBUG()
Provide more information in the actuall message

Signed-off-by: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nv50_pm.c |   15 +++++++++++++++
 1 files changed, 15 insertions(+), 0 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nv50_pm.c b/drivers/gpu/drm/nouveau/nv50_pm.c
index 7dbb305..8a28100 100644
--- a/drivers/gpu/drm/nouveau/nv50_pm.c
+++ b/drivers/gpu/drm/nouveau/nv50_pm.c
@@ -47,6 +47,21 @@ nv50_pm_clock_get(struct drm_device *dev, u32 id)
 
 	reg0 = nv_rd32(dev, pll.reg + 0);
 	reg1 = nv_rd32(dev, pll.reg + 4);
+
+	if ((reg0 & 0x80000000) == 0) {
+		if (id == PLL_SHADER) {
+			NV_DEBUG(dev, "Shader PLL is disabled. "
+				"Shader clock is twice the core\n");
+			ret = nv50_pm_clock_get(dev, PLL_CORE);
+			if (ret > 0)
+				return ret << 1;
+		} else if (id == PLL_MEMORY) {
+			NV_DEBUG(dev, "Memory PLL is disabled. "
+				"Memory clock is equal to the ref_clk\n");
+			return pll.refclk;
+		}
+	}
+
 	P = (reg0 & 0x00070000) >> 16;
 	N = (reg1 & 0x0000ff00) >> 8;
 	M = (reg1 & 0x000000ff);
-- 
1.7.1

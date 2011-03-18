From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/1] nv50: improve nv50_pm_clock_get()
Date: Fri, 18 Mar 2011 01:15:48 +0000
Message-ID: <1300410948-12022-1-git-send-email-emil.l.velikov@gmail.com>
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

On some cards the memory and/or shader pll can be switched off/disabled
Check and return the linked/standart clock

Signed-off-by: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nv50_pm.c |   13 +++++++++++++
 1 files changed, 13 insertions(+), 0 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nv50_pm.c b/drivers/gpu/drm/nouveau/nv50_pm.c
index 7dbb305..c01a64f 100644
--- a/drivers/gpu/drm/nouveau/nv50_pm.c
+++ b/drivers/gpu/drm/nouveau/nv50_pm.c
@@ -47,6 +47,19 @@ nv50_pm_clock_get(struct drm_device *dev, u32 id)
 
 	reg0 = nv_rd32(dev, pll.reg + 0);
 	reg1 = nv_rd32(dev, pll.reg + 4);
+
+	if ((reg0 & 0x80000000) == 0) {
+		if (id == PLL_SHADER) {
+			NV_INFO(dev, "Shader PLL appears to be OFF\n");
+			ret = nv50_pm_clock_get(dev, PLL_CORE);
+			if (ret > 0)
+				return ret*2;
+		} else if (id == PLL_MEMORY) {
+			NV_INFO(dev, "Memory PLL appears to be OFF\n");
+			return 100*1000;
+		}
+	}
+
 	P = (reg0 & 0x00070000) >> 16;
 	N = (reg1 & 0x0000ff00) >> 8;
 	M = (reg1 & 0x000000ff);
-- 
1.7.1

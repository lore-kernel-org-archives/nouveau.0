From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] drm/nv41/pm: Write to correct registers on
	nv41_fan_set()
Date: Thu,  4 Aug 2011 19:22:44 +0100
Message-ID: <1312482164-11599-1-git-send-email-emil.l.velikov@gmail.com>
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

Signed-off-by: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nv40_pm.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nv40_pm.c b/drivers/gpu/drm/nouveau/nv40_pm.c
index c5ad31c..aa9fded 100644
--- a/drivers/gpu/drm/nouveau/nv40_pm.c
+++ b/drivers/gpu/drm/nouveau/nv40_pm.c
@@ -380,7 +380,7 @@ nv41_pm_fanspeed_set(struct drm_device *dev, int percent)
 	u32 divs = pm->pwm_divisor;
 	u32 duty = ((100 - percent) * divs) / 100;
 
-	nv_wr32(dev, 0x0010f8, divs);
-	nv_wr32(dev, 0x0010f4, duty | 0x80000000);
+	nv_wr32(dev, 0x0015f8, divs);
+	nv_wr32(dev, 0x0015f4, duty | 0x80000000);
 	return 0;
 }
-- 
1.7.6

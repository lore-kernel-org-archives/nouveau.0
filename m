From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: [PATCH] drm/nouveau: correctly pair hwmon_init and
	hwmon_fini
Date: Sun, 30 Jan 2011 11:06:52 +0100
Message-ID: <1296382012.2309.3.camel@workstation>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-sT8zv7WVdF2SNe8roBrX"
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
To: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Nouveau Dev List <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org


--=-sT8zv7WVdF2SNe8roBrX
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Ben,

please push. This fixes
https://bugs.freedesktop.org/show_bug.cgi?id=33434 where I messed up.

-- Lucas

--=-sT8zv7WVdF2SNe8roBrX
Content-Disposition: attachment; filename*0=0001-drm-nouveau-correctly-pair-hwmon_init-and-hwmon_fini.pat; filename*1=ch
Content-Type: text/x-patch; name="0001-drm-nouveau-correctly-pair-hwmon_init-and-hwmon_fini.patch"; charset="UTF-8"
Content-Transfer-Encoding: 7bit

From 996f1a11521a1b5b71e82b24e388a03f2f7ae2c2 Mon Sep 17 00:00:00 2001
From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Date: Sun, 30 Jan 2011 10:54:11 +0100
Subject: [PATCH] drm/nouveau: correctly pair hwmon_init and hwmon_fini

I broke this with my commit
07cfe0e7a820ecad078c04e9c2a102521709145d

This fixes fdo #33434

Signed-off-by: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_pm.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_pm.c b/drivers/gpu/drm/nouveau/nouveau_pm.c
index fb846a3..f05c0cd 100644
--- a/drivers/gpu/drm/nouveau/nouveau_pm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_pm.c
@@ -443,7 +443,7 @@ nouveau_hwmon_fini(struct drm_device *dev)
 	struct nouveau_pm_engine *pm = &dev_priv->engine.pm;
 
 	if (pm->hwmon) {
-		sysfs_remove_group(&pm->hwmon->kobj, &hwmon_attrgroup);
+		sysfs_remove_group(&dev->pdev->dev.kobj, &hwmon_attrgroup);
 		hwmon_device_unregister(pm->hwmon);
 	}
 #endif
-- 
1.7.3.5


--=-sT8zv7WVdF2SNe8roBrX
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--=-sT8zv7WVdF2SNe8roBrX--

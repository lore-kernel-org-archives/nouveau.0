From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: [PATCH] fix hwmon device binding
Date: Thu, 06 Jan 2011 20:54:35 +0100
Message-ID: <1294343675.2120.18.camel@workstation>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-P/8vVJBcHvKZfQ+lariw"
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
To: Nouveau Dev List <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org


--=-P/8vVJBcHvKZfQ+lariw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The following patch fixes the creation directory of the hwmon files, to
get our directory hierarchy in line with all other hwmon drivers.

--lynxeye

--=-P/8vVJBcHvKZfQ+lariw
Content-Disposition: attachment; filename="0002-drm-nouveau-fix-hwmon-device-binding.patch"
Content-Type: text/x-patch; name="0002-drm-nouveau-fix-hwmon-device-binding.patch"; charset="UTF-8"
Content-Transfer-Encoding: 7bit

From b29a9259cbc6f88f83d7162e88f89f9345c1be3d Mon Sep 17 00:00:00 2001
From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Date: Thu, 6 Jan 2011 20:29:53 +0100
Subject: [PATCH 2/2] drm/nouveau: fix hwmon device binding

Bind the hwmon structs to nouveau device kobj. This makes sure
the hwmon files are created in the device subdir in line with
all other hwmon drivers.

Signed-off-by: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_pm.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_pm.c b/drivers/gpu/drm/nouveau/nouveau_pm.c
index d938141..1b24caa 100644
--- a/drivers/gpu/drm/nouveau/nouveau_pm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_pm.c
@@ -422,7 +422,7 @@ nouveau_hwmon_init(struct drm_device *dev)
 		return ret;
 	}
 	dev_set_drvdata(hwmon_dev, dev);
-	ret = sysfs_create_group(&hwmon_dev->kobj,
+	ret = sysfs_create_group(&dev->pdev->dev.kobj,
 					&hwmon_attrgroup);
 	if (ret) {
 		NV_ERROR(dev,
-- 
1.7.3.4


--=-P/8vVJBcHvKZfQ+lariw
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--=-P/8vVJBcHvKZfQ+lariw--

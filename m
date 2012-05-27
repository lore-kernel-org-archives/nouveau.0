From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] drm/nouveau/pm: fix oops on get/set_perflvl
Date: Sun, 27 May 2012 22:00:41 +0200
Message-ID: <20120527200041.GE2907@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Regression from "drm/nouveau: very scary looking cleanup commit"

Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_pm.c |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_pm.c b/drivers/gpu/drm/nouveau/nouveau_pm.c
index 9dd34fe..5539482 100644
--- a/drivers/gpu/drm/nouveau/nouveau_pm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_pm.c
@@ -306,7 +306,8 @@ nouveau_pm_get_perflvl_info(struct device *d,
 static ssize_t
 nouveau_pm_get_perflvl(struct device *d, struct device_attribute *a, char *buf)
 {
-	struct nouveau_device *ndev = pci_get_drvdata(to_pci_dev(d));
+	struct drm_device *dev = pci_get_drvdata(to_pci_dev(d));
+	struct nouveau_device *ndev = nouveau_device(dev);
 	struct nouveau_pm_engine *pm = &ndev->subsys.pm;
 	struct nouveau_pm_level cur;
 	int len = PAGE_SIZE, ret;
@@ -327,7 +328,8 @@ static ssize_t
 nouveau_pm_set_perflvl(struct device *d, struct device_attribute *a,
 		       const char *buf, size_t count)
 {
-	struct nouveau_device *ndev = pci_get_drvdata(to_pci_dev(d));
+	struct drm_device *dev = pci_get_drvdata(to_pci_dev(d));
+	struct nouveau_device *ndev = nouveau_device(dev);
 	int ret;
 
 	ret = nouveau_pm_profile_set(ndev, buf);
-- 
1.7.8.6

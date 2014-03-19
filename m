From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH] drm: compute runpm on load,
	don't register autosuspend for non-runpm
Date: Wed, 19 Mar 2014 11:28:42 -0400
Message-ID: <1395242922-1617-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

There was a proliferation of duplicated checks for runpm == -1 &&
optimus. Instead of continuing that tradition, get rid of all of them,
only doing the optimus computation once on load.

This should hopefully fix secondary cards suspending and then being
unable to come back in non-optimus setups.

Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org> # 3.12+
---

This is as yet untested, but I wanted to send this out to the list
since I think a few people are still running into these annoying
issues.

I don't have access to an actual optimus configuration, so if someone
could give this a shot on such a setup and confirm that things
autosuspend as expected without any runpm parameters, that'd be great.

 drm/nouveau_drm.c | 18 +++++-------------
 drm/nouveau_vga.c |  4 +---
 2 files changed, 6 insertions(+), 16 deletions(-)

diff --git a/drm/nouveau_drm.c b/drm/nouveau_drm.c
index 8f811a5..a6225ee 100644
--- a/drm/nouveau_drm.c
+++ b/drm/nouveau_drm.c
@@ -352,6 +352,10 @@ nouveau_drm_load(struct drm_device *dev, unsigned long flags)
 	struct nouveau_drm *drm;
 	int ret;
 
+	if (nouveau_runtime_pm == -1)
+		nouveau_runtime_pm =
+			nouveau_is_optimus() || nouveau_is_v1_dsm();
+
 	ret = nouveau_cli_create(nouveau_name(dev), "DRM", sizeof(*drm),
 				 (void **)&drm);
 	if (ret)
@@ -443,7 +447,7 @@ nouveau_drm_load(struct drm_device *dev, unsigned long flags)
 	nouveau_accel_init(drm);
 	nouveau_fbcon_init(dev);
 
-	if (nouveau_runtime_pm != 0) {
+	if (nouveau_runtime_pm) {
 		pm_runtime_use_autosuspend(dev->dev);
 		pm_runtime_set_autosuspend_delay(dev->dev, 5000);
 		pm_runtime_set_active(dev->dev);
@@ -894,12 +898,6 @@ static int nouveau_pmops_runtime_suspend(struct device *dev)
 	if (nouveau_runtime_pm == 0)
 		return -EINVAL;
 
-	/* are we optimus enabled? */
-	if (nouveau_runtime_pm == -1 && !nouveau_is_optimus() && !nouveau_is_v1_dsm()) {
-		DRM_DEBUG_DRIVER("failing to power off - not optimus\n");
-		return -EINVAL;
-	}
-
 	nv_debug_level(SILENT);
 	drm_kms_helper_poll_disable(drm_dev);
 	vga_switcheroo_set_dynamic_switch(pdev, VGA_SWITCHEROO_OFF);
@@ -951,12 +949,6 @@ static int nouveau_pmops_runtime_idle(struct device *dev)
 	if (nouveau_runtime_pm == 0)
 		return -EBUSY;
 
-	/* are we optimus enabled? */
-	if (nouveau_runtime_pm == -1 && !nouveau_is_optimus() && !nouveau_is_v1_dsm()) {
-		DRM_DEBUG_DRIVER("failing to power off - not optimus\n");
-		return -EBUSY;
-	}
-
 	/* if we have a hdmi audio device - make sure it has a driver loaded */
 	if (drm->hdmi_device) {
 		if (!drm->hdmi_device->driver) {
diff --git a/drm/nouveau_vga.c b/drm/nouveau_vga.c
index fb84da3..b00b05a 100644
--- a/drm/nouveau_vga.c
+++ b/drm/nouveau_vga.c
@@ -91,9 +91,7 @@ nouveau_vga_init(struct nouveau_drm *drm)
 
 	vga_client_register(dev->pdev, dev, NULL, nouveau_vga_set_decode);
 
-	if (nouveau_runtime_pm == 1)
-		runtime = true;
-	if ((nouveau_runtime_pm == -1) && (nouveau_is_optimus() || nouveau_is_v1_dsm()))
+	if (nouveau_runtime_pm)
 		runtime = true;
 	vga_switcheroo_register_client(dev->pdev, &nouveau_switcheroo_ops, runtime);
 
-- 
1.8.3.2

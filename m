From: Lyude Paul <lyude@redhat.com>
Subject: [PATCH v2 3/3] drm/nouveau: Remove bogus crtc check in pmops_runtime_idle
Date: Thu, 12 Jul 2018 13:02:54 -0400
Message-ID: <20180712170256.13018-4-lyude@redhat.com>
References: <20180712170256.13018-1-lyude@redhat.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180712170256.13018-1-lyude@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: nouveau@lists.freedesktop.org
Cc: Karol Herbst <kherbst@redhat.com>, stable@vger.kernel.org, Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

This both uses the legacy modesetting structures in a racy manner, and
additionally also doesn't even check the right variable (enabled != the
CRTC is actually turned on for atomic).

This fixes issues on my P50 regarding the dedicated GPU not entering
runtime suspend.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Cc: stable@vger.kernel.org
---
 drivers/gpu/drm/nouveau/nouveau_drm.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 0f668e275ee1..c7ec86d6c3c9 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -881,22 +881,11 @@ nouveau_pmops_runtime_resume(struct device *dev)
 static int
 nouveau_pmops_runtime_idle(struct device *dev)
 {
-	struct pci_dev *pdev = to_pci_dev(dev);
-	struct drm_device *drm_dev = pci_get_drvdata(pdev);
-	struct nouveau_drm *drm = nouveau_drm(drm_dev);
-	struct drm_crtc *crtc;
-
 	if (!nouveau_pmops_runtime()) {
 		pm_runtime_forbid(dev);
 		return -EBUSY;
 	}
 
-	list_for_each_entry(crtc, &drm->dev->mode_config.crtc_list, head) {
-		if (crtc->enabled) {
-			DRM_DEBUG_DRIVER("failing to power off - crtc active\n");
-			return -EBUSY;
-		}
-	}
 	pm_runtime_mark_last_busy(dev);
 	pm_runtime_autosuspend(dev);
 	/* we don't want the main rpm_idle to call suspend - we want to autosuspend */
-- 
2.17.1

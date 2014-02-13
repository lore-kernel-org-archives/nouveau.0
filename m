From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH 1/2] drm/nouveau: make hdmi device finding failure
	prints debug level
Date: Thu, 13 Feb 2014 03:39:50 -0500
Message-ID: <1392280791-7579-1-git-send-email-imirkin@alum.mit.edu>
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
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

The hdmi device is required for runtime pm. However it is not available
on many esp older devices, which were all seeing these error messages.
Take this opportunity to also convert to nv_debug instead of the DRM_*
messages, like the rest of nouveau does.

Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_drm.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 89c484d..1c7c8a7 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -300,22 +300,21 @@ static int nouveau_drm_probe(struct pci_dev *pdev,
 #define PCI_CLASS_MULTIMEDIA_HD_AUDIO 0x0403
 
 static void
-nouveau_get_hdmi_dev(struct drm_device *dev)
+nouveau_get_hdmi_dev(struct nouveau_drm *drm)
 {
-	struct nouveau_drm *drm = dev->dev_private;
-	struct pci_dev *pdev = dev->pdev;
+	struct pci_dev *pdev = drm->dev->pdev;
 
 	/* subfunction one is a hdmi audio device? */
 	drm->hdmi_device = pci_get_bus_and_slot((unsigned int)pdev->bus->number,
 						PCI_DEVFN(PCI_SLOT(pdev->devfn), 1));
 
 	if (!drm->hdmi_device) {
-		DRM_INFO("hdmi device  not found %d %d %d\n", pdev->bus->number, PCI_SLOT(pdev->devfn), 1);
+		nv_debug(drm, "hdmi device not found %d %d %d\n", pdev->bus->number, PCI_SLOT(pdev->devfn), 1);
 		return;
 	}
 
 	if ((drm->hdmi_device->class >> 8) != PCI_CLASS_MULTIMEDIA_HD_AUDIO) {
-		DRM_INFO("possible hdmi device  not audio %d\n", drm->hdmi_device->class);
+		nv_debug(drm, "possible hdmi device not audio %d\n", drm->hdmi_device->class);
 		pci_dev_put(drm->hdmi_device);
 		drm->hdmi_device = NULL;
 		return;
@@ -340,7 +339,7 @@ nouveau_drm_load(struct drm_device *dev, unsigned long flags)
 	INIT_LIST_HEAD(&drm->clients);
 	spin_lock_init(&drm->tile.lock);
 
-	nouveau_get_hdmi_dev(dev);
+	nouveau_get_hdmi_dev(drm);
 
 	/* make sure AGP controller is in a consistent state before we
 	 * (possibly) execute vbios init tables (see nouveau_agp.h)
-- 
1.8.3.2

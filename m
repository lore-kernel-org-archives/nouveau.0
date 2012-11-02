From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 3/4] nouveau: Factor out common code to NVHasKMS()
Date: Fri,  2 Nov 2012 03:57:41 +0000
Message-ID: <1351828662-10807-4-git-send-email-emil.l.velikov@gmail.com>
References: <op.wm4fbfzs8t7z9u@arch-laptop>
	<1351828662-10807-1-git-send-email-emil.l.velikov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1351828662-10807-1-git-send-email-emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
Cc: Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

As the name suggests checks if it has kernel mode setting,
prints out the interface version and checkes if the chipset
is supported

Function is used in NVPciProbe and NVPlatformProbe

Signed-off-by: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 src/nv_driver.c | 45 +++++++++++++++++++++++++++++----------------
 1 file changed, 29 insertions(+), 16 deletions(-)

diff --git a/src/nv_driver.c b/src/nv_driver.c
index dc4f3b2..f184cd4 100644
--- a/src/nv_driver.c
+++ b/src/nv_driver.c
@@ -247,19 +247,12 @@ NVInitScrn(ScrnInfoPtr pScrn, int entity_num)
 }
 
 static Bool
-NVPciProbe(DriverPtr drv, int entity_num, struct pci_device *pci_dev,
-	   intptr_t match_data)
+NVHasKMS(struct pci_device *pci_dev)
 {
-	PciChipsets NVChipsets[] = {
-		{ pci_dev->device_id,
-		  (pci_dev->vendor_id << 16) | pci_dev->device_id, NULL },
-		{ -1, -1, NULL }
-	};
 	struct nouveau_device *dev = NULL;
-	ScrnInfoPtr pScrn = NULL;
 	drmVersion *version;
-	int chipset, ret;
 	char *busid;
+	int chipset, ret;
 
 	if (!xf86LoaderCheckSymbol("DRICreatePCIBusID")) {
 		xf86DrvMsg(-1, X_ERROR, "[drm] No DRICreatePCIBusID symbol\n");
@@ -267,10 +260,17 @@ NVPciProbe(DriverPtr drv, int entity_num, struct pci_device *pci_dev,
 	}
 	busid = DRICreatePCIBusID(pci_dev);
 
+	ret = drmCheckModesettingSupported(busid);
+	if (ret) {
+		xf86DrvMsg(-1, X_ERROR, "[drm] KMS not enabled\n");
+		free(busid);
+		return FALSE;
+	}
+
 	ret = nouveau_device_open(busid, &dev);
+	free(busid);
 	if (ret) {
 		xf86DrvMsg(-1, X_ERROR, "[drm] failed to open device\n");
-		free(busid);
 		return FALSE;
 	}
 
@@ -288,12 +288,6 @@ NVPciProbe(DriverPtr drv, int entity_num, struct pci_device *pci_dev,
 	chipset = dev->chipset;
 	nouveau_device_del(&dev);
 
-	ret = drmCheckModesettingSupported(busid);
-	free(busid);
-	if (ret) {
-		xf86DrvMsg(-1, X_ERROR, "[drm] KMS not enabled\n");
-		return FALSE;
-	}
 
 	switch (chipset & 0xf0) {
 	case 0x00:
@@ -314,6 +308,22 @@ NVPciProbe(DriverPtr drv, int entity_num, struct pci_device *pci_dev,
 		xf86DrvMsg(-1, X_ERROR, "Unknown chipset: NV%02x\n", chipset);
 		return FALSE;
 	}
+	return TRUE;
+}
+
+static Bool
+NVPciProbe(DriverPtr drv, int entity_num, struct pci_device *pci_dev,
+	   intptr_t match_data)
+{
+	PciChipsets NVChipsets[] = {
+		{ pci_dev->device_id,
+		  (pci_dev->vendor_id << 16) | pci_dev->device_id, NULL },
+		{ -1, -1, NULL }
+	};
+	ScrnInfoPtr pScrn = NULL;
+
+	if (!NVHasKMS(pci_dev))
+		return FALSE;
 
 	pScrn = xf86ConfigPciEntity(pScrn, 0, entity_num, NVChipsets,
 				    NULL, NULL, NULL, NULL, NULL);
@@ -336,6 +346,9 @@ NVPlatformProbe(DriverPtr driver,
 	if (!dev->pdev)
 		return FALSE;
 
+	if (!NVHasKMS(dev->pdev))
+		return FALSE;
+
 	if (flags & PLATFORM_PROBE_GPU_SCREEN)
 		scr_flags = XF86_ALLOCATE_GPU_SCREEN;
 
-- 
1.8.0

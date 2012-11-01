From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/4] nouveau: Use helper function
	nouveau_kernel_mode_enabled()
Date: Thu,  1 Nov 2012 14:40:56 +0000
Message-ID: <1351780858-13631-3-git-send-email-emil.l.velikov@gmail.com>
References: <1351780858-13631-1-git-send-email-emil.l.velikov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1351780858-13631-1-git-send-email-emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
 src/nv_driver.c | 64 ++++++---------------------------------------------------
 1 file changed, 6 insertions(+), 58 deletions(-)

diff --git a/src/nv_driver.c b/src/nv_driver.c
index eff0d47..911b05d 100644
--- a/src/nv_driver.c
+++ b/src/nv_driver.c
@@ -319,6 +319,7 @@ nouveau_kernel_mode_enabled(ScrnInfoPtr pScrn, struct pci_device *pci_dev)
 
 	return TRUE;
 }
+
 static Bool
 NVPciProbe(DriverPtr drv, int entity_num, struct pci_device *pci_dev,
 	   intptr_t match_data)
@@ -328,72 +329,19 @@ NVPciProbe(DriverPtr drv, int entity_num, struct pci_device *pci_dev,
 		  (pci_dev->vendor_id << 16) | pci_dev->device_id, NULL },
 		{ -1, -1, NULL }
 	};
-	struct nouveau_device *dev = NULL;
 	EntityInfoPtr pEnt = NULL;
 	ScrnInfoPtr pScrn = NULL;
-	drmVersion *version;
-	int chipset, ret;
-	char *busid;
-
-	if (!xf86LoaderCheckSymbol("DRICreatePCIBusID")) {
-		xf86DrvMsg(-1, X_ERROR, "[drm] No DRICreatePCIBusID symbol\n");
-		return FALSE;
-	}
-	busid = DRICreatePCIBusID(pci_dev);
-
-	ret = nouveau_device_open(busid, &dev);
-	if (ret) {
-		xf86DrvMsg(-1, X_ERROR, "[drm] failed to open device\n");
-		free(busid);
-		return FALSE;
-	}
-
-	/* Check the version reported by the kernel module.  In theory we
-	 * shouldn't have to do this, as libdrm_nouveau will do its own checks.
-	 * But, we're currently using the kernel patchlevel to also version
-	 * the DRI interface.
-	 */
-	version = drmGetVersion(dev->fd);
-	xf86DrvMsg(-1, X_INFO, "[drm] nouveau interface version: %d.%d.%d\n",
-		   version->version_major, version->version_minor,
-		   version->version_patchlevel);
-	drmFree(version);
-
-	chipset = dev->chipset;
-	nouveau_device_del(&dev);
-
-	ret = drmCheckModesettingSupported(busid);
-	free(busid);
-	if (ret) {
-		xf86DrvMsg(-1, X_ERROR, "[drm] KMS not enabled\n");
-		return FALSE;
-	}
-
-	switch (chipset & 0xf0) {
-	case 0x00:
-	case 0x10:
-	case 0x20:
-	case 0x30:
-	case 0x40:
-	case 0x60:
-	case 0x50:
-	case 0x80:
-	case 0x90:
-	case 0xa0:
-	case 0xc0:
-	case 0xd0:
-	case 0xe0:
-		break;
-	default:
-		xf86DrvMsg(-1, X_ERROR, "Unknown chipset: NV%02x\n", chipset);
-		return FALSE;
-	}
+	int ret;
 
 	pScrn = xf86ConfigPciEntity(pScrn, 0, entity_num, NVChipsets,
 				    NULL, NULL, NULL, NULL, NULL);
 	if (!pScrn)
 		return FALSE;
 
+	if (!nouveau_kernel_mode_enabled(pScrn, pci_dev)) {
+		return FALSE;
+	}
+
 	pScrn->driverVersion    = NV_VERSION;
 	pScrn->driverName       = NV_DRIVER_NAME;
 	pScrn->name             = NV_NAME;
-- 
1.8.0

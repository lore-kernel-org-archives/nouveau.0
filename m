From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/4] nouveau: add nouveau_kernel_mode_enabled()
Date: Thu,  1 Nov 2012 14:40:55 +0000
Message-ID: <1351780858-13631-2-git-send-email-emil.l.velikov@gmail.com>
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

Used in later patch to remove code duplication and improve
NvPciProbe() and NvPlatformProbe()

Copied verbatim from xf86-video-radeon

Signed-off-by: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 src/nv_driver.c | 68 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/src/nv_driver.c b/src/nv_driver.c
index 9b5b9d6..eff0d47 100644
--- a/src/nv_driver.c
+++ b/src/nv_driver.c
@@ -252,6 +252,74 @@ NVDriverFunc(ScrnInfoPtr scrn, xorgDriverFuncOp op, void *data)
 }
 
 static Bool
+nouveau_kernel_mode_enabled(ScrnInfoPtr pScrn, struct pci_device *pci_dev)
+{
+	struct nouveau_device *dev = NULL;
+	drmVersion *version;
+	char *busid;
+	int chipset, ret;
+
+	if (!xf86LoaderCheckSymbol("DRICreatePCIBusID")) {
+		xf86DrvMsg(pScrn->scrnIndex, X_ERROR,
+			   "[drm] No DRICreatePCIBusID symbol\n");
+		return FALSE;
+	}
+
+	busid = DRICreatePCIBusID(pci_dev);
+	ret = drmCheckModesettingSupported(busid);
+	if (ret) {
+		xf86DrvMsg(pScrn->scrnIndex, X_ERROR, "[drm] KMS not enabled\n");
+		free(busid);
+		return FALSE;
+	}
+
+	ret = nouveau_device_open(busid, &dev);
+	if (ret) {
+		xf86DrvMsg(pScrn->scrnIndex, X_ERROR,
+			   "[drm] failed to open device\n");
+		free(busid);
+		return FALSE;
+	}
+	/* Check the version reported by the kernel module.  In theory we
+	 * shouldn't have to do this, as libdrm_nouveau will do its own checks.
+	 * But, we're currently using the kernel patchlevel to also version
+	 * the DRI interface.
+	 */
+	version = drmGetVersion(dev->fd);
+	xf86DrvMsg(pScrn->scrnIndex, X_INFO,	
+		   "[drm] nouveau interface version: %d.%d.%d\n",
+		   version->version_major, version->version_minor,
+		   version->version_patchlevel);
+	drmFree(version);
+
+	chipset = dev->chipset;
+	nouveau_device_del(&dev);
+	free(busid);
+
+	switch (chipset & 0xf0) {
+	case 0x00:
+	case 0x10:
+	case 0x20:
+	case 0x30:
+	case 0x40:
+	case 0x60:
+	case 0x50:
+	case 0x80:
+	case 0x90:
+	case 0xa0:
+	case 0xc0:
+	case 0xd0:
+	case 0xe0:
+		break;
+	default:
+		xf86DrvMsg(pScrn->scrnIndex, X_ERROR,
+			   "Unknown chipset: NV%02x\n", chipset);
+		return FALSE;
+	}
+
+	return TRUE;
+}
+static Bool
 NVPciProbe(DriverPtr drv, int entity_num, struct pci_device *pci_dev,
 	   intptr_t match_data)
 {
-- 
1.8.0

From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] drm/nouveau: fix early vram corruption
 originating from vgacon
Date: Thu, 13 Sep 2012 00:52:30 +0200
Message-ID: <20120912225230.GD8067@joi.lan>
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
To: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

There's a short window between module load and fbcon initalization when
it's possible for vgacon to write to VGA RAM. Nouveau uses this memory
for different purposes, so if we are unlucky, it causes mysterious memory
corruptions.

For me, booting with nv_printk debug levels set to 5 was enough to trigger it.
It manifested as long stream of:
"trapped write at ... on channel 0x0001fea0 BAR/PFIFO_WRITE/IN reason:
DMAOBJ_LIMIT / PT_NOT_PRESENT / PAGE_SYSTEM_ONLY / PAGE_NOT_PRESENT"
which eventually lead to complete hang.

Disabling access to VGA memory (through 0x54 PCI config space register) is
enough to fix it, but it breaks copying screen data between old and new
console (because old data is inaccessible). But blanking console (with
entering_gfx==1) is enough to move vgacon screen buffer from VRAM to RAM
and let handover to work correctly.

Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_drm.c | 31 ++++++++++++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 6826525..1641bd9 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -25,6 +25,7 @@
 #include <linux/console.h>
 #include <linux/module.h>
 #include <linux/pci.h>
+#include <linux/vt_kern.h>
 
 #include <core/device.h>
 #include <core/client.h>
@@ -51,6 +52,8 @@
 
 #include "nouveau_ttm.h"
 
+#define NV_PCI_VGAMEM_ENABLE 0x54
+
 MODULE_PARM_DESC(config, "option string to pass to driver core");
 static char *nouveau_config;
 module_param_named(config, nouveau_config, charp, 0400);
@@ -247,9 +250,20 @@ nouveau_drm_load(struct drm_device *dev, unsigned long flags)
 	struct nouveau_drm *drm;
 	int ret;
 
+	/* Blank initial console to prevent VRAM corruption while we initialize
+	 * the HW. For vgacon it will move console memory from VGA VRAM to RAM.
+	 */
+	console_lock();
+	do_blank_screen(1);
+	console_unlock();
+
+	/* Completely disable access to VGA IO/memory, just to be sure no one
+	 * will change it. */
+	pci_write_config_byte(pdev, NV_PCI_VGAMEM_ENABLE, 0);
+
 	ret = nouveau_cli_create(pdev, "DRM", sizeof(*drm), (void**)&drm);
 	if (ret)
-		return ret;
+		goto fail_cli;
 
 	dev->dev_private = drm;
 	drm->dev = dev;
@@ -336,6 +350,11 @@ nouveau_drm_load(struct drm_device *dev, unsigned long flags)
 
 	nouveau_accel_init(drm);
 	nouveau_fbcon_init(dev);
+
+	console_lock();
+	do_unblank_screen(1);
+	console_unlock();
+
 	return 0;
 
 fail_dispinit:
@@ -351,12 +370,20 @@ fail_ttm:
 	nouveau_vga_fini(drm);
 fail_device:
 	nouveau_cli_destroy(&drm->client);
+fail_cli:
+	pci_write_config_byte(pdev, NV_PCI_VGAMEM_ENABLE, 1);
+
+	console_lock();
+	do_unblank_screen(1);
+	console_unlock();
+
 	return ret;
 }
 
 static int
 nouveau_drm_unload(struct drm_device *dev)
 {
+	struct pci_dev *pdev = dev->pdev;
 	struct nouveau_drm *drm = nouveau_drm(dev);
 
 	nouveau_fbcon_fini(dev);
@@ -375,6 +402,8 @@ nouveau_drm_unload(struct drm_device *dev)
 	nouveau_vga_fini(drm);
 
 	nouveau_cli_destroy(&drm->client);
+
+	pci_write_config_byte(pdev, NV_PCI_VGAMEM_ENABLE, 1);
 	return 0;
 }
 
-- 
1.7.12

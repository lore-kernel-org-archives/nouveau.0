From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 3/4] nouveau: Check for kms in NvPlatformProbe
Date: Thu,  1 Nov 2012 14:40:57 +0000
Message-ID: <1351780858-13631-4-git-send-email-emil.l.velikov@gmail.com>
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
 src/nv_driver.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/src/nv_driver.c b/src/nv_driver.c
index 911b05d..c1a50cd 100644
--- a/src/nv_driver.c
+++ b/src/nv_driver.c
@@ -57,6 +57,8 @@ static void    NVFreeScreen(FREE_SCREEN_ARGS_DECL);
 
 static Bool	NVMapMem(ScrnInfoPtr pScrn);
 static Bool	NVUnmapMem(ScrnInfoPtr pScrn);
+static Bool	nouveau_kernel_mode_enabled(ScrnInfoPtr pScrn,
+				   struct pci_device *pci_dev);
 
 #define NOUVEAU_PCI_DEVICE(_vendor_id, _device_id)                             \
 	{ (_vendor_id), (_device_id), PCI_MATCH_ANY, PCI_MATCH_ANY,            \
@@ -76,7 +78,9 @@ static Bool NVPciProbe (	DriverPtr 		drv,
 #ifdef XSERVER_PLATFORM_BUS
 static Bool
 NVPlatformProbe(DriverPtr driver,
-            int entity_num, int flags, struct xf86_platform_device *dev, intptr_t dev_match_data)
+		   int entity_num, int flags,
+		   struct xf86_platform_device *dev,
+		   intptr_t dev_match_data)
 {
 	ScrnInfoPtr scrn = NULL;
 	uint32_t scr_flags = 0;
@@ -84,12 +88,17 @@ NVPlatformProbe(DriverPtr driver,
 	if (!dev->pdev)
 		return FALSE;
 
-        if (flags & PLATFORM_PROBE_GPU_SCREEN)
-               scr_flags = XF86_ALLOCATE_GPU_SCREEN;
+	if (flags & PLATFORM_PROBE_GPU_SCREEN)
+		scr_flags = XF86_ALLOCATE_GPU_SCREEN;
 
 	scrn = xf86AllocateScreen(driver, scr_flags);
+	if (!scrn)
+		return FALSE;
 	xf86AddEntityToScreen(scrn, entity_num);
 
+	if (!nouveau_kernel_mode_enabled(scrn, dev->pdev))
+		return FALSE;
+
 	scrn->driverVersion    = NV_VERSION;
 	scrn->driverName       = NV_DRIVER_NAME;
 	scrn->name             = NV_NAME;
@@ -102,7 +111,8 @@ NVPlatformProbe(DriverPtr driver,
 	scrn->EnterVT          = NVEnterVT;
 	scrn->LeaveVT          = NVLeaveVT;
 	scrn->FreeScreen       = NVFreeScreen;
-	return scrn != NULL;
+
+	return TRUE;
 }
 #endif
 
-- 
1.8.0

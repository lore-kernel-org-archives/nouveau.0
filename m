From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/4] nouveau: introduce NVInitScrn()
Date: Fri,  2 Nov 2012 03:57:40 +0000
Message-ID: <1351828662-10807-3-git-send-email-emil.l.velikov@gmail.com>
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

Common/helper function for NV{Pci,Platform}Probe()

This introduces some the following functions to the
NVPlatformProbe codepath
* xf86SetEntitySharable()
* xf86SetEntityInstanceForScreen()

Necessary for dualhead, xinerama and/or zaphodhead

v2: Rename nouveau_init_scrn() to NVInitScrn()
Signed-off-by: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 src/nv_driver.c | 91 +++++++++++++++++++++++++++++----------------------------
 1 file changed, 47 insertions(+), 44 deletions(-)

diff --git a/src/nv_driver.c b/src/nv_driver.c
index c885e73..dc4f3b2 100644
--- a/src/nv_driver.c
+++ b/src/nv_driver.c
@@ -74,36 +74,10 @@ static Bool NVPciProbe (	DriverPtr 		drv,
 				intptr_t		match_data	);
 
 #ifdef XSERVER_PLATFORM_BUS
-static Bool
-NVPlatformProbe(DriverPtr driver,
-            int entity_num, int flags, struct xf86_platform_device *dev, intptr_t dev_match_data)
-{
-	ScrnInfoPtr scrn = NULL;
-	uint32_t scr_flags = 0;
-
-	if (!dev->pdev)
-		return FALSE;
-
-        if (flags & PLATFORM_PROBE_GPU_SCREEN)
-               scr_flags = XF86_ALLOCATE_GPU_SCREEN;
-
-	scrn = xf86AllocateScreen(driver, scr_flags);
-	xf86AddEntityToScreen(scrn, entity_num);
-
-	scrn->driverVersion    = NV_VERSION;
-	scrn->driverName       = NV_DRIVER_NAME;
-	scrn->name             = NV_NAME;
-
-	scrn->Probe            = NULL;
-	scrn->PreInit          = NVPreInit;
-	scrn->ScreenInit       = NVScreenInit;
-	scrn->SwitchMode       = NVSwitchMode;
-	scrn->AdjustFrame      = NVAdjustFrame;
-	scrn->EnterVT          = NVEnterVT;
-	scrn->LeaveVT          = NVLeaveVT;
-	scrn->FreeScreen       = NVFreeScreen;
-	return scrn != NULL;
-}
+static Bool NVPlatformProbe(DriverPtr driver,
+				int entity_num, int flags,
+				struct xf86_platform_device *dev,
+				intptr_t dev_match_data);
 #endif
 
 /*
@@ -251,6 +225,27 @@ NVDriverFunc(ScrnInfoPtr scrn, xorgDriverFuncOp op, void *data)
     }
 }
 
+static void
+NVInitScrn(ScrnInfoPtr pScrn, int entity_num)
+{
+	pScrn->driverVersion    = NV_VERSION;
+	pScrn->driverName       = NV_DRIVER_NAME;
+	pScrn->name             = NV_NAME;
+
+	pScrn->Probe            = NULL;
+	pScrn->PreInit          = NVPreInit;
+	pScrn->ScreenInit       = NVScreenInit;
+	pScrn->SwitchMode       = NVSwitchMode;
+	pScrn->AdjustFrame      = NVAdjustFrame;
+	pScrn->EnterVT          = NVEnterVT;
+	pScrn->LeaveVT          = NVLeaveVT;
+	pScrn->FreeScreen       = NVFreeScreen;
+
+	xf86SetEntitySharable(entity_num);
+	xf86SetEntityInstanceForScreen(pScrn, entity_num,
+					xf86GetNumEntityInstances(entity_num) - 1);
+}
+
 static Bool
 NVPciProbe(DriverPtr drv, int entity_num, struct pci_device *pci_dev,
 	   intptr_t match_data)
@@ -325,25 +320,33 @@ NVPciProbe(DriverPtr drv, int entity_num, struct pci_device *pci_dev,
 	if (!pScrn)
 		return FALSE;
 
-	pScrn->driverVersion    = NV_VERSION;
-	pScrn->driverName       = NV_DRIVER_NAME;
-	pScrn->name             = NV_NAME;
+	NVInitScrn(pScrn, entity_num);
 
-	pScrn->Probe            = NULL;
-	pScrn->PreInit          = NVPreInit;
-	pScrn->ScreenInit       = NVScreenInit;
-	pScrn->SwitchMode       = NVSwitchMode;
-	pScrn->AdjustFrame      = NVAdjustFrame;
-	pScrn->EnterVT          = NVEnterVT;
-	pScrn->LeaveVT          = NVLeaveVT;
-	pScrn->FreeScreen       = NVFreeScreen;
+	return TRUE;
+}
 
-	xf86SetEntitySharable(entity_num);
-	xf86SetEntityInstanceForScreen(pScrn, entity_num,
-					xf86GetNumEntityInstances(entity_num) - 1);
+#ifdef XSERVER_PLATFORM_BUS
+static Bool
+NVPlatformProbe(DriverPtr driver,
+            int entity_num, int flags, struct xf86_platform_device *dev, intptr_t dev_match_data)
+{
+	ScrnInfoPtr scrn = NULL;
+	uint32_t scr_flags = 0;
+
+	if (!dev->pdev)
+		return FALSE;
+
+	if (flags & PLATFORM_PROBE_GPU_SCREEN)
+		scr_flags = XF86_ALLOCATE_GPU_SCREEN;
+
+	scrn = xf86AllocateScreen(driver, scr_flags);
+	xf86AddEntityToScreen(scrn, entity_num);
+
+	NVInitScrn(scrn, entity_num);
 
 	return TRUE;
 }
+#endif
 
 #define MAX_CHIPS MAXSCREENS
 
-- 
1.8.0

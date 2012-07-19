From: Adam Jackson <ajax-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH nouveau] Implement ->driverFunc
Date: Thu, 19 Jul 2012 18:24:14 -0400
Message-ID: <1342736654-6662-1-git-send-email-ajax@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <xorg-devel-bounces+gcfxd-xorg-devel=m.gmane.org-go0+a7rfsptAfugRpC6u6w@public.gmane.org>
List-Unsubscribe: <http://lists.x.org/mailman/options/xorg-devel>,
	<mailto:xorg-devel-request-go0+a7rfsptAfugRpC6u6w@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.x.org/archives/xorg-devel>
List-Post: <mailto:xorg-devel-go0+a7rfsptAfugRpC6u6w@public.gmane.org>
List-Help: <mailto:xorg-devel-request-go0+a7rfsptAfugRpC6u6w@public.gmane.org?subject=help>
List-Subscribe: <http://lists.x.org/mailman/listinfo/xorg-devel>,
	<mailto:xorg-devel-request-go0+a7rfsptAfugRpC6u6w@public.gmane.org?subject=subscribe>
Sender: xorg-devel-bounces+gcfxd-xorg-devel=m.gmane.org-go0+a7rfsptAfugRpC6u6w@public.gmane.org
Errors-To: xorg-devel-bounces+gcfxd-xorg-devel=m.gmane.org-go0+a7rfsptAfugRpC6u6w@public.gmane.org
To: xorg-devel-go0+a7rfsptAfugRpC6u6w@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Copied from fbdev, makes it so we can run without iopl.

Signed-off-by: Adam Jackson <ajax-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 src/nv_driver.c |   19 ++++++++++++++++++-
 1 files changed, 18 insertions(+), 1 deletions(-)

diff --git a/src/nv_driver.c b/src/nv_driver.c
index beef789..9342dc8 100644
--- a/src/nv_driver.c
+++ b/src/nv_driver.c
@@ -48,6 +48,8 @@ static Bool    NVSaveScreen(ScreenPtr pScreen, int mode);
 static void    NVCloseDRM(ScrnInfoPtr);
 
 /* Optional functions */
+static Bool    NVDriverFunc(ScrnInfoPtr scrn, xorgDriverFuncOp op,
+			    void *data);
 static Bool    NVSwitchMode(SWITCH_MODE_ARGS_DECL);
 static void    NVAdjustFrame(ADJUST_FRAME_ARGS_DECL);
 static void    NVFreeScreen(FREE_SCREEN_ARGS_DECL);
@@ -88,7 +90,7 @@ _X_EXPORT DriverRec NV = {
 	NVAvailableOptions,
 	NULL,
 	0,
-	NULL,
+	NVDriverFunc,
 	nouveau_device_match,
 	NVPciProbe
 };
@@ -200,6 +202,21 @@ NVIdentify(int flags)
 }
 
 static Bool
+NVDriverFunc(ScrnInfoPtr scrn, xorgDriverFuncOp op, void *data)
+{
+    xorgHWFlags *flag;
+    
+    switch (op) {
+	case GET_REQUIRED_HW_INTERFACES:
+	    flag = (CARD32 *)data;
+	    (*flag) = 0;
+	    return TRUE;
+	default:
+	    return FALSE;
+    }
+}
+
+static Bool
 NVPciProbe(DriverPtr drv, int entity_num, struct pci_device *pci_dev,
 	   intptr_t match_data)
 {
-- 
1.7.7.6

_______________________________________________
xorg-devel-go0+a7rfsptAfugRpC6u6w@public.gmane.org: X.Org development
Archives: http://lists.x.org/archives/xorg-devel
Info: http://lists.x.org/mailman/listinfo/xorg-devel

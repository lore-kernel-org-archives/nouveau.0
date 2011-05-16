From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/2] xorg/nouveau: rename to nouveau2
Date: Mon, 16 May 2011 21:50:29 +0200
Message-ID: <20110516195029.GA5456@joi.lan>
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
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


---
 src/gallium/targets/xorg-nouveau/Makefile       |    2 +-
 src/gallium/targets/xorg-nouveau/nouveau_xorg.c |   14 +++++++-------
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/src/gallium/targets/xorg-nouveau/Makefile b/src/gallium/targets/xorg-nouveau/Makefile
index 5a2cdb1..16ac954 100644
--- a/src/gallium/targets/xorg-nouveau/Makefile
+++ b/src/gallium/targets/xorg-nouveau/Makefile
@@ -1,7 +1,7 @@
 TOP = ../../../..
 include $(TOP)/configs/current
 
-LIBNAME = modesetting_drv.so
+LIBNAME = nouveau2_drv.so
 
 C_SOURCES = \
 	nouveau_target.c \
diff --git a/src/gallium/targets/xorg-nouveau/nouveau_xorg.c b/src/gallium/targets/xorg-nouveau/nouveau_xorg.c
index f0d6492..a25254a 100644
--- a/src/gallium/targets/xorg-nouveau/nouveau_xorg.c
+++ b/src/gallium/targets/xorg-nouveau/nouveau_xorg.c
@@ -54,7 +54,7 @@ static PciChipsets nouveau_xorg_pci_devices[] = {
 };
 
 static XF86ModuleVersionInfo nouveau_xorg_version = {
-    "modesetting",
+    "nouveau2",
     MODULEVENDORSTRING,
     MODINFOSTRING1,
     MODINFOSTRING2,
@@ -70,9 +70,9 @@ static XF86ModuleVersionInfo nouveau_xorg_version = {
  * Xorg driver exported structures
  */
 
-_X_EXPORT DriverRec modesetting = {
+_X_EXPORT DriverRec nouveau2 = {
     1,
-    "modesetting",
+    "nouveau2",
     nouveau_xorg_identify,
     NULL,
     xorg_tracker_available_options,
@@ -85,7 +85,7 @@ _X_EXPORT DriverRec modesetting = {
 
 static MODULESETUPPROTO(nouveau_xorg_setup);
 
-_X_EXPORT XF86ModuleData modesettingModuleData = {
+_X_EXPORT XF86ModuleData nouveau2ModuleData = {
     &nouveau_xorg_version,
     nouveau_xorg_setup,
     NULL
@@ -104,7 +104,7 @@ nouveau_xorg_setup(pointer module, pointer opts, int *errmaj, int *errmin)
      */
     if (!setupDone) {
 	setupDone = 1;
-	xf86AddDriver(&modesetting, module, HaveDriverFuncs);
+	xf86AddDriver(&nouveau2, module, HaveDriverFuncs);
 
 	/*
 	 * The return value must be non-NULL on success even though there
@@ -121,7 +121,7 @@ nouveau_xorg_setup(pointer module, pointer opts, int *errmaj, int *errmin)
 static void
 nouveau_xorg_identify(int flags)
 {
-    xf86PrintChipsets("modesetting", "Driver for Modesetting Kernel Drivers",
+    xf86PrintChipsets("nouveau2", "Driver for Modesetting Kernel Drivers",
 		      nouveau_xorg_chipsets);
 }
 
@@ -137,7 +137,7 @@ nouveau_xorg_pci_probe(DriverPtr driver,
     if (scrn != NULL) {
 	scrn->driverVersion = 1;
 	scrn->driverName = "nouveau";
-	scrn->name = "modesetting";
+	scrn->name = "nouveau2";
 	scrn->Probe = NULL;
 
 	entity = xf86GetEntityInfo(entity_num);
-- 
1.7.4.1

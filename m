From: Maarten Lankhorst <m.b.lankhorst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2] dri2: Add vdpau driver name entry
Date: Sat, 08 Oct 2011 10:33:20 +0200
Message-ID: <4E900AD0.4070704@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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

libvdpau has a driver loading mechanism that looks for a dri2 driver
first before falling back to nvidia, so lets use that.

---

v2: Keep compatibility entry for driverName for older versions
of Xorg, and add vdpau for nouveau_vieux. I doubt it will ever
happen, but it's harmless to add.

There is no libvdpau_nouveau at the moment, but since this is the only part
needed from the xorg driver, I don't think there is any harm in exposing the
correct driver name already.

diff --git a/src/nouveau_dri2.c b/src/nouveau_dri2.c
index 2081ce2..d14443f 100644
--- a/src/nouveau_dri2.c
+++ b/src/nouveau_dri2.c
@@ -428,11 +428,17 @@ nouveau_dri2_init(ScreenPtr pScreen)
 	ScrnInfoPtr pScrn = xf86Screens[pScreen->myNum];
 	NVPtr pNv = NVPTR(pScrn);
 	DRI2InfoRec dri2 = { 0 };
+	const char *drivernames[2][2] = {
+		{ "nouveau", "nouveau" },
+		{ "nouveau_vieux", "nouveau_vieux" }
+	};
 
 	if (pNv->Architecture >= NV_ARCH_30)
-		dri2.driverName = "nouveau";
+		dri2.driverNames = drivernames[0];
 	else
-		dri2.driverName = "nouveau_vieux";
+		dri2.driverNames = drivernames[1];
+	dri2.numDrivers = 2;
+	dri2.driverName = dri2.driverNames[0];
 
 	dri2.fd = nouveau_device(pNv->dev)->fd;
 	dri2.deviceName = pNv->drm_device_name;

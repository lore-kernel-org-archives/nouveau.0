From: Maarten Lankhorst <m.b.lankhorst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] nouveau: Add driver entry for vdpau
Date: Tue, 16 Aug 2011 22:19:56 +0200
Message-ID: <4E4AD0EC.4030102@gmail.com>
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

Signed-off-by: Maarten Lankhorst <m.b.lankhorst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
diff --git a/src/nouveau_dri2.c b/src/nouveau_dri2.c
index 1a68ed3..e5dfce0 100644
--- a/src/nouveau_dri2.c
+++ b/src/nouveau_dri2.c
@@ -429,12 +429,18 @@ nouveau_dri2_init(ScreenPtr pScreen)
 	ScrnInfoPtr pScrn = xf86Screens[pScreen->myNum];
 	NVPtr pNv = NVPTR(pScrn);
 	DRI2InfoRec dri2 = { 0 };
+	const char *drivernames[2] = { };
 
-	if (pNv->Architecture >= NV_ARCH_30)
-		dri2.driverName = "nouveau";
-	else
-		dri2.driverName = "nouveau_vieux";
+	if (pNv->Architecture >= NV_ARCH_30) {
+		drivernames[0] = "nouveau";
+		drivernames[1] = "nouveau";
+		dri2.numDrivers = 2;
+	} else {
+		drivernames[0] = "nouveau_vieux";
+		dri2.numDrivers = 1;
+	}
 
+	dri2.driverNames = drivernames;
 	dri2.fd = nouveau_device(pNv->dev)->fd;
 	dri2.deviceName = pNv->drm_device_name;

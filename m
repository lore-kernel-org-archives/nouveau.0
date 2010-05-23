From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] nouveau: detect incompatible libglx.so
Date: Sun, 23 May 2010 21:49:16 +0200
Message-ID: <20100523194916.GB15846@joi.lan>
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
List-Id: nouveau.vger.kernel.org

Exit with proper message instead of crashing when user forgot
to uninstall the proprietary driver.

Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 src/nv_driver.c |   35 +++++++++++++++++++++++++++++++++++
 1 files changed, 35 insertions(+), 0 deletions(-)

diff --git a/src/nv_driver.c b/src/nv_driver.c
index f60b6d9..2c953da 100644
--- a/src/nv_driver.c
+++ b/src/nv_driver.c
@@ -194,6 +194,38 @@ NVIdentify(int flags)
     }
 }
 
+static Bool glxIsCompatible()
+{
+	XF86ModuleData *d = LoaderSymbol("glxModuleData");
+
+	if (!d) {
+		xf86DrvMsg(-1, X_INFO,
+			"NOUVEAU: Couldn't find glx module informations. "
+			"Assuming it is disabled.\n");
+		return TRUE;
+	}
+
+	if (!d->vers) {
+		xf86DrvMsg(-1, X_ERROR,
+			"NOUVEAU: glx module has no version information!\n");
+		return FALSE;
+	}
+
+	if (!d->vers->vendor) {
+		xf86DrvMsg(-1, X_ERROR,
+			"NOUVEAU: glx module has no vendor information!\n");
+		return FALSE;
+	}
+
+	Bool ok = strcmp(d->vers->vendor, MODULEVENDORSTRING) == 0;
+	if (!ok)
+		xf86DrvMsg(-1, X_ERROR,
+			"NOUVEAU: glx module comes from incompatible vendor: \"%s\"\n",
+			d->vers->vendor);
+
+	return ok;
+}
+
 static Bool
 NVPciProbe(DriverPtr drv, int entity_num, struct pci_device *pci_dev,
 	   intptr_t match_data)
@@ -209,6 +241,9 @@ NVPciProbe(DriverPtr drv, int entity_num, struct pci_device *pci_dev,
 	int chipset, ret;
 	char *busid;
 
+	if (!glxIsCompatible())
+		return FALSE;
+
 	if (!xf86LoaderCheckSymbol("DRICreatePCIBusID")) {
 		xf86DrvMsg(-1, X_ERROR, "[drm] No DRICreatePCIBusID symbol\n");
 		return FALSE;
-- 
1.7.1

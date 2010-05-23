From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] nv: improve KMS detection
Date: Sun, 23 May 2010 21:46:45 +0200
Message-ID: <20100523194645.GA15846@joi.lan>
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
To: Aaron Plattner <aplattner-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Christopher James Halse Rogers <raof-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

1) DRICreatePCIBusID belongs to xserver dri module, so when it's
   unavailable we can't format string for drmCheckModesettingSupported.
   (This situation happened to me with KMS enabled and dri module moved
   somewhere else by Gentoo's "eselect opengl set nvidia" switcher)
   Open code DRICreatePCIBusID to drop dri dependency.
2) Once we dropped dependency on dri module (which linked to libdrm),
   we have to link directly to libdrm.

Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 src/Makefile.am |    2 +-
 src/nv_driver.c |   11 +++--------
 2 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/src/Makefile.am b/src/Makefile.am
index 5d57010..8b23e21 100644
--- a/src/Makefile.am
+++ b/src/Makefile.am
@@ -25,7 +25,7 @@
 # TODO: -nostdlib/-Bstatic/-lgcc platform magic, not installing the .a, etc.
 AM_CFLAGS = @XMODES_CFLAGS@ @XORG_CFLAGS@ $(LIBDRM_CFLAGS)
 nv_drv_la_LTLIBRARIES = nv_drv.la
-nv_drv_la_LDFLAGS = -module -avoid-version
+nv_drv_la_LDFLAGS = -module -avoid-version $(LIBDRM_LIBS)
 nv_drv_ladir = @moduledir@/drivers
 
 nv_drv_la_SOURCES = $(nv_sources) $(riva_sources) $(g80_sources)
diff --git a/src/nv_driver.c b/src/nv_driver.c
index e10ae0c..6651cd4 100644
--- a/src/nv_driver.c
+++ b/src/nv_driver.c
@@ -836,18 +836,13 @@ NVIsSupported(CARD32 id)
 }
 
 #ifdef HAVE_KMS
-static Bool NVKernelModesettingEnabled(struct pci_device *device)
+static Bool NVKernelModesettingEnabled(struct pci_device *dev)
 {
-    char *busIdString;
+    char busIdString[20];
     int ret;
 
-    if (!xf86LoaderCheckSymbol("DRICreatePCIBusID"))
-        return FALSE;
-
-    busIdString = DRICreatePCIBusID(device);
-
+    snprintf(busIdString, 20, "pci:%04x:%02x:%02x.%d", dev->domain, dev->bus, dev->dev, dev->func);
     ret = drmCheckModesettingSupported(busIdString);
-    xfree(busIdString);
 
     return (ret == 0);
 }
-- 
1.7.1

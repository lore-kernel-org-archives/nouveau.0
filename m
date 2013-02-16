From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/7] nouveau: stop using dri1 function
	DRICreatePCIBusID
Date: Sat, 16 Feb 2013 20:48:42 +0000
Message-ID: <1361047727-740-3-git-send-email-emil.l.velikov@gmail.com>
References: <1361047727-740-1-git-send-email-emil.l.velikov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1361047727-740-1-git-send-email-emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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

Step 1 to completely rip out dri1 out of nouveau

Signed-off-by: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 src/nv_driver.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/src/nv_driver.c b/src/nv_driver.c
index b1410f5..2b2f698 100644
--- a/src/nv_driver.c
+++ b/src/nv_driver.c
@@ -254,11 +254,13 @@ NVHasKMS(struct pci_device *pci_dev)
 	char *busid;
 	int chipset, ret;
 
-	if (!xf86LoaderCheckSymbol("DRICreatePCIBusID")) {
-		xf86DrvMsg(-1, X_ERROR, "[drm] No DRICreatePCIBusID symbol\n");
-		return FALSE;
-	}
-	busid = DRICreatePCIBusID(pci_dev);
+#if XORG_VERSION_CURRENT >= XORG_VERSION_NUMERIC(1,9,99,901,0)
+	XNFasprintf(&busid, "pci:%04x:%02x:%02x.%d",
+		    pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func);
+#else
+	busid = XNFprintf("pci:%04x:%02x:%02x.%d",
+			  pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func);
+#endif
 
 	ret = nouveau_device_open(busid, &dev);
 	if (ret) {
-- 
1.8.1.3

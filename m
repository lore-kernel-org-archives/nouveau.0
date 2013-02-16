From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/7] nouveau: Check if the device supports
	modesetting, after opening it
Date: Sat, 16 Feb 2013 20:48:41 +0000
Message-ID: <1361047727-740-2-git-send-email-emil.l.velikov@gmail.com>
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

"Regression" caused by
commit e34cfbd5bd23f7f15372af52d8a39a5715ce7310
Author: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Date:   Fri Nov 2 03:57:41 2012 +0000

    nouveau: Factor out common code to NVHasKMS()

    As the name suggests checks if it has kernel mode setting,
    prints out the interface version and checkes if the chipset
    is supported

    Function is used in NVPciProbe and NVPlatformProbe

Without this change X will fail with '[drm] KMS not enabled' if
the kernel module is not loaded

Bugzilla: https://bugs.freedesktop.org/show_bug.cgi?id=60772
Signed-off-by: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 src/nv_driver.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/src/nv_driver.c b/src/nv_driver.c
index 9f62fe2..b1410f5 100644
--- a/src/nv_driver.c
+++ b/src/nv_driver.c
@@ -260,17 +260,10 @@ NVHasKMS(struct pci_device *pci_dev)
 	}
 	busid = DRICreatePCIBusID(pci_dev);
 
-	ret = drmCheckModesettingSupported(busid);
-	if (ret) {
-		xf86DrvMsg(-1, X_ERROR, "[drm] KMS not enabled\n");
-		free(busid);
-		return FALSE;
-	}
-
 	ret = nouveau_device_open(busid, &dev);
-	free(busid);
 	if (ret) {
 		xf86DrvMsg(-1, X_ERROR, "[drm] failed to open device\n");
+		free(busid);
 		return FALSE;
 	}
 
@@ -288,6 +281,12 @@ NVHasKMS(struct pci_device *pci_dev)
 	chipset = dev->chipset;
 	nouveau_device_del(&dev);
 
+	ret = drmCheckModesettingSupported(busid);
+	free(busid);
+	if (ret) {
+		xf86DrvMsg(-1, X_ERROR, "[drm] KMS not enabled\n");
+		return FALSE;
+	}
 
 	switch (chipset & 0xf0) {
 	case 0x00:
-- 
1.8.1.3

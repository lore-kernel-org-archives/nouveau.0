From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: [PATCH 2/2] drm/nouveau: unify nouveau_acpi.c code with
	the driver style
Date: Sun, 20 Sep 2009 12:28:28 +0300
Message-ID: <1253438908-8123-2-git-send-email-pq@iki.fi>
References: <1253438908-8123-1-git-send-email-pq@iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1253438908-8123-1-git-send-email-pq-X3B1VOXEql0@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Rename nvidia_dsm() to nouveau_dsm(), since everything else here is
nouveau-something. Otherwise it might get mixed up with other nvidia
drivers.

Use NV_ERROR() for the usual error report format. "nvidia-control" was
very confusing when I first saw it in logs, I thought it was from a
proprietary driver.

To be able to use NV_ERROR(), pass struct drm_device * as argument to
nouveau_dsm() instead of struct pci_dev *. Also, 'dev' in nouveau code
is usually a drm_device and pdev is a pci_dev, so fix that too.

Signed-off-by: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_acpi.c |   32 +++++++++++++++-----------------
 1 files changed, 15 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_acpi.c b/drivers/gpu/drm/nouveau/nouveau_acpi.c
index 7fb7a9f..ec0f2f3 100644
--- a/drivers/gpu/drm/nouveau/nouveau_acpi.c
+++ b/drivers/gpu/drm/nouveau/nouveau_acpi.c
@@ -28,13 +28,14 @@
 #define NOUVEAU_DSM_POWER_SPEED 0x01
 #define NOUVEAU_DSM_POWER_STAMINA 0x02
 
-static int nvidia_dsm(struct pci_dev *dev, int func, int arg, int *result)
+static int nouveau_dsm(struct drm_device *dev, int func, int arg, int *result)
 {
 	static char muid[] = {
 		0xA0, 0xA0, 0x95, 0x9D, 0x60, 0x00, 0x48, 0x4D,
 		0xB3, 0x4D, 0x7E, 0x5F, 0xEA, 0x12, 0x9F, 0xD4,
 	};
 
+	struct pci_dev *pdev = dev->pdev;
 	struct acpi_handle *handle;
 	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
 	struct acpi_object_list input;
@@ -42,7 +43,7 @@ static int nvidia_dsm(struct pci_dev *dev, int func, int arg, int *result)
 	union acpi_object *obj;
 	int err;
 
-	handle = DEVICE_ACPI_HANDLE(&dev->dev);
+	handle = DEVICE_ACPI_HANDLE(&pdev->dev);
 
 	if (!handle)
 		return -ENODEV;
@@ -61,8 +62,7 @@ static int nvidia_dsm(struct pci_dev *dev, int func, int arg, int *result)
 
 	err = acpi_evaluate_object(handle, "_DSM", &input, &output);
 	if (err) {
-		printk(KERN_ERR "nvidia-control: failed to evaluate _DSM: %d\n",
-		       err);
+		NV_ERROR(dev, "failed to evaluate _DSM: %d\n", err);
 		return err;
 	}
 
@@ -88,24 +88,23 @@ static int nvidia_dsm(struct pci_dev *dev, int func, int arg, int *result)
 
 int nouveau_hybrid_setup(struct drm_device *dev)
 {
-	struct pci_dev *pdev = dev->pdev;
 	int result;
 
-	if (nvidia_dsm(pdev, NOUVEAU_DSM_ACTIVE, NOUVEAU_DSM_ACTIVE_QUERY,
-		       &result))
+	if (nouveau_dsm(dev, NOUVEAU_DSM_ACTIVE, NOUVEAU_DSM_ACTIVE_QUERY,
+								&result))
 		return -ENODEV;
 
 	NV_INFO(dev, "_DSM hardware status gave 0x%x\n", result);
 
 	if (result & 0x1) {	/* Stamina mode - disable the external GPU */
-		nvidia_dsm(pdev, NOUVEAU_DSM_LED, NOUVEAU_DSM_LED_STAMINA,
-			   NULL);
-		nvidia_dsm(pdev, NOUVEAU_DSM_POWER, NOUVEAU_DSM_POWER_STAMINA,
-			   NULL);
+		nouveau_dsm(dev, NOUVEAU_DSM_LED, NOUVEAU_DSM_LED_STAMINA,
+									NULL);
+		nouveau_dsm(dev, NOUVEAU_DSM_POWER, NOUVEAU_DSM_POWER_STAMINA,
+									NULL);
 	} else {		/* Ensure that the external GPU is enabled */
-		nvidia_dsm(pdev, NOUVEAU_DSM_LED, NOUVEAU_DSM_LED_SPEED, NULL);
-		nvidia_dsm(pdev, NOUVEAU_DSM_POWER, NOUVEAU_DSM_POWER_SPEED,
-			   NULL);
+		nouveau_dsm(dev, NOUVEAU_DSM_LED, NOUVEAU_DSM_LED_SPEED, NULL);
+		nouveau_dsm(dev, NOUVEAU_DSM_POWER, NOUVEAU_DSM_POWER_SPEED,
+									NULL);
 	}
 
 	return 0;
@@ -113,11 +112,10 @@ int nouveau_hybrid_setup(struct drm_device *dev)
 
 bool nouveau_dsm_probe(struct drm_device *dev)
 {
-	struct pci_dev *pdev = dev->pdev;
 	int support = 0;
 
-	if (nvidia_dsm(pdev, NOUVEAU_DSM_SUPPORTED,
-		       NOUVEAU_DSM_SUPPORTED_FUNCTIONS, &support))
+	if (nouveau_dsm(dev, NOUVEAU_DSM_SUPPORTED,
+				NOUVEAU_DSM_SUPPORTED_FUNCTIONS, &support))
 		return false;
 
 	if (!support)
-- 
1.6.3.3

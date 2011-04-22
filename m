From: Patrice Mandin <mandin.patrice-1tsiiZ//OF9QFI55V6+gNQ@public.gmane.org>
Subject: [PATCH] drm/nouveau: Allow using nouveau with 'acpi=off'
Date: Fri, 22 Apr 2011 17:28:33 +0200
Message-ID: <20110422172833.e9b78778.mandin.patrice@orange.fr>
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


Check if ACPI is disabled or not, before calling any kernel acpi function.
It avoids recompiling kernel without ACPI for people not wanting to use it, or for broken ACPI systems.

Signed-off-by: Patrice Mandin <patmandin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_acpi.c |   18 ++++++++++++++++++
 1 files changed, 18 insertions(+), 0 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_acpi.c b/drivers/gpu/drm/nouveau/nouveau_acpi.c
index a542380..418bd2c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_acpi.c
+++ b/drivers/gpu/drm/nouveau/nouveau_acpi.c
@@ -52,6 +52,9 @@ static int nouveau_dsm(acpi_handle handle, int func, int arg, uint32_t *result)
 	union acpi_object *obj;
 	int err;
 
+	if (acpi_disabled)
+		return -ENODEV;
+
 	input.count = 4;
 	input.pointer = params;
 	params[0].type = ACPI_TYPE_BUFFER;
@@ -155,6 +158,9 @@ static bool nouveau_dsm_pci_probe(struct pci_dev *pdev)
 	int ret;
 	uint32_t result;
 
+	if (acpi_disabled)
+		return false;
+
 	dhandle = DEVICE_ACPI_HANDLE(&pdev->dev);
 	if (!dhandle)
 		return false;
@@ -181,6 +187,9 @@ static bool nouveau_dsm_detect(void)
 	int has_dsm = 0;
 	int vga_count = 0;
 
+	if (acpi_disabled)
+		return false;
+
 	while ((pdev = pci_get_class(PCI_CLASS_DISPLAY_VGA << 8, pdev)) != NULL) {
 		vga_count++;
 
@@ -222,6 +231,9 @@ static int nouveau_rom_call(acpi_handle rom_handle, uint8_t *bios,
 	struct acpi_object_list rom_arg;
 	struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL};
 
+	if (acpi_disabled)
+		return -ENODEV;
+
 	rom_arg.count = 2;
 	rom_arg.pointer = &rom_arg_elements[0];
 
@@ -247,6 +259,9 @@ bool nouveau_acpi_rom_supported(struct pci_dev *pdev)
 	acpi_status status;
 	acpi_handle dhandle, rom_handle;
 
+	if (acpi_disabled)
+		return false;
+
 	if (!nouveau_dsm_priv.dsm_detected)
 		return false;
 
@@ -276,6 +291,9 @@ nouveau_acpi_edid(struct drm_device *dev, struct drm_connector *connector)
 	int type, ret;
 	void *edid;
 
+	if (acpi_disabled)
+		return -ENODEV;
+
 	switch (connector->connector_type) {
 	case DRM_MODE_CONNECTOR_LVDS:
 	case DRM_MODE_CONNECTOR_eDP:
-- 
1.7.4.4

-- 
Patrice Mandin
WWW: http://pmandin.atari.org/

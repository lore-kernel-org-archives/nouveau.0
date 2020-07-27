From: Daniel Dadap <ddadap-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/4] drm: retrieve EDID via ACPI _DDC method
Date: Mon, 27 Jul 2020 15:53:54 -0500
Message-ID: <20200727205357.27839-2-ddadap@nvidia.com>
References: <20200727205357.27839-1-ddadap@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <amd-gfx-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20200727205357.27839-1-ddadap-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:amd-gfx-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: amd-gfx-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "amd-gfx" <amd-gfx-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: dri-devel-PD4FTy7X32lNgt0PjOBp9/egYHeGw8Jk@public.gmane.org, intel-gfx-PD4FTy7X32lNgt0PjOBp9/egYHeGw8Jk@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, jani.nikula-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, joonas.lahtinen-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, rodrigo.vivi-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, alexander.deucher-5C7GfCeVMHo@public.gmane.org, christian.koenig-5C7GfCeVMHo@public.gmane.org, david1.zhou-5C7GfCeVMHo@public.gmane.org
Cc: Daniel Dadap <ddadap-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Some notebook computer systems expose the EDID for the internal
panel via the ACPI _DDC method. On some systems this is because
the panel does not populate the hardware DDC lines, and on some
systems with dynamic display muxes, _DDC is implemented to allow
the internal panel's EDID to be read at any time, regardless of
how the mux is switched.

The _DDC method can be implemented for each individual display
output, so there could be an arbitrary number of outputs exposing
their EDIDs via _DDC; however, in practice, this has only been
implemented so far on systems with a single panel, so the current
implementation of drm_get_edid_acpi() walks the outputs listed by
each GPU's ACPI _DOD method and returns the first EDID successfully
retrieved by any attached _DDC method. It may be necessary in the
future to allow for the retrieval of distinct EDIDs for different
output devices, but in order to do so, it will first be necessary
to develop a way to correlate individual DRM outputs with their
corresponding entities in ACPI.

Signed-off-by: Daniel Dadap <ddadap-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/drm_edid.c | 161 +++++++++++++++++++++++++++++++++++++
 include/drm/drm_edid.h     |   1 +
 2 files changed, 162 insertions(+)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 116451101426..f66d6bf048c6 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -34,6 +34,7 @@
 #include <linux/module.h>
 #include <linux/slab.h>
 #include <linux/vga_switcheroo.h>
+#include <linux/pci.h>
 
 #include <drm/drm_displayid.h>
 #include <drm/drm_drv.h>
@@ -2058,6 +2059,166 @@ struct edid *drm_get_edid_switcheroo(struct drm_connector *connector,
 }
 EXPORT_SYMBOL(drm_get_edid_switcheroo);
 
+#if defined(CONFIG_ACPI) && defined(CONFIG_PCI)
+static u64 *get_dod_entries(acpi_handle handle, int *count)
+{
+	acpi_status status;
+	struct acpi_buffer buf = { ACPI_ALLOCATE_BUFFER, NULL };
+	union acpi_object *dod;
+	int i;
+	u64 *ret = NULL;
+
+	*count = 0;
+
+	status = acpi_evaluate_object(handle, "_DOD", NULL, &buf);
+
+	if (ACPI_FAILURE(status))
+		return NULL;
+
+	dod = buf.pointer;
+
+	if (dod == NULL || dod->type != ACPI_TYPE_PACKAGE)
+		goto done;
+
+	ret = kmalloc_array(dod->package.count, sizeof(*ret), GFP_KERNEL);
+	if (ret == NULL)
+		goto done;
+
+	for (i = 0; i < dod->package.count; i++) {
+		if (dod->package.elements[i].type != ACPI_TYPE_INTEGER)
+			continue;
+		ret[*count] = dod->package.elements[i].integer.value;
+		(*count)++;
+	}
+
+done:
+	kfree(buf.pointer);
+	return ret;
+}
+
+static void *do_acpi_ddc(acpi_handle handle)
+{
+	int i;
+	void *ret = NULL;
+
+	/*
+	 * The _DDC spec defines an integer argument for specifying the size of
+	 * the EDID to be retrieved. A value of 1 requests a 128-byte EDID, and
+	 * a value of 2 requests a 256-byte EDID. Attempt the larger read first.
+	 */
+	for (i = 2; i >= 1; i--) {
+		struct acpi_buffer out = { ACPI_ALLOCATE_BUFFER, NULL };
+		union acpi_object arg = { ACPI_TYPE_INTEGER };
+		struct acpi_object_list in = { 1, &arg };
+		union acpi_object *edid;
+		acpi_status status;
+
+		arg.integer.value = i;
+		status = acpi_evaluate_object(handle, "_DDC", &in, &out);
+		edid = out.pointer;
+
+		if (ACPI_SUCCESS(status))
+			ret = edid->buffer.pointer;
+
+		kfree(edid);
+
+		if (ret)
+			break;
+	}
+
+	return ret;
+}
+
+static struct edid *first_edid_from_acpi_ddc(struct pci_dev *pdev)
+{
+	acpi_handle handle;
+	acpi_status status;
+	struct acpi_device *device = NULL;
+	struct edid *ret = NULL;
+	int num_dod_entries;
+	u64 *dod_entries = NULL;
+	struct list_head *node, *next;
+
+	handle = ACPI_HANDLE(&pdev->dev);
+	if (handle == NULL)
+		return NULL;
+
+	dod_entries = get_dod_entries(handle, &num_dod_entries);
+	if (dod_entries == NULL || num_dod_entries == 0)
+		goto done;
+
+	status = acpi_bus_get_device(handle, &device);
+	if (ACPI_FAILURE(status) || device == NULL)
+		goto done;
+
+	list_for_each_safe(node, next, &device->children) {
+		struct acpi_device *child;
+		u64 adr;
+		int i;
+
+		child = list_entry(node, struct acpi_device, node);
+		if (child == NULL)
+			continue;
+
+		status = acpi_evaluate_integer(child->handle, "_ADR", NULL,
+			&adr);
+		if (ACPI_FAILURE(status))
+			continue;
+
+		for (i = 0; i < num_dod_entries; i++) {
+			if (adr == dod_entries[i]) {
+				ret = do_acpi_ddc(child->handle);
+
+				if (ret != NULL)
+					goto done;
+			}
+		}
+	}
+done:
+	kfree(dod_entries);
+	return ret;
+}
+
+static struct edid *search_pci_class_for_acpi_ddc(unsigned int class)
+{
+	struct pci_dev *dev = NULL;
+
+	while ((dev = pci_get_class(class << 8, dev))) {
+		struct edid *edid = first_edid_from_acpi_ddc(dev);
+
+		if (edid)
+			return edid;
+	}
+
+	return NULL;
+}
+#endif
+
+/**
+ * drm_get_edid_acpi() - retrieve an EDID via the ACPI _DDC method
+ *
+ * Iterate over the ACPI namespace objects for all PCI VGA/3D controllers
+ * and attempt to evaluate any present _DDC method handles, returning the
+ * first successfully found EDID, or %NULL if none was found.
+ */
+struct edid *drm_get_edid_acpi(void)
+{
+#if defined(CONFIG_ACPI) && defined(CONFIG_PCI)
+	struct edid *edid;
+
+	edid = search_pci_class_for_acpi_ddc(PCI_CLASS_DISPLAY_VGA);
+	if (edid)
+		return edid;
+
+	edid = search_pci_class_for_acpi_ddc(PCI_CLASS_DISPLAY_3D);
+	if (edid)
+		return edid;
+#endif
+
+	return NULL;
+}
+EXPORT_SYMBOL(drm_get_edid_acpi);
+
 /**
  * drm_edid_duplicate - duplicate an EDID and the extensions
  * @edid: EDID to duplicate
diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
index 34b15e3d070c..ec2fe6d98560 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -485,6 +485,7 @@ struct edid *drm_get_edid(struct drm_connector *connector,
 			  struct i2c_adapter *adapter);
 struct edid *drm_get_edid_switcheroo(struct drm_connector *connector,
 				     struct i2c_adapter *adapter);
+struct edid *drm_get_edid_acpi(void);
 struct edid *drm_edid_duplicate(const struct edid *edid);
 int drm_add_edid_modes(struct drm_connector *connector, struct edid *edid);
 int drm_add_override_edid_modes(struct drm_connector *connector);
-- 
2.18.4

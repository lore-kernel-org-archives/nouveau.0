From: Karol Herbst <kherbst@redhat.com>
Subject: [RFC PATCH] pci: prevent putting pcie devices into lower device states on certain intel bridges
Date: Fri, 27 Sep 2019 16:44:21 +0200
Message-ID: <20190927144421.22608-1-kherbst@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Karol Herbst <kherbst@redhat.com>, Bjorn Helgaas <bhelgaas@google.com>, Lyude Paul <lyude@redhat.com>, linux-pci@vger.kernel.org, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

Fixes runpm breakage mainly on Nvidia GPUs as they are not able to resume.

Works perfectly with this workaround applied.

RFC comment:
We are quite sure that there is a higher amount of bridges affected by this,
but I was only testing it on my own machine for now.

I've stresstested runpm by doing 5000 runpm cycles with that patch applied
and never saw it fail.

I mainly wanted to get a discussion going on if that's a feasable workaround
indeed or if we need something better.

I am also sure, that the nouveau driver itself isn't at fault as I am able
to reproduce the same issue by poking into some PCI registers on the PCIe
bridge to put the GPU into D3cold as it's done in ACPI code.

I've written a little python script to reproduce this issue without the need
of loading nouveau:
https://raw.githubusercontent.com/karolherbst/pci-stub-runpm/master/nv_runpm_bug_test.py

Signed-off-by: Karol Herbst <kherbst@redhat.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: linux-pci@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
---
 drivers/pci/pci.c | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index 088fcdc8d2b4..9dbd29ced1ac 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -799,6 +799,42 @@ static inline bool platform_pci_bridge_d3(struct pci_dev *dev)
 	return pci_platform_pm ? pci_platform_pm->bridge_d3(dev) : false;
 }
 
+/*
+ * some intel bridges cause serious issues with runpm if the client device
+ * is put into D1/D2/D3hot before putting the client into D3cold via
+ * platform means (generally ACPI).
+ *
+ * skipping this makes runpm work perfectly fine on such devices.
+ *
+ * As far as we know only skylake and kaby lake SoCs are affected.
+ */
+static unsigned short intel_broken_d3_bridges[] = {
+	/* kbl */
+	0x1901,
+};
+
+static inline bool intel_broken_pci_pm(struct pci_bus *bus)
+{
+	struct pci_dev *bridge;
+	int i;
+
+	if (!bus || !bus->self)
+		return false;
+
+	bridge = bus->self;
+	if (bridge->vendor != PCI_VENDOR_ID_INTEL)
+		return false;
+
+	for (i = 0; i < ARRAY_SIZE(intel_broken_d3_bridges); i++) {
+		if (bridge->device == intel_broken_d3_bridges[i]) {
+			pci_err(bridge, "found broken intel bridge\n");
+			return true;
+		}
+	}
+
+	return false;
+}
+
 /**
  * pci_raw_set_power_state - Use PCI PM registers to set the power state of
  *			     given PCI device
@@ -827,6 +863,9 @@ static int pci_raw_set_power_state(struct pci_dev *dev, pci_power_t state)
 	if (state < PCI_D0 || state > PCI_D3hot)
 		return -EINVAL;
 
+	if (state != PCI_D0 && intel_broken_pci_pm(dev->bus))
+		return 0;
+
 	/*
 	 * Validate current state:
 	 * Can enter D0 from any state, but if we can only go deeper
-- 
2.21.0

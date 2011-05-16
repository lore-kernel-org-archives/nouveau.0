From: Marcin Slusarz <marcin.slusarz@gmail.com>
Subject: [PATCH v2 2/2] xorg/nouveau: blacklist all pre NV30 cards
Date: Tue, 17 May 2011 00:20:14 +0200
Message-ID: <20110516222014.GH5456@joi.lan>
References: <20110516195110.GB5456@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <20110516195110.GB5456@joi.lan>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/mesa-dev>
List-Post: <mailto:mesa-dev@lists.freedesktop.org>
List-Help: <mailto:mesa-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org
Errors-To: mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org
To: nouveau@lists.freedesktop.org
Cc: mesa-dev@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

Bail out early in probe, so other driver can take control of the card.
Doing it in screen_create would be too late.
---
 src/gallium/targets/xorg-nouveau/nouveau_xorg.c |   44 ++++++++++++++++++-----
 1 files changed, 35 insertions(+), 9 deletions(-)

diff --git a/src/gallium/targets/xorg-nouveau/nouveau_xorg.c b/src/gallium/targets/xorg-nouveau/nouveau_xorg.c
index a25254a..5392e50 100644
--- a/src/gallium/targets/xorg-nouveau/nouveau_xorg.c
+++ b/src/gallium/targets/xorg-nouveau/nouveau_xorg.c
@@ -38,16 +38,9 @@ static Bool nouveau_xorg_pci_probe(DriverPtr driver, int entity_num,
 static const struct pci_id_match nouveau_xorg_device_match[] = {
     { 0x10de, PCI_MATCH_ANY, PCI_MATCH_ANY, PCI_MATCH_ANY,
       0x00030000, 0x00ffffff, 0 },
-    { 0x12d2, PCI_MATCH_ANY, PCI_MATCH_ANY, PCI_MATCH_ANY,
-      0x00030000, 0x00ffffff, 0 },
     {0, 0, 0},
 };
 
-static SymTabRec nouveau_xorg_chipsets[] = {
-    {PCI_MATCH_ANY, "NVIDIA Graphics Device"},
-    {-1, NULL}
-};
-
 static PciChipsets nouveau_xorg_pci_devices[] = {
     {PCI_MATCH_ANY, PCI_MATCH_ANY, NULL},
     {-1, -1, NULL}
@@ -121,16 +114,49 @@ nouveau_xorg_setup(pointer module, pointer opts, int *errmaj, int *errmin)
 static void
 nouveau_xorg_identify(int flags)
 {
-    xf86PrintChipsets("nouveau2", "Driver for Modesetting Kernel Drivers",
-		      nouveau_xorg_chipsets);
+    xf86DrvMsg(0, X_INFO, "nouveau2: Gallium3D based 2D driver for NV30+ NVIDIA chipsets\n");
 }
 
+struct pcirange {
+	unsigned int low;
+	unsigned int high;
+};
+
+/* List of cards we DO NOT SUPPORT. */
+static struct pcirange NVPreNV30Chipsets[] =
+{
+  {0x0020, 0x002F}, /* NV04/05 */
+  {0x00A0, 0x00AF}, /* ? */
+  {0x0100, 0x010F}, /* NV10 */
+  {0x0110, 0x011F}, /* NV11 */
+  {0x01A0, 0x01AF}, /* NV1A */
+  {0x0150, 0x015F}, /* NV15 */
+  {0x0170, 0x017F}, /* NV17 */
+  {0x0180, 0x018F}, /* NV18 */
+  {0x01F0, 0x01FF}, /* NV1F */
+  {0x0200, 0x020F}, /* NV20 */
+  {0x02A0, 0x02AF}, /* NV2A */
+  {0x0250, 0x025F}, /* NV25 */
+  {0x0280, 0x028F}, /* NV28 */
+  {0, 0}
+};
+
+
 static Bool
 nouveau_xorg_pci_probe(DriverPtr driver,
 	  int entity_num, struct pci_device *device, intptr_t match_data)
 {
     ScrnInfoPtr scrn = NULL;
     EntityInfoPtr entity;
+    struct pcirange *cur;
+
+    if (device->vendor_id != 0x10DE)
+	return FALSE;
+
+    for (cur = &NVPreNV30Chipsets[0]; cur->low != 0; cur++) {
+	if (device->device_id >= cur->low && device->device_id <= cur->high)
+	    return FALSE;
+    }
 
     scrn = xf86ConfigPciEntity(scrn, 0, entity_num, nouveau_xorg_pci_devices,
 			       NULL, NULL, NULL, NULL, NULL);
-- 
1.7.4.1

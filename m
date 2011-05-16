From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/2] xorg/nouveau: blacklist all pre NV30 cards
Date: Mon, 16 May 2011 21:51:10 +0200
Message-ID: <20110516195110.GB5456@joi.lan>
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
Cc: mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Bail out early in probe, so other driver can take control of the card.
Doing it in screen_create would be too late.

PCIID list taken from xf86-video-nv, so it's probably complete.
---
 src/gallium/targets/xorg-nouveau/nouveau_xorg.c |  100 +++++++++++++++++++++--
 1 files changed, 93 insertions(+), 7 deletions(-)

diff --git a/src/gallium/targets/xorg-nouveau/nouveau_xorg.c b/src/gallium/targets/xorg-nouveau/nouveau_xorg.c
index a25254a..6d3b8f2 100644
--- a/src/gallium/targets/xorg-nouveau/nouveau_xorg.c
+++ b/src/gallium/targets/xorg-nouveau/nouveau_xorg.c
@@ -43,11 +43,6 @@ static const struct pci_id_match nouveau_xorg_device_match[] = {
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
@@ -121,16 +116,107 @@ nouveau_xorg_setup(pointer module, pointer opts, int *errmaj, int *errmin)
 static void
 nouveau_xorg_identify(int flags)
 {
-    xf86PrintChipsets("nouveau2", "Driver for Modesetting Kernel Drivers",
-		      nouveau_xorg_chipsets);
+    xf86DrvMsg(0, X_INFO, "nouveau2: Gallium3D based 2D driver for NV30+ NVIDIA chipsets\n");
 }
 
+/* List of cards we DO NOT SUPPORT. */
+static SymTabRec NVPreNV30Chipsets[] =
+{
+  { 0x12D20018, "RIVA 128" },
+
+  { 0x10DE0020, "RIVA TNT" },
+
+  { 0x10DE0028, "RIVA TNT2" },
+  { 0x10DE002A, "Unknown TNT2" },
+  { 0x10DE002C, "Vanta" },
+  { 0x10DE0029, "RIVA TNT2 Ultra" },
+  { 0x10DE002D, "RIVA TNT2 Model 64" },
+
+  { 0x10DE00A0, "Aladdin TNT2" },
+
+  { 0x10DE0100, "GeForce 256" },
+  { 0x10DE0101, "GeForce DDR" },
+  { 0x10DE0103, "Quadro" },
+
+  { 0x10DE0110, "GeForce2 MX/MX 400" },
+  { 0x10DE0111, "GeForce2 MX 100/200" },
+  { 0x10DE0112, "GeForce2 Go" },
+  { 0x10DE0113, "Quadro2 MXR/EX/Go" },
+
+  { 0x10DE01A0, "GeForce2 Integrated GPU" },
+
+  { 0x10DE0150, "GeForce2 GTS" },
+  { 0x10DE0151, "GeForce2 Ti" },
+  { 0x10DE0152, "GeForce2 Ultra" },
+  { 0x10DE0153, "Quadro2 Pro" },
+
+  { 0x10DE0170, "GeForce4 MX 460" },
+  { 0x10DE0171, "GeForce4 MX 440" },
+  { 0x10DE0172, "GeForce4 MX 420" },
+  { 0x10DE0173, "GeForce4 MX 440-SE" },
+  { 0x10DE0174, "GeForce4 440 Go" },
+  { 0x10DE0175, "GeForce4 420 Go" },
+  { 0x10DE0176, "GeForce4 420 Go 32M" },
+  { 0x10DE0177, "GeForce4 460 Go" },
+  { 0x10DE0178, "Quadro4 550 XGL" },
+  { 0x10DE0179, "GeForce4 MX (Mac) / 440 Go 64M" },
+  { 0x10DE017A, "Quadro NVS" },
+  { 0x10DE017C, "Quadro4 500 GoGL" },
+  { 0x10DE017D, "GeForce4 410 Go 16M" },
+
+  { 0x10DE0181, "GeForce4 MX 440 with AGP8X" },
+  { 0x10DE0182, "GeForce4 MX 440SE with AGP8X" },
+  { 0x10DE0183, "GeForce4 MX 420 with AGP8X" },
+  { 0x10DE0185, "GeForce4 MX 4000" },
+  { 0x10DE0186, "GeForce4 448 Go" },
+  { 0x10DE0187, "GeForce4 488 Go" },
+  { 0x10DE0188, "Quadro4 580 XGL" },
+  { 0x10DE0189, "GeForce4 MX with AGP8X (Mac)" },
+  { 0x10DE018A, "Quadro4 NVS 280 SD" },
+  { 0x10DE018B, "Quadro4 380 XGL" },
+  { 0x10DE018C, "Quadro NVS 50 PCI" },
+  { 0x10DE018D, "GeForce4 448 Go" },
+
+  { 0x10DE01F0, "GeForce4 MX Integrated GPU" },
+
+  { 0x10DE0200, "GeForce3" },
+  { 0x10DE0201, "GeForce3 Ti 200" },
+  { 0x10DE0202, "GeForce3 Ti 500" },
+  { 0x10DE0203, "Quadro DCC" },
+
+  { 0x10DE0250, "GeForce4 Ti 4600" },
+  { 0x10DE0251, "GeForce4 Ti 4400" },
+  { 0x10DE0253, "GeForce4 Ti 4200" },
+  { 0x10DE0258, "Quadro4 900 XGL" },
+  { 0x10DE0259, "Quadro4 750 XGL" },
+  { 0x10DE025B, "Quadro4 700 XGL" },
+
+  { 0x10DE0280, "GeForce4 Ti 4800" },
+  { 0x10DE0281, "GeForce4 Ti 4200 with AGP8X" },
+  { 0x10DE0282, "GeForce4 Ti 4800 SE" },
+  { 0x10DE0286, "GeForce4 4200 Go" },
+  { 0x10DE028C, "Quadro4 700 GoGL" },
+  { 0x10DE0288, "Quadro4 980 XGL" },
+  { 0x10DE0289, "Quadro4 780 XGL" },
+
+  {-1, NULL}
+};
+
+
 static Bool
 nouveau_xorg_pci_probe(DriverPtr driver,
 	  int entity_num, struct pci_device *device, intptr_t match_data)
 {
     ScrnInfoPtr scrn = NULL;
     EntityInfoPtr entity;
+    SymTabRec *cur;
+
+    int pciid = device->vendor_id << 16 | device->device_id;
+
+    for (cur = &NVPreNV30Chipsets[0]; cur->token != -1; cur++) {
+	if (cur->token == pciid)
+	    return FALSE;
+    }
 
     scrn = xf86ConfigPciEntity(scrn, 0, entity_num, nouveau_xorg_pci_devices,
 			       NULL, NULL, NULL, NULL, NULL);
-- 
1.7.4.1

From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] drm/nouveau: consider CLASS_DISPLAY_3D devices
	while detecting dsm/optimus
Date: Wed,  9 Oct 2013 08:25:16 +0100
Message-ID: <1381303516-27030-1-git-send-email-emil.l.velikov@gmail.com>
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

The present code assumes that optimus is present whenever two
VGA (PCI_CLASS_DISPLAY_VGA) devices are present. This does not
seem to be the case of newer laptops with optimus, in which
case the nvidia gpu is a PCI_CLASS_DISPLAY_3D device.

Rework the logic so that we count both VGA and 3D devices,
when contemplating if optimus is present on the platform.

Bugzilla: https://bugs.freedesktop.org/show_bug.cgi?id=70208
Signed-off-by: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---

Ideally we would not need to iterate though the pci devices
twice. Although currently we have to do that as there is no 
function that can takes a mask for the class(s) we're looking
for. Additionally the base function pci_get_dev_by_id()
from drivers/pci is not accessible (not exported), thus we
cannot easily make a function that does that for us.

Cheers
Emil
---
 drivers/gpu/drm/nouveau/nouveau_acpi.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_acpi.c b/drivers/gpu/drm/nouveau/nouveau_acpi.c
index d97f200..646d4e3 100644
--- a/drivers/gpu/drm/nouveau/nouveau_acpi.c
+++ b/drivers/gpu/drm/nouveau/nouveau_acpi.c
@@ -289,6 +289,16 @@ static bool nouveau_dsm_detect(void)
 			has_optimus = 1;
 	}
 
+	while ((pdev = pci_get_class(PCI_CLASS_DISPLAY_3D << 8, pdev)) != NULL) {
+		vga_count++;
+
+		retval = nouveau_dsm_pci_probe(pdev);
+		if (retval & NOUVEAU_DSM_HAS_MUX)
+			has_dsm |= 1;
+		if (retval & NOUVEAU_DSM_HAS_OPT)
+			has_optimus = 1;
+	}
+
 	/* find the optimus DSM or the old v1 DSM */
 	if (has_optimus == 1) {
 		acpi_get_name(nouveau_dsm_priv.dhandle, ACPI_FULL_PATHNAME,
-- 
1.8.4

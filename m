From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: [PATCH] drm/nouveau/agp: add a quirk list to limit agp modes
Date: Sun, 27 Oct 2013 11:54:09 -0400
Message-ID: <1382889249-6822-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Ben Skeggs <bskeggs@redhat.com>
Cc: Jason Detring <detringj@gmail.com>, nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

Certain combinations of hardware can't actually support the maximum
detected speed. Add a quirk list that lists pairs of hostbridge/chip pci
ids and the mode that they should work with.

See https://bugs.freedesktop.org/show_bug.cgi?id=20341

Reported-by: Jason Detring <detringj@gmail.com>
Signed-off-by: Ilia Mirkin <imirkin@alum.mit.edu>
---

I didn't go as far as subdevice matching... IMO that's overkill for now.

 drivers/gpu/drm/nouveau/nouveau_agp.c | 44 +++++++++++++++++++++++++++++++----
 1 file changed, 39 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_agp.c b/drivers/gpu/drm/nouveau/nouveau_agp.c
index 6e7a55f..2953c4e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_agp.c
+++ b/drivers/gpu/drm/nouveau/nouveau_agp.c
@@ -11,10 +11,28 @@ MODULE_PARM_DESC(agpmode, "AGP mode (0 to disable AGP)");
 static int nouveau_agpmode = -1;
 module_param_named(agpmode, nouveau_agpmode, int, 0400);
 
+struct nouveau_agpmode_quirk {
+	u16 hostbridge_vendor;
+	u16 hostbridge_device;
+	u16 chip_vendor;
+	u16 chip_device;
+	int mode;
+};
+
+static struct nouveau_agpmode_quirk nouveau_agpmode_quirk_list[] = {
+	/* VIA Apollo PRO133x / GeForce FX 5600 Ultra, max agpmode 2, fdo #20341 */
+	{ PCI_VENDOR_ID_VIA, 0x0691, PCI_VENDOR_ID_NVIDIA, 0x0311, 2 },
+
+	{},
+};
+
 static unsigned long
-get_agp_mode(struct nouveau_drm *drm, unsigned long mode)
+get_agp_mode(struct nouveau_drm *drm, const struct drm_agp_info *info)
 {
 	struct nouveau_device *device = nv_device(drm->device);
+	struct nouveau_agpmode_quirk *quirk = nouveau_agpmode_quirk_list;
+	int agpmode = nouveau_agpmode;
+	unsigned long mode = info->mode;
 
 	/*
 	 * FW seems to be broken on nv18, it makes the card lock up
@@ -24,11 +42,27 @@ get_agp_mode(struct nouveau_drm *drm, unsigned long mode)
 		mode &= ~PCI_AGP_COMMAND_FW;
 
 	/*
+	 * Go through the quirks list and adjust the agpmode accordingly.
+	 */
+	while (agpmode == -1 && quirk->hostbridge_vendor) {
+		if (info->id_vendor == quirk->hostbridge_vendor &&
+		    info->id_device == quirk->hostbridge_device &&
+		    device->pdev->vendor == quirk->chip_vendor &&
+		    device->pdev->device == quirk->chip_device) {
+			agpmode = quirk->mode;
+			nv_info(device, "Forcing agp mode to %dX. Use agpmode to override.\n",
+				agpmode);
+			break;
+		}
+		++quirk;
+	}
+
+	/*
 	 * AGP mode set in the command line.
 	 */
-	if (nouveau_agpmode > 0) {
+	if (agpmode > 0) {
 		bool agpv3 = mode & 0x8;
-		int rate = agpv3 ? nouveau_agpmode / 4 : nouveau_agpmode;
+		int rate = agpv3 ? agpmode / 4 : agpmode;
 
 		mode = (mode & ~0x7) | (rate & 0x7);
 	}
@@ -90,7 +124,7 @@ nouveau_agp_reset(struct nouveau_drm *drm)
 		if (ret)
 			return;
 
-		mode.mode  = get_agp_mode(drm, info.mode);
+		mode.mode  = get_agp_mode(drm, &info);
 		mode.mode &= ~PCI_AGP_COMMAND_FW;
 
 		ret = drm_agp_enable(dev, mode);
@@ -139,7 +173,7 @@ nouveau_agp_init(struct nouveau_drm *drm)
 	}
 
 	/* see agp.h for the AGPSTAT_* modes available */
-	mode.mode = get_agp_mode(drm, info.mode);
+	mode.mode = get_agp_mode(drm, &info);
 
 	ret = drm_agp_enable(dev, mode);
 	if (ret) {
-- 
1.8.1.5

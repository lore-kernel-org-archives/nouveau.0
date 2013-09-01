From: Roy Spliet <r.spliet-oe7qfRrRQfeEZXFvZSAUrfP6llvjuJOh@public.gmane.org>
Subject: [PATCH] drm/nv50: Fix backlight not working when PWM_DIV
	is uninitialised
Date: Sun,  1 Sep 2013 17:20:21 +0200
Message-ID: <1378048821-10556-1-git-send-email-r.spliet@student.tudelft.nl>
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
To: Nouveau Mailinglist <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Roy Spliet <r.spliet-oe7qfRrRQfeEZXFvZSAUrfP6llvjuJOh@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Known issues before merge:
- Currently requires acpi_backlight=vendor kernel param
- 0x5e always valid?

Signed-off-by: Roy Spliet <r.spliet-oe7qfRrRQfeEZXFvZSAUrfP6llvjuJOh@public.gmane.org>
Tested-by: Rick Hendricksen
---
 drivers/gpu/drm/nouveau/nouveau_backlight.c | 20 +++++++++++++++++---
 drivers/gpu/drm/nouveau/nouveau_display.c   |  4 ++++
 drivers/gpu/drm/nouveau/nouveau_display.h   |  7 +++++++
 3 files changed, 28 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_backlight.c b/drivers/gpu/drm/nouveau/nouveau_backlight.c
index 2ffad21..63f3f26 100644
--- a/drivers/gpu/drm/nouveau/nouveau_backlight.c
+++ b/drivers/gpu/drm/nouveau/nouveau_backlight.c
@@ -174,6 +174,23 @@ static const struct backlight_ops nva3_bl_ops = {
 	.update_status = nva3_set_intensity,
 };
 
+int
+nouveau_backlight_config(struct nouveau_drm *drm)
+{
+	struct backlight_device *bd = drm->backlight;
+	struct nouveau_encoder *nv_encoder = bl_get_data(bd);
+	struct nouveau_device *device = nv_device(drm->device);
+	int or = nv_encoder->or;
+
+	if (device->card_type == NV_50 &&
+	    (device->chipset <= 0xa0 ||
+	     device->chipset == 0xaa ||
+	     device->chipset == 0xac))
+		nv_wr32(device, NV50_PDISP_SOR_PWM_DIV(or), 0x5e);
+
+	return 0;
+}
+
 static int
 nv50_backlight_init(struct drm_connector *connector)
 {
@@ -191,9 +208,6 @@ nv50_backlight_init(struct drm_connector *connector)
 			return -ENODEV;
 	}
 
-	if (!nv_rd32(device, NV50_PDISP_SOR_PWM_CTL(nv_encoder->or)))
-		return 0;
-
 	if (device->chipset <= 0xa0 ||
 	    device->chipset == 0xaa ||
 	    device->chipset == 0xac)
diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
index e616124..08d5ff4 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.c
+++ b/drivers/gpu/drm/nouveau/nouveau_display.c
@@ -249,6 +249,10 @@ nouveau_display_init(struct drm_device *dev)
 		}
 	}
 
+	/* configure backlight params */
+	if(drm->backlight)
+		nouveau_backlight_config(drm);
+
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_display.h b/drivers/gpu/drm/nouveau/nouveau_display.h
index 1ea3e47..d4113be 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.h
+++ b/drivers/gpu/drm/nouveau/nouveau_display.h
@@ -75,6 +75,7 @@ void nouveau_hdmi_mode_set(struct drm_encoder *, struct drm_display_mode *);
 
 #ifdef CONFIG_DRM_NOUVEAU_BACKLIGHT
 extern int nouveau_backlight_init(struct drm_device *);
+extern int nouveau_backlight_config(struct nouveau_drm *);
 extern void nouveau_backlight_exit(struct drm_device *);
 #else
 static inline int
@@ -83,6 +84,12 @@ nouveau_backlight_init(struct drm_device *dev)
 	return 0;
 }
 
+static inline int
+nouveau_backlight_config(struct nouveau_drm *drm)
+{
+	return 0;
+}
+
 static inline void
 nouveau_backlight_exit(struct drm_device *dev) {
 }
-- 
1.8.3.1

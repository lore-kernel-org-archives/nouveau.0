From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 14/14] drm/nouveau/therm: Rework
	nouveau_therm_create()
Date: Mon, 21 May 2012 00:15:03 +0100
Message-ID: <1337555703-18925-15-git-send-email-emil.l.velikov@gmail.com>
References: <1337555703-18925-1-git-send-email-emil.l.velikov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1337555703-18925-1-git-send-email-emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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

It contains a few changes mainly targeting the following
 * Therm table is present in BIT vbios
 * Parse the vbios table before hooking temp_get(), as it contains the therm
sensor calibration data
 * Add dummy_therm_temp_get() function to prevent multiple null dereff's

Signed-off-by: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_pm.c    |    2 +-
 drivers/gpu/drm/nouveau/nouveau_therm.c |   63 ++++++++++++++++++++++++-------
 2 files changed, 50 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_pm.c b/drivers/gpu/drm/nouveau/nouveau_pm.c
index 9dd34fe..1b4422b 100644
--- a/drivers/gpu/drm/nouveau/nouveau_pm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_pm.c
@@ -693,7 +693,7 @@ nouveau_hwmon_init(struct nouveau_device *ndev)
 	}
 
 	/* if the card can read the fan rpm */
-	if (nouveau_gpio_func_valid(ndev, DCB_GPIO_FAN_SENSE)) {
+	if (pfan && pfan->sense(pfan) >= 0) {
 		ret = sysfs_create_group(&dev->pdev->dev.kobj,
 					 &hwmon_fan_rpm_attrgroup);
 		if (ret)
diff --git a/drivers/gpu/drm/nouveau/nouveau_therm.c b/drivers/gpu/drm/nouveau/nouveau_therm.c
index acf81a9..91095be 100644
--- a/drivers/gpu/drm/nouveau/nouveau_therm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_therm.c
@@ -30,6 +30,12 @@
 #include "nouveau_pm.h"
 #include "nouveau_therm.h"
 
+static inline int
+dummy_therm_temp_get(struct nouveau_therm *ptherm)
+{
+	return 0;
+}
+
 static int
 nv40_sensor_setup(struct nouveau_therm *ptherm)
 {
@@ -181,7 +187,7 @@ nouveau_therm_vbios_parse(struct nouveau_therm *ptherm, u8 *temp)
 	temp = temp + headerlen;
 
 	/* Read the entries from the table */
-	for (i = 0; i < entries; i++) {
+	for (i = 0; i < entries; i++, temp += recordlen) {
 		s16 value = ROM16(temp[1]);
 
 		switch (temp[0]) {
@@ -228,7 +234,6 @@ nouveau_therm_vbios_parse(struct nouveau_therm *ptherm, u8 *temp)
 			ptherm->fan.pwm_freq = value;
 			break;
 		}
-		temp += recordlen;
 	}
 
 	nouveau_therm_safety_checks(ptherm);
@@ -299,6 +304,12 @@ nouveau_therm_probe_i2c(struct nouveau_device *ndev)
 			     probe_monitoring_device, NV_I2C_DEFAULT(0));
 }
 
+static void
+nouveau_ptherm_destroy(struct nouveau_device *ndev, int subdev)
+{
+// XXX: Undo probe_monitoring_device
+}
+
 int
 nouveau_therm_create(struct nouveau_device *ndev, int subdev)
 {
@@ -307,29 +318,53 @@ nouveau_therm_create(struct nouveau_device *ndev, int subdev)
 	u8 *temp = NULL;
 	int ret;
 
-	ret = nouveau_subdev_create(ndev, subdev, "THERM", "thermal", &ptherm);
-	if (ret)
-		return ret;
+	if (bios->type == NVBIOS_BIT) {
+		if (bit_table(ndev, 'P', &P))
+			return 0;
 
-	if (ndev->chipset >= 0x40 && ndev->chipset < 0x84)
-		ptherm->temp_get = nv40_therm_temp_get;
-	else
-	if (ndev->chipset <= 0xd9)
-		ptherm->temp_get = nv84_therm_temp_get;
-
-	if (bit_table(ndev, 'P', &P) == 0) {
 		if (P.version == 1)
 			temp = ROMPTR(ndev, P.data[12]);
 		else
 		if (P.version == 2)
 			temp = ROMPTR(ndev, P.data[16]);
-		else
+		else {
 			NV_WARN(ndev, "unknown temp for BIT P %d\n", P.version);
+		}
+	} else {
+		return 0;
+	}
 
-		nouveau_therm_vbios_parse(ptherm, temp);
+	if (!temp) {
+		NV_DEBUG(ndev, "temp table pointer invalid\n");
+		return 0;
 	}
 
+	ret = nouveau_subdev_create(ndev, subdev, "THERM", "thermal", &ptherm);
+	if (ret)
+		return ret;
+
+	nouveau_therm_vbios_parse(ptherm, temp);
 	nouveau_therm_probe_i2c(ndev);
 
+	ptherm->base.destroy = nouveau_ptherm_destroy;
+	switch (ndev->card_type) {
+	case NV_40:
+	case NV_50:
+	case NV_C0:
+	case NV_D0:
+	case NV_E0:
+		if (ndev->chipset < 0x84) {
+			ptherm->temp_get = nv40_therm_temp_get;
+			break;
+		} else
+		if (ndev->chipset <= 0xd9) {
+			ptherm->temp_get = nv84_therm_temp_get;
+			break;
+		}
+	default:
+		ptherm->temp_get = dummy_therm_temp_get;
+		break;
+	}
+
 	return nouveau_subdev_init(ndev, subdev, ret);
 }
-- 
1.7.10.2

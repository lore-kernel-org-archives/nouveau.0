From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] drm/nouveau/temp: Fix signed/unsigned int logic
Date: Wed, 22 Jun 2011 02:13:23 +0100
Message-ID: <1308705203-5186-1-git-send-email-emil.l.velikov@gmail.com>
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

Many (all?) of the coefficients related to calculating the
correct temperature are signed integers

This patch correcly parses and stores those values
It also ensures that the default offset is 0 (previously 1)

Affected cards - the original nv50 and the nv40 family

Signed-off-by: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_drv.h  |    6 +++---
 drivers/gpu/drm/nouveau/nouveau_temp.c |    8 ++++----
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index 01a59e5..4aa76bb 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -470,9 +470,9 @@ struct nouveau_pm_level {
 struct nouveau_pm_temp_sensor_constants {
 	u16 offset_constant;
 	s16 offset_mult;
-	u16 offset_div;
-	u16 slope_mult;
-	u16 slope_div;
+	s16 offset_div;
+	s16 slope_mult;
+	s16 slope_div;
 };
 
 struct nouveau_pm_threshold_temp {
diff --git a/drivers/gpu/drm/nouveau/nouveau_temp.c b/drivers/gpu/drm/nouveau/nouveau_temp.c
index 649b041..47630fb 100644
--- a/drivers/gpu/drm/nouveau/nouveau_temp.c
+++ b/drivers/gpu/drm/nouveau/nouveau_temp.c
@@ -43,7 +43,7 @@ nouveau_temp_vbios_parse(struct drm_device *dev, u8 *temp)
 
 	/* Set the default sensor's contants */
 	sensor->offset_constant = 0;
-	sensor->offset_mult = 1;
+	sensor->offset_mult = 0;
 	sensor->offset_div = 1;
 	sensor->slope_mult = 1;
 	sensor->slope_div = 1;
@@ -109,7 +109,7 @@ nouveau_temp_vbios_parse(struct drm_device *dev, u8 *temp)
 
 	/* Read the entries from the table */
 	for (i = 0; i < entries; i++) {
-		u16 value = ROM16(temp[1]);
+		s16 value = ROM16(temp[1]);
 
 		switch (temp[0]) {
 		case 0x01:
@@ -160,8 +160,8 @@ nv40_sensor_setup(struct drm_device *dev)
 	struct drm_nouveau_private *dev_priv = dev->dev_private;
 	struct nouveau_pm_engine *pm = &dev_priv->engine.pm;
 	struct nouveau_pm_temp_sensor_constants *sensor = &pm->sensor_constants;
-	u32 offset = sensor->offset_mult / sensor->offset_div;
-	u32 sensor_calibration;
+	s32 offset = sensor->offset_mult / sensor->offset_div;
+	s32 sensor_calibration;
 
 	/* set up the sensors */
 	sensor_calibration = 120 - offset - sensor->offset_constant;
-- 
1.7.1

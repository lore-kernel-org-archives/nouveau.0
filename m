From: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
Subject: [PATCH] Associate memtimings with performance levels on
	cards <= nv98
Date: Tue, 12 Apr 2011 01:18:31 +0200
Message-ID: <1302563911-13975-1-git-send-email-martin.peres@free.fr>
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
Cc: Martin Peres <martin.peres-Iz16wY1oaNPLSKGbIzaifA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Signed-off-by: Martin Peres <martin.peres-Iz16wY1oaNPLSKGbIzaifA@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_drv.h  |   26 ++++++++++++++------------
 drivers/gpu/drm/nouveau/nouveau_mem.c  |    3 ++-
 drivers/gpu/drm/nouveau/nouveau_perf.c |   25 +++++++++++++++++++++++++
 drivers/gpu/drm/nouveau/nouveau_pm.c   |   14 +++++++++-----
 4 files changed, 50 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index 135d3b4..488eab7 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -409,6 +409,19 @@ struct nouveau_pm_voltage {
 	int nr_level;
 };
 
+struct nouveau_pm_memtiming {
+	int id;
+	u32 reg_100220;
+	u32 reg_100224;
+	u32 reg_100228;
+	u32 reg_10022c;
+	u32 reg_100230;
+	u32 reg_100234;
+	u32 reg_100238;
+	u32 reg_10023c;
+	u32 reg_100240;
+};
+
 #define NOUVEAU_PM_MAX_LEVEL 8
 struct nouveau_pm_level {
 	struct device_attribute dev_attr;
@@ -424,6 +437,7 @@ struct nouveau_pm_level {
 	u8 fanspeed;
 
 	u16 memscript;
+	struct nouveau_pm_memtiming *timing;
 };
 
 struct nouveau_pm_temp_sensor_constants {
@@ -440,18 +454,6 @@ struct nouveau_pm_threshold_temp {
 	s16 fan_boost;
 };
 
-struct nouveau_pm_memtiming {
-	u32 reg_100220;
-	u32 reg_100224;
-	u32 reg_100228;
-	u32 reg_10022c;
-	u32 reg_100230;
-	u32 reg_100234;
-	u32 reg_100238;
-	u32 reg_10023c;
-	u32 reg_100240;
-};
-
 struct nouveau_pm_memtimings {
 	bool supported;
 	struct nouveau_pm_memtiming *timing;
diff --git a/drivers/gpu/drm/nouveau/nouveau_mem.c b/drivers/gpu/drm/nouveau/nouveau_mem.c
index 9c7bc3f..847d476 100644
--- a/drivers/gpu/drm/nouveau/nouveau_mem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_mem.c
@@ -706,6 +706,7 @@ nouveau_mem_timing_init(struct drm_device *dev)
 
 			/* XXX: reg_100240? */
 		}
+		timing->id = i;
 
 		NV_DEBUG(dev, "Entry %d: 220: %08x %08x %08x %08x\n", i,
 			 timing->reg_100220, timing->reg_100224,
@@ -717,7 +718,7 @@ nouveau_mem_timing_init(struct drm_device *dev)
 	}
 
 	memtimings->nr_timing = entries;
-	memtimings->supported = true;
+	memtimings->supported = (dev_priv->chipset <= 0x98);
 }
 
 void
diff --git a/drivers/gpu/drm/nouveau/nouveau_perf.c b/drivers/gpu/drm/nouveau/nouveau_perf.c
index 670e3cb..904d680 100644
--- a/drivers/gpu/drm/nouveau/nouveau_perf.c
+++ b/drivers/gpu/drm/nouveau/nouveau_perf.c
@@ -82,6 +82,7 @@ nouveau_perf_init(struct drm_device *dev)
 	u8 version, headerlen, recordlen, entries;
 	u8 *perf, *entry;
 	int vid, i;
+	uint8_t timing_entry = (nv_rd32(dev, NV_PEXTDEV_BOOT_0) & 0x1c) >> 2;
 
 	if (bios->type == NVBIOS_BIT) {
 		if (bit_table(dev, 'P', &P))
@@ -124,6 +125,8 @@ nouveau_perf_init(struct drm_device *dev)
 	for (i = 0; i < entries; i++) {
 		struct nouveau_pm_level *perflvl = &pm->perflvl[pm->nr_perflvl];
 
+		perflvl->timing = NULL;
+
 		if (entry[0] == 0xff) {
 			entry += recordlen;
 			continue;
@@ -190,6 +193,28 @@ nouveau_perf_init(struct drm_device *dev)
 			}
 		}
 
+		/* get the corresponding memory timings */
+		if (pm->memtimings.supported) {
+			uint8_t timing_id = 0xff;
+
+			if (version > 0x15 && version < 0x40 &&
+				timing_entry < perf[4]) {
+				uint16_t extra_data;
+				extra_data = perf[3] + (timing_entry * perf[5]);
+
+				timing_id = entry[extra_data + 1];
+			} else if (version == 0x40 && timing_entry < perf[4]) {
+				uint16_t extra_data;
+				extra_data = perf[2] + (timing_entry * perf[3]);
+
+				timing_id = entry[extra_data + 1];
+			}
+
+			if (pm->memtimings.nr_timing > timing_id)
+				perflvl->timing =
+					&pm->memtimings.timing[timing_id];
+		}
+
 		snprintf(perflvl->name, sizeof(perflvl->name),
 			 "performance_level_%d", i);
 		perflvl->id = i;
diff --git a/drivers/gpu/drm/nouveau/nouveau_pm.c b/drivers/gpu/drm/nouveau/nouveau_pm.c
index 0b1caeb..4e51404 100644
--- a/drivers/gpu/drm/nouveau/nouveau_pm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_pm.c
@@ -156,7 +156,7 @@ nouveau_pm_perflvl_get(struct drm_device *dev, struct nouveau_pm_level *perflvl)
 static void
 nouveau_pm_perflvl_info(struct nouveau_pm_level *perflvl, char *ptr, int len)
 {
-	char c[16], s[16], v[16], f[16];
+	char c[16], s[16], v[16], f[16], t[16];
 
 	c[0] = '\0';
 	if (perflvl->core)
@@ -174,8 +174,12 @@ nouveau_pm_perflvl_info(struct nouveau_pm_level *perflvl, char *ptr, int len)
 	if (perflvl->fanspeed)
 		snprintf(f, sizeof(f), " fanspeed %d%%", perflvl->fanspeed);
 
-	snprintf(ptr, len, "memory %dMHz%s%s%s%s\n", perflvl->memory / 1000,
-		 c, s, v, f);
+	t[0] = '\0';
+	if (perflvl->timing)
+		snprintf(t, sizeof(t), " timing %d", perflvl->timing->id);
+
+	snprintf(ptr, len, "memory %dMHz%s%s%s%s%s\n", perflvl->memory / 1000,
+		 c, s, v, f, t);
 }
 
 static ssize_t
@@ -476,10 +480,10 @@ nouveau_pm_init(struct drm_device *dev)
 	char info[256];
 	int ret, i;
 
+	nouveau_mem_timing_init(dev);
 	nouveau_volt_init(dev);
 	nouveau_perf_init(dev);
 	nouveau_temp_init(dev);
-	nouveau_mem_timing_init(dev);
 
 	NV_INFO(dev, "%d available performance level(s)\n", pm->nr_perflvl);
 	for (i = 0; i < pm->nr_perflvl; i++) {
@@ -525,10 +529,10 @@ nouveau_pm_fini(struct drm_device *dev)
 	if (pm->cur != &pm->boot)
 		nouveau_pm_perflvl_set(dev, &pm->boot);
 
-	nouveau_mem_timing_fini(dev);
 	nouveau_temp_fini(dev);
 	nouveau_perf_fini(dev);
 	nouveau_volt_fini(dev);
+	nouveau_mem_timing_fini(dev);
 
 #ifdef CONFIG_ACPI
 	unregister_acpi_notifier(&pm->acpi_nb);
-- 
1.7.4.4

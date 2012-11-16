From: Maarten Lankhorst <maarten.lankhorst@canonical.com>
Subject: [PATCH] drm/nouveau: add voltage workaround for buggy vbioses
Date: Fri, 16 Nov 2012 17:46:04 +0100
Message-ID: <50A66DCC.9020809@canonical.com>
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
To: nouveau@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

Required to find all performance levels on my nvc0.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@canonical.com>

---

diff --git a/drivers/gpu/drm/nouveau/nouveau_perf.c b/drivers/gpu/drm/nouveau/nouveau_perf.c
index 4fe883c..624cbd1 100644
--- a/drivers/gpu/drm/nouveau/nouveau_perf.c
+++ b/drivers/gpu/drm/nouveau/nouveau_perf.c
@@ -251,6 +251,7 @@ static void
 nouveau_perf_voltage(struct drm_device *dev, struct nouveau_pm_level *perflvl)
 {
 	struct nouveau_drm *drm = nouveau_drm(dev);
+	struct nouveau_pm_voltage *volt = &nouveau_pm(dev)->voltage;
 	struct bit_entry P;
 	u8 *vmap;
 	int id;
@@ -287,6 +288,20 @@ nouveau_perf_voltage(struct drm_device *dev, struct nouveau_pm_level *perflvl)
 		perflvl->volt_min = ROM32(vmap[0]);
 		perflvl->volt_max = ROM32(vmap[4]);
 	}
+
+	/* Adjust for buggy bioses */
+	if (!volt->step_uv || !volt->step_ofs)
+		return;
+
+	if (perflvl->volt_min % volt->step_uv != volt->step_ofs) {
+		perflvl->volt_min -= perflvl->volt_min % volt->step_uv;
+		perflvl->volt_min += volt->step_ofs;
+	}
+
+	if (perflvl->volt_max % volt->step_uv != volt->step_ofs) {
+		perflvl->volt_max -= perflvl->volt_max % volt->step_uv;
+		perflvl->volt_max += volt->step_ofs;
+	}
 }
 
 void
diff --git a/drivers/gpu/drm/nouveau/nouveau_pm.h b/drivers/gpu/drm/nouveau/nouveau_pm.h
index 73b789c..967c27c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_pm.h
+++ b/drivers/gpu/drm/nouveau/nouveau_pm.h
@@ -40,6 +40,7 @@ struct nouveau_pm_voltage {
 
 	struct nouveau_pm_voltage_level *level;
 	int nr_level;
+	u16 step_uv, step_ofs;
 };
 
 /* Exclusive upper limits */
diff --git a/drivers/gpu/drm/nouveau/nouveau_volt.c b/drivers/gpu/drm/nouveau/nouveau_volt.c
index 9976414..c8d0c00 100644
--- a/drivers/gpu/drm/nouveau/nouveau_volt.c
+++ b/drivers/gpu/drm/nouveau/nouveau_volt.c
@@ -236,6 +236,9 @@ nouveau_volt_init(struct drm_device *dev)
 			voltage->level[vid].vid = vid;
 			volt_uv += step_uv;
 		}
+		voltage->step_uv = step_uv >= 0 ? step_uv : -step_uv;
+		if (step_uv)
+			voltage->step_ofs = volt_uv % voltage->step_uv;
 	}
 
 	voltage->supported = true;

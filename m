From: Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Subject: [PATCH] nouveau: add voltage workaround for buggy bioses
Date: Fri, 27 Jul 2012 14:11:27 +0200
Message-ID: <5012856F.6070207@canonical.com>
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

This makes all performance modes on c0 be detected properly,
since all voltages were aligned to step_uv, but the reported
voltages were offset relative to it, so no voltage was ever found.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>

---
---
 drivers/gpu/drm/nouveau/nouveau_drv.h  |    1 +
 drivers/gpu/drm/nouveau/nouveau_perf.c |   15 +++++++++++++++
 drivers/gpu/drm/nouveau/nouveau_volt.c |    3 +++
 3 files changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index 4f2cc95..fbf5fbf 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -388,6 +388,7 @@ struct nouveau_pm_voltage {
 
 	struct nouveau_pm_voltage_level *level;
 	int nr_level;
+	u16 step_uv, step_ofs;
 };
 
 /* Exclusive upper limits */
diff --git a/drivers/gpu/drm/nouveau/nouveau_perf.c b/drivers/gpu/drm/nouveau/nouveau_perf.c
index ea6acf1..8851f22 100644
--- a/drivers/gpu/drm/nouveau/nouveau_perf.c
+++ b/drivers/gpu/drm/nouveau/nouveau_perf.c
@@ -248,6 +248,7 @@ static void
 nouveau_perf_voltage(struct drm_device *dev, struct nouveau_pm_level *perflvl)
 {
 	struct drm_nouveau_private *dev_priv = dev->dev_private;
+	struct nouveau_pm_voltage *volt = &dev_priv->engine.pm.voltage;
 	struct bit_entry P;
 	u8 *vmap;
 	int id;
@@ -284,6 +285,20 @@ nouveau_perf_voltage(struct drm_device *dev, struct nouveau_pm_level *perflvl)
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
diff --git a/drivers/gpu/drm/nouveau/nouveau_volt.c b/drivers/gpu/drm/nouveau/nouveau_volt.c
index b010cb9..d0e1543 100644
--- a/drivers/gpu/drm/nouveau/nouveau_volt.c
+++ b/drivers/gpu/drm/nouveau/nouveau_volt.c
@@ -232,6 +232,9 @@ nouveau_volt_init(struct drm_device *dev)
 			voltage->level[vid].vid = vid;
 			volt_uv += step_uv;
 		}
+		voltage->step_uv = step_uv >= 0 ? step_uv : -step_uv;
+		if (step_uv)
+			voltage->step_ofs = volt_uv % voltage->step_uv;
 	}
 
 	voltage->supported = true;

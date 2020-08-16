From: Jeevan B <jeevan.b-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: [v3] drm/nouveau: utilize subconnector property for DP
Date: Sun, 16 Aug 2020 12:21:45 +0530
Message-ID: <1597560705-13897-1-git-send-email-jeevan.b@intel.com>
References: <1587732655-17544-3-git-send-email-jeevan.b@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1587732655-17544-3-git-send-email-jeevan.b-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: jani.nikula-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, Oleg Vasilev <oleg.vasilev-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, Jeevan B <jeevan.b-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, uma.shankar-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
List-Id: nouveau.vger.kernel.org

From: Oleg Vasilev <oleg.vasilev-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>

Since DP-specific information is stored in driver's structures, every
driver needs to implement subconnector property by itself.

v2: rebase

v3: renamed a function call

Cc: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Signed-off-by: Jeevan B <jeevan.b-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Signed-off-by: Oleg Vasilev <oleg.vasilev-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Reviewed-by: Emil Velikov <emil.velikov-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_connector.c | 13 +++++++++++++
 drivers/gpu/drm/nouveau/nouveau_dp.c        |  9 +++++++++
 drivers/gpu/drm/nouveau/nouveau_encoder.h   |  1 +
 3 files changed, 23 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
index 7674025..955afed 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -654,6 +654,17 @@ nouveau_connector_detect(struct drm_connector *connector, bool force)
 	pm_runtime_mark_last_busy(dev->dev);
 	pm_runtime_put_autosuspend(dev->dev);
 
+	if (connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort ||
+	    connector->connector_type == DRM_MODE_CONNECTOR_eDP) {
+		enum drm_mode_subconnector subconnector = DRM_MODE_SUBCONNECTOR_Unknown;
+
+		if (conn_status == connector_status_connected && nv_encoder)
+			subconnector = nv_encoder->dp.subconnector;
+		drm_object_property_set_value(&connector->base,
+			connector->dev->mode_config.dp_subconnector_property,
+			subconnector);
+	}
+
 	return conn_status;
 }
 
@@ -1390,6 +1401,8 @@ nouveau_connector_create(struct drm_device *dev,
 			kfree(nv_connector);
 			return ERR_PTR(ret);
 		}
+
+		drm_connector_attach_dp_subconnector_property(connector);
 		funcs = &nouveau_connector_funcs;
 		break;
 	default:
diff --git a/drivers/gpu/drm/nouveau/nouveau_dp.c b/drivers/gpu/drm/nouveau/nouveau_dp.c
index 8a0f799..3eff884 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dp.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dp.c
@@ -62,6 +62,7 @@ nouveau_dp_detect(struct nouveau_encoder *nv_encoder)
 	struct nouveau_drm *drm = nouveau_drm(dev);
 	struct nvkm_i2c_aux *aux;
 	u8 dpcd[8];
+	u8 port_cap[DP_MAX_DOWNSTREAM_PORTS] = {};
 	int ret;
 
 	aux = nv_encoder->aux;
@@ -72,6 +73,14 @@ nouveau_dp_detect(struct nouveau_encoder *nv_encoder)
 	if (ret)
 		return ret;
 
+	if (dpcd[DP_DPCD_REV] > 0x10) {
+		ret = nvkm_rdaux(aux, DP_DOWNSTREAM_PORT_0,
+				 port_cap, DP_MAX_DOWNSTREAM_PORTS);
+		if (ret)
+			memset(port_cap, 0, DP_MAX_DOWNSTREAM_PORTS);
+	}
+	nv_encoder->dp.subconnector = drm_dp_subconnector_type(dpcd, port_cap);
+
 	nv_encoder->dp.link_bw = 27000 * dpcd[1];
 	nv_encoder->dp.link_nr = dpcd[2] & DP_MAX_LANE_COUNT_MASK;
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_encoder.h b/drivers/gpu/drm/nouveau/nouveau_encoder.h
index a72c412..49b5c10 100644
--- a/drivers/gpu/drm/nouveau/nouveau_encoder.h
+++ b/drivers/gpu/drm/nouveau/nouveau_encoder.h
@@ -64,6 +64,7 @@ struct nouveau_encoder {
 			struct nv50_mstm *mstm;
 			int link_nr;
 			int link_bw;
+			enum drm_mode_subconnector subconnector;
 		} dp;
 	};
 
-- 
2.7.4

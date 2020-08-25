From: Lyude Paul <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [RFC v4 17/20] drm/nouveau/kms/nv50-: Add support for
 DP_SINK_COUNT
Date: Tue, 25 Aug 2020 15:50:24 -0400
Message-ID: <20200825195027.74681-18-lyude@redhat.com>
References: <20200825195027.74681-1-lyude@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20200825195027.74681-1-lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

This is another bit that we never implemented for nouveau: dongle
detection. When a "dongle", e.g. an active display adaptor, is hooked up
to the system and causes an HPD to be fired, we don't actually know
whether or not there's anything plugged into the dongle without checking
the sink count. As a result, plugging in a dongle without anything
plugged into it currently results in a bogus EDID retrieval error in the kernel log.

Additionally, most dongles won't send another long HPD signal if the
user suddenly plugs something in, they'll only send a short HPD IRQ with
the expectation that the source will check the sink count and reprobe
the connector if it's changed - something we don't actually do. As a
result, nothing will happen if the user plugs the dongle in before
plugging something into the dongle.

So, let's fix this by checking the sink count in both
nouveau_dp_probe_dpcd() and nouveau_dp_irq(), and reprobing the
connector if things change.

Signed-off-by: Lyude Paul <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Reviewed-by: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_dp.c      | 54 ++++++++++++++++++++---
 drivers/gpu/drm/nouveau/nouveau_encoder.h |  2 +
 2 files changed, 51 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_dp.c b/drivers/gpu/drm/nouveau/nouveau_dp.c
index c200f197083f9..89afc97ee2591 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dp.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dp.c
@@ -36,12 +36,22 @@ MODULE_PARM_DESC(mst, "Enable DisplayPort multi-stream (default: enabled)");
 static int nouveau_mst = 1;
 module_param_named(mst, nouveau_mst, int, 0400);
 
+static bool
+nouveau_dp_has_sink_count(struct drm_connector *connector,
+			  struct nouveau_encoder *outp)
+{
+	return drm_dp_has_sink_count(connector, outp->dp.dpcd,
+				     &outp->dp.desc);
+}
+
 static enum drm_connector_status
 nouveau_dp_probe_dpcd(struct nouveau_connector *nv_connector,
 		      struct nouveau_encoder *outp)
 {
+	struct drm_connector *connector = &nv_connector->base;
 	struct drm_dp_aux *aux = &nv_connector->aux;
 	struct nv50_mstm *mstm = NULL;
+	enum drm_connector_status status = connector_status_disconnected;
 	int ret;
 	u8 *dpcd = outp->dp.dpcd;
 
@@ -50,9 +60,9 @@ nouveau_dp_probe_dpcd(struct nouveau_connector *nv_connector,
 		ret = drm_dp_read_desc(aux, &outp->dp.desc,
 				       drm_dp_is_branch(dpcd));
 		if (ret < 0)
-			return connector_status_disconnected;
+			goto out;
 	} else {
-		return connector_status_disconnected;
+		goto out;
 	}
 
 	if (nouveau_mst) {
@@ -61,12 +71,33 @@ nouveau_dp_probe_dpcd(struct nouveau_connector *nv_connector,
 			mstm->can_mst = drm_dp_has_mst(aux, dpcd);
 	}
 
+	if (nouveau_dp_has_sink_count(connector, outp)) {
+		ret = drm_dp_get_sink_count(aux);
+		if (ret < 0)
+			goto out;
+
+		outp->dp.sink_count = ret;
+
+		/*
+		 * Dongle connected, but no display. Don't bother reading
+		 * downstream port info
+		 */
+		if (!outp->dp.sink_count)
+			return connector_status_disconnected;
+	}
+
 	ret = drm_dp_downstream_read_info(aux, dpcd,
 					  outp->dp.downstream_ports);
 	if (ret < 0)
-		return connector_status_disconnected;
+		goto out;
 
-	return connector_status_connected;
+	status = connector_status_connected;
+out:
+	if (status != connector_status_connected) {
+		/* Clear any cached info */
+		outp->dp.sink_count = 0;
+	}
+	return status;
 }
 
 int
@@ -159,6 +190,8 @@ void nouveau_dp_irq(struct nouveau_drm *drm,
 	struct drm_connector *connector = &nv_connector->base;
 	struct nouveau_encoder *outp = find_encoder(connector, DCB_OUTPUT_DP);
 	struct nv50_mstm *mstm;
+	int ret;
+	bool send_hpd = false;
 
 	if (!outp)
 		return;
@@ -170,12 +203,23 @@ void nouveau_dp_irq(struct nouveau_drm *drm,
 
 	if (mstm && mstm->is_mst) {
 		if (!nv50_mstm_service(drm, nv_connector, mstm))
-			nouveau_connector_hpd(connector);
+			send_hpd = true;
 	} else {
 		drm_dp_cec_irq(&nv_connector->aux);
+
+		if (nouveau_dp_has_sink_count(connector, outp)) {
+			ret = drm_dp_get_sink_count(&nv_connector->aux);
+			if (ret != outp->dp.sink_count)
+				send_hpd = true;
+			if (ret >= 0)
+				outp->dp.sink_count = ret;
+		}
 	}
 
 	mutex_unlock(&outp->dp.hpd_irq_lock);
+
+	if (send_hpd)
+		nouveau_connector_hpd(connector);
 }
 
 /* TODO:
diff --git a/drivers/gpu/drm/nouveau/nouveau_encoder.h b/drivers/gpu/drm/nouveau/nouveau_encoder.h
index c1924a4529a7b..21937f1c7dd90 100644
--- a/drivers/gpu/drm/nouveau/nouveau_encoder.h
+++ b/drivers/gpu/drm/nouveau/nouveau_encoder.h
@@ -74,6 +74,8 @@ struct nouveau_encoder {
 			u8 dpcd[DP_RECEIVER_CAP_SIZE];
 			u8 downstream_ports[DP_MAX_DOWNSTREAM_PORTS];
 			struct drm_dp_desc desc;
+
+			u8 sink_count;
 		} dp;
 	};
 
-- 
2.26.2

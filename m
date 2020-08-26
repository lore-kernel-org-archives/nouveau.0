From: Lyude Paul <lyude@redhat.com>
Subject: [PATCH v5 02/20] drm/nouveau/kms/nv50-: Remove
 open-coded drm_dp_read_desc()
Date: Wed, 26 Aug 2020 14:24:38 -0400
Message-ID: <20200826182456.322681-3-lyude@redhat.com>
References: <20200826182456.322681-1-lyude@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <intel-gfx-bounces@lists.freedesktop.org>
In-Reply-To: <20200826182456.322681-1-lyude@redhat.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org
Cc: David Airlie <airlied@linux.ie>, Ben Skeggs <bskeggs@redhat.com>, open list <linux-kernel@vger.kernel.org>
List-Id: nouveau.vger.kernel.org

Noticed this while going through our DP code - we use an open-coded
version of drm_dp_read_desc() instead of just using the helper, so
change that. This will also let us use quirks in the future if we end up
needing them.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Ben Skeggs <bskeggs@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_connector.c |  3 ++-
 drivers/gpu/drm/nouveau/nouveau_dp.c        | 30 +++++++--------------
 drivers/gpu/drm/nouveau/nouveau_encoder.h   |  4 ++-
 3 files changed, 14 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
index 7674025a4bfe8..e12957e6faa7c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -435,7 +435,8 @@ nouveau_connector_ddc_detect(struct drm_connector *connector)
 
 		switch (nv_encoder->dcb->type) {
 		case DCB_OUTPUT_DP:
-			ret = nouveau_dp_detect(nv_encoder);
+			ret = nouveau_dp_detect(nouveau_connector(connector),
+						nv_encoder);
 			if (ret == NOUVEAU_DP_MST)
 				return NULL;
 			else if (ret == NOUVEAU_DP_SST)
diff --git a/drivers/gpu/drm/nouveau/nouveau_dp.c b/drivers/gpu/drm/nouveau/nouveau_dp.c
index ee778ddc95fae..c4e9c21d4dd2b 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dp.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dp.c
@@ -36,27 +36,9 @@ MODULE_PARM_DESC(mst, "Enable DisplayPort multi-stream (default: enabled)");
 static int nouveau_mst = 1;
 module_param_named(mst, nouveau_mst, int, 0400);
 
-static void
-nouveau_dp_probe_oui(struct drm_device *dev, struct nvkm_i2c_aux *aux, u8 *dpcd)
-{
-	struct nouveau_drm *drm = nouveau_drm(dev);
-	u8 buf[3];
-
-	if (!(dpcd[DP_DOWN_STREAM_PORT_COUNT] & DP_OUI_SUPPORT))
-		return;
-
-	if (!nvkm_rdaux(aux, DP_SINK_OUI, buf, 3))
-		NV_DEBUG(drm, "Sink OUI: %02hx%02hx%02hx\n",
-			     buf[0], buf[1], buf[2]);
-
-	if (!nvkm_rdaux(aux, DP_BRANCH_OUI, buf, 3))
-		NV_DEBUG(drm, "Branch OUI: %02hx%02hx%02hx\n",
-			     buf[0], buf[1], buf[2]);
-
-}
-
 int
-nouveau_dp_detect(struct nouveau_encoder *nv_encoder)
+nouveau_dp_detect(struct nouveau_connector *nv_connector,
+		  struct nouveau_encoder *nv_encoder)
 {
 	struct drm_device *dev = nv_encoder->base.base.dev;
 	struct nouveau_drm *drm = nouveau_drm(dev);
@@ -89,7 +71,13 @@ nouveau_dp_detect(struct nouveau_encoder *nv_encoder)
 	NV_DEBUG(drm, "maximum: %dx%d\n",
 		 nv_encoder->dp.link_nr, nv_encoder->dp.link_bw);
 
-	nouveau_dp_probe_oui(dev, aux, dpcd);
+	ret = drm_dp_read_desc(&nv_connector->aux, &nv_encoder->dp.desc,
+			       drm_dp_is_branch(dpcd));
+	if (ret) {
+		NV_ERROR(drm, "Failed to read DP descriptor on %s: %d\n",
+			 nv_connector->base.name, ret);
+		return ret;
+	}
 
 	ret = nv50_mstm_detect(nv_encoder->dp.mstm, dpcd, nouveau_mst);
 	if (ret == 1)
diff --git a/drivers/gpu/drm/nouveau/nouveau_encoder.h b/drivers/gpu/drm/nouveau/nouveau_encoder.h
index a72c412ac8b14..6424cdcb4913f 100644
--- a/drivers/gpu/drm/nouveau/nouveau_encoder.h
+++ b/drivers/gpu/drm/nouveau/nouveau_encoder.h
@@ -33,6 +33,7 @@
 #include <drm/drm_dp_mst_helper.h>
 #include "dispnv04/disp.h"
 struct nv50_head_atom;
+struct nouveau_connector;
 
 #define NV_DPMS_CLEARED 0x80
 
@@ -64,6 +65,7 @@ struct nouveau_encoder {
 			struct nv50_mstm *mstm;
 			int link_nr;
 			int link_bw;
+			struct drm_dp_desc desc;
 		} dp;
 	};
 
@@ -104,7 +106,7 @@ enum nouveau_dp_status {
 	NOUVEAU_DP_MST,
 };
 
-int nouveau_dp_detect(struct nouveau_encoder *);
+int nouveau_dp_detect(struct nouveau_connector *, struct nouveau_encoder *);
 enum drm_mode_status nv50_dp_mode_valid(struct drm_connector *,
 					struct nouveau_encoder *,
 					const struct drm_display_mode *,
-- 
2.26.2

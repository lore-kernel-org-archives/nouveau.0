From: Lyude Paul <lyude@redhat.com>
Subject: [PATCH 2/2] drm/nouveau/kms/nv50-: Check MST display modes against available PBN
Date: Fri, 24 Jul 2020 13:04:57 -0400
Message-ID: <20200724170457.711072-3-lyude@redhat.com>
References: <20200724170457.711072-1-lyude@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200724170457.711072-1-lyude@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Dave Airlie <airlied@gmail.com>, Alex Deucher <alexander.deucher@amd.com>, Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>, Takashi Iwai <tiwai@suse.de>, James Jones <jajones@nvidia.com>, open list <linux-kernel@vger.kernel.org>
List-Id: nouveau.vger.kernel.org

While we already check whether a given atomic state can fit in the
available bandwidth for an MST topology, we don't currently bother to
prune display modes on MST connectors if said modes are impossible to
fit on the MST link irregardless of the current display state.

So, let's avoid reporting impossible-to-set modes to userspace by
validating the minimum bandwidth requirements of each display mode
against the maximum bandwidth supported by the MST connector.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c     | 41 +++++++++++++++------
 drivers/gpu/drm/nouveau/nouveau_connector.c | 24 ++++++++++--
 drivers/gpu/drm/nouveau/nouveau_connector.h |  4 +-
 3 files changed, 53 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 4c2894d8e15b..7b8531edafa5 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -1056,24 +1056,38 @@ nv50_mstc_atomic_best_encoder(struct drm_connector *connector,
 	return &nv50_head(crtc)->msto->encoder;
 }
 
-static enum drm_mode_status
-nv50_mstc_mode_valid(struct drm_connector *connector,
-		     struct drm_display_mode *mode)
+static int
+nv50_mstc_mode_valid_ctx(struct drm_connector *connector,
+			 struct drm_display_mode *mode,
+			 struct drm_modeset_acquire_ctx *ctx,
+			 enum drm_mode_status *status)
 {
 	struct nv50_mstc *mstc = nv50_mstc(connector);
 	struct nouveau_encoder *outp = mstc->mstm->outp;
+	unsigned int clock;
+	int ret;
 
-	/* TODO: calculate the PBN from the dotclock and validate against the
-	 * MSTB's max possible PBN
-	 */
+	*status = nv50_dp_mode_valid(connector, outp, mode, &clock);
+	if (*status != MODE_OK)
+		return 0;
 
-	return nv50_dp_mode_valid(connector, outp, mode, NULL);
+	ret = drm_modeset_lock(&mstc->mstm->mgr.base.lock, ctx);
+	if (ret)
+		return ret;
+
+	if (drm_dp_calc_pbn_mode(clock, connector->display_info.bpc,
+				 false) > mstc->port->full_pbn)
+		*status = MODE_CLOCK_HIGH;
+
+	return 0;
 }
 
 static int
-nv50_mstc_get_modes(struct drm_connector *connector)
+nv50_mstc_get_modes_ctx(struct drm_connector *connector,
+			struct drm_modeset_acquire_ctx *ctx)
 {
 	struct nv50_mstc *mstc = nv50_mstc(connector);
+	struct drm_display_mode *mode;
 	int ret = 0;
 
 	mstc->edid = drm_dp_mst_get_edid(&mstc->connector, mstc->port->mgr, mstc->port);
@@ -1093,9 +1107,14 @@ nv50_mstc_get_modes(struct drm_connector *connector)
 	else
 		connector->display_info.bpc = 8;
 
+	mode = nouveau_conn_native_mode(&mstc->connector, ctx);
+	if (IS_ERR(mode))
+		return PTR_ERR(mode);
+
 	if (mstc->native)
 		drm_mode_destroy(mstc->connector.dev, mstc->native);
-	mstc->native = nouveau_conn_native_mode(&mstc->connector);
+	mstc->native = mode;
+
 	return ret;
 }
 
@@ -1156,8 +1175,8 @@ nv50_mstc_detect(struct drm_connector *connector,
 
 static const struct drm_connector_helper_funcs
 nv50_mstc_help = {
-	.get_modes = nv50_mstc_get_modes,
-	.mode_valid = nv50_mstc_mode_valid,
+	.get_modes_ctx = nv50_mstc_get_modes_ctx,
+	.mode_valid_ctx = nv50_mstc_mode_valid_ctx,
 	.atomic_best_encoder = nv50_mstc_atomic_best_encoder,
 	.atomic_check = nv50_mstc_atomic_check,
 	.detect_ctx = nv50_mstc_detect,
diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
index ab2c2b2cab10..9737c65e5627 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -51,7 +51,8 @@
 #include <nvif/event.h>
 
 struct drm_display_mode *
-nouveau_conn_native_mode(struct drm_connector *connector)
+nouveau_conn_native_mode(struct drm_connector *connector,
+			 struct drm_modeset_acquire_ctx *ctx)
 {
 	const struct drm_connector_helper_funcs *helper = connector->helper_private;
 	struct nouveau_drm *drm = nouveau_drm(connector->dev);
@@ -60,10 +61,24 @@ nouveau_conn_native_mode(struct drm_connector *connector)
 	int high_w = 0, high_h = 0, high_v = 0;
 
 	list_for_each_entry(mode, &connector->probed_modes, head) {
-		if (helper->mode_valid(connector, mode) != MODE_OK ||
-		    (mode->flags & DRM_MODE_FLAG_INTERLACE))
+		if (mode->flags & DRM_MODE_FLAG_INTERLACE)
 			continue;
 
+		if (helper->mode_valid_ctx) {
+			enum drm_mode_status status;
+			int ret;
+
+			drm_WARN_ON(dev, !ctx);
+			ret = helper->mode_valid_ctx(connector, mode, ctx,
+						     &status);
+			if (ret < 0)
+				return ERR_PTR(ret);
+			if (status != MODE_OK)
+				continue;
+		} else if (helper->mode_valid(connector, mode) != MODE_OK) {
+			continue;
+		}
+
 		/* Use preferred mode if there is one.. */
 		if (mode->type & DRM_MODE_TYPE_PREFERRED) {
 			NV_DEBUG(drm, "native mode from preferred\n");
@@ -959,7 +974,8 @@ nouveau_connector_get_modes(struct drm_connector *connector)
 	 * the list of modes.
 	 */
 	if (!nv_connector->native_mode)
-		nv_connector->native_mode = nouveau_conn_native_mode(connector);
+		nv_connector->native_mode =
+			nouveau_conn_native_mode(connector, NULL);
 	if (ret == 0 && nv_connector->native_mode) {
 		struct drm_display_mode *mode;
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.h b/drivers/gpu/drm/nouveau/nouveau_connector.h
index 9e062c7adec8..e85962d9ae66 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.h
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.h
@@ -194,7 +194,9 @@ int nouveau_conn_atomic_set_property(struct drm_connector *,
 int nouveau_conn_atomic_get_property(struct drm_connector *,
 				     const struct drm_connector_state *,
 				     struct drm_property *, u64 *);
-struct drm_display_mode *nouveau_conn_native_mode(struct drm_connector *);
+struct drm_display_mode *
+nouveau_conn_native_mode(struct drm_connector *connector,
+			 struct drm_modeset_acquire_ctx *ctx);
 enum drm_mode_status
 nouveau_conn_mode_clock_valid(const struct drm_display_mode *,
 			      const unsigned min_clock,
-- 
2.26.2

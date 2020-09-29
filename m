From: Lyude Paul <lyude@redhat.com>
Subject: [PATCH v2 1/2] drm/nouveau/kms/nv50-: Get rid of bogus nouveau_conn_mode_valid()
Date: Tue, 29 Sep 2020 18:31:31 -0400
Message-ID: <20200929223132.333453-1-lyude@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
To: nouveau@lists.freedesktop.org
Cc: =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, stable@vger.kernel.org, Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, "open list:DRM DRIVER FOR NVIDIA
        GEFORCE/QUADRO GPUS" <dri-devel@lists.freedesktop.org>, open list <linux-kernel@vger.kernel.org>
List-Id: nouveau.vger.kernel.org

Ville also pointed out that I got a lot of the logic here wrong as well, whoops.
While I don't think anyone's likely using 3D output with nouveau, the next patch
will make nouveau_conn_mode_valid() make a lot less sense. So, let's just get
rid of it and open-code it like before, while taking care to move the 3D frame
packing calculations on the dot clock into the right place.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Fixes: d6a9efece724 ("drm/nouveau/kms/nv50-: Share DP SST mode_valid() handling with MST")
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: <stable@vger.kernel.org> # v5.8+
---
 drivers/gpu/drm/nouveau/nouveau_connector.c | 36 ++++++---------------
 drivers/gpu/drm/nouveau/nouveau_dp.c        | 16 ++++++---
 2 files changed, 21 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
index 49dd0cbc332f..6f21f36719fc 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -1023,29 +1023,6 @@ get_tmds_link_bandwidth(struct drm_connector *connector)
 		return 112000 * duallink_scale;
 }
 
-enum drm_mode_status
-nouveau_conn_mode_clock_valid(const struct drm_display_mode *mode,
-			      const unsigned min_clock,
-			      const unsigned max_clock,
-			      unsigned int *clock_out)
-{
-	unsigned int clock = mode->clock;
-
-	if ((mode->flags & DRM_MODE_FLAG_3D_MASK) ==
-	    DRM_MODE_FLAG_3D_FRAME_PACKING)
-		clock *= 2;
-
-	if (clock < min_clock)
-		return MODE_CLOCK_LOW;
-	if (clock > max_clock)
-		return MODE_CLOCK_HIGH;
-
-	if (clock_out)
-		*clock_out = clock;
-
-	return MODE_OK;
-}
-
 static enum drm_mode_status
 nouveau_connector_mode_valid(struct drm_connector *connector,
 			     struct drm_display_mode *mode)
@@ -1053,7 +1030,7 @@ nouveau_connector_mode_valid(struct drm_connector *connector,
 	struct nouveau_connector *nv_connector = nouveau_connector(connector);
 	struct nouveau_encoder *nv_encoder = nv_connector->detected_encoder;
 	struct drm_encoder *encoder = to_drm_encoder(nv_encoder);
-	unsigned min_clock = 25000, max_clock = min_clock;
+	unsigned int min_clock = 25000, max_clock = min_clock, clock = mode->clock;
 
 	switch (nv_encoder->dcb->type) {
 	case DCB_OUTPUT_LVDS:
@@ -1082,8 +1059,15 @@ nouveau_connector_mode_valid(struct drm_connector *connector,
 		return MODE_BAD;
 	}
 
-	return nouveau_conn_mode_clock_valid(mode, min_clock, max_clock,
-					     NULL);
+	if ((mode->flags & DRM_MODE_FLAG_3D_MASK) == DRM_MODE_FLAG_3D_FRAME_PACKING)
+		clock *= 2;
+
+	if (clock < min_clock)
+		return MODE_CLOCK_LOW;
+	if (clock > max_clock)
+		return MODE_CLOCK_HIGH;
+
+	return MODE_OK;
 }
 
 static struct drm_encoder *
diff --git a/drivers/gpu/drm/nouveau/nouveau_dp.c b/drivers/gpu/drm/nouveau/nouveau_dp.c
index 7b640e05bd4c..93e3751ad7f1 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dp.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dp.c
@@ -232,12 +232,14 @@ nv50_dp_mode_valid(struct drm_connector *connector,
 		   unsigned *out_clock)
 {
 	const unsigned min_clock = 25000;
-	unsigned max_clock, ds_clock, clock;
-	enum drm_mode_status ret;
+	unsigned max_clock, ds_clock, clock = mode->clock;
 
 	if (mode->flags & DRM_MODE_FLAG_INTERLACE && !outp->caps.dp_interlace)
 		return MODE_NO_INTERLACE;
 
+	if ((mode->flags & DRM_MODE_FLAG_3D_MASK) == DRM_MODE_FLAG_3D_FRAME_PACKING)
+		clock *= 2;
+
 	max_clock = outp->dp.link_nr * outp->dp.link_bw;
 	ds_clock = drm_dp_downstream_max_dotclock(outp->dp.dpcd,
 						  outp->dp.downstream_ports);
@@ -245,9 +247,13 @@ nv50_dp_mode_valid(struct drm_connector *connector,
 		max_clock = min(max_clock, ds_clock);
 
 	clock = mode->clock * (connector->display_info.bpc * 3) / 10;
-	ret = nouveau_conn_mode_clock_valid(mode, min_clock, max_clock,
-					    &clock);
+	if (clock < min_clock)
+		return MODE_CLOCK_LOW;
+	if (clock > max_clock)
+		return MODE_CLOCK_HIGH;
+
 	if (out_clock)
 		*out_clock = clock;
-	return ret;
+
+	return MODE_OK;
 }
-- 
2.26.2

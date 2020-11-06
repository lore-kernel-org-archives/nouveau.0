From: Lyude Paul <lyude@redhat.com>
Subject: [PATCH 1/2] drm/nouveau/kms/nv50-: Get rid of bogus nouveau_conn_mode_valid()
Date: Fri,  6 Nov 2020 18:30:14 -0500
Message-ID: <20201106233016.2481179-2-lyude@redhat.com>
References: <160459060724988@kroah.com>
 <20201106233016.2481179-1-lyude@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20201106233016.2481179-1-lyude@redhat.com>
To: gregkh@linuxfoundation.org, stable@vger.kernel.org, nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, open list <linux-kernel@vger.kernel.org>
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
Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_connector.c | 36 ++++++---------------
 drivers/gpu/drm/nouveau/nouveau_dp.c        | 15 ++++++---
 2 files changed, 20 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
index 7674025a4bfe8..1d91d52ee5083 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -1035,29 +1035,6 @@ get_tmds_link_bandwidth(struct drm_connector *connector)
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
@@ -1065,7 +1042,7 @@ nouveau_connector_mode_valid(struct drm_connector *connector,
 	struct nouveau_connector *nv_connector = nouveau_connector(connector);
 	struct nouveau_encoder *nv_encoder = nv_connector->detected_encoder;
 	struct drm_encoder *encoder = to_drm_encoder(nv_encoder);
-	unsigned min_clock = 25000, max_clock = min_clock;
+	unsigned int min_clock = 25000, max_clock = min_clock, clock = mode->clock;
 
 	switch (nv_encoder->dcb->type) {
 	case DCB_OUTPUT_LVDS:
@@ -1094,8 +1071,15 @@ nouveau_connector_mode_valid(struct drm_connector *connector,
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
index 8a0f7994e1aeb..40683e1244c3f 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dp.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dp.c
@@ -114,18 +114,23 @@ nv50_dp_mode_valid(struct drm_connector *connector,
 		   unsigned *out_clock)
 {
 	const unsigned min_clock = 25000;
-	unsigned max_clock, clock;
-	enum drm_mode_status ret;
+	unsigned max_clock, clock = mode->clock;
 
 	if (mode->flags & DRM_MODE_FLAG_INTERLACE && !outp->caps.dp_interlace)
 		return MODE_NO_INTERLACE;
 
+	if ((mode->flags & DRM_MODE_FLAG_3D_MASK) == DRM_MODE_FLAG_3D_FRAME_PACKING)
+		clock *= 2;
+
 	max_clock = outp->dp.link_nr * outp->dp.link_bw;
 	clock = mode->clock * (connector->display_info.bpc * 3) / 10;
+	if (clock < min_clock)
+		return MODE_CLOCK_LOW;
+	if (clock > max_clock)
+		return MODE_CLOCK_HIGH;
 
-	ret = nouveau_conn_mode_clock_valid(mode, min_clock, max_clock,
-					    &clock);
 	if (out_clock)
 		*out_clock = clock;
-	return ret;
+
+	return MODE_OK;
 }
-- 
2.28.0

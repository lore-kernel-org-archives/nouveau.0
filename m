From: Lyude Paul <lyude@redhat.com>
Subject: [PATCH] drm/nouveau/kms/nv50-: Fix clock checking algorithm in nv50_dp_mode_valid()
Date: Tue, 22 Sep 2020 17:05:10 -0400
Message-ID: <20200922210510.156220-1-lyude@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
To: nouveau@lists.freedesktop.org
Cc: =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, "open list:DRM DRIVER FOR NVIDIA
        GEFORCE/QUADRO GPUS" <dri-devel@lists.freedesktop.org>, open list <linux-kernel@vger.kernel.org>
List-Id: nouveau.vger.kernel.org

While I thought I had this correct (since it actually did reject modes
like I expected during testing), Ville Syrjala from Intel pointed out
that the logic here isn't correct. max_clock refers to the max symbol
rate supported by the encoder, so limiting clock to ds_clock using max()
doesn't make sense. Additionally, we want to check against 6bpc for the
time being since that's the minimum possible bpc here, not the reported
bpc from the connector. See:

https://lists.freedesktop.org/archives/dri-devel/2020-September/280276.html

For more info.

So, let's rewrite this using Ville's advice.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Fixes: 409d38139b42 ("drm/nouveau/kms/nv50-: Use downstream DP clock limits for mode validation")
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Ben Skeggs <bskeggs@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_dp.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_dp.c b/drivers/gpu/drm/nouveau/nouveau_dp.c
index 7b640e05bd4cd..24c81e423d349 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dp.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dp.c
@@ -231,23 +231,26 @@ nv50_dp_mode_valid(struct drm_connector *connector,
 		   const struct drm_display_mode *mode,
 		   unsigned *out_clock)
 {
-	const unsigned min_clock = 25000;
-	unsigned max_clock, ds_clock, clock;
+	const unsigned int min_clock = 25000;
+	unsigned int max_clock, ds_clock, clock;
+	const u8 bpp = 18; /* 6 bpc */
 	enum drm_mode_status ret;
 
 	if (mode->flags & DRM_MODE_FLAG_INTERLACE && !outp->caps.dp_interlace)
 		return MODE_NO_INTERLACE;
 
 	max_clock = outp->dp.link_nr * outp->dp.link_bw;
-	ds_clock = drm_dp_downstream_max_dotclock(outp->dp.dpcd,
-						  outp->dp.downstream_ports);
-	if (ds_clock)
-		max_clock = min(max_clock, ds_clock);
-
-	clock = mode->clock * (connector->display_info.bpc * 3) / 10;
-	ret = nouveau_conn_mode_clock_valid(mode, min_clock, max_clock,
-					    &clock);
+	clock = mode->clock * bpp / 8;
+	if (clock > max_clock)
+		return MODE_CLOCK_HIGH;
+
+	ds_clock = drm_dp_downstream_max_dotclock(outp->dp.dpcd, outp->dp.downstream_ports);
+	if (ds_clock && mode->clock > ds_clock)
+		return MODE_CLOCK_HIGH;
+
+	ret = nouveau_conn_mode_clock_valid(mode, min_clock, max_clock, &clock);
 	if (out_clock)
 		*out_clock = clock;
+
 	return ret;
 }
-- 
2.26.2

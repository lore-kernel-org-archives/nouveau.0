From: Lyude Paul <lyude@redhat.com>
Subject: [PATCH v2 2/2] drm/nouveau/kms/nv50-: Fix clock checking algorithm in nv50_dp_mode_valid()
Date: Tue, 29 Sep 2020 18:31:32 -0400
Message-ID: <20200929223132.333453-2-lyude@redhat.com>
References: <20200929223132.333453-1-lyude@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200929223132.333453-1-lyude@redhat.com>
To: nouveau@lists.freedesktop.org
Cc: =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, "open list:DRM DRIVER FOR NVIDIA
        GEFORCE/QUADRO GPUS" <dri-devel@lists.freedesktop.org>, open list <linux-kernel@vger.kernel.org>
List-Id: nouveau.vger.kernel.org

While I thought I had this correct (since it actually did reject modes
like I expected during testing), Ville Syrjala from Intel pointed out
that the logic here isn't correct. max_clock refers to the max data rate
supported by the DP encoder. So, limiting it to the output of ds_clock (which
refers to the maximum dotclock of the downstream DP device) doesn't make any
sense. Additionally, since we're using the connector's bpc as the canonical BPC
we should use this in mode_valid until we support dynamically setting the bpp
based on bandwidth constraints.

https://lists.freedesktop.org/archives/dri-devel/2020-September/280276.html

For more info.

So, let's rewrite this using Ville's advice.

v2:
* Ville pointed out I mixed up the dotclock and the link rate. So fix that...
* ...and also rename all the variables in this function to be more appropriately
  labeled so I stop mixing them up.
* Reuse the bpp from the connector for now until we have dynamic bpp selection.
* Use use DIV_ROUND_UP for calculating the mode rate like i915 does, which we
  should also have been doing from the start

Signed-off-by: Lyude Paul <lyude@redhat.com>
Fixes: 409d38139b42 ("drm/nouveau/kms/nv50-: Use downstream DP clock limits for mode validation")
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Ben Skeggs <bskeggs@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_dp.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_dp.c b/drivers/gpu/drm/nouveau/nouveau_dp.c
index 93e3751ad7f1..040ed88d362d 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dp.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dp.c
@@ -231,8 +231,9 @@ nv50_dp_mode_valid(struct drm_connector *connector,
 		   const struct drm_display_mode *mode,
 		   unsigned *out_clock)
 {
-	const unsigned min_clock = 25000;
-	unsigned max_clock, ds_clock, clock = mode->clock;
+	const unsigned int min_clock = 25000;
+	unsigned int max_rate, mode_rate, ds_max_dotclock, clock = mode->clock;
+	const u8 bpp = connector->display_info.bpc * 3;
 
 	if (mode->flags & DRM_MODE_FLAG_INTERLACE && !outp->caps.dp_interlace)
 		return MODE_NO_INTERLACE;
@@ -240,17 +241,17 @@ nv50_dp_mode_valid(struct drm_connector *connector,
 	if ((mode->flags & DRM_MODE_FLAG_3D_MASK) == DRM_MODE_FLAG_3D_FRAME_PACKING)
 		clock *= 2;
 
-	max_clock = outp->dp.link_nr * outp->dp.link_bw;
-	ds_clock = drm_dp_downstream_max_dotclock(outp->dp.dpcd,
-						  outp->dp.downstream_ports);
-	if (ds_clock)
-		max_clock = min(max_clock, ds_clock);
+	max_rate = outp->dp.link_nr * outp->dp.link_bw;
+	mode_rate = DIV_ROUND_UP(clock * bpp, 8);
+	if (mode_rate > max_rate)
+		return MODE_CLOCK_HIGH;
+
+	ds_max_dotclock = drm_dp_downstream_max_dotclock(outp->dp.dpcd, outp->dp.downstream_ports);
+	if (ds_max_dotclock && clock > ds_max_dotclock)
+		return MODE_CLOCK_HIGH;
 
-	clock = mode->clock * (connector->display_info.bpc * 3) / 10;
 	if (clock < min_clock)
 		return MODE_CLOCK_LOW;
-	if (clock > max_clock)
-		return MODE_CLOCK_HIGH;
 
 	if (out_clock)
 		*out_clock = clock;
-- 
2.26.2

From: Lyude Paul <lyude@redhat.com>
Subject: [RFC] drm: Bump encoder limit from 32 to 64
Date: Thu, 15 Aug 2019 14:03:22 -0400
Message-ID: <20190815180322.25600-1-lyude@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

Assuming that GPUs would never have even close to 32 separate video
encoders is quite honestly a pretty reasonable assumption. Unfortunately
we do not live in a reasonable world, as it looks like it is actually
possible to find devices that will create more drm_encoder objects then
this. Case in point: the ThinkPad P71's discrete GPU, which exposes 1
eDP port and 5 DP ports. On the P71, nouveau attempts to create one
encoder for the eDP port, and two encoders for each DP++/USB-C port
along with 4 MST encoders for each DP port. This comes out to 35
different encoders. Unfortunately, this can't really be optimized to
make less encoders either.

So, what if we bumped the limit to 64? Unfortunately this has one very
awkward drawback: we already expose 32-bit bitmasks for encoders to
userspace in drm_encoder->possible_clones. Yikes. Luckily for us
however, the year is 2019 and modern hardware that supports cloning is
basically non-existent.

So, let's try to compromise here: allow encoders with indexes <32 to
have non-zero values in drm_encoder->possible_clones, and don't allow
encoders with higher indexes to set drm_encoder->possible_clones to a
non-zero value. This allows us to avoid breaking UAPI, while still being
able to bump up the encoder limit.

This also fixes driver probing for nouveau on the ThinkPad P71.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Cc: nouveau@lists.freedesktop.org
---
 drivers/gpu/drm/drm_atomic.c  |  2 +-
 drivers/gpu/drm/drm_encoder.c | 10 ++++++++--
 include/drm/drm_crtc.h        |  2 +-
 include/drm/drm_encoder.h     | 20 +++++++++++++++-----
 4 files changed, 25 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 419381abbdd1..27ce988ef0cc 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -392,7 +392,7 @@ static void drm_atomic_crtc_print_state(struct drm_printer *p,
 	drm_printf(p, "\tcolor_mgmt_changed=%d\n", state->color_mgmt_changed);
 	drm_printf(p, "\tplane_mask=%x\n", state->plane_mask);
 	drm_printf(p, "\tconnector_mask=%x\n", state->connector_mask);
-	drm_printf(p, "\tencoder_mask=%x\n", state->encoder_mask);
+	drm_printf(p, "\tencoder_mask=%llx\n", state->encoder_mask);
 	drm_printf(p, "\tmode: " DRM_MODE_FMT "\n", DRM_MODE_ARG(&state->mode));
 
 	if (crtc->funcs->atomic_print_state)
diff --git a/drivers/gpu/drm/drm_encoder.c b/drivers/gpu/drm/drm_encoder.c
index 7fb47b7b8b44..e4b8f675aa81 100644
--- a/drivers/gpu/drm/drm_encoder.c
+++ b/drivers/gpu/drm/drm_encoder.c
@@ -112,8 +112,14 @@ int drm_encoder_init(struct drm_device *dev,
 {
 	int ret;
 
-	/* encoder index is used with 32bit bitmasks */
-	if (WARN_ON(dev->mode_config.num_encoder >= 32))
+	/*
+	 * Since possible_clones has been exposed to userspace as a 32bit
+	 * bitmask, we don't allow creating encoders with an index >=32 which
+	 * are capable of cloning.
+	 */
+	if (WARN_ON(dev->mode_config.num_encoder >= 64) ||
+	    WARN_ON(dev->mode_config.num_encoder >= 32 &&
+		    encoder->possible_clones))
 		return -EINVAL;
 
 	ret = drm_mode_object_add(dev, &encoder->base, DRM_MODE_OBJECT_ENCODER);
diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
index 7d14c11bdc0a..fd0b2438c3d5 100644
--- a/include/drm/drm_crtc.h
+++ b/include/drm/drm_crtc.h
@@ -210,7 +210,7 @@ struct drm_crtc_state {
 	 * @encoder_mask: Bitmask of drm_encoder_mask(encoder) of encoders
 	 * attached to this CRTC.
 	 */
-	u32 encoder_mask;
+	u64 encoder_mask;
 
 	/**
 	 * @adjusted_mode:
diff --git a/include/drm/drm_encoder.h b/include/drm/drm_encoder.h
index 70cfca03d812..3f9cb65694e1 100644
--- a/include/drm/drm_encoder.h
+++ b/include/drm/drm_encoder.h
@@ -159,7 +159,15 @@ struct drm_encoder {
 	 * encoders can be used in a cloned configuration, they both should have
 	 * each another bits set.
 	 *
-	 * In reality almost every driver gets this wrong.
+	 * In reality almost every driver gets this wrong, and most modern
+	 * display hardware does not have support for cloning. As well, while we
+	 * expose this mask to userspace as 32bits long, we do sure purely to
+	 * avoid breaking pre-existing UAPI since the limitation on the number
+	 * of encoders has been increased from 32 bits to 64 bits. In order to
+	 * maintain functionality for drivers which do actually support cloning,
+	 * we only allow cloning with encoders that have an index <32. Encoders
+	 * with indexes higher than 32 are not allowed to specify a non-zero
+	 * value here.
 	 *
 	 * Note that since encoder objects can't be hotplugged the assigned indices
 	 * are stable and hence known before registering all objects.
@@ -198,13 +206,15 @@ static inline unsigned int drm_encoder_index(const struct drm_encoder *encoder)
 }
 
 /**
- * drm_encoder_mask - find the mask of a registered ENCODER
+ * drm_encoder_mask - find the mask of a registered encoder
  * @encoder: encoder to find mask for
  *
- * Given a registered encoder, return the mask bit of that encoder for an
- * encoder's possible_clones field.
+ * Returns:
+ * A bit mask with the nth bit set, where n is the index of the encoder. Take
+ * care when using this, as the DRM UAPI only allows for 32 bit encoder masks
+ * while internally encoder masks are 64 bits.
  */
-static inline u32 drm_encoder_mask(const struct drm_encoder *encoder)
+static inline u64 drm_encoder_mask(const struct drm_encoder *encoder)
 {
 	return 1 << drm_encoder_index(encoder);
 }
-- 
2.21.0

From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: [PATCHv2 1/6] drm/i2c/ch7006: Fix some sparse warnings.
Date: Mon, 17 Aug 2009 17:24:18 +0200
Message-ID: <1250522663-18672-1-git-send-email-currojerez@riseup.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


Signed-off-by: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
---
 drivers/gpu/drm/i2c/ch7006_drv.c  |    2 +-
 drivers/gpu/drm/i2c/ch7006_mode.c |    2 +-
 drivers/gpu/drm/i2c/ch7006_priv.h |    5 ++---
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i2c/ch7006_drv.c b/drivers/gpu/drm/i2c/ch7006_drv.c
index c2594a1..7df4b86 100644
--- a/drivers/gpu/drm/i2c/ch7006_drv.c
+++ b/drivers/gpu/drm/i2c/ch7006_drv.c
@@ -351,7 +351,7 @@ static int ch7006_encoder_set_property(struct drm_encoder *encoder,
 	return 0;
 }
 
-struct drm_encoder_slave_funcs ch7006_encoder_funcs = {
+static struct drm_encoder_slave_funcs ch7006_encoder_funcs = {
 	.set_config = ch7006_encoder_set_config,
 	.destroy = ch7006_encoder_destroy,
 	.dpms = ch7006_encoder_dpms,
diff --git a/drivers/gpu/drm/i2c/ch7006_mode.c b/drivers/gpu/drm/i2c/ch7006_mode.c
index e8f6db3..7ffe0bd 100644
--- a/drivers/gpu/drm/i2c/ch7006_mode.c
+++ b/drivers/gpu/drm/i2c/ch7006_mode.c
@@ -330,7 +330,7 @@ void ch7006_setup_properties(struct drm_encoder *encoder)
 	struct drm_display_mode *mode = &ch_mode->mode;
 	uint8_t *regs = state->regs;
 	int flicker, contrast, hpos, vpos;
-	fixed scale, aspect;
+	uint64_t scale, aspect;
 
 	flicker = interpolate(0, 2, 3, priv->flicker);
 	regs[CH7006_FFILTER] = bitf(CH7006_FFILTER_TEXT, flicker) |
diff --git a/drivers/gpu/drm/i2c/ch7006_priv.h b/drivers/gpu/drm/i2c/ch7006_priv.h
index 608ddab..7ebb073 100644
--- a/drivers/gpu/drm/i2c/ch7006_priv.h
+++ b/drivers/gpu/drm/i2c/ch7006_priv.h
@@ -141,9 +141,8 @@ void ch7006_state_save(struct i2c_client *client,
 #define bitf(bitfield, x) __bitf(bitfield, x)
 #define bitfs(bitfield, s) __bitf(bitfield, bitfield##_##s)
 #define setbitf(state, reg, bitfield, x)				\
-	state->regs[reg] = (state->regs[reg] &				\
-			    (typeof(*state->regs)) ~mask(reg##_##bitfield)) | \
-			    bitf(reg##_##bitfield, x)
+	state->regs[reg] = (state->regs[reg] & ~mask(reg##_##bitfield))	\
+		| bitf(reg##_##bitfield, x)
 
 #define __unbitf(src, bitfield, x) ((x & __mask(src, bitfield)) \
 				    >> (0?bitfield) << (src))
-- 
1.6.3.3

From: James Jones <jajones-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v4] drm/nouveau: Accept 'legacy' format modifiers
Date: Thu, 30 Jul 2020 16:58:23 -0700
Message-ID: <20200730235823.2015-1-jajones@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "Kirill A . Shutemov" <kirill-oKw7cIdHH8eLwutG50LtGA@public.gmane.org>
Cc: Nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Accept the DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK()
family of modifiers to handle broken userspace
Xorg modesetting and Mesa drivers. Existing Mesa
drivers are still aware of only these older
format modifiers which do not differentiate
between different variations of the block linear
layout. When the format modifier support flag was
flipped in the nouveau kernel driver, the X.org
modesetting driver began attempting to use its
format modifier-enabled framebuffer path. Because
the set of format modifiers advertised by the
kernel prior to this change do not intersect with
the set of format modifiers advertised by Mesa,
allocating GBM buffers using format modifiers
fails and the modesetting driver falls back to
non-modifier allocation. However, it still later
queries the modifier of the GBM buffer when
creating its DRM-KMS framebuffer object, receives
the old-format modifier from Mesa, and attempts
to create a framebuffer with it. Since the kernel
is still not aware of these formats, this fails.

Userspace should not be attempting to query format
modifiers of GBM buffers allocated with a non-
format-modifier-aware allocation path, but to
avoid breaking existing userspace behavior, this
change accepts the old-style format modifiers when
creating framebuffers and applying them to planes
by translating them to the equivalent new-style
modifier. To accomplish this, some layout
parameters must be assumed to match properties of
the device targeted by the relevant ioctls. To
avoid perpetuating misuse of the old-style
modifiers, this change does not advertise support
for them. Doing so would imply compatibility
between devices with incompatible memory layouts.

Tested with Xorg 1.20 modesetting driver,
weston@c46c70dac84a4b3030cd05b380f9f410536690fc,
gnome & KDE wayland desktops from Ubuntu 18.04,
and sway 1.5

Reported-by: Kirill A. Shutemov <kirill-oKw7cIdHH8eLwutG50LtGA@public.gmane.org>
Fixes: fa4f4c213f5f ("drm/nouveau/kms: Support NVIDIA format modifiers")
Link: https://lkml.org/lkml/2020/6/30/1251
Signed-off-by: James Jones <jajones-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_display.c | 27 +++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
index 496c4621cc78..07373bbc2acf 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.c
+++ b/drivers/gpu/drm/nouveau/nouveau_display.c
@@ -191,6 +191,7 @@ nouveau_decode_mod(struct nouveau_drm *drm,
 		   uint32_t *tile_mode,
 		   uint8_t *kind)
 {
+	struct nouveau_display *disp = nouveau_display(drm->dev);
 	BUG_ON(!tile_mode || !kind);
 
 	if (modifier == DRM_FORMAT_MOD_LINEAR) {
@@ -202,6 +203,12 @@ nouveau_decode_mod(struct nouveau_drm *drm,
 		 * Extract the block height and kind from the corresponding
 		 * modifier fields.  See drm_fourcc.h for details.
 		 */
+
+		if ((modifier & (0xffull << 12)) == 0ull) {
+			/* Legacy modifier.  Translate to this dev's 'kind.' */
+			modifier |= disp->format_modifiers[0] & (0xffull << 12);
+		}
+
 		*tile_mode = (uint32_t)(modifier & 0xF);
 		*kind = (uint8_t)((modifier >> 12) & 0xFF);
 
@@ -227,6 +234,16 @@ nouveau_framebuffer_get_layout(struct drm_framebuffer *fb,
 	}
 }
 
+static const u64 legacy_modifiers[] = {
+	DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(0),
+	DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(1),
+	DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(2),
+	DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(3),
+	DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(4),
+	DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(5),
+	DRM_FORMAT_MOD_INVALID
+};
+
 static int
 nouveau_validate_decode_mod(struct nouveau_drm *drm,
 			    uint64_t modifier,
@@ -247,8 +264,14 @@ nouveau_validate_decode_mod(struct nouveau_drm *drm,
 	     (disp->format_modifiers[mod] != modifier);
 	     mod++);
 
-	if (disp->format_modifiers[mod] == DRM_FORMAT_MOD_INVALID)
-		return -EINVAL;
+	if (disp->format_modifiers[mod] == DRM_FORMAT_MOD_INVALID) {
+		for (mod = 0;
+		     (legacy_modifiers[mod] != DRM_FORMAT_MOD_INVALID) &&
+		     (legacy_modifiers[mod] != modifier);
+		     mod++);
+		if (legacy_modifiers[mod] == DRM_FORMAT_MOD_INVALID)
+			return -EINVAL;
+	}
 
 	nouveau_decode_mod(drm, modifier, tile_mode, kind);
 
-- 
2.17.1

From: Robert Foss <robert.foss@collabora.com>
Subject: [PATCH v4 1/2] drm/blend: Fix comment typ-o
Date: Fri, 19 May 2017 16:50:16 -0400
Message-ID: <20170519205017.23307-1-robert.foss@collabora.com>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: liviu.dudau@arm.com, brian.starkey@arm.com, malidp@foss.arm.com, airlied@linux.ie, linux@armlinux.org.uk, boris.brezillon@free-electrons.com, daniel.vetter@intel.com, jani.nikula@linux.intel.com, seanpaul@chromium.org, p.zabel@pengutronix.de, robdclark@gmail.com, bskeggs@redhat.com, tomi.valkeinen@ti.com, linux-graphics-maintainer@vmware.com, syeh@vmware.com, thellstrom@vmware.com, architt@codeaurora.org, ville.syrjala@linux.intel.com, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Emil Velikov <emil.l.velikov@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, =?UTF-8?q?Kristian=20H=C3=B8g
Cc: Robert Foss <robert.foss@collabora.com>
List-Id: nouveau.vger.kernel.org

Fix DRM_REFELCT_Y -> DRM_REFLECT_Y.

Signed-off-by: Robert Foss <robert.foss@collabora.com>
---
 drivers/gpu/drm/drm_blend.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
index a0d0d6843288..dee67ef6c670 100644
--- a/drivers/gpu/drm/drm_blend.c
+++ b/drivers/gpu/drm/drm_blend.c
@@ -129,7 +129,7 @@
  * 	"rotate-270"
  * DRM_REFLECT_X:
  * 	"reflect-x"
- * DRM_REFELCT_Y:
+ * DRM_REFLECT_Y:
  * 	"reflect-y"
  *
  * Rotation is the specified amount in degrees in counter clockwise direction,
-- 
2.11.0.453.g787f75f05

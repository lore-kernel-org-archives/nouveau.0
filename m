From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v4 01/22] drm: Remove internal setup of struct drm_device.vblank_disable_immediate
Date: Thu, 23 Jan 2020 14:59:22 +0100
Message-ID: <20200123135943.24140-2-tzimmermann@suse.de>
References: <20200123135943.24140-1-tzimmermann@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20200123135943.24140-1-tzimmermann@suse.de>
Sender: linux-arm-msm-owner@vger.kernel.org
To: airlied@linux.ie, daniel@ffwll.ch, alexander.deucher@amd.com, christian.koenig@amd.com, David1.Zhou@amd.com, maarten.lankhorst@linux.intel.com, patrik.r.jakobsson@gmail.com, robdclark@gmail.com, sean@poorly.run, benjamin.gaignard@linaro.org, vincent.abriou@st.com, yannick.fertre@st.com, philippe.cornu@st.com, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com, eric@anholt.net, rodrigosiqueiramelo@gmail.com, hamohammed.sa@gmail.com, linux-graphics-maintainer@vmware.com, thellstrom@vmware.com, bskeggs@redhat.com, harry.wentland@amd.com, sunpeng.li@amd.com, jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>, =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
List-Id: nouveau.vger.kernel.org

VBLANK interrupts can be disabled immediately or with a delay, where the
latter is the default. The former option can be selected by setting
get_vblank_timestamp and enabling vblank_disable_immediate in struct
drm_device. Simplify the code in preparation of the removal of struct
drm_device.get_vblank_timestamp.

v3:
	* remove internal setup of vblank_disable_immediate

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_vblank.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index 1659b13b178c..326db52f2ad8 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -480,19 +480,6 @@ int drm_vblank_init(struct drm_device *dev, unsigned int num_crtcs)
 
 	DRM_INFO("Supports vblank timestamp caching Rev 2 (21.10.2013).\n");
 
-	/* Driver specific high-precision vblank timestamping supported? */
-	if (dev->driver->get_vblank_timestamp)
-		DRM_INFO("Driver supports precise vblank timestamp query.\n");
-	else
-		DRM_INFO("No driver support for vblank timestamp query.\n");
-
-	/* Must have precise timestamping for reliable vblank instant disable */
-	if (dev->vblank_disable_immediate && !dev->driver->get_vblank_timestamp) {
-		dev->vblank_disable_immediate = false;
-		DRM_INFO("Setting vblank_disable_immediate to false because "
-			 "get_vblank_timestamp == NULL\n");
-	}
-
 	return 0;
 
 err:
-- 
2.24.1

From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: [PATCH 02/12] drm: Add more standard TV properties.
Date: Wed, 12 Aug 2009 02:14:58 +0200
Message-ID: <1250036108-28655-3-git-send-email-currojerez@riseup.net>
References: <1250036108-28655-1-git-send-email-currojerez@riseup.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1250036108-28655-1-git-send-email-currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
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

Overscan, saturation, hue. Used in the nouveau driver for GPUs with
integrated TV encoders.

Signed-off-by: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
---
 drivers/gpu/drm/drm_crtc.c |   18 ++++++++++++++++++
 include/drm/drm_crtc.h     |    3 +++
 2 files changed, 21 insertions(+), 0 deletions(-)

diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
index a8c8311..362a538 100644
--- a/drivers/gpu/drm/drm_crtc.c
+++ b/drivers/gpu/drm/drm_crtc.c
@@ -736,6 +736,24 @@ int drm_mode_create_tv_properties(struct drm_device *dev, int num_modes,
 	dev->mode_config.tv_flicker_reduction_property->values[0] = 0;
 	dev->mode_config.tv_flicker_reduction_property->values[1] = 100;
 
+	dev->mode_config.tv_overscan_property =
+		drm_property_create(dev, DRM_MODE_PROP_RANGE,
+				    "overscan", 2);
+	dev->mode_config.tv_overscan_property->values[0] = 0;
+	dev->mode_config.tv_overscan_property->values[1] = 100;
+
+	dev->mode_config.tv_saturation_property =
+		drm_property_create(dev, DRM_MODE_PROP_RANGE,
+				    "saturation", 2);
+	dev->mode_config.tv_saturation_property->values[0] = 0;
+	dev->mode_config.tv_saturation_property->values[1] = 100;
+
+	dev->mode_config.tv_hue_property =
+		drm_property_create(dev, DRM_MODE_PROP_RANGE,
+				    "hue", 2);
+	dev->mode_config.tv_hue_property->values[0] = 0;
+	dev->mode_config.tv_hue_property->values[1] = 100;
+
 	return 0;
 }
 EXPORT_SYMBOL(drm_mode_create_tv_properties);
diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
index 5f2cc0c..db92a83 100644
--- a/include/drm/drm_crtc.h
+++ b/include/drm/drm_crtc.h
@@ -575,6 +575,9 @@ struct drm_mode_config {
 	struct drm_property *tv_brightness_property;
 	struct drm_property *tv_contrast_property;
 	struct drm_property *tv_flicker_reduction_property;
+	struct drm_property *tv_overscan_property;
+	struct drm_property *tv_saturation_property;
+	struct drm_property *tv_hue_property;
 
 	/* Optional properties */
 	struct drm_property *scaling_mode_property;
-- 
1.6.3.3

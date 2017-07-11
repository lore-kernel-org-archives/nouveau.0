From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH v2 01/12] drm/nouveau: Fix error handling in nv50_disp_atomic_commit
Date: Tue, 11 Jul 2017 16:33:03 +0200
Message-ID: <20170711143314.2148-2-maarten.lankhorst@linux.intel.com>
References: <20170711143314.2148-1-maarten.lankhorst@linux.intel.com>
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20170711143314.2148-1-maarten.lankhorst@linux.intel.com>
Sender: stable-owner@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Ben Skeggs <bskeggs@redhat.com>, nouveau@lists.freedesktop.org, "# v4 . 10+" <stable@vger.kernel.org>
List-Id: nouveau.vger.kernel.org

Make it more clear that post commit return ret is really return 0,

and add a missing drm_atomic_helper_cleanup_planes when
drm_atomic_helper_wait_for_fences fails.

Fixes: 839ca903f12e ("drm/nouveau/kms/nv50: transition to atomic interfaces internally")
Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v4.10+
Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/nouveau/nv50_display.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nv50_display.c b/drivers/gpu/drm/nouveau/nv50_display.c
index 42a85c14aea0..8fb55b96c40f 100644
--- a/drivers/gpu/drm/nouveau/nv50_display.c
+++ b/drivers/gpu/drm/nouveau/nv50_display.c
@@ -4119,7 +4119,7 @@ nv50_disp_atomic_commit(struct drm_device *dev,
 	if (!nonblock) {
 		ret = drm_atomic_helper_wait_for_fences(dev, state, true);
 		if (ret)
-			goto done;
+			goto err_cleanup;
 	}
 
 	for_each_plane_in_state(state, plane, plane_state, i) {
@@ -4147,7 +4147,7 @@ nv50_disp_atomic_commit(struct drm_device *dev,
 		if (crtc->state->enable) {
 			if (!drm->have_disp_power_ref) {
 				drm->have_disp_power_ref = true;
-				return ret;
+				return 0;
 			}
 			active = true;
 			break;
@@ -4158,7 +4158,10 @@ nv50_disp_atomic_commit(struct drm_device *dev,
 		pm_runtime_put_autosuspend(dev->dev);
 		drm->have_disp_power_ref = false;
 	}
+	goto done;
 
+err_cleanup:
+	drm_atomic_helper_cleanup_planes(dev, state);
 done:
 	pm_runtime_put_autosuspend(dev->dev);
 	return ret;
-- 
2.11.0

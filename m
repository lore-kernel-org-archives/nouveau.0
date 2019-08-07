From: Lyude Paul <lyude@redhat.com>
Subject: [PATCH 1/2] drm/nouveau/dispnv04: Grab/put runtime PM refs on DPMS on/off
Date: Wed,  7 Aug 2019 17:33:00 -0400
Message-ID: <20190807213304.9255-2-lyude@redhat.com>
References: <20190807213304.9255-1-lyude@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190807213304.9255-1-lyude@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: nouveau@lists.freedesktop.org
Cc: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

The code claims to grab a runtime PM ref when at least one CRTC is
active, but that's not actually the case as we grab a runtime PM ref
whenever a CRTC is enabled regardless of it's DPMS state. Meaning that
we can end up keeping the GPU awake when there are no screens enabled,
something we don't really want to do.

Note that we fixed this same issue for nv50 a while ago in:

commit e5d54f193572 ("drm/nouveau/drm/nouveau: Fix runtime PM leak in
nv50_disp_atomic_commit()")

Since we're about to remove nouveau_drm->have_disp_power_ref in the next
commit, let's also simplify the RPM code here while we're at it: grab a
ref during a modeset, grab additional RPM refs for each CRTC enabled by
said modeset, and drop an RPM ref for each CRTC disabled by said
modeset. This allows us to keep the GPU awake whenever screens are
turned on, without needing to use nouveau_drm->have_disp_power_ref.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv04/crtc.c | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv04/crtc.c b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
index f22f01020625..08ad8e3b9cd2 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/crtc.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
@@ -183,6 +183,10 @@ nv_crtc_dpms(struct drm_crtc *crtc, int mode)
 		return;
 
 	nv_crtc->last_dpms = mode;
+	if (mode == DRM_MODE_DPMS_ON)
+		pm_runtime_get_noresume(dev->dev);
+	else
+		pm_runtime_put_noidle(dev->dev);
 
 	if (nv_two_heads(dev))
 		NVSetOwner(dev, nv_crtc->index);
@@ -1045,7 +1049,6 @@ nouveau_crtc_set_config(struct drm_mode_set *set,
 
 	dev = set->crtc->dev;
 
-	/* get a pm reference here */
 	ret = pm_runtime_get_sync(dev->dev);
 	if (ret < 0 && ret != -EACCES)
 		return ret;
@@ -1061,19 +1064,6 @@ nouveau_crtc_set_config(struct drm_mode_set *set,
 	}
 
 	pm_runtime_mark_last_busy(dev->dev);
-	/* if we have active crtcs and we don't have a power ref,
-	   take the current one */
-	if (active && !drm->have_disp_power_ref) {
-		drm->have_disp_power_ref = true;
-		return ret;
-	}
-	/* if we have no active crtcs, then drop the power ref
-	   we got before */
-	if (!active && drm->have_disp_power_ref) {
-		pm_runtime_put_autosuspend(dev->dev);
-		drm->have_disp_power_ref = false;
-	}
-	/* drop the power reference we got coming in here */
 	pm_runtime_put_autosuspend(dev->dev);
 	return ret;
 }
-- 
2.21.0

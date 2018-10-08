From: Lyude Paul <lyude@redhat.com>
Subject: [PATCH v5 5/5] drm/i915: Fix intel_dp_mst_best_encoder()
Date: Mon,  8 Oct 2018 18:39:21 -0400
Message-ID: <20181008223924.1103-6-lyude@redhat.com>
References: <20181008223924.1103-1-lyude@redhat.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181008223924.1103-1-lyude@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: intel-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: stable@vger.kernel.org, Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

Currently, i915 appears to rely on blocking modesets on
no-longer-present MSTB ports by simply returning NULL for
->best_encoder(), which in turn causes any new atomic commits that don't
disable the CRTC to fail. This is wrong however, since we still want to
allow userspace to disable CRTCs on no-longer-present MSTB ports by
changing the DPMS state to off and this still requires that we retrieve
an encoder.

So, fix this by always returning a valid encoder regardless of the state
of the MST port.

Changes since v1:
- Remove mst atomic helper, since this got replaced with a much simpler
  solution

Signed-off-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: stable@vger.kernel.org
---
 drivers/gpu/drm/i915/intel_dp_mst.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/intel_dp_mst.c b/drivers/gpu/drm/i915/intel_dp_mst.c
index 0f14c0d1669c..7f155b4f1a7d 100644
--- a/drivers/gpu/drm/i915/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/intel_dp_mst.c
@@ -404,8 +404,6 @@ static struct drm_encoder *intel_mst_atomic_best_encoder(struct drm_connector *c
 	struct intel_dp *intel_dp = intel_connector->mst_port;
 	struct intel_crtc *crtc = to_intel_crtc(state->crtc);
 
-	if (!READ_ONCE(connector->registered))
-		return NULL;
 	return &intel_dp->mst_encoders[crtc->pipe]->base.base;
 }
 
-- 
2.17.1

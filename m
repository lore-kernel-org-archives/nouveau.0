From: Lyude Paul <lyude@redhat.com>
Subject: [PATCH v4 2/5] drm/nouveau: Fix nv50_mstc->best_encoder()
Date: Thu,  4 Oct 2018 20:29:51 -0400
Message-ID: <20181005002956.7317-3-lyude@redhat.com>
References: <20181005002956.7317-1-lyude@redhat.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181005002956.7317-1-lyude@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>, stable@vger.kernel.org, Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, Thierry Reding <treding@nvidia.com>, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

As mentioned in the previous commit, we currently prevent new modesets
on recently-removed MST connectors by returning no encoder from our
->best_encoder() callback once the MST port has disappeared. This is
wrong however, because it prevents legacy modesetting users from being
able to disable CRTCs on MST connectors after the connector's respective
topology has disappeared.

So, fix this by instead by just always returning a valid encoder.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Cc: stable@vger.kernel.org

Changes since v2:
- Remove usage of atomic MST helper for now, since that got replaced
  with a much simpler solution

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 5691dfa1db6f..63a23a80f279 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -843,22 +843,16 @@ nv50_mstc_atomic_best_encoder(struct drm_connector *connector,
 {
 	struct nv50_head *head = nv50_head(connector_state->crtc);
 	struct nv50_mstc *mstc = nv50_mstc(connector);
-	if (mstc->port) {
-		struct nv50_mstm *mstm = mstc->mstm;
-		return &mstm->msto[head->base.index]->encoder;
-	}
-	return NULL;
+
+	return &mstc->mstm->msto[head->base.index]->encoder;
 }
 
 static struct drm_encoder *
 nv50_mstc_best_encoder(struct drm_connector *connector)
 {
 	struct nv50_mstc *mstc = nv50_mstc(connector);
-	if (mstc->port) {
-		struct nv50_mstm *mstm = mstc->mstm;
-		return &mstm->msto[0]->encoder;
-	}
-	return NULL;
+
+	return &mstc->mstm->msto[0]->encoder;
 }
 
 static enum drm_mode_status
-- 
2.17.1

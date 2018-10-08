From: Lyude Paul <lyude@redhat.com>
Subject: [PATCH v7 2/5] drm/nouveau: Fix nv50_mstc->best_encoder()
Date: Mon,  8 Oct 2018 19:24:31 -0400
Message-ID: <20181008232437.5571-3-lyude@redhat.com>
References: <20181008232437.5571-1-lyude@redhat.com>
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20181008232437.5571-1-lyude@redhat.com>
Sender: stable-owner@vger.kernel.org
To: intel-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: stable@vger.kernel.org, Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>, =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, Thierry Reding <treding@nvidia.com>, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

As mentioned in the previous commit, we currently prevent new modesets
on recently-removed MST connectors by returning no encoder from our
->best_encoder() callback once the MST port has disappeared. This is
wrong however, because it prevents legacy modesetting users from being
able to disable CRTCs on MST connectors after the connector's respective
topology has disappeared.

So, fix this by instead by just always returning a valid encoder.

Changes since v2:
- Remove usage of atomic MST helper for now, since that got replaced
  with a much simpler solution

Signed-off-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: stable@vger.kernel.org
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 9f32b10c7c29..31b94bc9ec90 100644
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

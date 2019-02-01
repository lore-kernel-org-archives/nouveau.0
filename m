From: Lyude Paul <lyude@redhat.com>
Subject: [PATCH v2 4/4] drm/nouveau: Move PBN and VCPI allocation into nv50_head_atom
Date: Thu, 31 Jan 2019 20:14:51 -0500
Message-ID: <20190201011506.21055-5-lyude@redhat.com>
References: <20190201011506.21055-1-lyude@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190201011506.21055-1-lyude@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Cc: Daniel Vetter <daniel@ffwll.ch>, Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Ilia Mirkin <imirkin@alum.mit.edu>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

Atomic checks should never modify anything outside of the state that
they're passed in. Unfortunately this appears to be exactly what we're
doing in nv50_msto_atomic_check() where we update mstc->pbn every time
the function is called. This hasn't caused any bugs yet, but it needs to
be fixed in order to ensure that when committing an artificially
duplicated state (like during system resume), that we reuse the PBN of
that state to perform VCPI allocations and don't recalculate a different
value from the drm connector's reported bpc.

Also, move the VCPI slot allocations while we're at it as well. With
this, removing a topology in suspend while using nouveau no longer
causes the new atomic VCPI helpers to complain.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Fixes: eceae1472467 ("drm/dp_mst: Start tracking per-port VCPI allocations")
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 drivers/gpu/drm/nouveau/dispnv50/atom.h |  6 ++++++
 drivers/gpu/drm/nouveau/dispnv50/disp.c | 28 +++++++++++++++----------
 drivers/gpu/drm/nouveau/dispnv50/head.c |  1 +
 3 files changed, 24 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/atom.h b/drivers/gpu/drm/nouveau/dispnv50/atom.h
index a194990d2b0d..b5fae5ab3fa8 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/atom.h
+++ b/drivers/gpu/drm/nouveau/dispnv50/atom.h
@@ -116,6 +116,12 @@ struct nv50_head_atom {
 		u8 depth:4;
 	} or;
 
+	/* Currently only used for MST */
+	struct {
+		int pbn;
+		u8 tu:6;
+	} dp;
+
 	union nv50_head_atom_mask {
 		struct {
 			bool olut:1;
diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 60d858c2f2ce..e8bb35f6d015 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -659,8 +659,6 @@ struct nv50_mstc {
 
 	struct drm_display_mode *native;
 	struct edid *edid;
-
-	int pbn;
 };
 
 struct nv50_msto {
@@ -765,17 +763,26 @@ nv50_msto_atomic_check(struct drm_encoder *encoder,
 	struct drm_connector *connector = conn_state->connector;
 	struct nv50_mstc *mstc = nv50_mstc(connector);
 	struct nv50_mstm *mstm = mstc->mstm;
-	int bpp = connector->display_info.bpc * 3;
+	struct nv50_head_atom *asyh = nv50_head_atom(crtc_state);
 	int slots;
 
-	mstc->pbn = drm_dp_calc_pbn_mode(crtc_state->adjusted_mode.clock,
-					 bpp);
+	/* When restoring duplicated states, we need to make sure that the
+	 * bw remains the same and avoid recalculating it, as the connector's
+	 * bpc may have changed after the state was duplicated
+	 */
+	if (!state->duplicated)
+		asyh->dp.pbn =
+			drm_dp_calc_pbn_mode(crtc_state->adjusted_mode.clock,
+					     connector->display_info.bpc * 3);
 
 	if (drm_atomic_crtc_needs_modeset(crtc_state)) {
 		slots = drm_dp_atomic_find_vcpi_slots(state, &mstm->mgr,
-						      mstc->port, mstc->pbn);
+						      mstc->port,
+						      asyh->dp.pbn);
 		if (slots < 0)
 			return slots;
+
+		asyh->dp.tu = slots;
 	}
 
 	return nv50_outp_atomic_check_view(encoder, crtc_state, conn_state,
@@ -786,13 +793,13 @@ static void
 nv50_msto_enable(struct drm_encoder *encoder)
 {
 	struct nv50_head *head = nv50_head(encoder->crtc);
+	struct nv50_head_atom *armh = nv50_head_atom(head->base.base.state);
 	struct nv50_msto *msto = nv50_msto(encoder);
 	struct nv50_mstc *mstc = NULL;
 	struct nv50_mstm *mstm = NULL;
 	struct drm_connector *connector;
 	struct drm_connector_list_iter conn_iter;
 	u8 proto, depth;
-	int slots;
 	bool r;
 
 	drm_connector_list_iter_begin(encoder->dev, &conn_iter);
@@ -808,8 +815,8 @@ nv50_msto_enable(struct drm_encoder *encoder)
 	if (WARN_ON(!mstc))
 		return;
 
-	slots = drm_dp_find_vcpi_slots(&mstm->mgr, mstc->pbn);
-	r = drm_dp_mst_allocate_vcpi(&mstm->mgr, mstc->port, mstc->pbn, slots);
+	r = drm_dp_mst_allocate_vcpi(&mstm->mgr, mstc->port, armh->dp.pbn,
+				     armh->dp.tu);
 	WARN_ON(!r);
 
 	if (!mstm->links++)
@@ -827,8 +834,7 @@ nv50_msto_enable(struct drm_encoder *encoder)
 	default: depth = 0x6; break;
 	}
 
-	mstm->outp->update(mstm->outp, head->base.index,
-			   nv50_head_atom(head->base.base.state), proto, depth);
+	mstm->outp->update(mstm->outp, head->base.index, armh, proto, depth);
 
 	msto->head = head;
 	msto->mstc = mstc;
diff --git a/drivers/gpu/drm/nouveau/dispnv50/head.c b/drivers/gpu/drm/nouveau/dispnv50/head.c
index ac97ebce5b35..2e7a0c347ddb 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/head.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/head.c
@@ -413,6 +413,7 @@ nv50_head_atomic_duplicate_state(struct drm_crtc *crtc)
 	asyh->ovly = armh->ovly;
 	asyh->dither = armh->dither;
 	asyh->procamp = armh->procamp;
+	asyh->dp = armh->dp;
 	asyh->clr.mask = 0;
 	asyh->set.mask = 0;
 	return &asyh->state;
-- 
2.20.1

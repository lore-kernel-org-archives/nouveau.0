From: Lyude Paul <lyude@redhat.com>
Subject: [PATCH 2/2] drm/nouveau: Reset MST branching unit before enabling
Date: Thu,  9 Aug 2018 18:22:06 -0400
Message-ID: <20180809222209.26226-3-lyude@redhat.com>
References: <20180809222209.26226-1-lyude@redhat.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180809222209.26226-1-lyude@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: nouveau@lists.freedesktop.org
Cc: stable@vger.kernel.org, Karol Herbst <karolherbst@gmail.com>, Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Ilia Mirkin <imirkin@alum.mit.edu>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

When probing a new MST device, it's not safe to make any assumptions
about it's current state. While most well mannered MST hubs will just
disable the branching unit on hotplug disconnects, this isn't enough to
save us from various other scenarios that might have resulted in
something writing to the MST branching unit before we got control of it.
This could happen if a previous probe we tried failed, if we're booting
in kexec context and the hub is still in the state the last kernel put
it in, etc.

Luckily; there is no reason we can't just reset the branching unit
every time we enable a new topology. So, fix this by resetting it on
enabling new topologies to ensure that we always start off with a clean,
unmodified topology state on MST sinks.

This fixes occasional hard-lockups on my P50's laptop dock (e.g. AUX
times out all DPCD trasactions) observed after multiple docks, undocks,
and module reloads.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Cc: stable@vger.kernel.org
Cc: Karol Herbst <karolherbst@gmail.com>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index cdb3ef7c5d86..61bc36e9c915 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -1098,17 +1098,21 @@ nv50_mstm_enable(struct nv50_mstm *mstm, u8 dpcd, int state)
 	int ret;
 
 	if (dpcd >= 0x12) {
-		ret = drm_dp_dpcd_readb(mstm->mgr.aux, DP_MSTM_CTRL, &dpcd);
+		/* Even if we're enabling MST, start with disabling the
+		 * branching unit to clear any sink-side MST topology state
+		 * that wasn't set by us
+		 */
+		ret = drm_dp_dpcd_writeb(mstm->mgr.aux, DP_MSTM_CTRL, 0);
 		if (ret < 0)
 			return ret;
 
-		dpcd &= ~DP_MST_EN;
-		if (state)
-			dpcd |= DP_MST_EN;
-
-		ret = drm_dp_dpcd_writeb(mstm->mgr.aux, DP_MSTM_CTRL, dpcd);
-		if (ret < 0)
-			return ret;
+		if (state) {
+			/* Now, start initializing */
+			ret = drm_dp_dpcd_writeb(mstm->mgr.aux, DP_MSTM_CTRL,
+						 DP_MST_EN);
+			if (ret < 0)
+				return ret;
+		}
 	}
 
 	return nvif_mthd(disp, 0, &args, sizeof(args));
-- 
2.17.1

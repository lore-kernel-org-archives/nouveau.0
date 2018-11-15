From: Lyude Paul <lyude@redhat.com>
Subject: [PATCH] drm/nouveau: Check rc from drm_dp_mst_topology_mgr_resume()
Date: Wed, 14 Nov 2018 20:39:51 -0500
Message-ID: <20181115013954.587-1-lyude@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <stable-owner@vger.kernel.org>
Sender: stable-owner@vger.kernel.org
To: nouveau@lists.freedesktop.org
Cc: stable@vger.kernel.org, Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>, =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, Sean Paul <seanpaul@chromium.org>, Ilia Mirkin <imirkin@alum.mit.edu>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

We need to actually make sure we check this on resume since otherwise we
won't know whether or not the topology is still there once we've
resumed, which will cause us to still think the topology is connected
even after it's been removed if the removal happens mid-suspend.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Cc: stable@vger.kernel.org
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 6cbbae3f438b..6aa3521b6326 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -1255,8 +1255,16 @@ nv50_mstm_fini(struct nv50_mstm *mstm)
 static void
 nv50_mstm_init(struct nv50_mstm *mstm)
 {
-	if (mstm && mstm->mgr.mst_state)
-		drm_dp_mst_topology_mgr_resume(&mstm->mgr);
+	int ret;
+
+	if (!mstm || !mstm->mgr.mst_state)
+		return;
+
+	ret = drm_dp_mst_topology_mgr_resume(&mstm->mgr);
+	if (ret == -1) {
+		drm_dp_mst_topology_mgr_set_mst(&mstm->mgr, false);
+		drm_kms_helper_hotplug_event(mstm->mgr.dev);
+	}
 }
 
 static void
-- 
2.19.1

From: Lyude Paul <lyude@redhat.com>
Subject: [PATCH] drm/nouveau: Fix memory leak in nv50_mstm_del()
Date: Tue, 11 Dec 2018 18:56:20 -0500
Message-ID: <20181211235622.22859-1-lyude@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: nouveau@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, stable@vger.kernel.org, Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>, Sean Paul <seanpaul@chromium.org>, Ilia Mirkin <imirkin@alum.mit.edu>, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

Noticed this while working on redoing the reference counting scheme in
the DP MST helpers. Nouveau doesn't attempt to call
drm_dp_mst_topology_mgr_destroy() at all, which leaves it leaking all of
the resources for drm_dp_mst_topology_mgr and it's children mstbs+ports.

Fixes: f479c0ba4a17 ("drm/nouveau/kms/nv50: initial support for DP 1.2 multi-stream")
Signed-off-by: Lyude Paul <lyude@redhat.com>
Cc: <stable@vger.kernel.org> # v4.10+
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index d153ea2a08ac..a634b3d0b6a1 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -1254,6 +1254,7 @@ nv50_mstm_del(struct nv50_mstm **pmstm)
 {
 	struct nv50_mstm *mstm = *pmstm;
 	if (mstm) {
+		drm_dp_mst_topology_mgr_destroy(&mstm->mgr);
 		kfree(*pmstm);
 		*pmstm = NULL;
 	}
-- 
2.19.2

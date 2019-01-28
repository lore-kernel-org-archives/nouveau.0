From: Lyude Paul <lyude@redhat.com>
Subject: [PATCH] drm/nouveau: Don't WARN_ON VCPI allocation failures
Date: Mon, 28 Jan 2019 16:03:50 -0500
Message-ID: <20190128210352.18066-1-lyude@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <stable-owner@vger.kernel.org>
Sender: stable-owner@vger.kernel.org
To: nouveau@lists.freedesktop.org
Cc: Ben Skeggs <bskeggs@redhat.com>, dri-devel@lists.freedesktop.org, stable@vger.kernel.org, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Karol Herbst <karolherbst@gmail.com>, Sean Paul <seanpaul@chromium.org>, Ilia Mirkin <imirkin@alum.mit.edu>, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

This is much louder then we want. VCPI allocation failures are quite
normal, since they will happen if any part of the modesetting process is
interrupted by removing the DP MST topology in question. So just print a
debugging message on VCPI failures instead.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Fixes: f479c0ba4a17 ("drm/nouveau/kms/nv50: initial support for DP 1.2 multi-stream")
Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v4.10+
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 2e8a5fd9b262..09a9c747c7bb 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -811,7 +811,8 @@ nv50_msto_enable(struct drm_encoder *encoder)
 
 	slots = drm_dp_find_vcpi_slots(&mstm->mgr, mstc->pbn);
 	r = drm_dp_mst_allocate_vcpi(&mstm->mgr, mstc->port, mstc->pbn, slots);
-	WARN_ON(!r);
+	if (!r)
+		DRM_DEBUG_KMS("Failed to allocate VCPI\n");
 
 	if (!mstm->links++)
 		nv50_outp_acquire(mstm->outp);
-- 
2.20.1

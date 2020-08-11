From: Lyude Paul <lyude@redhat.com>
Subject: [RFC 04/20] drm/nouveau/kms/nv50-: Use macros for DP registers in nouveau_dp.c
Date: Tue, 11 Aug 2020 16:04:41 -0400
Message-ID: <20200811200457.134743-5-lyude@redhat.com>
References: <20200811200457.134743-1-lyude@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200811200457.134743-1-lyude@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, open list <linux-kernel@vger.kernel.org>
List-Id: nouveau.vger.kernel.org

No functional changes.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Ben Skeggs <bskeggs@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_dp.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_dp.c b/drivers/gpu/drm/nouveau/nouveau_dp.c
index 8db9216d52c69..4030806e3522b 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dp.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dp.c
@@ -50,11 +50,13 @@ nouveau_dp_detect(struct nouveau_connector *nv_connector,
 	if (ret != sizeof(dpcd))
 		return ret;
 
-	nv_encoder->dp.link_bw = 27000 * dpcd[1];
-	nv_encoder->dp.link_nr = dpcd[2] & DP_MAX_LANE_COUNT_MASK;
+	nv_encoder->dp.link_bw = 27000 * dpcd[DP_MAX_LINK_RATE];
+	nv_encoder->dp.link_nr =
+		dpcd[DP_MAX_LANE_COUNT] & DP_MAX_LANE_COUNT_MASK;
 
 	NV_DEBUG(drm, "display: %dx%d dpcd 0x%02x\n",
-		 nv_encoder->dp.link_nr, nv_encoder->dp.link_bw, dpcd[0]);
+		 nv_encoder->dp.link_nr, nv_encoder->dp.link_bw,
+		 dpcd[DP_DPCD_REV]);
 	NV_DEBUG(drm, "encoder: %dx%d\n",
 		 nv_encoder->dcb->dpconf.link_nr,
 		 nv_encoder->dcb->dpconf.link_bw);
-- 
2.26.2

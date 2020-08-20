From: Lyude Paul <lyude@redhat.com>
Subject: [RFC v2 01/20] drm/nouveau/kms: Fix some indenting in
 nouveau_dp_detect()
Date: Thu, 20 Aug 2020 14:29:53 -0400
Message-ID: <20200820183012.288794-2-lyude@redhat.com>
References: <20200820183012.288794-1-lyude@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <intel-gfx-bounces@lists.freedesktop.org>
In-Reply-To: <20200820183012.288794-1-lyude@redhat.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org
Cc: David Airlie <airlied@linux.ie>, Ben Skeggs <bskeggs@redhat.com>, open list <linux-kernel@vger.kernel.org>
List-Id: nouveau.vger.kernel.org

Signed-off-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Ben Skeggs <bskeggs@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_dp.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_dp.c b/drivers/gpu/drm/nouveau/nouveau_dp.c
index 8a0f7994e1aeb..ee778ddc95fae 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dp.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dp.c
@@ -76,10 +76,10 @@ nouveau_dp_detect(struct nouveau_encoder *nv_encoder)
 	nv_encoder->dp.link_nr = dpcd[2] & DP_MAX_LANE_COUNT_MASK;
 
 	NV_DEBUG(drm, "display: %dx%d dpcd 0x%02x\n",
-		     nv_encoder->dp.link_nr, nv_encoder->dp.link_bw, dpcd[0]);
+		 nv_encoder->dp.link_nr, nv_encoder->dp.link_bw, dpcd[0]);
 	NV_DEBUG(drm, "encoder: %dx%d\n",
-		     nv_encoder->dcb->dpconf.link_nr,
-		     nv_encoder->dcb->dpconf.link_bw);
+		 nv_encoder->dcb->dpconf.link_nr,
+		 nv_encoder->dcb->dpconf.link_bw);
 
 	if (nv_encoder->dcb->dpconf.link_nr < nv_encoder->dp.link_nr)
 		nv_encoder->dp.link_nr = nv_encoder->dcb->dpconf.link_nr;
@@ -87,7 +87,7 @@ nouveau_dp_detect(struct nouveau_encoder *nv_encoder)
 		nv_encoder->dp.link_bw = nv_encoder->dcb->dpconf.link_bw;
 
 	NV_DEBUG(drm, "maximum: %dx%d\n",
-		     nv_encoder->dp.link_nr, nv_encoder->dp.link_bw);
+		 nv_encoder->dp.link_nr, nv_encoder->dp.link_bw);
 
 	nouveau_dp_probe_oui(dev, aux, dpcd);
 
-- 
2.26.2

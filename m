From: Lyude Paul <lyude@redhat.com>
Subject: [RFC 03/20] drm/nouveau/kms/nv50-: Just use drm_dp_dpcd_read() in nouveau_dp.c
Date: Tue, 11 Aug 2020 16:04:40 -0400
Message-ID: <20200811200457.134743-4-lyude@redhat.com>
References: <20200811200457.134743-1-lyude@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200811200457.134743-1-lyude@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, open list <linux-kernel@vger.kernel.org>
List-Id: nouveau.vger.kernel.org

Since this actually logs accesses, we should probably always be using
this imho…

Signed-off-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Ben Skeggs <bskeggs@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_dp.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_dp.c b/drivers/gpu/drm/nouveau/nouveau_dp.c
index c4e9c21d4dd2b..8db9216d52c69 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dp.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dp.c
@@ -42,16 +42,12 @@ nouveau_dp_detect(struct nouveau_connector *nv_connector,
 {
 	struct drm_device *dev = nv_encoder->base.base.dev;
 	struct nouveau_drm *drm = nouveau_drm(dev);
-	struct nvkm_i2c_aux *aux;
-	u8 dpcd[8];
+	struct drm_dp_aux *aux = &nv_connector->aux;
+	u8 dpcd[DP_RECEIVER_CAP_SIZE];
 	int ret;
 
-	aux = nv_encoder->aux;
-	if (!aux)
-		return -ENODEV;
-
-	ret = nvkm_rdaux(aux, DP_DPCD_REV, dpcd, sizeof(dpcd));
-	if (ret)
+	ret = drm_dp_dpcd_read(aux, DP_DPCD_REV, dpcd, DP_RECEIVER_CAP_SIZE);
+	if (ret != sizeof(dpcd))
 		return ret;
 
 	nv_encoder->dp.link_bw = 27000 * dpcd[1];
-- 
2.26.2

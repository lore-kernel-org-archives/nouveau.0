From: Lyude Paul <lyude@redhat.com>
Subject: [PATCH 5/5] drm/nouveau: Grab RPM ref when aux bus is in use
Date: Mon, 16 Jul 2018 19:59:29 -0400
Message-ID: <20180716235936.11268-6-lyude@redhat.com>
References: <20180716235936.11268-1-lyude@redhat.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180716235936.11268-1-lyude@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: nouveau@lists.freedesktop.org
Cc: Karol Herbst <karolherbst@gmail.com>, stable@vger.kernel.org, Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

DP AUX busses can both be accessed by DRM, and through any of the
userspace dev nodes in /dev/drm_dp_auxN. We need to make sure the GPU
stays on in all of these codepaths.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Cc: Karol Herbst <karolherbst@gmail.com>
Cc: stable@vger.kernel.org
---
 drivers/gpu/drm/nouveau/nvkm/subdev/i2c/aux.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/aux.c b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/aux.c
index 4c1f547da463..6276b113065c 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/aux.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/aux.c
@@ -98,18 +98,28 @@ nvkm_i2c_aux_release(struct nvkm_i2c_aux *aux)
 	AUX_TRACE(aux, "release");
 	nvkm_i2c_pad_release(pad);
 	mutex_unlock(&aux->mutex);
+	pm_runtime_put_autosuspend(pad->i2c->subdev.device->dev);
 }
 
 int
 nvkm_i2c_aux_acquire(struct nvkm_i2c_aux *aux)
 {
 	struct nvkm_i2c_pad *pad = aux->pad;
+	struct device *dev = pad->i2c->subdev.device->dev;
 	int ret;
+
 	AUX_TRACE(aux, "acquire");
+
+	ret = pm_runtime_get_sync(dev);
+	if (ret < 0 && ret != -EACCES)
+		return ret;
+
 	mutex_lock(&aux->mutex);
 	ret = nvkm_i2c_pad_acquire(pad, NVKM_I2C_PAD_AUX);
-	if (ret)
+	if (ret) {
 		mutex_unlock(&aux->mutex);
+		pm_runtime_put_autosuspend(dev);
+	}
 	return ret;
 }
 
-- 
2.17.1

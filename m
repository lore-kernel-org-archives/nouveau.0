From: Dinghao Liu <dinghao.liu@zju.edu.cn>
Subject: [PATCH] drm/nouveau/clk/gm20b: Fix memory leak in gm20b_clk_new
Date: Fri, 29 May 2020 16:00:39 +0800
Message-ID: <20200529080042.6082-1-dinghao.liu@zju.edu.cn>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dinghao.liu@zju.edu.cn, kjlu@umn.edu
Cc: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

When gk20a_clk_ctor() returns an error code, pointer "clk"
should be released. It's the same when gm20b_clk_new()
returns from elsewhere following this call.

Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/clk/gm20b.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/gm20b.c b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/gm20b.c
index b284e949f732..a5aeba74d3b7 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/gm20b.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/gm20b.c
@@ -1039,7 +1039,7 @@ gm20b_clk_new(struct nvkm_device *device, int index, struct nvkm_clk **pclk)
 	ret = gk20a_clk_ctor(device, index, &gm20b_clk, clk_params,
 			     &clk->base);
 	if (ret)
-		return ret;
+		goto out_free;
 
 	/*
 	 * NAPLL can only work with max_u, clamp the m range so
@@ -1067,8 +1067,8 @@ gm20b_clk_new(struct nvkm_device *device, int index, struct nvkm_clk **pclk)
 		nvkm_warn(subdev, "no fused calibration parameters\n");
 
 	ret = gm20b_clk_init_safe_fmax(clk);
-	if (ret)
-		return ret;
 
-	return 0;
+out_free:
+	kfree(clk);
+	return ret;
 }
-- 
2.17.1

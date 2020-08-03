From: Jing Xiangfeng <jingxiangfeng@huawei.com>
Subject: [PATCH] drm/nouveau/acr: fix a coding style in nvkm_acr_lsfw_load_bl_inst_data_sig()
Date: Mon, 3 Aug 2020 11:48:27 +0800
Message-ID: <20200803034827.100685-1-jingxiangfeng@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: bskeggs@redhat.com, airlied@linux.ie, daniel@ffwll.ch, jingxiangfeng@huawei.com
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

This patch performs the following changes:
1. remove a redundant parentheses around the  nvkm_acr_lsfw_add() calls
2. do assignment before this if condition, it is more readable

Signed-off-by: Jing Xiangfeng <jingxiangfeng@huawei.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c b/drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c
index 07d1830126ab..5f6006418472 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c
@@ -191,7 +191,8 @@ nvkm_acr_lsfw_load_bl_inst_data_sig(struct nvkm_subdev *subdev,
 	u32 *bldata;
 	int ret;
 
-	if (IS_ERR((lsfw = nvkm_acr_lsfw_add(func, acr, falcon, id))))
+	lsfw = nvkm_acr_lsfw_add(func, acr, falcon, id);
+	if (IS_ERR(lsfw))
 		return PTR_ERR(lsfw);
 
 	ret = nvkm_firmware_load_name(subdev, path, "bl", ver, &bl);
-- 
2.17.1

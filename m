From: YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next] drm/nouveau/secboot: Make acr_r352_ls_gpccs_func static
Date: Wed, 17 Jul 2019 14:56:26 +0800
Message-ID: <20190717065626.42016-1-yuehaibing@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dri-devel@lists.freedesktop.org, bskeggs@redhat.com, airlied@linux.ie, daniel@ffwll.ch, keescook@chromium.org
Cc: linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org, YueHaibing <yuehaibing@huawei.com>
List-Id: nouveau.vger.kernel.org

Fix sparse warning:

drivers/gpu/drm/nouveau/nvkm/subdev/secboot/acr_r352.c:1092:1:
 warning: symbol 'acr_r352_ls_gpccs_func' was not declared. Should it be static?

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/secboot/acr_r352.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/acr_r352.c b/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/acr_r352.c
index 4fd4cfe..7af971d 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/acr_r352.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/acr_r352.c
@@ -1088,7 +1088,7 @@ acr_r352_ls_gpccs_func_0 = {
 	.lhdr_flags = LSF_FLAG_FORCE_PRIV_LOAD,
 };
 
-const struct acr_r352_ls_func
+static const struct acr_r352_ls_func
 acr_r352_ls_gpccs_func = {
 	.load = acr_ls_ucode_load_gpccs,
 	.version_max = 0,
-- 
2.7.4

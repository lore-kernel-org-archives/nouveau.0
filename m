From: Wei Yongjun <weiyj.lk@gmail.com>
Subject: [PATCH -next] drm/nouveau/secboot/gm20b: fix the error return code in gm20b_secboot_tegra_read_wpr()
Date: Tue, 25 Apr 2017 14:36:42 +0000
Message-ID: <20170425143642.1342-1-weiyj.lk@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Alexandre Courbot <acourbot@nvidia.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

From: Wei Yongjun <weiyongjun1@huawei.com>

The error return code PTR_ERR(mc) is always 0 since mc is
equal to 0 in this error handling case.

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/secboot/gm20b.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/gm20b.c b/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/gm20b.c
index b10ed59..30491d1 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/gm20b.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/gm20b.c
@@ -48,7 +48,7 @@ gm20b_secboot_tegra_read_wpr(struct gm200_secboot *gsb, u32 mc_base)
 	mc = ioremap(mc_base, 0xd00);
 	if (!mc) {
 		nvkm_error(&sb->subdev, "Cannot map Tegra MC registers\n");
-		return PTR_ERR(mc);
+		return -ENOMEM;
 	}
 	sb->wpr_addr = ioread32_native(mc + MC_SECURITY_CARVEOUT2_BOM_0) |
 	      ((u64)ioread32_native(mc + MC_SECURITY_CARVEOUT2_BOM_HI_0) << 32);

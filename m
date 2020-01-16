From: Chen Zhou <chenzhou10@huawei.com>
Subject: [PATCH -next] drm/nouveau: fix build error without CONFIG_IOMMU_API
Date: Thu, 16 Jan 2020 20:50:10 +0800
Message-ID: <20200116125010.166572-1-chenzhou10@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: bskeggs@redhat.com, airlied@linux.ie, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, chenzhou10@huawei.com
List-Id: nouveau.vger.kernel.org

If CONFIG_IOMMU_API is n, build fails:

vers/gpu/drm/nouveau/nvkm/subdev/ltc/gp10b.c:37:9: error: implicit declaration of function dev_iommu_fwspec_get; did you mean iommu_fwspec_free? [-Werror=implicit-function-declaration]
  spec = dev_iommu_fwspec_get(device->dev);
         ^~~~~~~~~~~~~~~~~~~~
         iommu_fwspec_free
drivers/gpu/drm/nouveau/nvkm/subdev/ltc/gp10b.c:37:7: warning: assignment makes pointer from integer without a cast [-Wint-conversion]
  spec = dev_iommu_fwspec_get(device->dev);
       ^
drivers/gpu/drm/nouveau/nvkm/subdev/ltc/gp10b.c:39:17: error: struct iommu_fwspec has no member named ids
   u32 sid = spec->ids[0] & 0xffff;

Seletc IOMMU_API under config DRM_NOUVEAU to fix this.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Chen Zhou <chenzhou10@huawei.com>
---
 drivers/gpu/drm/nouveau/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/nouveau/Kconfig b/drivers/gpu/drm/nouveau/Kconfig
index 9c990266..ce03693 100644
--- a/drivers/gpu/drm/nouveau/Kconfig
+++ b/drivers/gpu/drm/nouveau/Kconfig
@@ -2,6 +2,7 @@
 config DRM_NOUVEAU
 	tristate "Nouveau (NVIDIA) cards"
 	depends on DRM && PCI && MMU
+	select IOMMU_API
 	select FW_LOADER
 	select DRM_KMS_HELPER
 	select DRM_TTM
-- 
2.7.4

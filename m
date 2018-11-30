From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: [PATCH RFC 03/15] drm/nouveau: replace **** with a hug
Date: Fri, 30 Nov 2018 11:27:12 -0800
Message-ID: <20181130192737.15053-4-jarkko.sakkinen@linux.intel.com>
References: <20181130192737.15053-1-jarkko.sakkinen@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181130192737.15053-1-jarkko.sakkinen@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, "open list:DRM DRIVER FOR NVIDIA
        GEFORCE/QUADRO GPUS" <dri-devel@lists.freedesktop.org>, "open list:DRM DRIVER FOR NVIDIA
        GEFORCE/QUADRO GPUS" <nouveau@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

In order to comply with the CoC, replace **** with a hug.

Signed-off-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/bios/init.c        | 2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/pmu/fuc/macros.fuc | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/init.c b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/init.c
index 9cc10e438b3d..55a0060881ea 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/init.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/init.c
@@ -446,7 +446,7 @@ init_ram_restrict(struct nvbios_init *init)
 {
 	/* This appears to be the behaviour of the VBIOS parser, and *is*
 	 * important to cache the NV_PEXTDEV_BOOT0 on later chipsets to
-	 * avoid fucking up the memory controller (somehow) by reading it
+	 * avoid hugging up the memory controller (somehow) by reading it
 	 * on every INIT_RAM_RESTRICT_ZM_GROUP opcode.
 	 *
 	 * Preserving the non-caching behaviour on earlier chipsets just
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/fuc/macros.fuc b/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/fuc/macros.fuc
index 3737bd27f74e..ee364c71cc2e 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/fuc/macros.fuc
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/fuc/macros.fuc
@@ -46,7 +46,7 @@
 #define NV_PPWR_INTR_EN_SET_SUBINTR                                  0x00000800
 #define NV_PPWR_INTR_EN_SET_WATCHDOG                                 0x00000002
 #define NV_PPWR_INTR_EN_CLR                                              0x0014
-#define NV_PPWR_INTR_EN_CLR_MASK                    /* fuck i hate envyas */ -1
+#define NV_PPWR_INTR_EN_CLR_MASK                    /* hug i hate envyas */ -1
 #define NV_PPWR_INTR_ROUTE                                               0x001c
 #define NV_PPWR_TIMER_LOW                                                0x002c
 #define NV_PPWR_WATCHDOG_TIME                                            0x0034
-- 
2.19.1

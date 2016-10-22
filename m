From: Baoyou Xie <baoyou.xie@linaro.org>
Subject: [PATCH 02/17] drm/nouveau/bios: mark symbols static where possible
Date: Sat, 22 Oct 2016 17:41:43 +0800
Message-ID: <1477129318-29677-2-git-send-email-baoyou.xie@linaro.org>
References: <1477129318-29677-1-git-send-email-baoyou.xie@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1477129318-29677-1-git-send-email-baoyou.xie@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: bskeggs@redhat.com, airlied@linux.ie, acourbot@nvidia.com, imirkin@alum.mit.edu, Julia.Lawall@lip6.fr, martin.peres@free.fr, rspliet@eclipso.eu, nouveau@karolherbst.de
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, arnd@arndb.de, baoyou.xie@linaro.org, xie.baoyou@zte.com.cn, han.fei@zte.com.cn, tang.qiang007@zte.com.cn
List-Id: nouveau.vger.kernel.org

We get 2 warnings when building kernel with W=1:
drivers/gpu/drm/nouveau/nvkm/subdev/bios/fan.c:29:1: warning: no previous prototype for 'nvbios_fan_table' [-Wmissing-prototypes]
drivers/gpu/drm/nouveau/nvkm/subdev/bios/fan.c:56:1: warning: no previous prototype for 'nvbios_fan_entry' [-Wmissing-prototypes]

In fact, both functions are only used in the file in which they are
declared and don't need a declaration, but can be made static.
So this patch marks these functions with 'static'.

Signed-off-by: Baoyou Xie <baoyou.xie@linaro.org>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/bios/fan.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/fan.c b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/fan.c
index 80fed7e..e290581 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/fan.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/fan.c
@@ -25,7 +25,7 @@
 #include <subdev/bios/bit.h>
 #include <subdev/bios/fan.h>
 
-u16
+static u16
 nvbios_fan_table(struct nvkm_bios *bios, u8 *ver, u8 *hdr, u8 *cnt, u8 *len)
 {
 	struct bit_entry bit_P;
@@ -52,7 +52,7 @@ nvbios_fan_table(struct nvkm_bios *bios, u8 *ver, u8 *hdr, u8 *cnt, u8 *len)
 	return 0x0000;
 }
 
-u16
+static u16
 nvbios_fan_entry(struct nvkm_bios *bios, int idx, u8 *ver, u8 *hdr,
 		 u8 *cnt, u8 *len)
 {
-- 
2.7.4

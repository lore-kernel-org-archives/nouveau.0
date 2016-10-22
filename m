From: Baoyou Xie <baoyou.xie@linaro.org>
Subject: [PATCH 10/17] drm/nouveau/device: mark symbol static where possible
Date: Sat, 22 Oct 2016 17:41:51 +0800
Message-ID: <1477129318-29677-10-git-send-email-baoyou.xie@linaro.org>
References: <1477129318-29677-1-git-send-email-baoyou.xie@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1477129318-29677-1-git-send-email-baoyou.xie@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: bskeggs@redhat.com, airlied@linux.ie, acourbot@nvidia.com, imirkin@alum.mit.edu, Julia.Lawall@lip6.fr, martin.peres@free.fr, rspliet@eclipso.eu, nouveau@karolherbst.de
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, arnd@arndb.de, baoyou.xie@linaro.org, xie.baoyou@zte.com.cn, han.fei@zte.com.cn, tang.qiang007@zte.com.cn
List-Id: nouveau.vger.kernel.org

We get 1 warning when building kernel with W=1:
drivers/gpu/drm/nouveau/nvkm/engine/device/user.c:330:1: warning: no previous prototype for 'nvkm_udevice_new' [-Wmissing-prototypes]

In fact, this function is only used in the file in which it is
declared and don't need a declaration, but can be made static.
So this patch marks this function with 'static'.

Signed-off-by: Baoyou Xie <baoyou.xie@linaro.org>
---
 drivers/gpu/drm/nouveau/nvkm/engine/device/user.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/user.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/user.c
index 79a8f71..513ee6b 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/device/user.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/user.c
@@ -326,7 +326,7 @@ nvkm_udevice = {
 	.sclass = nvkm_udevice_child_get,
 };
 
-int
+static int
 nvkm_udevice_new(const struct nvkm_oclass *oclass, void *data, u32 size,
 		 struct nvkm_object **pobject)
 {
-- 
2.7.4

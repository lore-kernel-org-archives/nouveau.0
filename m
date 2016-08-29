From: Baoyou Xie <baoyou.xie@linaro.org>
Subject: [PATCH] drm/nouveau/gr/gm107: mark symbols static where possible
Date: Mon, 29 Aug 2016 19:37:45 +0800
Message-ID: <1472470665-3851-1-git-send-email-baoyou.xie@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: bskeggs@redhat.com, airlied@linux.ie
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, arnd@arndb.de, baoyou.xie@linaro.org, xie.baoyou@zte.com.cn
List-Id: nouveau.vger.kernel.org

We get 1 warning when build kernel with W=1:
drivers/gpu/drm/nouveau/nvkm/engine/gr/gm107.c:312:1: warning: no previous prototype for 'gm107_gr_init' [-Wmissing-prototypes]

In fact, this function is only used in the file in which it is
declared and don't need a declaration, but can be made static.
so this patch marks this function with 'static'.

Signed-off-by: Baoyou Xie <baoyou.xie@linaro.org>
---
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gm107.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gm107.c b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gm107.c
index 45f965f..2c67fac 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gm107.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gm107.c
@@ -308,7 +308,7 @@ gm107_gr_init_bios(struct gf100_gr *gr)
 	}
 }
 
-int
+static int
 gm107_gr_init(struct gf100_gr *gr)
 {
 	struct nvkm_device *device = gr->base.engine.subdev.device;
-- 
2.7.4

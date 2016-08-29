From: Baoyou Xie <baoyou.xie@linaro.org>
Subject: [PATCH v2] drm/nouveau/gr/gf117-: mark symbols static where possible
Date: Mon, 29 Aug 2016 19:29:21 +0800
Message-ID: <1472470161-23872-1-git-send-email-baoyou.xie@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: bskeggs@redhat.com, airlied@linux.ie
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, arnd@arndb.de, baoyou.xie@linaro.org, xie.baoyou@zte.com.cn
List-Id: nouveau.vger.kernel.org

We get 1 warning when build kernel with W=1:
drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgf117.c:222:1: warning: no previous prototype for 'gf117_grctx_generate_main' [-Wmissing-prototypes]

In fact, this function is only used in the file in which it is
declared and don't need a declaration, but can be made static.
so this patch marks this function with 'static'.

Signed-off-by: Baoyou Xie <baoyou.xie@linaro.org>
---
 drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgf117.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgf117.c b/drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgf117.c
index c925ade..74a64e3 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgf117.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgf117.c
@@ -218,7 +218,7 @@ gf117_grctx_generate_attrib(struct gf100_grctx *info)
 	}
 }
 
-void
+static void
 gf117_grctx_generate_main(struct gf100_gr *gr, struct gf100_grctx *info)
 {
 	struct nvkm_device *device = gr->base.engine.subdev.device;
-- 
2.7.4

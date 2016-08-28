From: Baoyou Xie <baoyou.xie@linaro.org>
Subject: [PATCH] fix:nv10_fence: mark symbols static where possible
Date: Sun, 28 Aug 2016 15:16:55 +0800
Message-ID: <1472368615-30717-1-git-send-email-baoyou.xie@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: bskeggs@redhat.com, airlied@linux.ie
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, arnd@linaro.org, baoyou.xie@linaro.org, xie.baoyou@zte.com.cn
List-Id: nouveau.vger.kernel.org

We get 1 warning about global functions without a declaration
in the nouveau nv10_fence driver when building with W=1:
drivers/gpu/drm/nouveau/nv10_fence.c:70:1: warning: no previous prototype for 'nv10_fence_context_new' [-Wmissing-prototypes]

In fact, this function is only used in the file in which it is declared
and don't need a declaration, but can be made static.
so this patch marks it 'static'.

Signed-off-by: Baoyou Xie <baoyou.xie@linaro.org>
---
 drivers/gpu/drm/nouveau/nv10_fence.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nv10_fence.c b/drivers/gpu/drm/nouveau/nv10_fence.c
index 4e3de34..619f79d 100644
--- a/drivers/gpu/drm/nouveau/nv10_fence.c
+++ b/drivers/gpu/drm/nouveau/nv10_fence.c
@@ -66,7 +66,7 @@ nv10_fence_context_del(struct nouveau_channel *chan)
 	nouveau_fence_context_free(&fctx->base);
 }
 
-int
+static int
 nv10_fence_context_new(struct nouveau_channel *chan)
 {
 	struct nv10_fence_chan *fctx;
-- 
2.7.4

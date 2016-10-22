From: Baoyou Xie <baoyou.xie@linaro.org>
Subject: [PATCH 05/17] drm/nouveau/fb: mark symbols static where possible
Date: Sat, 22 Oct 2016 17:41:46 +0800
Message-ID: <1477129318-29677-5-git-send-email-baoyou.xie@linaro.org>
References: <1477129318-29677-1-git-send-email-baoyou.xie@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1477129318-29677-1-git-send-email-baoyou.xie@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: bskeggs@redhat.com, airlied@linux.ie, acourbot@nvidia.com, imirkin@alum.mit.edu, Julia.Lawall@lip6.fr, martin.peres@free.fr, rspliet@eclipso.eu, nouveau@karolherbst.de
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, arnd@arndb.de, baoyou.xie@linaro.org, xie.baoyou@zte.com.cn, han.fei@zte.com.cn, tang.qiang007@zte.com.cn
List-Id: nouveau.vger.kernel.org

We get 4 warnings when building kernel with W=1:
drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgt215.c:99:1: warning: no previous prototype for 'gt215_link_train_calc' [-Wmissing-prototypes]
drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgt215.c:153:1: warning: no previous prototype for 'gt215_link_train' [-Wmissing-prototypes]
drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgt215.c:271:1: warning: no previous prototype for 'gt215_link_train_init' [-Wmissing-prototypes]
drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgt215.c:337:1: warning: no previous prototype for 'gt215_link_train_fini' [-Wmissing-prototypes]

In fact, both functions are only used in the file in which they are
declared and don't need a declaration, but can be made static.
So this patch marks these functions with 'static'.

Signed-off-by: Baoyou Xie <baoyou.xie@linaro.org>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgt215.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgt215.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgt215.c
index d15ea88..f106643 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgt215.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgt215.c
@@ -95,7 +95,7 @@ struct gt215_ram {
 	struct gt215_ltrain ltrain;
 };
 
-void
+static void
 gt215_link_train_calc(u32 *vals, struct gt215_ltrain *train)
 {
 	int i, lo, hi;
@@ -149,7 +149,7 @@ gt215_link_train_calc(u32 *vals, struct gt215_ltrain *train)
 /*
  * Link training for (at least) DDR3
  */
-int
+static int
 gt215_link_train(struct gt215_ram *ram)
 {
 	struct gt215_ltrain *train = &ram->ltrain;
@@ -267,7 +267,7 @@ gt215_link_train(struct gt215_ram *ram)
 	return ret;
 }
 
-int
+static int
 gt215_link_train_init(struct gt215_ram *ram)
 {
 	static const u32 pattern[16] = {
@@ -333,7 +333,7 @@ gt215_link_train_init(struct gt215_ram *ram)
 	return 0;
 }
 
-void
+static void
 gt215_link_train_fini(struct gt215_ram *ram)
 {
 	if (ram->ltrain.mem)
-- 
2.7.4

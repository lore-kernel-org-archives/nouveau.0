From: Baoyou Xie <baoyou.xie@linaro.org>
Subject: [PATCH 15/17] drm/nouveau/pm: mark symbols static where possible
Date: Sat, 22 Oct 2016 17:41:56 +0800
Message-ID: <1477129318-29677-15-git-send-email-baoyou.xie@linaro.org>
References: <1477129318-29677-1-git-send-email-baoyou.xie@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1477129318-29677-1-git-send-email-baoyou.xie@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: bskeggs@redhat.com, airlied@linux.ie, acourbot@nvidia.com, imirkin@alum.mit.edu, Julia.Lawall@lip6.fr, martin.peres@free.fr, rspliet@eclipso.eu, nouveau@karolherbst.de
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, arnd@arndb.de, baoyou.xie@linaro.org, xie.baoyou@zte.com.cn, han.fei@zte.com.cn, tang.qiang007@zte.com.cn
List-Id: nouveau.vger.kernel.org

We get 2 warnings when building kernel with W=1:
drivers/gpu/drm/nouveau/nvkm/engine/pm/base.c:75:1: warning: no previous prototype for 'nvkm_perfsig_find' [-Wmissing-prototypes]
drivers/gpu/drm/nouveau/nvkm/engine/pm/base.c:703:1: warning: no previous prototype for 'nvkm_perfsrc_new' [-Wmissing-prototypes]

In fact, both functions are only used in the file in which they are
declared and don't need a declaration, but can be made static.
So this patch marks these functions with 'static'.

Signed-off-by: Baoyou Xie <baoyou.xie@linaro.org>
---
 drivers/gpu/drm/nouveau/nvkm/engine/pm/base.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/pm/base.c b/drivers/gpu/drm/nouveau/nvkm/engine/pm/base.c
index 8616636..dde89a4 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/pm/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/pm/base.c
@@ -71,7 +71,7 @@ nvkm_perfdom_find(struct nvkm_pm *pm, int di)
 	return NULL;
 }
 
-struct nvkm_perfsig *
+static struct nvkm_perfsig *
 nvkm_perfsig_find(struct nvkm_pm *pm, u8 di, u8 si, struct nvkm_perfdom **pdom)
 {
 	struct nvkm_perfdom *dom = *pdom;
@@ -699,7 +699,7 @@ nvkm_pm_oclass_get(struct nvkm_oclass *oclass, int index,
 	return 1;
 }
 
-int
+static int
 nvkm_perfsrc_new(struct nvkm_pm *pm, struct nvkm_perfsig *sig,
 		 const struct nvkm_specsrc *spec)
 {
-- 
2.7.4

From: Baoyou Xie <baoyou.xie@linaro.org>
Subject: [PATCH 11/17] drm/nouveau/disp: mark symbols static where possible
Date: Sat, 22 Oct 2016 17:41:52 +0800
Message-ID: <1477129318-29677-11-git-send-email-baoyou.xie@linaro.org>
References: <1477129318-29677-1-git-send-email-baoyou.xie@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1477129318-29677-1-git-send-email-baoyou.xie@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: bskeggs@redhat.com, airlied@linux.ie, acourbot@nvidia.com, imirkin@alum.mit.edu, Julia.Lawall@lip6.fr, martin.peres@free.fr, rspliet@eclipso.eu, nouveau@karolherbst.de
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, arnd@arndb.de, baoyou.xie@linaro.org, xie.baoyou@zte.com.cn, han.fei@zte.com.cn, tang.qiang007@zte.com.cn
List-Id: nouveau.vger.kernel.org

We get 5 warnings when building kernel with W=1:
drivers/gpu/drm/nouveau/nvkm/engine/disp/rootnv50.c:70:1: warning: no previous prototype for 'nv50_disp_root_mthd_' [-Wmissing-prototypes]
drivers/gpu/drm/nouveau/nvkm/engine/disp/channv50.c:157:1: warning: no previous prototype for 'nv50_disp_chan_rd32' [-Wmissing-prototypes]
drivers/gpu/drm/nouveau/nvkm/engine/disp/channv50.c:167:1: warning: no previous prototype for 'nv50_disp_chan_wr32' [-Wmissing-prototypes]
drivers/gpu/drm/nouveau/nvkm/engine/disp/channv50.c:177:1: warning: no previous prototype for 'nv50_disp_chan_ntfy' [-Wmissing-prototypes]
drivers/gpu/drm/nouveau/nvkm/engine/disp/channv50.c:193:1: warning: no previous prototype for 'nv50_disp_chan_map' [-Wmissing-prototypes]

In fact, both functions are only used in the file in which they are
declared and don't need a declaration, but can be made static.
So this patch marks these functions with 'static'.

Signed-off-by: Baoyou Xie <baoyou.xie@linaro.org>
---
 drivers/gpu/drm/nouveau/nvkm/engine/disp/channv50.c | 8 ++++----
 drivers/gpu/drm/nouveau/nvkm/engine/disp/rootnv50.c | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/channv50.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/channv50.c
index dd2953b..26990d4 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/channv50.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/channv50.c
@@ -153,7 +153,7 @@ nv50_disp_chan_uevent = {
 	.fini = nv50_disp_chan_uevent_fini,
 };
 
-int
+static int
 nv50_disp_chan_rd32(struct nvkm_object *object, u64 addr, u32 *data)
 {
 	struct nv50_disp_chan *chan = nv50_disp_chan(object);
@@ -163,7 +163,7 @@ nv50_disp_chan_rd32(struct nvkm_object *object, u64 addr, u32 *data)
 	return 0;
 }
 
-int
+static int
 nv50_disp_chan_wr32(struct nvkm_object *object, u64 addr, u32 data)
 {
 	struct nv50_disp_chan *chan = nv50_disp_chan(object);
@@ -173,7 +173,7 @@ nv50_disp_chan_wr32(struct nvkm_object *object, u64 addr, u32 data)
 	return 0;
 }
 
-int
+static int
 nv50_disp_chan_ntfy(struct nvkm_object *object, u32 type,
 		    struct nvkm_event **pevent)
 {
@@ -189,7 +189,7 @@ nv50_disp_chan_ntfy(struct nvkm_object *object, u32 type,
 	return -EINVAL;
 }
 
-int
+static int
 nv50_disp_chan_map(struct nvkm_object *object, u64 *addr, u32 *size)
 {
 	struct nv50_disp_chan *chan = nv50_disp_chan(object);
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/rootnv50.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/rootnv50.c
index 2f9cecd..6424b39 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/rootnv50.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/rootnv50.c
@@ -66,7 +66,7 @@ nv50_disp_root_scanoutpos(NV50_DISP_MTHD_V0)
 	return 0;
 }
 
-int
+static int
 nv50_disp_root_mthd_(struct nvkm_object *object, u32 mthd, void *data, u32 size)
 {
 	union {
-- 
2.7.4

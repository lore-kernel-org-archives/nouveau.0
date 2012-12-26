From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] drm/nouveau: share fence structures between nv10+
 and nv50 implementations
Date: Wed, 26 Dec 2012 20:58:59 +0100
Message-ID: <20121226195859.GB3156@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

We already rely on them having the same fields and layout.

Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nv10_fence.c | 13 +------------
 drivers/gpu/drm/nouveau/nv10_fence.h | 19 +++++++++++++++++++
 drivers/gpu/drm/nouveau/nv50_fence.c | 19 ++++---------------
 3 files changed, 24 insertions(+), 27 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/nv10_fence.h

diff --git a/drivers/gpu/drm/nouveau/nv10_fence.c b/drivers/gpu/drm/nouveau/nv10_fence.c
index 0619c02..2ad4cd5 100644
--- a/drivers/gpu/drm/nouveau/nv10_fence.c
+++ b/drivers/gpu/drm/nouveau/nv10_fence.c
@@ -27,18 +27,7 @@
 
 #include "nouveau_drm.h"
 #include "nouveau_dma.h"
-#include "nouveau_fence.h"
-
-struct nv10_fence_chan {
-	struct nouveau_fence_chan base;
-};
-
-struct nv10_fence_priv {
-	struct nouveau_fence_priv base;
-	struct nouveau_bo *bo;
-	spinlock_t lock;
-	u32 sequence;
-};
+#include "nv10_fence.h"
 
 int
 nv10_fence_emit(struct nouveau_fence *fence)
diff --git a/drivers/gpu/drm/nouveau/nv10_fence.h b/drivers/gpu/drm/nouveau/nv10_fence.h
new file mode 100644
index 0000000..e5d9204
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nv10_fence.h
@@ -0,0 +1,19 @@
+#ifndef __NV10_FENCE_H_
+#define __NV10_FENCE_H_
+
+#include <core/os.h>
+#include "nouveau_fence.h"
+#include "nouveau_bo.h"
+
+struct nv10_fence_chan {
+	struct nouveau_fence_chan base;
+};
+
+struct nv10_fence_priv {
+	struct nouveau_fence_priv base;
+	struct nouveau_bo *bo;
+	spinlock_t lock;
+	u32 sequence;
+};
+
+#endif
diff --git a/drivers/gpu/drm/nouveau/nv50_fence.c b/drivers/gpu/drm/nouveau/nv50_fence.c
index 4cc0ce6..4bef67c 100644
--- a/drivers/gpu/drm/nouveau/nv50_fence.c
+++ b/drivers/gpu/drm/nouveau/nv50_fence.c
@@ -27,27 +27,16 @@
 
 #include "nouveau_drm.h"
 #include "nouveau_dma.h"
-#include "nouveau_fence.h"
+#include "nv10_fence.h"
 
 #include "nv50_display.h"
 
-struct nv50_fence_chan {
-	struct nouveau_fence_chan base;
-};
-
-struct nv50_fence_priv {
-	struct nouveau_fence_priv base;
-	struct nouveau_bo *bo;
-	spinlock_t lock;
-	u32 sequence;
-};
-
 static int
 nv50_fence_context_new(struct nouveau_channel *chan)
 {
 	struct drm_device *dev = chan->drm->dev;
-	struct nv50_fence_priv *priv = chan->drm->fence;
-	struct nv50_fence_chan *fctx;
+	struct nv10_fence_priv *priv = chan->drm->fence;
+	struct nv10_fence_chan *fctx;
 	struct ttm_mem_reg *mem = &priv->bo->bo.mem;
 	struct nouveau_object *object;
 	int ret, i;
@@ -91,7 +80,7 @@ nv50_fence_context_new(struct nouveau_channel *chan)
 int
 nv50_fence_create(struct nouveau_drm *drm)
 {
-	struct nv50_fence_priv *priv;
+	struct nv10_fence_priv *priv;
 	int ret = 0;
 
 	priv = drm->fence = kzalloc(sizeof(*priv), GFP_KERNEL);
-- 
1.8.0.2

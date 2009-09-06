From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: [PATCH 4/4] drm/nouveau: fix signedness in
	nouveau_gpuobj_new()
Date: Sun,  6 Sep 2009 21:16:03 +0300
Message-ID: <1252260963-5163-4-git-send-email-pq@iki.fi>
References: <1252260963-5163-1-git-send-email-pq@iki.fi>
	<1252260963-5163-2-git-send-email-pq@iki.fi>
	<1252260963-5163-3-git-send-email-pq@iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1252260963-5163-3-git-send-email-pq-X3B1VOXEql0@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

The size parameter is usually unsigned, but here it was signed. Change
'int' to 'uint32_t' and propagate the signedness fixes to all callers.

Fixes the sparse warning: nouveau_object.c:254:61: warning: incorrect
type in argument 3 (different signedness).

Signed-off-by: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_drv.h    |    4 ++--
 drivers/gpu/drm/nouveau/nouveau_object.c |   14 ++++++++------
 drivers/gpu/drm/nouveau/nv50_graph.c     |    6 ++++--
 3 files changed, 14 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index b717c1c..1581935 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -698,7 +698,7 @@ extern int nouveau_gpuobj_channel_init(struct nouveau_channel *,
 				       uint32_t vram_h, uint32_t tt_h);
 extern void nouveau_gpuobj_channel_takedown(struct nouveau_channel *);
 extern int nouveau_gpuobj_new(struct drm_device *, struct nouveau_channel *,
-			      int size, int align, uint32_t flags,
+			      uint32_t size, int align, uint32_t flags,
 			      struct nouveau_gpuobj **);
 extern int nouveau_gpuobj_del(struct drm_device *, struct nouveau_gpuobj **);
 extern int nouveau_gpuobj_ref_add(struct drm_device *, struct nouveau_channel *,
@@ -711,7 +711,7 @@ extern int nouveau_gpuobj_ref_find(struct nouveau_channel *, uint32_t handle,
 extern int nouveau_gpuobj_new_ref(struct drm_device *,
 				  struct nouveau_channel *alloc_chan,
 				  struct nouveau_channel *ref_chan,
-				  uint32_t handle, int size, int align,
+				  uint32_t handle, uint32_t size, int align,
 				  uint32_t flags, struct nouveau_gpuobj_ref **);
 extern int nouveau_gpuobj_new_fake(struct drm_device *,
 				   uint32_t p_offset, uint32_t b_offset,
diff --git a/drivers/gpu/drm/nouveau/nouveau_object.c b/drivers/gpu/drm/nouveau/nouveau_object.c
index efcce79..66ab939 100644
--- a/drivers/gpu/drm/nouveau/nouveau_object.c
+++ b/drivers/gpu/drm/nouveau/nouveau_object.c
@@ -203,7 +203,7 @@ nouveau_ramht_remove(struct drm_device *dev, struct nouveau_gpuobj_ref *ref)
 
 int
 nouveau_gpuobj_new(struct drm_device *dev, struct nouveau_channel *chan,
-		   int size, int align, uint32_t flags,
+		   uint32_t size, int align, uint32_t flags,
 		   struct nouveau_gpuobj **gpuobj_ret)
 {
 	struct drm_nouveau_private *dev_priv = dev->dev_private;
@@ -212,7 +212,7 @@ nouveau_gpuobj_new(struct drm_device *dev, struct nouveau_channel *chan,
 	struct mem_block *pramin = NULL;
 	int ret;
 
-	NV_DEBUG(dev, "ch%d size=%d align=%d flags=0x%08x\n",
+	NV_DEBUG(dev, "ch%d size=%u align=%d flags=0x%08x\n",
 		 chan ? chan->id : -1, size, align, flags);
 
 	if (!dev_priv || !gpuobj_ret || *gpuobj_ret != NULL)
@@ -520,8 +520,8 @@ int nouveau_gpuobj_ref_del(struct drm_device *dev, struct nouveau_gpuobj_ref **p
 int
 nouveau_gpuobj_new_ref(struct drm_device *dev,
 		       struct nouveau_channel *oc, struct nouveau_channel *rc,
-		       uint32_t handle, int size, int align, uint32_t flags,
-		       struct nouveau_gpuobj_ref **ref)
+		       uint32_t handle, uint32_t size, int align,
+		       uint32_t flags, struct nouveau_gpuobj_ref **ref)
 {
 	struct nouveau_gpuobj *gpuobj = NULL;
 	int ret;
@@ -616,7 +616,7 @@ nouveau_gpuobj_new_fake(struct drm_device *dev, uint32_t p_offset,
 }
 
 
-static int
+static uint32_t
 nouveau_gpuobj_class_instmem_size(struct drm_device *dev, int class)
 {
 	struct drm_nouveau_private *dev_priv = dev->dev_private;
@@ -899,7 +899,9 @@ nouveau_gpuobj_channel_init_pramin(struct nouveau_channel *chan)
 	struct drm_device *dev = chan->dev;
 	struct drm_nouveau_private *dev_priv = dev->dev_private;
 	struct nouveau_gpuobj *pramin = NULL;
-	int size, base, ret;
+	uint32_t size;
+	uint32_t base;
+	int ret;
 
 	NV_DEBUG(dev, "ch%d\n", chan->id);
 
diff --git a/drivers/gpu/drm/nouveau/nv50_graph.c b/drivers/gpu/drm/nouveau/nv50_graph.c
index 72db3cf..108f672 100644
--- a/drivers/gpu/drm/nouveau/nv50_graph.c
+++ b/drivers/gpu/drm/nouveau/nv50_graph.c
@@ -182,8 +182,10 @@ nv50_graph_create_context(struct nouveau_channel *chan)
 	struct nouveau_gpuobj *ramin = chan->ramin->gpuobj;
 	struct nouveau_gpuobj *ctx;
 	uint32_t *ctxvals = NULL;
-	int grctx_size = 0x70000, hdr;
-	int ret, pos;
+	uint32_t grctx_size = 0x70000;
+	int hdr;
+	int ret;
+	int pos;
 
 	NV_DEBUG(dev, "ch%d\n", chan->id);
 
-- 
1.6.3.3

From: Lauri Peltonen <lpeltonen@nvidia.com>
Subject: [RFC PATCH 5/7] libdrm: nouveau: Support fence fds
Date: Fri, 26 Sep 2014 13:00:10 +0300
Message-ID: <1411725612-10455-6-git-send-email-lpeltonen@nvidia.com>
References: <1411725612-10455-1-git-send-email-lpeltonen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1411725612-10455-1-git-send-email-lpeltonen@nvidia.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Ben Skeggs <bskeggs@redhat.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Colin Cross <ccross@android.com>, Maarten Lankhorst <maarten.lankhorst@canonical.com>, Dave Airlie <airlied@redhat.com>
Cc: Stephen Warren <swarren@nvidia.com>, nouveau@lists.freedesktop.org, James Jones <jajones@nvidia.com>, dri-devel@lists.freedesktop.org, Thierry Reding <treding@nvidia.com>, Ken Adams <kadams@nvidia.com>
List-Id: nouveau.vger.kernel.org

Add a new nouveau_pushbuf_kick_fence function that takes and emits
a sync fence fd.  The fence fd can be waited on, or merged with
other fence fd's, or passed back to kernel as a prerquisite for a
subsequent hw operation.

Signed-off-by: Lauri Peltonen <lpeltonen@nvidia.com>
---
 include/drm/nouveau_drm.h | 10 +++++
 nouveau/nouveau.h         |  2 +
 nouveau/pushbuf.c         | 93 ++++++++++++++++++++++++++++++++---------------
 3 files changed, 76 insertions(+), 29 deletions(-)

diff --git a/include/drm/nouveau_drm.h b/include/drm/nouveau_drm.h
index b18cad0..3e40210 100644
--- a/include/drm/nouveau_drm.h
+++ b/include/drm/nouveau_drm.h
@@ -171,6 +171,15 @@ struct drm_nouveau_gem_pushbuf {
 	uint64_t gart_available;
 };
 
+#define NOUVEAU_GEM_PUSHBUF_2_FENCE_WAIT                             0x00000001
+#define NOUVEAU_GEM_PUSHBUF_2_FENCE_EMIT                             0x00000002
+struct drm_nouveau_gem_pushbuf_2 {
+	struct drm_nouveau_gem_pushbuf base;
+	uint32_t flags;
+	int32_t  fence;
+	uint64_t reserved;
+};
+
 #define NOUVEAU_GEM_CPU_PREP_NOWAIT                                  0x00000001
 #define NOUVEAU_GEM_CPU_PREP_NOBLOCK                                 0x00000002
 #define NOUVEAU_GEM_CPU_PREP_WRITE                                   0x00000004
@@ -204,5 +213,6 @@ struct drm_nouveau_sarea {
 #define DRM_NOUVEAU_GEM_CPU_PREP       0x42
 #define DRM_NOUVEAU_GEM_CPU_FINI       0x43
 #define DRM_NOUVEAU_GEM_INFO           0x44
+#define DRM_NOUVEAU_GEM_PUSHBUF_2      0x45
 
 #endif /* __NOUVEAU_DRM_H__ */
diff --git a/nouveau/nouveau.h b/nouveau/nouveau.h
index a55e2b0..281420f 100644
--- a/nouveau/nouveau.h
+++ b/nouveau/nouveau.h
@@ -225,6 +225,8 @@ void nouveau_pushbuf_reloc(struct nouveau_pushbuf *, struct nouveau_bo *,
 int  nouveau_pushbuf_validate(struct nouveau_pushbuf *);
 uint32_t nouveau_pushbuf_refd(struct nouveau_pushbuf *, struct nouveau_bo *);
 int  nouveau_pushbuf_kick(struct nouveau_pushbuf *, struct nouveau_object *channel);
+int  nouveau_pushbuf_kick_fence(struct nouveau_pushbuf *,
+				struct nouveau_object *channel, int *fence);
 struct nouveau_bufctx *
 nouveau_pushbuf_bufctx(struct nouveau_pushbuf *, struct nouveau_bufctx *);
 
diff --git a/nouveau/pushbuf.c b/nouveau/pushbuf.c
index 6e703a4..8667d05 100644
--- a/nouveau/pushbuf.c
+++ b/nouveau/pushbuf.c
@@ -33,6 +33,7 @@
 #include <string.h>
 #include <assert.h>
 #include <errno.h>
+#include <unistd.h>
 
 #include <xf86drm.h>
 #include <xf86atomic.h>
@@ -77,7 +78,7 @@ nouveau_pushbuf(struct nouveau_pushbuf *push)
 }
 
 static int pushbuf_validate(struct nouveau_pushbuf *, bool);
-static int pushbuf_flush(struct nouveau_pushbuf *);
+static int pushbuf_flush(struct nouveau_pushbuf *, int *);
 
 static bool
 pushbuf_kref_fits(struct nouveau_pushbuf *push, struct nouveau_bo *bo,
@@ -172,7 +173,7 @@ pushbuf_kref(struct nouveau_pushbuf *push, struct nouveau_bo *bo,
 	 */
 	fpush = cli_push_get(push->client, bo);
 	if (fpush && fpush != push)
-		pushbuf_flush(fpush);
+		pushbuf_flush(fpush, NULL);
 
 	kref = cli_kref_get(push->client, bo);
 	if (kref) {
@@ -305,18 +306,21 @@ pushbuf_dump(struct nouveau_pushbuf_krec *krec, int krec_id, int chid)
 }
 
 static int
-pushbuf_submit(struct nouveau_pushbuf *push, struct nouveau_object *chan)
+pushbuf_submit(struct nouveau_pushbuf *push, struct nouveau_object *chan,
+	       int *fence)
 {
 	struct nouveau_pushbuf_priv *nvpb = nouveau_pushbuf(push);
 	struct nouveau_pushbuf_krec *krec = nvpb->list;
 	struct nouveau_device *dev = push->client->device;
 	struct drm_nouveau_gem_pushbuf_bo_presumed *info;
 	struct drm_nouveau_gem_pushbuf_bo *kref;
-	struct drm_nouveau_gem_pushbuf req;
+	struct drm_nouveau_gem_pushbuf_2 req_2;
+	struct drm_nouveau_gem_pushbuf *req = &req_2.base;
 	struct nouveau_fifo *fifo = chan->data;
 	struct nouveau_bo *bo;
 	int krec_id = 0;
 	int ret = 0, i;
+	int fence_out = -1;
 
 	if (chan->oclass != NOUVEAU_FIFO_CHANNEL_CLASS)
 		return -EINVAL;
@@ -326,30 +330,42 @@ pushbuf_submit(struct nouveau_pushbuf *push, struct nouveau_object *chan)
 
 	nouveau_pushbuf_data(push, NULL, 0, 0);
 
+	/* TODO: If fence is requested, force kickoff. */
 	while (krec && krec->nr_push) {
-		req.channel = fifo->channel;
-		req.nr_buffers = krec->nr_buffer;
-		req.buffers = (uint64_t)(unsigned long)krec->buffer;
-		req.nr_relocs = krec->nr_reloc;
-		req.nr_push = krec->nr_push;
-		req.relocs = (uint64_t)(unsigned long)krec->reloc;
-		req.push = (uint64_t)(unsigned long)krec->push;
-		req.suffix0 = nvpb->suffix0;
-		req.suffix1 = nvpb->suffix1;
-		req.vram_available = 0; /* for valgrind */
-		req.gart_available = 0;
+		req->channel = fifo->channel;
+		req->nr_buffers = krec->nr_buffer;
+		req->buffers = (uint64_t)(unsigned long)krec->buffer;
+		req->nr_relocs = krec->nr_reloc;
+		req->nr_push = krec->nr_push;
+		req->relocs = (uint64_t)(unsigned long)krec->reloc;
+		req->push = (uint64_t)(unsigned long)krec->push;
+		req->suffix0 = nvpb->suffix0;
+		req->suffix1 = nvpb->suffix1;
+		req->vram_available = 0; /* for valgrind */
+		req->gart_available = 0;
+		if (fence) {
+			req_2.flags = NOUVEAU_GEM_PUSHBUF_2_FENCE_EMIT;
+			if (*fence >= 0)
+				req_2.flags |= NOUVEAU_GEM_PUSHBUF_2_FENCE_WAIT;
+			req_2.fence = *fence;
+			req_2.reserved = 0;
+		}
 
 		if (dbg_on(0))
 			pushbuf_dump(krec, krec_id++, fifo->channel);
 
 #ifndef SIMULATE
-		ret = drmCommandWriteRead(dev->fd, DRM_NOUVEAU_GEM_PUSHBUF,
-					  &req, sizeof(req));
-		nvpb->suffix0 = req.suffix0;
-		nvpb->suffix1 = req.suffix1;
-		dev->vram_limit = (req.vram_available *
+		if (fence)
+			ret = drmCommandWriteRead(dev->fd, DRM_NOUVEAU_GEM_PUSHBUF_2,
+						  &req_2, sizeof(req_2));
+		else
+			ret = drmCommandWriteRead(dev->fd, DRM_NOUVEAU_GEM_PUSHBUF,
+						  req, sizeof(*req));
+		nvpb->suffix0 = req->suffix0;
+		nvpb->suffix1 = req->suffix1;
+		dev->vram_limit = (req->vram_available *
 				nouveau_device(dev)->vram_limit_percent) / 100;
-		dev->gart_limit = (req.gart_available *
+		dev->gart_limit = (req->gart_available *
 				nouveau_device(dev)->gart_limit_percent) / 100;
 #else
 		if (dbg_on(31))
@@ -362,6 +378,12 @@ pushbuf_submit(struct nouveau_pushbuf *push, struct nouveau_object *chan)
 			break;
 		}
 
+		if (fence) {
+			if (fence_out >= 0)
+				close(fence_out);
+			fence_out = req_2.fence;
+		}
+
 		kref = krec->buffer;
 		for (i = 0; i < krec->nr_buffer; i++, kref++) {
 			bo = (void *)(unsigned long)kref->user_priv;
@@ -385,11 +407,17 @@ pushbuf_submit(struct nouveau_pushbuf *push, struct nouveau_object *chan)
 		krec = krec->next;
 	}
 
+	if (!ret && fence) {
+		if (*fence >= 0)
+			close(*fence);
+		*fence = fence_out;
+	}
+
 	return ret;
 }
 
 static int
-pushbuf_flush(struct nouveau_pushbuf *push)
+pushbuf_flush(struct nouveau_pushbuf *push, int *fence)
 {
 	struct nouveau_pushbuf_priv *nvpb = nouveau_pushbuf(push);
 	struct nouveau_pushbuf_krec *krec = nvpb->krec;
@@ -399,7 +427,7 @@ pushbuf_flush(struct nouveau_pushbuf *push)
 	int ret = 0, i;
 
 	if (push->channel) {
-		ret = pushbuf_submit(push, push->channel);
+		ret = pushbuf_submit(push, push->channel, fence);
 	} else {
 		nouveau_pushbuf_data(push, NULL, 0, 0);
 		krec->next = malloc(sizeof(*krec));
@@ -469,7 +497,7 @@ pushbuf_refn(struct nouveau_pushbuf *push, bool retry,
 	if (ret) {
 		pushbuf_refn_fail(push, sref, krec->nr_reloc);
 		if (retry) {
-			pushbuf_flush(push);
+			pushbuf_flush(push, NULL);
 			nouveau_pushbuf_space(push, 0, 0, 0);
 			return pushbuf_refn(push, false, refs, nr);
 		}
@@ -521,7 +549,7 @@ pushbuf_validate(struct nouveau_pushbuf *push, bool retry)
 	if (ret) {
 		pushbuf_refn_fail(push, sref, srel);
 		if (retry) {
-			pushbuf_flush(push);
+			pushbuf_flush(push, NULL);
 			return pushbuf_validate(push, false);
 		}
 	}
@@ -673,7 +701,7 @@ nouveau_pushbuf_space(struct nouveau_pushbuf *push,
 	    krec->nr_reloc + relocs >= NOUVEAU_GEM_MAX_RELOCS ||
 	    krec->nr_push + pushes >= NOUVEAU_GEM_MAX_PUSH) {
 		if (nvpb->bo && krec->nr_buffer)
-			pushbuf_flush(push);
+			pushbuf_flush(push, NULL);
 		flushed = true;
 	}
 
@@ -767,10 +795,17 @@ nouveau_pushbuf_refd(struct nouveau_pushbuf *push, struct nouveau_bo *bo)
 }
 
 drm_public int
-nouveau_pushbuf_kick(struct nouveau_pushbuf *push, struct nouveau_object *chan)
+nouveau_pushbuf_kick_fence(struct nouveau_pushbuf *push,
+			   struct nouveau_object *chan, int *fence)
 {
 	if (!push->channel)
-		return pushbuf_submit(push, chan);
-	pushbuf_flush(push);
+		return pushbuf_submit(push, chan, fence);
+	pushbuf_flush(push, fence);
 	return pushbuf_validate(push, false);
 }
+
+drm_public int
+nouveau_pushbuf_kick(struct nouveau_pushbuf *push, struct nouveau_object *chan)
+{
+	return nouveau_pushbuf_kick_fence(push, chan, NULL);
+}
-- 
1.8.1.5

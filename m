From: Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
Subject: [PATCH 1/2] libdrm/nouveau: new optimized libdrm
	pushbuffer ABI
Date: Fri, 29 Jan 2010 09:53:24 +0100
Message-ID: <1264755205-21514-1-git-send-email-luca@luca-barbieri.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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
Cc: Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
List-Id: nouveau.vger.kernel.org

This patch changes the pushbuffer ABI to:

1. No longer use/expose nouveau_pushbuffer. Everything is directly
   in nouveau_channel. This saves the extra "pushbuf" pointer dereference.

2. Use cur/end pointers instead of tracking the remaining size.
   Pushing data now only needs to alter cur and not both cur and remaining.

The goal is to make the *_RING macros faster and make the interface simpler
and cleaner in the process.

The *_RING APIs are unchanged, but those are inlined and the ABI is changed.
The libdrm version is thus bumped.

Also, anything accessing pushbuf->remaining instead of using AVAIL_RING
will need to be fixed.
---
 include/drm/nouveau_drm.h |    2 +-
 nouveau/nouveau_bo.c      |    2 +-
 nouveau/nouveau_channel.h |    5 ++-
 nouveau/nouveau_device.c  |    2 +-
 nouveau/nouveau_private.h |    3 --
 nouveau/nouveau_pushbuf.c |   47 ++++++++++++++++++++------------------------
 nouveau/nouveau_pushbuf.h |   22 ++++++--------------
 7 files changed, 34 insertions(+), 49 deletions(-)

diff --git a/include/drm/nouveau_drm.h b/include/drm/nouveau_drm.h
index 1e67c44..f764174 100644
--- a/include/drm/nouveau_drm.h
+++ b/include/drm/nouveau_drm.h
@@ -25,7 +25,7 @@
 #ifndef __NOUVEAU_DRM_H__
 #define __NOUVEAU_DRM_H__
 
-#define NOUVEAU_DRM_HEADER_PATCHLEVEL 15
+#define NOUVEAU_DRM_HEADER_PATCHLEVEL 16
 
 struct drm_nouveau_channel_alloc {
 	uint32_t     fb_ctxdma_handle;
diff --git a/nouveau/nouveau_bo.c b/nouveau/nouveau_bo.c
index 10cc8a6..ac1b37f 100644
--- a/nouveau/nouveau_bo.c
+++ b/nouveau/nouveau_bo.c
@@ -565,7 +565,7 @@ nouveau_bo_pending(struct nouveau_bo *bo)
 struct drm_nouveau_gem_pushbuf_bo *
 nouveau_bo_emit_buffer(struct nouveau_channel *chan, struct nouveau_bo *bo)
 {
-	struct nouveau_pushbuf_priv *nvpb = nouveau_pushbuf(chan->pushbuf);
+	struct nouveau_pushbuf_priv *nvpb = &nouveau_channel(chan)->pb;
 	struct nouveau_bo_priv *nvbo = nouveau_bo(bo);
 	struct drm_nouveau_gem_pushbuf_bo *pbbo;
 	struct nouveau_bo *ref = NULL;
diff --git a/nouveau/nouveau_channel.h b/nouveau/nouveau_channel.h
index 294f749..ddcf8e4 100644
--- a/nouveau/nouveau_channel.h
+++ b/nouveau/nouveau_channel.h
@@ -29,11 +29,12 @@ struct nouveau_subchannel {
 };
 
 struct nouveau_channel {
+	uint32_t *cur;
+	uint32_t *end;
+
 	struct nouveau_device *device;
 	int id;
 
-	struct nouveau_pushbuf *pushbuf;
-
 	struct nouveau_grobj *nullobj;
 	struct nouveau_grobj *vram;
 	struct nouveau_grobj *gart;
diff --git a/nouveau/nouveau_device.c b/nouveau/nouveau_device.c
index 0982d3b..14bf8bb 100644
--- a/nouveau/nouveau_device.c
+++ b/nouveau/nouveau_device.c
@@ -26,7 +26,7 @@
 
 #include "nouveau_private.h"
 
-#if NOUVEAU_DRM_HEADER_PATCHLEVEL != 15
+#if NOUVEAU_DRM_HEADER_PATCHLEVEL != 16
 #error nouveau_drm.h does not match expected patchlevel, update libdrm.
 #endif
 
diff --git a/nouveau/nouveau_private.h b/nouveau/nouveau_private.h
index 39758d1..0e526a1 100644
--- a/nouveau/nouveau_private.h
+++ b/nouveau/nouveau_private.h
@@ -39,8 +39,6 @@
 #define CALPB_BUFFERS 4
 #define CALPB_BUFSZ   16384
 struct nouveau_pushbuf_priv {
-	struct nouveau_pushbuf base;
-
 	int no_aper_update;
 	int use_cal;
 	uint32_t cal_suffix0;
@@ -50,7 +48,6 @@ struct nouveau_pushbuf_priv {
 	int current_offset;
 
 	unsigned *pushbuf;
-	unsigned  size;
 
 	unsigned marker;
 	unsigned marker_relocs;
diff --git a/nouveau/nouveau_pushbuf.c b/nouveau/nouveau_pushbuf.c
index 7da3a47..b6af216 100644
--- a/nouveau/nouveau_pushbuf.c
+++ b/nouveau/nouveau_pushbuf.c
@@ -37,12 +37,13 @@ nouveau_pushbuf_space_call(struct nouveau_channel *chan, unsigned min)
 	struct nouveau_pushbuf_priv *nvpb = &nvchan->pb;
 	struct nouveau_bo *bo;
 	int ret;
+	unsigned size;
 
 	if (min < PB_MIN_USER_DWORDS)
 		min = PB_MIN_USER_DWORDS;
 
-	nvpb->current_offset = nvpb->base.cur - nvpb->pushbuf;
-	if (nvpb->current_offset + min + 2 <= nvpb->size)
+	nvpb->current_offset = chan->cur - nvpb->pushbuf;
+	if (chan->cur + min + 2 <= chan->end)
 		return 0;
 
 	nvpb->current++;
@@ -54,13 +55,12 @@ nouveau_pushbuf_space_call(struct nouveau_channel *chan, unsigned min)
 	if (ret)
 		return ret;
 
-	nvpb->size = (bo->size - 8) / 4;
+	size = (bo->size - 8) / 4;
 	nvpb->pushbuf = bo->map;
 	nvpb->current_offset = 0;
 
-	nvpb->base.channel = chan;
-	nvpb->base.remaining = nvpb->size;
-	nvpb->base.cur = nvpb->pushbuf;
+	chan->cur = nvpb->pushbuf;
+	chan->end = nvpb->pushbuf + size;
 
 	nouveau_bo_unmap(bo);
 	return 0;
@@ -71,6 +71,7 @@ nouveau_pushbuf_space(struct nouveau_channel *chan, unsigned min)
 {
 	struct nouveau_channel_priv *nvchan = nouveau_channel(chan);
 	struct nouveau_pushbuf_priv *nvpb = &nvchan->pb;
+	unsigned size;
 
 	if (nvpb->use_cal)
 		return nouveau_pushbuf_space_call(chan, min);
@@ -80,12 +81,11 @@ nouveau_pushbuf_space(struct nouveau_channel *chan, unsigned min)
 		nvpb->pushbuf = NULL;
 	}
 
-	nvpb->size = min < PB_MIN_USER_DWORDS ? PB_MIN_USER_DWORDS : min;
-	nvpb->pushbuf = malloc(sizeof(uint32_t) * nvpb->size);
+	size = min < PB_MIN_USER_DWORDS ? PB_MIN_USER_DWORDS : min;
+	nvpb->pushbuf = malloc(sizeof(uint32_t) * size);
 
-	nvpb->base.channel = chan;
-	nvpb->base.remaining = nvpb->size;
-	nvpb->base.cur = nvpb->pushbuf;
+	chan->cur = nvpb->pushbuf;
+	chan->end = nvpb->pushbuf + size;
 
 	return 0;
 }
@@ -165,8 +165,6 @@ nouveau_pushbuf_init(struct nouveau_channel *chan)
 			       sizeof(struct drm_nouveau_gem_pushbuf_bo));
 	nvpb->relocs = calloc(NOUVEAU_GEM_MAX_RELOCS,
 			      sizeof(struct drm_nouveau_gem_pushbuf_reloc));
-
-	chan->pushbuf = &nvpb->base;
 	return 0;
 }
 
@@ -189,16 +187,14 @@ nouveau_pushbuf_flush(struct nouveau_channel *chan, unsigned min)
 	unsigned i;
 	int ret;
 
-	if (nvpb->base.remaining == nvpb->size)
+	if (chan->cur == nvpb->pushbuf)
 		return 0;
 
 	if (nvpb->use_cal) {
 		struct drm_nouveau_gem_pushbuf_call req;
 
-		*(nvpb->base.cur++) = nvpb->cal_suffix0;
-		*(nvpb->base.cur++) = nvpb->cal_suffix1;
-		if (nvpb->base.remaining > 2) /* space() will fixup if not */
-			nvpb->base.remaining -= 2;
+		*(chan->cur++) = nvpb->cal_suffix0;
+		*(chan->cur++) = nvpb->cal_suffix1;
 
 restart_cal:
 		req.channel = chan->id;
@@ -208,7 +204,7 @@ restart_cal:
 		req.buffers = (uint64_t)(unsigned long)nvpb->buffers;
 		req.nr_relocs = nvpb->nr_relocs;
 		req.relocs = (uint64_t)(unsigned long)nvpb->relocs;
-		req.nr_dwords = (nvpb->base.cur - nvpb->pushbuf) -
+		req.nr_dwords = (chan->cur - nvpb->pushbuf) -
 				nvpb->current_offset;
 		req.suffix0 = nvpb->cal_suffix0;
 		req.suffix1 = nvpb->cal_suffix1;
@@ -229,7 +225,7 @@ restart_cal:
 
 restart_push:
 		req.channel = chan->id;
-		req.nr_dwords = nvpb->size - nvpb->base.remaining;
+		req.nr_dwords = chan->cur - nvpb->pushbuf;
 		req.dwords = (uint64_t)(unsigned long)nvpb->pushbuf;
 		req.nr_buffers = nvpb->nr_buffers;
 		req.buffers = (uint64_t)(unsigned long)nvpb->buffers;
@@ -281,7 +277,7 @@ int
 nouveau_pushbuf_marker_emit(struct nouveau_channel *chan,
 			    unsigned wait_dwords, unsigned wait_relocs)
 {
-	struct nouveau_pushbuf_priv *nvpb = nouveau_pushbuf(chan->pushbuf);
+	struct nouveau_pushbuf_priv *nvpb = &nouveau_channel(chan)->pb;
 
 	if (AVAIL_RING(chan) < wait_dwords)
 		return nouveau_pushbuf_flush(chan, wait_dwords);
@@ -289,7 +285,7 @@ nouveau_pushbuf_marker_emit(struct nouveau_channel *chan,
 	if (nvpb->nr_relocs + wait_relocs >= NOUVEAU_GEM_MAX_RELOCS)
 		return nouveau_pushbuf_flush(chan, wait_dwords);
 
-	nvpb->marker = nvpb->base.cur - nvpb->pushbuf;
+	nvpb->marker = chan->cur - nvpb->pushbuf;
 	nvpb->marker_relocs = nvpb->nr_relocs;
 	return 0;
 }
@@ -297,7 +293,7 @@ nouveau_pushbuf_marker_emit(struct nouveau_channel *chan,
 void
 nouveau_pushbuf_marker_undo(struct nouveau_channel *chan)
 {
-	struct nouveau_pushbuf_priv *nvpb = nouveau_pushbuf(chan->pushbuf);
+	struct nouveau_pushbuf_priv *nvpb = &nouveau_channel(chan)->pb;
 	unsigned i;
 
 	if (!nvpb->marker)
@@ -321,8 +317,7 @@ nouveau_pushbuf_marker_undo(struct nouveau_channel *chan)
 	nvpb->nr_relocs = nvpb->marker_relocs;
 
 	/* reset pushbuf back to last marker */
-	nvpb->base.cur = nvpb->pushbuf + nvpb->marker;
-	nvpb->base.remaining = nvpb->size - nvpb->marker;
+	chan->cur = nvpb->pushbuf + nvpb->marker;
 	nvpb->marker = 0;
 }
 
@@ -355,7 +350,7 @@ nouveau_pushbuf_emit_reloc(struct nouveau_channel *chan, void *ptr,
 			   struct nouveau_bo *bo, uint32_t data, uint32_t data2,
 			   uint32_t flags, uint32_t vor, uint32_t tor)
 {
-	struct nouveau_pushbuf_priv *nvpb = nouveau_pushbuf(chan->pushbuf);
+	struct nouveau_pushbuf_priv *nvpb = &nouveau_channel(chan)->pb;
 	struct nouveau_bo_priv *nvbo = nouveau_bo(bo);
 	struct drm_nouveau_gem_pushbuf_reloc *r;
 	struct drm_nouveau_gem_pushbuf_bo *pbbo;
diff --git a/nouveau/nouveau_pushbuf.h b/nouveau/nouveau_pushbuf.h
index 46982af..803e129 100644
--- a/nouveau/nouveau_pushbuf.h
+++ b/nouveau/nouveau_pushbuf.h
@@ -29,13 +29,6 @@
 #include "nouveau_bo.h"
 #include "nouveau_grobj.h"
 
-struct nouveau_pushbuf {
-	struct nouveau_channel *channel;
-
-	unsigned remaining;
-	uint32_t *cur;
-};
-
 int
 nouveau_pushbuf_flush(struct nouveau_channel *, unsigned min);
 
@@ -67,14 +60,14 @@ MARK_UNDO(struct nouveau_channel *chan)
 static __inline__ void
 OUT_RING(struct nouveau_channel *chan, unsigned data)
 {
-	*(chan->pushbuf->cur++) = (data);
+	*(chan->cur++) = (data);
 }
 
 static __inline__ void
 OUT_RINGp(struct nouveau_channel *chan, const void *data, unsigned size)
 {
-	memcpy(chan->pushbuf->cur, data, size * 4);
-	chan->pushbuf->cur += size;
+	memcpy(chan->cur, data, size * 4);
+	chan->cur += size;
 }
 
 static __inline__ void
@@ -88,13 +81,13 @@ OUT_RINGf(struct nouveau_channel *chan, float f)
 static __inline__ unsigned
 AVAIL_RING(struct nouveau_channel *chan)
 {
-	return chan->pushbuf->remaining;
+	return chan->end - chan->cur;
 }
 
 static __inline__ void
 WAIT_RING(struct nouveau_channel *chan, unsigned size)
 {
-	if (chan->pushbuf->remaining < size)
+	if (chan->cur + size > chan->end)
 		nouveau_pushbuf_flush(chan, size);
 }
 
@@ -108,7 +101,6 @@ BEGIN_RING(struct nouveau_channel *chan, struct nouveau_grobj *gr,
 
 	WAIT_RING(chan, size + 1);
 	OUT_RING(chan, (gr->subc << 13) | (size << 18) | mthd);
-	chan->pushbuf->remaining -= (size + 1);
 }
 
 /* non-incrementing BEGIN_RING */
@@ -147,7 +139,7 @@ static __inline__ int
 OUT_RELOC(struct nouveau_channel *chan, struct nouveau_bo *bo,
 	  unsigned data, unsigned flags, unsigned vor, unsigned tor)
 {
-	return nouveau_pushbuf_emit_reloc(chan, chan->pushbuf->cur++, bo,
+	return nouveau_pushbuf_emit_reloc(chan, chan->cur++, bo,
 					  data, 0, flags, vor, tor);
 }
 
@@ -156,7 +148,7 @@ OUT_RELOC2(struct nouveau_channel *chan, struct nouveau_bo *bo,
 	   unsigned data, unsigned data2, unsigned flags,
 	   unsigned vor, unsigned tor)
 {
-	return nouveau_pushbuf_emit_reloc(chan, chan->pushbuf->cur++, bo,
+	return nouveau_pushbuf_emit_reloc(chan, chan->cur++, bo,
 					  data, data2, flags, vor, tor);
 }
 
-- 
1.6.6.1.476.g01ddb

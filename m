From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [libdrm PATCH 3/3] nouveau: remove unused data2 argument
	from reloc functions
Date: Sun,  9 Jan 2011 18:31:00 +0100
Message-ID: <1294594263-1862-3-git-send-email-marcin.slusarz@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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

Remove data2 arg from nouveau_pushbuf_emit_reloc and nouveau_reloc_emit.
Note: it changes the API & ABI of libdrm_nouveau.
---
 nouveau/nouveau_pushbuf.c |    4 ++--
 nouveau/nouveau_pushbuf.h |    4 ++--
 nouveau/nouveau_reloc.c   |    2 +-
 nouveau/nouveau_reloc.h   |    2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/nouveau/nouveau_pushbuf.c b/nouveau/nouveau_pushbuf.c
index 90836bc..0d7f3d0 100644
--- a/nouveau/nouveau_pushbuf.c
+++ b/nouveau/nouveau_pushbuf.c
@@ -326,7 +326,7 @@ nouveau_pushbuf_marker_undo(struct nouveau_channel *chan)
 
 int
 nouveau_pushbuf_emit_reloc(struct nouveau_channel *chan, void *ptr,
-			   struct nouveau_bo *bo, uint32_t data, uint32_t data2,
+			   struct nouveau_bo *bo, uint32_t data,
 			   uint32_t flags, uint32_t vor, uint32_t tor)
 {
 	struct nouveau_pushbuf_priv *nvpb = &nouveau_channel(chan)->pb;
@@ -334,7 +334,7 @@ nouveau_pushbuf_emit_reloc(struct nouveau_channel *chan, void *ptr,
 
 	ret = nouveau_reloc_emit(chan, nvpb->buffer[nvpb->current],
 				 (char *)ptr - (char *)nvpb->pushbuf, ptr,
-				 bo, data, data2, flags, vor, tor);
+				 bo, data, flags, vor, tor);
 	if (ret)
 		return ret;
 
diff --git a/nouveau/nouveau_pushbuf.h b/nouveau/nouveau_pushbuf.h
index 5151e01..c046f4d 100644
--- a/nouveau/nouveau_pushbuf.h
+++ b/nouveau/nouveau_pushbuf.h
@@ -41,7 +41,7 @@ nouveau_pushbuf_marker_undo(struct nouveau_channel *chan);
 
 int
 nouveau_pushbuf_emit_reloc(struct nouveau_channel *, void *ptr,
-			   struct nouveau_bo *, uint32_t data, uint32_t data2,
+			   struct nouveau_bo *, uint32_t data,
 			   uint32_t flags, uint32_t vor, uint32_t tor);
 
 int
@@ -106,7 +106,7 @@ OUT_RELOC(struct nouveau_channel *chan, struct nouveau_bo *bo,
 	  unsigned data, unsigned flags, unsigned vor, unsigned tor)
 {
 	return nouveau_pushbuf_emit_reloc(chan, chan->cur++, bo,
-					  data, 0, flags, vor, tor);
+					  data, flags, vor, tor);
 }
 
 /* Raw data + flags depending on FB/TT buffer */
diff --git a/nouveau/nouveau_reloc.c b/nouveau/nouveau_reloc.c
index cd219db..c636333 100644
--- a/nouveau/nouveau_reloc.c
+++ b/nouveau/nouveau_reloc.c
@@ -54,7 +54,7 @@ nouveau_reloc_calc(struct drm_nouveau_gem_pushbuf_bo *pbbo,
 int
 nouveau_reloc_emit(struct nouveau_channel *chan, struct nouveau_bo *reloc_bo,
 		   uint32_t reloc_offset, uint32_t *reloc_ptr,
-		   struct nouveau_bo *bo, uint32_t data, uint32_t data2,
+		   struct nouveau_bo *bo, uint32_t data,
 		   uint32_t flags, uint32_t vor, uint32_t tor)
 {
 	struct nouveau_pushbuf_priv *nvpb = &nouveau_channel(chan)->pb;
diff --git a/nouveau/nouveau_reloc.h b/nouveau/nouveau_reloc.h
index 24ddb52..98e0b43 100644
--- a/nouveau/nouveau_reloc.h
+++ b/nouveau/nouveau_reloc.h
@@ -26,7 +26,7 @@
 int
 nouveau_reloc_emit(struct nouveau_channel *chan, struct nouveau_bo *reloc_bo,
 		   uint32_t reloc_offset, uint32_t *reloc_ptr,
-		   struct nouveau_bo *bo, uint32_t data, uint32_t data2,
+		   struct nouveau_bo *bo, uint32_t data,
 		   uint32_t flags, uint32_t vor, uint32_t tor);
 
 #endif
-- 
1.7.3.3

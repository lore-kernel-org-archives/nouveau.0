From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [libdrm PATCH] nouveau: optimize OUT_RELOC2
Date: Wed, 12 Jan 2011 21:43:50 +0100
Message-ID: <1294865031-22457-2-git-send-email-marcin.slusarz@gmail.com>
References: <1294865031-22457-1-git-send-email-marcin.slusarz@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1294865031-22457-1-git-send-email-marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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

use one relocation with newly introduced flag

unfortunately we can't enable it unconditionally, because we don't
know if the kernel supports it...
---
 include/drm/nouveau_drm.h |    1 +
 nouveau/nouveau_bo.h      |    1 +
 nouveau/nouveau_pushbuf.h |    9 +++++++++
 nouveau/nouveau_reloc.c   |   28 ++++++++++++++++++++++------
 4 files changed, 33 insertions(+), 6 deletions(-)

diff --git a/include/drm/nouveau_drm.h b/include/drm/nouveau_drm.h
index b18cad0..4c35399 100644
--- a/include/drm/nouveau_drm.h
+++ b/include/drm/nouveau_drm.h
@@ -138,6 +138,7 @@ struct drm_nouveau_gem_pushbuf_bo {
 #define NOUVEAU_GEM_RELOC_LOW  (1 << 0)
 #define NOUVEAU_GEM_RELOC_HIGH (1 << 1)
 #define NOUVEAU_GEM_RELOC_OR   (1 << 2)
+#define NOUVEAU_GEM_RELOC_HILO (1 << 3)
 #define NOUVEAU_GEM_MAX_RELOCS 1024
 struct drm_nouveau_gem_pushbuf_reloc {
 	uint32_t reloc_bo_index;
diff --git a/nouveau/nouveau_bo.h b/nouveau/nouveau_bo.h
index 3a1f2d4..bbf88ec 100644
--- a/nouveau/nouveau_bo.h
+++ b/nouveau/nouveau_bo.h
@@ -37,6 +37,7 @@
 #define NOUVEAU_BO_NOSYNC (1 << 13)
 #define NOUVEAU_BO_NOWAIT (1 << 14)
 #define NOUVEAU_BO_IFLUSH (1 << 15)
+#define NOUVEAU_BO_HILO   (1 << 16)
 #define NOUVEAU_BO_DUMMY  (1 << 31)
 
 #define NOUVEAU_BO_TILE_LAYOUT_MASK 0x0000ff00
diff --git a/nouveau/nouveau_pushbuf.h b/nouveau/nouveau_pushbuf.h
index f256c70..92bffde 100644
--- a/nouveau/nouveau_pushbuf.h
+++ b/nouveau/nouveau_pushbuf.h
@@ -142,15 +142,24 @@ OUT_RELOCh(struct nouveau_channel *chan, struct nouveau_bo *bo,
 	return OUT_RELOC(chan, bo, delta, flags | NOUVEAU_BO_HIGH, 0, 0);
 }
 
+//disabled for now
+//#define NOUVEAU_DRM_NEW_RELOC
 /* High 32-bits, then low 32-bits of offset */
 static __inline__ int
 OUT_RELOC2(struct nouveau_channel *chan, struct nouveau_bo *bo,
 	   unsigned delta, unsigned flags)
 {
+#ifdef NOUVEAU_DRM_NEW_RELOC
+	int r = nouveau_pushbuf_emit_reloc(chan, chan->cur, bo,
+					  delta, flags | NOUVEAU_BO_HILO, 0, 0);
+	chan->cur += 2;
+	return r;
+#else
 	int r = OUT_RELOC(chan, bo, delta, flags | NOUVEAU_BO_HIGH, 0, 0);
 	if (r)
 		return r;
 	return OUT_RELOC(chan, bo, delta, flags | NOUVEAU_BO_LOW, 0, 0);
+#endif
 }
 
 #endif
diff --git a/nouveau/nouveau_reloc.c b/nouveau/nouveau_reloc.c
index c636333..864ab61 100644
--- a/nouveau/nouveau_reloc.c
+++ b/nouveau/nouveau_reloc.c
@@ -29,19 +29,21 @@
 
 static uint32_t
 nouveau_reloc_calc(struct drm_nouveau_gem_pushbuf_bo *pbbo,
-		   struct drm_nouveau_gem_pushbuf_reloc *r)
+		   struct drm_nouveau_gem_pushbuf_reloc *r,
+		   uint32_t flags)
 {
 	uint32_t push = 0;
+	flags |= r->flags;
 
-	if (r->flags & NOUVEAU_GEM_RELOC_LOW)
+	if (flags & NOUVEAU_GEM_RELOC_LOW)
 		push = (pbbo->presumed.offset + r->data);
 	else
-	if (r->flags & NOUVEAU_GEM_RELOC_HIGH)
+	if (flags & NOUVEAU_GEM_RELOC_HIGH)
 		push = (pbbo->presumed.offset + r->data) >> 32;
 	else
 		push = r->data;
 
-	if (r->flags & NOUVEAU_GEM_RELOC_OR) {
+	if (flags & NOUVEAU_GEM_RELOC_OR) {
 		if (pbbo->presumed.domain & NOUVEAU_GEM_DOMAIN_VRAM)
 			push |= r->vor;
 		else
@@ -138,15 +140,29 @@ nouveau_reloc_emit(struct nouveau_channel *chan, struct nouveau_bo *reloc_bo,
 		r->flags |= NOUVEAU_GEM_RELOC_HIGH;
 	if (flags & NOUVEAU_BO_OR)
 		r->flags |= NOUVEAU_GEM_RELOC_OR;
+	if (flags & NOUVEAU_BO_HILO)
+		r->flags |= NOUVEAU_GEM_RELOC_HILO;
 	r->data = data;
 	r->vor = vor;
 	r->tor = tor;
 
 	if (reloc_ptr) {
 		if (flags & NOUVEAU_BO_DUMMY)
-			*reloc_ptr = 0;
+			if (flags & NOUVEAU_BO_HILO) {
+				reloc_ptr[0] = 0;
+				reloc_ptr[1] = 0;
+			} else 
+				*reloc_ptr = 0;
 		else
-			*reloc_ptr = nouveau_reloc_calc(pbbo, r);
+		{
+			if (flags & NOUVEAU_BO_HILO) {
+				reloc_ptr[0] = nouveau_reloc_calc(pbbo, r,
+							NOUVEAU_GEM_RELOC_HIGH);
+				reloc_ptr[1] = nouveau_reloc_calc(pbbo, r,
+							NOUVEAU_GEM_RELOC_LOW);
+			} else
+				*reloc_ptr = nouveau_reloc_calc(pbbo, r, 0);
+		}
 	}
 
 	return 0;
-- 
1.7.3.3

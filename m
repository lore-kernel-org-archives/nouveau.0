From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/2] nv50: don't emit reloc markers after a
	referenced vtxbuf is mapped
Date: Sun, 20 Dec 2009 14:01:23 +0100
Message-ID: <1261314083-3294-1-git-send-email-madman2003@gmail.com>
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
List-Id: nouveau.vger.kernel.org

- This avoids some problematic "reloc'ed while mapped" messages and
some associated corruption as well.

Signed-off-by: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 src/gallium/drivers/nouveau/nouveau_screen.c   |   21 +++++++++++++++++++++
 src/gallium/drivers/nouveau/nouveau_screen.h   |    3 +++
 src/gallium/drivers/nouveau/nouveau_stateobj.h |   20 +++++++++++++++++++-
 src/gallium/drivers/nv50/nv50_screen.c         |   20 ++++++++++++++++++++
 src/gallium/drivers/nv50/nv50_screen.h         |    2 ++
 src/gallium/drivers/nv50/nv50_state_validate.c |    2 ++
 src/gallium/drivers/nv50/nv50_vbo.c            |    4 +++-
 7 files changed, 70 insertions(+), 2 deletions(-)

diff --git a/src/gallium/drivers/nouveau/nouveau_screen.c b/src/gallium/drivers/nouveau/nouveau_screen.c
index e4cf91c..c85057a 100644
--- a/src/gallium/drivers/nouveau/nouveau_screen.c
+++ b/src/gallium/drivers/nouveau/nouveau_screen.c
@@ -127,8 +127,18 @@ nouveau_screen_bo_map(struct pipe_screen *pscreen, struct pipe_buffer *pb,
 		      unsigned usage)
 {
 	struct nouveau_bo *bo = nouveau_bo(pb);
+	struct nouveau_screen *nscreen = nouveau_screen(pscreen);
 	int ret;
 
+	if (nscreen->pre_pipebuffer_map_callback) {
+		ret = nscreen->pre_pipebuffer_map_callback(pscreen, pb, usage);
+		if (ret) {
+			debug_printf("pre_pipebuffer_map_callback failed %d\n",
+				ret);
+			return NULL;
+		}
+	}
+
 	ret = nouveau_bo_map(bo, nouveau_screen_map_flags(usage));
 	if (ret) {
 		debug_printf("map failed: %d\n", ret);
@@ -143,11 +153,22 @@ nouveau_screen_bo_map_range(struct pipe_screen *pscreen, struct pipe_buffer *pb,
 			    unsigned offset, unsigned length, unsigned usage)
 {
 	struct nouveau_bo *bo = nouveau_bo(pb);
+	struct nouveau_screen *nscreen = nouveau_screen(pscreen);
 	uint32_t flags = nouveau_screen_map_flags(usage);
 	int ret;
 
+	if (nscreen->pre_pipebuffer_map_callback) {
+		ret = nscreen->pre_pipebuffer_map_callback(pscreen, pb, usage);
+		if (ret) {
+			debug_printf("pre_pipebuffer_map_callback failed %d\n",
+				ret);
+			return NULL;
+		}
+	}
+
 	ret = nouveau_bo_map_range(bo, offset, length, flags);
 	if (ret) {
+		nouveau_bo_unmap(bo);
 		if (!(flags & NOUVEAU_BO_NOWAIT) || ret != -EBUSY)
 			debug_printf("map_range failed: %d\n", ret);
 		return NULL;
diff --git a/src/gallium/drivers/nouveau/nouveau_screen.h b/src/gallium/drivers/nouveau/nouveau_screen.h
index ebfc67a..a7927d8 100644
--- a/src/gallium/drivers/nouveau/nouveau_screen.h
+++ b/src/gallium/drivers/nouveau/nouveau_screen.h
@@ -5,6 +5,9 @@ struct nouveau_screen {
 	struct pipe_screen base;
 	struct nouveau_device *device;
 	struct nouveau_channel *channel;
+
+	int (*pre_pipebuffer_map_callback) (struct pipe_screen *pscreen,
+		struct pipe_buffer *pb, unsigned usage);
 };
 
 static inline struct nouveau_screen *
diff --git a/src/gallium/drivers/nouveau/nouveau_stateobj.h b/src/gallium/drivers/nouveau/nouveau_stateobj.h
index 9aee9e4..b0dd3b3 100644
--- a/src/gallium/drivers/nouveau/nouveau_stateobj.h
+++ b/src/gallium/drivers/nouveau/nouveau_stateobj.h
@@ -24,6 +24,8 @@ struct nouveau_stateobj {
 	unsigned *cur;
 	unsigned cur_packet;
 	unsigned cur_reloc;
+
+	bool emit_reloc_on_flush;
 };
 
 static INLINE struct nouveau_stateobj *
@@ -98,6 +100,19 @@ so_reloc(struct nouveau_stateobj *so, struct nouveau_bo *bo,
 	so_data(so, data);
 }
 
+/* Determine if this buffer object is referenced by this state object. */
+static INLINE bool
+so_bo_is_reloc(struct nouveau_stateobj *so, struct nouveau_bo *bo)
+{
+	int i;
+
+	for (i = 0; i < so->cur_reloc; i++) 
+		if (so->reloc[i].bo == bo) 
+			return true;
+
+	return false;
+}
+
 static INLINE void
 so_dump(struct nouveau_stateobj *so)
 {
@@ -114,6 +129,9 @@ so_emit(struct nouveau_channel *chan, struct nouveau_stateobj *so)
 	unsigned nr, i;
 	int ret = 0;
 
+	/* We are reemiting, so this state is (once again) valid. */
+	so->emit_reloc_on_flush = true;
+
 	nr = so->cur - so->push;
 	/* This will flush if we need space.
 	 * We don't actually need the marker.
@@ -146,7 +164,7 @@ so_emit_reloc_markers(struct nouveau_channel *chan, struct nouveau_stateobj *so)
 	unsigned i;
 	int ret = 0;
 
-	if (!so)
+	if (!so || !so->emit_reloc_on_flush)
 		return;
 
 	i = so->cur_reloc << 1;
diff --git a/src/gallium/drivers/nv50/nv50_screen.c b/src/gallium/drivers/nv50/nv50_screen.c
index d443ca3..3cf2bb1 100644
--- a/src/gallium/drivers/nv50/nv50_screen.c
+++ b/src/gallium/drivers/nv50/nv50_screen.c
@@ -174,6 +174,25 @@ nv50_screen_destroy(struct pipe_screen *pscreen)
 	FREE(screen);
 }
 
+static int
+nv50_pre_pipebuffer_map(struct pipe_screen *pscreen, struct pipe_buffer *pb,
+	unsigned usage)
+{
+	struct nv50_screen *screen = nv50_screen(pscreen);
+	struct nv50_context *ctx = screen->cur_ctx;
+
+	if (!(pb->usage & PIPE_BUFFER_USAGE_VERTEX))
+		return 0;
+
+	/* Our vtxbuf got mapped, it can no longer be considered part of current
+	 * state, mark it as such, to avoid problematic relocs. */
+	if (ctx && ctx->state.vtxbuf && so_bo_is_reloc(ctx->state.vtxbuf,
+		nouveau_bo(pb)))
+		ctx->state.vtxbuf->emit_reloc_on_flush = false;
+
+	return 0;
+}
+
 struct pipe_screen *
 nv50_screen_create(struct pipe_winsys *ws, struct nouveau_device *dev)
 {
@@ -201,6 +220,7 @@ nv50_screen_create(struct pipe_winsys *ws, struct nouveau_device *dev)
 	pscreen->get_param = nv50_screen_get_param;
 	pscreen->get_paramf = nv50_screen_get_paramf;
 	pscreen->is_format_supported = nv50_screen_is_format_supported;
+	screen->base.pre_pipebuffer_map_callback = nv50_pre_pipebuffer_map;
 
 	nv50_screen_init_miptree_functions(pscreen);
 	nv50_transfer_init_screen_functions(pscreen);
diff --git a/src/gallium/drivers/nv50/nv50_screen.h b/src/gallium/drivers/nv50/nv50_screen.h
index 61e24a5..a038a4e 100644
--- a/src/gallium/drivers/nv50/nv50_screen.h
+++ b/src/gallium/drivers/nv50/nv50_screen.h
@@ -2,6 +2,7 @@
 #define __NV50_SCREEN_H__
 
 #include "nouveau/nouveau_screen.h"
+#include "nv50_context.h"
 
 struct nv50_screen {
 	struct nouveau_screen base;
@@ -9,6 +10,7 @@ struct nv50_screen {
 	struct nouveau_winsys *nvws;
 
 	unsigned cur_pctx;
+	struct nv50_context *cur_ctx;
 
 	struct nouveau_grobj *tesla;
 	struct nouveau_grobj *eng2d;
diff --git a/src/gallium/drivers/nv50/nv50_state_validate.c b/src/gallium/drivers/nv50/nv50_state_validate.c
index 871e809..8cf4ff4 100644
--- a/src/gallium/drivers/nv50/nv50_state_validate.c
+++ b/src/gallium/drivers/nv50/nv50_state_validate.c
@@ -185,6 +185,8 @@ nv50_state_emit(struct nv50_context *nv50)
 	struct nv50_screen *screen = nv50->screen;
 	struct nouveau_channel *chan = screen->base.channel;
 
+	screen->cur_ctx = nv50;
+
 	if (nv50->pctx_id != screen->cur_pctx) {
 		if (nv50->state.fb)
 			nv50->state.dirty |= NV50_NEW_FRAMEBUFFER;
diff --git a/src/gallium/drivers/nv50/nv50_vbo.c b/src/gallium/drivers/nv50/nv50_vbo.c
index db54380..ce6e4eb 100644
--- a/src/gallium/drivers/nv50/nv50_vbo.c
+++ b/src/gallium/drivers/nv50/nv50_vbo.c
@@ -325,8 +325,10 @@ nv50_vbo_static_attrib(struct nv50_context *nv50, unsigned attrib,
 		return FALSE;
 
 	ret = nouveau_bo_map(bo, NOUVEAU_BO_RD);
-	if (ret)
+	if (ret) {
+		nouveau_bo_unmap(bo);
 		return FALSE;
+	}
 	v = (float *)(bo->map + (vb->buffer_offset + ve->src_offset));
 
 	so = *pso;
-- 
1.6.5.4

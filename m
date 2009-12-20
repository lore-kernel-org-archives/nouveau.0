From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] nv50: remove vtxbuf stateobject after a
	referenced vtxbuf is mapped
Date: Sun, 20 Dec 2009 16:46:18 +0100
Message-ID: <1261323978-5330-1-git-send-email-madman2003@gmail.com>
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

- This avoids problematic "reloc'ed while mapped" messages and
some associated corruption as well.
- Also add one nouveau_bo_unmap() in the vbo code that wasn't present.

Signed-off-by: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 src/gallium/drivers/nouveau/nouveau_screen.c   |   21 +++++++++++++++++++++
 src/gallium/drivers/nouveau/nouveau_screen.h   |    3 +++
 src/gallium/drivers/nouveau/nouveau_stateobj.h |   13 +++++++++++++
 src/gallium/drivers/nv50/nv50_screen.c         |   23 +++++++++++++++++++++++
 src/gallium/drivers/nv50/nv50_screen.h         |    2 ++
 src/gallium/drivers/nv50/nv50_state_validate.c |    2 ++
 src/gallium/drivers/nv50/nv50_vbo.c            |    4 +++-
 7 files changed, 67 insertions(+), 1 deletions(-)

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
index 9aee9e4..f4c32d7 100644
--- a/src/gallium/drivers/nouveau/nouveau_stateobj.h
+++ b/src/gallium/drivers/nouveau/nouveau_stateobj.h
@@ -98,6 +98,19 @@ so_reloc(struct nouveau_stateobj *so, struct nouveau_bo *bo,
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
diff --git a/src/gallium/drivers/nv50/nv50_screen.c b/src/gallium/drivers/nv50/nv50_screen.c
index d443ca3..79f47d9 100644
--- a/src/gallium/drivers/nv50/nv50_screen.c
+++ b/src/gallium/drivers/nv50/nv50_screen.c
@@ -174,6 +174,28 @@ nv50_screen_destroy(struct pipe_screen *pscreen)
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
+	 * state, remove it to avoid emitting reloc markers.
+	 */
+	if (ctx && ctx->state.vtxbuf && so_bo_is_reloc(ctx->state.vtxbuf,
+			nouveau_bo(pb))) {
+		so_ref(NULL, &ctx->state.vtxbuf);
+		ctx->state.dirty |= NV50_NEW_ARRAYS;
+	}
+
+	return 0;
+}
+
 struct pipe_screen *
 nv50_screen_create(struct pipe_winsys *ws, struct nouveau_device *dev)
 {
@@ -201,6 +223,7 @@ nv50_screen_create(struct pipe_winsys *ws, struct nouveau_device *dev)
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

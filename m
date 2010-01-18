From: Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
Subject: [PATCH 2/2] nv40: output relocations on draw calls and
	not on flushes
Date: Mon, 18 Jan 2010 15:43:59 +0100
Message-ID: <1263825839-16277-2-git-send-email-luca@luca-barbieri.com>
References: <1263825839-16277-1-git-send-email-luca@luca-barbieri.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1263825839-16277-1-git-send-email-luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
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

Currently we emit relocations on pushbuffer flushes.
However, this is wrong, because the pushbuffer flushes may be due to 2D
calls.
In particular, this leads to "-22: validating while mapped" errors in
dmesg, since the current vertex buffer can be mapped while a non-draw
(e.g. surface_copy) cal is done.
If we relocate on flushes, the relocations cause those errors.

The solution is to only set a bitmask of the needed relocations on flush,
and lazily emit them before emitting primitives.

This should totally eliminate the "-22: validate while mapped" errors.

This patch requires the previous primitive splitting patch.

nv30 and nv50 ought to be fixed in a similar way.

nv50 had a fix for this, but I think this approach is much better.
---
 src/gallium/drivers/nouveau/nouveau_stateobj.h |   12 ++---
 src/gallium/drivers/nv40/nv40_context.c        |    3 -
 src/gallium/drivers/nv40/nv40_context.h        |    9 +++-
 src/gallium/drivers/nv40/nv40_screen.c         |    2 +
 src/gallium/drivers/nv40/nv40_screen.h         |    3 +
 src/gallium/drivers/nv40/nv40_state_emit.c     |   57 ++++++++++++++++++++----
 src/gallium/drivers/nv40/nv40_vbo.c            |   14 +++---
 7 files changed, 73 insertions(+), 27 deletions(-)

diff --git a/src/gallium/drivers/nouveau/nouveau_stateobj.h b/src/gallium/drivers/nouveau/nouveau_stateobj.h
index e844f6a..06ab028 100644
--- a/src/gallium/drivers/nouveau/nouveau_stateobj.h
+++ b/src/gallium/drivers/nouveau/nouveau_stateobj.h
@@ -273,7 +273,6 @@ static INLINE void
 so_emit_reloc_markers(struct nouveau_channel *chan, struct nouveau_stateobj *so)
 {
 	struct nouveau_pushbuf *pb = chan->pushbuf;
-	struct nouveau_grobj *gr = NULL;
 	unsigned i;
 	int ret = 0;
 
@@ -291,14 +290,11 @@ so_emit_reloc_markers(struct nouveau_channel *chan, struct nouveau_stateobj *so)
 		}
 #endif /* DEBUG_NOUVEAU_STATEOBJ */
 
-		/* The object needs to be bound and the system must know the
-		 * subchannel is being used. Otherwise it will discard it.
+		/* We don't need to autobind, since there are enough subchannels
+		 * for all objects we use. If this is changed, account for the extra
+		 * space in callers of this function.
 		 */
-		if (gr != r->gr) {
-			BEGIN_RING(chan, r->gr, 0x100, 1);
-			OUT_RING(chan, 0);
-			gr = r->gr;
-		}
+		assert(r->gr->bound != NOUVEAU_GROBJ_UNBOUND);
 
 		/* Some relocs really don't like to be hammered,
 		 * NOUVEAU_BO_DUMMY makes sure it only
diff --git a/src/gallium/drivers/nv40/nv40_context.c b/src/gallium/drivers/nv40/nv40_context.c
index f79ae4d..8fab88f 100644
--- a/src/gallium/drivers/nv40/nv40_context.c
+++ b/src/gallium/drivers/nv40/nv40_context.c
@@ -69,9 +69,6 @@ nv40_create(struct pipe_screen *pscreen, unsigned pctx_id)
 	nv40->pipe.is_texture_referenced = nouveau_is_texture_referenced;
 	nv40->pipe.is_buffer_referenced = nouveau_is_buffer_referenced;
 
-	screen->base.channel->user_private = nv40;
-	screen->base.channel->flush_notify = nv40_state_flush_notify;
-
 	nv40_init_query_functions(nv40);
 	nv40_init_surface_functions(nv40);
 	nv40_init_state_functions(nv40);
diff --git a/src/gallium/drivers/nv40/nv40_context.h b/src/gallium/drivers/nv40/nv40_context.h
index e219bb5..220cd27 100644
--- a/src/gallium/drivers/nv40/nv40_context.h
+++ b/src/gallium/drivers/nv40/nv40_context.h
@@ -100,6 +100,7 @@ struct nv40_state {
 	unsigned fp_samplers;
 
 	uint64_t dirty;
+	uint64_t emit_relocs;
 	struct nouveau_stateobj *hw[NV40_STATE_MAX];
 };
 
@@ -199,7 +200,13 @@ extern void nv40_fragtex_bind(struct nv40_context *);
 extern boolean nv40_state_validate(struct nv40_context *nv40);
 extern boolean nv40_state_validate_swtnl(struct nv40_context *nv40);
 extern void nv40_state_emit(struct nv40_context *nv40);
-extern void nv40_state_flush_notify(struct nouveau_channel *chan);
+extern void nv40_state_start(struct nv40_context *nv40, unsigned space);
+static inline void nv40_state_finish(struct nv40_context *nv40)
+{
+	/* if this triggers, it means we flushed in the meantime, which must not happen */
+	assert(!(nv40->screen->need_relocs & (1ULL << NV40_STATE_FB)));
+}
+
 extern struct nv40_state_entry nv40_state_rasterizer;
 extern struct nv40_state_entry nv40_state_scissor;
 extern struct nv40_state_entry nv40_state_stipple;
diff --git a/src/gallium/drivers/nv40/nv40_screen.c b/src/gallium/drivers/nv40/nv40_screen.c
index 21320ba..d57461c 100644
--- a/src/gallium/drivers/nv40/nv40_screen.c
+++ b/src/gallium/drivers/nv40/nv40_screen.c
@@ -180,6 +180,8 @@ nv40_screen_create(struct pipe_winsys *ws, struct nouveau_device *dev)
 		return NULL;
 	}
 	chan = screen->base.channel;
+	chan->user_private = screen;
+	chan->flush_notify = nv40_state_flush_notify;
 
 	pscreen->winsys = ws;
 	pscreen->destroy = nv40_screen_destroy;
diff --git a/src/gallium/drivers/nv40/nv40_screen.h b/src/gallium/drivers/nv40/nv40_screen.h
index b5a9dd8..62b13b8 100644
--- a/src/gallium/drivers/nv40/nv40_screen.h
+++ b/src/gallium/drivers/nv40/nv40_screen.h
@@ -27,6 +27,7 @@ struct nv40_screen {
 
 	/* Current 3D state of channel */
 	struct nouveau_stateobj *state[NV40_STATE_MAX];
+	unsigned long long need_relocs;
 };
 
 static INLINE struct nv40_screen *
@@ -38,4 +39,6 @@ nv40_screen(struct pipe_screen *screen)
 void
 nv40_screen_init_transfer_functions(struct pipe_screen *pscreen);
 
+void nv40_state_flush_notify(struct nouveau_channel *chan);
+
 #endif
diff --git a/src/gallium/drivers/nv40/nv40_state_emit.c b/src/gallium/drivers/nv40/nv40_state_emit.c
index 13fe854..bfeeda1 100644
--- a/src/gallium/drivers/nv40/nv40_state_emit.c
+++ b/src/gallium/drivers/nv40/nv40_state_emit.c
@@ -51,6 +51,7 @@ nv40_state_do_validate(struct nv40_context *nv40,
 	nv40->dirty = 0;
 }
 
+/* you must call nv40_state_update after this and after every possible pushbuffer flush */
 void
 nv40_state_emit(struct nv40_context *nv40)
 {
@@ -77,6 +78,7 @@ nv40_state_emit(struct nv40_context *nv40)
 		if (state->hw[i])
 			so_emit(chan, nv40->screen->state[i]);
 		states &= ~(1ULL << i);
+		nv40->screen->need_relocs &= ~(1ULL << i);
 	}
 
 	if (state->dirty & ((1ULL << NV40_STATE_FRAGPROG) |
@@ -90,24 +92,61 @@ nv40_state_emit(struct nv40_context *nv40)
 	state->dirty = 0;
 }
 
-void
-nv40_state_flush_notify(struct nouveau_channel *chan)
+void nv40_state_start(struct nv40_context *nv40, unsigned space)
 {
-	struct nv40_context *nv40 = chan->user_private;
 	struct nv40_state *state = &nv40->state;
+	struct nv40_screen *screen = nv40->screen;
+	struct nouveau_channel *chan = screen->base.channel;
+	unsigned need_relocs = nv40->screen->need_relocs;
 	unsigned i, samplers;
+	unsigned relocs = 10 + 2 * 16 + 18 + 1;
+
+	if(!need_relocs && chan->pushbuf->remaining >= space)
+		return;
+ 
+	MARK_RING(chan, 2 * relocs + space, relocs);
+
+	need_relocs = nv40->screen->need_relocs;
+
+	if(nv40->render_mode == HW)
+	{
+		nv40->screen->need_relocs = 0;
+		if(need_relocs & (1ULL << NV40_STATE_VTXBUF))
+			so_emit_reloc_markers(chan, state->hw[NV40_STATE_VTXBUF]);
+	}
+	else
+		nv40->screen->need_relocs &= (1ULL << NV40_STATE_VTXBUF);
+
+	if(need_relocs & (1ULL << NV40_STATE_FB))
+		so_emit_reloc_markers(chan, state->hw[NV40_STATE_FB]);
 
-	so_emit_reloc_markers(chan, state->hw[NV40_STATE_FB]);
 	for (i = 0, samplers = state->fp_samplers; i < 16 && samplers; i++) {
-		if (!(samplers & (1 << i)))
+		if (!(samplers & (1 << i)) || !(need_relocs & (1ULL << (NV40_STATE_FRAGTEX0 + i))))
 			continue;
 		so_emit_reloc_markers(chan,
-				      state->hw[NV40_STATE_FRAGTEX0+i]);
+				state->hw[NV40_STATE_FRAGTEX0+i]);
 		samplers &= ~(1ULL << i);
 	}
-	so_emit_reloc_markers(chan, state->hw[NV40_STATE_FRAGPROG]);
-	if (state->hw[NV40_STATE_VTXBUF] && nv40->render_mode == HW)
-		so_emit_reloc_markers(chan, state->hw[NV40_STATE_VTXBUF]);
+
+	if(need_relocs & (1ULL << NV40_STATE_FRAGPROG))
+		so_emit_reloc_markers(chan, state->hw[NV40_STATE_FRAGPROG]);
+
+	/* If this triggers, it means we flushed while writing relocations.
+	 * This shouldn't happen due to the MARK_RING above
+	 */
+	assert(!(nv40->screen->need_relocs & (1ULL << NV40_STATE_FB)));
+}
+
+void
+nv40_state_flush_notify(struct nouveau_channel *chan)
+{
+	struct nv40_screen* screen = chan->user_private;
+
+	screen->need_relocs =
+			(1ULL << NV40_STATE_FB)
+			| (1ULL << NV40_STATE_FRAGPROG)
+			| (1ULL << NV40_STATE_VTXBUF)
+			| ((1ULL << (NV40_STATE_FRAGTEX15 + 1)) - (1ULL << (NV40_STATE_FRAGTEX0)));
 }
 
 boolean
diff --git a/src/gallium/drivers/nv40/nv40_vbo.c b/src/gallium/drivers/nv40/nv40_vbo.c
index 1182fc4..3f03773 100644
--- a/src/gallium/drivers/nv40/nv40_vbo.c
+++ b/src/gallium/drivers/nv40/nv40_vbo.c
@@ -229,16 +229,13 @@ nv40_primitive_begin(struct nv40_primitive* prim, unsigned* pstart)
 	if(prim->start == prim->end)
 		return 0;
 
-retry:
+	nv40_state_start(prim->nv40, 64);
+
 	avail = chan->pushbuf->remaining;
 	avail -= 10 + 1 + (chan->pushbuf->remaining >> 11); /* for the BEGIN_RING_NIs */
 	avail *= prim->vpp;
 	vc = util_split_primitive(avail, &prim->mode, &prim->start, prim->end, &prim->flags);
-	if(!vc)
-	{
-		FIRE_RING(chan);
-		goto retry;
-	}
+	assert(vc);
 
 	BEGIN_RING(chan, curie, NV40TCL_BEGIN_END, 1);
 	OUT_RING  (chan, nvgl_primitive(prim->mode));
@@ -262,6 +259,8 @@ nv40_primitive_end(struct nv40_primitive* prim)
 
 	BEGIN_RING(chan, curie, NV40TCL_BEGIN_END, 1);
 	OUT_RING  (chan, 0);
+
+	nv40_state_finish(prim->nv40);
 }
 
 static inline unsigned
@@ -555,6 +554,9 @@ nv40_vbo_validate(struct nv40_context *nv40)
 			nv40->fallback_swtnl |= NV40_NEW_ARRAYS;
 			so_ref(NULL, &vtxbuf);
 			so_ref(NULL, &vtxfmt);
+			so_ref(NULL, &nv40->state.hw[NV40_STATE_VTXBUF]);
+			so_ref(NULL, &nv40->state.hw[NV40_STATE_VTXFMT]);
+			so_ref(NULL, &nv40->state.hw[NV40_STATE_VTXATTR]);
 			return FALSE;
 		}
 
-- 
1.6.3.3

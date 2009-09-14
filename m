From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/2] nv50: use flush_notify to reduce number of
	relocs
Date: Mon, 14 Sep 2009 20:29:21 +0200
Message-ID: <1252952962-5765-1-git-send-email-madman2003@gmail.com>
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

---
 src/gallium/drivers/nv50/nv50_context.c        |    3 +++
 src/gallium/drivers/nv50/nv50_context.h        |    1 +
 src/gallium/drivers/nv50/nv50_state_validate.c |    6 ++++++
 3 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/src/gallium/drivers/nv50/nv50_context.c b/src/gallium/drivers/nv50/nv50_context.c
index 6e8f4f9..935de8a 100644
--- a/src/gallium/drivers/nv50/nv50_context.c
+++ b/src/gallium/drivers/nv50/nv50_context.c
@@ -110,6 +110,9 @@ nv50_create(struct pipe_screen *pscreen, unsigned pctx_id)
 	nv50->pipe.is_texture_referenced = nv50_is_texture_referenced;
 	nv50->pipe.is_buffer_referenced = nv50_is_buffer_referenced;
 
+	screen->base.channel->user_private = nv50;
+	screen->base.channel->flush_notify = nv50_state_flush_notify;
+
 	nv50_init_surface_functions(nv50);
 	nv50_init_state_functions(nv50);
 	nv50_init_query_functions(nv50);
diff --git a/src/gallium/drivers/nv50/nv50_context.h b/src/gallium/drivers/nv50/nv50_context.h
index 3a5f990..4608854 100644
--- a/src/gallium/drivers/nv50/nv50_context.h
+++ b/src/gallium/drivers/nv50/nv50_context.h
@@ -196,6 +196,7 @@ extern void nv50_program_destroy(struct nv50_context *nv50, struct nv50_program
 
 /* nv50_state_validate.c */
 extern boolean nv50_state_validate(struct nv50_context *nv50);
+extern void nv50_state_flush_notify(struct nouveau_channel *chan);
 
 /* nv50_tex.c */
 extern void nv50_tex_validate(struct nv50_context *);
diff --git a/src/gallium/drivers/nv50/nv50_state_validate.c b/src/gallium/drivers/nv50/nv50_state_validate.c
index d307a98..5a3559e 100644
--- a/src/gallium/drivers/nv50/nv50_state_validate.c
+++ b/src/gallium/drivers/nv50/nv50_state_validate.c
@@ -212,6 +212,12 @@ nv50_state_emit(struct nv50_context *nv50)
 			so_emit(chan, nv50->state.vtxattr);
 	}
 	nv50->state.dirty = 0;
+}
+
+void
+nv50_state_flush_notify(struct nouveau_channel *chan)
+{
+	struct nv50_context *nv50 = chan->user_private;
 
 	so_emit_reloc_markers(chan, nv50->state.fb);
 	so_emit_reloc_markers(chan, nv50->state.vertprog);
-- 
1.6.4.2

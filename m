From: Johannes Obermayr <johannesobermayr-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: Build failure in Mesa
Date: Tue, 16 Feb 2010 17:43:48 +0100
Message-ID: <201002161743.48903.johannesobermayr@gmx.de>
References: <201002160925.27160.johannesobermayr@gmx.de>
	<201002161100.48712.johannesobermayr@gmx.de>
	<6d4bc9fc1002160213k132a91fbi5446a041c1ad00ed@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_EtseLhfq3ROaf6y"
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <6d4bc9fc1002160213k132a91fbi5446a041c1ad00ed-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: "mesa3d-dev-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org" <mesa3d-dev-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--Boundary-00=_EtseLhfq3ROaf6y
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

Am Dienstag, 16. Februar 2010 11:13:06 schrieb Maarten Maathuis:
> On Tue, Feb 16, 2010 at 11:00 AM, Johannes Obermayr
> <johannesobermayr-Mmb7MZpHnFY@public.gmane.org> wrote:
> > Am Dienstag, 16. Februar 2010 09:53:58 schrieb Ben Skeggs:
> >> On Tue, 2010-02-16 at 09:25 +0100, Johannes Obermayr wrote:
> >> > Hi,
> >> >
> >> > Ben Skeggs latest changes in Mesa cause a build failure (libdrm is latest git ...).
> >> Rebuild latest libdrm from git, you'll also need an updated kernel
> >> module.
> >>
> >> Ben.
> > <snip>
> >
> > What does it mean? Do I need kernel-source for compiling Mesa now? Must kernel modules be installed at build time?
> 
> He meant, you need a new libdrm (and the latest requires a new kernel
> module to actually run). In reality that part of mesa needs to be
> updated to the latest libdrm api, because you already have the latest
> libdrm.
> 
Attached patch fixes the build problem on current git with this output:
(looked what Ben Skeggs did with commit "nouveau: fix for latest libdrm")


In file included from nouveau_render_t.c:289,                                                                                 
                 from nv10_render.c:201:                                                                                      
nouveau_vbo_t.c: In function 'vbo_draw_vbo':                                                                                  
nouveau_vbo_t.c:322: warning: passing argument 3 of 'get_max_vertices' makes integer from pointer without a cast              
nouveau_render_t.c:256: note: expected 'unsigned int' but argument is of type 'struct nouveau_channel *'                      
nouveau_vbo_t.c: In function 'vbo_draw_imm':                                                                                  
nouveau_vbo_t.c:358: warning: passing argument 3 of 'get_max_vertices' makes integer from pointer without a cast              
nouveau_render_t.c:256: note: expected 'unsigned int' but argument is of type 'struct nouveau_channel *'                      
In file included from nouveau_render_t.c:290,                                                                                 
                 from nv10_render.c:201:                                                                                      
nouveau_swtnl_t.c: In function 'swtnl_flush_vertices':                                                                        
nouveau_swtnl_t.c:213: warning: passing argument 3 of 'get_max_vertices' makes integer from pointer without a cast            
nouveau_render_t.c:256: note: expected 'unsigned int' but argument is of type 'struct nouveau_channel *'


--Boundary-00=_EtseLhfq3ROaf6y
Content-Type: text/x-patch;
  charset="UTF-8";
  name="fix_build.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="fix_build.patch"

diff --git a/src/mesa/drivers/dri/nouveau/nouveau_bo_state.c b/src/mesa/drivers/dri/nouveau/nouveau_bo_state.c
index 664632f..fc5f77b 100644
--- a/src/mesa/drivers/dri/nouveau/nouveau_bo_state.c
+++ b/src/mesa/drivers/dri/nouveau/nouveau_bo_state.c
@@ -32,7 +32,6 @@ nouveau_bo_marker_emit(GLcontext *ctx, struct nouveau_bo_marker *m,
 		       uint32_t flags)
 {
 	struct nouveau_channel *chan = context_chan(ctx);
-	struct nouveau_pushbuf *push = chan->pushbuf;
 	uint32_t packet;
 
 	if (m->gr->bound == NOUVEAU_GROBJ_UNBOUND)
@@ -41,11 +40,10 @@ nouveau_bo_marker_emit(GLcontext *ctx, struct nouveau_bo_marker *m,
 	if (MARK_RING(chan, 2, 2))
 		return GL_FALSE;
 
-	push->remaining -= 2;
 	packet = (m->gr->subc << 13) | (1 << 18) | m->mthd;
 
 	if (flags) {
-		if (nouveau_pushbuf_emit_reloc(chan, push->cur++, m->bo,
+		if (nouveau_pushbuf_emit_reloc(chan, chan->cur++, m->bo,
 					       packet, 0, flags |
 					       (m->flags & (NOUVEAU_BO_VRAM |
 							    NOUVEAU_BO_GART |
@@ -53,10 +51,10 @@ nouveau_bo_marker_emit(GLcontext *ctx, struct nouveau_bo_marker *m,
 					       0, 0))
 			goto fail;
 	} else {
-		*(push->cur++) = packet;
+		*(chan->cur++) = packet;
 	}
 
-	if (nouveau_pushbuf_emit_reloc(chan, push->cur++, m->bo, m->data,
+	if (nouveau_pushbuf_emit_reloc(chan, chan->cur++, m->bo, m->data,
 				       m->data2, flags | m->flags,
 				       m->vor, m->tor))
 		goto fail;
diff --git a/src/mesa/drivers/dri/nouveau/nouveau_swtnl_t.c b/src/mesa/drivers/dri/nouveau/nouveau_swtnl_t.c
index 8fa922f..9abaa90 100644
--- a/src/mesa/drivers/dri/nouveau/nouveau_swtnl_t.c
+++ b/src/mesa/drivers/dri/nouveau/nouveau_swtnl_t.c
@@ -210,7 +210,7 @@ swtnl_flush_vertices(GLcontext *ctx)
 	swtnl_bind_vertices(ctx);
 
 	while (count) {
-		push = get_max_vertices(ctx, NULL, chan->pushbuf->remaining);
+		push = get_max_vertices(ctx, NULL, chan);
 		push = MIN2(push / 12 * 12, count);
 		count -= push;
 
diff --git a/src/mesa/drivers/dri/nouveau/nouveau_vbo_t.c b/src/mesa/drivers/dri/nouveau/nouveau_vbo_t.c
index ba1192a..35a7c43 100644
--- a/src/mesa/drivers/dri/nouveau/nouveau_vbo_t.c
+++ b/src/mesa/drivers/dri/nouveau/nouveau_vbo_t.c
@@ -319,7 +319,7 @@ vbo_draw_vbo(GLcontext *ctx, const struct gl_client_array **arrays,
 					  min_index, max_index);
 		}
 
-		if (count > get_max_vertices(ctx, ib, chan->pushbuf->remaining))
+		if (count > get_max_vertices(ctx, ib, chan))
 			WAIT_RING(chan, PUSHBUF_DWORDS);
 
 		BATCH_BEGIN(nvgl_primitive(prims[i].mode));
@@ -355,7 +355,7 @@ vbo_draw_imm(GLcontext *ctx, const struct gl_client_array **arrays,
 			end = start + prims[i].count;
 
 		if (prims[i].count > get_max_vertices(ctx, ib,
-						      chan->pushbuf->remaining))
+						      chan))
 			WAIT_RING(chan, PUSHBUF_DWORDS);
 
 		BATCH_BEGIN(nvgl_primitive(prims[i].mode));

--Boundary-00=_EtseLhfq3ROaf6y
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--Boundary-00=_EtseLhfq3ROaf6y--

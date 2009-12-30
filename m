From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/3] nouveau: kill nouveau_push.h and use libdrm
	versions of BEGIN_RINGs, etc
Date: Wed, 30 Dec 2009 22:36:41 +0100
Message-ID: <1262209002-10778-2-git-send-email-madman2003@gmail.com>
References: <1262209002-10778-1-git-send-email-madman2003@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1262209002-10778-1-git-send-email-madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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

From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

---
 src/gallium/drivers/nouveau/nouveau_push.h |   93 -----
 src/gallium/drivers/nv04/nv04_context.c    |   44 ++-
 src/gallium/drivers/nv04/nv04_context.h    |    4 -
 src/gallium/drivers/nv04/nv04_prim_vbuf.c  |   84 +++--
 src/gallium/drivers/nv04/nv04_state_emit.c |   72 +++--
 src/gallium/drivers/nv10/nv10_context.c    |  367 ++++++++++----------
 src/gallium/drivers/nv10/nv10_context.h    |    4 -
 src/gallium/drivers/nv10/nv10_fragtex.c    |   28 +-
 src/gallium/drivers/nv10/nv10_prim_vbuf.c  |   34 +-
 src/gallium/drivers/nv10/nv10_state_emit.c |  166 +++++----
 src/gallium/drivers/nv20/nv20_context.c    |  530 ++++++++++++++--------------
 src/gallium/drivers/nv20/nv20_context.h    |    4 -
 src/gallium/drivers/nv20/nv20_fragtex.c    |   28 +-
 src/gallium/drivers/nv20/nv20_prim_vbuf.c  |   56 ++--
 src/gallium/drivers/nv20/nv20_state_emit.c |  181 ++++++----
 src/gallium/drivers/nv30/nv30_context.c    |   15 +-
 src/gallium/drivers/nv30/nv30_context.h    |    4 -
 src/gallium/drivers/nv30/nv30_query.c      |   20 +-
 src/gallium/drivers/nv30/nv30_vbo.c        |  106 +++---
 src/gallium/drivers/nv30/nv30_vertprog.c   |   18 +-
 src/gallium/drivers/nv40/nv40_context.c    |   15 +-
 src/gallium/drivers/nv40/nv40_context.h    |    4 -
 src/gallium/drivers/nv40/nv40_draw.c       |   62 ++--
 src/gallium/drivers/nv40/nv40_query.c      |   20 +-
 src/gallium/drivers/nv40/nv40_state_emit.c |   11 +-
 src/gallium/drivers/nv40/nv40_vbo.c        |  106 +++---
 src/gallium/drivers/nv40/nv40_vertprog.c   |   18 +-
 27 files changed, 1089 insertions(+), 1005 deletions(-)
 delete mode 100644 src/gallium/drivers/nouveau/nouveau_push.h

diff --git a/src/gallium/drivers/nouveau/nouveau_push.h b/src/gallium/drivers/nouveau/nouveau_push.h
deleted file mode 100644
index 9c23508..0000000
--- a/src/gallium/drivers/nouveau/nouveau_push.h
+++ /dev/null
@@ -1,93 +0,0 @@
-#ifndef __NOUVEAU_PUSH_H__
-#define __NOUVEAU_PUSH_H__
-
-#include "nouveau/nouveau_winsys.h"
-
-#ifndef NOUVEAU_PUSH_CONTEXT
-#error undefined push context
-#endif
-
-#define OUT_RING(data) do {                                                    \
-	NOUVEAU_PUSH_CONTEXT(pc);                                              \
-	(*pc->base.channel->pushbuf->cur++) = (data);                          \
-} while(0)
-
-#define OUT_RINGp(src,size) do {                                               \
-	NOUVEAU_PUSH_CONTEXT(pc);                                              \
-	memcpy(pc->base.channel->pushbuf->cur, (src), (size) * 4);             \
-	pc->base.channel->pushbuf->cur += (size);                              \
-} while(0)
-
-#define OUT_RINGf(data) do {                                                   \
-	union { float v; uint32_t u; } c;                                      \
-	c.v = (data);                                                          \
-	OUT_RING(c.u);                                                         \
-} while(0)
-
-#define BEGIN_RING(obj,mthd,size) do {                                         \
-	NOUVEAU_PUSH_CONTEXT(pc);                                              \
-	struct nouveau_channel *chan = pc->base.channel;                       \
-	if (chan->pushbuf->remaining < ((size) + 1))                           \
-		nouveau_pushbuf_flush(chan, ((size) + 1));                     \
-	OUT_RING((pc->obj->subc << 13) | ((size) << 18) | (mthd));             \
-	chan->pushbuf->remaining -= ((size) + 1);                              \
-} while(0)
-
-#define BEGIN_RING_NI(obj,mthd,size) do {                                      \
-	BEGIN_RING(obj, (mthd) | 0x40000000, (size));                          \
-} while(0)
-
-static inline void
-DO_FIRE_RING(struct nouveau_channel *chan, struct pipe_fence_handle **fence)
-{
-	nouveau_pushbuf_flush(chan, 0);
-	if (fence)
-		*fence = NULL;
-}
-
-#define FIRE_RING(fence) do {                                                  \
-	NOUVEAU_PUSH_CONTEXT(pc);                                              \
-	DO_FIRE_RING(pc->base.channel, fence);                                 \
-} while(0)
-
-#define OUT_RELOC(bo,data,flags,vor,tor) do {                                  \
-	NOUVEAU_PUSH_CONTEXT(pc);                                              \
-	struct nouveau_channel *chan = pc->base.channel;                       \
-	nouveau_pushbuf_emit_reloc(chan, chan->pushbuf->cur++, nouveau_bo(bo), \
-				   (data), 0, (flags), (vor), (tor));          \
-} while(0)
-
-/* Raw data + flags depending on FB/TT buffer */
-#define OUT_RELOCd(bo,data,flags,vor,tor) do {                                 \
-	OUT_RELOC((bo), (data), (flags) | NOUVEAU_BO_OR, (vor), (tor));        \
-} while(0)
-
-/* FB/TT object handle */
-#define OUT_RELOCo(bo,flags) do {                                              \
-	OUT_RELOC((bo), 0, (flags) | NOUVEAU_BO_OR,                            \
-		  pc->base.channel->vram->handle,                              \
-		  pc->base.channel->gart->handle);                             \
-} while(0)
-
-/* Low 32-bits of offset */
-#define OUT_RELOCl(bo,delta,flags) do {                                        \
-	OUT_RELOC((bo), (delta), (flags) | NOUVEAU_BO_LOW, 0, 0);              \
-} while(0)
-
-/* High 32-bits of offset */
-#define OUT_RELOCh(bo,delta,flags) do {                                        \
-	OUT_RELOC((bo), (delta), (flags) | NOUVEAU_BO_HIGH, 0, 0);             \
-} while(0)
-
-/* A reloc which'll recombine into a NV_DMA_METHOD packet header */
-#define OUT_RELOCm(bo, flags, obj, mthd, size) do {                            \
-	NOUVEAU_PUSH_CONTEXT(pc);                                              \
-	struct nouveau_channel *chan = pc->base.channel;                       \
-	if (chan->pushbuf->remaining < ((size) + 1))                           \
-		nouveau_pushbuf_flush(chan, ((size) + 1));                     \
-	OUT_RELOCd((bo), (pc->obj->subc << 13) | ((size) << 18) | (mthd),      \
-		   (flags), 0, 0);                                             \
-	chan->pushbuf->remaining -= ((size) + 1);                              \
-} while(0)
-
-#endif
diff --git a/src/gallium/drivers/nv04/nv04_context.c b/src/gallium/drivers/nv04/nv04_context.c
index 770733a..edd9685 100644
--- a/src/gallium/drivers/nv04/nv04_context.c
+++ b/src/gallium/drivers/nv04/nv04_context.c
@@ -10,10 +10,14 @@ nv04_flush(struct pipe_context *pipe, unsigned flags,
 	   struct pipe_fence_handle **fence)
 {
 	struct nv04_context *nv04 = nv04_context(pipe);
+	struct nv04_screen *screen = nv04->screen;
+	struct nouveau_channel *chan = screen->base.channel;
 
 	draw_flush(nv04->draw);
 
-	FIRE_RING(fence);
+	FIRE_RING(chan);
+	if (fence)
+		*fence = NULL;
 }
 
 static void
@@ -30,32 +34,36 @@ nv04_destroy(struct pipe_context *pipe)
 static boolean
 nv04_init_hwctx(struct nv04_context *nv04)
 {
+	struct nv04_screen *screen = nv04->screen;
+	struct nouveau_channel *chan = screen->base.channel;
+	struct nouveau_grobj *fahrenheit = screen->fahrenheit;
+
 	// requires a valid handle
-//	BEGIN_RING(fahrenheit, NV04_TEXTURED_TRIANGLE_NOTIFY, 1);
+//	BEGIN_RING(chan, fahrenheit, NV04_TEXTURED_TRIANGLE_NOTIFY, 1);
 //	OUT_RING(0);
-	BEGIN_RING(fahrenheit, NV04_TEXTURED_TRIANGLE_NOP, 1);
-	OUT_RING(0);
+	BEGIN_RING(chan, fahrenheit, NV04_TEXTURED_TRIANGLE_NOP, 1);
+	OUT_RING(chan, 0);
 
-	BEGIN_RING(fahrenheit, NV04_TEXTURED_TRIANGLE_CONTROL, 1);
-	OUT_RING(0x40182800);
+	BEGIN_RING(chan, fahrenheit, NV04_TEXTURED_TRIANGLE_CONTROL, 1);
+	OUT_RING(chan, 0x40182800);
 //	OUT_RING(1<<20/*no cull*/);
-	BEGIN_RING(fahrenheit, NV04_TEXTURED_TRIANGLE_BLEND, 1);
+	BEGIN_RING(chan, fahrenheit, NV04_TEXTURED_TRIANGLE_BLEND, 1);
 //	OUT_RING(0x24|(1<<6)|(1<<8));
-	OUT_RING(0x120001a4);
-	BEGIN_RING(fahrenheit, NV04_TEXTURED_TRIANGLE_FORMAT, 1);
-	OUT_RING(0x332213a1);
-	BEGIN_RING(fahrenheit, NV04_TEXTURED_TRIANGLE_FILTER, 1);
-	OUT_RING(0x11001010);
-	BEGIN_RING(fahrenheit, NV04_TEXTURED_TRIANGLE_COLORKEY, 1);
-	OUT_RING(0x0);
-//	BEGIN_RING(fahrenheit, NV04_TEXTURED_TRIANGLE_OFFSET, 1);
+	OUT_RING(chan, 0x120001a4);
+	BEGIN_RING(chan, fahrenheit, NV04_TEXTURED_TRIANGLE_FORMAT, 1);
+	OUT_RING(chan, 0x332213a1);
+	BEGIN_RING(chan, fahrenheit, NV04_TEXTURED_TRIANGLE_FILTER, 1);
+	OUT_RING(chan, 0x11001010);
+	BEGIN_RING(chan, fahrenheit, NV04_TEXTURED_TRIANGLE_COLORKEY, 1);
+	OUT_RING(chan, 0x0);
+//	BEGIN_RING(chan, fahrenheit, NV04_TEXTURED_TRIANGLE_OFFSET, 1);
 //	OUT_RING(SCREEN_OFFSET);
-	BEGIN_RING(fahrenheit, NV04_TEXTURED_TRIANGLE_FOGCOLOR, 1);
-	OUT_RING(0xff000000);
+	BEGIN_RING(chan, fahrenheit, NV04_TEXTURED_TRIANGLE_FOGCOLOR, 1);
+	OUT_RING(chan, 0xff000000);
 
 
 
-	FIRE_RING (NULL);
+	FIRE_RING (chan);
 	return TRUE;
 }
 
diff --git a/src/gallium/drivers/nv04/nv04_context.h b/src/gallium/drivers/nv04/nv04_context.h
index 55326c7..d6fe4b8 100644
--- a/src/gallium/drivers/nv04/nv04_context.h
+++ b/src/gallium/drivers/nv04/nv04_context.h
@@ -15,10 +15,6 @@
 #include "nouveau/nouveau_gldefs.h"
 #include "nouveau/nouveau_context.h"
 
-#define NOUVEAU_PUSH_CONTEXT(ctx)                                              \
-	struct nv04_screen *ctx = nv04->screen
-#include "nouveau/nouveau_push.h"
-
 #include "nv04_state.h"
 
 #define NOUVEAU_ERR(fmt, args...) \
diff --git a/src/gallium/drivers/nv04/nv04_prim_vbuf.c b/src/gallium/drivers/nv04/nv04_prim_vbuf.c
index 25395ed..0b795ea 100644
--- a/src/gallium/drivers/nv04/nv04_prim_vbuf.c
+++ b/src/gallium/drivers/nv04/nv04_prim_vbuf.c
@@ -93,33 +93,45 @@ nv04_vbuf_render_set_primitive( struct vbuf_render *render,
 
 static INLINE void nv04_2triangles(struct nv04_context* nv04, unsigned char* buffer, ushort v0, ushort v1, ushort v2, ushort v3, ushort v4, ushort v5)
 {
-	BEGIN_RING(fahrenheit,NV04_TEXTURED_TRIANGLE_TLVERTEX_SX(0xA),49);
-	OUT_RINGp(buffer + VERTEX_SIZE * v0,8);
-	OUT_RINGp(buffer + VERTEX_SIZE * v1,8);
-	OUT_RINGp(buffer + VERTEX_SIZE * v2,8);
-	OUT_RINGp(buffer + VERTEX_SIZE * v3,8);
-	OUT_RINGp(buffer + VERTEX_SIZE * v4,8);
-	OUT_RINGp(buffer + VERTEX_SIZE * v5,8);
-	OUT_RING(0xFEDCBA);
+	struct nv04_screen *screen = nv04->screen;
+	struct nouveau_channel *chan = screen->base.channel;
+	struct nouveau_grobj *fahrenheit = screen->fahrenheit;
+
+	BEGIN_RING(chan, fahrenheit, NV04_TEXTURED_TRIANGLE_TLVERTEX_SX(0xA), 49);
+	OUT_RINGp(chan, buffer + VERTEX_SIZE * v0,8);
+	OUT_RINGp(chan, buffer + VERTEX_SIZE * v1,8);
+	OUT_RINGp(chan, buffer + VERTEX_SIZE * v2,8);
+	OUT_RINGp(chan, buffer + VERTEX_SIZE * v3,8);
+	OUT_RINGp(chan, buffer + VERTEX_SIZE * v4,8);
+	OUT_RINGp(chan, buffer + VERTEX_SIZE * v5,8);
+	OUT_RING(chan, 0xFEDCBA);
 }
 
 static INLINE void nv04_1triangle(struct nv04_context* nv04, unsigned char* buffer, ushort v0, ushort v1, ushort v2)
 {
-	BEGIN_RING(fahrenheit,NV04_TEXTURED_TRIANGLE_TLVERTEX_SX(0xD),25);
-	OUT_RINGp(buffer + VERTEX_SIZE * v0,8);
-	OUT_RINGp(buffer + VERTEX_SIZE * v1,8);
-	OUT_RINGp(buffer + VERTEX_SIZE * v2,8);
-	OUT_RING(0xFED);
+	struct nv04_screen *screen = nv04->screen;
+	struct nouveau_channel *chan = screen->base.channel;
+	struct nouveau_grobj *fahrenheit = screen->fahrenheit;
+
+	BEGIN_RING(chan, fahrenheit, NV04_TEXTURED_TRIANGLE_TLVERTEX_SX(0xD), 25);
+	OUT_RINGp(chan, buffer + VERTEX_SIZE * v0,8);
+	OUT_RINGp(chan, buffer + VERTEX_SIZE * v1,8);
+	OUT_RINGp(chan, buffer + VERTEX_SIZE * v2,8);
+	OUT_RING(chan, 0xFED);
 }
 
 static INLINE void nv04_1quad(struct nv04_context* nv04, unsigned char* buffer, ushort v0, ushort v1, ushort v2, ushort v3)
 {
-	BEGIN_RING(fahrenheit,NV04_TEXTURED_TRIANGLE_TLVERTEX_SX(0xC),33);
-	OUT_RINGp(buffer + VERTEX_SIZE * v0,8);
-	OUT_RINGp(buffer + VERTEX_SIZE * v1,8);
-	OUT_RINGp(buffer + VERTEX_SIZE * v2,8);
-	OUT_RINGp(buffer + VERTEX_SIZE * v3,8);
-	OUT_RING(0xFECEDC);
+	struct nv04_screen *screen = nv04->screen;
+	struct nouveau_channel *chan = screen->base.channel;
+	struct nouveau_grobj *fahrenheit = screen->fahrenheit;
+
+	BEGIN_RING(chan, fahrenheit, NV04_TEXTURED_TRIANGLE_TLVERTEX_SX(0xC), 33);
+	OUT_RINGp(chan, buffer + VERTEX_SIZE * v0,8);
+	OUT_RINGp(chan, buffer + VERTEX_SIZE * v1,8);
+	OUT_RINGp(chan, buffer + VERTEX_SIZE * v2,8);
+	OUT_RINGp(chan, buffer + VERTEX_SIZE * v3,8);
+	OUT_RING(chan, 0xFECEDC);
 }
 
 static void nv04_vbuf_render_triangles_elts(struct nv04_vbuf_render * render, const ushort * indices, uint nr_indices)
@@ -156,7 +168,10 @@ static void nv04_vbuf_render_tri_strip_elts(struct nv04_vbuf_render* render, con
 {
 	const uint32_t striptbl[]={0x321210,0x543432,0x765654,0x987876,0xBA9A98,0xDCBCBA,0xFEDEDC};
 	unsigned char* buffer = render->buffer;
-	struct nv04_context* nv04 = render->nv04;
+	struct nv04_context *nv04 = render->nv04;
+	struct nv04_screen *screen = nv04->screen;
+	struct nouveau_channel *chan = screen->base.channel;
+	struct nouveau_grobj *fahrenheit = screen->fahrenheit;
 	int i,j;
 
 	for(i = 0; i<nr_indices; i+=14) 
@@ -166,15 +181,15 @@ static void nv04_vbuf_render_tri_strip_elts(struct nv04_vbuf_render* render, con
 		if (numvert<3)
 			break;
 
-		BEGIN_RING( fahrenheit, NV04_TEXTURED_TRIANGLE_TLVERTEX_SX(0x0), numvert*8 );
+		BEGIN_RING(chan, fahrenheit, NV04_TEXTURED_TRIANGLE_TLVERTEX_SX(0x0), numvert*8);
 		for(j = 0; j<numvert; j++)
-			OUT_RINGp( buffer + VERTEX_SIZE * indices [i+j], 8 );
+			OUT_RINGp(chan, buffer + VERTEX_SIZE * indices [i+j], 8 );
 
-		BEGIN_RING_NI( fahrenheit, NV04_TEXTURED_TRIANGLE_DRAWPRIMITIVE(0), (numtri+1)/2 );
+		BEGIN_RING_NI(chan, fahrenheit, NV04_TEXTURED_TRIANGLE_DRAWPRIMITIVE(0), (numtri+1)/2 );
 		for(j = 0; j<numtri/2; j++ )
-			OUT_RING(striptbl[j]);
+			OUT_RING(chan, striptbl[j]);
 		if (numtri%2)
-			OUT_RING(striptbl[numtri/2]&0xFFF);
+			OUT_RING(chan, striptbl[numtri/2]&0xFFF);
 	}
 }
 
@@ -182,11 +197,14 @@ static void nv04_vbuf_render_tri_fan_elts(struct nv04_vbuf_render* render, const
 {
 	const uint32_t fantbl[]={0x320210,0x540430,0x760650,0x980870,0xBA0A90,0xDC0CB0,0xFE0ED0};
 	unsigned char* buffer = render->buffer;
-	struct nv04_context* nv04 = render->nv04;
+	struct nv04_context *nv04 = render->nv04;
+	struct nv04_screen *screen = nv04->screen;
+	struct nouveau_channel *chan = screen->base.channel;
+	struct nouveau_grobj *fahrenheit = screen->fahrenheit;
 	int i,j;
 
-	BEGIN_RING(fahrenheit, NV04_TEXTURED_TRIANGLE_TLVERTEX_SX(0x0), 8);
-	OUT_RINGp(buffer + VERTEX_SIZE * indices[0], 8);
+	BEGIN_RING(chan, fahrenheit, NV04_TEXTURED_TRIANGLE_TLVERTEX_SX(0x0), 8);
+	OUT_RINGp(chan, buffer + VERTEX_SIZE * indices[0], 8);
 
 	for(i = 1; i<nr_indices; i+=14)
 	{
@@ -195,16 +213,16 @@ static void nv04_vbuf_render_tri_fan_elts(struct nv04_vbuf_render* render, const
 		if (numvert < 3)
 			break;
 
-		BEGIN_RING(fahrenheit, NV04_TEXTURED_TRIANGLE_TLVERTEX_SX(0x1), numvert*8);
+		BEGIN_RING(chan, fahrenheit, NV04_TEXTURED_TRIANGLE_TLVERTEX_SX(0x1), numvert*8);
 
 		for(j=0;j<numvert;j++)
-			OUT_RINGp( buffer + VERTEX_SIZE * indices[ i+j ], 8 );
+			OUT_RINGp(chan, buffer + VERTEX_SIZE * indices[ i+j ], 8 );
 
-		BEGIN_RING_NI(fahrenheit, NV04_TEXTURED_TRIANGLE_DRAWPRIMITIVE(0), (numtri+1)/2);
+		BEGIN_RING_NI(chan, fahrenheit, NV04_TEXTURED_TRIANGLE_DRAWPRIMITIVE(0), (numtri+1)/2);
 		for(j = 0; j<numtri/2; j++)
-			OUT_RING(fantbl[j]);
+			OUT_RING(chan, fantbl[j]);
 		if (numtri%2)
-			OUT_RING(fantbl[numtri/2]&0xFFF);
+			OUT_RING(chan, fantbl[numtri/2]&0xFFF);
 	}
 }
 
diff --git a/src/gallium/drivers/nv04/nv04_state_emit.c b/src/gallium/drivers/nv04/nv04_state_emit.c
index bd98ae0..b8d6dc5 100644
--- a/src/gallium/drivers/nv04/nv04_state_emit.c
+++ b/src/gallium/drivers/nv04/nv04_state_emit.c
@@ -57,13 +57,19 @@ static uint32_t nv04_blend_func(uint32_t f)
 static void nv04_emit_control(struct nv04_context* nv04)
 {
 	uint32_t control = nv04->dsa->control;
+	struct nv04_screen *screen = nv04->screen;
+	struct nouveau_channel *chan = screen->base.channel;
+	struct nouveau_grobj *fahrenheit = screen->fahrenheit;
 
-	BEGIN_RING(fahrenheit, NV04_TEXTURED_TRIANGLE_CONTROL, 1);
-	OUT_RING(control);
+	BEGIN_RING(chan, fahrenheit, NV04_TEXTURED_TRIANGLE_CONTROL, 1);
+	OUT_RING(chan, control);
 }
 
 static void nv04_emit_blend(struct nv04_context* nv04)
 {
+	struct nv04_screen *screen = nv04->screen;
+	struct nouveau_channel *chan = screen->base.channel;
+	struct nouveau_grobj *fahrenheit = screen->fahrenheit;
 	uint32_t blend;
 
 	blend=0x4; // texture MODULATE_ALPHA
@@ -75,19 +81,23 @@ static void nv04_emit_blend(struct nv04_context* nv04)
 	blend|=(nv04_blend_func(nv04->blend->b_src)<<24);
 	blend|=(nv04_blend_func(nv04->blend->b_dst)<<28);
 
-	BEGIN_RING(fahrenheit, NV04_TEXTURED_TRIANGLE_BLEND, 1);
-	OUT_RING(blend);
+	BEGIN_RING(chan, fahrenheit, NV04_TEXTURED_TRIANGLE_BLEND, 1);
+	OUT_RING(chan, blend);
 }
 
 static void nv04_emit_sampler(struct nv04_context *nv04, int unit)
 {
 	struct nv04_miptree *nv04mt = nv04->tex_miptree[unit];
 	struct pipe_texture *pt = &nv04mt->base;
-
-	BEGIN_RING(fahrenheit, NV04_TEXTURED_TRIANGLE_OFFSET, 3);
-	OUT_RELOCl(nv04mt->buffer, 0, NOUVEAU_BO_VRAM | NOUVEAU_BO_GART | NOUVEAU_BO_RD);
-	OUT_RELOCd(nv04mt->buffer, (nv04->fragtex.format | nv04->sampler[unit]->format), NOUVEAU_BO_VRAM | NOUVEAU_BO_GART | NOUVEAU_BO_OR | NOUVEAU_BO_RD, 1/*VRAM*/,2/*TT*/);
-	OUT_RING(nv04->sampler[unit]->filter);
+	struct nv04_screen *screen = nv04->screen;
+	struct nouveau_channel *chan = screen->base.channel;
+	struct nouveau_grobj *fahrenheit = screen->fahrenheit;
+	struct nouveau_bo *bo = nouveau_bo(nv04mt->buffer);
+
+	BEGIN_RING(chan, fahrenheit, NV04_TEXTURED_TRIANGLE_OFFSET, 3);
+	OUT_RELOCl(chan, bo, 0, NOUVEAU_BO_VRAM | NOUVEAU_BO_GART | NOUVEAU_BO_RD);
+	OUT_RELOCd(chan, bo, (nv04->fragtex.format | nv04->sampler[unit]->format), NOUVEAU_BO_VRAM | NOUVEAU_BO_GART | NOUVEAU_BO_OR | NOUVEAU_BO_RD, 1/*VRAM*/,2/*TT*/);
+	OUT_RING(chan, nv04->sampler[unit]->filter);
 }
 
 static void nv04_state_emit_framebuffer(struct nv04_context* nv04)
@@ -97,6 +107,10 @@ static void nv04_state_emit_framebuffer(struct nv04_context* nv04)
 	uint32_t rt_format, w, h;
 	int colour_format = 0, zeta_format = 0;
 	struct nv04_miptree *nv04mt = 0;
+	struct nv04_screen *screen = nv04->screen;
+	struct nouveau_channel *chan = screen->base.channel;
+	struct nouveau_grobj *context_surfaces_3d = screen->context_surfaces_3d;
+	struct nouveau_bo *bo;
 
 	w = fb->cbufs[0]->width;
 	h = fb->cbufs[0]->height;
@@ -128,24 +142,29 @@ static void nv04_state_emit_framebuffer(struct nv04_context* nv04)
 		assert(0);
 	}
 
-	BEGIN_RING(context_surfaces_3d, NV04_CONTEXT_SURFACES_3D_FORMAT, 1);
-	OUT_RING(rt_format);
+	BEGIN_RING(chan, context_surfaces_3d, NV04_CONTEXT_SURFACES_3D_FORMAT, 1);
+	OUT_RING(chan, rt_format);
 
 	nv04mt = (struct nv04_miptree *)rt->base.texture;
+	bo = nouveau_bo(nv04mt->buffer);
 	/* FIXME pitches have to be aligned ! */
-	BEGIN_RING(context_surfaces_3d, NV04_CONTEXT_SURFACES_3D_PITCH, 2);
-	OUT_RING(rt->pitch|(zeta->pitch<<16));
-	OUT_RELOCl(nv04mt->buffer, 0, NOUVEAU_BO_VRAM | NOUVEAU_BO_WR);
+	BEGIN_RING(chan, context_surfaces_3d, NV04_CONTEXT_SURFACES_3D_PITCH, 2);
+	OUT_RING(chan, rt->pitch|(zeta->pitch<<16));
+	OUT_RELOCl(chan, bo, 0, NOUVEAU_BO_VRAM | NOUVEAU_BO_WR);
 	if (fb->zsbuf) {
 		nv04mt = (struct nv04_miptree *)zeta->base.texture;
-		BEGIN_RING(context_surfaces_3d, NV04_CONTEXT_SURFACES_3D_OFFSET_ZETA, 1);
-		OUT_RELOCl(nv04mt->buffer, 0, NOUVEAU_BO_VRAM | NOUVEAU_BO_WR);
+		BEGIN_RING(chan, context_surfaces_3d, NV04_CONTEXT_SURFACES_3D_OFFSET_ZETA, 1);
+		OUT_RELOCl(chan, bo, 0, NOUVEAU_BO_VRAM | NOUVEAU_BO_WR);
 	}
 }
 
 void
 nv04_emit_hw_state(struct nv04_context *nv04)
 {
+	struct nv04_screen *screen = nv04->screen;
+	struct nouveau_channel *chan = screen->base.channel;
+	struct nouveau_grobj *fahrenheit = screen->fahrenheit;
+	struct nouveau_grobj *context_surfaces_3d = screen->context_surfaces_3d;
 	int i;
 
 	if (nv04->dirty & NV04_NEW_VERTPROG) {
@@ -163,8 +182,8 @@ nv04_emit_hw_state(struct nv04_context *nv04)
 	if (nv04->dirty & NV04_NEW_CONTROL) {
 		nv04->dirty &= ~NV04_NEW_CONTROL;
 
-		BEGIN_RING(fahrenheit, NV04_TEXTURED_TRIANGLE_CONTROL, 1);
-		OUT_RING(nv04->dsa->control);
+		BEGIN_RING(chan, fahrenheit, NV04_TEXTURED_TRIANGLE_CONTROL, 1);
+		OUT_RING(chan, nv04->dsa->control);
 	}
 
 	if (nv04->dirty & NV04_NEW_BLEND) {
@@ -205,12 +224,12 @@ nv04_emit_hw_state(struct nv04_context *nv04)
 	unsigned rt_pitch = ((struct nv04_surface *)nv04->rt)->pitch;
 	unsigned zeta_pitch = ((struct nv04_surface *)nv04->zeta)->pitch;
 
-	BEGIN_RING(context_surfaces_3d, NV04_CONTEXT_SURFACES_3D_PITCH, 2);
-	OUT_RING(rt_pitch|(zeta_pitch<<16));
-	OUT_RELOCl(nv04->rt, 0, NOUVEAU_BO_VRAM | NOUVEAU_BO_WR);
+	BEGIN_RING(chan, context_surfaces_3d, NV04_CONTEXT_SURFACES_3D_PITCH, 2);
+	OUT_RING(chan, rt_pitch|(zeta_pitch<<16));
+	OUT_RELOCl(chan, nouveau_bo(nv04->rt), 0, NOUVEAU_BO_VRAM | NOUVEAU_BO_WR);
 	if (nv04->zeta) {
-		BEGIN_RING(context_surfaces_3d, NV04_CONTEXT_SURFACES_3D_OFFSET_ZETA, 1);
-		OUT_RELOCl(nv04->zeta, 0, NOUVEAU_BO_VRAM | NOUVEAU_BO_WR);
+		BEGIN_RING(chan, context_surfaces_3d, NV04_CONTEXT_SURFACES_3D_OFFSET_ZETA, 1);
+		OUT_RELOCl(chan, nouveau_bo(nv04->zeta), 0, NOUVEAU_BO_VRAM | NOUVEAU_BO_WR);
 	}
 
 	/* Texture images */
@@ -218,9 +237,10 @@ nv04_emit_hw_state(struct nv04_context *nv04)
 		if (!(nv04->fp_samplers & (1 << i)))
 			continue;
 		struct nv04_miptree *nv04mt = nv04->tex_miptree[i];
-		BEGIN_RING(fahrenheit, NV04_TEXTURED_TRIANGLE_OFFSET, 2);
-		OUT_RELOCl(nv04mt->buffer, 0, NOUVEAU_BO_VRAM | NOUVEAU_BO_GART | NOUVEAU_BO_RD);
-		OUT_RELOCd(nv04mt->buffer, (nv04->fragtex.format | nv04->sampler[i]->format), NOUVEAU_BO_VRAM | NOUVEAU_BO_GART | NOUVEAU_BO_OR | NOUVEAU_BO_RD, 1/*VRAM*/,2/*TT*/);
+		struct nouveau_bo *bo = nouveau_bo(nv04mt->buffer);
+		BEGIN_RING(chan, fahrenheit, NV04_TEXTURED_TRIANGLE_OFFSET, 2);
+		OUT_RELOCl(chan, bo, 0, NOUVEAU_BO_VRAM | NOUVEAU_BO_GART | NOUVEAU_BO_RD);
+		OUT_RELOCd(chan, bo, (nv04->fragtex.format | nv04->sampler[i]->format), NOUVEAU_BO_VRAM | NOUVEAU_BO_GART | NOUVEAU_BO_OR | NOUVEAU_BO_RD, 1/*VRAM*/,2/*TT*/);
 	}
 }
 
diff --git a/src/gallium/drivers/nv10/nv10_context.c b/src/gallium/drivers/nv10/nv10_context.c
index 0dadeb0..1ecb73d 100644
--- a/src/gallium/drivers/nv10/nv10_context.c
+++ b/src/gallium/drivers/nv10/nv10_context.c
@@ -10,10 +10,14 @@ nv10_flush(struct pipe_context *pipe, unsigned flags,
 	   struct pipe_fence_handle **fence)
 {
 	struct nv10_context *nv10 = nv10_context(pipe);
+	struct nv10_screen *screen = nv10->screen;
+	struct nouveau_channel *chan = screen->base.channel;
 
 	draw_flush(nv10->draw);
 
-	FIRE_RING(fence);
+	FIRE_RING(chan);
+	if (fence)
+		*fence = NULL;
 }
 
 static void
@@ -31,225 +35,226 @@ static void nv10_init_hwctx(struct nv10_context *nv10)
 {
 	struct nv10_screen *screen = nv10->screen;
 	struct nouveau_channel *chan = screen->base.channel;
+	struct nouveau_grobj *celsius = screen->celsius;
 	int i;
 	float projectionmatrix[16];
 
-	BEGIN_RING(celsius, NV10TCL_DMA_NOTIFY, 1);
-	OUT_RING  (screen->sync->handle);
-	BEGIN_RING(celsius, NV10TCL_DMA_IN_MEMORY0, 2);
-	OUT_RING  (chan->vram->handle);
-	OUT_RING  (chan->gart->handle);
-	BEGIN_RING(celsius, NV10TCL_DMA_IN_MEMORY2, 2);
-	OUT_RING  (chan->vram->handle);
-	OUT_RING  (chan->vram->handle);
+	BEGIN_RING(chan, celsius, NV10TCL_DMA_NOTIFY, 1);
+	OUT_RING  (chan, screen->sync->handle);
+	BEGIN_RING(chan, celsius, NV10TCL_DMA_IN_MEMORY0, 2);
+	OUT_RING  (chan, chan->vram->handle);
+	OUT_RING  (chan, chan->gart->handle);
+	BEGIN_RING(chan, celsius, NV10TCL_DMA_IN_MEMORY2, 2);
+	OUT_RING  (chan, chan->vram->handle);
+	OUT_RING  (chan, chan->vram->handle);
 
-	BEGIN_RING(celsius, NV10TCL_NOP, 1);
-	OUT_RING  (0);
+	BEGIN_RING(chan, celsius, NV10TCL_NOP, 1);
+	OUT_RING  (chan, 0);
 
-	BEGIN_RING(celsius, NV10TCL_RT_HORIZ, 2);
-	OUT_RING  (0);
-	OUT_RING  (0);
+	BEGIN_RING(chan, celsius, NV10TCL_RT_HORIZ, 2);
+	OUT_RING  (chan, 0);
+	OUT_RING  (chan, 0);
 
-	BEGIN_RING(celsius, NV10TCL_VIEWPORT_CLIP_HORIZ(0), 1);
-	OUT_RING  ((0x7ff<<16)|0x800);
-	BEGIN_RING(celsius, NV10TCL_VIEWPORT_CLIP_VERT(0), 1);
-	OUT_RING  ((0x7ff<<16)|0x800);
+	BEGIN_RING(chan, celsius, NV10TCL_VIEWPORT_CLIP_HORIZ(0), 1);
+	OUT_RING  (chan, (0x7ff<<16)|0x800);
+	BEGIN_RING(chan, celsius, NV10TCL_VIEWPORT_CLIP_VERT(0), 1);
+	OUT_RING  (chan, (0x7ff<<16)|0x800);
 
 	for (i=1;i<8;i++) {
-		BEGIN_RING(celsius, NV10TCL_VIEWPORT_CLIP_HORIZ(i), 1);
-		OUT_RING  (0);
-		BEGIN_RING(celsius, NV10TCL_VIEWPORT_CLIP_VERT(i), 1);
-		OUT_RING  (0);
+		BEGIN_RING(chan, celsius, NV10TCL_VIEWPORT_CLIP_HORIZ(i), 1);
+		OUT_RING  (chan, 0);
+		BEGIN_RING(chan, celsius, NV10TCL_VIEWPORT_CLIP_VERT(i), 1);
+		OUT_RING  (chan, 0);
 	}
 
-	BEGIN_RING(celsius, 0x290, 1);
-	OUT_RING  ((0x10<<16)|1);
-	BEGIN_RING(celsius, 0x3f4, 1);
-	OUT_RING  (0);
+	BEGIN_RING(chan, celsius, 0x290, 1);
+	OUT_RING  (chan, (0x10<<16)|1);
+	BEGIN_RING(chan, celsius, 0x3f4, 1);
+	OUT_RING  (chan, 0);
 
-	BEGIN_RING(celsius, NV10TCL_NOP, 1);
-	OUT_RING  (0);
+	BEGIN_RING(chan, celsius, NV10TCL_NOP, 1);
+	OUT_RING  (chan, 0);
 
 	if (nv10->screen->celsius->grclass != NV10TCL) {
 		/* For nv11, nv17 */
-		BEGIN_RING(celsius, 0x120, 3);
-		OUT_RING  (0);
-		OUT_RING  (1);
-		OUT_RING  (2);
+		BEGIN_RING(chan, celsius, 0x120, 3);
+		OUT_RING  (chan, 0);
+		OUT_RING  (chan, 1);
+		OUT_RING  (chan, 2);
 
-		BEGIN_RING(celsius, NV10TCL_NOP, 1);
-		OUT_RING  (0);
+		BEGIN_RING(chan, celsius, NV10TCL_NOP, 1);
+		OUT_RING  (chan, 0);
 	}
 
-	BEGIN_RING(celsius, NV10TCL_NOP, 1);
-	OUT_RING  (0);
+	BEGIN_RING(chan, celsius, NV10TCL_NOP, 1);
+	OUT_RING  (chan, 0);
 
 	/* Set state */
-	BEGIN_RING(celsius, NV10TCL_FOG_ENABLE, 1);
-	OUT_RING  (0);
-	BEGIN_RING(celsius, NV10TCL_ALPHA_FUNC_ENABLE, 1);
-	OUT_RING  (0);
-	BEGIN_RING(celsius, NV10TCL_ALPHA_FUNC_FUNC, 2);
-	OUT_RING  (0x207);
-	OUT_RING  (0);
-	BEGIN_RING(celsius, NV10TCL_TX_ENABLE(0), 2);
-	OUT_RING  (0);
-	OUT_RING  (0);
-
-	BEGIN_RING(celsius, NV10TCL_RC_IN_ALPHA(0), 12);
-	OUT_RING  (0x30141010);
-	OUT_RING  (0);
-	OUT_RING  (0x20040000);
-	OUT_RING  (0);
-	OUT_RING  (0);
-	OUT_RING  (0);
-	OUT_RING  (0x00000c00);
-	OUT_RING  (0);
-	OUT_RING  (0x00000c00);
-	OUT_RING  (0x18000000);
-	OUT_RING  (0x300e0300);
-	OUT_RING  (0x0c091c80);
-
-	BEGIN_RING(celsius, NV10TCL_BLEND_FUNC_ENABLE, 1);
-	OUT_RING  (0);
-	BEGIN_RING(celsius, NV10TCL_DITHER_ENABLE, 2);
-	OUT_RING  (1);
-	OUT_RING  (0);
-	BEGIN_RING(celsius, NV10TCL_LINE_SMOOTH_ENABLE, 1);
-	OUT_RING  (0);
-	BEGIN_RING(celsius, NV10TCL_VERTEX_WEIGHT_ENABLE, 2);
-	OUT_RING  (0);
-	OUT_RING  (0);
-	BEGIN_RING(celsius, NV10TCL_BLEND_FUNC_SRC, 4);
-	OUT_RING  (1);
-	OUT_RING  (0);
-	OUT_RING  (0);
-	OUT_RING  (0x8006);
-	BEGIN_RING(celsius, NV10TCL_STENCIL_MASK, 8);
-	OUT_RING  (0xff);
-	OUT_RING  (0x207);
-	OUT_RING  (0);
-	OUT_RING  (0xff);
-	OUT_RING  (0x1e00);
-	OUT_RING  (0x1e00);
-	OUT_RING  (0x1e00);
-	OUT_RING  (0x1d01);
-	BEGIN_RING(celsius, NV10TCL_NORMALIZE_ENABLE, 1);
-	OUT_RING  (0);
-	BEGIN_RING(celsius, NV10TCL_FOG_ENABLE, 2);
-	OUT_RING  (0);
-	OUT_RING  (0);
-	BEGIN_RING(celsius, NV10TCL_LIGHT_MODEL, 1);
-	OUT_RING  (0);
-	BEGIN_RING(celsius, NV10TCL_COLOR_CONTROL, 1);
-	OUT_RING  (0);
-	BEGIN_RING(celsius, NV10TCL_ENABLED_LIGHTS, 1);
-	OUT_RING  (0);
-	BEGIN_RING(celsius, NV10TCL_POLYGON_OFFSET_POINT_ENABLE, 3);
-	OUT_RING  (0);
-	OUT_RING  (0);
-	OUT_RING  (0);
-	BEGIN_RING(celsius, NV10TCL_DEPTH_FUNC, 1);
-	OUT_RING  (0x201);
-	BEGIN_RING(celsius, NV10TCL_DEPTH_WRITE_ENABLE, 1);
-	OUT_RING  (0);
-	BEGIN_RING(celsius, NV10TCL_DEPTH_TEST_ENABLE, 1);
-	OUT_RING  (0);
-	BEGIN_RING(celsius, NV10TCL_POLYGON_OFFSET_FACTOR, 2);
-	OUT_RING  (0);
-	OUT_RING  (0);
-	BEGIN_RING(celsius, NV10TCL_POINT_SIZE, 1);
-	OUT_RING  (8);
-	BEGIN_RING(celsius, NV10TCL_POINT_PARAMETERS_ENABLE, 2);
-	OUT_RING  (0);
-	OUT_RING  (0);
-	BEGIN_RING(celsius, NV10TCL_LINE_WIDTH, 1);
-	OUT_RING  (8);
-	BEGIN_RING(celsius, NV10TCL_LINE_SMOOTH_ENABLE, 1);
-	OUT_RING  (0);
-	BEGIN_RING(celsius, NV10TCL_POLYGON_MODE_FRONT, 2);
-	OUT_RING  (0x1b02);
-	OUT_RING  (0x1b02);
-	BEGIN_RING(celsius, NV10TCL_CULL_FACE, 2);
-	OUT_RING  (0x405);
-	OUT_RING  (0x901);
-	BEGIN_RING(celsius, NV10TCL_POLYGON_SMOOTH_ENABLE, 1);
-	OUT_RING  (0);
-	BEGIN_RING(celsius, NV10TCL_CULL_FACE_ENABLE, 1);
-	OUT_RING  (0);
-	BEGIN_RING(celsius, NV10TCL_TX_GEN_S(0), 8);
+	BEGIN_RING(chan, celsius, NV10TCL_FOG_ENABLE, 1);
+	OUT_RING  (chan, 0);
+	BEGIN_RING(chan, celsius, NV10TCL_ALPHA_FUNC_ENABLE, 1);
+	OUT_RING  (chan, 0);
+	BEGIN_RING(chan, celsius, NV10TCL_ALPHA_FUNC_FUNC, 2);
+	OUT_RING  (chan, 0x207);
+	OUT_RING  (chan, 0);
+	BEGIN_RING(chan, celsius, NV10TCL_TX_ENABLE(0), 2);
+	OUT_RING  (chan, 0);
+	OUT_RING  (chan, 0);
+
+	BEGIN_RING(chan, celsius, NV10TCL_RC_IN_ALPHA(0), 12);
+	OUT_RING  (chan, 0x30141010);
+	OUT_RING  (chan, 0);
+	OUT_RING  (chan, 0x20040000);
+	OUT_RING  (chan, 0);
+	OUT_RING  (chan, 0);
+	OUT_RING  (chan, 0);
+	OUT_RING  (chan, 0x00000c00);
+	OUT_RING  (chan, 0);
+	OUT_RING  (chan, 0x00000c00);
+	OUT_RING  (chan, 0x18000000);
+	OUT_RING  (chan, 0x300e0300);
+	OUT_RING  (chan, 0x0c091c80);
+
+	BEGIN_RING(chan, celsius, NV10TCL_BLEND_FUNC_ENABLE, 1);
+	OUT_RING  (chan, 0);
+	BEGIN_RING(chan, celsius, NV10TCL_DITHER_ENABLE, 2);
+	OUT_RING  (chan, 1);
+	OUT_RING  (chan, 0);
+	BEGIN_RING(chan, celsius, NV10TCL_LINE_SMOOTH_ENABLE, 1);
+	OUT_RING  (chan, 0);
+	BEGIN_RING(chan, celsius, NV10TCL_VERTEX_WEIGHT_ENABLE, 2);
+	OUT_RING  (chan, 0);
+	OUT_RING  (chan, 0);
+	BEGIN_RING(chan, celsius, NV10TCL_BLEND_FUNC_SRC, 4);
+	OUT_RING  (chan, 1);
+	OUT_RING  (chan, 0);
+	OUT_RING  (chan, 0);
+	OUT_RING  (chan, 0x8006);
+	BEGIN_RING(chan, celsius, NV10TCL_STENCIL_MASK, 8);
+	OUT_RING  (chan, 0xff);
+	OUT_RING  (chan, 0x207);
+	OUT_RING  (chan, 0);
+	OUT_RING  (chan, 0xff);
+	OUT_RING  (chan, 0x1e00);
+	OUT_RING  (chan, 0x1e00);
+	OUT_RING  (chan, 0x1e00);
+	OUT_RING  (chan, 0x1d01);
+	BEGIN_RING(chan, celsius, NV10TCL_NORMALIZE_ENABLE, 1);
+	OUT_RING  (chan, 0);
+	BEGIN_RING(chan, celsius, NV10TCL_FOG_ENABLE, 2);
+	OUT_RING  (chan, 0);
+	OUT_RING  (chan, 0);
+	BEGIN_RING(chan, celsius, NV10TCL_LIGHT_MODEL, 1);
+	OUT_RING  (chan, 0);
+	BEGIN_RING(chan, celsius, NV10TCL_COLOR_CONTROL, 1);
+	OUT_RING  (chan, 0);
+	BEGIN_RING(chan, celsius, NV10TCL_ENABLED_LIGHTS, 1);
+	OUT_RING  (chan, 0);
+	BEGIN_RING(chan, celsius, NV10TCL_POLYGON_OFFSET_POINT_ENABLE, 3);
+	OUT_RING  (chan, 0);
+	OUT_RING  (chan, 0);
+	OUT_RING  (chan, 0);
+	BEGIN_RING(chan, celsius, NV10TCL_DEPTH_FUNC, 1);
+	OUT_RING  (chan, 0x201);
+	BEGIN_RING(chan, celsius, NV10TCL_DEPTH_WRITE_ENABLE, 1);
+	OUT_RING  (chan, 0);
+	BEGIN_RING(chan, celsius, NV10TCL_DEPTH_TEST_ENABLE, 1);
+	OUT_RING  (chan, 0);
+	BEGIN_RING(chan, celsius, NV10TCL_POLYGON_OFFSET_FACTOR, 2);
+	OUT_RING  (chan, 0);
+	OUT_RING  (chan, 0);
+	BEGIN_RING(chan, celsius, NV10TCL_POINT_SIZE, 1);
+	OUT_RING  (chan, 8);
+	BEGIN_RING(chan, celsius, NV10TCL_POINT_PARAMETERS_ENABLE, 2);
+	OUT_RING  (chan, 0);
+	OUT_RING  (chan, 0);
+	BEGIN_RING(chan, celsius, NV10TCL_LINE_WIDTH, 1);
+	OUT_RING  (chan, 8);
+	BEGIN_RING(chan, celsius, NV10TCL_LINE_SMOOTH_ENABLE, 1);
+	OUT_RING  (chan, 0);
+	BEGIN_RING(chan, celsius, NV10TCL_POLYGON_MODE_FRONT, 2);
+	OUT_RING  (chan, 0x1b02);
+	OUT_RING  (chan, 0x1b02);
+	BEGIN_RING(chan, celsius, NV10TCL_CULL_FACE, 2);
+	OUT_RING  (chan, 0x405);
+	OUT_RING  (chan, 0x901);
+	BEGIN_RING(chan, celsius, NV10TCL_POLYGON_SMOOTH_ENABLE, 1);
+	OUT_RING  (chan, 0);
+	BEGIN_RING(chan, celsius, NV10TCL_CULL_FACE_ENABLE, 1);
+	OUT_RING  (chan, 0);
+	BEGIN_RING(chan, celsius, NV10TCL_TX_GEN_S(0), 8);
 	for (i=0;i<8;i++) {
-		OUT_RING  (0);
+		OUT_RING  (chan, 0);
 	}
-	BEGIN_RING(celsius, NV10TCL_FOG_EQUATION_CONSTANT, 3);
-	OUT_RING  (0x3fc00000);	/* -1.50 */
-	OUT_RING  (0xbdb8aa0a);	/* -0.09 */
-	OUT_RING  (0);		/*  0.00 */
+	BEGIN_RING(chan, celsius, NV10TCL_FOG_EQUATION_CONSTANT, 3);
+	OUT_RING  (chan, 0x3fc00000);	/* -1.50 */
+	OUT_RING  (chan, 0xbdb8aa0a);	/* -0.09 */
+	OUT_RING  (chan, 0);		/*  0.00 */
 
-	BEGIN_RING(celsius, NV10TCL_NOP, 1);
-	OUT_RING  (0);
+	BEGIN_RING(chan, celsius, NV10TCL_NOP, 1);
+	OUT_RING  (chan, 0);
 
-	BEGIN_RING(celsius, NV10TCL_FOG_MODE, 2);
-	OUT_RING  (0x802);
-	OUT_RING  (2);
+	BEGIN_RING(chan, celsius, NV10TCL_FOG_MODE, 2);
+	OUT_RING  (chan, 0x802);
+	OUT_RING  (chan, 2);
 	/* for some reason VIEW_MATRIX_ENABLE need to be 6 instead of 4 when
 	 * using texturing, except when using the texture matrix
 	 */
-	BEGIN_RING(celsius, NV10TCL_VIEW_MATRIX_ENABLE, 1);
-	OUT_RING  (6);
-	BEGIN_RING(celsius, NV10TCL_COLOR_MASK, 1);
-	OUT_RING  (0x01010101);
+	BEGIN_RING(chan, celsius, NV10TCL_VIEW_MATRIX_ENABLE, 1);
+	OUT_RING  (chan, 6);
+	BEGIN_RING(chan, celsius, NV10TCL_COLOR_MASK, 1);
+	OUT_RING  (chan, 0x01010101);
 
 	/* Set vertex component */
-	BEGIN_RING(celsius, NV10TCL_VERTEX_COL_4F_R, 4);
-	OUT_RINGf (1.0);
-	OUT_RINGf (1.0);
-	OUT_RINGf (1.0);
-	OUT_RINGf (1.0);
-	BEGIN_RING(celsius, NV10TCL_VERTEX_COL2_3F_R, 3);
-	OUT_RING  (0);
-	OUT_RING  (0);
-	OUT_RING  (0);
-	BEGIN_RING(celsius, NV10TCL_VERTEX_NOR_3F_X, 3);
-	OUT_RING  (0);
-	OUT_RING  (0);
-	OUT_RINGf (1.0);
-	BEGIN_RING(celsius, NV10TCL_VERTEX_TX0_4F_S, 4);
-	OUT_RINGf (0.0);
-	OUT_RINGf (0.0);
-	OUT_RINGf (0.0);
-	OUT_RINGf (1.0);
-	BEGIN_RING(celsius, NV10TCL_VERTEX_TX1_4F_S, 4);
-	OUT_RINGf (0.0);
-	OUT_RINGf (0.0);
-	OUT_RINGf (0.0);
-	OUT_RINGf (1.0);
-	BEGIN_RING(celsius, NV10TCL_VERTEX_FOG_1F, 1);
-	OUT_RINGf (0.0);
-	BEGIN_RING(celsius, NV10TCL_EDGEFLAG_ENABLE, 1);
-	OUT_RING  (1);
+	BEGIN_RING(chan, celsius, NV10TCL_VERTEX_COL_4F_R, 4);
+	OUT_RINGf (chan, 1.0);
+	OUT_RINGf (chan, 1.0);
+	OUT_RINGf (chan, 1.0);
+	OUT_RINGf (chan, 1.0);
+	BEGIN_RING(chan, celsius, NV10TCL_VERTEX_COL2_3F_R, 3);
+	OUT_RING  (chan, 0);
+	OUT_RING  (chan, 0);
+	OUT_RING  (chan, 0);
+	BEGIN_RING(chan, celsius, NV10TCL_VERTEX_NOR_3F_X, 3);
+	OUT_RING  (chan, 0);
+	OUT_RING  (chan, 0);
+	OUT_RINGf (chan, 1.0);
+	BEGIN_RING(chan, celsius, NV10TCL_VERTEX_TX0_4F_S, 4);
+	OUT_RINGf (chan, 0.0);
+	OUT_RINGf (chan, 0.0);
+	OUT_RINGf (chan, 0.0);
+	OUT_RINGf (chan, 1.0);
+	BEGIN_RING(chan, celsius, NV10TCL_VERTEX_TX1_4F_S, 4);
+	OUT_RINGf (chan, 0.0);
+	OUT_RINGf (chan, 0.0);
+	OUT_RINGf (chan, 0.0);
+	OUT_RINGf (chan, 1.0);
+	BEGIN_RING(chan, celsius, NV10TCL_VERTEX_FOG_1F, 1);
+	OUT_RINGf (chan, 0.0);
+	BEGIN_RING(chan, celsius, NV10TCL_EDGEFLAG_ENABLE, 1);
+	OUT_RING  (chan, 1);
 
 	memset(projectionmatrix, 0, sizeof(projectionmatrix));
-	BEGIN_RING(celsius, NV10TCL_PROJECTION_MATRIX(0), 16);
+	BEGIN_RING(chan, celsius, NV10TCL_PROJECTION_MATRIX(0), 16);
 	projectionmatrix[0*4+0] = 1.0;
 	projectionmatrix[1*4+1] = 1.0;
 	projectionmatrix[2*4+2] = 1.0;
 	projectionmatrix[3*4+3] = 1.0;
 	for (i=0;i<16;i++) {
-		OUT_RINGf  (projectionmatrix[i]);
+		OUT_RINGf  (chan, projectionmatrix[i]);
 	}
 
-	BEGIN_RING(celsius, NV10TCL_DEPTH_RANGE_NEAR, 2);
-	OUT_RING  (0.0);
-	OUT_RINGf  (16777216.0);
+	BEGIN_RING(chan, celsius, NV10TCL_DEPTH_RANGE_NEAR, 2);
+	OUT_RING  (chan, 0.0);
+	OUT_RINGf  (chan, 16777216.0);
 
-	BEGIN_RING(celsius, NV10TCL_VIEWPORT_TRANSLATE_X, 4);
-	OUT_RINGf  (-2048.0);
-	OUT_RINGf  (-2048.0);
-	OUT_RINGf  (16777215.0 * 0.5);
-	OUT_RING  (0);
+	BEGIN_RING(chan, celsius, NV10TCL_VIEWPORT_TRANSLATE_X, 4);
+	OUT_RINGf  (chan, -2048.0);
+	OUT_RINGf  (chan, -2048.0);
+	OUT_RINGf  (chan, 16777215.0 * 0.5);
+	OUT_RING  (chan, 0);
 
-	FIRE_RING (NULL);
+	FIRE_RING (chan);
 }
 
 struct pipe_context *
diff --git a/src/gallium/drivers/nv10/nv10_context.h b/src/gallium/drivers/nv10/nv10_context.h
index 36a6aa7..bb9fb15 100644
--- a/src/gallium/drivers/nv10/nv10_context.h
+++ b/src/gallium/drivers/nv10/nv10_context.h
@@ -15,10 +15,6 @@
 #include "nouveau/nouveau_gldefs.h"
 #include "nouveau/nouveau_context.h"
 
-#define NOUVEAU_PUSH_CONTEXT(ctx)                                              \
-	struct nv10_screen *ctx = nv10->screen
-#include "nouveau/nouveau_push.h"
-
 #include "nv10_state.h"
 
 #define NOUVEAU_ERR(fmt, args...) \
diff --git a/src/gallium/drivers/nv10/nv10_fragtex.c b/src/gallium/drivers/nv10/nv10_fragtex.c
index 906fdfe..c1f7ccb 100644
--- a/src/gallium/drivers/nv10/nv10_fragtex.c
+++ b/src/gallium/drivers/nv10/nv10_fragtex.c
@@ -52,6 +52,9 @@ nv10_fragtex_build(struct nv10_context *nv10, int unit)
 	struct nv10_miptree *nv10mt = nv10->tex_miptree[unit];
 	struct pipe_texture *pt = &nv10mt->base;
 	struct nv10_texture_format *tf;
+	struct nv10_screen *screen = nv10->screen;
+	struct nouveau_channel *chan = screen->base.channel;
+	struct nouveau_grobj *celsius = screen->celsius;
 	uint32_t txf, txs, txp;
 
 	tf = nv10_fragtex_format(pt->format);
@@ -82,15 +85,15 @@ nv10_fragtex_build(struct nv10_context *nv10, int unit)
 		return;
 	}
 
-	BEGIN_RING(celsius, NV10TCL_TX_OFFSET(unit), 8);
-	OUT_RELOCl(nv10mt->buffer, 0, NOUVEAU_BO_VRAM | NOUVEAU_BO_GART | NOUVEAU_BO_RD);
-	OUT_RELOCd(nv10mt->buffer,txf,NOUVEAU_BO_VRAM | NOUVEAU_BO_GART | NOUVEAU_BO_OR | NOUVEAU_BO_RD, 1/*VRAM*/,2/*TT*/);
-	OUT_RING  (ps->wrap);
-	OUT_RING  (0x40000000); /* enable */
-	OUT_RING  (txs);
-	OUT_RING  (ps->filt | 0x2000 /* magic */);
-	OUT_RING  ((pt->width0 << 16) | pt->height0);
-	OUT_RING  (ps->bcol);
+	BEGIN_RING(chan, celsius, NV10TCL_TX_OFFSET(unit), 8);
+	OUT_RELOCl(chan, nouveau_bo(nv10mt->buffer), 0, NOUVEAU_BO_VRAM | NOUVEAU_BO_GART | NOUVEAU_BO_RD);
+	OUT_RELOCd(chan, nouveau_bo(nv10mt->buffer),txf,NOUVEAU_BO_VRAM | NOUVEAU_BO_GART | NOUVEAU_BO_OR | NOUVEAU_BO_RD, 1/*VRAM*/,2/*TT*/);
+	OUT_RING  (chan, ps->wrap);
+	OUT_RING  (chan, 0x40000000); /* enable */
+	OUT_RING  (chan, txs);
+	OUT_RING  (chan, ps->filt | 0x2000 /* magic */);
+	OUT_RING  (chan, (pt->width0 << 16) | pt->height0);
+	OUT_RING  (chan, ps->bcol);
 #endif
 }
 
@@ -99,6 +102,9 @@ nv10_fragtex_bind(struct nv10_context *nv10)
 {
 #if 0
 	struct nv10_fragment_program *fp = nv10->fragprog.active;
+	struct nv10_screen *screen = nv10->screen;
+	struct nouveau_channel *chan = screen->base.channel;
+	struct nouveau_grobj *celsius = screen->celsius;
 	unsigned samplers, unit;
 
 	samplers = nv10->fp_samplers & ~fp->samplers;
@@ -106,8 +112,8 @@ nv10_fragtex_bind(struct nv10_context *nv10)
 		unit = ffs(samplers) - 1;
 		samplers &= ~(1 << unit);
 
-		BEGIN_RING(celsius, NV10TCL_TX_ENABLE(unit), 1);
-		OUT_RING  (0);
+		BEGIN_RING(chan, celsius, NV10TCL_TX_ENABLE(unit), 1);
+		OUT_RING  (chan, 0);
 	}
 
 	samplers = nv10->dirty_samplers & fp->samplers;
diff --git a/src/gallium/drivers/nv10/nv10_prim_vbuf.c b/src/gallium/drivers/nv10/nv10_prim_vbuf.c
index 7ba9777..c5dbe43 100644
--- a/src/gallium/drivers/nv10/nv10_prim_vbuf.c
+++ b/src/gallium/drivers/nv10/nv10_prim_vbuf.c
@@ -67,12 +67,15 @@ struct nv10_vbuf_render {
 
 void nv10_vtxbuf_bind( struct nv10_context* nv10 )
 {
+	struct nv10_screen *screen = nv10->screen;
+	struct nouveau_channel *chan = screen->base.channel;
+	struct nouveau_grobj *celsius = screen->celsius;
 	int i;
 	for(i = 0; i < 8; i++) {
-		BEGIN_RING(celsius, NV10TCL_VTXBUF_ADDRESS(i), 1);
-		OUT_RING(0/*nv10->vtxbuf*/);
-		BEGIN_RING(celsius, NV10TCL_VTXFMT(i), 1);
-		OUT_RING(0/*XXX*/);
+		BEGIN_RING(chan, celsius, NV10TCL_VTXBUF_ADDRESS(i), 1);
+		OUT_RING(chan, 0/*nv10->vtxbuf*/);
+		BEGIN_RING(chan, celsius, NV10TCL_VTXFMT(i), 1);
+		OUT_RING(chan, 0/*XXX*/);
 	}
 }
 
@@ -163,19 +166,22 @@ nv10_vbuf_render_draw( struct vbuf_render *render,
 {
 	struct nv10_vbuf_render *nv10_render = nv10_vbuf_render(render);
 	struct nv10_context *nv10 = nv10_render->nv10;
+	struct nv10_screen *screen = nv10->screen;
+	struct nouveau_channel *chan = screen->base.channel;
+	struct nouveau_grobj *celsius = screen->celsius;
 	int push, i;
 
 	nv10_emit_hw_state(nv10);
 
-	BEGIN_RING(celsius, NV10TCL_VERTEX_ARRAY_OFFSET_POS, 1);
-	OUT_RELOCl(nv10_render->buffer, 0, NOUVEAU_BO_VRAM | NOUVEAU_BO_GART | NOUVEAU_BO_RD);
+	BEGIN_RING(chan, celsius, NV10TCL_VERTEX_ARRAY_OFFSET_POS, 1);
+	OUT_RELOCl(chan, nouveau_bo(nv10_render->buffer), 0, NOUVEAU_BO_VRAM | NOUVEAU_BO_GART | NOUVEAU_BO_RD);
 
-	BEGIN_RING(celsius, NV10TCL_VERTEX_BUFFER_BEGIN_END, 1);
-	OUT_RING(nv10_render->hwprim);
+	BEGIN_RING(chan, celsius, NV10TCL_VERTEX_BUFFER_BEGIN_END, 1);
+	OUT_RING(chan, nv10_render->hwprim);
 
 	if (nr_indices & 1) {
-		BEGIN_RING(celsius, NV10TCL_VB_ELEMENT_U32, 1);
-		OUT_RING  (indices[0]);
+		BEGIN_RING(chan, celsius, NV10TCL_VB_ELEMENT_U32, 1);
+		OUT_RING  (chan, indices[0]);
 		indices++; nr_indices--;
 	}
 
@@ -183,16 +189,16 @@ nv10_vbuf_render_draw( struct vbuf_render *render,
 		// XXX too big/small ? check the size
 		push = MIN2(nr_indices, 1200 * 2);
 
-		BEGIN_RING_NI(celsius, NV10TCL_VB_ELEMENT_U16, push >> 1);
+		BEGIN_RING_NI(chan, celsius, NV10TCL_VB_ELEMENT_U16, push >> 1);
 		for (i = 0; i < push; i+=2)
-			OUT_RING((indices[i+1] << 16) | indices[i]);
+			OUT_RING(chan, (indices[i+1] << 16) | indices[i]);
 
 		nr_indices -= push;
 		indices  += push;
 	}
 
-	BEGIN_RING(celsius, NV10TCL_VERTEX_BUFFER_BEGIN_END, 1);
-	OUT_RING  (0);
+	BEGIN_RING(chan, celsius, NV10TCL_VERTEX_BUFFER_BEGIN_END, 1);
+	OUT_RING  (chan, 0);
 }
 
 
diff --git a/src/gallium/drivers/nv10/nv10_state_emit.c b/src/gallium/drivers/nv10/nv10_state_emit.c
index 2577ab7..30a596c 100644
--- a/src/gallium/drivers/nv10/nv10_state_emit.c
+++ b/src/gallium/drivers/nv10/nv10_state_emit.c
@@ -4,25 +4,32 @@
 static void nv10_state_emit_blend(struct nv10_context* nv10)
 {
 	struct nv10_blend_state *b = nv10->blend;
+	struct nv10_screen *screen = nv10->screen;
+	struct nouveau_channel *chan = screen->base.channel;
+	struct nouveau_grobj *celsius = screen->celsius;
 
-	BEGIN_RING(celsius, NV10TCL_DITHER_ENABLE, 1);
-	OUT_RING  (b->d_enable);
+	BEGIN_RING(chan, celsius, NV10TCL_DITHER_ENABLE, 1);
+	OUT_RING  (chan, b->d_enable);
 
-	BEGIN_RING(celsius, NV10TCL_BLEND_FUNC_ENABLE, 3);
-	OUT_RING  (b->b_enable);
-	OUT_RING  (b->b_srcfunc);
-	OUT_RING  (b->b_dstfunc);
+	BEGIN_RING(chan, celsius, NV10TCL_BLEND_FUNC_ENABLE, 3);
+	OUT_RING  (chan, b->b_enable);
+	OUT_RING  (chan, b->b_srcfunc);
+	OUT_RING  (chan, b->b_dstfunc);
 
-	BEGIN_RING(celsius, NV10TCL_COLOR_MASK, 1);
-	OUT_RING  (b->c_mask);
+	BEGIN_RING(chan, celsius, NV10TCL_COLOR_MASK, 1);
+	OUT_RING  (chan, b->c_mask);
 }
 
 static void nv10_state_emit_blend_color(struct nv10_context* nv10)
 {
 	struct pipe_blend_color *c = nv10->blend_color;
+	struct nv10_screen *screen = nv10->screen;
+	struct nouveau_channel *chan = screen->base.channel;
+	struct nouveau_grobj *celsius = screen->celsius;
 
-	BEGIN_RING(celsius, NV10TCL_BLEND_COLOR, 1);
-	OUT_RING  ((float_to_ubyte(c->color[3]) << 24)|
+	BEGIN_RING(chan, celsius, NV10TCL_BLEND_COLOR, 1);
+	OUT_RING  (chan,
+		   (float_to_ubyte(c->color[3]) << 24)|
 		   (float_to_ubyte(c->color[0]) << 16)|
 		   (float_to_ubyte(c->color[1]) << 8) |
 		   (float_to_ubyte(c->color[2]) << 0));
@@ -31,60 +38,66 @@ static void nv10_state_emit_blend_color(struct nv10_context* nv10)
 static void nv10_state_emit_rast(struct nv10_context* nv10)
 {
 	struct nv10_rasterizer_state *r = nv10->rast;
+	struct nv10_screen *screen = nv10->screen;
+	struct nouveau_channel *chan = screen->base.channel;
+	struct nouveau_grobj *celsius = screen->celsius;
 
-	BEGIN_RING(celsius, NV10TCL_SHADE_MODEL, 2);
-	OUT_RING  (r->shade_model);
-	OUT_RING  (r->line_width);
+	BEGIN_RING(chan, celsius, NV10TCL_SHADE_MODEL, 2);
+	OUT_RING  (chan, r->shade_model);
+	OUT_RING  (chan, r->line_width);
 
 
-	BEGIN_RING(celsius, NV10TCL_POINT_SIZE, 1);
-	OUT_RING  (r->point_size);
+	BEGIN_RING(chan, celsius, NV10TCL_POINT_SIZE, 1);
+	OUT_RING  (chan, r->point_size);
 
-	BEGIN_RING(celsius, NV10TCL_POLYGON_MODE_FRONT, 2);
-	OUT_RING  (r->poly_mode_front);
-	OUT_RING  (r->poly_mode_back);
+	BEGIN_RING(chan, celsius, NV10TCL_POLYGON_MODE_FRONT, 2);
+	OUT_RING  (chan, r->poly_mode_front);
+	OUT_RING  (chan, r->poly_mode_back);
 
 
-	BEGIN_RING(celsius, NV10TCL_CULL_FACE, 2);
-	OUT_RING  (r->cull_face);
-	OUT_RING  (r->front_face);
+	BEGIN_RING(chan, celsius, NV10TCL_CULL_FACE, 2);
+	OUT_RING  (chan, r->cull_face);
+	OUT_RING  (chan, r->front_face);
 
-	BEGIN_RING(celsius, NV10TCL_LINE_SMOOTH_ENABLE, 2);
-	OUT_RING  (r->line_smooth_en);
-	OUT_RING  (r->poly_smooth_en);
+	BEGIN_RING(chan, celsius, NV10TCL_LINE_SMOOTH_ENABLE, 2);
+	OUT_RING  (chan, r->line_smooth_en);
+	OUT_RING  (chan, r->poly_smooth_en);
 
-	BEGIN_RING(celsius, NV10TCL_CULL_FACE_ENABLE, 1);
-	OUT_RING  (r->cull_face_en);
+	BEGIN_RING(chan, celsius, NV10TCL_CULL_FACE_ENABLE, 1);
+	OUT_RING  (chan, r->cull_face_en);
 }
 
 static void nv10_state_emit_dsa(struct nv10_context* nv10)
 {
 	struct nv10_depth_stencil_alpha_state *d = nv10->dsa;
+	struct nv10_screen *screen = nv10->screen;
+	struct nouveau_channel *chan = screen->base.channel;
+	struct nouveau_grobj *celsius = screen->celsius;
 
-	BEGIN_RING(celsius, NV10TCL_DEPTH_FUNC, 1);
-	OUT_RING (d->depth.func);
+	BEGIN_RING(chan, celsius, NV10TCL_DEPTH_FUNC, 1);
+	OUT_RING (chan, d->depth.func);
 
-	BEGIN_RING(celsius, NV10TCL_DEPTH_WRITE_ENABLE, 1);
-	OUT_RING (d->depth.write_enable);
+	BEGIN_RING(chan, celsius, NV10TCL_DEPTH_WRITE_ENABLE, 1);
+	OUT_RING (chan, d->depth.write_enable);
 
-	BEGIN_RING(celsius, NV10TCL_DEPTH_TEST_ENABLE, 1);
-	OUT_RING (d->depth.test_enable);
+	BEGIN_RING(chan, celsius, NV10TCL_DEPTH_TEST_ENABLE, 1);
+	OUT_RING (chan, d->depth.test_enable);
 
 #if 0
-	BEGIN_RING(celsius, NV10TCL_STENCIL_ENABLE, 1);
-	OUT_RING (d->stencil.enable);
-	BEGIN_RING(celsius, NV10TCL_STENCIL_MASK, 7);
-	OUT_RINGp ((uint32_t *)&(d->stencil.wmask), 7);
+	BEGIN_RING(chan, celsius, NV10TCL_STENCIL_ENABLE, 1);
+	OUT_RING (chan, d->stencil.enable);
+	BEGIN_RING(chan, celsius, NV10TCL_STENCIL_MASK, 7);
+	OUT_RINGp (chan, (uint32_t *)&(d->stencil.wmask), 7);
 #endif
 
-	BEGIN_RING(celsius, NV10TCL_ALPHA_FUNC_ENABLE, 1);
-	OUT_RING (d->alpha.enabled);
+	BEGIN_RING(chan, celsius, NV10TCL_ALPHA_FUNC_ENABLE, 1);
+	OUT_RING (chan, d->alpha.enabled);
 
-	BEGIN_RING(celsius, NV10TCL_ALPHA_FUNC_FUNC, 1);
-	OUT_RING (d->alpha.func);
+	BEGIN_RING(chan, celsius, NV10TCL_ALPHA_FUNC_FUNC, 1);
+	OUT_RING (chan, d->alpha.func);
 
-	BEGIN_RING(celsius, NV10TCL_ALPHA_FUNC_REF, 1);
-	OUT_RING (d->alpha.ref);
+	BEGIN_RING(chan, celsius, NV10TCL_ALPHA_FUNC_REF, 1);
+	OUT_RING (chan, d->alpha.ref);
 }
 
 static void nv10_state_emit_viewport(struct nv10_context* nv10)
@@ -108,6 +121,10 @@ static void nv10_state_emit_framebuffer(struct nv10_context* nv10)
 	int colour_format = 0, zeta_format = 0;
         struct nv10_miptree *nv10mt = 0;
 
+	struct nv10_screen *screen = nv10->screen;
+	struct nouveau_channel *chan = screen->base.channel;
+	struct nouveau_grobj *celsius = screen->celsius;
+
 	w = fb->cbufs[0]->width;
 	h = fb->cbufs[0]->height;
 	colour_format = fb->cbufs[0]->format;
@@ -144,11 +161,11 @@ static void nv10_state_emit_framebuffer(struct nv10_context* nv10)
 	}
 
 	if (zeta) {
-		BEGIN_RING(celsius, NV10TCL_RT_PITCH, 1);
-		OUT_RING  (rt->pitch | (zeta->pitch << 16));
+		BEGIN_RING(chan, celsius, NV10TCL_RT_PITCH, 1);
+		OUT_RING  (chan, rt->pitch | (zeta->pitch << 16));
 	} else {
-		BEGIN_RING(celsius, NV10TCL_RT_PITCH, 1);
-		OUT_RING  (rt->pitch | (rt->pitch << 16));
+		BEGIN_RING(chan, celsius, NV10TCL_RT_PITCH, 1);
+		OUT_RING  (chan, rt->pitch | (rt->pitch << 16));
 	}
 
 	nv10mt = (struct nv10_miptree *)rt->base.texture;
@@ -160,13 +177,13 @@ static void nv10_state_emit_framebuffer(struct nv10_context* nv10)
 		nv10->zeta = nv10mt->buffer;
 	}
 
-	BEGIN_RING(celsius, NV10TCL_RT_HORIZ, 3);
-	OUT_RING  ((w << 16) | 0);
-	OUT_RING  ((h << 16) | 0);
-	OUT_RING  (rt_format);
-	BEGIN_RING(celsius, NV10TCL_VIEWPORT_CLIP_HORIZ(0), 2);
-	OUT_RING  (((w - 1) << 16) | 0 | 0x08000800);
-	OUT_RING  (((h - 1) << 16) | 0 | 0x08000800);
+	BEGIN_RING(chan, celsius, NV10TCL_RT_HORIZ, 3);
+	OUT_RING  (chan, (w << 16) | 0);
+	OUT_RING  (chan, (h << 16) | 0);
+	OUT_RING  (chan, rt_format);
+	BEGIN_RING(chan, celsius, NV10TCL_VIEWPORT_CLIP_HORIZ(0), 2);
+	OUT_RING  (chan, ((w - 1) << 16) | 0 | 0x08000800);
+	OUT_RING  (chan, ((h - 1) << 16) | 0 | 0x08000800);
 }
 
 static void nv10_vertex_layout(struct nv10_context *nv10)
@@ -201,6 +218,10 @@ static void nv10_vertex_layout(struct nv10_context *nv10)
 void
 nv10_emit_hw_state(struct nv10_context *nv10)
 {
+	struct nv10_screen *screen = nv10->screen;
+	struct nouveau_channel *chan = screen->base.channel;
+	struct nouveau_grobj *celsius = screen->celsius;
+	struct nouveau_bo *rt_bo;
 	int i;
 
 	if (nv10->dirty & NV10_NEW_VERTPROG) {
@@ -269,38 +290,41 @@ nv10_emit_hw_state(struct nv10_context *nv10)
 	 */
 
 	/* Render target */
+	rt_bo = nouveau_bo(nv10->rt[0]);
 // XXX figre out who's who for NV10TCL_DMA_* and fill accordingly
-//	BEGIN_RING(celsius, NV10TCL_DMA_COLOR0, 1);
-//	OUT_RELOCo(nv10->rt[0], NOUVEAU_BO_VRAM | NOUVEAU_BO_WR);
-	BEGIN_RING(celsius, NV10TCL_COLOR_OFFSET, 1);
-	OUT_RELOCl(nv10->rt[0], 0, NOUVEAU_BO_VRAM | NOUVEAU_BO_WR);
+//	BEGIN_RING(chan, celsius, NV10TCL_DMA_COLOR0, 1);
+//	OUT_RELOCo(chan, rt_bo, NOUVEAU_BO_VRAM | NOUVEAU_BO_WR);
+	BEGIN_RING(chan, celsius, NV10TCL_COLOR_OFFSET, 1);
+	OUT_RELOCl(chan, rt_bo, 0, NOUVEAU_BO_VRAM | NOUVEAU_BO_WR);
 
 	if (nv10->zeta) {
+		struct nouveau_bo *zeta_bo = nouveau_bo(nv10->zeta);
 // XXX
-//		BEGIN_RING(celsius, NV10TCL_DMA_ZETA, 1);
-//		OUT_RELOCo(nv10->zeta, NOUVEAU_BO_VRAM | NOUVEAU_BO_WR);
-		BEGIN_RING(celsius, NV10TCL_ZETA_OFFSET, 1);
-		OUT_RELOCl(nv10->zeta, 0, NOUVEAU_BO_VRAM | NOUVEAU_BO_WR);
+//		BEGIN_RING(chan, celsius, NV10TCL_DMA_ZETA, 1);
+//		OUT_RELOCo(chan, zeta_bo, NOUVEAU_BO_VRAM | NOUVEAU_BO_WR);
+		BEGIN_RING(chan, celsius, NV10TCL_ZETA_OFFSET, 1);
+		OUT_RELOCl(chan, zeta_bo, 0, NOUVEAU_BO_VRAM | NOUVEAU_BO_WR);
 		/* XXX for when we allocate LMA on nv17 */
-/*		BEGIN_RING(celsius, NV10TCL_LMA_DEPTH_BUFFER_OFFSET, 1);
-		OUT_RELOCl(nv10->zeta + lma_offset);*/
+/*		BEGIN_RING(chan, celsius, NV10TCL_LMA_DEPTH_BUFFER_OFFSET, 1);
+		OUT_RELOCl(chan, nouveau_bo(nv10->zeta + lma_offset));*/
 	}
 
 	/* Vertex buffer */
-	BEGIN_RING(celsius, NV10TCL_DMA_VTXBUF0, 1);
-	OUT_RELOCo(nv10->rt[0], NOUVEAU_BO_VRAM | NOUVEAU_BO_WR);
-	BEGIN_RING(celsius, NV10TCL_COLOR_OFFSET, 1);
-	OUT_RELOCl(nv10->rt[0], 0, NOUVEAU_BO_VRAM | NOUVEAU_BO_WR);
+	BEGIN_RING(chan, celsius, NV10TCL_DMA_VTXBUF0, 1);
+	OUT_RELOCo(chan, rt_bo, NOUVEAU_BO_VRAM | NOUVEAU_BO_WR);
+	BEGIN_RING(chan, celsius, NV10TCL_COLOR_OFFSET, 1);
+	OUT_RELOCl(chan, rt_bo, 0, NOUVEAU_BO_VRAM | NOUVEAU_BO_WR);
 
 	/* Texture images */
 	for (i = 0; i < 2; i++) {
 		if (!(nv10->fp_samplers & (1 << i)))
 			continue;
-		BEGIN_RING(celsius, NV10TCL_TX_OFFSET(i), 1);
-		OUT_RELOCl(nv10->tex[i].buffer, 0, NOUVEAU_BO_VRAM |
+		struct nouveau_bo *bo = nouveau_bo(nv10->tex[i].buffer);
+		BEGIN_RING(chan, celsius, NV10TCL_TX_OFFSET(i), 1);
+		OUT_RELOCl(chan, bo, 0, NOUVEAU_BO_VRAM |
 			   NOUVEAU_BO_GART | NOUVEAU_BO_RD);
-		BEGIN_RING(celsius, NV10TCL_TX_FORMAT(i), 1);
-		OUT_RELOCd(nv10->tex[i].buffer, nv10->tex[i].format,
+		BEGIN_RING(chan, celsius, NV10TCL_TX_FORMAT(i), 1);
+		OUT_RELOCd(chan, bo, nv10->tex[i].format,
 			   NOUVEAU_BO_VRAM | NOUVEAU_BO_GART | NOUVEAU_BO_RD |
 			   NOUVEAU_BO_OR, NV10TCL_TX_FORMAT_DMA0,
 			   NV10TCL_TX_FORMAT_DMA1);
diff --git a/src/gallium/drivers/nv20/nv20_context.c b/src/gallium/drivers/nv20/nv20_context.c
index 6a147a4..1dba724 100644
--- a/src/gallium/drivers/nv20/nv20_context.c
+++ b/src/gallium/drivers/nv20/nv20_context.c
@@ -10,10 +10,14 @@ nv20_flush(struct pipe_context *pipe, unsigned flags,
 	   struct pipe_fence_handle **fence)
 {
 	struct nv20_context *nv20 = nv20_context(pipe);
+	struct nv20_screen *screen = nv20->screen;
+	struct nouveau_channel *chan = screen->base.channel;
 
 	draw_flush(nv20->draw);
 
-	FIRE_RING(fence);
+	FIRE_RING(chan);
+	if (fence)
+		*fence = NULL;
 }
 
 static void
@@ -31,348 +35,352 @@ static void nv20_init_hwctx(struct nv20_context *nv20)
 {
 	struct nv20_screen *screen = nv20->screen;
 	struct nouveau_channel *chan = screen->base.channel;
+	struct nouveau_grobj *kelvin = screen->kelvin;
 	int i;
 	float projectionmatrix[16];
-	const boolean is_nv25tcl = (nv20->screen->kelvin->grclass == NV25TCL);
+	const boolean is_nv25tcl = (kelvin->grclass == NV25TCL);
 
-	BEGIN_RING(kelvin, NV20TCL_DMA_NOTIFY, 1);
-	OUT_RING  (screen->sync->handle);
-	BEGIN_RING(kelvin, NV20TCL_DMA_TEXTURE0, 2);
-	OUT_RING  (chan->vram->handle);
-	OUT_RING  (chan->gart->handle); /* TEXTURE1 */
-	BEGIN_RING(kelvin, NV20TCL_DMA_COLOR, 2);
-	OUT_RING  (chan->vram->handle);
-	OUT_RING  (chan->vram->handle); /* ZETA */
+	BEGIN_RING(chan, kelvin, NV20TCL_DMA_NOTIFY, 1);
+	OUT_RING  (chan, screen->sync->handle);
+	BEGIN_RING(chan, kelvin, NV20TCL_DMA_TEXTURE0, 2);
+	OUT_RING  (chan, chan->vram->handle);
+	OUT_RING  (chan, chan->gart->handle); /* TEXTURE1 */
+	BEGIN_RING(chan, kelvin, NV20TCL_DMA_COLOR, 2);
+	OUT_RING  (chan, chan->vram->handle);
+	OUT_RING  (chan, chan->vram->handle); /* ZETA */
 
-	BEGIN_RING(kelvin, NV20TCL_DMA_QUERY, 1);
-	OUT_RING  (0); /* renouveau: beef0351, unique */
+	BEGIN_RING(chan, kelvin, NV20TCL_DMA_QUERY, 1);
+	OUT_RING  (chan, 0); /* renouveau: beef0351, unique */
 
-	BEGIN_RING(kelvin, NV20TCL_RT_HORIZ, 2);
-	OUT_RING  (0);
-	OUT_RING  (0);
+	BEGIN_RING(chan, kelvin, NV20TCL_RT_HORIZ, 2);
+	OUT_RING  (chan, 0);
+	OUT_RING  (chan, 0);
 
-	BEGIN_RING(kelvin, NV20TCL_VIEWPORT_CLIP_HORIZ(0), 1);
-	OUT_RING  ((0xfff << 16) | 0x0);
-	BEGIN_RING(kelvin, NV20TCL_VIEWPORT_CLIP_VERT(0), 1);
-	OUT_RING  ((0xfff << 16) | 0x0);
+	BEGIN_RING(chan, kelvin, NV20TCL_VIEWPORT_CLIP_HORIZ(0), 1);
+	OUT_RING  (chan, (0xfff << 16) | 0x0);
+	BEGIN_RING(chan, kelvin, NV20TCL_VIEWPORT_CLIP_VERT(0), 1);
+	OUT_RING  (chan, (0xfff << 16) | 0x0);
 
 	for (i = 1; i < NV20TCL_VIEWPORT_CLIP_HORIZ__SIZE; i++) {
-		BEGIN_RING(kelvin, NV20TCL_VIEWPORT_CLIP_HORIZ(i), 1);
-		OUT_RING  (0);
-		BEGIN_RING(kelvin, NV20TCL_VIEWPORT_CLIP_VERT(i), 1);
-		OUT_RING  (0);
+		BEGIN_RING(chan, kelvin, NV20TCL_VIEWPORT_CLIP_HORIZ(i), 1);
+		OUT_RING  (chan, 0);
+		BEGIN_RING(chan, kelvin, NV20TCL_VIEWPORT_CLIP_VERT(i), 1);
+		OUT_RING  (chan, 0);
 	}
 
-	BEGIN_RING(kelvin, NV20TCL_VIEWPORT_CLIP_MODE, 1);
-	OUT_RING  (0);
+	BEGIN_RING(chan, kelvin, NV20TCL_VIEWPORT_CLIP_MODE, 1);
+	OUT_RING  (chan, 0);
 
-	BEGIN_RING(kelvin, 0x17e0, 3);
-	OUT_RINGf (0.0);
-	OUT_RINGf (0.0);
-	OUT_RINGf (1.0);
+	BEGIN_RING(chan, kelvin, 0x17e0, 3);
+	OUT_RINGf (chan, 0.0);
+	OUT_RINGf (chan, 0.0);
+	OUT_RINGf (chan, 1.0);
 
 	if (is_nv25tcl) {
-		BEGIN_RING(kelvin, NV20TCL_TX_RCOMP, 1);
-		OUT_RING  (NV20TCL_TX_RCOMP_LEQUAL | 0xdb0);
+		BEGIN_RING(chan, kelvin, NV20TCL_TX_RCOMP, 1);
+		OUT_RING  (chan, NV20TCL_TX_RCOMP_LEQUAL | 0xdb0);
 	} else {
-		BEGIN_RING(kelvin, 0x1e68, 1);
-		OUT_RING  (0x4b800000); /* 16777216.000000 */
-		BEGIN_RING(kelvin, NV20TCL_TX_RCOMP, 1);
-		OUT_RING  (NV20TCL_TX_RCOMP_LEQUAL);
+		BEGIN_RING(chan, kelvin, 0x1e68, 1);
+		OUT_RING  (chan, 0x4b800000); /* 16777216.000000 */
+		BEGIN_RING(chan, kelvin, NV20TCL_TX_RCOMP, 1);
+		OUT_RING  (chan, NV20TCL_TX_RCOMP_LEQUAL);
 	}
 
-	BEGIN_RING(kelvin, 0x290, 1);
-	OUT_RING  ((0x10 << 16) | 1);
-	BEGIN_RING(kelvin, 0x9fc, 1);
-	OUT_RING  (0);
-	BEGIN_RING(kelvin, 0x1d80, 1);
-	OUT_RING  (1);
-	BEGIN_RING(kelvin, 0x9f8, 1);
-	OUT_RING  (4);
-	BEGIN_RING(kelvin, 0x17ec, 3);
-	OUT_RINGf (0.0);
-	OUT_RINGf (1.0);
-	OUT_RINGf (0.0);
+	BEGIN_RING(chan, kelvin, 0x290, 1);
+	OUT_RING  (chan, (0x10 << 16) | 1);
+	BEGIN_RING(chan, kelvin, 0x9fc, 1);
+	OUT_RING  (chan, 0);
+	BEGIN_RING(chan, kelvin, 0x1d80, 1);
+	OUT_RING  (chan, 1);
+	BEGIN_RING(chan, kelvin, 0x9f8, 1);
+	OUT_RING  (chan, 4);
+	BEGIN_RING(chan, kelvin, 0x17ec, 3);
+	OUT_RINGf (chan, 0.0);
+	OUT_RINGf (chan, 1.0);
+	OUT_RINGf (chan, 0.0);
 
 	if (is_nv25tcl) {
-		BEGIN_RING(kelvin, 0x1d88, 1);
-		OUT_RING  (3);
+		BEGIN_RING(chan, kelvin, 0x1d88, 1);
+		OUT_RING  (chan, 3);
 
-		BEGIN_RING(kelvin, NV25TCL_DMA_IN_MEMORY9, 1);
-		OUT_RING  (chan->vram->handle);
-		BEGIN_RING(kelvin, NV25TCL_DMA_IN_MEMORY8, 1);
-		OUT_RING  (chan->vram->handle);
+		BEGIN_RING(chan, kelvin, NV25TCL_DMA_IN_MEMORY9, 1);
+		OUT_RING  (chan, chan->vram->handle);
+		BEGIN_RING(chan, kelvin, NV25TCL_DMA_IN_MEMORY8, 1);
+		OUT_RING  (chan, chan->vram->handle);
 	}
-	BEGIN_RING(kelvin, NV20TCL_DMA_FENCE, 1);
-	OUT_RING  (0);	/* renouveau: beef1e10 */
+	BEGIN_RING(chan, kelvin, NV20TCL_DMA_FENCE, 1);
+	OUT_RING  (chan, 0);	/* renouveau: beef1e10 */
 
-	BEGIN_RING(kelvin, 0x1e98, 1);
-	OUT_RING  (0);
+	BEGIN_RING(chan, kelvin, 0x1e98, 1);
+	OUT_RING  (chan, 0);
 #if 0
 	if (is_nv25tcl) {
-		BEGIN_RING(NvSub3D, NV25TCL_DMA_IN_MEMORY4, 2);
-		OUT_RING  (NvDmaTT);	/* renouveau: beef0202 */
-		OUT_RING  (NvDmaFB);	/* renouveau: beef0201 */
+		BEGIN_RING(chan, NvSub3D, NV25TCL_DMA_IN_MEMORY4, 2);
+		OUT_RING  (chan, NvDmaTT);	/* renouveau: beef0202 */
+		OUT_RING  (chan, NvDmaFB);	/* renouveau: beef0201 */
 
-		BEGIN_RING(NvSub3D, NV20TCL_DMA_TEXTURE1, 1);
-		OUT_RING  (NvDmaTT);	/* renouveau: beef0202 */
+		BEGIN_RING(chan, NvSub3D, NV20TCL_DMA_TEXTURE1, 1);
+		OUT_RING  (chan, NvDmaTT);	/* renouveau: beef0202 */
 	}
 #endif
-	BEGIN_RING(kelvin, NV20TCL_NOTIFY, 1);
-	OUT_RING  (0);
+	BEGIN_RING(chan, kelvin, NV20TCL_NOTIFY, 1);
+	OUT_RING  (chan, 0);
 
-	BEGIN_RING(kelvin, 0x120, 3);
-	OUT_RING  (0);
-	OUT_RING  (1);
-	OUT_RING  (2);
+	BEGIN_RING(chan, kelvin, 0x120, 3);
+	OUT_RING  (chan, 0);
+	OUT_RING  (chan, 1);
+	OUT_RING  (chan, 2);
 
 /* error: ILLEGAL_MTHD, PROTECTION_FAULT
-	BEGIN_RING(kelvin, NV20TCL_VIEWPORT_TRANSLATE_X, 4);
-	OUT_RINGf (0.0);
-	OUT_RINGf (512.0);
-	OUT_RINGf (0.0);
-	OUT_RINGf (0.0);
+	BEGIN_RING(chan, kelvin, NV20TCL_VIEWPORT_TRANSLATE_X, 4);
+	OUT_RINGf (chan, 0.0);
+	OUT_RINGf (chan, 512.0);
+	OUT_RINGf (chan, 0.0);
+	OUT_RINGf (chan, 0.0);
 */
 
 	if (is_nv25tcl) {
-		BEGIN_RING(kelvin, 0x022c, 2);
-		OUT_RING  (0x280);
-		OUT_RING  (0x07d28000);
+		BEGIN_RING(chan, kelvin, 0x022c, 2);
+		OUT_RING  (chan, 0x280);
+		OUT_RING  (chan, 0x07d28000);
 	}
 
 /* * illegal method, protection fault
-	BEGIN_RING(NvSub3D, 0x1c2c, 1);
-	OUT_RING  (0); */
+	BEGIN_RING(chan, NvSub3D, 0x1c2c, 1);
+	OUT_RING  (chan, 0); */
 
 	if (is_nv25tcl) {
-		BEGIN_RING(kelvin, 0x1da4, 1);
-		OUT_RING  (0);
+		BEGIN_RING(chan, kelvin, 0x1da4, 1);
+		OUT_RING  (chan, 0);
 	}
 
 /* * crashes with illegal method, protection fault
-	BEGIN_RING(NvSub3D, 0x1c18, 1);
-	OUT_RING  (0x200); */
+	BEGIN_RING(chan, NvSub3D, 0x1c18, 1);
+	OUT_RING  (chan, 0x200); */
 
-	BEGIN_RING(kelvin, NV20TCL_RT_HORIZ, 2);
-	OUT_RING  ((0 << 16) | 0);
-	OUT_RING  ((0 << 16) | 0);
+	BEGIN_RING(chan, kelvin, NV20TCL_RT_HORIZ, 2);
+	OUT_RING  (chan, (0 << 16) | 0);
+	OUT_RING  (chan, (0 << 16) | 0);
 
 	/* *** Set state *** */
 
-	BEGIN_RING(kelvin, NV20TCL_ALPHA_FUNC_ENABLE, 1);
-	OUT_RING  (0);
-	BEGIN_RING(kelvin, NV20TCL_ALPHA_FUNC_FUNC, 2);
-	OUT_RING  (NV20TCL_ALPHA_FUNC_FUNC_ALWAYS);
-	OUT_RING  (0);			/* NV20TCL_ALPHA_FUNC_REF */
+	BEGIN_RING(chan, kelvin, NV20TCL_ALPHA_FUNC_ENABLE, 1);
+	OUT_RING  (chan, 0);
+	BEGIN_RING(chan, kelvin, NV20TCL_ALPHA_FUNC_FUNC, 2);
+	OUT_RING  (chan, NV20TCL_ALPHA_FUNC_FUNC_ALWAYS);
+	OUT_RING  (chan, 0);			/* NV20TCL_ALPHA_FUNC_REF */
 
 	for (i = 0; i < NV20TCL_TX_ENABLE__SIZE; ++i) {
-		BEGIN_RING(kelvin, NV20TCL_TX_ENABLE(i), 1);
-		OUT_RING  (0);
+		BEGIN_RING(chan, kelvin, NV20TCL_TX_ENABLE(i), 1);
+		OUT_RING  (chan, 0);
 	}
-	BEGIN_RING(kelvin, NV20TCL_TX_SHADER_OP, 1);
-	OUT_RING  (0);
-	BEGIN_RING(kelvin, NV20TCL_TX_SHADER_CULL_MODE, 1);
-	OUT_RING  (0);
-	BEGIN_RING(kelvin, NV20TCL_RC_IN_ALPHA(0), 4);
-	OUT_RING  (0x30d410d0);
-	OUT_RING  (0);
-	OUT_RING  (0);
-	OUT_RING  (0);
-	BEGIN_RING(kelvin, NV20TCL_RC_OUT_RGB(0), 4);
-	OUT_RING  (0x00000c00);
-	OUT_RING  (0);
-	OUT_RING  (0);
-	OUT_RING  (0);
-	BEGIN_RING(kelvin, NV20TCL_RC_ENABLE, 1);
-	OUT_RING  (0x00011101);
-	BEGIN_RING(kelvin, NV20TCL_RC_FINAL0, 2);
-	OUT_RING  (0x130e0300);
-	OUT_RING  (0x0c091c80);
-	BEGIN_RING(kelvin, NV20TCL_RC_OUT_ALPHA(0), 4);
-	OUT_RING  (0x00000c00);
-	OUT_RING  (0);
-	OUT_RING  (0);
-	OUT_RING  (0);
-	BEGIN_RING(kelvin, NV20TCL_RC_IN_RGB(0), 4);
-	OUT_RING  (0x20c400c0);
-	OUT_RING  (0);
-	OUT_RING  (0);
-	OUT_RING  (0);
-	BEGIN_RING(kelvin, NV20TCL_RC_COLOR0, 2);
-	OUT_RING  (0);
-	OUT_RING  (0);
-	BEGIN_RING(kelvin, NV20TCL_RC_CONSTANT_COLOR0(0), 4);
-	OUT_RING  (0x035125a0);
-	OUT_RING  (0);
-	OUT_RING  (0x40002000);
-	OUT_RING  (0);
-	BEGIN_RING(kelvin, NV20TCL_MULTISAMPLE_CONTROL, 1);
-	OUT_RING  (0xffff0000);
-
-	BEGIN_RING(kelvin, NV20TCL_BLEND_FUNC_ENABLE, 1);
-	OUT_RING  (0);
-	BEGIN_RING(kelvin, NV20TCL_DITHER_ENABLE, 1);
-	OUT_RING  (0);
-	BEGIN_RING(kelvin, NV20TCL_STENCIL_ENABLE, 1);
-	OUT_RING  (0);
-	BEGIN_RING(kelvin, NV20TCL_BLEND_FUNC_SRC, 4);
-	OUT_RING  (NV20TCL_BLEND_FUNC_SRC_ONE);
-	OUT_RING  (NV20TCL_BLEND_FUNC_DST_ZERO);
-	OUT_RING  (0);			/* NV20TCL_BLEND_COLOR */
-	OUT_RING  (NV20TCL_BLEND_EQUATION_FUNC_ADD);
-	BEGIN_RING(kelvin, NV20TCL_STENCIL_MASK, 7);
-	OUT_RING  (0xff);
-	OUT_RING  (NV20TCL_STENCIL_FUNC_FUNC_ALWAYS);
-	OUT_RING  (0);			/* NV20TCL_STENCIL_FUNC_REF */
-	OUT_RING  (0xff);		/* NV20TCL_STENCIL_FUNC_MASK */
-	OUT_RING  (NV20TCL_STENCIL_OP_FAIL_KEEP);
-	OUT_RING  (NV20TCL_STENCIL_OP_ZFAIL_KEEP);
-	OUT_RING  (NV20TCL_STENCIL_OP_ZPASS_KEEP);
-
-	BEGIN_RING(kelvin, NV20TCL_COLOR_LOGIC_OP_ENABLE, 2);
-	OUT_RING  (0);
-	OUT_RING  (NV20TCL_COLOR_LOGIC_OP_OP_COPY);
-	BEGIN_RING(kelvin, 0x17cc, 1);
-	OUT_RING  (0);
+	BEGIN_RING(chan, kelvin, NV20TCL_TX_SHADER_OP, 1);
+	OUT_RING  (chan, 0);
+	BEGIN_RING(chan, kelvin, NV20TCL_TX_SHADER_CULL_MODE, 1);
+	OUT_RING  (chan, 0);
+	BEGIN_RING(chan, kelvin, NV20TCL_RC_IN_ALPHA(0), 4);
+	OUT_RING  (chan, 0x30d410d0);
+	OUT_RING  (chan, 0);
+	OUT_RING  (chan, 0);
+	OUT_RING  (chan, 0);
+	BEGIN_RING(chan, kelvin, NV20TCL_RC_OUT_RGB(0), 4);
+	OUT_RING  (chan, 0x00000c00);
+	OUT_RING  (chan, 0);
+	OUT_RING  (chan, 0);
+	OUT_RING  (chan, 0);
+	BEGIN_RING(chan, kelvin, NV20TCL_RC_ENABLE, 1);
+	OUT_RING  (chan, 0x00011101);
+	BEGIN_RING(chan, kelvin, NV20TCL_RC_FINAL0, 2);
+	OUT_RING  (chan, 0x130e0300);
+	OUT_RING  (chan, 0x0c091c80);
+	BEGIN_RING(chan, kelvin, NV20TCL_RC_OUT_ALPHA(0), 4);
+	OUT_RING  (chan, 0x00000c00);
+	OUT_RING  (chan, 0);
+	OUT_RING  (chan, 0);
+	OUT_RING  (chan, 0);
+	BEGIN_RING(chan, kelvin, NV20TCL_RC_IN_RGB(0), 4);
+	OUT_RING  (chan, 0x20c400c0);
+	OUT_RING  (chan, 0);
+	OUT_RING  (chan, 0);
+	OUT_RING  (chan, 0);
+	BEGIN_RING(chan, kelvin, NV20TCL_RC_COLOR0, 2);
+	OUT_RING  (chan, 0);
+	OUT_RING  (chan, 0);
+	BEGIN_RING(chan, kelvin, NV20TCL_RC_CONSTANT_COLOR0(0), 4);
+	OUT_RING  (chan, 0x035125a0);
+	OUT_RING  (chan, 0);
+	OUT_RING  (chan, 0x40002000);
+	OUT_RING  (chan, 0);
+	BEGIN_RING(chan, kelvin, NV20TCL_MULTISAMPLE_CONTROL, 1);
+	OUT_RING  (chan, 0xffff0000);
+
+	BEGIN_RING(chan, kelvin, NV20TCL_BLEND_FUNC_ENABLE, 1);
+	OUT_RING  (chan, 0);
+	BEGIN_RING(chan, kelvin, NV20TCL_DITHER_ENABLE, 1);
+	OUT_RING  (chan, 0);
+	BEGIN_RING(chan, kelvin, NV20TCL_STENCIL_ENABLE, 1);
+	OUT_RING  (chan, 0);
+	BEGIN_RING(chan, kelvin, NV20TCL_BLEND_FUNC_SRC, 4);
+	OUT_RING  (chan, NV20TCL_BLEND_FUNC_SRC_ONE);
+	OUT_RING  (chan, NV20TCL_BLEND_FUNC_DST_ZERO);
+	OUT_RING  (chan, 0);			/* NV20TCL_BLEND_COLOR */
+	OUT_RING  (chan, NV20TCL_BLEND_EQUATION_FUNC_ADD);
+	BEGIN_RING(chan, kelvin, NV20TCL_STENCIL_MASK, 7);
+	OUT_RING  (chan, 0xff);
+	OUT_RING  (chan, NV20TCL_STENCIL_FUNC_FUNC_ALWAYS);
+	OUT_RING  (chan, 0);			/* NV20TCL_STENCIL_FUNC_REF */
+	OUT_RING  (chan, 0xff);		/* NV20TCL_STENCIL_FUNC_MASK */
+	OUT_RING  (chan, NV20TCL_STENCIL_OP_FAIL_KEEP);
+	OUT_RING  (chan, NV20TCL_STENCIL_OP_ZFAIL_KEEP);
+	OUT_RING  (chan, NV20TCL_STENCIL_OP_ZPASS_KEEP);
+
+	BEGIN_RING(chan, kelvin, NV20TCL_COLOR_LOGIC_OP_ENABLE, 2);
+	OUT_RING  (chan, 0);
+	OUT_RING  (chan, NV20TCL_COLOR_LOGIC_OP_OP_COPY);
+	BEGIN_RING(chan, kelvin, 0x17cc, 1);
+	OUT_RING  (chan, 0);
 	if (is_nv25tcl) {
-		BEGIN_RING(kelvin, 0x1d84, 1);
-		OUT_RING  (1);
+		BEGIN_RING(chan, kelvin, 0x1d84, 1);
+		OUT_RING  (chan, 1);
 	}
-	BEGIN_RING(kelvin, NV20TCL_LIGHTING_ENABLE, 1);
-	OUT_RING  (0);
-	BEGIN_RING(kelvin, NV20TCL_LIGHT_CONTROL, 1);
-	OUT_RING  (0x00020000);
-	BEGIN_RING(kelvin, NV20TCL_SEPARATE_SPECULAR_ENABLE, 1);
-	OUT_RING  (0);
-	BEGIN_RING(kelvin, NV20TCL_LIGHT_MODEL_TWO_SIDE_ENABLE, 1);
-	OUT_RING  (0);
-	BEGIN_RING(kelvin, NV20TCL_ENABLED_LIGHTS, 1);
-	OUT_RING  (0);
-	BEGIN_RING(kelvin, NV20TCL_NORMALIZE_ENABLE, 1);
-	OUT_RING  (0);
-	BEGIN_RING(kelvin, NV20TCL_POLYGON_STIPPLE_PATTERN(0),
+	BEGIN_RING(chan, kelvin, NV20TCL_LIGHTING_ENABLE, 1);
+	OUT_RING  (chan, 0);
+	BEGIN_RING(chan, kelvin, NV20TCL_LIGHT_CONTROL, 1);
+	OUT_RING  (chan, 0x00020000);
+	BEGIN_RING(chan, kelvin, NV20TCL_SEPARATE_SPECULAR_ENABLE, 1);
+	OUT_RING  (chan, 0);
+	BEGIN_RING(chan, kelvin, NV20TCL_LIGHT_MODEL_TWO_SIDE_ENABLE, 1);
+	OUT_RING  (chan, 0);
+	BEGIN_RING(chan, kelvin, NV20TCL_ENABLED_LIGHTS, 1);
+	OUT_RING  (chan, 0);
+	BEGIN_RING(chan, kelvin, NV20TCL_NORMALIZE_ENABLE, 1);
+	OUT_RING  (chan, 0);
+	BEGIN_RING(chan, kelvin, NV20TCL_POLYGON_STIPPLE_PATTERN(0),
 					NV20TCL_POLYGON_STIPPLE_PATTERN__SIZE);
 	for (i = 0; i < NV20TCL_POLYGON_STIPPLE_PATTERN__SIZE; ++i) {
-		OUT_RING(0xffffffff);
+		OUT_RING(chan, 0xffffffff);
 	}
 
-	BEGIN_RING(kelvin, NV20TCL_POLYGON_OFFSET_POINT_ENABLE, 3);
-	OUT_RING  (0);
-	OUT_RING  (0);		/* NV20TCL.POLYGON_OFFSET_LINE_ENABLE */
-	OUT_RING  (0);		/* NV20TCL.POLYGON_OFFSET_FILL_ENABLE */
-	BEGIN_RING(kelvin, NV20TCL_DEPTH_FUNC, 1);
-	OUT_RING  (NV20TCL_DEPTH_FUNC_LESS);
-	BEGIN_RING(kelvin, NV20TCL_DEPTH_WRITE_ENABLE, 1);
-	OUT_RING  (0);
-	BEGIN_RING(kelvin, NV20TCL_DEPTH_TEST_ENABLE, 1);
-	OUT_RING  (0);
-	BEGIN_RING(kelvin, NV20TCL_POLYGON_OFFSET_FACTOR, 2);
-	OUT_RINGf (0.0);
-	OUT_RINGf (0.0);	/* NV20TCL.POLYGON_OFFSET_UNITS */
-	BEGIN_RING(kelvin, NV20TCL_DEPTH_UNK17D8, 1);
-	OUT_RING  (1);
+	BEGIN_RING(chan, kelvin, NV20TCL_POLYGON_OFFSET_POINT_ENABLE, 3);
+	OUT_RING  (chan, 0);
+	OUT_RING  (chan, 0);		/* NV20TCL.POLYGON_OFFSET_LINE_ENABLE */
+	OUT_RING  (chan, 0);		/* NV20TCL.POLYGON_OFFSET_FILL_ENABLE */
+	BEGIN_RING(chan, kelvin, NV20TCL_DEPTH_FUNC, 1);
+	OUT_RING  (chan, NV20TCL_DEPTH_FUNC_LESS);
+	BEGIN_RING(chan, kelvin, NV20TCL_DEPTH_WRITE_ENABLE, 1);
+	OUT_RING  (chan, 0);
+	BEGIN_RING(chan, kelvin, NV20TCL_DEPTH_TEST_ENABLE, 1);
+	OUT_RING  (chan, 0);
+	BEGIN_RING(chan, kelvin, NV20TCL_POLYGON_OFFSET_FACTOR, 2);
+	OUT_RINGf (chan, 0.0);
+	OUT_RINGf (chan, 0.0);	/* NV20TCL.POLYGON_OFFSET_UNITS */
+	BEGIN_RING(chan, kelvin, NV20TCL_DEPTH_UNK17D8, 1);
+	OUT_RING  (chan, 1);
 	if (!is_nv25tcl) {
-		BEGIN_RING(kelvin, 0x1d84, 1);
-		OUT_RING  (3);
+		BEGIN_RING(chan, kelvin, 0x1d84, 1);
+		OUT_RING  (chan, 3);
 	}
-	BEGIN_RING(kelvin, NV20TCL_POINT_SIZE, 1);
+	BEGIN_RING(chan, kelvin, NV20TCL_POINT_SIZE, 1);
 	if (!is_nv25tcl) {
-		OUT_RING  (8);
+		OUT_RING  (chan, 8);
 	} else {
-		OUT_RINGf (1.0);
+		OUT_RINGf (chan, 1.0);
 	}
 	if (!is_nv25tcl) {
-		BEGIN_RING(kelvin, NV20TCL_POINT_PARAMETERS_ENABLE, 2);
-		OUT_RING  (0);
-		OUT_RING  (0);		/* NV20TCL.POINT_SMOOTH_ENABLE */
+		BEGIN_RING(chan, kelvin, NV20TCL_POINT_PARAMETERS_ENABLE, 2);
+		OUT_RING  (chan, 0);
+		OUT_RING  (chan, 0);		/* NV20TCL.POINT_SMOOTH_ENABLE */
 	} else {
-		BEGIN_RING(kelvin, NV20TCL_POINT_PARAMETERS_ENABLE, 1);
-		OUT_RING  (0);
-		BEGIN_RING(kelvin, 0x0a1c, 1);
-		OUT_RING  (0x800);
+		BEGIN_RING(chan, kelvin, NV20TCL_POINT_PARAMETERS_ENABLE, 1);
+		OUT_RING  (chan, 0);
+		BEGIN_RING(chan, kelvin, 0x0a1c, 1);
+		OUT_RING  (chan, 0x800);
 	}
-	BEGIN_RING(kelvin, NV20TCL_LINE_WIDTH, 1);
-	OUT_RING  (8);
-	BEGIN_RING(kelvin, NV20TCL_LINE_SMOOTH_ENABLE, 1);
-	OUT_RING  (0);
-	BEGIN_RING(kelvin, NV20TCL_POLYGON_MODE_FRONT, 2);
-	OUT_RING  (NV20TCL_POLYGON_MODE_FRONT_FILL);
-	OUT_RING  (NV20TCL_POLYGON_MODE_BACK_FILL);
-	BEGIN_RING(kelvin, NV20TCL_CULL_FACE, 2);
-	OUT_RING  (NV20TCL_CULL_FACE_BACK);
-	OUT_RING  (NV20TCL_FRONT_FACE_CCW);
-	BEGIN_RING(kelvin, NV20TCL_POLYGON_SMOOTH_ENABLE, 1);
-	OUT_RING  (0);
-	BEGIN_RING(kelvin, NV20TCL_CULL_FACE_ENABLE, 1);
-	OUT_RING  (0);
-	BEGIN_RING(kelvin, NV20TCL_SHADE_MODEL, 1);
-	OUT_RING  (NV20TCL_SHADE_MODEL_SMOOTH);
-	BEGIN_RING(kelvin, NV20TCL_POLYGON_STIPPLE_ENABLE, 1);
-	OUT_RING  (0);
-	BEGIN_RING(kelvin, NV20TCL_TX_GEN_S(0), 4 * NV20TCL_TX_GEN_S__SIZE);
+	BEGIN_RING(chan, kelvin, NV20TCL_LINE_WIDTH, 1);
+	OUT_RING  (chan, 8);
+	BEGIN_RING(chan, kelvin, NV20TCL_LINE_SMOOTH_ENABLE, 1);
+	OUT_RING  (chan, 0);
+	BEGIN_RING(chan, kelvin, NV20TCL_POLYGON_MODE_FRONT, 2);
+	OUT_RING  (chan, NV20TCL_POLYGON_MODE_FRONT_FILL);
+	OUT_RING  (chan, NV20TCL_POLYGON_MODE_BACK_FILL);
+	BEGIN_RING(chan, kelvin, NV20TCL_CULL_FACE, 2);
+	OUT_RING  (chan, NV20TCL_CULL_FACE_BACK);
+	OUT_RING  (chan, NV20TCL_FRONT_FACE_CCW);
+	BEGIN_RING(chan, kelvin, NV20TCL_POLYGON_SMOOTH_ENABLE, 1);
+	OUT_RING  (chan, 0);
+	BEGIN_RING(chan, kelvin, NV20TCL_CULL_FACE_ENABLE, 1);
+	OUT_RING  (chan, 0);
+	BEGIN_RING(chan, kelvin, NV20TCL_SHADE_MODEL, 1);
+	OUT_RING  (chan, NV20TCL_SHADE_MODEL_SMOOTH);
+	BEGIN_RING(chan, kelvin, NV20TCL_POLYGON_STIPPLE_ENABLE, 1);
+	OUT_RING  (chan, 0);
+	BEGIN_RING(chan, kelvin, NV20TCL_TX_GEN_S(0), 4 * NV20TCL_TX_GEN_S__SIZE);
 	for (i=0; i < 4 * NV20TCL_TX_GEN_S__SIZE; ++i) {
-		OUT_RING(0);
+		OUT_RING(chan, 0);
 	}
-	BEGIN_RING(kelvin, NV20TCL_FOG_EQUATION_CONSTANT, 3);
-	OUT_RINGf (1.5);
-	OUT_RINGf (-0.090168);		/* NV20TCL.FOG_EQUATION_LINEAR */
-	OUT_RINGf (0.0);		/* NV20TCL.FOG_EQUATION_QUADRATIC */
-	BEGIN_RING(kelvin, NV20TCL_FOG_MODE, 2);
-	OUT_RING  (NV20TCL_FOG_MODE_EXP_2);
-	OUT_RING  (NV20TCL_FOG_COORD_DIST_COORD_FOG);
-	BEGIN_RING(kelvin, NV20TCL_FOG_ENABLE, 2);
-	OUT_RING  (0);
-	OUT_RING  (0);			/* NV20TCL.FOG_COLOR */
-	BEGIN_RING(kelvin, NV20TCL_ENGINE, 1);
-	OUT_RING  (NV20TCL_ENGINE_FIXED);
+	BEGIN_RING(chan, kelvin, NV20TCL_FOG_EQUATION_CONSTANT, 3);
+	OUT_RINGf (chan, 1.5);
+	OUT_RINGf (chan, -0.090168);		/* NV20TCL.FOG_EQUATION_LINEAR */
+	OUT_RINGf (chan, 0.0);		/* NV20TCL.FOG_EQUATION_QUADRATIC */
+	BEGIN_RING(chan, kelvin, NV20TCL_FOG_MODE, 2);
+	OUT_RING  (chan, NV20TCL_FOG_MODE_EXP_2);
+	OUT_RING  (chan, NV20TCL_FOG_COORD_DIST_COORD_FOG);
+	BEGIN_RING(chan, kelvin, NV20TCL_FOG_ENABLE, 2);
+	OUT_RING  (chan, 0);
+	OUT_RING  (chan, 0);			/* NV20TCL.FOG_COLOR */
+	BEGIN_RING(chan, kelvin, NV20TCL_ENGINE, 1);
+	OUT_RING  (chan, NV20TCL_ENGINE_FIXED);
 
 	for (i = 0; i < NV20TCL_TX_MATRIX_ENABLE__SIZE; ++i) {
-		BEGIN_RING(kelvin, NV20TCL_TX_MATRIX_ENABLE(i), 1);
-		OUT_RING  (0);
+		BEGIN_RING(chan, kelvin, NV20TCL_TX_MATRIX_ENABLE(i), 1);
+		OUT_RING  (chan, 0);
 	}
 
-	BEGIN_RING(kelvin, NV20TCL_VTX_ATTR_4F_X(1), 4 * 15);
-	OUT_RINGf(1.0); OUT_RINGf(0.0); OUT_RINGf(0.0); OUT_RINGf(1.0);
-	OUT_RINGf(0.0); OUT_RINGf(0.0); OUT_RINGf(1.0); OUT_RINGf(1.0);
-	OUT_RINGf(1.0); OUT_RINGf(1.0); OUT_RINGf(1.0); OUT_RINGf(1.0);
+	BEGIN_RING(chan, kelvin, NV20TCL_VTX_ATTR_4F_X(1), 4 * 15);
+	OUT_RINGf(chan, 1.0); OUT_RINGf(chan, 0.0); OUT_RINGf(chan, 0.0); OUT_RINGf(chan, 1.0);
+	OUT_RINGf(chan, 0.0); OUT_RINGf(chan, 0.0); OUT_RINGf(chan, 1.0); OUT_RINGf(chan, 1.0);
+	OUT_RINGf(chan, 1.0); OUT_RINGf(chan, 1.0); OUT_RINGf(chan, 1.0); OUT_RINGf(chan, 1.0);
 	for (i = 4; i < 16; ++i) {
-		OUT_RINGf(0.0); OUT_RINGf(0.0); OUT_RINGf(0.0);	OUT_RINGf(1.0);
+		OUT_RINGf(chan, 0.0);
+		OUT_RINGf(chan, 0.0);
+		OUT_RINGf(chan, 0.0);
+		OUT_RINGf(chan, 1.0);
 	}
 
-	BEGIN_RING(kelvin, NV20TCL_EDGEFLAG_ENABLE, 1);
-	OUT_RING  (1);
-	BEGIN_RING(kelvin, NV20TCL_COLOR_MASK, 1);
-	OUT_RING (0x00010101);
-	BEGIN_RING(kelvin, NV20TCL_CLEAR_VALUE, 1);
-	OUT_RING (0);
+	BEGIN_RING(chan, kelvin, NV20TCL_EDGEFLAG_ENABLE, 1);
+	OUT_RING  (chan, 1);
+	BEGIN_RING(chan, kelvin, NV20TCL_COLOR_MASK, 1);
+	OUT_RING (chan, 0x00010101);
+	BEGIN_RING(chan, kelvin, NV20TCL_CLEAR_VALUE, 1);
+	OUT_RING (chan, 0);
 
 	memset(projectionmatrix, 0, sizeof(projectionmatrix));
 	projectionmatrix[0*4+0] = 1.0;
 	projectionmatrix[1*4+1] = 1.0;
 	projectionmatrix[2*4+2] = 16777215.0;
 	projectionmatrix[3*4+3] = 1.0;
-	BEGIN_RING(kelvin, NV20TCL_PROJECTION_MATRIX(0), 16);
+	BEGIN_RING(chan, kelvin, NV20TCL_PROJECTION_MATRIX(0), 16);
 	for (i = 0; i < 16; i++) {
-		OUT_RINGf  (projectionmatrix[i]);
+		OUT_RINGf  (chan, projectionmatrix[i]);
 	}
 
-	BEGIN_RING(kelvin, NV20TCL_DEPTH_RANGE_NEAR, 2);
-	OUT_RINGf (0.0);
-	OUT_RINGf (16777216.0); /* [0, 1] scaled approx to [0, 2^24] */
+	BEGIN_RING(chan, kelvin, NV20TCL_DEPTH_RANGE_NEAR, 2);
+	OUT_RINGf (chan, 0.0);
+	OUT_RINGf (chan, 16777216.0); /* [0, 1] scaled approx to [0, 2^24] */
 
-	BEGIN_RING(kelvin, NV20TCL_VIEWPORT_TRANSLATE_X, 4);
-	OUT_RINGf (0.0); /* x-offset, w/2 + 1.031250 */
-	OUT_RINGf (0.0); /* y-offset, h/2 + 0.030762 */
-	OUT_RINGf (0.0);
-	OUT_RINGf (16777215.0);
+	BEGIN_RING(chan, kelvin, NV20TCL_VIEWPORT_TRANSLATE_X, 4);
+	OUT_RINGf (chan, 0.0); /* x-offset, w/2 + 1.031250 */
+	OUT_RINGf (chan, 0.0); /* y-offset, h/2 + 0.030762 */
+	OUT_RINGf (chan, 0.0);
+	OUT_RINGf (chan, 16777215.0);
 
-	BEGIN_RING(kelvin, NV20TCL_VIEWPORT_SCALE_X, 4);
-	OUT_RINGf (0.0); /* no effect?, w/2 */
-	OUT_RINGf (0.0); /* no effect?, h/2 */
-	OUT_RINGf (16777215.0 * 0.5);
-	OUT_RINGf (65535.0);
+	BEGIN_RING(chan, kelvin, NV20TCL_VIEWPORT_SCALE_X, 4);
+	OUT_RINGf (chan, 0.0); /* no effect?, w/2 */
+	OUT_RINGf (chan, 0.0); /* no effect?, h/2 */
+	OUT_RINGf (chan, 16777215.0 * 0.5);
+	OUT_RINGf (chan, 65535.0);
 
-	FIRE_RING (NULL);
+	FIRE_RING (chan);
 }
 
 struct pipe_context *
diff --git a/src/gallium/drivers/nv20/nv20_context.h b/src/gallium/drivers/nv20/nv20_context.h
index a4eaa95..85df139 100644
--- a/src/gallium/drivers/nv20/nv20_context.h
+++ b/src/gallium/drivers/nv20/nv20_context.h
@@ -15,10 +15,6 @@
 #include "nouveau/nouveau_gldefs.h"
 #include "nouveau/nouveau_context.h"
 
-#define NOUVEAU_PUSH_CONTEXT(ctx)                                              \
-	struct nv20_screen *ctx = nv20->screen
-#include "nouveau/nouveau_push.h"
-
 #include "nv20_state.h"
 
 #define NOUVEAU_ERR(fmt, args...) \
diff --git a/src/gallium/drivers/nv20/nv20_fragtex.c b/src/gallium/drivers/nv20/nv20_fragtex.c
index 2db4a40..dedbec7 100644
--- a/src/gallium/drivers/nv20/nv20_fragtex.c
+++ b/src/gallium/drivers/nv20/nv20_fragtex.c
@@ -52,6 +52,9 @@ nv20_fragtex_build(struct nv20_context *nv20, int unit)
 	struct nv20_miptree *nv20mt = nv20->tex_miptree[unit];
 	struct pipe_texture *pt = &nv20mt->base;
 	struct nv20_texture_format *tf;
+	struct nv20_screen *screen = nv20->screen;
+	struct nouveau_channel *chan = screen->base.channel;
+	struct nouveau_grobj *kelvin = screen->kelvin;
 	uint32_t txf, txs, txp;
 
 	tf = nv20_fragtex_format(pt->format);
@@ -82,15 +85,15 @@ nv20_fragtex_build(struct nv20_context *nv20, int unit)
 		return;
 	}
 
-	BEGIN_RING(kelvin, NV10TCL_TX_OFFSET(unit), 8);
-	OUT_RELOCl(nv20mt->buffer, 0, NOUVEAU_BO_VRAM | NOUVEAU_BO_GART | NOUVEAU_BO_RD);
-	OUT_RELOCd(nv20mt->buffer,txf,NOUVEAU_BO_VRAM | NOUVEAU_BO_GART | NOUVEAU_BO_OR | NOUVEAU_BO_RD, 1/*VRAM*/,2/*TT*/);
-	OUT_RING  (ps->wrap);
-	OUT_RING  (0x40000000); /* enable */
-	OUT_RING  (txs);
-	OUT_RING  (ps->filt | 0x2000 /* magic */);
-	OUT_RING  ((pt->width0 << 16) | pt->height0);
-	OUT_RING  (ps->bcol);
+	BEGIN_RING(chan, kelvin, NV10TCL_TX_OFFSET(unit), 8);
+	OUT_RELOCl(chan, nouveau_bo(nv20mt->buffer), 0, NOUVEAU_BO_VRAM | NOUVEAU_BO_GART | NOUVEAU_BO_RD);
+	OUT_RELOCd(chan, nouveau_bo(nv20mt->buffer),txf,NOUVEAU_BO_VRAM | NOUVEAU_BO_GART | NOUVEAU_BO_OR | NOUVEAU_BO_RD, 1/*VRAM*/,2/*TT*/);
+	OUT_RING  (chan, ps->wrap);
+	OUT_RING  (chan, 0x40000000); /* enable */
+	OUT_RING  (chan, txs);
+	OUT_RING  (chan, ps->filt | 0x2000 /* magic */);
+	OUT_RING  (chan, (pt->width0 << 16) | pt->height0);
+	OUT_RING  (chan, ps->bcol);
 #endif
 }
 
@@ -99,6 +102,9 @@ nv20_fragtex_bind(struct nv20_context *nv20)
 {
 #if 0
 	struct nv20_fragment_program *fp = nv20->fragprog.active;
+	struct nv20_screen *screen = nv20->screen;
+	struct nouveau_channel *chan = screen->base.channel;
+	struct nouveau_grobj *kelvin = screen->kelvin;
 	unsigned samplers, unit;
 
 	samplers = nv20->fp_samplers & ~fp->samplers;
@@ -106,8 +112,8 @@ nv20_fragtex_bind(struct nv20_context *nv20)
 		unit = ffs(samplers) - 1;
 		samplers &= ~(1 << unit);
 
-		BEGIN_RING(kelvin, NV10TCL_TX_ENABLE(unit), 1);
-		OUT_RING  (0);
+		BEGIN_RING(chan, kelvin, NV10TCL_TX_ENABLE(unit), 1);
+		OUT_RING  (chan, 0);
 	}
 
 	samplers = nv20->dirty_samplers & fp->samplers;
diff --git a/src/gallium/drivers/nv20/nv20_prim_vbuf.c b/src/gallium/drivers/nv20/nv20_prim_vbuf.c
index ddfcdb8..2e14567 100644
--- a/src/gallium/drivers/nv20/nv20_prim_vbuf.c
+++ b/src/gallium/drivers/nv20/nv20_prim_vbuf.c
@@ -81,12 +81,15 @@ nv20_vbuf_render(struct vbuf_render *render)
 void nv20_vtxbuf_bind( struct nv20_context* nv20 )
 {
 #if 0
+	struct nv20_screen *screen = nv20->screen;
+	struct nouveau_channel *chan = screen->base.channel;
+	struct nouveau_grobj *kelvin = screen->kelvin;
 	int i;
 	for(i = 0; i < NV20TCL_VTXBUF_ADDRESS__SIZE; i++) {
-		BEGIN_RING(kelvin, NV20TCL_VTXBUF_ADDRESS(i), 1);
-		OUT_RING(0/*nv20->vtxbuf*/);
-		BEGIN_RING(kelvin, NV20TCL_VTXFMT(i) ,1);
-		OUT_RING(0/*XXX*/);
+		BEGIN_RING(chan, kelvin, NV20TCL_VTXBUF_ADDRESS(i), 1);
+		OUT_RING(chan, 0/*nv20->vtxbuf*/);
+		BEGIN_RING(chan, kelvin, NV20TCL_VTXFMT(i) ,1);
+		OUT_RING(chan, 0/*XXX*/);
 	}
 #endif
 }
@@ -202,6 +205,9 @@ nv20__vtxhwformat(unsigned stride, unsigned fields, unsigned type)
 static unsigned
 nv20__emit_format(struct nv20_context *nv20, enum attrib_emit type, int hwattr)
 {
+	struct nv20_screen *screen = nv20->screen;
+	struct nouveau_channel *chan = screen->base.channel;
+	struct nouveau_grobj *kelvin = screen->kelvin;
 	uint32_t hwfmt = 0;
 	unsigned fields;
 
@@ -231,8 +237,8 @@ nv20__emit_format(struct nv20_context *nv20, enum attrib_emit type, int hwattr)
 		return 0;
 	}
 
-	BEGIN_RING(kelvin, NV20TCL_VTXFMT(hwattr), 1);
-	OUT_RING(hwfmt);
+	BEGIN_RING(chan, kelvin, NV20TCL_VTXFMT(hwattr), 1);
+	OUT_RING(chan, hwfmt);
 	return fields;
 }
 
@@ -262,6 +268,9 @@ nv20__draw_mbuffer(struct nv20_vbuf_render *nv20_render,
 		uint nr_indices)
 {
 	struct nv20_context *nv20 = nv20_render->nv20;
+	struct nv20_screen *screen = nv20->screen;
+	struct nouveau_channel *chan = screen->base.channel;
+	struct nouveau_grobj *kelvin = screen->kelvin;
 	struct vertex_info *vinfo = &nv20->vertex_info;
 	unsigned nr_fields;
 	int max_push;
@@ -270,29 +279,29 @@ nv20__draw_mbuffer(struct nv20_vbuf_render *nv20_render,
 
 	nr_fields = nv20__emit_vertex_array_format(nv20);
 
-	BEGIN_RING(kelvin, NV20TCL_VERTEX_BEGIN_END, 1);
-	OUT_RING(nv20_render->hwprim);
+	BEGIN_RING(chan, kelvin, NV20TCL_VERTEX_BEGIN_END, 1);
+	OUT_RING(chan, nv20_render->hwprim);
 
 	max_push = 1200 / nr_fields;
 	while (nr_indices) {
 		int i;
 		int push = MIN2(nr_indices, max_push);
 
-		BEGIN_RING_NI(kelvin, NV20TCL_VERTEX_DATA, push * nr_fields);
+		BEGIN_RING_NI(chan, kelvin, NV20TCL_VERTEX_DATA, push * nr_fields);
 		for (i = 0; i < push; i++) {
 			/* XXX: fixme to handle other than floats? */
 			int f = nr_fields;
 			float *attrv = (float*)&data[indices[i] * vsz];
 			while (f-- > 0)
-				OUT_RINGf(*attrv++);
+				OUT_RINGf(chan, *attrv++);
 		}
 
 		nr_indices -= push;
 		indices += push;
 	}
 
-	BEGIN_RING(kelvin, NV20TCL_VERTEX_BEGIN_END, 1);
-	OUT_RING(NV20TCL_VERTEX_BEGIN_END_STOP);
+	BEGIN_RING(chan, kelvin, NV20TCL_VERTEX_BEGIN_END, 1);
+	OUT_RING(chan, NV20TCL_VERTEX_BEGIN_END_STOP);
 }
 
 static void
@@ -301,20 +310,23 @@ nv20__draw_pbuffer(struct nv20_vbuf_render *nv20_render,
 		uint nr_indices)
 {
 	struct nv20_context *nv20 = nv20_render->nv20;
+	struct nv20_screen *screen = nv20->screen;
+	struct nouveau_channel *chan = screen->base.channel;
+	struct nouveau_grobj *kelvin = screen->kelvin;
 	int push, i;
 
 	NOUVEAU_ERR("nv20__draw_pbuffer: this path is broken.\n");
 
-	BEGIN_RING(kelvin, NV10TCL_VERTEX_ARRAY_OFFSET_POS, 1);
-	OUT_RELOCl(nv20_render->pbuffer, 0,
+	BEGIN_RING(chan, kelvin, NV10TCL_VERTEX_ARRAY_OFFSET_POS, 1);
+	OUT_RELOCl(chan, nouveau_bo(nv20_render->pbuffer), 0,
 			NOUVEAU_BO_VRAM | NOUVEAU_BO_GART | NOUVEAU_BO_RD);
 
-	BEGIN_RING(kelvin, NV10TCL_VERTEX_BUFFER_BEGIN_END, 1);
-	OUT_RING(nv20_render->hwprim);
+	BEGIN_RING(chan, kelvin, NV10TCL_VERTEX_BUFFER_BEGIN_END, 1);
+	OUT_RING(chan, nv20_render->hwprim);
 
 	if (nr_indices & 1) {
-		BEGIN_RING(kelvin, NV10TCL_VB_ELEMENT_U32, 1);
-		OUT_RING  (indices[0]);
+		BEGIN_RING(chan, kelvin, NV10TCL_VB_ELEMENT_U32, 1);
+		OUT_RING  (chan, indices[0]);
 		indices++; nr_indices--;
 	}
 
@@ -322,16 +334,16 @@ nv20__draw_pbuffer(struct nv20_vbuf_render *nv20_render,
 		// XXX too big/small ? check the size
 		push = MIN2(nr_indices, 1200 * 2);
 
-		BEGIN_RING_NI(kelvin, NV10TCL_VB_ELEMENT_U16, push >> 1);
+		BEGIN_RING_NI(chan, kelvin, NV10TCL_VB_ELEMENT_U16, push >> 1);
 		for (i = 0; i < push; i+=2)
-			OUT_RING((indices[i+1] << 16) | indices[i]);
+			OUT_RING(chan, (indices[i+1] << 16) | indices[i]);
 
 		nr_indices -= push;
 		indices  += push;
 	}
 
-	BEGIN_RING(kelvin, NV10TCL_VERTEX_BUFFER_BEGIN_END, 1);
-	OUT_RING  (0);
+	BEGIN_RING(chan, kelvin, NV10TCL_VERTEX_BUFFER_BEGIN_END, 1);
+	OUT_RING  (chan, 0);
 }
 
 static void
diff --git a/src/gallium/drivers/nv20/nv20_state_emit.c b/src/gallium/drivers/nv20/nv20_state_emit.c
index 63cba1f..6bbd1fd 100644
--- a/src/gallium/drivers/nv20/nv20_state_emit.c
+++ b/src/gallium/drivers/nv20/nv20_state_emit.c
@@ -5,27 +5,34 @@
 static void nv20_state_emit_blend(struct nv20_context* nv20)
 {
 	struct nv20_blend_state *b = nv20->blend;
+	struct nv20_screen *screen = nv20->screen;
+	struct nouveau_channel *chan = screen->base.channel;
+	struct nouveau_grobj *kelvin = screen->kelvin;
 
-	BEGIN_RING(kelvin, NV20TCL_DITHER_ENABLE, 1);
-	OUT_RING  (b->d_enable);
+	BEGIN_RING(chan, kelvin, NV20TCL_DITHER_ENABLE, 1);
+	OUT_RING  (chan, b->d_enable);
 
-	BEGIN_RING(kelvin, NV20TCL_BLEND_FUNC_ENABLE, 1);
-	OUT_RING  (b->b_enable);
+	BEGIN_RING(chan, kelvin, NV20TCL_BLEND_FUNC_ENABLE, 1);
+	OUT_RING  (chan, b->b_enable);
 
-	BEGIN_RING(kelvin, NV20TCL_BLEND_FUNC_SRC, 2);
-	OUT_RING  (b->b_srcfunc);
-	OUT_RING  (b->b_dstfunc);
+	BEGIN_RING(chan, kelvin, NV20TCL_BLEND_FUNC_SRC, 2);
+	OUT_RING  (chan, b->b_srcfunc);
+	OUT_RING  (chan, b->b_dstfunc);
 
-	BEGIN_RING(kelvin, NV20TCL_COLOR_MASK, 1);
-	OUT_RING  (b->c_mask);
+	BEGIN_RING(chan, kelvin, NV20TCL_COLOR_MASK, 1);
+	OUT_RING  (chan, b->c_mask);
 }
 
 static void nv20_state_emit_blend_color(struct nv20_context* nv20)
 {
 	struct pipe_blend_color *c = nv20->blend_color;
+	struct nv20_screen *screen = nv20->screen;
+	struct nouveau_channel *chan = screen->base.channel;
+	struct nouveau_grobj *kelvin = screen->kelvin;
 
-	BEGIN_RING(kelvin, NV20TCL_BLEND_COLOR, 1);
-	OUT_RING  ((float_to_ubyte(c->color[3]) << 24)|
+	BEGIN_RING(chan, kelvin, NV20TCL_BLEND_COLOR, 1);
+	OUT_RING  (chan,
+		   (float_to_ubyte(c->color[3]) << 24)|
 		   (float_to_ubyte(c->color[0]) << 16)|
 		   (float_to_ubyte(c->color[1]) << 8) |
 		   (float_to_ubyte(c->color[2]) << 0));
@@ -34,63 +41,69 @@ static void nv20_state_emit_blend_color(struct nv20_context* nv20)
 static void nv20_state_emit_rast(struct nv20_context* nv20)
 {
 	struct nv20_rasterizer_state *r = nv20->rast;
+	struct nv20_screen *screen = nv20->screen;
+	struct nouveau_channel *chan = screen->base.channel;
+	struct nouveau_grobj *kelvin = screen->kelvin;
 
-	BEGIN_RING(kelvin, NV20TCL_SHADE_MODEL, 2);
-	OUT_RING  (r->shade_model);
-	OUT_RING  (r->line_width);
+	BEGIN_RING(chan, kelvin, NV20TCL_SHADE_MODEL, 2);
+	OUT_RING  (chan, r->shade_model);
+	OUT_RING  (chan, r->line_width);
 
 
-	BEGIN_RING(kelvin, NV20TCL_POINT_SIZE, 1);
-	OUT_RING  (r->point_size);
+	BEGIN_RING(chan, kelvin, NV20TCL_POINT_SIZE, 1);
+	OUT_RING  (chan, r->point_size);
 
-	BEGIN_RING(kelvin, NV20TCL_POLYGON_MODE_FRONT, 2);
-	OUT_RING  (r->poly_mode_front);
-	OUT_RING  (r->poly_mode_back);
+	BEGIN_RING(chan, kelvin, NV20TCL_POLYGON_MODE_FRONT, 2);
+	OUT_RING  (chan, r->poly_mode_front);
+	OUT_RING  (chan, r->poly_mode_back);
 
 
-	BEGIN_RING(kelvin, NV20TCL_CULL_FACE, 2);
-	OUT_RING  (r->cull_face);
-	OUT_RING  (r->front_face);
+	BEGIN_RING(chan, kelvin, NV20TCL_CULL_FACE, 2);
+	OUT_RING  (chan, r->cull_face);
+	OUT_RING  (chan, r->front_face);
 
-	BEGIN_RING(kelvin, NV20TCL_LINE_SMOOTH_ENABLE, 2);
-	OUT_RING  (r->line_smooth_en);
-	OUT_RING  (r->poly_smooth_en);
+	BEGIN_RING(chan, kelvin, NV20TCL_LINE_SMOOTH_ENABLE, 2);
+	OUT_RING  (chan, r->line_smooth_en);
+	OUT_RING  (chan, r->poly_smooth_en);
 
-	BEGIN_RING(kelvin, NV20TCL_CULL_FACE_ENABLE, 1);
-	OUT_RING  (r->cull_face_en);
+	BEGIN_RING(chan, kelvin, NV20TCL_CULL_FACE_ENABLE, 1);
+	OUT_RING  (chan, r->cull_face_en);
 }
 
 static void nv20_state_emit_dsa(struct nv20_context* nv20)
 {
 	struct nv20_depth_stencil_alpha_state *d = nv20->dsa;
+	struct nv20_screen *screen = nv20->screen;
+	struct nouveau_channel *chan = screen->base.channel;
+	struct nouveau_grobj *kelvin = screen->kelvin;
 
-	BEGIN_RING(kelvin, NV20TCL_DEPTH_FUNC, 1);
-	OUT_RING (d->depth.func);
+	BEGIN_RING(chan, kelvin, NV20TCL_DEPTH_FUNC, 1);
+	OUT_RING (chan, d->depth.func);
 
-	BEGIN_RING(kelvin, NV20TCL_DEPTH_WRITE_ENABLE, 1);
-	OUT_RING (d->depth.write_enable);
+	BEGIN_RING(chan, kelvin, NV20TCL_DEPTH_WRITE_ENABLE, 1);
+	OUT_RING (chan, d->depth.write_enable);
 
-	BEGIN_RING(kelvin, NV20TCL_DEPTH_TEST_ENABLE, 1);
-	OUT_RING (d->depth.test_enable);
+	BEGIN_RING(chan, kelvin, NV20TCL_DEPTH_TEST_ENABLE, 1);
+	OUT_RING (chan, d->depth.test_enable);
 
-	BEGIN_RING(kelvin, NV20TCL_DEPTH_UNK17D8, 1);
-	OUT_RING (1);
+	BEGIN_RING(chan, kelvin, NV20TCL_DEPTH_UNK17D8, 1);
+	OUT_RING (chan, 1);
 
 #if 0
-	BEGIN_RING(kelvin, NV20TCL_STENCIL_ENABLE, 1);
-	OUT_RING (d->stencil.enable);
-	BEGIN_RING(kelvin, NV20TCL_STENCIL_MASK, 7);
-	OUT_RINGp ((uint32_t *)&(d->stencil.wmask), 7);
+	BEGIN_RING(chan, kelvin, NV20TCL_STENCIL_ENABLE, 1);
+	OUT_RING (chan, d->stencil.enable);
+	BEGIN_RING(chan, kelvin, NV20TCL_STENCIL_MASK, 7);
+	OUT_RINGp (chan, (uint32_t *)&(d->stencil.wmask), 7);
 #endif
 
-	BEGIN_RING(kelvin, NV20TCL_ALPHA_FUNC_ENABLE, 1);
-	OUT_RING (d->alpha.enabled);
+	BEGIN_RING(chan, kelvin, NV20TCL_ALPHA_FUNC_ENABLE, 1);
+	OUT_RING (chan, d->alpha.enabled);
 
-	BEGIN_RING(kelvin, NV20TCL_ALPHA_FUNC_FUNC, 1);
-	OUT_RING (d->alpha.func);
+	BEGIN_RING(chan, kelvin, NV20TCL_ALPHA_FUNC_FUNC, 1);
+	OUT_RING (chan, d->alpha.func);
 
-	BEGIN_RING(kelvin, NV20TCL_ALPHA_FUNC_REF, 1);
-	OUT_RING (d->alpha.ref);
+	BEGIN_RING(chan, kelvin, NV20TCL_ALPHA_FUNC_REF, 1);
+	OUT_RING (chan, d->alpha.ref);
 }
 
 static void nv20_state_emit_viewport(struct nv20_context* nv20)
@@ -101,9 +114,13 @@ static void nv20_state_emit_scissor(struct nv20_context* nv20)
 {
 	/* NV20TCL_SCISSOR_* is probably a software method */
 /*	struct pipe_scissor_state *s = nv20->scissor;
-	BEGIN_RING(kelvin, NV20TCL_SCISSOR_HORIZ, 2);
-	OUT_RING  (((s->maxx - s->minx) << 16) | s->minx);
-	OUT_RING  (((s->maxy - s->miny) << 16) | s->miny);*/
+	struct nv20_screen *screen = nv20->screen;
+	struct nouveau_channel *chan = screen->base.channel;
+	struct nouveau_grobj *kelvin = screen->kelvin;
+
+	BEGIN_RING(chan, kelvin, NV20TCL_SCISSOR_HORIZ, 2);
+	OUT_RING  (chan, ((s->maxx - s->minx) << 16) | s->minx);
+	OUT_RING  (chan, ((s->maxy - s->miny) << 16) | s->miny);*/
 }
 
 static void nv20_state_emit_framebuffer(struct nv20_context* nv20)
@@ -113,6 +130,9 @@ static void nv20_state_emit_framebuffer(struct nv20_context* nv20)
 	uint32_t rt_format, w, h;
 	int colour_format = 0, zeta_format = 0;
 	struct nv20_miptree *nv20mt = 0;
+	struct nv20_screen *screen = nv20->screen;
+	struct nouveau_channel *chan = screen->base.channel;
+	struct nouveau_grobj *kelvin = screen->kelvin;
 
 	w = fb->cbufs[0]->width;
 	h = fb->cbufs[0]->height;
@@ -150,11 +170,11 @@ static void nv20_state_emit_framebuffer(struct nv20_context* nv20)
 	}
 
 	if (zeta) {
-		BEGIN_RING(kelvin, NV20TCL_RT_PITCH, 1);
-		OUT_RING  (rt->pitch | (zeta->pitch << 16));
+		BEGIN_RING(chan, kelvin, NV20TCL_RT_PITCH, 1);
+		OUT_RING  (chan, rt->pitch | (zeta->pitch << 16));
 	} else {
-		BEGIN_RING(kelvin, NV20TCL_RT_PITCH, 1);
-		OUT_RING  (rt->pitch | (rt->pitch << 16));
+		BEGIN_RING(chan, kelvin, NV20TCL_RT_PITCH, 1);
+		OUT_RING  (chan, rt->pitch | (rt->pitch << 16));
 	}
 
 	nv20mt = (struct nv20_miptree *)rt->base.texture;
@@ -166,13 +186,13 @@ static void nv20_state_emit_framebuffer(struct nv20_context* nv20)
 		nv20->zeta = nv20mt->buffer;
 	}
 
-	BEGIN_RING(kelvin, NV20TCL_RT_HORIZ, 3);
-	OUT_RING  ((w << 16) | 0);
-	OUT_RING  ((h << 16) | 0); /*NV20TCL_RT_VERT */
-	OUT_RING  (rt_format); /* NV20TCL_RT_FORMAT */
-	BEGIN_RING(kelvin, NV20TCL_VIEWPORT_CLIP_HORIZ(0), 2);
-	OUT_RING  (((w - 1) << 16) | 0);
-	OUT_RING  (((h - 1) << 16) | 0);
+	BEGIN_RING(chan, kelvin, NV20TCL_RT_HORIZ, 3);
+	OUT_RING  (chan, (w << 16) | 0);
+	OUT_RING  (chan, (h << 16) | 0); /*NV20TCL_RT_VERT */
+	OUT_RING  (chan, rt_format); /* NV20TCL_RT_FORMAT */
+	BEGIN_RING(chan, kelvin, NV20TCL_VIEWPORT_CLIP_HORIZ(0), 2);
+	OUT_RING  (chan, ((w - 1) << 16) | 0);
+	OUT_RING  (chan, ((h - 1) << 16) | 0);
 }
 
 static void nv20_vertex_layout(struct nv20_context *nv20)
@@ -293,6 +313,10 @@ static void nv20_vertex_layout(struct nv20_context *nv20)
 void
 nv20_emit_hw_state(struct nv20_context *nv20)
 {
+	struct nv20_screen *screen = nv20->screen;
+	struct nouveau_channel *chan = screen->base.channel;
+	struct nouveau_grobj *kelvin = screen->kelvin;
+	struct nouveau_bo *rt_bo;
 	int i;
 
 	if (nv20->dirty & NV20_NEW_VERTPROG) {
@@ -361,36 +385,39 @@ nv20_emit_hw_state(struct nv20_context *nv20)
 	 */
 
 	/* Render target */
-	BEGIN_RING(kelvin, NV20TCL_DMA_COLOR, 1);
-	OUT_RELOCo(nv20->rt[0], NOUVEAU_BO_VRAM | NOUVEAU_BO_WR);
-	BEGIN_RING(kelvin, NV20TCL_COLOR_OFFSET, 1);
-	OUT_RELOCl(nv20->rt[0], 0, NOUVEAU_BO_VRAM | NOUVEAU_BO_WR);
+	rt_bo = nouveau_bo(nv20->rt[0]);
+	BEGIN_RING(chan, kelvin, NV20TCL_DMA_COLOR, 1);
+	OUT_RELOCo(chan, rt_bo, NOUVEAU_BO_VRAM | NOUVEAU_BO_WR);
+	BEGIN_RING(chan, kelvin, NV20TCL_COLOR_OFFSET, 1);
+	OUT_RELOCl(chan, rt_bo, 0, NOUVEAU_BO_VRAM | NOUVEAU_BO_WR);
 
 	if (nv20->zeta) {
-		BEGIN_RING(kelvin, NV20TCL_DMA_ZETA, 1);
-		OUT_RELOCo(nv20->zeta, NOUVEAU_BO_VRAM | NOUVEAU_BO_WR);
-		BEGIN_RING(kelvin, NV20TCL_ZETA_OFFSET, 1);
-		OUT_RELOCl(nv20->zeta, 0, NOUVEAU_BO_VRAM | NOUVEAU_BO_WR);
+		struct nouveau_bo *zeta_bo = nouveau_bo(nv20->zeta);
+		BEGIN_RING(chan, kelvin, NV20TCL_DMA_ZETA, 1);
+		OUT_RELOCo(chan, zeta_bo, NOUVEAU_BO_VRAM | NOUVEAU_BO_WR);
+		BEGIN_RING(chan, kelvin, NV20TCL_ZETA_OFFSET, 1);
+		OUT_RELOCl(chan, zeta_bo, 0, NOUVEAU_BO_VRAM | NOUVEAU_BO_WR);
 		/* XXX for when we allocate LMA on nv17 */
-/*		BEGIN_RING(kelvin, NV10TCL_LMA_DEPTH_BUFFER_OFFSET, 1);
-		OUT_RELOCl(nv20->zeta + lma_offset);*/
+/*		BEGIN_RING(chan, kelvin, NV10TCL_LMA_DEPTH_BUFFER_OFFSET, 1);
+		OUT_RELOCl(chan, nouveau_bo(nv20->zeta + lma_offset));*/
 	}
 
 	/* Vertex buffer */
-	BEGIN_RING(kelvin, NV20TCL_DMA_VTXBUF0, 1);
-	OUT_RELOCo(nv20->rt[0], NOUVEAU_BO_VRAM | NOUVEAU_BO_WR);
-	BEGIN_RING(kelvin, NV20TCL_COLOR_OFFSET, 1);
-	OUT_RELOCl(nv20->rt[0], 0, NOUVEAU_BO_VRAM | NOUVEAU_BO_WR);
+	BEGIN_RING(chan, kelvin, NV20TCL_DMA_VTXBUF0, 1);
+	OUT_RELOCo(chan, rt_bo, NOUVEAU_BO_VRAM | NOUVEAU_BO_WR);
+	BEGIN_RING(chan, kelvin, NV20TCL_COLOR_OFFSET, 1);
+	OUT_RELOCl(chan, rt_bo, 0, NOUVEAU_BO_VRAM | NOUVEAU_BO_WR);
 
 	/* Texture images */
 	for (i = 0; i < 2; i++) {
 		if (!(nv20->fp_samplers & (1 << i)))
 			continue;
-		BEGIN_RING(kelvin, NV20TCL_TX_OFFSET(i), 1);
-		OUT_RELOCl(nv20->tex[i].buffer, 0, NOUVEAU_BO_VRAM |
+		struct nouveau_bo *bo = nouveau_bo(nv20->tex[i].buffer);
+		BEGIN_RING(chan, kelvin, NV20TCL_TX_OFFSET(i), 1);
+		OUT_RELOCl(chan, bo, 0, NOUVEAU_BO_VRAM |
 			   NOUVEAU_BO_GART | NOUVEAU_BO_RD);
-		BEGIN_RING(kelvin, NV20TCL_TX_FORMAT(i), 1);
-		OUT_RELOCd(nv20->tex[i].buffer, nv20->tex[i].format,
+		BEGIN_RING(chan, kelvin, NV20TCL_TX_FORMAT(i), 1);
+		OUT_RELOCd(chan, bo, nv20->tex[i].format,
 			   NOUVEAU_BO_VRAM | NOUVEAU_BO_GART | NOUVEAU_BO_RD |
 			   NOUVEAU_BO_OR, NV20TCL_TX_FORMAT_DMA0,
 			   NV20TCL_TX_FORMAT_DMA1);
diff --git a/src/gallium/drivers/nv30/nv30_context.c b/src/gallium/drivers/nv30/nv30_context.c
index 38b3915..54572e9 100644
--- a/src/gallium/drivers/nv30/nv30_context.c
+++ b/src/gallium/drivers/nv30/nv30_context.c
@@ -10,15 +10,20 @@ nv30_flush(struct pipe_context *pipe, unsigned flags,
 	   struct pipe_fence_handle **fence)
 {
 	struct nv30_context *nv30 = nv30_context(pipe);
+	struct nv30_screen *screen = nv30->screen;
+	struct nouveau_channel *chan = screen->base.channel;
+	struct nouveau_grobj *rankine = screen->rankine;
 
 	if (flags & PIPE_FLUSH_TEXTURE_CACHE) {
-		BEGIN_RING(rankine, 0x1fd8, 1);
-		OUT_RING  (2);
-		BEGIN_RING(rankine, 0x1fd8, 1);
-		OUT_RING  (1);
+		BEGIN_RING(chan, rankine, 0x1fd8, 1);
+		OUT_RING  (chan, 2);
+		BEGIN_RING(chan, rankine, 0x1fd8, 1);
+		OUT_RING  (chan, 1);
 	}
 
-	FIRE_RING(fence);
+	FIRE_RING(chan);
+	if (fence)
+		*fence = NULL;
 }
 
 static void
diff --git a/src/gallium/drivers/nv30/nv30_context.h b/src/gallium/drivers/nv30/nv30_context.h
index 864ddae..5ccf3e4 100644
--- a/src/gallium/drivers/nv30/nv30_context.h
+++ b/src/gallium/drivers/nv30/nv30_context.h
@@ -14,10 +14,6 @@
 #include "nouveau/nouveau_winsys.h"
 #include "nouveau/nouveau_gldefs.h"
 #include "nouveau/nouveau_context.h"
-
-#define NOUVEAU_PUSH_CONTEXT(ctx)                                              \
-	struct nv30_screen *ctx = nv30->screen
-#include "nouveau/nouveau_push.h"
 #include "nouveau/nouveau_stateobj.h"
 
 #include "nv30_state.h"
diff --git a/src/gallium/drivers/nv30/nv30_query.c b/src/gallium/drivers/nv30/nv30_query.c
index 1d1c8a4..e27e9cc 100644
--- a/src/gallium/drivers/nv30/nv30_query.c
+++ b/src/gallium/drivers/nv30/nv30_query.c
@@ -41,6 +41,9 @@ nv30_query_begin(struct pipe_context *pipe, struct pipe_query *pq)
 {
 	struct nv30_context *nv30 = nv30_context(pipe);
 	struct nv30_query *q = nv30_query(pq);
+	struct nv30_screen *screen = nv30->screen;
+	struct nouveau_channel *chan = screen->base.channel;
+	struct nouveau_grobj *rankine = screen->rankine;
 
 	assert(q->type == PIPE_QUERY_OCCLUSION_COUNTER);
 
@@ -57,10 +60,10 @@ nv30_query_begin(struct pipe_context *pipe, struct pipe_query *pq)
 		assert(0);
 	nouveau_notifier_reset(nv30->screen->query, q->object->start);
 
-	BEGIN_RING(rankine, NV34TCL_QUERY_RESET, 1);
-	OUT_RING  (1);
-	BEGIN_RING(rankine, NV34TCL_QUERY_UNK17CC, 1);
-	OUT_RING  (1);
+	BEGIN_RING(chan, rankine, NV34TCL_QUERY_RESET, 1);
+	OUT_RING  (chan, 1);
+	BEGIN_RING(chan, rankine, NV34TCL_QUERY_UNK17CC, 1);
+	OUT_RING  (chan, 1);
 
 	q->ready = FALSE;
 }
@@ -69,12 +72,15 @@ static void
 nv30_query_end(struct pipe_context *pipe, struct pipe_query *pq)
 {
 	struct nv30_context *nv30 = nv30_context(pipe);
+	struct nv30_screen *screen = nv30->screen;
+	struct nouveau_channel *chan = screen->base.channel;
+	struct nouveau_grobj *rankine = screen->rankine;
 	struct nv30_query *q = nv30_query(pq);
 
-	BEGIN_RING(rankine, NV34TCL_QUERY_GET, 1);
-	OUT_RING  ((0x01 << NV34TCL_QUERY_GET_UNK24_SHIFT) |
+	BEGIN_RING(chan, rankine, NV34TCL_QUERY_GET, 1);
+	OUT_RING  (chan, (0x01 << NV34TCL_QUERY_GET_UNK24_SHIFT) |
 		   ((q->object->start * 32) << NV34TCL_QUERY_GET_OFFSET_SHIFT));
-	FIRE_RING(NULL);
+	FIRE_RING(chan);
 }
 
 static boolean
diff --git a/src/gallium/drivers/nv30/nv30_vbo.c b/src/gallium/drivers/nv30/nv30_vbo.c
index e32b814..242a2b0 100644
--- a/src/gallium/drivers/nv30/nv30_vbo.c
+++ b/src/gallium/drivers/nv30/nv30_vbo.c
@@ -168,7 +168,9 @@ nv30_draw_arrays(struct pipe_context *pipe,
 		 unsigned mode, unsigned start, unsigned count)
 {
 	struct nv30_context *nv30 = nv30_context(pipe);
-	struct nouveau_channel *chan = nv30->screen->base.channel;
+	struct nv30_screen *screen = nv30->screen;
+	struct nouveau_channel *chan = screen->base.channel;
+	struct nouveau_grobj *rankine = screen->rankine;
 	unsigned restart = 0;
 
 	nv30_vbo_set_idxbuf(nv30, NULL, 0);
@@ -186,17 +188,17 @@ nv30_draw_arrays(struct pipe_context *pipe,
 		vc = nouveau_vbuf_split(chan->pushbuf->remaining, 6, 256,
 					mode, start, count, &restart);
 		if (!vc) {
-			FIRE_RING(NULL);
+			FIRE_RING(chan);
 			continue;
 		}
 
-		BEGIN_RING(rankine, NV34TCL_VERTEX_BEGIN_END, 1);
-		OUT_RING  (nvgl_primitive(mode));
+		BEGIN_RING(chan, rankine, NV34TCL_VERTEX_BEGIN_END, 1);
+		OUT_RING  (chan, nvgl_primitive(mode));
 
 		nr = (vc & 0xff);
 		if (nr) {
-			BEGIN_RING(rankine, NV34TCL_VB_VERTEX_BATCH, 1);
-			OUT_RING  (((nr - 1) << 24) | start);
+			BEGIN_RING(chan, rankine, NV34TCL_VB_VERTEX_BATCH, 1);
+			OUT_RING  (chan, ((nr - 1) << 24) | start);
 			start += nr;
 		}
 
@@ -206,15 +208,15 @@ nv30_draw_arrays(struct pipe_context *pipe,
 
 			nr -= push;
 
-			BEGIN_RING_NI(rankine, NV34TCL_VB_VERTEX_BATCH, push);
+			BEGIN_RING_NI(chan, rankine, NV34TCL_VB_VERTEX_BATCH, push);
 			while (push--) {
-				OUT_RING(((0x100 - 1) << 24) | start);
+				OUT_RING(chan, ((0x100 - 1) << 24) | start);
 				start += 0x100;
 			}
 		}
 
-		BEGIN_RING(rankine, NV34TCL_VERTEX_BEGIN_END, 1);
-		OUT_RING  (0);
+		BEGIN_RING(chan, rankine, NV34TCL_VERTEX_BEGIN_END, 1);
+		OUT_RING  (chan, 0);
 
 		count -= vc;
 		start = restart;
@@ -228,7 +230,9 @@ static INLINE void
 nv30_draw_elements_u08(struct nv30_context *nv30, void *ib,
 		       unsigned mode, unsigned start, unsigned count)
 {
-	struct nouveau_channel *chan = nv30->screen->base.channel;
+	struct nv30_screen *screen = nv30->screen;
+	struct nouveau_channel *chan = screen->base.channel;
+	struct nouveau_grobj *rankine = screen->rankine;
 
 	while (count) {
 		uint8_t *elts = (uint8_t *)ib + start;
@@ -239,17 +243,17 @@ nv30_draw_elements_u08(struct nv30_context *nv30, void *ib,
 		vc = nouveau_vbuf_split(chan->pushbuf->remaining, 6, 2,
 					mode, start, count, &restart);
 		if (vc == 0) {
-			FIRE_RING(NULL);
+			FIRE_RING(chan);
 			continue;
 		}
 		count -= vc;
 
-		BEGIN_RING(rankine, NV34TCL_VERTEX_BEGIN_END, 1);
-		OUT_RING  (nvgl_primitive(mode));
+		BEGIN_RING(chan, rankine, NV34TCL_VERTEX_BEGIN_END, 1);
+		OUT_RING  (chan, nvgl_primitive(mode));
 
 		if (vc & 1) {
-			BEGIN_RING(rankine, NV34TCL_VB_ELEMENT_U32, 1);
-			OUT_RING  (elts[0]);
+			BEGIN_RING(chan, rankine, NV34TCL_VB_ELEMENT_U32, 1);
+			OUT_RING  (chan, elts[0]);
 			elts++; vc--;
 		}
 
@@ -258,16 +262,16 @@ nv30_draw_elements_u08(struct nv30_context *nv30, void *ib,
 
 			push = MIN2(vc, 2047 * 2);
 
-			BEGIN_RING_NI(rankine, NV34TCL_VB_ELEMENT_U16, push >> 1);
+			BEGIN_RING_NI(chan, rankine, NV34TCL_VB_ELEMENT_U16, push >> 1);
 			for (i = 0; i < push; i+=2)
-				OUT_RING((elts[i+1] << 16) | elts[i]);
+				OUT_RING(chan, (elts[i+1] << 16) | elts[i]);
 
 			vc -= push;
 			elts += push;
 		}
 
-		BEGIN_RING(rankine, NV34TCL_VERTEX_BEGIN_END, 1);
-		OUT_RING  (0);
+		BEGIN_RING(chan, rankine, NV34TCL_VERTEX_BEGIN_END, 1);
+		OUT_RING  (chan, 0);
 
 		start = restart;
 	}
@@ -277,7 +281,9 @@ static INLINE void
 nv30_draw_elements_u16(struct nv30_context *nv30, void *ib,
 		       unsigned mode, unsigned start, unsigned count)
 {
-	struct nouveau_channel *chan = nv30->screen->base.channel;
+	struct nv30_screen *screen = nv30->screen;
+	struct nouveau_channel *chan = screen->base.channel;
+	struct nouveau_grobj *rankine = screen->rankine;
 
 	while (count) {
 		uint16_t *elts = (uint16_t *)ib + start;
@@ -288,17 +294,17 @@ nv30_draw_elements_u16(struct nv30_context *nv30, void *ib,
 		vc = nouveau_vbuf_split(chan->pushbuf->remaining, 6, 2,
 					mode, start, count, &restart);
 		if (vc == 0) {
-			FIRE_RING(NULL);
+			FIRE_RING(chan);
 			continue;
 		}
 		count -= vc;
 
-		BEGIN_RING(rankine, NV34TCL_VERTEX_BEGIN_END, 1);
-		OUT_RING  (nvgl_primitive(mode));
+		BEGIN_RING(chan, rankine, NV34TCL_VERTEX_BEGIN_END, 1);
+		OUT_RING  (chan, nvgl_primitive(mode));
 
 		if (vc & 1) {
-			BEGIN_RING(rankine, NV34TCL_VB_ELEMENT_U32, 1);
-			OUT_RING  (elts[0]);
+			BEGIN_RING(chan, rankine, NV34TCL_VB_ELEMENT_U32, 1);
+			OUT_RING  (chan, elts[0]);
 			elts++; vc--;
 		}
 
@@ -307,16 +313,16 @@ nv30_draw_elements_u16(struct nv30_context *nv30, void *ib,
 
 			push = MIN2(vc, 2047 * 2);
 
-			BEGIN_RING_NI(rankine, NV34TCL_VB_ELEMENT_U16, push >> 1);
+			BEGIN_RING_NI(chan, rankine, NV34TCL_VB_ELEMENT_U16, push >> 1);
 			for (i = 0; i < push; i+=2)
-				OUT_RING((elts[i+1] << 16) | elts[i]);
+				OUT_RING(chan, (elts[i+1] << 16) | elts[i]);
 
 			vc -= push;
 			elts += push;
 		}
 
-		BEGIN_RING(rankine, NV34TCL_VERTEX_BEGIN_END, 1);
-		OUT_RING  (0);
+		BEGIN_RING(chan, rankine, NV34TCL_VERTEX_BEGIN_END, 1);
+		OUT_RING  (chan, 0);
 
 		start = restart;
 	}
@@ -326,7 +332,9 @@ static INLINE void
 nv30_draw_elements_u32(struct nv30_context *nv30, void *ib,
 		       unsigned mode, unsigned start, unsigned count)
 {
-	struct nouveau_channel *chan = nv30->screen->base.channel;
+	struct nv30_screen *screen = nv30->screen;
+	struct nouveau_channel *chan = screen->base.channel;
+	struct nouveau_grobj *rankine = screen->rankine;
 
 	while (count) {
 		uint32_t *elts = (uint32_t *)ib + start;
@@ -337,26 +345,26 @@ nv30_draw_elements_u32(struct nv30_context *nv30, void *ib,
 		vc = nouveau_vbuf_split(chan->pushbuf->remaining, 5, 1,
 					mode, start, count, &restart);
 		if (vc == 0) {
-			FIRE_RING(NULL);
+			FIRE_RING(chan);
 			continue;
 		}
 		count -= vc;
 
-		BEGIN_RING(rankine, NV34TCL_VERTEX_BEGIN_END, 1);
-		OUT_RING  (nvgl_primitive(mode));
+		BEGIN_RING(chan, rankine, NV34TCL_VERTEX_BEGIN_END, 1);
+		OUT_RING  (chan, nvgl_primitive(mode));
 
 		while (vc) {
 			push = MIN2(vc, 2047);
 
-			BEGIN_RING_NI(rankine, NV34TCL_VB_ELEMENT_U32, push);
-			OUT_RINGp    (elts, push);
+			BEGIN_RING_NI(chan, rankine, NV34TCL_VB_ELEMENT_U32, push);
+			OUT_RINGp    (chan, elts, push);
 
 			vc -= push;
 			elts += push;
 		}
 
-		BEGIN_RING(rankine, NV34TCL_VERTEX_BEGIN_END, 1);
-		OUT_RING  (0);
+		BEGIN_RING(chan, rankine, NV34TCL_VERTEX_BEGIN_END, 1);
+		OUT_RING  (chan, 0);
 
 		start = restart;
 	}
@@ -401,7 +409,9 @@ nv30_draw_elements_vbo(struct pipe_context *pipe,
 		       unsigned mode, unsigned start, unsigned count)
 {
 	struct nv30_context *nv30 = nv30_context(pipe);
-	struct nouveau_channel *chan = nv30->screen->base.channel;
+	struct nv30_screen *screen = nv30->screen;
+	struct nouveau_channel *chan = screen->base.channel;
+	struct nouveau_grobj *rankine = screen->rankine;
 	unsigned restart = 0;
 
 	while (count) {
@@ -412,17 +422,17 @@ nv30_draw_elements_vbo(struct pipe_context *pipe,
 		vc = nouveau_vbuf_split(chan->pushbuf->remaining, 6, 256,
 					mode, start, count, &restart);
 		if (!vc) {
-			FIRE_RING(NULL);
+			FIRE_RING(chan);
 			continue;
 		}
 		
-		BEGIN_RING(rankine, NV34TCL_VERTEX_BEGIN_END, 1);
-		OUT_RING  (nvgl_primitive(mode));
+		BEGIN_RING(chan, rankine, NV34TCL_VERTEX_BEGIN_END, 1);
+		OUT_RING  (chan, nvgl_primitive(mode));
 
 		nr = (vc & 0xff);
 		if (nr) {
-			BEGIN_RING(rankine, NV34TCL_VB_INDEX_BATCH, 1);
-			OUT_RING  (((nr - 1) << 24) | start);
+			BEGIN_RING(chan, rankine, NV34TCL_VB_INDEX_BATCH, 1);
+			OUT_RING  (chan, ((nr - 1) << 24) | start);
 			start += nr;
 		}
 
@@ -432,15 +442,15 @@ nv30_draw_elements_vbo(struct pipe_context *pipe,
 
 			nr -= push;
 
-			BEGIN_RING_NI(rankine, NV34TCL_VB_INDEX_BATCH, push);
+			BEGIN_RING_NI(chan, rankine, NV34TCL_VB_INDEX_BATCH, push);
 			while (push--) {
-				OUT_RING(((0x100 - 1) << 24) | start);
+				OUT_RING(chan, ((0x100 - 1) << 24) | start);
 				start += 0x100;
 			}
 		}
 
-		BEGIN_RING(rankine, NV34TCL_VERTEX_BEGIN_END, 1);
-		OUT_RING  (0);
+		BEGIN_RING(chan, rankine, NV34TCL_VERTEX_BEGIN_END, 1);
+		OUT_RING  (chan, 0);
 
 		count -= vc;
 		start = restart;
diff --git a/src/gallium/drivers/nv30/nv30_vertprog.c b/src/gallium/drivers/nv30/nv30_vertprog.c
index 5d60984..4e6d3d0 100644
--- a/src/gallium/drivers/nv30/nv30_vertprog.c
+++ b/src/gallium/drivers/nv30/nv30_vertprog.c
@@ -650,7 +650,9 @@ static boolean
 nv30_vertprog_validate(struct nv30_context *nv30)
 { 
 	struct pipe_screen *pscreen = nv30->pipe.screen;
-	struct nouveau_grobj *rankine = nv30->screen->rankine;
+	struct nv30_screen *screen = nv30->screen;
+	struct nouveau_channel *chan = screen->base.channel;
+	struct nouveau_grobj *rankine = screen->rankine;
 	struct nv30_vertex_program *vp;
 	struct pipe_buffer *constbuf;
 	boolean upload_code = FALSE, upload_data = FALSE;
@@ -770,9 +772,9 @@ nv30_vertprog_validate(struct nv30_context *nv30)
 				       4 * sizeof(float));
 			}
 
-			BEGIN_RING(rankine, NV34TCL_VP_UPLOAD_CONST_ID, 5);
-			OUT_RING  (i + vp->data->start);
-			OUT_RINGp ((uint32_t *)vpd->value, 4);
+			BEGIN_RING(chan, rankine, NV34TCL_VP_UPLOAD_CONST_ID, 5);
+			OUT_RING  (chan, i + vp->data->start);
+			OUT_RINGp (chan, (uint32_t *)vpd->value, 4);
 		}
 
 		if (constbuf)
@@ -788,11 +790,11 @@ nv30_vertprog_validate(struct nv30_context *nv30)
 				vp->insns[i].data[2], vp->insns[i].data[3]);
 		}
 #endif
-		BEGIN_RING(rankine, NV34TCL_VP_UPLOAD_FROM_ID, 1);
-		OUT_RING  (vp->exec->start);
+		BEGIN_RING(chan, rankine, NV34TCL_VP_UPLOAD_FROM_ID, 1);
+		OUT_RING  (chan, vp->exec->start);
 		for (i = 0; i < vp->nr_insns; i++) {
-			BEGIN_RING(rankine, NV34TCL_VP_UPLOAD_INST(0), 4);
-			OUT_RINGp (vp->insns[i].data, 4);
+			BEGIN_RING(chan, rankine, NV34TCL_VP_UPLOAD_INST(0), 4);
+			OUT_RINGp (chan, vp->insns[i].data, 4);
 		}
 	}
 
diff --git a/src/gallium/drivers/nv40/nv40_context.c b/src/gallium/drivers/nv40/nv40_context.c
index d56c7a6..f79ae4d 100644
--- a/src/gallium/drivers/nv40/nv40_context.c
+++ b/src/gallium/drivers/nv40/nv40_context.c
@@ -10,15 +10,20 @@ nv40_flush(struct pipe_context *pipe, unsigned flags,
 	   struct pipe_fence_handle **fence)
 {
 	struct nv40_context *nv40 = nv40_context(pipe);
+	struct nv40_screen *screen = nv40->screen;
+	struct nouveau_channel *chan = screen->base.channel;
+	struct nouveau_grobj *curie = screen->curie;
 
 	if (flags & PIPE_FLUSH_TEXTURE_CACHE) {
-		BEGIN_RING(curie, 0x1fd8, 1);
-		OUT_RING  (2);
-		BEGIN_RING(curie, 0x1fd8, 1);
-		OUT_RING  (1);
+		BEGIN_RING(chan, curie, 0x1fd8, 1);
+		OUT_RING  (chan, 2);
+		BEGIN_RING(chan, curie, 0x1fd8, 1);
+		OUT_RING  (chan, 1);
 	}
 
-	FIRE_RING(fence);
+	FIRE_RING(chan);
+	if (fence)
+		*fence = NULL;
 }
 
 static void
diff --git a/src/gallium/drivers/nv40/nv40_context.h b/src/gallium/drivers/nv40/nv40_context.h
index 83fcf17..381a029 100644
--- a/src/gallium/drivers/nv40/nv40_context.h
+++ b/src/gallium/drivers/nv40/nv40_context.h
@@ -14,10 +14,6 @@
 #include "nouveau/nouveau_winsys.h"
 #include "nouveau/nouveau_gldefs.h"
 #include "nouveau/nouveau_context.h"
-
-#define NOUVEAU_PUSH_CONTEXT(ctx)                                              \
-	struct nv40_screen *ctx = nv40->screen
-#include "nouveau/nouveau_push.h"
 #include "nouveau/nouveau_stateobj.h"
 
 #include "nv40_state.h"
diff --git a/src/gallium/drivers/nv40/nv40_draw.c b/src/gallium/drivers/nv40/nv40_draw.c
index 3875bc3..31c2fff 100644
--- a/src/gallium/drivers/nv40/nv40_draw.c
+++ b/src/gallium/drivers/nv40/nv40_draw.c
@@ -31,6 +31,9 @@ nv40_render_stage(struct draw_stage *stage)
 static INLINE void
 nv40_render_vertex(struct nv40_context *nv40, const struct vertex_header *v)
 {
+	struct nv40_screen *screen = nv40->screen;
+	struct nouveau_channel *chan = screen->base.channel;
+	struct nouveau_grobj *curie = screen->curie;
 	unsigned i;
 
 	for (i = 0; i < nv40->swtnl.nr_attribs; i++) {
@@ -41,30 +44,30 @@ nv40_render_vertex(struct nv40_context *nv40, const struct vertex_header *v)
 		case EMIT_OMIT:
 			break;
 		case EMIT_1F:
-			BEGIN_RING(curie, NV40TCL_VTX_ATTR_1F(hw), 1);
-			OUT_RING  (fui(v->data[idx][0]));
+			BEGIN_RING(chan, curie, NV40TCL_VTX_ATTR_1F(hw), 1);
+			OUT_RING  (chan, fui(v->data[idx][0]));
 			break;
 		case EMIT_2F:
-			BEGIN_RING(curie, NV40TCL_VTX_ATTR_2F_X(hw), 2);
-			OUT_RING  (fui(v->data[idx][0]));
-			OUT_RING  (fui(v->data[idx][1]));
+			BEGIN_RING(chan, curie, NV40TCL_VTX_ATTR_2F_X(hw), 2);
+			OUT_RING  (chan, fui(v->data[idx][0]));
+			OUT_RING  (chan, fui(v->data[idx][1]));
 			break;
 		case EMIT_3F:
-			BEGIN_RING(curie, NV40TCL_VTX_ATTR_3F_X(hw), 3);
-			OUT_RING  (fui(v->data[idx][0]));
-			OUT_RING  (fui(v->data[idx][1]));
-			OUT_RING  (fui(v->data[idx][2]));
+			BEGIN_RING(chan, curie, NV40TCL_VTX_ATTR_3F_X(hw), 3);
+			OUT_RING  (chan, fui(v->data[idx][0]));
+			OUT_RING  (chan, fui(v->data[idx][1]));
+			OUT_RING  (chan, fui(v->data[idx][2]));
 			break;
 		case EMIT_4F:
-			BEGIN_RING(curie, NV40TCL_VTX_ATTR_4F_X(hw), 4);
-			OUT_RING  (fui(v->data[idx][0]));
-			OUT_RING  (fui(v->data[idx][1]));
-			OUT_RING  (fui(v->data[idx][2]));
-			OUT_RING  (fui(v->data[idx][3]));
+			BEGIN_RING(chan, curie, NV40TCL_VTX_ATTR_4F_X(hw), 4);
+			OUT_RING  (chan, fui(v->data[idx][0]));
+			OUT_RING  (chan, fui(v->data[idx][1]));
+			OUT_RING  (chan, fui(v->data[idx][2]));
+			OUT_RING  (chan, fui(v->data[idx][3]));
 			break;
 		case EMIT_4UB:
-			BEGIN_RING(curie, NV40TCL_VTX_ATTR_4UB(hw), 1);
-			OUT_RING  (pack_ub4(float_to_ubyte(v->data[idx][0]),
+			BEGIN_RING(chan, curie, NV40TCL_VTX_ATTR_4UB(hw), 1);
+			OUT_RING  (chan, pack_ub4(float_to_ubyte(v->data[idx][0]),
 					    float_to_ubyte(v->data[idx][1]),
 					    float_to_ubyte(v->data[idx][2]),
 					    float_to_ubyte(v->data[idx][3])));
@@ -82,7 +85,11 @@ nv40_render_prim(struct draw_stage *stage, struct prim_header *prim,
 {
 	struct nv40_render_stage *rs = nv40_render_stage(stage);
 	struct nv40_context *nv40 = rs->nv40;
-	struct nouveau_pushbuf *pb = nv40->screen->base.channel->pushbuf;
+
+	struct nv40_screen *screen = nv40->screen;
+	struct nouveau_channel *chan = screen->base.channel;
+	struct nouveau_pushbuf *pb = chan->pushbuf;
+	struct nouveau_grobj *curie = screen->curie;
 	unsigned i;
 
 	/* Ensure there's room for 4xfloat32 + potentially 3 begin/end */
@@ -91,19 +98,19 @@ nv40_render_prim(struct draw_stage *stage, struct prim_header *prim,
 			NOUVEAU_ERR("AIII, missed flush\n");
 			assert(0);
 		}
-		FIRE_RING(NULL);
+		FIRE_RING(chan);
 		nv40_state_emit(nv40);
 	}
 
 	/* Switch primitive modes if necessary */
 	if (rs->prim != mode) {
 		if (rs->prim != NV40TCL_BEGIN_END_STOP) {
-			BEGIN_RING(curie, NV40TCL_BEGIN_END, 1);
-			OUT_RING  (NV40TCL_BEGIN_END_STOP);	
+			BEGIN_RING(chan, curie, NV40TCL_BEGIN_END, 1);
+			OUT_RING  (chan, NV40TCL_BEGIN_END_STOP);
 		}
 
-		BEGIN_RING(curie, NV40TCL_BEGIN_END, 1);
-		OUT_RING  (mode);
+		BEGIN_RING(chan, curie, NV40TCL_BEGIN_END, 1);
+		OUT_RING  (chan, mode);
 		rs->prim = mode;
 	}
 
@@ -115,8 +122,8 @@ nv40_render_prim(struct draw_stage *stage, struct prim_header *prim,
 	 * off the primitive now.
 	 */
 	if (pb->remaining < ((count * 20) + 6)) {
-		BEGIN_RING(curie, NV40TCL_BEGIN_END, 1);
-		OUT_RING  (NV40TCL_BEGIN_END_STOP);
+		BEGIN_RING(chan, curie, NV40TCL_BEGIN_END, 1);
+		OUT_RING  (chan, NV40TCL_BEGIN_END_STOP);
 		rs->prim = NV40TCL_BEGIN_END_STOP;
 	}
 }
@@ -144,10 +151,13 @@ nv40_render_flush(struct draw_stage *draw, unsigned flags)
 {
 	struct nv40_render_stage *rs = nv40_render_stage(draw);
 	struct nv40_context *nv40 = rs->nv40;
+	struct nv40_screen *screen = nv40->screen;
+	struct nouveau_channel *chan = screen->base.channel;
+	struct nouveau_grobj *curie = screen->curie;
 
 	if (rs->prim != NV40TCL_BEGIN_END_STOP) {
-		BEGIN_RING(curie, NV40TCL_BEGIN_END, 1);
-		OUT_RING  (NV40TCL_BEGIN_END_STOP);
+		BEGIN_RING(chan, curie, NV40TCL_BEGIN_END, 1);
+		OUT_RING  (chan, NV40TCL_BEGIN_END_STOP);
 		rs->prim = NV40TCL_BEGIN_END_STOP;
 	}
 }
diff --git a/src/gallium/drivers/nv40/nv40_query.c b/src/gallium/drivers/nv40/nv40_query.c
index 7874aed..8ed4a67 100644
--- a/src/gallium/drivers/nv40/nv40_query.c
+++ b/src/gallium/drivers/nv40/nv40_query.c
@@ -41,6 +41,9 @@ nv40_query_begin(struct pipe_context *pipe, struct pipe_query *pq)
 {
 	struct nv40_context *nv40 = nv40_context(pipe);
 	struct nv40_query *q = nv40_query(pq);
+	struct nv40_screen *screen = nv40->screen;
+	struct nouveau_channel *chan = screen->base.channel;
+	struct nouveau_grobj *curie = screen->curie;
 
 	assert(q->type == PIPE_QUERY_OCCLUSION_COUNTER);
 
@@ -57,10 +60,10 @@ nv40_query_begin(struct pipe_context *pipe, struct pipe_query *pq)
 		assert(0);
 	nouveau_notifier_reset(nv40->screen->query, q->object->start);
 
-	BEGIN_RING(curie, NV40TCL_QUERY_RESET, 1);
-	OUT_RING  (1);
-	BEGIN_RING(curie, NV40TCL_QUERY_UNK17CC, 1);
-	OUT_RING  (1);
+	BEGIN_RING(chan, curie, NV40TCL_QUERY_RESET, 1);
+	OUT_RING  (chan, 1);
+	BEGIN_RING(chan, curie, NV40TCL_QUERY_UNK17CC, 1);
+	OUT_RING  (chan, 1);
 
 	q->ready = FALSE;
 }
@@ -70,11 +73,14 @@ nv40_query_end(struct pipe_context *pipe, struct pipe_query *pq)
 {
 	struct nv40_context *nv40 = nv40_context(pipe);
 	struct nv40_query *q = nv40_query(pq);
+	struct nv40_screen *screen = nv40->screen;
+	struct nouveau_channel *chan = screen->base.channel;
+	struct nouveau_grobj *curie = screen->curie;
 
-	BEGIN_RING(curie, NV40TCL_QUERY_GET, 1);
-	OUT_RING  ((0x01 << NV40TCL_QUERY_GET_UNK24_SHIFT) |
+	BEGIN_RING(chan, curie, NV40TCL_QUERY_GET, 1);
+	OUT_RING  (chan, (0x01 << NV40TCL_QUERY_GET_UNK24_SHIFT) |
 		   ((q->object->start * 32) << NV40TCL_QUERY_GET_OFFSET_SHIFT));
-	FIRE_RING(NULL);
+	FIRE_RING(chan);
 }
 
 static boolean
diff --git a/src/gallium/drivers/nv40/nv40_state_emit.c b/src/gallium/drivers/nv40/nv40_state_emit.c
index 789ed16..13fe854 100644
--- a/src/gallium/drivers/nv40/nv40_state_emit.c
+++ b/src/gallium/drivers/nv40/nv40_state_emit.c
@@ -54,9 +54,10 @@ nv40_state_do_validate(struct nv40_context *nv40,
 void
 nv40_state_emit(struct nv40_context *nv40)
 {
-	struct nouveau_channel *chan = nv40->screen->base.channel;
 	struct nv40_state *state = &nv40->state;
 	struct nv40_screen *screen = nv40->screen;
+	struct nouveau_channel *chan = screen->base.channel;
+	struct nouveau_grobj *curie = screen->curie;
 	unsigned i;
 	uint64_t states;
 
@@ -80,10 +81,10 @@ nv40_state_emit(struct nv40_context *nv40)
 
 	if (state->dirty & ((1ULL << NV40_STATE_FRAGPROG) |
 			    (1ULL << NV40_STATE_FRAGTEX0))) {
-		BEGIN_RING(curie, NV40TCL_TEX_CACHE_CTL, 1);
-		OUT_RING  (2);
-		BEGIN_RING(curie, NV40TCL_TEX_CACHE_CTL, 1);
-		OUT_RING  (1);
+		BEGIN_RING(chan, curie, NV40TCL_TEX_CACHE_CTL, 1);
+		OUT_RING  (chan, 2);
+		BEGIN_RING(chan, curie, NV40TCL_TEX_CACHE_CTL, 1);
+		OUT_RING  (chan, 1);
 	}
 
 	state->dirty = 0;
diff --git a/src/gallium/drivers/nv40/nv40_vbo.c b/src/gallium/drivers/nv40/nv40_vbo.c
index af3fcf6..d76af31 100644
--- a/src/gallium/drivers/nv40/nv40_vbo.c
+++ b/src/gallium/drivers/nv40/nv40_vbo.c
@@ -169,7 +169,9 @@ nv40_draw_arrays(struct pipe_context *pipe,
 		 unsigned mode, unsigned start, unsigned count)
 {
 	struct nv40_context *nv40 = nv40_context(pipe);
-	struct nouveau_channel *chan = nv40->screen->base.channel;
+	struct nv40_screen *screen = nv40->screen;
+	struct nouveau_channel *chan = screen->base.channel;
+	struct nouveau_grobj *curie = screen->curie;
 	unsigned restart;
 
 	nv40_vbo_set_idxbuf(nv40, NULL, 0);
@@ -186,17 +188,17 @@ nv40_draw_arrays(struct pipe_context *pipe,
 		vc = nouveau_vbuf_split(chan->pushbuf->remaining, 6, 256,
 					mode, start, count, &restart);
 		if (!vc) {
-			FIRE_RING(NULL);
+			FIRE_RING(chan);
 			continue;
 		}
 
-		BEGIN_RING(curie, NV40TCL_BEGIN_END, 1);
-		OUT_RING  (nvgl_primitive(mode));
+		BEGIN_RING(chan, curie, NV40TCL_BEGIN_END, 1);
+		OUT_RING  (chan, nvgl_primitive(mode));
 
 		nr = (vc & 0xff);
 		if (nr) {
-			BEGIN_RING(curie, NV40TCL_VB_VERTEX_BATCH, 1);
-			OUT_RING  (((nr - 1) << 24) | start);
+			BEGIN_RING(chan, curie, NV40TCL_VB_VERTEX_BATCH, 1);
+			OUT_RING  (chan, ((nr - 1) << 24) | start);
 			start += nr;
 		}
 
@@ -206,15 +208,15 @@ nv40_draw_arrays(struct pipe_context *pipe,
 
 			nr -= push;
 
-			BEGIN_RING_NI(curie, NV40TCL_VB_VERTEX_BATCH, push);
+			BEGIN_RING_NI(chan, curie, NV40TCL_VB_VERTEX_BATCH, push);
 			while (push--) {
-				OUT_RING(((0x100 - 1) << 24) | start);
+				OUT_RING(chan, ((0x100 - 1) << 24) | start);
 				start += 0x100;
 			}
 		}
 
-		BEGIN_RING(curie, NV40TCL_BEGIN_END, 1);
-		OUT_RING  (0);
+		BEGIN_RING(chan, curie, NV40TCL_BEGIN_END, 1);
+		OUT_RING  (chan, 0);
 
 		count -= vc;
 		start = restart;
@@ -228,7 +230,9 @@ static INLINE void
 nv40_draw_elements_u08(struct nv40_context *nv40, void *ib,
 		       unsigned mode, unsigned start, unsigned count)
 {
-	struct nouveau_channel *chan = nv40->screen->base.channel;
+	struct nv40_screen *screen = nv40->screen;
+	struct nouveau_channel *chan = screen->base.channel;
+	struct nouveau_grobj *curie = screen->curie;
 
 	while (count) {
 		uint8_t *elts = (uint8_t *)ib + start;
@@ -239,17 +243,17 @@ nv40_draw_elements_u08(struct nv40_context *nv40, void *ib,
 		vc = nouveau_vbuf_split(chan->pushbuf->remaining, 6, 2,
 					mode, start, count, &restart);
 		if (vc == 0) {
-			FIRE_RING(NULL);
+			FIRE_RING(chan);
 			continue;
 		}
 		count -= vc;
 
-		BEGIN_RING(curie, NV40TCL_BEGIN_END, 1);
-		OUT_RING  (nvgl_primitive(mode));
+		BEGIN_RING(chan, curie, NV40TCL_BEGIN_END, 1);
+		OUT_RING  (chan, nvgl_primitive(mode));
 
 		if (vc & 1) {
-			BEGIN_RING(curie, NV40TCL_VB_ELEMENT_U32, 1);
-			OUT_RING  (elts[0]);
+			BEGIN_RING(chan, curie, NV40TCL_VB_ELEMENT_U32, 1);
+			OUT_RING  (chan, elts[0]);
 			elts++; vc--;
 		}
 
@@ -258,16 +262,16 @@ nv40_draw_elements_u08(struct nv40_context *nv40, void *ib,
 
 			push = MIN2(vc, 2047 * 2);
 
-			BEGIN_RING_NI(curie, NV40TCL_VB_ELEMENT_U16, push >> 1);
+			BEGIN_RING_NI(chan, curie, NV40TCL_VB_ELEMENT_U16, push >> 1);
 			for (i = 0; i < push; i+=2)
-				OUT_RING((elts[i+1] << 16) | elts[i]);
+				OUT_RING(chan, (elts[i+1] << 16) | elts[i]);
 
 			vc -= push;
 			elts += push;
 		}
 
-		BEGIN_RING(curie, NV40TCL_BEGIN_END, 1);
-		OUT_RING  (0);
+		BEGIN_RING(chan, curie, NV40TCL_BEGIN_END, 1);
+		OUT_RING  (chan, 0);
 
 		start = restart;
 	}
@@ -277,7 +281,9 @@ static INLINE void
 nv40_draw_elements_u16(struct nv40_context *nv40, void *ib,
 		       unsigned mode, unsigned start, unsigned count)
 {
-	struct nouveau_channel *chan = nv40->screen->base.channel;
+	struct nv40_screen *screen = nv40->screen;
+	struct nouveau_channel *chan = screen->base.channel;
+	struct nouveau_grobj *curie = screen->curie;
 
 	while (count) {
 		uint16_t *elts = (uint16_t *)ib + start;
@@ -288,17 +294,17 @@ nv40_draw_elements_u16(struct nv40_context *nv40, void *ib,
 		vc = nouveau_vbuf_split(chan->pushbuf->remaining, 6, 2,
 					mode, start, count, &restart);
 		if (vc == 0) {
-			FIRE_RING(NULL);
+			FIRE_RING(chan);
 			continue;
 		}
 		count -= vc;
 
-		BEGIN_RING(curie, NV40TCL_BEGIN_END, 1);
-		OUT_RING  (nvgl_primitive(mode));
+		BEGIN_RING(chan, curie, NV40TCL_BEGIN_END, 1);
+		OUT_RING  (chan, nvgl_primitive(mode));
 
 		if (vc & 1) {
-			BEGIN_RING(curie, NV40TCL_VB_ELEMENT_U32, 1);
-			OUT_RING  (elts[0]);
+			BEGIN_RING(chan, curie, NV40TCL_VB_ELEMENT_U32, 1);
+			OUT_RING  (chan, elts[0]);
 			elts++; vc--;
 		}
 
@@ -307,16 +313,16 @@ nv40_draw_elements_u16(struct nv40_context *nv40, void *ib,
 
 			push = MIN2(vc, 2047 * 2);
 
-			BEGIN_RING_NI(curie, NV40TCL_VB_ELEMENT_U16, push >> 1);
+			BEGIN_RING_NI(chan, curie, NV40TCL_VB_ELEMENT_U16, push >> 1);
 			for (i = 0; i < push; i+=2)
-				OUT_RING((elts[i+1] << 16) | elts[i]);
+				OUT_RING(chan, (elts[i+1] << 16) | elts[i]);
 
 			vc -= push;
 			elts += push;
 		}
 
-		BEGIN_RING(curie, NV40TCL_BEGIN_END, 1);
-		OUT_RING  (0);
+		BEGIN_RING(chan, curie, NV40TCL_BEGIN_END, 1);
+		OUT_RING  (chan, 0);
 
 		start = restart;
 	}
@@ -326,7 +332,9 @@ static INLINE void
 nv40_draw_elements_u32(struct nv40_context *nv40, void *ib,
 		       unsigned mode, unsigned start, unsigned count)
 {
-	struct nouveau_channel *chan = nv40->screen->base.channel;
+	struct nv40_screen *screen = nv40->screen;
+	struct nouveau_channel *chan = screen->base.channel;
+	struct nouveau_grobj *curie = screen->curie;
 
 	while (count) {
 		uint32_t *elts = (uint32_t *)ib + start;
@@ -337,26 +345,26 @@ nv40_draw_elements_u32(struct nv40_context *nv40, void *ib,
 		vc = nouveau_vbuf_split(chan->pushbuf->remaining, 5, 1,
 					mode, start, count, &restart);
 		if (vc == 0) {
-			FIRE_RING(NULL);
+			FIRE_RING(chan);
 			continue;
 		}
 		count -= vc;
 
-		BEGIN_RING(curie, NV40TCL_BEGIN_END, 1);
-		OUT_RING  (nvgl_primitive(mode));
+		BEGIN_RING(chan, curie, NV40TCL_BEGIN_END, 1);
+		OUT_RING  (chan, nvgl_primitive(mode));
 
 		while (vc) {
 			push = MIN2(vc, 2047);
 
-			BEGIN_RING_NI(curie, NV40TCL_VB_ELEMENT_U32, push);
-			OUT_RINGp    (elts, push);
+			BEGIN_RING_NI(chan, curie, NV40TCL_VB_ELEMENT_U32, push);
+			OUT_RINGp    (chan, elts, push);
 
 			vc -= push;
 			elts += push;
 		}
 
-		BEGIN_RING(curie, NV40TCL_BEGIN_END, 1);
-		OUT_RING  (0);
+		BEGIN_RING(chan, curie, NV40TCL_BEGIN_END, 1);
+		OUT_RING  (chan, 0);
 
 		start = restart;
 	}
@@ -401,7 +409,9 @@ nv40_draw_elements_vbo(struct pipe_context *pipe,
 		       unsigned mode, unsigned start, unsigned count)
 {
 	struct nv40_context *nv40 = nv40_context(pipe);
-	struct nouveau_channel *chan = nv40->screen->base.channel;
+	struct nv40_screen *screen = nv40->screen;
+	struct nouveau_channel *chan = screen->base.channel;
+	struct nouveau_grobj *curie = screen->curie;
 	unsigned restart;
 
 	while (count) {
@@ -412,17 +422,17 @@ nv40_draw_elements_vbo(struct pipe_context *pipe,
 		vc = nouveau_vbuf_split(chan->pushbuf->remaining, 6, 256,
 					mode, start, count, &restart);
 		if (!vc) {
-			FIRE_RING(NULL);
+			FIRE_RING(chan);
 			continue;
 		}
 		
-		BEGIN_RING(curie, NV40TCL_BEGIN_END, 1);
-		OUT_RING  (nvgl_primitive(mode));
+		BEGIN_RING(chan, curie, NV40TCL_BEGIN_END, 1);
+		OUT_RING  (chan, nvgl_primitive(mode));
 
 		nr = (vc & 0xff);
 		if (nr) {
-			BEGIN_RING(curie, NV40TCL_VB_INDEX_BATCH, 1);
-			OUT_RING  (((nr - 1) << 24) | start);
+			BEGIN_RING(chan, curie, NV40TCL_VB_INDEX_BATCH, 1);
+			OUT_RING  (chan, ((nr - 1) << 24) | start);
 			start += nr;
 		}
 
@@ -432,15 +442,15 @@ nv40_draw_elements_vbo(struct pipe_context *pipe,
 
 			nr -= push;
 
-			BEGIN_RING_NI(curie, NV40TCL_VB_INDEX_BATCH, push);
+			BEGIN_RING_NI(chan, curie, NV40TCL_VB_INDEX_BATCH, push);
 			while (push--) {
-				OUT_RING(((0x100 - 1) << 24) | start);
+				OUT_RING(chan, ((0x100 - 1) << 24) | start);
 				start += 0x100;
 			}
 		}
 
-		BEGIN_RING(curie, NV40TCL_BEGIN_END, 1);
-		OUT_RING  (0);
+		BEGIN_RING(chan, curie, NV40TCL_BEGIN_END, 1);
+		OUT_RING  (chan, 0);
 
 		count -= vc;
 		start = restart;
diff --git a/src/gallium/drivers/nv40/nv40_vertprog.c b/src/gallium/drivers/nv40/nv40_vertprog.c
index d9fc310..afbb2cb 100644
--- a/src/gallium/drivers/nv40/nv40_vertprog.c
+++ b/src/gallium/drivers/nv40/nv40_vertprog.c
@@ -834,7 +834,9 @@ static boolean
 nv40_vertprog_validate(struct nv40_context *nv40)
 { 
 	struct pipe_screen *pscreen = nv40->pipe.screen;
-	struct nouveau_grobj *curie = nv40->screen->curie;
+	struct nv40_screen *screen = nv40->screen;
+	struct nouveau_channel *chan = screen->base.channel;
+	struct nouveau_grobj *curie = screen->curie;
 	struct nv40_vertex_program *vp;
 	struct pipe_buffer *constbuf;
 	boolean upload_code = FALSE, upload_data = FALSE;
@@ -974,9 +976,9 @@ check_gpu_resources:
 				       4 * sizeof(float));
 			}
 
-			BEGIN_RING(curie, NV40TCL_VP_UPLOAD_CONST_ID, 5);
-			OUT_RING  (i + vp->data->start);
-			OUT_RINGp ((uint32_t *)vpd->value, 4);
+			BEGIN_RING(chan, curie, NV40TCL_VP_UPLOAD_CONST_ID, 5);
+			OUT_RING  (chan, i + vp->data->start);
+			OUT_RINGp (chan, (uint32_t *)vpd->value, 4);
 		}
 
 		if (constbuf)
@@ -993,11 +995,11 @@ check_gpu_resources:
 			NOUVEAU_MSG("VP %d: 0x%08x\n", i, vp->insns[i].data[3]);
 		}
 #endif
-		BEGIN_RING(curie, NV40TCL_VP_UPLOAD_FROM_ID, 1);
-		OUT_RING  (vp->exec->start);
+		BEGIN_RING(chan, curie, NV40TCL_VP_UPLOAD_FROM_ID, 1);
+		OUT_RING  (chan, vp->exec->start);
 		for (i = 0; i < vp->nr_insns; i++) {
-			BEGIN_RING(curie, NV40TCL_VP_UPLOAD_INST(0), 4);
-			OUT_RINGp (vp->insns[i].data, 4);
+			BEGIN_RING(chan, curie, NV40TCL_VP_UPLOAD_INST(0), 4);
+			OUT_RINGp (chan, vp->insns[i].data, 4);
 		}
 	}
 
-- 
1.6.6.rc4

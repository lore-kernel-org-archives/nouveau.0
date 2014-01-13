From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH 16/19] nv50: copy nvc0's get_sample_position
	implementation
Date: Mon, 13 Jan 2014 14:19:32 -0500
Message-ID: <1389640775-25046-17-git-send-email-imirkin@alum.mit.edu>
References: <1389640775-25046-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1389640775-25046-1-git-send-email-imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
---
 src/gallium/drivers/nouveau/nv50/nv50_context.c | 46 +++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/src/gallium/drivers/nouveau/nv50/nv50_context.c b/src/gallium/drivers/nouveau/nv50/nv50_context.c
index 11afc48..db3bd3a 100644
--- a/src/gallium/drivers/nouveau/nv50/nv50_context.c
+++ b/src/gallium/drivers/nouveau/nv50/nv50_context.c
@@ -196,6 +196,10 @@ nv50_invalidate_resource_storage(struct nouveau_context *ctx,
    return ref;
 }
 
+static void
+nv50_context_get_sample_position(struct pipe_context *, unsigned, unsigned,
+                                 float *);
+
 struct pipe_context *
 nv50_create(struct pipe_screen *pscreen, void *priv)
 {
@@ -239,6 +243,7 @@ nv50_create(struct pipe_screen *pscreen, void *priv)
 
    pipe->flush = nv50_flush;
    pipe->texture_barrier = nv50_texture_barrier;
+   pipe->get_sample_position = nv50_context_get_sample_position;
 
    if (!screen->cur_ctx) {
       screen->cur_ctx = nv50;
@@ -317,3 +322,44 @@ nv50_bufctx_fence(struct nouveau_bufctx *bufctx, boolean on_flush)
          nv50_resource_validate(res, (unsigned)ref->priv_data);
    }
 }
+
+static void
+nv50_context_get_sample_position(struct pipe_context *pipe,
+                                 unsigned sample_count, unsigned sample_index,
+                                 float *xy)
+{
+   static const uint8_t ms1[1][2] = { { 0x8, 0x8 } };
+   static const uint8_t ms2[2][2] = {
+      { 0x4, 0x4 }, { 0xc, 0xc } }; /* surface coords (0,0), (1,0) */
+   static const uint8_t ms4[4][2] = {
+      { 0x6, 0x2 }, { 0xe, 0x6 },   /* (0,0), (1,0) */
+      { 0x2, 0xa }, { 0xa, 0xe } }; /* (0,1), (1,1) */
+   static const uint8_t ms8[8][2] = {
+      { 0x1, 0x7 }, { 0x5, 0x3 },   /* (0,0), (1,0) */
+      { 0x3, 0xd }, { 0x7, 0xb },   /* (0,1), (1,1) */
+      { 0x9, 0x5 }, { 0xf, 0x1 },   /* (2,0), (3,0) */
+      { 0xb, 0xf }, { 0xd, 0x9 } }; /* (2,1), (3,1) */
+#if 0
+   /* NOTE: there are alternative modes for MS2 and MS8, currently not used */
+   static const uint8_t ms8_alt[8][2] = {
+      { 0x9, 0x5 }, { 0x7, 0xb },   /* (2,0), (1,1) */
+      { 0xd, 0x9 }, { 0x5, 0x3 },   /* (3,1), (1,0) */
+      { 0x3, 0xd }, { 0x1, 0x7 },   /* (0,1), (0,0) */
+      { 0xb, 0xf }, { 0xf, 0x1 } }; /* (2,1), (3,0) */
+#endif
+
+   const uint8_t (*ptr)[2];
+
+   switch (sample_count) {
+   case 0:
+   case 1: ptr = ms1; break;
+   case 2: ptr = ms2; break;
+   case 4: ptr = ms4; break;
+   case 8: ptr = ms8; break;
+   default:
+      assert(0);
+      return; /* bad sample count -> undefined locations */
+   }
+   xy[0] = ptr[sample_index][0] * 0.0625f;
+   xy[1] = ptr[sample_index][1] * 0.0625f;
+}
-- 
1.8.3.2

From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] nv50: avoid a NULL-ptr dereference when the pipe
	context changes
Date: Fri, 14 Aug 2009 22:29:35 +0200
Message-ID: <1250281775-13994-1-git-send-email-madman2003@gmail.com>
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

- We cannot assume all state objects are present when the pipe context changes.
---
 src/gallium/drivers/nv50/nv50_state_validate.c |   27 +++++++++++++++++++++++-
 1 files changed, 26 insertions(+), 1 deletions(-)

diff --git a/src/gallium/drivers/nv50/nv50_state_validate.c b/src/gallium/drivers/nv50/nv50_state_validate.c
index 42ecf05..633be78 100644
--- a/src/gallium/drivers/nv50/nv50_state_validate.c
+++ b/src/gallium/drivers/nv50/nv50_state_validate.c
@@ -148,7 +148,32 @@ nv50_state_emit(struct nv50_context *nv50)
 	struct nouveau_channel *chan = screen->base.channel;
 
 	if (nv50->pctx_id != screen->cur_pctx) {
-		nv50->state.dirty |= 0xffffffff;
+		if (nv50->state.fb)
+			nv50->state.dirty |= NV50_NEW_FRAMEBUFFER;
+		if (nv50->state.blend)
+			nv50->state.dirty |= NV50_NEW_BLEND;
+		if (nv50->state.zsa)
+			nv50->state.dirty |= NV50_NEW_ZSA;
+		if (nv50->state.vertprog)
+			nv50->state.dirty |= NV50_NEW_VERTPROG;
+		if (nv50->state.fragprog)
+			nv50->state.dirty |= NV50_NEW_FRAGPROG;
+		if (nv50->state.rast)
+			nv50->state.dirty |= NV50_NEW_RASTERIZER;
+		if (nv50->state.blend_colour)
+			nv50->state.dirty |= NV50_NEW_BLEND_COLOUR;
+		if (nv50->state.stipple)
+			nv50->state.dirty |= NV50_NEW_STIPPLE;
+		if (nv50->state.scissor)
+			nv50->state.dirty |= NV50_NEW_SCISSOR;
+		if (nv50->state.viewport)
+			nv50->state.dirty |= NV50_NEW_VIEWPORT;
+		if (nv50->state.tsc_upload)
+			nv50->state.dirty |= NV50_NEW_SAMPLER;
+		if (nv50->state.tic_upload)
+			nv50->state.dirty |= NV50_NEW_TEXTURE;
+		if (nv50->state.vtxfmt && nv50->state.vtxbuf)
+			nv50->state.dirty |= NV50_NEW_ARRAYS;
 		screen->cur_pctx = nv50->pctx_id;
 	}
 
-- 
1.6.4

From: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
Subject: (patch) Gallium NV50: honor bypass_vs_clip_and_viewport
Date: Tue, 31 Mar 2009 15:47:11 +0200
Message-ID: <20090331154711.4j2wfak408gggg40@webmail.tuwien.ac.at>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
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

When trying out the Gallium3D NV50 driver (curiosity) with a small OpenGL
program that renders 2 rotating triangles partially occluding each other
I noticed that depth buffer clearing by rendering a quad
(st_cb_clear.c/clear_with_quad) didn't work properly.

I found this was because the rasterizer state that is set by clear_with_quad
has bypass_vs_clip_and_viewport = 1 which would only be commited if
the viewport was marked dirty, which it isn't when only binding a new
rasterizer state.

I let the depth buffer clear before drawing anything else and
then the bypass flag stuck (first viewport validate with bypass enabled and
no further viewport updates) and the triangles didn't show even when
disabling depth testing.

The following small patch would fix the issue, i.e. the depth buffer
is cleared correctly. I just thought I might mention it:

diff --git a/src/gallium/drivers/nv50/nv50_state_validate.c 
b/src/gallium/drivers/nv50/nv50_state_validate.c
index fc6157d..c13d3de 100644
--- a/src/gallium/drivers/nv50/nv50_state_validate.c
+++ b/src/gallium/drivers/nv50/nv50_state_validate.c
@@ -244,7 +244,7 @@ nv50_state_validate(struct nv50_context *nv50)
	}
scissor_uptodate:

-	if (nv50->dirty & NV50_NEW_VIEWPORT) {
+	if (nv50->dirty & (NV50_NEW_VIEWPORT | NV50_NEW_RASTERIZER)) {
		unsigned bypass;

		if (!nv50->rasterizer->pipe.bypass_vs_clip_and_viewport)
@@ -281,6 +281,7 @@ scissor_uptodate:

		so_ref(so, &nv50->state.viewport);
		so_ref(NULL, &so);
+		nv50->state.dirty |= NV50_NEW_VIEWPORT;
	}
viewport_uptodate:

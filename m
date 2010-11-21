From: Xavier Chantry <chantry.xavier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/2] nvfx: use bo_ref for render targets
Date: Sun, 21 Nov 2010 23:56:39 +0100
Message-ID: <1290380199-30248-2-git-send-email-chantry.xavier@gmail.com>
References: <1290380199-30248-1-git-send-email-chantry.xavier@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1290380199-30248-1-git-send-email-chantry.xavier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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

If nvfx_framebuffer prepare and validate were called successively with
fb->zsbuf not NULL and then NULL, nvfx->hw_zeta would contain garbage and
this would cause failures in nvfx_framebuffer_relocate/OUT_RELOC(hw_zeta).

This was triggered by piglit/texwrap 2D GL_DEPTH_COMPONENT24 and caused
first a 'write to user buffer!!' error in libdrm and then worse things.

When using bo_ref, the bo referenced by nvfx->hw_zeta is preserved properly.

Signed-off-by: Xavier Chantry <chantry.xavier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 src/gallium/drivers/nvfx/nvfx_context.c  |    6 ++++++
 src/gallium/drivers/nvfx/nvfx_state_fb.c |   19 +++++++++++++++----
 2 files changed, 21 insertions(+), 4 deletions(-)

diff --git a/src/gallium/drivers/nvfx/nvfx_context.c b/src/gallium/drivers/nvfx/nvfx_context.c
index 95834d2..93a00aa 100644
--- a/src/gallium/drivers/nvfx/nvfx_context.c
+++ b/src/gallium/drivers/nvfx/nvfx_context.c
@@ -32,10 +32,16 @@ static void
 nvfx_destroy(struct pipe_context *pipe)
 {
 	struct nvfx_context *nvfx = nvfx_context(pipe);
+	struct pipe_framebuffer_state *fb = &nvfx->framebuffer;
 
 	if(nvfx->dummy_fs)
 		pipe->delete_fs_state(pipe, nvfx->dummy_fs);
 
+	for (int i = 0; i < 4; i++) {
+		nouveau_bo_ref(NULL, &nvfx->hw_rt[i].bo);
+	}
+	nouveau_bo_ref(NULL, &nvfx->hw_zeta.bo);
+
 	for(unsigned i = 0; i < nvfx->vtxbuf_nr; ++i)
 		pipe_resource_reference(&nvfx->vtxbuf[i].buffer, 0);
 	pipe_resource_reference(&nvfx->idxbuf.buffer, 0);
diff --git a/src/gallium/drivers/nvfx/nvfx_state_fb.c b/src/gallium/drivers/nvfx/nvfx_state_fb.c
index 73885de..1064837 100644
--- a/src/gallium/drivers/nvfx/nvfx_state_fb.c
+++ b/src/gallium/drivers/nvfx/nvfx_state_fb.c
@@ -30,7 +30,7 @@ nvfx_surface_get_render_target(struct pipe_surface* surf, int all_swizzled, stru
 	struct nvfx_surface* ns = (struct nvfx_surface*)surf;
 	if(!ns->temp)
 	{
-		target->bo = ((struct nvfx_miptree*)surf->texture)->base.bo;
+		nouveau_bo_ref(((struct nvfx_miptree*)surf->texture)->base.bo, &target->bo);
 		target->offset = surf->offset;
 		target->pitch = align(ns->pitch, 64);
 		assert(target->pitch);
@@ -40,7 +40,7 @@ nvfx_surface_get_render_target(struct pipe_surface* surf, int all_swizzled, stru
 	{
 		target->offset = 0;
 		target->pitch = ns->temp->linear_pitch;
-		target->bo = ns->temp->base.bo;
+		nouveau_bo_ref(ns->temp->base.bo, &target->bo);
 		assert(target->pitch);
 		return TRUE;
 	}
@@ -91,6 +91,17 @@ nvfx_framebuffer_prepare(struct nvfx_context *nvfx)
 	return all_swizzled;
 }
 
+static void
+nvfx_release_render_target(struct nvfx_context *nvfx)
+{
+	struct pipe_framebuffer_state *fb = &nvfx->framebuffer;
+	int i;
+	for(i = fb->nr_cbufs; i < 4; ++i)
+		nouveau_bo_ref(NULL, &nvfx->hw_rt[i].bo);
+	if (!fb->zsbuf)
+		nouveau_bo_ref(NULL, &nvfx->hw_zeta.bo);
+}
+
 void
 nvfx_framebuffer_validate(struct nvfx_context *nvfx, unsigned prepare_result)
 {
@@ -102,6 +113,8 @@ nvfx_framebuffer_validate(struct nvfx_context *nvfx, unsigned prepare_result)
 	unsigned w = fb->width;
 	unsigned h = fb->height;
 
+	nvfx_release_render_target(nvfx);
+
 	rt_enable = (NV30_3D_RT_ENABLE_COLOR0 << fb->nr_cbufs) - 1;
 	if (rt_enable & (NV30_3D_RT_ENABLE_COLOR1 |
 			 NV40_3D_RT_ENABLE_COLOR2 | NV40_3D_RT_ENABLE_COLOR3))
@@ -112,8 +125,6 @@ nvfx_framebuffer_validate(struct nvfx_context *nvfx, unsigned prepare_result)
 	for (i = 0; i < fb->nr_cbufs; i++)
 		nvfx->state.render_temps |= nvfx_surface_get_render_target(fb->cbufs[i], prepare_result, &nvfx->hw_rt[i]) << i;
 
-	for(; i < 4; ++i)
-		nvfx->hw_rt[i].bo = 0;
 
 	if (fb->zsbuf) {
 		nvfx->state.render_temps |= nvfx_surface_get_render_target(fb->zsbuf, prepare_result, &nvfx->hw_zeta) << 7;
-- 
1.7.3.2

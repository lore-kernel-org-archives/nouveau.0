From: Xavier Chantry <chantry.xavier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/2] nvfx: reset nvfx->hw_zeta
Date: Wed, 24 Nov 2010 21:50:36 +0100
Message-ID: <1290631836-21180-2-git-send-email-chantry.xavier@gmail.com>
References: <1290631836-21180-1-git-send-email-chantry.xavier@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1290631836-21180-1-git-send-email-chantry.xavier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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

Signed-off-by: Xavier Chantry <chantry.xavier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 src/gallium/drivers/nvfx/nvfx_state_fb.c |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/src/gallium/drivers/nvfx/nvfx_state_fb.c b/src/gallium/drivers/nvfx/nvfx_state_fb.c
index 73885de..90eb110 100644
--- a/src/gallium/drivers/nvfx/nvfx_state_fb.c
+++ b/src/gallium/drivers/nvfx/nvfx_state_fb.c
@@ -113,7 +113,9 @@ nvfx_framebuffer_validate(struct nvfx_context *nvfx, unsigned prepare_result)
 		nvfx->state.render_temps |= nvfx_surface_get_render_target(fb->cbufs[i], prepare_result, &nvfx->hw_rt[i]) << i;
 
 	for(; i < 4; ++i)
-		nvfx->hw_rt[i].bo = 0;
+		nvfx->hw_rt[i].bo = NULL;
+
+	nvfx->hw_zeta.bo = NULL;
 
 	if (fb->zsbuf) {
 		nvfx->state.render_temps |= nvfx_surface_get_render_target(fb->zsbuf, prepare_result, &nvfx->hw_zeta) << 7;
-- 
1.7.3.2

From: Xavier Chantry <chantry.xavier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/2] nvfx: fb->nr_cbufs <= 1 on nv30
Date: Wed, 24 Nov 2010 21:50:35 +0100
Message-ID: <1290631836-21180-1-git-send-email-chantry.xavier@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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

7e1bf946316ff99feaa3f2e85f70b45bd9a77ade changed
PIPE_CAP_MAX_RENDER_TARGETS to 1 on nv30.

Signed-off-by: Xavier Chantry <chantry.xavier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 src/gallium/drivers/nvfx/nvfx_state_fb.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/src/gallium/drivers/nvfx/nvfx_state_fb.c b/src/gallium/drivers/nvfx/nvfx_state_fb.c
index 30e48c8..73885de 100644
--- a/src/gallium/drivers/nvfx/nvfx_state_fb.c
+++ b/src/gallium/drivers/nvfx/nvfx_state_fb.c
@@ -54,7 +54,7 @@ nvfx_framebuffer_prepare(struct nvfx_context *nvfx)
 	int all_swizzled = 1;
 
 	if(!nvfx->is_nv4x)
-		assert(fb->nr_cbufs <= 2);
+		assert(fb->nr_cbufs <= 1);
 	else
 		assert(fb->nr_cbufs <= 4);
 
-- 
1.7.3.2

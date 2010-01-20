From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [mesa PATCH] nv50: fix crash in nv50_pre_pipebuffer_map
 (nv50_screen->cur_ctx)
Date: Wed, 20 Jan 2010 23:27:07 +0100
Message-ID: <20100120222707.GA2894@joi.lan>
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

nv50_pre_pipebuffer_map references screen->cur_ctx which points
to freed memory after the context is destroyed.
This crash is easily triggerable by progs/xdemos/glxcontexts.
---
 src/gallium/drivers/nv50/nv50_context.c |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/src/gallium/drivers/nv50/nv50_context.c b/src/gallium/drivers/nv50/nv50_context.c
index d598f0e..952741c 100644
--- a/src/gallium/drivers/nv50/nv50_context.c
+++ b/src/gallium/drivers/nv50/nv50_context.c
@@ -82,6 +82,10 @@ nv50_destroy(struct pipe_context *pipe)
 		so_ref(NULL, &nv50->state.vtxattr);
 
 	draw_destroy(nv50->draw);
+	
+	if (nv50->screen->cur_ctx == nv50)
+		nv50->screen->cur_ctx = NULL;
+	
 	FREE(nv50);
 }
 
-- 
1.6.6

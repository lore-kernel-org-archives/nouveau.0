From: Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
Subject: [PATCH] nv40: Correct zsa so_new size
Date: Thu, 14 Jan 2010 07:28:20 +0100
Message-ID: <1263450500-5930-1-git-send-email-luca@luca-barbieri.com>
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
Cc: Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Triggered by Doom 3.
---
 src/gallium/drivers/nv40/nv40_state.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/src/gallium/drivers/nv40/nv40_state.c b/src/gallium/drivers/nv40/nv40_state.c
index ed0ca9e..4e3a61f 100644
--- a/src/gallium/drivers/nv40/nv40_state.c
+++ b/src/gallium/drivers/nv40/nv40_state.c
@@ -445,7 +445,7 @@ nv40_depth_stencil_alpha_state_create(struct pipe_context *pipe,
 {
 	struct nv40_context *nv40 = nv40_context(pipe);
 	struct nv40_zsa_state *zsaso = CALLOC(1, sizeof(*zsaso));
-	struct nouveau_stateobj *so = so_new(4, 21, 0);
+	struct nouveau_stateobj *so = so_new(4, 22, 0);
 	struct nouveau_grobj *curie = nv40->screen->curie;
 
 	so_method(so, curie, NV40TCL_DEPTH_FUNC, 3);
-- 
1.6.3.3

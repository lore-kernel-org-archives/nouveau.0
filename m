From: Roy Spliet <r.spliet-oe7qfRrRQfeEZXFvZSAUrfP6llvjuJOh@public.gmane.org>
Subject: [PATCH 1/4] nv30: Fix generic passing to fragment program
	in NV34
Date: Thu, 10 May 2012 00:06:30 +0200
Message-ID: <1336601193-19147-2-git-send-email-r.spliet@student.tudelft.nl>
References: <1336601193-19147-1-git-send-email-r.spliet@student.tudelft.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1336601193-19147-1-git-send-email-r.spliet-oe7qfRrRQfeEZXFvZSAUrfP6llvjuJOh@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Nouveau mailinglist <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Cc: Roy Spliet <r.spliet-oe7qfRrRQfeEZXFvZSAUrfP6llvjuJOh@public.gmane.org>
List-Id: nouveau.vger.kernel.org

fixes over 800 piglit cases in quick-driver suite for NV34

Signed-off-by: Roy Spliet <r.spliet-oe7qfRrRQfeEZXFvZSAUrfP6llvjuJOh@public.gmane.org>
---
 src/gallium/drivers/nv30/nvfx_fragprog.c |    8 ++++++--
 1 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/src/gallium/drivers/nv30/nvfx_fragprog.c b/src/gallium/drivers/nv30/nvfx_fragprog.c
index 592ad21..da6e234 100644
--- a/src/gallium/drivers/nv30/nvfx_fragprog.c
+++ b/src/gallium/drivers/nv30/nvfx_fragprog.c
@@ -959,8 +959,12 @@ nvfx_fragprog_assign_generic(struct nv30_context *nvfx, struct nvfx_fpc *fpc,
          for (hw = 0; hw < num_texcoords; hw++) {
             if (fpc->fp->texcoord[hw] == 0xffff) {
                fpc->fp->texcoord[hw] = fdec->Semantic.Index;
-               if (hw <= 7) fpc->fp->vp_or |= (0x00004000 << hw);
-               else         fpc->fp->vp_or |= (0x00001000 << (hw - 8));
+               if (hw <= 7) {
+                  fpc->fp->vp_or |= (0x00004000 << hw);
+                  fpc->fp->samplers |= (0x1 << hw);
+               } else {
+                  fpc->fp->vp_or |= (0x00001000 << (hw - 8));
+               }
                if (fdec->Semantic.Index == 9)
                   fpc->fp->point_sprite_control |= (0x00000100 << hw);
                hw = NVFX_FP_OP_INPUT_SRC_TC(hw);
-- 
1.7.7.6

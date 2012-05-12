From: Roy Spliet <r.spliet-oe7qfRrRQfeEZXFvZSAUrfP6llvjuJOh@public.gmane.org>
Subject: [PATCH 2/4] nv30/shader: SSG,
	LIT only requires one source register
Date: Sat, 12 May 2012 03:42:30 +0200
Message-ID: <1336786951-3325-3-git-send-email-r.spliet@student.tudelft.nl>
References: <[Patches]mesa/nv30: Diverse set of patches that improve NV3x
	render quality>
	<1336786951-3325-1-git-send-email-r.spliet@student.tudelft.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1336786951-3325-1-git-send-email-r.spliet-oe7qfRrRQfeEZXFvZSAUrfP6llvjuJOh@public.gmane.org>
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

Fixes crashing due to assertion error

Signed-off-by: Roy Spliet <r.spliet-oe7qfRrRQfeEZXFvZSAUrfP6llvjuJOh@public.gmane.org>
---
 src/gallium/drivers/nv30/nvfx_fragprog.c |    2 +-
 src/gallium/drivers/nv30/nvfx_vertprog.c |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/src/gallium/drivers/nv30/nvfx_fragprog.c b/src/gallium/drivers/nv30/nvfx_fragprog.c
index 915b926..121c623 100644
--- a/src/gallium/drivers/nv30/nvfx_fragprog.c
+++ b/src/gallium/drivers/nv30/nvfx_fragprog.c
@@ -623,7 +623,7 @@ nvfx_fragprog_parse_instruction(struct nv30_context* nvfx, struct nvfx_fpc *fpc,
       break;
    case TGSI_OPCODE_LIT:
       if(!nvfx->is_nv4x)
-         nvfx_fp_emit(fpc, arith(sat, LIT_NV30, dst, mask, src[0], src[1], src[2]));
+         nvfx_fp_emit(fpc, arith(sat, LIT_NV30, dst, mask, src[0], none, none));
       else {
          /* we use FLT_MIN, so that log2 never gives -infinity, and thus multiplication by
           * specular 0 always gives 0, so that ex2 gives 1, to satisfy the 0^0 = 1 requirement
diff --git a/src/gallium/drivers/nv30/nvfx_vertprog.c b/src/gallium/drivers/nv30/nvfx_vertprog.c
index 82972b3..f41f82d 100644
--- a/src/gallium/drivers/nv30/nvfx_vertprog.c
+++ b/src/gallium/drivers/nv30/nvfx_vertprog.c
@@ -668,7 +668,7 @@ nvfx_vertprog_parse_instruction(struct nv30_context *nv30, struct nvfx_vpc *vpc,
       nvfx_vp_emit(vpc, arith(sat, VEC, SNE, dst, mask, src[0], src[1], none));
       break;
    case TGSI_OPCODE_SSG:
-      nvfx_vp_emit(vpc, arith(sat, VEC, SSG, dst, mask, src[0], src[1], none));
+      nvfx_vp_emit(vpc, arith(sat, VEC, SSG, dst, mask, src[0], none, none));
       break;
    case TGSI_OPCODE_STR:
       nvfx_vp_emit(vpc, arith(sat, VEC, STR, dst, mask, src[0], src[1], none));
-- 
1.7.7.6

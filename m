From: Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
Subject: [PATCH 1/2] nv40: don't crash on empty fragment program
Date: Sun, 17 Jan 2010 22:35:59 +0100
Message-ID: <1263764160-8891-1-git-send-email-luca@luca-barbieri.com>
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
To: mesa3d-dev-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
List-Id: nouveau.vger.kernel.org

---
 src/gallium/drivers/nv40/nv40_fragprog.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/src/gallium/drivers/nv40/nv40_fragprog.c b/src/gallium/drivers/nv40/nv40_fragprog.c
index 1237066..209d211 100644
--- a/src/gallium/drivers/nv40/nv40_fragprog.c
+++ b/src/gallium/drivers/nv40/nv40_fragprog.c
@@ -843,7 +843,8 @@ nv40_fragprog_translate(struct nv40_context *nv40,
 	fp->fp_control |= fpc->num_regs << NV40TCL_FP_CONTROL_TEMP_COUNT_SHIFT;
 
 	/* Terminate final instruction */
-	fp->insn[fpc->inst_offset] |= 0x00000001;
+	if(fp->insn)
+                fp->insn[fpc->inst_offset] |= 0x00000001;
 
 	/* Append NOP + END instruction, may or may not be necessary. */
 	fpc->inst_offset = fp->insn_len;
-- 
1.6.3.3

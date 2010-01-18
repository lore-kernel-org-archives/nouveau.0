From: Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
Subject: [PATCH] nv40: add missing vertprog setcond instructions
	(v2)
Date: Mon, 18 Jan 2010 18:33:40 +0100
Message-ID: <1263836020-992-1-git-send-email-luca@luca-barbieri.com>
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

Trivially adds SEQ, SGT, SLE, SNE, SFL, STR and SSG which were missing.

Changed to preserv alphabetic order of cases.
---
 src/gallium/drivers/nv40/nv40_vertprog.c |   21 +++++++++++++++++++++
 1 files changed, 21 insertions(+), 0 deletions(-)

diff --git a/src/gallium/drivers/nv40/nv40_vertprog.c b/src/gallium/drivers/nv40/nv40_vertprog.c
index 80f2a87..2f86e64 100644
--- a/src/gallium/drivers/nv40/nv40_vertprog.c
+++ b/src/gallium/drivers/nv40/nv40_vertprog.c
@@ -545,12 +545,33 @@ nv40_vertprog_parse_instruction(struct nv40_vpc *vpc,
 	case TGSI_OPCODE_RSQ:
 		arith(vpc, 1, OP_RSQ, dst, mask, none, none, abs(src[0]));
 		break;
+	case TGSI_OPCODE_SEQ:
+		arith(vpc, 0, OP_SEQ, dst, mask, src[0], src[1], none);
+		break;
+	case TGSI_OPCODE_SFL:
+		arith(vpc, 0, OP_SFL, dst, mask, src[0], src[1], none);
+		break;
 	case TGSI_OPCODE_SGE:
 		arith(vpc, 0, OP_SGE, dst, mask, src[0], src[1], none);
 		break;
+	case TGSI_OPCODE_SGT:
+		arith(vpc, 0, OP_SGT, dst, mask, src[0], src[1], none);
+		break;
+	case TGSI_OPCODE_SLE:
+		arith(vpc, 0, OP_SLE, dst, mask, src[0], src[1], none);
+		break;
 	case TGSI_OPCODE_SLT:
 		arith(vpc, 0, OP_SLT, dst, mask, src[0], src[1], none);
 		break;
+	case TGSI_OPCODE_SNE:
+		arith(vpc, 0, OP_SNE, dst, mask, src[0], src[1], none);
+		break;
+	case TGSI_OPCODE_SSG:
+		arith(vpc, 0, OP_SSG, dst, mask, src[0], src[1], none);
+		break;
+	case TGSI_OPCODE_STR:
+		arith(vpc, 0, OP_STR, dst, mask, src[0], src[1], none);
+		break;
 	case TGSI_OPCODE_SUB:
 		arith(vpc, 0, OP_ADD, dst, mask, src[0], none, neg(src[1]));
 		break;
-- 
1.6.3.3

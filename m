From: Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
Subject: [PATCH] NV30/NV40 CMP and SCS src == dst handling
Date: Sat, 26 Dec 2009 08:12:15 +0100
Message-ID: <ff13bc9a0912252312j43e7343bt55248f1d9a4a66b4@mail.gmail.com>
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
List-Id: nouveau.vger.kernel.org

CMP and SCS can produce incorrect results if the source and
destination are the same.
This patch should fix the issues.
CMP is fixed by predicating both moves.
SCS by changing the order if the source component is X.


diff --git a/src/gallium/drivers/nv30/nv30_fragprog.c
b/src/gallium/drivers/nv30/nv30_fragprog.c
index 40965a9..dc4e583 100644
--- a/src/gallium/drivers/nv30/nv30_fragprog.c
+++ b/src/gallium/drivers/nv30/nv30_fragprog.c
@@ -435,10 +435,11 @@ nv30_fragprog_parse_instruction(struct nv30_fpc *fpc,
 		arith(fpc, sat, ADD, dst, mask, src[0], src[1], none);
 		break;
 	case TGSI_OPCODE_CMP:
-		tmp = temp(fpc);
-		arith(fpc, sat, MOV, dst, mask, src[2], none, none);
+		tmp = nv30_sr(NV30SR_NONE, 0);
 		tmp.cc_update = 1;
 		arith(fpc, 0, MOV, tmp, 0xf, src[0], none, none);
+		dst.cc_test = NV30_VP_INST_COND_GE;
+		arith(fpc, sat, MOV, dst, mask, src[2], none, none);
 		dst.cc_test = NV30_VP_INST_COND_LT;
 		arith(fpc, sat, MOV, dst, mask, src[1], none, none);
 		break;
@@ -517,13 +518,28 @@ nv30_fragprog_parse_instruction(struct nv30_fpc *fpc,
 		arith(fpc, sat, RSQ, dst, mask, abs(swz(src[0], X, X, X, X)), none, none);
 		break;
 	case TGSI_OPCODE_SCS:
-		if (mask & MASK_X) {
-			arith(fpc, sat, COS, dst, MASK_X,
-			      swz(src[0], X, X, X, X), none, none);
+		/* avoid overwriting the source */
+		if(src[0].swz[SWZ_X] != SWZ_X)
+		{
+			if (mask & MASK_X) {
+				arith(fpc, sat, COS, dst, MASK_X,
+				      swz(src[0], X, X, X, X), none, none);
+			}
+			if (mask & MASK_Y) {
+				arith(fpc, sat, SIN, dst, MASK_Y,
+				      swz(src[0], X, X, X, X), none, none);
+			}
 		}
-		if (mask & MASK_Y) {
-			arith(fpc, sat, SIN, dst, MASK_Y,
-			      swz(src[0], X, X, X, X), none, none);
+		else
+		{
+			if (mask & MASK_Y) {
+				arith(fpc, sat, SIN, dst, MASK_Y,
+				      swz(src[0], X, X, X, X), none, none);
+			}
+			if (mask & MASK_X) {
+				arith(fpc, sat, COS, dst, MASK_X,
+				      swz(src[0], X, X, X, X), none, none);
+			}
 		}
 		break;
 	case TGSI_OPCODE_SIN:
diff --git a/src/gallium/drivers/nv40/nv40_fragprog.c
b/src/gallium/drivers/nv40/nv40_fragprog.c
index 1bf1672..468d350 100644
--- a/src/gallium/drivers/nv40/nv40_fragprog.c
+++ b/src/gallium/drivers/nv40/nv40_fragprog.c
@@ -445,10 +445,11 @@ nv40_fragprog_parse_instruction(struct nv40_fpc *fpc,
 		arith(fpc, sat, ADD, dst, mask, src[0], src[1], none);
 		break;
 	case TGSI_OPCODE_CMP:
-		tmp = temp(fpc);
-		arith(fpc, sat, MOV, dst, mask, src[2], none, none);
+		tmp = nv40_sr(NV40SR_NONE, 0);
 		tmp.cc_update = 1;
 		arith(fpc, 0, MOV, tmp, 0xf, src[0], none, none);
+		dst.cc_test = NV40_VP_INST_COND_GE;
+		arith(fpc, sat, MOV, dst, mask, src[2], none, none);
 		dst.cc_test = NV40_VP_INST_COND_LT;
 		arith(fpc, sat, MOV, dst, mask, src[1], none, none);
 		break;
@@ -573,13 +574,28 @@ nv40_fragprog_parse_instruction(struct nv40_fpc *fpc,
 		      neg(swz(tmp, X, X, X, X)), none, none);
 		break;
 	case TGSI_OPCODE_SCS:
-		if (mask & MASK_X) {
-			arith(fpc, sat, COS, dst, MASK_X,
-			      swz(src[0], X, X, X, X), none, none);
+		/* avoid overwriting the source */
+		if(src[0].swz[SWZ_X] != SWZ_X)
+		{
+			if (mask & MASK_X) {
+				arith(fpc, sat, COS, dst, MASK_X,
+				      swz(src[0], X, X, X, X), none, none);
+			}
+			if (mask & MASK_Y) {
+				arith(fpc, sat, SIN, dst, MASK_Y,
+				      swz(src[0], X, X, X, X), none, none);
+			}
 		}
-		if (mask & MASK_Y) {
-			arith(fpc, sat, SIN, dst, MASK_Y,
-			      swz(src[0], X, X, X, X), none, none);
+		else
+		{
+			if (mask & MASK_Y) {
+				arith(fpc, sat, SIN, dst, MASK_Y,
+				      swz(src[0], X, X, X, X), none, none);
+			}
+			if (mask & MASK_X) {
+				arith(fpc, sat, COS, dst, MASK_X,
+				      swz(src[0], X, X, X, X), none, none);
+			}
 		}
 		break;
 	case TGSI_OPCODE_SEQ:

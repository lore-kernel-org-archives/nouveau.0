From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH 04/12] nv50/ir/tgsi: TGSI_OPCODE_POW replicates
	its result
Date: Tue, 20 May 2014 19:39:58 -0400
Message-ID: <1400629206-4447-5-git-send-email-imirkin@alum.mit.edu>
References: <1400629206-4447-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1400629206-4447-1-git-send-email-imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: "10.2" <mesa-stable-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Christoph Bumiller <christoph.bumiller-D4IDLmZPRBc@public.gmane.org>
List-Id: nouveau.vger.kernel.org

From: Christoph Bumiller <christoph.bumiller-D4IDLmZPRBc@public.gmane.org>

Reviewed-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: "10.2" <mesa-stable-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
---
 src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp b/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp
index 3e44bf9..e24be51 100644
--- a/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp
@@ -2199,7 +2199,6 @@ Converter::handleInstruction(const struct tgsi_full_instruction *insn)
    case TGSI_OPCODE_IMUL_HI:
    case TGSI_OPCODE_UMUL_HI:
    case TGSI_OPCODE_OR:
-   case TGSI_OPCODE_POW:
    case TGSI_OPCODE_SHL:
    case TGSI_OPCODE_ISHR:
    case TGSI_OPCODE_USHR:
@@ -2254,6 +2253,11 @@ Converter::handleInstruction(const struct tgsi_full_instruction *insn)
       FOR_EACH_DST_ENABLED_CHANNEL(0, c, tgsi)
          mkOp1(OP_MOV, TYPE_U32, dst0[c], fetchSrc(0, c));
       break;
+   case TGSI_OPCODE_POW:
+      val0 = mkOp2v(op, TYPE_F32, getScratch(), fetchSrc(0, 0), fetchSrc(1, 0));
+      FOR_EACH_DST_ENABLED_CHANNEL(0, c, tgsi)
+         mkOp1(OP_MOV, TYPE_F32, dst0[c], val0);
+      break;
    case TGSI_OPCODE_EX2:
    case TGSI_OPCODE_LG2:
       val0 = mkOp1(op, TYPE_F32, getScratch(), fetchSrc(0, 0))->getDef(0);
-- 
1.8.5.5

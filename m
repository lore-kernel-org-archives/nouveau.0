From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH 1/3] gk110/ir: emit texbar the same way that the
	blob does
Date: Fri,  6 Jun 2014 15:43:41 -0400
Message-ID: <1402083823-23828-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: "10.2" <mesa-stable-PD4FTy7X32n+Q2PDmZ3ati5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: "10.2" <mesa-stable-PD4FTy7X32n+Q2PDmZ3ati5qC8QIuHrW@public.gmane.org>
---
 src/gallium/drivers/nouveau/codegen/nv50_ir_emit_gk110.cpp | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_emit_gk110.cpp b/src/gallium/drivers/nouveau/codegen/nv50_ir_emit_gk110.cpp
index b8d0d3e..d566c99 100644
--- a/src/gallium/drivers/nouveau/codegen/nv50_ir_emit_gk110.cpp
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_emit_gk110.cpp
@@ -967,7 +967,7 @@ void CodeEmitterGK110::emitSELP(const Instruction *i)
 
 void CodeEmitterGK110::emitTEXBAR(const Instruction *i)
 {
-   code[0] = 0x00000002 | (i->subOp << 23);
+   code[0] = 0x0000003e | (i->subOp << 23);
    code[1] = 0x77000000;
 
    emitPredicate(i);
-- 
1.8.5.5

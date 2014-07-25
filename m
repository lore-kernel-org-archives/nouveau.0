From: Tobias Klausmann <tobias.johannes.klausmann-AqjdNwhu20eELgA04lAiVw@public.gmane.org>
Subject: [PATCH] nv50/ir: (trivial) initialize pointer to silence
	warning
Date: Fri, 25 Jul 2014 17:36:55 +0200
Message-ID: <1406302615-12971-1-git-send-email-tobias.johannes.klausmann@mni.thm.de>
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
To: imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Signed-off-by: Tobias Klausmann <tobias.johannes.klausmann-AqjdNwhu20eELgA04lAiVw@public.gmane.org>
---
 src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp b/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp
index 14b6d68..7aa4728 100644
--- a/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp
@@ -2139,7 +2139,7 @@ Converter::handleINTERP(Value *dst[4])
 {
    // Check whether the input is linear. All other attributes ignored.
    Instruction *insn;
-   Value *offset = NULL, *ptr = NULL, *w;
+   Value *offset = NULL, *ptr = NULL, *w = NULL;
    bool linear;
    operation op;
    int c, mode;
-- 
1.8.4.5

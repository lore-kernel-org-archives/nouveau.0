From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH] nv50/ir: avoid deleting pseudo instructions too
	early
Date: Wed, 24 Sep 2014 21:47:55 -0400
Message-ID: <1411609675-17670-1-git-send-email-imirkin@alum.mit.edu>
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
To: mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: "10.2 10.3" <mesa-stable-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

What happens is that a SPLIT operation is part of the spill node, and as
a pseudo op, the instruction gets erased after processing its first def.
However the later defs still need to refer to it, so instead delay
spilling until after that whole RA node is done processing.

Bugzilla: https://bugs.freedesktop.org/show_bug.cgi?id=79462
Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: "10.2 10.3" <mesa-stable-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
---
 src/gallium/drivers/nouveau/codegen/nv50_ir_ra.cpp | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_ra.cpp b/src/gallium/drivers/nouveau/codegen/nv50_ir_ra.cpp
index 4b105b4..d47fed2 100644
--- a/src/gallium/drivers/nouveau/codegen/nv50_ir_ra.cpp
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_ra.cpp
@@ -25,6 +25,7 @@
 
 #include <stack>
 #include <limits>
+#include <tr1/unordered_set>
 
 namespace nv50_ir {
 
@@ -1547,6 +1548,11 @@ SpillCodeInserter::run(const std::list<ValuePair>& lst)
       LValue *lval = it->first->asLValue();
       Symbol *mem = it->second ? it->second->asSym() : NULL;
 
+      // Keep track of which instructions to delete later. Deleting them
+      // inside the loop is unsafe since a single instruction may have
+      // multiple destinations that all need to be spilled (like OP_SPLIT).
+      std::tr1::unordered_set<Instruction *> to_del;
+
       for (Value::DefIterator d = lval->defs.begin(); d != lval->defs.end();
            ++d) {
          Value *slot = mem ?
@@ -1579,7 +1585,7 @@ SpillCodeInserter::run(const std::list<ValuePair>& lst)
             d = lval->defs.erase(d);
             --d;
             if (slot->reg.file == FILE_MEMORY_LOCAL)
-               delete_Instruction(func->getProgram(), defi);
+               to_del.insert(defi);
             else
                defi->setDef(0, slot);
          } else {
@@ -1587,6 +1593,9 @@ SpillCodeInserter::run(const std::list<ValuePair>& lst)
          }
       }
 
+      for (std::tr1::unordered_set<Instruction *>::const_iterator it = to_del.begin();
+           it != to_del.end(); ++it)
+         delete_Instruction(func->getProgram(), *it);
    }
 
    // TODO: We're not trying to reuse old slots in a potential next iteration.
-- 
1.8.5.5

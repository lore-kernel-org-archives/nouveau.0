From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH 1/2] nvc0/ir: avoid infinite recursion when
	finding first uses of tex
Date: Sat, 30 Aug 2014 18:02:29 -0400
Message-ID: <1409436150-5979-1-git-send-email-imirkin@alum.mit.edu>
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

In certain circumstances, findFirstUses could end up doubling back on
instructions it had already processed, resulting in an infinite
recursion. Avoid this by keeping track of already-visited instructions.

Bugzilla: https://bugs.freedesktop.org/show_bug.cgi?id=83079
Tested-by: Tobias Klausmann <tobias.johannes.klausmann-AqjdNwhu20eELgA04lAiVw@public.gmane.org>
Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: "10.2 10.3" <mesa-stable-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
---
 .../nouveau/codegen/nv50_ir_lowering_nvc0.cpp      | 32 +++++++++++++++++-----
 .../nouveau/codegen/nv50_ir_lowering_nvc0.h        |  5 +++-
 2 files changed, 29 insertions(+), 8 deletions(-)

diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nvc0.cpp b/src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nvc0.cpp
index 7da9b0b..92f9a15 100644
--- a/src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nvc0.cpp
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nvc0.cpp
@@ -174,15 +174,31 @@ NVC0LegalizePostRA::findOverwritingDefs(const Instruction *texi,
 }
 
 void
-NVC0LegalizePostRA::findFirstUses(const Instruction *texi,
-                                  const Instruction *insn,
-                                  std::list<TexUse> &uses)
+NVC0LegalizePostRA::findFirstUses(
+      const Instruction *texi,
+      const Instruction *insn,
+      std::list<TexUse> &uses,
+      std::tr1::unordered_set<const Instruction *>& visited)
 {
    for (int d = 0; insn->defExists(d); ++d) {
       Value *v = insn->getDef(d);
       for (Value::UseIterator u = v->uses.begin(); u != v->uses.end(); ++u) {
          Instruction *usei = (*u)->getInsn();
 
+         /* XXX HACK ALERT XXX
+          *
+          * This shouldn't have to be here, we should always be making forward
+          * progress by looking at the uses. However this somehow does not
+          * appear to be the case. Probably because this is being done right
+          * after RA, when the defs/uses lists have been messed with by node
+          * merging. This should probably be moved to being done right before
+          * RA. But this will do for now.
+          */
+         if (visited.find(usei) != visited.end())
+            continue;
+
+         visited.insert(usei);
+
          if (usei->op == OP_PHI || usei->op == OP_UNION) {
             // need a barrier before WAW cases
             for (int s = 0; usei->srcExists(s); ++s) {
@@ -197,11 +213,11 @@ NVC0LegalizePostRA::findFirstUses(const Instruction *texi,
              usei->op == OP_PHI ||
              usei->op == OP_UNION) {
             // these uses don't manifest in the machine code
-            findFirstUses(texi, usei, uses);
+            findFirstUses(texi, usei, uses, visited);
          } else
          if (usei->op == OP_MOV && usei->getDef(0)->equals(usei->getSrc(0)) &&
              usei->subOp != NV50_IR_SUBOP_MOV_FINAL) {
-            findFirstUses(texi, usei, uses);
+            findFirstUses(texi, usei, uses, visited);
          } else {
             addTexUse(uses, usei, insn);
          }
@@ -257,8 +273,10 @@ NVC0LegalizePostRA::insertTextureBarriers(Function *fn)
    uses = new std::list<TexUse>[texes.size()];
    if (!uses)
       return false;
-   for (size_t i = 0; i < texes.size(); ++i)
-      findFirstUses(texes[i], texes[i], uses[i]);
+   for (size_t i = 0; i < texes.size(); ++i) {
+      std::tr1::unordered_set<const Instruction *> visited;
+      findFirstUses(texes[i], texes[i], uses[i], visited);
+   }
 
    // determine the barrier level at each use
    for (size_t i = 0; i < texes.size(); ++i) {
diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nvc0.h b/src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nvc0.h
index 7f39c28..d8ff5cd 100644
--- a/src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nvc0.h
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nvc0.h
@@ -20,6 +20,8 @@
  * OTHER DEALINGS IN THE SOFTWARE.
  */
 
+#include <tr1/unordered_set>
+
 #include "codegen/nv50_ir.h"
 #include "codegen/nv50_ir_build_util.h"
 
@@ -69,7 +71,8 @@ private:
    bool insertTextureBarriers(Function *);
    inline bool insnDominatedBy(const Instruction *, const Instruction *) const;
    void findFirstUses(const Instruction *tex, const Instruction *def,
-                      std::list<TexUse>&);
+                      std::list<TexUse>&,
+                      std::tr1::unordered_set<const Instruction *>&);
    void findOverwritingDefs(const Instruction *tex, Instruction *insn,
                             const BasicBlock *term,
                             std::list<TexUse>&);
-- 
1.8.5.5

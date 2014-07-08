From: Tobias Klausmann <tobias.johannes.klausmann-AqjdNwhu20eELgA04lAiVw@public.gmane.org>
Subject: [PATCH] nv50/ir: use unordered_set instead of list to
	keep our instructions in uses
Date: Tue,  8 Jul 2014 04:19:13 +0200
Message-ID: <1404785953-27151-1-git-send-email-tobias.johannes.klausmann@mni.thm.de>
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
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org
List-Id: nouveau.vger.kernel.org

This shortens runtime of piglit test fp-long-alu to ~22s

No piglit regressions observed on nvc0!

Signed-off-by: Tobias Klausmann <tobias.johannes.klausmann-AqjdNwhu20eELgA04lAiVw@public.gmane.org>
---
 src/gallium/drivers/nouveau/codegen/nv50_ir.cpp          | 6 +++---
 src/gallium/drivers/nouveau/codegen/nv50_ir.h            | 7 ++++---
 src/gallium/drivers/nouveau/codegen/nv50_ir_peephole.cpp | 2 +-
 src/gallium/drivers/nouveau/codegen/nv50_ir_ra.cpp       | 4 ++--
 4 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir.cpp b/src/gallium/drivers/nouveau/codegen/nv50_ir.cpp
index 13f8cf2..ca3c806 100644
--- a/src/gallium/drivers/nouveau/codegen/nv50_ir.cpp
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir.cpp
@@ -141,9 +141,9 @@ ValueRef::set(Value *refVal)
    if (value == refVal)
       return;
    if (value)
-      value->uses.remove(this);
+      value->uses.erase(this);
    if (refVal)
-      refVal->uses.push_back(this);
+      refVal->uses.insert(this);
 
    value = refVal;
 }
@@ -206,7 +206,7 @@ ValueDef::replace(const ValueRef &repVal, bool doSet)
       return;
 
    while (!value->uses.empty()) {
-      ValueRef *ref = value->uses.front();
+      ValueRef *ref = *value->uses.begin();
       ref->set(repVal.get());
       ref->mod *= repVal.mod;
    }
diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir.h b/src/gallium/drivers/nouveau/codegen/nv50_ir.h
index 8844030..0ff5e5d 100644
--- a/src/gallium/drivers/nouveau/codegen/nv50_ir.h
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir.h
@@ -29,6 +29,7 @@
 #include <deque>
 #include <list>
 #include <vector>
+#include <tr1/unordered_set>
 
 #include "codegen/nv50_ir_util.h"
 #include "codegen/nv50_ir_graph.h"
@@ -581,10 +582,10 @@ public:
 
    static inline Value *get(Iterator&);
 
-   std::list<ValueRef *> uses;
+   std::tr1::unordered_set<ValueRef *> uses;
    std::list<ValueDef *> defs;
-   typedef std::list<ValueRef *>::iterator UseIterator;
-   typedef std::list<ValueRef *>::const_iterator UseCIterator;
+   typedef std::tr1::unordered_set<ValueRef *>::iterator UseIterator;
+   typedef std::tr1::unordered_set<ValueRef *>::const_iterator UseCIterator;
    typedef std::list<ValueDef *>::iterator DefIterator;
    typedef std::list<ValueDef *>::const_iterator DefCIterator;
 
diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_peephole.cpp b/src/gallium/drivers/nouveau/codegen/nv50_ir_peephole.cpp
index c162ac4..8d052c5 100644
--- a/src/gallium/drivers/nouveau/codegen/nv50_ir_peephole.cpp
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_peephole.cpp
@@ -686,7 +686,7 @@ ConstantFolding::tryCollapseChainedMULs(Instruction *mul2,
       // b = mul a, imm
       // d = mul b, c   -> d = mul_x_imm a, c
       int s2, t2;
-      insn = mul2->getDef(0)->uses.front()->getInsn();
+      insn = (*mul2->getDef(0)->uses.begin())->getInsn();
       if (!insn)
          return;
       mul1 = mul2;
diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_ra.cpp b/src/gallium/drivers/nouveau/codegen/nv50_ir_ra.cpp
index e4f56b1..6c83a60 100644
--- a/src/gallium/drivers/nouveau/codegen/nv50_ir_ra.cpp
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_ra.cpp
@@ -983,7 +983,7 @@ GCRA::doCoalesce(ArrayList& insns, unsigned int mask)
             break;
          i = NULL;
          if (!insn->getDef(0)->uses.empty())
-            i = insn->getDef(0)->uses.front()->getInsn();
+            i = (*insn->getDef(0)->uses.begin())->getInsn();
          // if this is a contraint-move there will only be a single use
          if (i && i->op == OP_MERGE) // do we really still need this ?
             break;
@@ -1559,7 +1559,7 @@ SpillCodeInserter::run(const std::list<ValuePair>& lst)
          // Unspill at each use *before* inserting spill instructions,
          // we don't want to have the spill instructions in the use list here.
          while (!dval->uses.empty()) {
-            ValueRef *u = dval->uses.front();
+            ValueRef *u = *dval->uses.begin();
             Instruction *usei = u->getInsn();
             assert(usei);
             if (usei->isPseudo()) {
-- 
1.8.4.5

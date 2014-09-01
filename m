From: Tobias Klausmann <tobias.johannes.klausmann@mni.thm.de>
Subject: [PATCH] nv50/ir: use unordered_set instead of list to
	keep track of var defs
Date: Mon,  1 Sep 2014 20:30:28 +0200
Message-ID: <1409596228-21159-1-git-send-email-tobias.johannes.klausmann@mni.thm.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <mesa-dev-bounces@lists.freedesktop.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/mesa-dev>,
 <mailto:mesa-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/mesa-dev>
List-Post: <mailto:mesa-dev@lists.freedesktop.org>
List-Help: <mailto:mesa-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/mesa-dev>,
 <mailto:mesa-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: mesa-dev-bounces@lists.freedesktop.org
Sender: "mesa-dev" <mesa-dev-bounces@lists.freedesktop.org>
To: mesa-dev@lists.freedesktop.org, nouveau@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

The set of variable defs does not need to be ordered in any way, and
removing/adding elements is a fairly common operation in various
optimization passes.

This shortens runtime of piglit test fp-long-alu to ~11s from ~22s

No piglit regressions observed on nvc0!

Signed-off-by: Tobias Klausmann <tobias.johannes.klausmann@mni.thm.de>
---
 src/gallium/drivers/nouveau/codegen/nv50_ir.cpp    |  4 ++--
 src/gallium/drivers/nouveau/codegen/nv50_ir.h      |  7 +++---
 .../drivers/nouveau/codegen/nv50_ir_inlines.h      | 25 ++++++++++++++++------
 .../nouveau/codegen/nv50_ir_lowering_nv50.cpp      |  4 ++--
 src/gallium/drivers/nouveau/codegen/nv50_ir_ra.cpp | 11 +++++-----
 5 files changed, 31 insertions(+), 20 deletions(-)

diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir.cpp b/src/gallium/drivers/nouveau/codegen/nv50_ir.cpp
index ca3c806..3138118 100644
--- a/src/gallium/drivers/nouveau/codegen/nv50_ir.cpp
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir.cpp
@@ -154,9 +154,9 @@ ValueDef::set(Value *defVal)
    if (value == defVal)
       return;
    if (value)
-      value->defs.remove(this);
+      value->defs.erase(this);
    if (defVal)
-      defVal->defs.push_back(this);
+      defVal->defs.insert(this);
 
    value = defVal;
 }
diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir.h b/src/gallium/drivers/nouveau/codegen/nv50_ir.h
index 0ff5e5d..ec80796 100644
--- a/src/gallium/drivers/nouveau/codegen/nv50_ir.h
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir.h
@@ -567,6 +567,7 @@ public:
 
    inline Value *rep() const { return join; }
 
+   inline Instruction *findOwnDefInsn() const;
    inline Instruction *getUniqueInsn() const;
    inline Instruction *getInsn() const; // use when uniqueness is certain
 
@@ -583,11 +584,11 @@ public:
    static inline Value *get(Iterator&);
 
    std::tr1::unordered_set<ValueRef *> uses;
-   std::list<ValueDef *> defs;
+   std::tr1::unordered_set<ValueDef *> defs;
    typedef std::tr1::unordered_set<ValueRef *>::iterator UseIterator;
    typedef std::tr1::unordered_set<ValueRef *>::const_iterator UseCIterator;
-   typedef std::list<ValueDef *>::iterator DefIterator;
-   typedef std::list<ValueDef *>::const_iterator DefCIterator;
+   typedef std::tr1::unordered_set<ValueDef *>::iterator DefIterator;
+   typedef std::tr1::unordered_set<ValueDef *>::const_iterator DefCIterator;
 
    int id;
    Storage reg;
diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_inlines.h b/src/gallium/drivers/nouveau/codegen/nv50_ir_inlines.h
index 255324f..e9c6c21 100644
--- a/src/gallium/drivers/nouveau/codegen/nv50_ir_inlines.h
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_inlines.h
@@ -205,19 +205,25 @@ const LValue *ValueDef::preSSA() const
 
 Instruction *Value::getInsn() const
 {
-   return defs.empty() ? NULL : defs.front()->getInsn();
+   return defs.empty() ? NULL : (*defs.begin())->getInsn();
+}
+
+Instruction *Value::findOwnDefInsn() const
+{
+   for (DefCIterator it = defs.begin(); it != defs.end(); ++it)
+      if ((*it)->get() == this)
+         return (*it)->getInsn();
+   /* should be unreachable */
+   return NULL;
 }
 
 Instruction *Value::getUniqueInsn() const
 {
    if (defs.empty())
       return NULL;
-
    // after regalloc, the definitions of coalesced values are linked
    if (join != this) {
-      for (DefCIterator it = defs.begin(); it != defs.end(); ++it)
-         if ((*it)->get() == this)
-            return (*it)->getInsn();
+      return findOwnDefInsn();
       // should be unreachable and trigger assertion at the end
    }
 #ifdef DEBUG
@@ -230,8 +236,13 @@ Instruction *Value::getUniqueInsn() const
          WARN("value %%%i not uniquely defined\n", id); // return NULL ?
    }
 #endif
-   assert(defs.front()->get() == this);
-   return defs.front()->getInsn();
+
+   /* It is not guaranteed that this is the first in the set, lets find it */
+   if ((*defs.begin())->get() != this) {
+      return findOwnDefInsn();
+   }
+   assert((*defs.begin())->get() == this);
+   return (*defs.begin())->getInsn();
 }
 
 inline bool Instruction::constrainedDefs() const
diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nv50.cpp b/src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nv50.cpp
index e283424..f13e0d4 100644
--- a/src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nv50.cpp
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nv50.cpp
@@ -211,7 +211,7 @@ NV50LegalizePostRA::visit(Function *fn)
    if (outWrites) {
       for (std::list<Instruction *>::iterator it = outWrites->begin();
            it != outWrites->end(); ++it)
-         (*it)->getSrc(1)->defs.front()->getInsn()->setDef(0, (*it)->getSrc(0));
+         (*(*it)->getSrc(1)->defs.begin())->getInsn()->setDef(0, (*it)->getSrc(0));
       // instructions will be deleted on exit
       outWrites->clear();
    }
@@ -343,7 +343,7 @@ NV50LegalizeSSA::propagateWriteToOutput(Instruction *st)
       return;
 
    // check def instruction can store
-   Instruction *di = st->getSrc(1)->defs.front()->getInsn();
+   Instruction *di =(*st->getSrc(1)->defs.begin())->getInsn();
 
    // TODO: move exports (if beneficial) in common opt pass
    if (di->isPseudo() || isTextureOp(di->op) || di->defCount(0xff, true) > 1)
diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_ra.cpp b/src/gallium/drivers/nouveau/codegen/nv50_ir_ra.cpp
index 5ab6570..7bb28c6 100644
--- a/src/gallium/drivers/nouveau/codegen/nv50_ir_ra.cpp
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_ra.cpp
@@ -834,7 +834,7 @@ GCRA::coalesceValues(Value *dst, Value *src, bool force)
    assert(rep->join == rep && val->join == rep);
 
    // add val's definitions to rep and extend the live interval of its RIG node
-   rep->defs.insert(rep->defs.end(), val->defs.begin(), val->defs.end());
+   rep->defs.insert(val->defs.begin(), val->defs.end());
    nRep->livei.unify(nVal->livei);
    return true;
 }
@@ -1409,7 +1409,7 @@ GCRA::cleanup(const bool success)
       } else {
          for (Value::DefIterator d = lval->defs.begin(); d != lval->defs.end();
               ++d)
-            lval->join->defs.remove(*d);
+            lval->join->defs.erase(*d);
          lval->join = lval;
       }
    }
@@ -1547,8 +1547,7 @@ SpillCodeInserter::run(const std::list<ValuePair>& lst)
       LValue *lval = it->first->asLValue();
       Symbol *mem = it->second ? it->second->asSym() : NULL;
 
-      for (Value::DefIterator d = lval->defs.begin(); d != lval->defs.end();
-           ++d) {
+      for (Value::DefIterator d = lval->defs.begin(); d != lval->defs.end();) {
          Value *slot = mem ?
             static_cast<Value *>(mem) : new_LValue(func, FILE_GPR);
          Value *tmp = NULL;
@@ -1577,13 +1576,13 @@ SpillCodeInserter::run(const std::list<ValuePair>& lst)
          assert(defi);
          if (defi->isPseudo()) {
             d = lval->defs.erase(d);
-            --d;
             if (slot->reg.file == FILE_MEMORY_LOCAL)
                delete_Instruction(func->getProgram(), defi);
             else
                defi->setDef(0, slot);
          } else {
             spill(defi, slot, dval);
+            d++;
          }
       }
 
@@ -2098,7 +2097,7 @@ RegAlloc::InsertConstraintsPass::insertConstraintMoves()
             }
             assert(cst->getSrc(s)->defs.size() == 1); // still SSA
 
-            Instruction *defi = cst->getSrc(s)->defs.front()->getInsn();
+            Instruction *defi =(*cst->getSrc(s)->defs.begin())->getInsn();
             // catch some cases where don't really need MOVs
             if (cst->getSrc(s)->refCount() == 1 && !defi->constrainedDefs())
                continue;
-- 
1.8.4.5

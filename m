From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: [PATCH 2/2] nvc0/ir: fill offset in properly for TXD
Date: Sat,  5 Jul 2014 02:13:34 -0400
Message-ID: <1404540814-21337-2-git-send-email-imirkin@alum.mit.edu>
References: <1404540814-21337-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <mesa-dev-bounces@lists.freedesktop.org>
In-Reply-To: <1404540814-21337-1-git-send-email-imirkin@alum.mit.edu>
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

Apparently TXD wants its offset differently than TEX, accepting it in
the upper bits of the layer index. Unclear what happens when this is
combined with indirect sampler indexing.

Signed-off-by: Ilia Mirkin <imirkin@alum.mit.edu>
---
 .../nouveau/codegen/nv50_ir_lowering_nvc0.cpp      | 47 ++++++++++++++++------
 1 file changed, 34 insertions(+), 13 deletions(-)

diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nvc0.cpp b/src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nvc0.cpp
index 398b28f..ac2a770 100644
--- a/src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nvc0.cpp
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nvc0.cpp
@@ -639,12 +639,14 @@ NVC0LoweringPass::handleTEX(TexInstruction *i)
    if (i->tex.useOffsets) {
       int n, c;
       int s = i->srcCount(0xff, true);
-      if (i->tex.target.isShadow())
-         s--;
-      if (i->srcExists(s)) // move potential predicate out of the way
-         i->moveSources(s, 1);
-      if (i->tex.useOffsets == 4 && i->srcExists(s + 1))
-         i->moveSources(s + 1, 1);
+      if (i->op != OP_TXD) {
+         if (i->tex.target.isShadow())
+            s--;
+         if (i->srcExists(s)) // move potential predicate out of the way
+            i->moveSources(s, 1);
+         if (i->tex.useOffsets == 4 && i->srcExists(s + 1))
+            i->moveSources(s + 1, 1);
+      }
       if (i->op == OP_TXG) {
          // Either there is 1 offset, which goes into the 2 low bytes of the
          // first source, or there are 4 offsets, which go into 2 sources (8
@@ -673,7 +675,22 @@ NVC0LoweringPass::handleTEX(TexInstruction *i)
             assert(i->offset[0][c].getImmediate(val));
             imm |= (val.reg.data.u32 & 0xf) << (c * 4);
          }
-         i->setSrc(s, bld.loadImm(NULL, imm));
+         if (i->op == OP_TXD) {
+            // The offset goes into the upper 16 bits of the array index. So
+            // create it if it's not already there, and INSBF it if it already
+            // is.
+            if (i->tex.target.isArray()) {
+               bld.mkOp3(OP_INSBF, TYPE_U32, i->getSrc(0),
+                         bld.loadImm(NULL, imm), bld.mkImm(0xc10),
+                         i->getSrc(0));
+            } else {
+               for (int s = dim; s >= 1; --s)
+                  i->setSrc(s, i->getSrc(s - 1));
+               i->setSrc(0, bld.loadImm(NULL, imm << 16));
+            }
+         } else {
+            i->setSrc(s, bld.loadImm(NULL, imm));
+         }
       }
    }
 
@@ -759,20 +776,24 @@ bool
 NVC0LoweringPass::handleTXD(TexInstruction *txd)
 {
    int dim = txd->tex.target.getDim();
-   int arg = txd->tex.target.getArgCount();
+   unsigned arg = txd->tex.target.getArgCount();
+   unsigned expected_args = arg;
+
+   if (!txd->tex.target.isArray() && txd->tex.useOffsets)
+      expected_args++;
+
+   if (expected_args > 4 || dim > 2 || txd->tex.target.isShadow())
+      txd->op = OP_TEX;
 
    handleTEX(txd);
    while (txd->srcExists(arg))
       ++arg;
 
    txd->tex.derivAll = true;
-   if (dim > 2 ||
-       txd->tex.target.isCube() ||
-       arg > 4 ||
-       txd->tex.target.isShadow() ||
-       txd->tex.useOffsets)
+   if (txd->op == OP_TEX)
       return handleManualTXD(txd);
 
+   assert(arg == expected_args);
    for (int c = 0; c < dim; ++c) {
       txd->setSrc(arg + c * 2 + 0, txd->dPdx[c]);
       txd->setSrc(arg + c * 2 + 1, txd->dPdy[c]);
-- 
1.8.5.5

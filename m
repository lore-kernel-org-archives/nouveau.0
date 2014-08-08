From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: [PATCH 2/3] nvc0/ir: add kepler+ support for indirect
	texture references
Date: Thu,  7 Aug 2014 21:27:09 -0400
Message-ID: <1407461230-22369-2-git-send-email-imirkin@alum.mit.edu>
References: <1407461230-22369-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <mesa-dev-bounces@lists.freedesktop.org>
In-Reply-To: <1407461230-22369-1-git-send-email-imirkin@alum.mit.edu>
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

Signed-off-by: Ilia Mirkin <imirkin@alum.mit.edu>
---
 .../nouveau/codegen/nv50_ir_lowering_nvc0.cpp      | 34 +++++++++++++++++-----
 1 file changed, 27 insertions(+), 7 deletions(-)

diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nvc0.cpp b/src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nvc0.cpp
index 4a9e48f..ade315d 100644
--- a/src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nvc0.cpp
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nvc0.cpp
@@ -569,9 +569,17 @@ NVC0LoweringPass::handleTEX(TexInstruction *i)
 
    if (chipset >= NVISA_GK104_CHIPSET) {
       if (i->tex.rIndirectSrc >= 0 || i->tex.sIndirectSrc >= 0) {
-         WARN("indirect TEX not implemented\n");
-      }
-      if (i->tex.r == i->tex.s) {
+         // XXX this ignores tsc, and assumes a 1:1 mapping
+         assert(i->tex.rIndirectSrc >= 0);
+         Value *hnd = loadTexHandle(
+               bld.mkOp2v(OP_SHL, TYPE_U32, bld.getSSA(),
+                          i->getIndirectR(), bld.mkImm(2)),
+               i->tex.r);
+         i->tex.r = 0xff;
+         i->tex.s = 0x1f;
+         i->setIndirectR(hnd);
+         i->setIndirectS(NULL);
+      } else if (i->tex.r == i->tex.s) {
          i->tex.r += prog->driver->io.texBindBase / 4;
          i->tex.s  = 0; // only a single cX[] value possible here
       } else {
@@ -595,6 +603,16 @@ NVC0LoweringPass::handleTEX(TexInstruction *i)
             i->setSrc(s, i->getSrc(s - 1));
          i->setSrc(0, layer);
       }
+      // Move the indirect reference to the first place
+      if (i->tex.rIndirectSrc >= 0) {
+         Value *hnd = i->getIndirectR();
+
+         i->setIndirectR(NULL);
+         i->moveSources(0, 1);
+         i->setSrc(0, hnd);
+         i->tex.rIndirectSrc = 0;
+         i->tex.sIndirectSrc = -1;
+      }
    } else
    // (nvc0) generate and move the tsc/tic/array source to the front
    if (i->tex.target.isArray() || i->tex.rIndirectSrc >= 0 || i->tex.sIndirectSrc >= 0) {
@@ -688,14 +706,14 @@ NVC0LoweringPass::handleTEX(TexInstruction *i)
             // The offset goes into the upper 16 bits of the array index. So
             // create it if it's not already there, and INSBF it if it already
             // is.
+            s = (i->tex.rIndirectSrc >= 0) ? 1 : 0;
             if (i->tex.target.isArray()) {
                bld.mkOp3(OP_INSBF, TYPE_U32, i->getSrc(0),
                          bld.loadImm(NULL, imm), bld.mkImm(0xc10),
-                         i->getSrc(0));
+                         i->getSrc(s));
             } else {
-               for (int s = dim; s >= 1; --s)
-                  i->setSrc(s, i->getSrc(s - 1));
-               i->setSrc(0, bld.loadImm(NULL, imm << 16));
+               i->moveSources(s, 1);
+               i->setSrc(s, bld.loadImm(NULL, imm << 16));
             }
          } else {
             i->setSrc(s, bld.loadImm(NULL, imm));
@@ -792,6 +810,8 @@ NVC0LoweringPass::handleTXD(TexInstruction *txd)
    if (chipset >= NVISA_GK104_CHIPSET) {
       if (!txd->tex.target.isArray() && txd->tex.useOffsets)
          expected_args++;
+      if (txd->tex.rIndirectSrc >= 0 || txd->tex.sIndirectSrc >= 0)
+         expected_args++;
    } else {
       if (txd->tex.useOffsets)
          expected_args++;
-- 
1.8.5.5

From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: [PATCH] nvc0: do quadops on the right texture
	coordinates for TXD
Date: Sat,  5 Jul 2014 00:38:50 -0400
Message-ID: <1404535130-8156-1-git-send-email-imirkin@alum.mit.edu>
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
Cc: mesa-stable@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

handleTEX moves the layer as the first argument. This makes sure that
the quadops deal with the texture coordinates.

Signed-off-by: Ilia Mirkin <imirkin@alum.mit.edu>
Cc: <mesa-stable@lists.freedesktop.org>
---
 src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nvc0.cpp | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nvc0.cpp b/src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nvc0.cpp
index 8f26645..0e24db7 100644
--- a/src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nvc0.cpp
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nvc0.cpp
@@ -712,6 +712,7 @@ NVC0LoweringPass::handleManualTXD(TexInstruction *i)
    Value *zero = bld.loadImm(bld.getSSA(), 0);
    int l, c;
    const int dim = i->tex.target.getDim();
+   const int array = i->tex.target.isArray();
 
    i->op = OP_TEX; // no need to clone dPdx/dPdy later
 
@@ -722,7 +723,7 @@ NVC0LoweringPass::handleManualTXD(TexInstruction *i)
    for (l = 0; l < 4; ++l) {
       // mov coordinates from lane l to all lanes
       for (c = 0; c < dim; ++c)
-         bld.mkQuadop(0x00, crd[c], l, i->getSrc(c), zero);
+         bld.mkQuadop(0x00, crd[c], l, i->getSrc(c + array), zero);
       // add dPdx from lane l to lanes dx
       for (c = 0; c < dim; ++c)
          bld.mkQuadop(qOps[l][0], crd[c], l, i->dPdx[c].get(), crd[c]);
@@ -732,7 +733,7 @@ NVC0LoweringPass::handleManualTXD(TexInstruction *i)
       // texture
       bld.insert(tex = cloneForward(func, i));
       for (c = 0; c < dim; ++c)
-         tex->setSrc(c, crd[c]);
+         tex->setSrc(c + array, crd[c]);
       // save results
       for (c = 0; i->defExists(c); ++c) {
          Instruction *mov;
-- 
1.8.5.5

From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: [PATCH] nv50/ir: avoid creating instructions that can't
	be emitted
Date: Mon,  1 Sep 2014 11:09:07 -0400
Message-ID: <1409584147-29269-1-git-send-email-imirkin@alum.mit.edu>
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
Cc: "10.2 10.3" <mesa-stable@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

When constant folding a MAD operation, we first fold the multiply and
generate an ADD. However we do so without making sure that the immediate
can be handled in the saturate case. If it can't, load the immediate in
a separate instruction.

Reported-by: Tiziano Bacocco <tizbac2@gmail.com>
Signed-off-by: Ilia Mirkin <imirkin@alum.mit.edu>
Cc: "10.2 10.3" <mesa-stable@lists.freedesktop.org>
---
 src/gallium/drivers/nouveau/codegen/nv50_ir_peephole.cpp | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_peephole.cpp b/src/gallium/drivers/nouveau/codegen/nv50_ir_peephole.cpp
index 1a9a25f..719f980 100644
--- a/src/gallium/drivers/nouveau/codegen/nv50_ir_peephole.cpp
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_peephole.cpp
@@ -567,6 +567,10 @@ ConstantFolding::expr(Instruction *i,
       ImmediateValue src0;
       if (i->src(0).getImmediate(src0))
          expr(i, src0, *i->getSrc(1)->asImm());
+      if (i->saturate && !prog->getTarget()->isSatSupported(i)) {
+         bld.setPosition(i, false);
+         i->setSrc(1, bld.loadImm(NULL, res.data.u32));
+      }
    } else {
       i->op = i->saturate ? OP_SAT : OP_MOV; /* SAT handled by unary() */
    }
-- 
1.8.5.5

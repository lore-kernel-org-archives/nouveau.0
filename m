From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: [PATCH 4/5] nv50/ir: fix hard-coded TYPE_U32 sized
	register
Date: Fri, 18 Jul 2014 09:57:28 -0400
Message-ID: <1405691849-18853-5-git-send-email-imirkin@alum.mit.edu>
References: <1405691849-18853-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <mesa-dev-bounces@lists.freedesktop.org>
In-Reply-To: <1405691849-18853-1-git-send-email-imirkin@alum.mit.edu>
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

I noticed this in a review of the code trying to figure out why the next
problem was happening. This doesn't actually fix anything, but there's no
reason why phi nodes must be restricted to 32-bit registers. (Although they
are, for now.)

 src/gallium/drivers/nouveau/codegen/nv50_ir_ra.cpp | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_ra.cpp b/src/gallium/drivers/nouveau/codegen/nv50_ir_ra.cpp
index e4f56b1..117da94 100644
--- a/src/gallium/drivers/nouveau/codegen/nv50_ir_ra.cpp
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_ra.cpp
@@ -389,11 +389,12 @@ RegAlloc::PhiMovesPass::visit(BasicBlock *bb)
          pb->insertTail(new_FlowInstruction(func, OP_BRA, bb));
 
       for (phi = bb->getPhi(); phi && phi->op == OP_PHI; phi = phi->next) {
-         mov = new_Instruction(func, OP_MOV, TYPE_U32);
+         LValue *tmp = new_LValue(func, phi->getDef(0)->asLValue());
+         mov = new_Instruction(func, OP_MOV, typeOfSize(tmp->reg.size));
 
          mov->setSrc(0, phi->getSrc(j));
-         mov->setDef(0, new_LValue(func, phi->getDef(0)->asLValue()));
-         phi->setSrc(j, mov->getDef(0));
+         mov->setDef(0, tmp);
+         phi->setSrc(j, tmp);
 
          pb->insertBefore(pb->getExit(), mov);
       }
-- 
1.8.5.5

From: Tobias Klausmann <tobias.johannes.klausmann@mni.thm.de>
Subject: [PATCH v3 4/4] nvc0/ir: Handle OP_POPCNT when folding
	constant expressions
Date: Wed,  4 Jun 2014 00:35:50 +0200
Message-ID: <1401834950-20257-5-git-send-email-tobias.johannes.klausmann@mni.thm.de>
References: <1401834950-20257-1-git-send-email-tobias.johannes.klausmann@mni.thm.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <mesa-dev-bounces@lists.freedesktop.org>
In-Reply-To: <1401834950-20257-1-git-send-email-tobias.johannes.klausmann@mni.thm.de>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/mesa-dev>,
 <mailto:mesa-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/mesa-dev>
List-Post: <mailto:mesa-dev@lists.freedesktop.org>
List-Help: <mailto:mesa-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/mesa-dev>,
 <mailto:mesa-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: mesa-dev-bounces@lists.freedesktop.org
Sender: "mesa-dev" <mesa-dev-bounces@lists.freedesktop.org>
To: nouveau@lists.freedesktop.org, mesa-dev@lists.freedesktop.org, imirkin@alum.mit.edu
List-Id: nouveau.vger.kernel.org

Signed-off-by: Tobias Klausmann <tobias.johannes.klausmann@mni.thm.de>
---
V2: Add support for a single-argument version of POPCNT for Maxwell (SM5)
V3: Clean up a bit more

 src/gallium/drivers/nouveau/codegen/nv50_ir_peephole.cpp | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_peephole.cpp b/src/gallium/drivers/nouveau/codegen/nv50_ir_peephole.cpp
index e4d91d7..8dde7c1 100644
--- a/src/gallium/drivers/nouveau/codegen/nv50_ir_peephole.cpp
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_peephole.cpp
@@ -544,6 +544,8 @@ ConstantFolding::expr(Instruction *i,
       }
       break;
    }
+   case OP_POPCNT: res.data.u32 = util_bitcount(a->data.u32 & b->data.u32);
+      break;
    default:
       return;
    }
@@ -961,6 +963,15 @@ ConstantFolding::opnd(Instruction *i, ImmediateValue &imm0, int s)
       i->subOp = 0;
       break;
    }
+   case OP_POPCNT: {
+      uint32_t res;
+      res = util_bitcount(imm0.reg.data.u32);
+      i->setSrc(0, new_ImmediateValue(i->bb->getProgram(), res));
+      i->setSrc(1, NULL);
+      i->op = OP_MOV;
+      i->subOp = 0;
+      break;
+   }
    default:
       return;
    }
-- 
1.8.4.5

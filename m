From: Tobias Klausmann <tobias.johannes.klausmann@mni.thm.de>
Subject: [PATCH 4/4] nvc0/ir: Handle OP_BFIND when folding
	constant expressions
Date: Thu, 29 May 2014 21:43:56 +0200
Message-ID: <1401392636-17704-4-git-send-email-tobias.johannes.klausmann@mni.thm.de>
References: <53878DE4.4010005@mni.thm.de>
 <1401392636-17704-1-git-send-email-tobias.johannes.klausmann@mni.thm.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <mesa-dev-bounces@lists.freedesktop.org>
In-Reply-To: <1401392636-17704-1-git-send-email-tobias.johannes.klausmann@mni.thm.de>
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
 src/gallium/drivers/nouveau/codegen/nv50_ir_peephole.cpp | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_peephole.cpp b/src/gallium/drivers/nouveau/codegen/nv50_ir_peephole.cpp
index 68b9a6d..a56756c 100644
--- a/src/gallium/drivers/nouveau/codegen/nv50_ir_peephole.cpp
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_peephole.cpp
@@ -556,6 +556,20 @@ ConstantFolding::expr(Instruction *i,
       }
       break;
    }
+   case OP_BFIND: {
+      int shift = 0;
+      if (i->subOp == NV50_IR_SUBOP_BFIND_SAMT)
+         shift = 32 - (b->data.u32 & 0xff);
+      switch (i->dType) {
+      case TYPE_S32:
+         res.data.s32 = util_last_bit_signed(a->data.s32 >> shift)- 1; break;
+      case TYPE_U32:
+         res.data.u32 = util_last_bit(a->data.u32 >> shift) -1; break;
+      default:
+         return;
+      }
+      break;
+   }
    default:
       return;
    }
-- 
1.8.4.5

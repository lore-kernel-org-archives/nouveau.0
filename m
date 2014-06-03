From: Tobias Klausmann <tobias.johannes.klausmann@mni.thm.de>
Subject: [PATCH v2 2/4] nvc0/ir: Handle reverse subop for
	OP_EXTBF when folding constant expressions
Date: Tue,  3 Jun 2014 22:58:02 +0200
Message-ID: <1401829084-4499-3-git-send-email-tobias.johannes.klausmann@mni.thm.de>
References: <1401829084-4499-1-git-send-email-tobias.johannes.klausmann@mni.thm.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <mesa-dev-bounces@lists.freedesktop.org>
In-Reply-To: <1401829084-4499-1-git-send-email-tobias.johannes.klausmann@mni.thm.de>
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

V2: Handle the instruction right (shift after reverse)

Signed-off-by: Tobias Klausmann <tobias.johannes.klausmann@mni.thm.de>
---
 src/gallium/drivers/nouveau/codegen/nv50_ir_peephole.cpp | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_peephole.cpp b/src/gallium/drivers/nouveau/codegen/nv50_ir_peephole.cpp
index 58092f4..a214ffc 100644
--- a/src/gallium/drivers/nouveau/codegen/nv50_ir_peephole.cpp
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_peephole.cpp
@@ -529,8 +529,20 @@ ConstantFolding::expr(Instruction *i,
          lshift = 32 - width - offset;
       }
       switch (i->dType) {
-      case TYPE_S32: res.data.s32 = (a->data.s32 << lshift) >> rshift; break;
-      case TYPE_U32: res.data.u32 = (a->data.u32 << lshift) >> rshift; break;
+      case TYPE_S32:
+         if (i->subOp == NV50_IR_SUBOP_EXTBF_REV)
+            res.data.s32 = util_bitreverse(a->data.s32);
+         else
+            res.data.s32 = a->data.s32;
+         res.data.s32 = (res.data.s32 << lshift) >> rshift;
+         break;
+      case TYPE_U32:
+         if (i->subOp == NV50_IR_SUBOP_EXTBF_REV)
+            res.data.u32 = util_bitreverse(a->data.u32);
+         else
+            res.data.u32 = a->data.u32;
+         res.data.u32 = (res.data.u32 << lshift) >> rshift;
+         break;
       default:
          return;
       }
-- 
1.8.4.5

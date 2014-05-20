From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: [PATCH 05/12] nv50/ir/opt: fix constant folding with
	saturate modifier
Date: Tue, 20 May 2014 19:39:59 -0400
Message-ID: <1400629206-4447-6-git-send-email-imirkin@alum.mit.edu>
References: <1400629206-4447-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <mesa-dev-bounces@lists.freedesktop.org>
In-Reply-To: <1400629206-4447-1-git-send-email-imirkin@alum.mit.edu>
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
Cc: "10.2" <mesa-stable@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

From: Christoph Bumiller <e0425955@student.tuwien.ac.at>

Reviewed-by: Ilia Mirkin <imirkin@alum.mit.edu>
Cc: "10.2" <mesa-stable@lists.freedesktop.org>
---
 src/gallium/drivers/nouveau/codegen/nv50_ir_peephole.cpp | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_peephole.cpp b/src/gallium/drivers/nouveau/codegen/nv50_ir_peephole.cpp
index e6f8f69..1a2c2e6 100644
--- a/src/gallium/drivers/nouveau/codegen/nv50_ir_peephole.cpp
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_peephole.cpp
@@ -561,7 +561,7 @@ ConstantFolding::expr(Instruction *i,
       if (i->src(0).getImmediate(src0))
          expr(i, src0, *i->getSrc(1)->asImm());
    } else {
-      i->op = OP_MOV;
+      i->op = i->saturate ? OP_SAT : OP_MOV; /* SAT handled by unary() */
    }
 }
 
@@ -612,6 +612,7 @@ ConstantFolding::unary(Instruction *i, const ImmediateValue &imm)
    switch (i->op) {
    case OP_NEG: res.data.f32 = -imm.reg.data.f32; break;
    case OP_ABS: res.data.f32 = fabsf(imm.reg.data.f32); break;
+   case OP_SAT: res.data.f32 = CLAMP(imm.reg.data.f32, 0.0f, 1.0f); break;
    case OP_RCP: res.data.f32 = 1.0f / imm.reg.data.f32; break;
    case OP_RSQ: res.data.f32 = 1.0f / sqrtf(imm.reg.data.f32); break;
    case OP_LG2: res.data.f32 = log2f(imm.reg.data.f32); break;
@@ -922,6 +923,7 @@ ConstantFolding::opnd(Instruction *i, ImmediateValue &imm0, int s)
 
    case OP_ABS:
    case OP_NEG:
+   case OP_SAT:
    case OP_LG2:
    case OP_RCP:
    case OP_SQRT:
-- 
1.8.5.5

From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: [PATCH] nv50/ir: make sure to reverse cond codes on all
	the OP_SET variants
Date: Sat, 10 May 2014 15:06:06 -0400
Message-ID: <1399748766-26374-1-git-send-email-imirkin@alum.mit.edu>
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
To: mesa-dev@lists.freedesktop.org, nouveau@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>
Cc: "10.2 10.1" <mesa-stable@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

Signed-off-by: Ilia Mirkin <imirkin@alum.mit.edu>
Cc: "10.2 10.1" <mesa-stable@lists.freedesktop.org>
---

Found this while tracking a regression on nvc0 for my patch which fixes
ir_unop_any to emit or's instead of dp3's. (That patch is fine, this code was
always broken.)

 src/gallium/drivers/nouveau/codegen/nv50_ir_peephole.cpp | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_peephole.cpp b/src/gallium/drivers/nouveau/codegen/nv50_ir_peephole.cpp
index c89e1c3..cdae3c8 100644
--- a/src/gallium/drivers/nouveau/codegen/nv50_ir_peephole.cpp
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_peephole.cpp
@@ -187,7 +187,8 @@ LoadPropagation::checkSwapSrc01(Instruction *insn)
       return;
    }
 
-   if (insn->op == OP_SET)
+   if (insn->op == OP_SET || insn->op == OP_SET_AND ||
+       insn->op == OP_SET_OR || insn->op == OP_SET_XOR)
       insn->asCmp()->setCond = reverseCondCode(insn->asCmp()->setCond);
    else
    if (insn->op == OP_SLCT)
-- 
1.8.5.5

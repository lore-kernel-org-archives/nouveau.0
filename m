From: Tobias Klausmann <tobias.johannes.klausmann@mni.thm.de>
Subject: [PATCH v2 1/4] nvc0/ir: clear subop when folding
	constant expressions
Date: Tue,  3 Jun 2014 22:58:01 +0200
Message-ID: <1401829084-4499-2-git-send-email-tobias.johannes.klausmann@mni.thm.de>
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

Some operations (e.g. OP_MUL/OP_MAD/OP_EXTBF might have a subop set.
After folding, make sure that it is cleared

Signed-off-by: Tobias Klausmann <tobias.johannes.klausmann@mni.thm.de>
---
 src/gallium/drivers/nouveau/codegen/nv50_ir_peephole.cpp | 1 +
 1 file changed, 1 insertion(+)

diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_peephole.cpp b/src/gallium/drivers/nouveau/codegen/nv50_ir_peephole.cpp
index 1a2c2e6..58092f4 100644
--- a/src/gallium/drivers/nouveau/codegen/nv50_ir_peephole.cpp
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_peephole.cpp
@@ -563,6 +563,7 @@ ConstantFolding::expr(Instruction *i,
    } else {
       i->op = i->saturate ? OP_SAT : OP_MOV; /* SAT handled by unary() */
    }
+   i->subOp = 0;
 }
 
 void
-- 
1.8.4.5

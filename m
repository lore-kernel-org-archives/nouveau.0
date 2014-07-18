From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: [PATCH 5/5] nv50/ir: fix phi/union sources when their
	def has been merged
Date: Fri, 18 Jul 2014 09:57:29 -0400
Message-ID: <1405691849-18853-6-git-send-email-imirkin@alum.mit.edu>
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

In a situation where double-register values are used, the phi nodes can
still end up being u32 values. They all get merged into one RA node
though. When fixing up the merge (which comes after the phi node), the
phi node's def would get fixed, but not its sources which would remain
at the low register value.

This maintains the invariant that a phi node's defs and sources are
allocated the same register.

Signed-off-by: Ilia Mirkin <imirkin@alum.mit.edu>
---

I _think_ that the split case might also need this, in case there's a split
that feeds into phi nodes, and those phi nodes are never merged. But this
fixes a real issue, and this stuff is pretty finicky... rather not poke the
bear too hard.

 src/gallium/drivers/nouveau/codegen/nv50_ir_ra.cpp | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_ra.cpp b/src/gallium/drivers/nouveau/codegen/nv50_ir_ra.cpp
index 117da94..21d7fd0 100644
--- a/src/gallium/drivers/nouveau/codegen/nv50_ir_ra.cpp
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_ra.cpp
@@ -1702,6 +1702,14 @@ GCRA::resolveSplitsAndMerges()
          Value *v = merge->getSrc(s);
          v->reg.data.id = regs.bytesToId(v, reg);
          v->join = v;
+         // If the value is defined by a phi/union node, we also need to
+         // perform the same fixup on that node's sources, since after RA
+         // their registers should be identical.
+         if (v->getInsn()->op == OP_PHI || v->getInsn()->op == OP_UNION) {
+            Instruction *phi = v->getInsn();
+            for (int phis = 0; phi->srcExists(phis); ++phis)
+               phi->getSrc(phis)->join = v;
+         }
          reg += v->reg.size;
       }
    }
-- 
1.8.5.5

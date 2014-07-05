From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: [PATCH 2/2] nv50/ir: ignore bias for samplerCubeShadow
	on nv50
Date: Fri,  4 Jul 2014 20:49:41 -0400
Message-ID: <1404521381-14111-2-git-send-email-imirkin@alum.mit.edu>
References: <1404521381-14111-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <mesa-dev-bounces@lists.freedesktop.org>
In-Reply-To: <1404521381-14111-1-git-send-email-imirkin@alum.mit.edu>
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

Unfortunately there's no good way to do this on the nv50 shader isa.
Dropping the bias seems preferable to doing the compare post-filtering.

Signed-off-by: Ilia Mirkin <imirkin@alum.mit.edu>
Cc: <mesa-stable@lists.freedesktop.org>
---
 src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nv50.cpp | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nv50.cpp b/src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nv50.cpp
index ed06def..e283424 100644
--- a/src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nv50.cpp
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nv50.cpp
@@ -797,6 +797,16 @@ NV50LoweringPreSSA::handleTXB(TexInstruction *i)
    const CondCode cc[4] = { CC_EQU, CC_S, CC_C, CC_O };
    int l, d;
 
+   // We can't actually apply bias *and* do a compare for a cube
+   // texture. Since the compare has to be done before the filtering, just
+   // drop the bias on the floor.
+   if (i->tex.target == TEX_TARGET_CUBE_SHADOW) {
+      i->op = OP_TEX;
+      i->setSrc(3, i->getSrc(4));
+      i->setSrc(4, NULL);
+      return handleTEX(i);
+   }
+
    handleTEX(i);
    Value *bias = i->getSrc(i->tex.target.getArgCount());
    if (bias->isUniform())
-- 
1.8.5.5

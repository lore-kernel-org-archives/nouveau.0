From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: [PATCH 07/12] nv50/ir/tgsi: optimize KIL
Date: Tue, 20 May 2014 19:40:01 -0400
Message-ID: <1400629206-4447-8-git-send-email-imirkin@alum.mit.edu>
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
 src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp b/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp
index e24be51..a0f1fe1 100644
--- a/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp
@@ -2457,7 +2457,12 @@ Converter::handleInstruction(const struct tgsi_full_instruction *insn)
       break;
    case TGSI_OPCODE_KILL_IF:
       val0 = new_LValue(func, FILE_PREDICATE);
+      mask = 0;
       for (c = 0; c < 4; ++c) {
+         const int s = tgsi.getSrc(0).getSwizzle(c);
+         if (mask & (1 << s))
+            continue;
+         mask |= 1 << s;
          mkCmp(OP_SET, CC_LT, TYPE_F32, val0, TYPE_F32, fetchSrc(0, c), zero);
          mkOp(OP_DISCARD, TYPE_NONE, NULL)->setPredicate(CC_P, val0);
       }
-- 
1.8.5.5

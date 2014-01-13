From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: [PATCH 07/19] nv50/ir: comment out code to allow
	input/immed loads
Date: Mon, 13 Jan 2014 14:19:23 -0500
Message-ID: <1389640775-25046-8-git-send-email-imirkin@alum.mit.edu>
References: <1389640775-25046-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <mesa-dev-bounces@lists.freedesktop.org>
In-Reply-To: <1389640775-25046-1-git-send-email-imirkin@alum.mit.edu>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/mesa-dev>
List-Post: <mailto:mesa-dev@lists.freedesktop.org>
List-Help: <mailto:mesa-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: mesa-dev-bounces@lists.freedesktop.org
Errors-To: mesa-dev-bounces@lists.freedesktop.org
To: mesa-dev@lists.freedesktop.org, nouveau@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

This code was missing a break which made it ineffective. But since
shader input loads have been disallowed, define the code out.

Signed-off-by: Ilia Mirkin <imirkin@alum.mit.edu>
---
 src/gallium/drivers/nouveau/codegen/nv50_ir_target_nv50.cpp | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_target_nv50.cpp b/src/gallium/drivers/nouveau/codegen/nv50_ir_target_nv50.cpp
index 18fa069..a84a54a 100644
--- a/src/gallium/drivers/nouveau/codegen/nv50_ir_target_nv50.cpp
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_target_nv50.cpp
@@ -310,9 +310,12 @@ TargetNV50::insnCanLoad(const Instruction *i, int s,
       if (ld->bb->getProgram()->getType() == Program::TYPE_GEOMETRY)
          return false;
       break;
+#if 0
    case 0x0d:
       if (ld->bb->getProgram()->getType() != Program::TYPE_GEOMETRY)
          return false;
+      break;
+#endif
    default:
       return false;
    }
-- 
1.8.3.2

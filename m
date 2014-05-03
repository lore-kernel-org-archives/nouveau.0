From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH] nv50/ir: allow load propagation when flags are
	defined
Date: Sat,  3 May 2014 14:40:43 -0400
Message-ID: <1399142443-21476-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

The old condition disallowed load propagation any time flags were
defined, even with e.g. set and a constbuf reference. The new condition
disallows it only with immediate propagation. (There are no opcodes that
set the condition flag and have an immediate argument.)

Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
---
 src/gallium/drivers/nouveau/codegen/nv50_ir_target_nv50.cpp | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_target_nv50.cpp b/src/gallium/drivers/nouveau/codegen/nv50_ir_target_nv50.cpp
index 0b2f27a..32ba5c8 100644
--- a/src/gallium/drivers/nouveau/codegen/nv50_ir_target_nv50.cpp
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_target_nv50.cpp
@@ -275,9 +275,10 @@ TargetNV50::insnCanLoad(const Instruction *i, int s,
       return false;
 
    // NOTE: don't rely on flagsDef
-   for (int d = 0; i->defExists(d); ++d)
-      if (i->def(d).getFile() == FILE_FLAGS)
-         return false;
+   if (sf == FILE_IMMEDIATE)
+      for (int d = 0; i->defExists(d); ++d)
+         if (i->def(d).getFile() == FILE_FLAGS)
+            return false;
 
    unsigned mode = 0;
 
-- 
1.8.3.2

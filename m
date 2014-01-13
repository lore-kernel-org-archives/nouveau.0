From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH 06/19] nv50/ir: disallow shader input propagation
	for gp
Date: Mon, 13 Jan 2014 14:19:22 -0500
Message-ID: <1389640775-25046-7-git-send-email-imirkin@alum.mit.edu>
References: <1389640775-25046-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1389640775-25046-1-git-send-email-imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

For some reason, shader input accesses don't work correctly in non-ld
instructions. Disallow those loads from being propagated.

Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
---

I'm not particularly happy with this patch. Some investigation needs to happen
as to what's going on here. NVIDIA's shaders include p[] accesses in various
instructions just fine. Perhaps this is just masking some other bug. However
this works for now for all the piglit tests in the repo.

 src/gallium/drivers/nouveau/codegen/nv50_ir_target_nv50.cpp | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_target_nv50.cpp b/src/gallium/drivers/nouveau/codegen/nv50_ir_target_nv50.cpp
index 52257a8..18fa069 100644
--- a/src/gallium/drivers/nouveau/codegen/nv50_ir_target_nv50.cpp
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_target_nv50.cpp
@@ -297,14 +297,19 @@ TargetNV50::insnCanLoad(const Instruction *i, int s,
 
    switch (mode) {
    case 0x00:
-   case 0x01:
    case 0x03:
    case 0x08:
-   case 0x09:
    case 0x0c:
    case 0x20:
    case 0x21:
       break;
+   case 0x01:
+   case 0x09:
+      // TODO: Figure out why a[] accesses can't be propagated into non-ld
+      // instructions. Something to do with vstride maybe?
+      if (ld->bb->getProgram()->getType() == Program::TYPE_GEOMETRY)
+         return false;
+      break;
    case 0x0d:
       if (ld->bb->getProgram()->getType() != Program::TYPE_GEOMETRY)
          return false;
-- 
1.8.3.2

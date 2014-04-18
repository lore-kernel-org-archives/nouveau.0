From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH] nouveau/codegen: add missing values for OP_TXLQ
	into the target arrays
Date: Fri, 18 Apr 2014 02:28:13 -0400
Message-ID: <1397802493-3886-1-git-send-email-imirkin@alum.mit.edu>
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

Also rework things so that if someone were to add an opcode without
adjusting the values in these arrays, there will be a compilation error.

This fixes a few quadop-related piglit regressions since commit
d5faf8e78603.

Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
---
 src/gallium/drivers/nouveau/codegen/nv50_ir_target.cpp | 12 +++++++-----
 src/gallium/drivers/nouveau/codegen/nv50_ir_target.h   |  4 ++--
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_target.cpp b/src/gallium/drivers/nouveau/codegen/nv50_ir_target.cpp
index 112fca7..53c3c3e 100644
--- a/src/gallium/drivers/nouveau/codegen/nv50_ir_target.cpp
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_target.cpp
@@ -25,7 +25,7 @@
 
 namespace nv50_ir {
 
-const uint8_t Target::operationSrcNr[OP_LAST + 1] =
+const uint8_t Target::operationSrcNr[] =
 {
    0, 0,                   // NOP, PHI
    0, 0, 0, 0,             // UNION, SPLIT, MERGE, CONSTRAINT
@@ -44,7 +44,7 @@ const uint8_t Target::operationSrcNr[OP_LAST + 1] =
    1, 1, 2, 1, 2,          // VFETCH, PFETCH, EXPORT, LINTERP, PINTERP
    1, 1,                   // EMIT, RESTART
    1, 1, 1,                // TEX, TXB, TXL,
-   1, 1, 1, 1, 1, 2,       // TXF, TXQ, TXD, TXG, TEXCSAA, TEXPREP
+   1, 1, 1, 1, 1, 1, 2,    // TXF, TXQ, TXD, TXG, TXLQ, TEXCSAA, TEXPREP
    1, 1, 2, 2, 2, 2, 2,    // SULDB, SULDP, SUSTB, SUSTP, SUREDB, SUREDP, SULEA
    3, 3, 3, 3,             // SUBFM, SUCLAMP, SUEAU, MADSP
    0,                      // TEXBAR
@@ -57,7 +57,7 @@ const uint8_t Target::operationSrcNr[OP_LAST + 1] =
    0
 };
 
-const OpClass Target::operationClass[OP_LAST + 1] =
+const OpClass Target::operationClass[] =
 {
    // NOP; PHI; UNION, SPLIT, MERGE, CONSTRAINT
    OPCLASS_OTHER,
@@ -101,10 +101,10 @@ const OpClass Target::operationClass[OP_LAST + 1] =
    OPCLASS_SFU, OPCLASS_SFU,
    // EMIT, RESTART
    OPCLASS_CONTROL, OPCLASS_CONTROL,
-   // TEX, TXB, TXL, TXF; TXQ, TXD, TXG, TEXCSAA; TEXPREP
+   // TEX, TXB, TXL, TXF; TXQ, TXD, TXG, TXLQ; TEXCSAA, TEXPREP
    OPCLASS_TEXTURE, OPCLASS_TEXTURE, OPCLASS_TEXTURE, OPCLASS_TEXTURE,
    OPCLASS_TEXTURE, OPCLASS_TEXTURE, OPCLASS_TEXTURE, OPCLASS_TEXTURE,
-   OPCLASS_TEXTURE,
+   OPCLASS_TEXTURE, OPCLASS_TEXTURE,
    // SULDB, SULDP, SUSTB, SUSTP; SUREDB, SUREDP, SULEA
    OPCLASS_SURFACE, OPCLASS_SURFACE, OPCLASS_ATOMIC, OPCLASS_SURFACE,
    OPCLASS_SURFACE, OPCLASS_SURFACE, OPCLASS_SURFACE,
@@ -134,6 +134,8 @@ extern Target *getTargetNV50(unsigned int chipset);
 
 Target *Target::create(unsigned int chipset)
 {
+   STATIC_ASSERT(Elements(operationSrcNr) == OP_LAST + 1);
+   STATIC_ASSERT(Elements(operationClass) == OP_LAST + 1);
    switch (chipset & ~0xf) {
    case 0xc0:
    case 0xd0:
diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_target.h b/src/gallium/drivers/nouveau/codegen/nv50_ir_target.h
index 9913ca1..9eb0a1f 100644
--- a/src/gallium/drivers/nouveau/codegen/nv50_ir_target.h
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_target.h
@@ -195,8 +195,8 @@ public:
    const bool joinAnterior; // true if join is executed before the op
    const bool hasSWSched;   // true if code should provide scheduling data
 
-   static const uint8_t operationSrcNr[OP_LAST + 1];
-   static const OpClass operationClass[OP_LAST + 1];
+   static const uint8_t operationSrcNr[];
+   static const OpClass operationClass[];
 
    static inline uint8_t getOpSrcNr(operation op)
    {
-- 
1.8.3.2

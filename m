From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH] nv50: fix setting of texture ms info to be
	per-stage
Date: Fri,  9 May 2014 23:19:05 -0400
Message-ID: <1399691945-26014-1-git-send-email-imirkin@alum.mit.edu>
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
To: mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: "10.1 10.2" <mesa-stable-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Different textures may be bound to each slot for each stage. So we need
to be able to upload ms parameters for each one without stages
overwriting each other.

Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: "10.1 10.2" <mesa-stable-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
---
 src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nv50.cpp |  4 ++++
 src/gallium/drivers/nouveau/nv50/nv50_context.h               | 10 +++++-----
 src/gallium/drivers/nouveau/nv50/nv50_tex.c                   |  2 +-
 3 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nv50.cpp b/src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nv50.cpp
index eafc0a7..63db1d7 100644
--- a/src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nv50.cpp
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_lowering_nv50.cpp
@@ -591,6 +591,10 @@ void NV50LoweringPreSSA::loadTexMsInfo(uint32_t off, Value **ms,
    Value *tmp = new_LValue(func, FILE_GPR);
    uint8_t b = prog->driver->io.resInfoCBSlot;
    off += prog->driver->io.suInfoBase;
+   if (prog->getType() > Program::TYPE_VERTEX)
+      off += 16 * 2 * 4;
+   if (prog->getType() > Program::TYPE_GEOMETRY)
+      off += 16 * 2 * 4;
    *ms_x = bld.mkLoadv(TYPE_U32, bld.mkSymbol(
                              FILE_MEMORY_CONST, b, TYPE_U32, off + 0), NULL);
    *ms_y = bld.mkLoadv(TYPE_U32, bld.mkSymbol(
diff --git a/src/gallium/drivers/nouveau/nv50/nv50_context.h b/src/gallium/drivers/nouveau/nv50/nv50_context.h
index b776dee..3b7cb18 100644
--- a/src/gallium/drivers/nouveau/nv50/nv50_context.h
+++ b/src/gallium/drivers/nouveau/nv50/nv50_context.h
@@ -78,16 +78,16 @@
 /* 8 user clip planes, at 4 32-bit floats each */
 #define NV50_CB_AUX_UCP_OFFSET    0x0000
 #define NV50_CB_AUX_UCP_SIZE      (8 * 4 * 4)
-/* 256 textures, each with ms_x, ms_y u32 pairs */
+/* 16 textures * 3 shaders, each with ms_x, ms_y u32 pairs */
 #define NV50_CB_AUX_TEX_MS_OFFSET 0x0080
-#define NV50_CB_AUX_TEX_MS_SIZE   (256 * 2 * 4)
+#define NV50_CB_AUX_TEX_MS_SIZE   (16 * 3 * 2 * 4)
 /* For each MS level (4), 8 sets of 32-bit integer pairs sample offsets */
-#define NV50_CB_AUX_MS_OFFSET     0x880
+#define NV50_CB_AUX_MS_OFFSET     0x200
 #define NV50_CB_AUX_MS_SIZE       (4 * 8 * 4 * 2)
 /* Sample position pairs for the current output MS level */
-#define NV50_CB_AUX_SAMPLE_OFFSET 0x980
+#define NV50_CB_AUX_SAMPLE_OFFSET 0x300
 #define NV50_CB_AUX_SAMPLE_OFFSET_SIZE (4 * 8 * 2)
-/* next spot: 0x9c0 */
+/* next spot: 0x340 */
 /* 4 32-bit floats for the vertex runout, put at the end */
 #define NV50_CB_AUX_RUNOUT_OFFSET (NV50_CB_AUX_SIZE - 0x10)
 
diff --git a/src/gallium/drivers/nouveau/nv50/nv50_tex.c b/src/gallium/drivers/nouveau/nv50/nv50_tex.c
index 5cfce3a..0d2604e 100644
--- a/src/gallium/drivers/nouveau/nv50/nv50_tex.c
+++ b/src/gallium/drivers/nouveau/nv50/nv50_tex.c
@@ -286,7 +286,7 @@ nv50_validate_tic(struct nv50_context *nv50, int s)
    }
    if (nv50->num_textures[s]) {
       BEGIN_NV04(push, NV50_3D(CB_ADDR), 1);
-      PUSH_DATA (push, (NV50_CB_AUX_TEX_MS_OFFSET << (8 - 2)) | NV50_CB_AUX);
+      PUSH_DATA (push, ((NV50_CB_AUX_TEX_MS_OFFSET + 16 * s * 2 * 4) << (8 - 2)) | NV50_CB_AUX);
       BEGIN_NI04(push, NV50_3D(CB_DATA(0)), nv50->num_textures[s] * 2);
       for (i = 0; i < nv50->num_textures[s]; i++) {
          struct nv50_tic_entry *tic = nv50_tic_entry(nv50->textures[s][i]);
-- 
1.8.5.5

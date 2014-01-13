From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH 15/19] nv50: add comments about CB_AUX contents
Date: Mon, 13 Jan 2014 14:19:31 -0500
Message-ID: <1389640775-25046-16-git-send-email-imirkin@alum.mit.edu>
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

Updates a few inconsistencies as well, like the size of the buffer,
location of the runout, etc.

Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
---
 src/gallium/drivers/nouveau/nv50/nv50_context.h        | 10 ++++++++++
 src/gallium/drivers/nouveau/nv50/nv50_screen.c         |  8 ++++----
 src/gallium/drivers/nouveau/nv50/nv50_state_validate.c |  2 +-
 3 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/src/gallium/drivers/nouveau/nv50/nv50_context.h b/src/gallium/drivers/nouveau/nv50/nv50_context.h
index ee6eb0e..7bf4ce3 100644
--- a/src/gallium/drivers/nouveau/nv50/nv50_context.h
+++ b/src/gallium/drivers/nouveau/nv50/nv50_context.h
@@ -70,7 +70,17 @@
 #define NV50_CB_PVP 124
 #define NV50_CB_PGP 126
 #define NV50_CB_PFP 125
+/* constant buffer permanently mapped in as c15[] */
 #define NV50_CB_AUX 127
+/* size of the buffer: 64k. not all taken up, can be reduced if needed. */
+#define NV50_CB_AUX_SIZE          (1 << 16)
+/* 8 user clip planes, at 4 32-bit floats each */
+#define NV50_CB_AUX_UCP_OFFSET    0x0
+/* 256 textures, each with 2 16-bit integers specifying the x/y MS shift */
+#define NV50_CB_AUX_MS_OFFSET     0x80
+/* 4 32-bit floats for the vertex runout, put at the end */
+#define NV50_CB_AUX_RUNOUT_OFFSET (NV50_CB_AUX_SIZE - 0x10)
+
 
 
 struct nv50_blitctx;
diff --git a/src/gallium/drivers/nouveau/nv50/nv50_screen.c b/src/gallium/drivers/nouveau/nv50/nv50_screen.c
index 82b0207..9ed2d01 100644
--- a/src/gallium/drivers/nouveau/nv50/nv50_screen.c
+++ b/src/gallium/drivers/nouveau/nv50/nv50_screen.c
@@ -472,7 +472,7 @@ nv50_screen_init_hwctx(struct nv50_screen *screen)
    BEGIN_NV04(push, NV50_3D(CB_DEF_ADDRESS_HIGH), 3);
    PUSH_DATAh(push, screen->uniforms->offset + (3 << 16));
    PUSH_DATA (push, screen->uniforms->offset + (3 << 16));
-   PUSH_DATA (push, (NV50_CB_AUX << 16) | 0x0200);
+   PUSH_DATA (push, (NV50_CB_AUX << 16) | (NV50_CB_AUX_SIZE & 0xffff));
 
    BEGIN_NI04(push, NV50_3D(SET_PROGRAM_CB), 3);
    PUSH_DATA (push, (NV50_CB_AUX << 12) | 0xf01);
@@ -481,15 +481,15 @@ nv50_screen_init_hwctx(struct nv50_screen *screen)
 
    /* return { 0.0, 0.0, 0.0, 0.0 } on out-of-bounds vtxbuf access */
    BEGIN_NV04(push, NV50_3D(CB_ADDR), 1);
-   PUSH_DATA (push, ((1 << 9) << 6) | NV50_CB_AUX);
+   PUSH_DATA (push, (NV50_CB_AUX_RUNOUT_OFFSET << 6) | NV50_CB_AUX);
    BEGIN_NI04(push, NV50_3D(CB_DATA(0)), 4);
    PUSH_DATAf(push, 0.0f);
    PUSH_DATAf(push, 0.0f);
    PUSH_DATAf(push, 0.0f);
    PUSH_DATAf(push, 0.0f);
    BEGIN_NV04(push, NV50_3D(VERTEX_RUNOUT_ADDRESS_HIGH), 2);
-   PUSH_DATAh(push, screen->uniforms->offset + (3 << 16) + (1 << 9));
-   PUSH_DATA (push, screen->uniforms->offset + (3 << 16) + (1 << 9));
+   PUSH_DATAh(push, screen->uniforms->offset + (3 << 16) + NV50_CB_AUX_RUNOUT_OFFSET);
+   PUSH_DATA (push, screen->uniforms->offset + (3 << 16) + NV50_CB_AUX_RUNOUT_OFFSET);
 
    /* max TIC (bits 4:8) & TSC bindings, per program type */
    for (i = 0; i < 3; ++i) {
diff --git a/src/gallium/drivers/nouveau/nv50/nv50_state_validate.c b/src/gallium/drivers/nouveau/nv50/nv50_state_validate.c
index 86b9a23..3d99b73 100644
--- a/src/gallium/drivers/nouveau/nv50/nv50_state_validate.c
+++ b/src/gallium/drivers/nouveau/nv50/nv50_state_validate.c
@@ -238,7 +238,7 @@ nv50_validate_clip(struct nv50_context *nv50)
 
    if (nv50->dirty & NV50_NEW_CLIP) {
       BEGIN_NV04(push, NV50_3D(CB_ADDR), 1);
-      PUSH_DATA (push, (0 << 8) | NV50_CB_AUX);
+      PUSH_DATA (push, (NV50_CB_AUX_UCP_OFFSET << 8) | NV50_CB_AUX);
       BEGIN_NI04(push, NV50_3D(CB_DATA(0)), PIPE_MAX_CLIP_PLANES * 4);
       PUSH_DATAp(push, &nv50->clip.ucp[0][0], PIPE_MAX_CLIP_PLANES * 4);
    }
-- 
1.8.3.2

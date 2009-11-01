From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] nv30/exa: support more 16bpp formats
Date: Sun, 1 Nov 2009 22:16:50 +0100
Message-ID: <20091101211646.GA24891@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 src/nv30_exa.c |   18 ++++++++++++++++--
 1 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/src/nv30_exa.c b/src/nv30_exa.c
index 9e1524d..67a8720 100644
--- a/src/nv30_exa.c
+++ b/src/nv30_exa.c
@@ -64,6 +64,7 @@ NV30SurfaceFormat[] = {
 	{ PICT_x8b8g8r8	, 0x14f },
 	{ PICT_r5g6b5	, 0x143 },
 	{ PICT_a8       , 0x149 },
+	{ PICT_x1r5g5b5	, 0x142 },
 };
 
 static nv_pict_surface_format_t *
@@ -123,18 +124,21 @@ NV30EXAHackupA8Shaders(ScrnInfoPtr pScrn)
 }
 
 /* should be in nouveau_reg.h at some point.. */
-#define NV34TCL_TX_SWIZZLE_UNIT_S0_X_SHIFT	14
 #define NV34TCL_TX_SWIZZLE_UNIT_S0_X_ZERO	 0
 #define NV34TCL_TX_SWIZZLE_UNIT_S0_X_ONE	 1
 #define NV34TCL_TX_SWIZZLE_UNIT_S0_X_S1		 2
+
+#define NV34TCL_TX_SWIZZLE_UNIT_S0_X_SHIFT	14
 #define NV34TCL_TX_SWIZZLE_UNIT_S0_Y_SHIFT	12
 #define NV34TCL_TX_SWIZZLE_UNIT_S0_Z_SHIFT	10
 #define NV34TCL_TX_SWIZZLE_UNIT_S0_W_SHIFT	 8
-#define NV34TCL_TX_SWIZZLE_UNIT_S1_X_SHIFT	 6
+
 #define NV34TCL_TX_SWIZZLE_UNIT_S1_X_X		 3
 #define NV34TCL_TX_SWIZZLE_UNIT_S1_X_Y		 2
 #define NV34TCL_TX_SWIZZLE_UNIT_S1_X_Z		 1
 #define NV34TCL_TX_SWIZZLE_UNIT_S1_X_W		 0
+
+#define NV34TCL_TX_SWIZZLE_UNIT_S1_X_SHIFT	 6
 #define NV34TCL_TX_SWIZZLE_UNIT_S1_Y_SHIFT	 4
 #define NV34TCL_TX_SWIZZLE_UNIT_S1_Z_SHIFT	 2
 #define NV34TCL_TX_SWIZZLE_UNIT_S1_W_SHIFT	 0
@@ -159,11 +163,21 @@ NV30TextureFormat[] = {
 	_(a8b8g8r8, 0x12,   S1,   S1,   S1,   S1, Z, Y, X, W),
 	_(x8r8g8b8, 0x12,   S1,   S1,   S1,  ONE, X, Y, Z, W),
 	_(x8b8g8r8, 0x12,   S1,   S1,   S1,  ONE, Z, Y, X, W),
+
 	_(a1r5g5b5, 0x10,   S1,   S1,   S1,   S1, X, Y, Z, W),
 	_(x1r5g5b5, 0x10,   S1,   S1,   S1,  ONE, X, Y, Z, W),
+	_(a1b5g5r5, 0x10,   S1,   S1,   S1,   S1, Z, Y, X, W),
+	_(x1b5g5r5, 0x10,   S1,   S1,   S1,  ONE, Z, Y, X, W),
+
 	_(x4r4g4b4, 0x1d,   S1,   S1,   S1,  ONE, X, Y, Z, W),
 	_(a4r4g4b4, 0x1d,   S1,   S1,   S1,   S1, X, Y, Z, W),
+	_(x4b4g4r4, 0x1d,   S1,   S1,   S1,  ONE, Z, Y, X, W),
+	_(a4b4g4r4, 0x1d,   S1,   S1,   S1,   S1, Z, Y, X, W),
+
 	_(      a8, 0x1b, ZERO, ZERO, ZERO,   S1, X, X, X, X),
+
+	_(  r5g6b5, 0x11,   S1,   S1,   S1,  ONE, X, Y, Z, W),
+	_(  b5g6r5, 0x11,   S1,   S1,   S1,  ONE, Z, Y, X, W),
 };
 
 
-- 
1.6.4.4

From: Xavier Chantry <chantry.xavier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] nv10/exa : demagify tex and rt format
Date: Tue, 20 Apr 2010 19:45:39 +0200
Message-ID: <1271785539-8405-1-git-send-email-chantry.xavier@gmail.com>
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
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Signed-off-by: Xavier Chantry <chantry.xavier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 src/nv10_exa.c |   35 +++++++++++++++++++----------------
 1 files changed, 19 insertions(+), 16 deletions(-)

diff --git a/src/nv10_exa.c b/src/nv10_exa.c
index 1acb583..23a68e3 100644
--- a/src/nv10_exa.c
+++ b/src/nv10_exa.c
@@ -34,30 +34,33 @@ static struct pict_format {
 	int exa;
 	int hw;
 } nv10_tex_format_pot[] = {
-	{ PICT_a8,       0x80  },
-	{ PICT_r5g6b5,	 0x280 },
-	{ PICT_x8r8g8b8, 0x300 },
-	{ PICT_a8r8g8b8, 0x300 },
+	{ PICT_a8,       NV10TCL_TX_FORMAT_FORMAT_A8 },
+	{ PICT_r5g6b5,	 NV10TCL_TX_FORMAT_FORMAT_R5G6B5 },
+	{ PICT_x8r8g8b8, NV10TCL_TX_FORMAT_FORMAT_A8R8G8B8 },
+	{ PICT_a8r8g8b8, NV10TCL_TX_FORMAT_FORMAT_A8R8G8B8 },
 	{},
 
 }, nv10_tex_format_rect[] = {
-	{ PICT_a8,       0x980 },
-	{ PICT_r5g6b5,   0x880 },
-	{ PICT_x8r8g8b8, 0x900 },
-	{ PICT_a8r8g8b8, 0x900 },
+	{ PICT_a8,       NV10TCL_TX_FORMAT_FORMAT_A8_RECT },
+	{ PICT_r5g6b5,   NV10TCL_TX_FORMAT_FORMAT_R5G6B5_RECT },
+	{ PICT_x8r8g8b8, NV10TCL_TX_FORMAT_FORMAT_A8R8G8B8_RECT },
+	{ PICT_a8r8g8b8, NV10TCL_TX_FORMAT_FORMAT_A8R8G8B8_RECT },
 	{},
 
+/* That's awesome, we need to use the nv20 rect formats on nv20 for
+ * NV10TCL_TX_FORMAT. Only A8_RECT differs between nv10 and nv20, but with the
+ * great side-effect to cause a DATA error when that is enabled */
 }, nv20_tex_format_rect[] = {
-	{ PICT_a8,	 0xd80 },
-	{ PICT_r5g6b5,   0x880 },
-	{ PICT_x8r8g8b8, 0x900 },
-	{ PICT_a8r8g8b8, 0x900 },
+	{ PICT_a8,	 0x1b << NV10TCL_TX_FORMAT_FORMAT_SHIFT },
+	{ PICT_r5g6b5,   NV10TCL_TX_FORMAT_FORMAT_R5G6B5_RECT },
+	{ PICT_x8r8g8b8, NV10TCL_TX_FORMAT_FORMAT_A8R8G8B8_RECT },
+	{ PICT_a8r8g8b8, NV10TCL_TX_FORMAT_FORMAT_A8R8G8B8_RECT },
 	{},
 
 }, nv10_rt_format[] = {
-	{ PICT_r5g6b5,	 0x103 },
-	{ PICT_x8r8g8b8, 0x108 },
-	{ PICT_a8r8g8b8, 0x108 },
+	{ PICT_r5g6b5,	 NV10TCL_RT_FORMAT_COLOR_R5G6B5 },
+	{ PICT_x8r8g8b8, NV10TCL_RT_FORMAT_COLOR_X8R8G8B8 },
+	{ PICT_a8r8g8b8, NV10TCL_RT_FORMAT_COLOR_A8R8G8B8 },
 	{},
 };
 
@@ -432,7 +435,7 @@ setup_render_target(NVPtr pNv, PicturePtr pict, PixmapPtr pixmap)
 	struct nouveau_bo *bo = nouveau_pixmap_bo(pixmap);
 
 	BEGIN_RING(chan, celsius, NV10TCL_RT_FORMAT, 2);
-	OUT_RING  (chan, get_rt_format(pict));
+	OUT_RING  (chan, get_rt_format(pict) | NV10TCL_RT_FORMAT_TYPE_LINEAR);
 	OUT_RING  (chan, (exaGetPixmapPitch(pixmap) << 16 |
 			  exaGetPixmapPitch(pixmap)));
 
-- 
1.7.0.5

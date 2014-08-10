From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH 3/4] exa/nv10: fix blend function setup to check
	the correct mask
Date: Sun, 10 Aug 2014 02:25:14 -0400
Message-ID: <1407651915-7500-3-git-send-email-imirkin@alum.mit.edu>
References: <1407651915-7500-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1407651915-7500-1-git-send-email-imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
---
 src/nv10_exa.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/src/nv10_exa.c b/src/nv10_exa.c
index 47cf0ef..6b75a9e 100644
--- a/src/nv10_exa.c
+++ b/src/nv10_exa.c
@@ -461,7 +461,7 @@ setup_render_target(NVPtr pNv, PicturePtr pict, PixmapPtr pixmap)
 }
 
 static void
-setup_blend_function(NVPtr pNv, PicturePtr pdpict, int alu)
+setup_blend_function(NVPtr pNv, PicturePtr pdpict, PicturePtr pmpict, int alu)
 {
 	struct nouveau_pushbuf *push = pNv->pushbuf;
 	struct pict_op *op = &nv10_pict_op[alu];
@@ -476,7 +476,7 @@ setup_blend_function(NVPtr pNv, PicturePtr pdpict, int alu)
 		 */
 		src_factor = SF(ZERO);
 
-	if (effective_component_alpha(pNv->pmpict)) {
+	if (effective_component_alpha(pmpict)) {
 		if (dst_factor == DF(SRC_ALPHA))
 			dst_factor = DF(SRC_COLOR);
 		else if (dst_factor == DF(ONE_MINUS_SRC_ALPHA))
@@ -557,7 +557,7 @@ NV10EXAPrepareComposite(int op,
 	/* setup render target and blending */
 	if (!setup_render_target(pNv, pict_dst, dst))
 		return FALSE;
-	setup_blend_function(pNv, pict_dst, op);
+	setup_blend_function(pNv, pict_dst, pict_mask, op);
 
 	/* select picture sources */
 	if (!setup_picture(pNv, pict_src, src, 0, &sc, &sa))
-- 
1.8.5.5

From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: [PATCH] nv10/exa: Allow component-alpha masks.
Date: Mon,  5 Oct 2009 06:47:44 +0200
Message-ID: <1254718064-25016-1-git-send-email-currojerez@riseup.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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


Signed-off-by: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
---
 src/nv10_exa.c |   18 ++++++++----------
 1 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/src/nv10_exa.c b/src/nv10_exa.c
index 71184b1..62cc9aa 100644
--- a/src/nv10_exa.c
+++ b/src/nv10_exa.c
@@ -97,8 +97,6 @@ static Bool NV10CheckTexture(PicturePtr Picture)
 		return FALSE;
 	if (Picture->filter != PictFilterNearest && Picture->filter != PictFilterBilinear)
 		return FALSE;
-	if (Picture->componentAlpha)
-		return FALSE;
 	/* we cannot repeat on NV10 because NPOT textures do not support this. unfortunately. */
 	if (Picture->repeat != RepeatNone)
 		/* we can repeat 1x1 textures */
@@ -114,8 +112,6 @@ static Bool NV10CheckBuffer(PicturePtr Picture)
 
 	if ((w > 4096) || (h > 4096))
 		return FALSE;
-	if (Picture->componentAlpha)
-		return FALSE;
 	if (!NV10DstFormat(Picture->format))
 		return FALSE;
 	return TRUE;
@@ -513,12 +509,14 @@ unsigned int color0 = 0, color1 = 0;
 
 	if ( ! mask )
 		rc0_in_rgb |= B_RGB_ONE;
-	else 
-		if (  mask->format == PICT_x8r8g8b8 )  /*no alpha? ignore it*/
-			rc0_in_rgb |= B_RGB_ONE;
-		else
-			rc0_in_rgb |= 0x00190000; /*B = a_1*/
-		
+	else if (mask->componentAlpha && PICT_FORMAT_RGB(mask->format))
+		rc0_in_rgb |= 0x00090000; /*B = rgb_1*/
+	else if (PICT_FORMAT_A(mask->format))
+		rc0_in_rgb |= 0x00190000; /*B = a_1*/
+	else /*no alpha? ignore it*/
+		rc0_in_rgb |= B_RGB_ONE;
+
+
 	BEGIN_RING(chan, celcius, NV10TCL_RC_IN_ALPHA(0), 6);
 	OUT_RING  (chan, rc0_in_alpha);
 	OUT_RING  (chan, rc1_in_alpha);
-- 
1.6.3.3

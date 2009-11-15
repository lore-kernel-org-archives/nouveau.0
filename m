From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: [PATCH] nv20: Fix build for the last nouveau_class.h
	changes.
Date: Sun, 15 Nov 2009 14:49:02 +0100
Message-ID: <1258292942-28109-1-git-send-email-currojerez@riseup.net>
References: <87y6mkrguh.fsf@riseup.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <87y6mkrguh.fsf-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
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
 src/gallium/drivers/nv20/nv20_context.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/src/gallium/drivers/nv20/nv20_context.c b/src/gallium/drivers/nv20/nv20_context.c
index 9a48739..276db8b 100644
--- a/src/gallium/drivers/nv20/nv20_context.c
+++ b/src/gallium/drivers/nv20/nv20_context.c
@@ -360,13 +360,13 @@ static void nv20_init_hwctx(struct nv20_context *nv20)
 	OUT_RINGf (0.0);
 	OUT_RINGf (16777216.0); /* [0, 1] scaled approx to [0, 2^24] */
 
-	BEGIN_RING(kelvin, NV20TCL_VIEWPORT_SCALE0_X, 4);
+	BEGIN_RING(kelvin, NV20TCL_VIEWPORT_TRANSLATE_X, 4);
 	OUT_RINGf (0.0); /* x-offset, w/2 + 1.031250 */
 	OUT_RINGf (0.0); /* y-offset, h/2 + 0.030762 */
 	OUT_RINGf (0.0);
 	OUT_RINGf (16777215.0);
 
-	BEGIN_RING(kelvin, NV20TCL_VIEWPORT_SCALE1_X, 4);
+	BEGIN_RING(kelvin, NV20TCL_VIEWPORT_SCALE_X, 4);
 	OUT_RINGf (0.0); /* no effect?, w/2 */
 	OUT_RINGf (0.0); /* no effect?, h/2 */
 	OUT_RINGf (16777215.0 * 0.5);
-- 
1.6.4.4

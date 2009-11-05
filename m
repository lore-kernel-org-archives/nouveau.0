From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: [PATCH] nv10/exa: Rename VIEWPORT_SCALE to
	VIEWPORT_TRANSLATE.
Date: Thu,  5 Nov 2009 19:06:24 +0100
Message-ID: <1257444384-22158-1-git-send-email-currojerez@riseup.net>
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
 src/nv10_exa.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/src/nv10_exa.c b/src/nv10_exa.c
index 70f2fbc..9ccca8f 100644
--- a/src/nv10_exa.c
+++ b/src/nv10_exa.c
@@ -930,7 +930,7 @@ NVAccelInitNV10TCL(ScrnInfoPtr pScrn)
 	OUT_RING  (chan, 0);
 	OUT_RINGf (chan, 65536.0);
 
-	BEGIN_RING(chan, celsius, NV10TCL_VIEWPORT_SCALE_X, 4);
+	BEGIN_RING(chan, celsius, NV10TCL_VIEWPORT_TRANSLATE_X, 4);
 	OUT_RINGf (chan, -2048.0);
 	OUT_RINGf (chan, -2048.0);
 	OUT_RINGf (chan, 0);
-- 
1.6.4.4

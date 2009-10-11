From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: [PATCHv2 2/2] Partially revert "kms: always set gamma on
	modeset"
Date: Sun, 11 Oct 2009 23:58:06 +0200
Message-ID: <1255298286-4184-1-git-send-email-currojerez@riseup.net>
References: <1255287177-31527-2-git-send-email-currojerez@riseup.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1255287177-31527-2-git-send-email-currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
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
Cc: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

6c8d3e39b72abe897b08d9e90cae85e121863d2c breaks gamma setting with
servers older than 1.7. Keep the call to xf86HandleColormaps even with
KMS enabled, as it's a no-op in the cases we don't need it.

Signed-off-by: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
---
 src/nv_driver.c |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/src/nv_driver.c b/src/nv_driver.c
index 4255c19..4595940 100644
--- a/src/nv_driver.c
+++ b/src/nv_driver.c
@@ -1690,8 +1690,7 @@ NVScreenInit(int scrnIndex, ScreenPtr pScreen, int argc, char **argv)
 	 * Initialize colormap layer.
 	 * Must follow initialization of the default colormap 
 	 */
-	if (!pNv->kms_enable &&
-	    !xf86HandleColormaps(pScreen, 256, 8, NVLoadPalette,
+	if (!xf86HandleColormaps(pScreen, 256, 8, NVLoadPalette,
 				 NULL, CMAP_PALETTED_TRUECOLOR))
 		return FALSE;
 
-- 
1.6.4.4

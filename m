From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: [PATCH 2/2] Revert "kms: always set gamma on modeset"
Date: Sun, 11 Oct 2009 20:52:57 +0200
Message-ID: <1255287177-31527-2-git-send-email-currojerez@riseup.net>
References: <1255287177-31527-1-git-send-email-currojerez@riseup.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1255287177-31527-1-git-send-email-currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
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

This reverts commit 6c8d3e39b72abe897b08d9e90cae85e121863d2c, as it
breaks gamma setting with servers older than 1.7.

Signed-off-by: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
---
It looks like it was intended to workaround the problem in NVLoadPalette
PATCH1 fixes. 

 src/drmmode_display.c |    7 +++++--
 src/nv_driver.c       |    3 +--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/src/drmmode_display.c b/src/drmmode_display.c
index 3930814..43aca64 100644
--- a/src/drmmode_display.c
+++ b/src/drmmode_display.c
@@ -346,8 +346,11 @@ drmmode_set_mode_major(xf86CrtcPtr crtc, DisplayModePtr mode,
 	}
 
 #if XF86_CRTC_VERSION >= 3
-	crtc->funcs->gamma_set(crtc, crtc->gamma_red, crtc->gamma_green,
-			       crtc->gamma_blue, crtc->gamma_size);
+	/* Only upload when needed, to avoid unneeded delays. */
+	if (!crtc->active)
+		crtc->funcs->gamma_set(crtc, crtc->gamma_red, crtc->gamma_green,
+					crtc->gamma_blue, crtc->gamma_size);
+
 	crtc->active = TRUE;
 #endif
 
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

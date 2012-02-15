From: Mario Kleiner <mario.kleiner-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org>
Subject: [PATCH 3/9] dri2: Add support for DRI2SwapLimit() API.
Date: Thu, 16 Feb 2012 00:45:18 +0100
Message-ID: <1329349524-11650-4-git-send-email-mario.kleiner@tuebingen.mpg.de>
References: <1329349524-11650-1-git-send-email-mario.kleiner@tuebingen.mpg.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1329349524-11650-1-git-send-email-mario.kleiner-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: xorg-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, mario.kleiner-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org
List-Id: nouveau.vger.kernel.org

Uses the new DRI2SwapLimit() API of X-Server 1.12+
to allow to change the maximum number of pending
swaps on a drawable before the OpenGL client is
throttled by the server.

The new optional xorg.conf parameter "SwapLimit"
allows to select a new swap limit >= 1. The default
swap limit is 2 for triple-buffering on XOrg 1.12+,
1 for double-buffering on older servers, as we can't
change the swap limit there.

Signed-off-by: Mario Kleiner <mario.kleiner-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org>
---
 man/nouveau.man    |   11 +++++++++++
 src/nouveau_dri2.c |   29 +++++++++++++++++++++++++++--
 src/nv_const.h     |    2 ++
 src/nv_driver.c    |   34 ++++++++++++++++++++++++++++++++++
 src/nv_type.h      |    3 +++
 5 files changed, 77 insertions(+), 2 deletions(-)

diff --git a/man/nouveau.man b/man/nouveau.man
index dd9d938..59f6c1a 100644
--- a/man/nouveau.man
+++ b/man/nouveau.man
@@ -93,6 +93,17 @@ will assign xrandr outputs LVDS and VGA-0 to this instance of the driver.
 .TP
 .BI "Option \*qPageFlip\*q \*q" boolean \*q
 Enable DRI2 page flipping. Default: on.
+.TP
+.BI "Option \*qSwapLimit\*q \*q" integer \*q
+Set maximum allowed number of pending OpenGL double-buffer swaps for
+a drawable before a client is blocked.
+.br
+A value of 1 corresponds to double-buffering. A value of 2 corresponds
+to triple-buffering. Higher values may allow higher framerate, but also
+increase lag for interactive applications, e.g., games. Nouveau currently
+supports a maximum value of 2 on XOrg 1.12+ and a maximum of 1 on older servers.
+.br
+Default: 2 for XOrg 1.12+, 1 for older servers.
 .SH "SEE ALSO"
 __xservername__(__appmansuffix__), __xconfigfile__(__filemansuffix__), Xserver(__appmansuffix__), X(__miscmansuffix__)
 .SH AUTHORS
diff --git a/src/nouveau_dri2.c b/src/nouveau_dri2.c
index acef08a..2908e56 100644
--- a/src/nouveau_dri2.c
+++ b/src/nouveau_dri2.c
@@ -42,6 +42,11 @@ nouveau_dri2_create_buffer(DrawablePtr pDraw, unsigned int attachment,
 		} else {
 			WindowPtr pwin = (WindowPtr)pDraw;
 			ppix = pScreen->GetWindowPixmap(pwin);
+
+#if DRI2INFOREC_VERSION >= 6
+			/* Set initial swap limit on drawable. */
+			DRI2SwapLimit(pDraw, pNv->swap_limit);
+#endif
 		}
 
 		ppix->refcnt++;
@@ -208,6 +213,20 @@ nouveau_wait_vblank(DrawablePtr draw, int type, CARD64 msc,
 	return 0;
 }
 
+#if DRI2INFOREC_VERSION >= 6
+static Bool
+nouveau_dri2_swap_limit_validate(DrawablePtr draw, int swap_limit)
+{
+	ScrnInfoPtr scrn = xf86Screens[draw->pScreen->myNum];
+	NVPtr pNv = NVPTR(scrn);
+
+	if ((swap_limit < 1 ) || (swap_limit > pNv->max_swap_limit))
+		return FALSE;
+
+	return TRUE;
+}
+#endif
+
 static void
 nouveau_dri2_finish_swap(DrawablePtr draw, unsigned int frame,
 			 unsigned int tv_sec, unsigned int tv_usec,
@@ -293,8 +312,10 @@ nouveau_dri2_finish_swap(DrawablePtr draw, unsigned int frame,
 	 * not, to prevent it from blocking the client on the next
 	 * GetBuffers request (and let the client do triple-buffering).
 	 *
-	 * XXX - The DRI2SwapLimit() API will allow us to move this to
-	 *	 the flip handler with no FPS hit.
+	 * XXX - The DRI2SwapLimit() API allowed us to move this to
+	 *	 the flip handler with no FPS hit for page flipped swaps.
+	 *       It is still needed for copy swaps as we lack a method
+	 *       to detect true swap completion for DRI2_BLIT_COMPLETE.
 	 */
 	DRI2SwapComplete(s->client, draw, frame, tv_sec, tv_usec,
 			 type, s->func, s->data);
@@ -534,6 +555,10 @@ nouveau_dri2_init(ScreenPtr pScreen)
 	dri2.ScheduleWaitMSC = nouveau_dri2_schedule_wait;
 	dri2.GetMSC = nouveau_dri2_get_msc;
 
+#if DRI2INFOREC_VERSION >= 6
+	dri2.SwapLimitValidate = nouveau_dri2_swap_limit_validate;
+#endif
+
 	return DRI2ScreenInit(pScreen, &dri2);
 }
 
diff --git a/src/nv_const.h b/src/nv_const.h
index a27a951..5c232d4 100644
--- a/src/nv_const.h
+++ b/src/nv_const.h
@@ -15,6 +15,7 @@ typedef enum {
     OPTION_GLX_VBLANK,
     OPTION_ZAPHOD_HEADS,
     OPTION_PAGE_FLIP,
+    OPTION_SWAP_LIMIT,
 } NVOpts;
 
 
@@ -28,6 +29,7 @@ static const OptionInfoRec NVOptions[] = {
     { OPTION_GLX_VBLANK,	"GLXVBlank",	OPTV_BOOLEAN,	{0}, FALSE },
     { OPTION_ZAPHOD_HEADS,	"ZaphodHeads",	OPTV_STRING,	{0}, FALSE },
     { OPTION_PAGE_FLIP,		"PageFlip",	OPTV_BOOLEAN,	{0}, FALSE },
+    { OPTION_SWAP_LIMIT,	"SwapLimit",	OPTV_INTEGER,	{0}, FALSE },
     { -1,                       NULL,           OPTV_NONE,      {0}, FALSE }
 };
 
diff --git a/src/nv_driver.c b/src/nv_driver.c
index 87ef2c4..5def531 100644
--- a/src/nv_driver.c
+++ b/src/nv_driver.c
@@ -31,6 +31,9 @@
 #include "xf86drm.h"
 #include "xf86drmMode.h"
 #include "nouveau_drm.h"
+#ifdef DRI2
+#include "dri2.h"
+#endif
 
 /*
  * Forward definitions for the functions that make up the driver.
@@ -847,6 +850,37 @@ NVPreInit(ScrnInfoPtr pScrn, int flags)
 		(((pScrn->mask.blue >> pScrn->offset.blue) - 1) << pScrn->offset.blue);
 	}
 
+	/* Limit to max 2 pending swaps - we can't handle more than triple-buffering: */
+	pNv->max_swap_limit = 2;
+
+	if(xf86GetOptValInteger(pNv->Options, OPTION_SWAP_LIMIT, &(pNv->swap_limit))) {
+		if (pNv->swap_limit < 1)
+			pNv->swap_limit = 1;
+
+		if (pNv->swap_limit > pNv->max_swap_limit)
+			pNv->swap_limit = pNv->max_swap_limit;
+
+		reason = "";
+		from = X_CONFIG;
+
+		if (DRI2INFOREC_VERSION < 6) {
+			/* No swap limit api in server. Stick to server default of 1. */
+			pNv->swap_limit = 1;
+			from = X_DEFAULT;
+			reason = ": This X-Server only supports a swap limit of 1.";
+		}
+	} else {
+		/* Driver default: Double buffering on old servers, triple-buffering
+		 * on Xorg 1.12+.
+		 */
+		pNv->swap_limit = (DRI2INFOREC_VERSION < 6) ? 1 : 2;
+		reason = "";
+		from = X_DEFAULT;
+	}
+
+	xf86DrvMsg(pScrn->scrnIndex, from, "Swap limit set to %d [Max allowed %d]%s\n",
+		   pNv->swap_limit, pNv->max_swap_limit, reason);
+
 	ret = drmmode_pre_init(pScrn, nouveau_device(pNv->dev)->fd,
 			       pScrn->bitsPerPixel >> 3);
 	if (ret == FALSE)
diff --git a/src/nv_type.h b/src/nv_type.h
index 4204556..73328fc 100644
--- a/src/nv_type.h
+++ b/src/nv_type.h
@@ -53,6 +53,9 @@ typedef struct _NVRec {
     Bool		tiled_scanout;
     Bool		glx_vblank;
     Bool		has_pageflip;
+    int 		swap_limit;
+    int 		max_swap_limit;
+
     ScreenBlockHandlerProcPtr BlockHandler;
     CreateScreenResourcesProcPtr CreateScreenResources;
     CloseScreenProcPtr  CloseScreen;
-- 
1.7.5.4

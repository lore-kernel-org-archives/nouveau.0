From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: [PATCH] kms: No need to upload gamma on set_mode_major in
	older X servers.
Date: Thu, 20 Aug 2009 18:44:38 +0200
Message-ID: <1250786678-29716-1-git-send-email-currojerez@riseup.net>
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

Fixes build for CRTC ABI < 3.

Signed-off-by: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
---
 src/drmmode_display.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/src/drmmode_display.c b/src/drmmode_display.c
index 2c2076c..4b9aecf 100644
--- a/src/drmmode_display.c
+++ b/src/drmmode_display.c
@@ -320,12 +320,14 @@ drmmode_set_mode_major(xf86CrtcPtr crtc, DisplayModePtr mode,
 		drmmode_output_dpms(output, DPMSModeOn);
 	}
 
+#if XF86_CRTC_VERSION >= 3
 	/* Only upload when needed, to avoid unneeded delays. */
 	if (!crtc->active)
 		crtc->funcs->gamma_set(crtc, crtc->gamma_red, crtc->gamma_green,
 					crtc->gamma_blue, crtc->gamma_size);
 
 	crtc->active = TRUE;
+#endif
 
 done:
 	if (!ret) {
-- 
1.6.3.3

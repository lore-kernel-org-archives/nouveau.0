From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [ddx PATCH] add some missing newlines in error messages
Date: Sun, 25 Nov 2012 22:59:49 +0100
Message-ID: <20121125215949.GA13248@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
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
List-Id: nouveau.vger.kernel.org


---
 src/drmmode_display.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/src/drmmode_display.c b/src/drmmode_display.c
index 803785d..4d2d09d 100644
--- a/src/drmmode_display.c
+++ b/src/drmmode_display.c
@@ -357,7 +357,7 @@ drmmode_set_mode_major(xf86CrtcPtr crtc, DisplayModePtr mode,
 
 	if (ret) {
 		xf86DrvMsg(crtc->scrn->scrnIndex, X_ERROR,
-			   "failed to set mode: %s", strerror(-ret));
+			   "failed to set mode: %s\n", strerror(-ret));
 		return FALSE;
 	}
 
@@ -532,7 +532,7 @@ drmmode_gamma_set(xf86CrtcPtr crtc, CARD16 *red, CARD16 *green, CARD16 *blue,
 				  size, red, green, blue);
 	if (ret != 0) {
 		xf86DrvMsg(crtc->scrn->scrnIndex, X_ERROR,
-			   "failed to set gamma: %s", strerror(-ret));
+			   "failed to set gamma: %s\n", strerror(-ret));
 	}
 }
 
-- 
1.7.12

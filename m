From: Jaime Velasco Juan <jsagarribay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] RandR12: Fix flat panel dithering when NVArch !=
	0x11
Date: Sun, 9 Dec 2007 16:12:02 +0000
Message-ID: <20071209161202.GA9689@singular.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
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

commit 2d3ad64b5feeb6966a67317c1fc9bbedfba4b717
Author: Jaime Velasco Juan <jsagarribay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Date:   Sun Dec 9 15:57:27 2007 +0000

    RandR12: Fix flat panel dithering when NVArch != 0x11

diff --git a/src/nv_crtc.c b/src/nv_crtc.c
index 772c919..4bd82cd 100644
--- a/src/nv_crtc.c
+++ b/src/nv_crtc.c
@@ -1854,7 +1854,10 @@ nv_crtc_mode_set_ramdac_regs(xf86CrtcPtr crtc, DisplayModePtr mode, DisplayModeP
 		/* Instead of 1, several other values are also used: 2, 7, 9 */
 		/* The purpose is unknown */
 		if(pNv->FPDither) {
-			regp->dither = 0x00010000;
+			if (pNv->NVArch == 0x11)
+				regp->dither = 0x00010000;
+			else
+				regp->dither = 0x00000001;
 		}
 	}

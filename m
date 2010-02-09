From: =?utf-8?q?Marcin=20Ko=C5=9Bcielnicki?= <koriakin-mP9o5jsk0RY@public.gmane.org>
Subject: [PATCH] Remove some UMS leftovers.
Date: Tue,  9 Feb 2010 20:51:17 +0000
Message-ID: <1265748677-31650-1-git-send-email-koriakin@0x04.net>
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

---
 src/nv_driver.c |   32 +-------------------------------
 1 files changed, 1 insertions(+), 31 deletions(-)

diff --git a/src/nv_driver.c b/src/nv_driver.c
index 248a151..9606d97 100644
--- a/src/nv_driver.c
+++ b/src/nv_driver.c
@@ -315,8 +315,6 @@ NVAdjustFrame(int scrnIndex, int x, int y, int flags)
 /*
  * This is called when VT switching back to the X server.  Its job is
  * to reinitialise the video mode.
- *
- * We may wish to unmap video/MMIO memory too.
  */
 
 /* Mandatory */
@@ -333,9 +331,6 @@ NVEnterVT(int scrnIndex, int flags)
 	if (ret)
 		ErrorF("Unable to get master: %d\n", ret);
 
-	if (!pNv->NoAccel)
-		NVAccelCommonInit(pScrn);
-
 	pNv->allow_dpms = FALSE;
 	if (!xf86SetDesiredModes(pScrn))
 		return FALSE;
@@ -350,8 +345,6 @@ NVEnterVT(int scrnIndex, int flags)
 /*
  * This is called when VT switching away from the X server.  Its job is
  * to restore the previous (text) mode.
- *
- * We may wish to remap video/MMIO memory too.
  */
 
 /* Mandatory */
@@ -586,24 +579,6 @@ NVPreInit(ScrnInfoPtr pScrn, int flags)
 	MessageType from;
 	int ret, i;
 
-	if (flags & PROBE_DETECT) {
-		EntityInfoPtr pEnt = xf86GetEntityInfo(pScrn->entityList[0]);
-
-		if (!pEnt)
-			return FALSE;
-
-		i = pEnt->index;
-		xfree(pEnt);
-
-		if (xf86LoadSubModule(pScrn, "vbe")) {
-			vbeInfoPtr pVbe = VBEInit(NULL, i);
-			ConfiguredMonitor = vbeDoEDID(pVbe, NULL);
-			vbeFree(pVbe);
-		}
-
-		return TRUE;
-	}
-
 	/*
 	 * Note: This function is only called once at server startup, and
 	 * not at the start of each server generation.  This means that
@@ -733,11 +708,6 @@ NVPreInit(ScrnInfoPtr pScrn, int flags)
 			      xf86GetVisualName(pScrn->defaultVisual), pScrn->depth);
 	}
 
-	/* The vgahw module should be loaded here when needed */
-	if (!xf86LoadSubModule(pScrn, "vgahw")) {
-		NVPreInitFail("\n");
-	}
-
 	/* We use a programmable clock */
 	pScrn->progClock = TRUE;
 
@@ -905,7 +875,7 @@ NVMapMem(ScrnInfoPtr pScrn)
 }
 
 /*
- * Unmap the framebuffer and MMIO memory.
+ * Unmap the framebuffer and offscreen memory.
  */
 
 static Bool
-- 
1.6.4.1

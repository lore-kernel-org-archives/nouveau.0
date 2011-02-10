From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] Also flush from the BlockHandler.
Date: Thu, 10 Feb 2011 20:12:07 +0100
Message-ID: <1297365127-1989-1-git-send-email-madman2003@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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

- The fact that commit 02c50db307a4e4eeb87f7db5d401bc53cce3b21f
  fixed missing text for some people proves this is needed.
  That commit should have only improved latency a bit.
- The FlushCallback is still needed for DRI2 texture_from_pixmap.
- See bugs.fd.o #33977 for discussion.

Signed-off-by: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 src/nv_driver.c |    9 ++++++---
 1 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/src/nv_driver.c b/src/nv_driver.c
index 3e009fc..523cab8 100644
--- a/src/nv_driver.c
+++ b/src/nv_driver.c
@@ -384,15 +384,18 @@ NVBlockHandler (
 )
 {
 	ScreenPtr pScreen = screenInfo.screens[i];
-	ScrnInfoPtr pScrnInfo = xf86Screens[i];
-	NVPtr pNv = NVPTR(pScrnInfo);
+	ScrnInfoPtr pScrn = xf86Screens[i];
+	NVPtr pNv = NVPTR(pScrn);
 
 	pScreen->BlockHandler = pNv->BlockHandler;
 	(*pScreen->BlockHandler) (i, blockData, pTimeout, pReadmask);
 	pScreen->BlockHandler = NVBlockHandler;
 
+	if (pScrn->vtSema && !pNv->NoAccel)
+		FIRE_RING (pNv->chan);
+
 	if (pNv->VideoTimerCallback) 
-		(*pNv->VideoTimerCallback)(pScrnInfo, currentTime.milliseconds);
+		(*pNv->VideoTimerCallback)(pScrn, currentTime.milliseconds);
 }
 
 static Bool
-- 
1.7.4

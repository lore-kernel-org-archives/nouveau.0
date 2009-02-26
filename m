From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/2] exa: do PrepareAccess for classic too,
	since we do need to map the frontbuffer.
Date: Thu, 26 Feb 2009 21:55:23 +0100
Message-ID: <1235681723-11180-2-git-send-email-madman2003@gmail.com>
References: <1235681723-11180-1-git-send-email-madman2003@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1235681723-11180-1-git-send-email-madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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

- I'm surprised we didn't get serious complaints about not being able to render to the frontbuffer.
---
 src/nouveau_exa.c |   16 ++++++++++------
 1 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/src/nouveau_exa.c b/src/nouveau_exa.c
index 20ad380..4b21e80 100644
--- a/src/nouveau_exa.c
+++ b/src/nouveau_exa.c
@@ -265,12 +265,14 @@ nouveau_exa_wait_marker(ScreenPtr pScreen, int marker)
 static Bool
 nouveau_exa_prepare_access(PixmapPtr ppix, int index)
 {
-	ScrnInfoPtr pScrn = xf86Screens[ppix->drawable.pScreen->myNum];
+	ScreenPtr pScreen = ppix->drawable.pScreen;
+	ScrnInfoPtr pScrn = xf86Screens[pScreen->myNum];
 	NVPtr pNv = NVPTR(pScrn);
 
-	if (pNv->exa_driver_pixmaps) {
+	if (pNv->exa_driver_pixmaps || pScreen->GetScreenPixmap(pScreen) == ppix) {
 		void *map = nouveau_exa_pixmap_map(ppix);
 
+		/* Really bad if this is the frontbuffer. */
 		if (!map)
 			return FALSE;
 
@@ -284,10 +286,11 @@ nouveau_exa_prepare_access(PixmapPtr ppix, int index)
 static void
 nouveau_exa_finish_access(PixmapPtr ppix, int index)
 {
-	ScrnInfoPtr pScrn = xf86Screens[ppix->drawable.pScreen->myNum];
+	ScreenPtr pScreen = ppix->drawable.pScreen;
+	ScrnInfoPtr pScrn = xf86Screens[pScreen->myNum];
 	NVPtr pNv = NVPTR(pScrn);
 
-	if (pNv->exa_driver_pixmaps)
+	if (pNv->exa_driver_pixmaps || pScreen->GetScreenPixmap(pScreen) == ppix)
 		nouveau_exa_pixmap_unmap(ppix);
 }
 
@@ -553,8 +556,6 @@ nouveau_exa_init(ScreenPtr pScreen)
 		exa->pixmapPitchAlign = 64;
 
 		exa->PixmapIsOffscreen = nouveau_exa_pixmap_is_offscreen;
-		exa->PrepareAccess = nouveau_exa_prepare_access;
-		exa->FinishAccess = nouveau_exa_finish_access;
 		exa->CreatePixmap = nouveau_exa_create_pixmap;
 		exa->DestroyPixmap = nouveau_exa_destroy_pixmap;
 		exa->ModifyPixmapHeader = nouveau_exa_modify_pixmap_header;
@@ -604,6 +605,9 @@ nouveau_exa_init(ScreenPtr pScreen)
 		exa->maxY = 2048;
 	}
 
+	exa->PrepareAccess = nouveau_exa_prepare_access;
+	exa->FinishAccess = nouveau_exa_finish_access;
+
 	exa->MarkSync = nouveau_exa_mark_sync;
 	exa->WaitMarker = nouveau_exa_wait_marker;
 
-- 
1.6.1.3

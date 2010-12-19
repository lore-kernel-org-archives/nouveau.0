From: Xavier Chantry <chantry.xavier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] nv04_exa: kill useless WAIT_RING
Date: Sun, 19 Dec 2010 23:17:34 +0100
Message-ID: <1292797054-12001-1-git-send-email-chantry.xavier@gmail.com>
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

---
 src/nv04_exa.c |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/src/nv04_exa.c b/src/nv04_exa.c
index 2760d4b..bc20ca3 100644
--- a/src/nv04_exa.c
+++ b/src/nv04_exa.c
@@ -148,7 +148,6 @@ NV04EXASolid (PixmapPtr pPixmap, int x1, int y1, int x2, int y2)
 	int width = x2-x1;
 	int height = y2-y1;
 
-	WAIT_RING (chan, 3);
 	BEGIN_RING(chan, rect,
 		   NV04_GDI_RECTANGLE_TEXT_UNCLIPPED_RECTANGLE_POINT(0), 2);
 	OUT_RING  (chan, (x1 << 16) | y1);
@@ -278,7 +277,6 @@ NV04EXACopy(PixmapPtr pDstPixmap, int srcX, int srcY, int dstX, int dstY,
 		dstY = 0;
 	}
 
-	WAIT_RING (chan, 4);
 	BEGIN_RING(chan, blit, NV01_IMAGE_BLIT_POINT_IN, 3);
 	OUT_RING  (chan, (srcY << 16) | srcX);
 	OUT_RING  (chan, (dstY << 16) | dstX);
-- 
1.7.3.3

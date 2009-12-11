From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: [PATCH 2/2] dri2: Make the render targets tiled for
	pre-G80 cards.
Date: Fri, 11 Dec 2009 19:35:42 +0100
Message-ID: <1260556542-13431-2-git-send-email-currojerez@riseup.net>
References: <1260556542-13431-1-git-send-email-currojerez@riseup.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1260556542-13431-1-git-send-email-currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
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

Signed-off-by: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
---
 src/nouveau_dri2.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/src/nouveau_dri2.c b/src/nouveau_dri2.c
index a480a29..4bc019b 100644
--- a/src/nouveau_dri2.c
+++ b/src/nouveau_dri2.c
@@ -44,11 +44,11 @@ nouveau_dri2_create_buffer(DrawablePtr pDraw, unsigned int attachment,
 
 		ppix->refcnt++;
 	} else {
-		unsigned int usage_hint = 0;
+		unsigned int usage_hint = NOUVEAU_CREATE_PIXMAP_TILED;
 
 		if (attachment == DRI2BufferDepth ||
 		    attachment == DRI2BufferDepthStencil)
-			usage_hint = NOUVEAU_CREATE_PIXMAP_ZETA;
+			usage_hint |= NOUVEAU_CREATE_PIXMAP_ZETA;
 
 		ppix = pScreen->CreatePixmap(pScreen, pDraw->width,
 					     pDraw->height, pDraw->depth,
-- 
1.6.4.4

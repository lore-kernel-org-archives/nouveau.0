From: Mario Kleiner <mario.kleiner-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org>
Subject: [PATCH 1/9] dri2: Fix can_exchange() to allow
	page-flipping on new servers.
Date: Thu, 16 Feb 2012 00:45:16 +0100
Message-ID: <1329349524-11650-2-git-send-email-mario.kleiner@tuebingen.mpg.de>
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

can_exchange() fails on at least Xorg 1.12+. This fixes
it in the same way it was fixed in the ati & intel ddx.

Signed-off-by: Mario Kleiner <mario.kleiner-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org>
---
 src/nouveau_dri2.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/src/nouveau_dri2.c b/src/nouveau_dri2.c
index 3aa5ec5..5b62425 100644
--- a/src/nouveau_dri2.c
+++ b/src/nouveau_dri2.c
@@ -160,7 +160,7 @@ can_exchange(DrawablePtr draw, PixmapPtr dst_pix, PixmapPtr src_pix)
 	return ((DRI2CanFlip(draw) && pNv->has_pageflip)) &&
 		dst_pix->drawable.width == src_pix->drawable.width &&
 		dst_pix->drawable.height == src_pix->drawable.height &&
-		dst_pix->drawable.depth == src_pix->drawable.depth &&
+		dst_pix->drawable.bitsPerPixel == src_pix->drawable.bitsPerPixel &&
 		dst_pix->devKind == src_pix->devKind;
 }
 
-- 
1.7.5.4

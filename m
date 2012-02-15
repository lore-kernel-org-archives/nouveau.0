From: Mario Kleiner <mario.kleiner-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org>
Subject: [PATCH 6/9] dri2: Allow vblank controlled swaps for
	redirected windows. Part I
Date: Thu, 16 Feb 2012 00:45:21 +0100
Message-ID: <1329349524-11650-7-git-send-email-mario.kleiner@tuebingen.mpg.de>
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

Make sure that swaps for redirected windows under a
compositor are still scheduled via vblank events, to
avoid effects like 2900 fps swaps under a compositor.

See discussion with Francisco Jerez at:

http://lists.freedesktop.org/archives/nouveau/2011-September/009278.html
http://lists.freedesktop.org/archives/nouveau/2011-September/009292.html

This is part I of the agreed upon band-aid, in a separate patch.

It allows to use vblank related functions on redirected
windows and thereby fixes functions from sgi_sync_control
and oml_sync_control extension, e.g., glXWaitForMscOML(),
glXGetSyncValuesOML(), glXWaitVideoSyncSGI, ...

Signed-off-by: Mario Kleiner <mario.kleiner-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org>
---
 src/nouveau_dri2.c |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/src/nouveau_dri2.c b/src/nouveau_dri2.c
index 719b3bb..6a0800c 100644
--- a/src/nouveau_dri2.c
+++ b/src/nouveau_dri2.c
@@ -204,10 +204,8 @@ can_sync_to_vblank(DrawablePtr draw)
 {
 	ScrnInfoPtr scrn = xf86Screens[draw->pScreen->myNum];
 	NVPtr pNv = NVPTR(scrn);
-	PixmapPtr pix = NVGetDrawablePixmap(draw);
 
 	return pNv->glx_vblank &&
-		nouveau_exa_pixmap_is_onscreen(pix) &&
 		nv_window_belongs_to_crtc(scrn, draw->x, draw->y,
 					  draw->width, draw->height);
 }
-- 
1.7.5.4

From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH 1/2] drmmode: fix screen resize without
 acceleration
Date: Sat, 18 Jul 2020 18:53:18 -0400
Message-ID: <20200718225319.27884-1-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

This got broken with commit 86024cee back in 2014!
drmmode_pixmap/nouveau_pixmap expect there to be EXA wrapping around the
pixmap now, which is not there without accel.

Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
---
 src/drmmode_display.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/drmmode_display.c b/src/drmmode_display.c
index 89927a4..69421e1 100644
--- a/src/drmmode_display.c
+++ b/src/drmmode_display.c
@@ -1561,7 +1561,7 @@ drmmode_xf86crtc_resize(ScrnInfoPtr scrn, int width, int height)
 	}
 
 	ppix = screen->GetScreenPixmap(screen);
-	if (pNv->AccelMethod >= NONE)
+	if (pNv->AccelMethod > NONE)
 		nouveau_bo_ref(pNv->scanout, &drmmode_pixmap(ppix)->bo);
 	screen->ModifyPixmapHeader(ppix, width, height, -1, -1, pitch,
 				   (pNv->AccelMethod > NONE || pNv->ShadowPtr) ?
-- 
2.26.2

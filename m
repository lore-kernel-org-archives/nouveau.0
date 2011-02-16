From: Benjamin Franzke <benjaminfranzke-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: [PATCH] drm/nouveau: Fix pageflip event
Date: Wed, 16 Feb 2011 10:04:48 +0100
Message-ID: <1297847088-5824-1-git-send-email-benjaminfranzke@googlemail.com>
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

Assign correct event when initializing nouveau_page_flip_state.
---
 drivers/gpu/drm/nouveau/nouveau_display.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
index c42d84e..764c15d 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.c
+++ b/drivers/gpu/drm/nouveau/nouveau_display.c
@@ -290,7 +290,7 @@ nouveau_crtc_page_flip(struct drm_crtc *crtc, struct drm_framebuffer *fb,
 
 	/* Initialize a page flip struct */
 	*s = (struct nouveau_page_flip_state)
-		{ { }, s->event, nouveau_crtc(crtc)->index,
+		{ { }, event, nouveau_crtc(crtc)->index,
 		  fb->bits_per_pixel, fb->pitch, crtc->x, crtc->y,
 		  new_bo->bo.offset };
 
-- 
1.7.3.4

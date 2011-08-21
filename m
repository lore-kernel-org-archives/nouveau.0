From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] drm/nv50/crtc: Bail out if FB is not bound to crtc
Date: Sun, 21 Aug 2011 22:48:12 +0100
Message-ID: <1313963292-9176-1-git-send-email-emil.l.velikov@gmail.com>
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

Fixes possbile NULL pointer dereference
Resolves 'kernel crash in nv50_crtc_do_mode_set_base during shutdown'
https://bugs.freedesktop.org/show_bug.cgi?id=40005

Signed-off-by: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nv50_crtc.c |   12 ++++++++++--
 1 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nv50_crtc.c b/drivers/gpu/drm/nouveau/nv50_crtc.c
index 636e3fb..882080e 100644
--- a/drivers/gpu/drm/nouveau/nv50_crtc.c
+++ b/drivers/gpu/drm/nouveau/nv50_crtc.c
@@ -517,12 +517,18 @@ nv50_crtc_do_mode_set_base(struct drm_crtc *crtc,
 	struct drm_device *dev = nv_crtc->base.dev;
 	struct drm_nouveau_private *dev_priv = dev->dev_private;
 	struct nouveau_channel *evo = nv50_display(dev)->master;
-	struct drm_framebuffer *drm_fb = nv_crtc->base.fb;
-	struct nouveau_framebuffer *fb = nouveau_framebuffer(drm_fb);
+	struct drm_framebuffer *drm_fb;
+	struct nouveau_framebuffer *fb;
 	int ret;
 
 	NV_DEBUG_KMS(dev, "index %d\n", nv_crtc->index);
 
+	/* no fb bound */
+	if (!atomic && !crtc->fb) {
+		NV_DEBUG_KMS(dev, "No FB bound\n");
+		return 0;
+	}
+
 	/* If atomic, we want to switch to the fb we were passed, so
 	 * now we update pointers to do that.  (We don't pin; just
 	 * assume we're already pinned and update the base address.)
@@ -531,6 +537,8 @@ nv50_crtc_do_mode_set_base(struct drm_crtc *crtc,
 		drm_fb = passed_fb;
 		fb = nouveau_framebuffer(passed_fb);
 	} else {
+		drm_fb = crtc->fb;
+		fb = nouveau_framebuffer(crtc->fb);
 		/* If not atomic, we can go ahead and pin, and unpin the
 		 * old fb we were passed.
 		 */
-- 
1.7.6

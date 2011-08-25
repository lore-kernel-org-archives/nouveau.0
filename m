From: Emil Velikov <emil.l.velikov@gmail.com>
Subject: [PATCH] drm/nv04/crtc: Bail out if FB is not bount to crtc
Date: Thu, 25 Aug 2011 21:36:51 +0100
Message-ID: <1314304611-5869-1-git-send-email-emil.l.velikov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <stable-bounces@linux.kernel.org>
List-Unsubscribe: <http://linux.kernel.org/mailman/options/stable>,
 <mailto:stable-request@linux.kernel.org?subject=unsubscribe>
List-Archive: <http://linux.kernel.org/mailman/private/stable/>
List-Post: <mailto:stable@linux.kernel.org>
List-Help: <mailto:stable-request@linux.kernel.org?subject=help>
List-Subscribe: <http://linux.kernel.org/mailman/listinfo/stable>,
 <mailto:stable-request@linux.kernel.org?subject=subscribe>
Sender: stable-bounces@linux.kernel.org
Errors-To: stable-bounces@linux.kernel.org
To: nouveau@lists.freedesktop.org
Cc: Emil Velikov <emil.l.velikov@gmail.com>, stable@kernel.org
List-Id: nouveau.vger.kernel.org

This commit resolves a possible 'NULL pointer dereference'
It uses the same approach as radeon, intel and nouveau/nv50

Fixes bug 'Nouveau: Kernel oops when unplugging external monitor'
https://bugs.freedesktop.org/show_bug.cgi?id=40336

Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
---
 drivers/gpu/drm/nouveau/nv04_crtc.c |   15 +++++++++++++--
 1 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nv04_crtc.c b/drivers/gpu/drm/nouveau/nv04_crtc.c
index 118261d..5e45398 100644
--- a/drivers/gpu/drm/nouveau/nv04_crtc.c
+++ b/drivers/gpu/drm/nouveau/nv04_crtc.c
@@ -781,11 +781,20 @@ nv04_crtc_do_mode_set_base(struct drm_crtc *crtc,
 	struct drm_device *dev = crtc->dev;
 	struct drm_nouveau_private *dev_priv = dev->dev_private;
 	struct nv04_crtc_reg *regp = &dev_priv->mode_reg.crtc_reg[nv_crtc->index];
-	struct drm_framebuffer *drm_fb = nv_crtc->base.fb;
-	struct nouveau_framebuffer *fb = nouveau_framebuffer(drm_fb);
+	struct drm_framebuffer *drm_fb;
+	struct nouveau_framebuffer *fb;
 	int arb_burst, arb_lwm;
 	int ret;
 
+	NV_DEBUG_KMS(dev, "index %d\n", nv_crtc->index);
+
+	/* no fb bound */
+	if (!atomic && !crtc->fb) {
+		NV_DEBUG_KMS(dev, "No FB bound\n");
+		return 0;
+	}
+
+
 	/* If atomic, we want to switch to the fb we were passed, so
 	 * now we update pointers to do that.  (We don't pin; just
 	 * assume we're already pinned and update the base address.)
@@ -794,6 +803,8 @@ nv04_crtc_do_mode_set_base(struct drm_crtc *crtc,
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

_______________________________________________
stable mailing list
stable@linux.kernel.org
http://linux.kernel.org/mailman/listinfo/stable

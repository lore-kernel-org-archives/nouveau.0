From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] drm/nouveau: by default use low bpp framebuffer
	on low memory cards
Date: Sun,  6 Nov 2011 20:32:04 +0100
Message-ID: <1320607930-21794-2-git-send-email-marcin.slusarz@gmail.com>
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

Framebuffer's BPP is not that important but can waste significant part
of memory on low-VRAM cards. Lower it to 8bpp on < 32MB cards and to
16bpp on 64MB cards. It can still be overridden by video= option.

Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_fbcon.c |   11 ++++++++++-
 1 files changed, 10 insertions(+), 1 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_fbcon.c b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
index 14a8627..3a4cc32 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fbcon.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
@@ -487,6 +487,7 @@ int nouveau_fbcon_init(struct drm_device *dev)
 {
 	struct drm_nouveau_private *dev_priv = dev->dev_private;
 	struct nouveau_fbdev *nfbdev;
+	int preferred_bpp;
 	int ret;
 
 	nfbdev = kzalloc(sizeof(struct nouveau_fbdev), GFP_KERNEL);
@@ -505,7 +506,15 @@ int nouveau_fbcon_init(struct drm_device *dev)
 	}
 
 	drm_fb_helper_single_add_all_connectors(&nfbdev->helper);
-	drm_fb_helper_initial_config(&nfbdev->helper, 32);
+
+	if (dev_priv->vram_size <= 32 * 1024 * 1024)
+		preferred_bpp = 8;
+	else if (dev_priv->vram_size <= 64 * 1024 * 1024)
+		preferred_bpp = 16;
+	else
+		preferred_bpp = 32;
+
+	drm_fb_helper_initial_config(&nfbdev->helper, preferred_bpp);
 	return 0;
 }
 
-- 
1.7.7

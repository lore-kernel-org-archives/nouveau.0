From: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
Subject: [PATCH 30/37] drm/i915: dump refcount into framebuffer
	debugfs file
Date: Wed, 12 Dec 2012 14:07:10 +0100
Message-ID: <1355317637-16742-31-git-send-email-daniel.vetter@ffwll.ch>
References: <1355317637-16742-1-git-send-email-daniel.vetter@ffwll.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1355317637-16742-1-git-send-email-daniel.vetter-/w4YWyX8dFk@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: DRI Development <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Cc: Nouveau Dev <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Intel Graphics Development <intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Radeon Dev <xorg-driver-ati-go0+a7rfsptAfugRpC6u6w@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Useful for checking whether the new refcounting works as advertised.

Signed-off-by: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
---
 drivers/gpu/drm/i915/i915_debugfs.c |   10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i915_debugfs.c
index da1c8b6..e2dc77c 100644
--- a/drivers/gpu/drm/i915/i915_debugfs.c
+++ b/drivers/gpu/drm/i915/i915_debugfs.c
@@ -1369,11 +1369,12 @@ static int i915_gem_framebuffer_info(struct seq_file *m, void *data)
 	ifbdev = dev_priv->fbdev;
 	fb = to_intel_framebuffer(ifbdev->helper.fb);
 
-	seq_printf(m, "fbcon size: %d x %d, depth %d, %d bpp, obj ",
+	seq_printf(m, "fbcon size: %d x %d, depth %d, %d bpp, refcount %d, obj ",
 		   fb->base.width,
 		   fb->base.height,
 		   fb->base.depth,
-		   fb->base.bits_per_pixel);
+		   fb->base.bits_per_pixel,
+		   atomic_read(&fb->base.refcount.refcount));
 	describe_obj(m, fb->obj);
 	seq_printf(m, "\n");
 	mutex_unlock(&dev->mode_config.mutex);
@@ -1383,11 +1384,12 @@ static int i915_gem_framebuffer_info(struct seq_file *m, void *data)
 		if (&fb->base == ifbdev->helper.fb)
 			continue;
 
-		seq_printf(m, "user size: %d x %d, depth %d, %d bpp, obj ",
+		seq_printf(m, "user size: %d x %d, depth %d, %d bpp, refcount %d, obj ",
 			   fb->base.width,
 			   fb->base.height,
 			   fb->base.depth,
-			   fb->base.bits_per_pixel);
+			   fb->base.bits_per_pixel,
+			   atomic_read(&fb->base.refcount.refcount));
 		describe_obj(m, fb->obj);
 		seq_printf(m, "\n");
 	}
-- 
1.7.10.4

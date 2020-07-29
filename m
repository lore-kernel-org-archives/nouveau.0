From: Lyude Paul <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 4/9] drm/nouveau/kms/fbcon: Fix pm_runtime calls
 in nouveau_fbcon_output_poll_changed()
Date: Wed, 29 Jul 2020 17:36:58 -0400
Message-ID: <20200729213703.119137-5-lyude@redhat.com>
References: <20200729213703.119137-1-lyude@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20200729213703.119137-1-lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
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
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: nouveau.vger.kernel.org

Noticed two problems here:
* We're not dropping our runtime PM refs after getting an error
* We're not backing off when pm_runtime_get() indicates that there's
  already a resume in progress (-EINPROGRESS) (after which any delayed
  fbcon events will get handled anyway)

So, let's fix those.

Signed-off-by: Lyude Paul <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Fixes: 7fec8f5379fb ("drm/nouveau/drm/nouveau: Fix deadlock with fb_helper with async RPM requests")
Cc: stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org> # v4.19+
---
 drivers/gpu/drm/nouveau/nouveau_fbcon.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_fbcon.c b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
index 4d9f3b5ae72d2..b936bf1c14dec 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fbcon.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
@@ -503,10 +503,7 @@ nouveau_fbcon_output_poll_changed(struct drm_device *dev)
 	ret = pm_runtime_get(dev->dev);
 	if (ret == 1 || ret == -EACCES) {
 		drm_fb_helper_hotplug_event(&fbcon->helper);
-
-		pm_runtime_mark_last_busy(dev->dev);
-		pm_runtime_put_autosuspend(dev->dev);
-	} else if (ret == 0) {
+	} else if (ret == 0 || ret == -EINPROGRESS) {
 		/* If the GPU was already in the process of suspending before
 		 * this event happened, then we can't block here as we'll
 		 * deadlock the runtime pmops since they wait for us to
@@ -516,11 +513,15 @@ nouveau_fbcon_output_poll_changed(struct drm_device *dev)
 		NV_DEBUG(drm, "fbcon HPD event deferred until runtime resume\n");
 		fbcon->hotplug_waiting = true;
 		pm_runtime_put_noidle(drm->dev->dev);
+		goto out;
 	} else {
 		DRM_WARN("fbcon HPD event lost due to RPM failure: %d\n",
 			 ret);
 	}
 
+	pm_runtime_mark_last_busy(dev->dev);
+	pm_runtime_put_autosuspend(dev->dev);
+out:
 	mutex_unlock(&fbcon->hotplug_lock);
 }
 
-- 
2.26.2

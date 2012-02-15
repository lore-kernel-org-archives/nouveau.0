From: Mario Kleiner <mario.kleiner-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org>
Subject: [PATCH 1/2] drm/nouveau: Use drm_vblank_count_and_time()
	for pageflip completion events.
Date: Wed, 15 Feb 2012 23:55:10 +0100
Message-ID: <1329346511-27433-2-git-send-email-mario.kleiner@tuebingen.mpg.de>
References: <1329346511-27433-1-git-send-email-mario.kleiner@tuebingen.mpg.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1329346511-27433-1-git-send-email-mario.kleiner-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org>
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
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, mario.kleiner-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org
List-Id: nouveau.vger.kernel.org

Emit kms pageflip completion events with proper vblank count
and timestamp for the vblank interval in which the pageflip
completed. This makes the timestamps and counts consistent with
what the OML_sync_control spec defines.

Signed-off-by: Mario Kleiner <mario.kleiner-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_display.c |   29 +++++++++++++++++++++++------
 drivers/gpu/drm/nouveau/nouveau_drv.h     |    1 +
 2 files changed, 24 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
index b12fd2c..5bd392f 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.c
+++ b/drivers/gpu/drm/nouveau/nouveau_display.c
@@ -295,7 +295,7 @@ nouveau_crtc_page_flip(struct drm_crtc *crtc, struct drm_framebuffer *fb,
 	*s = (struct nouveau_page_flip_state)
 		{ { }, event, nouveau_crtc(crtc)->index,
 		  fb->bits_per_pixel, fb->pitch, crtc->x, crtc->y,
-		  new_bo->bo.offset };
+		  new_bo->bo.offset, crtc->framedur_ns };
 
 	/* Choose the channel the flip will be handled in */
 	chan = nouveau_fence_channel(new_bo->bo.sync_obj);
@@ -338,6 +338,9 @@ nouveau_finish_page_flip(struct nouveau_channel *chan,
 	struct drm_device *dev = chan->dev;
 	struct nouveau_page_flip_state *s;
 	unsigned long flags;
+	struct timeval tnow, tvbl;
+
+	do_gettimeofday(&tnow);
 
 	spin_lock_irqsave(&dev->event_lock, flags);
 
@@ -351,12 +354,26 @@ nouveau_finish_page_flip(struct nouveau_channel *chan,
 			     struct nouveau_page_flip_state, head);
 	if (s->event) {
 		struct drm_pending_vblank_event *e = s->event;
-		struct timeval now;
 
-		do_gettimeofday(&now);
-		e->event.sequence = 0;
-		e->event.tv_sec = now.tv_sec;
-		e->event.tv_usec = now.tv_usec;
+		e->event.sequence = drm_vblank_count_and_time(dev, s->crtc, &tvbl);
+
+		/* Called before vblank count and timestamp have
+		 * been updated for the vblank interval of flip
+		 * completion? If so, need to increment vblank count and
+		 * add one videorefresh duration to returned timestamp
+		 * to account for this. We assume this happened if we
+		 * get called over 0.9 frame durations after the last
+		 * timestamped vblank.
+		 */
+		if (10 * (timeval_to_ns(&tnow) - timeval_to_ns(&tvbl)) >
+		     9 * s->framedur_ns) {
+			e->event.sequence++;
+			tvbl = ns_to_timeval(timeval_to_ns(&tvbl) +
+			s->framedur_ns);
+		}
+
+		e->event.tv_sec = tvbl.tv_sec;
+		e->event.tv_usec = tvbl.tv_usec;
 		list_add_tail(&e->base.link, &e->base.file_priv->event_list);
 		wake_up_interruptible(&e->base.file_priv->event_wait);
 	}
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index 4c0be3a..f489c22 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -202,6 +202,7 @@ struct nouveau_page_flip_state {
 	struct drm_pending_vblank_event *event;
 	int crtc, bpp, pitch, x, y;
 	uint64_t offset;
+	s64 framedur_ns;
 };
 
 enum nouveau_channel_mutex_class {
-- 
1.7.5.4

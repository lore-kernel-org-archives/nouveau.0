From: Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Subject: mesa vdpau regression with "dri2: Fix potential race and
 crash for swap at next vblank."
Date: Thu, 28 Mar 2013 12:00:10 +0100
Message-ID: <515422BA.6080702@canonical.com>
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
To: Mario Kleiner <mario.kleiner-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Hey Mario,

It seems that your ddx commit b4231dd715a8 is causing a regression when I use mplayer -vo vdpau rendering with mesa 9.1.
It fails to start drawing here, leaving the mplayer screen black, I can make it recover usually by seeking or moving another
window in front. When I revert the commit it behaves normally. Changing can_sync_to_vblank(draw) to 0 in
nouveau_dri2_schedule_swap also fixes it.

The nouveau kernel driver currently doesn't fill in a frame number, so MSC will always be zero for now,
and this makes mplayer choose target_msc = 0 as 'swap at next interval', which appears to be broken by the commit.

The following patch fixes frame numbers in the nouveau kernel module, but it only decreases the likelyhood of
occuring, it still happens when seeking, for example.

~Maarten

---
diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
index 4610c3a..fd3cb62 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.c
+++ b/drivers/gpu/drm/nouveau/nouveau_display.c
@@ -572,17 +572,21 @@ nouveau_crtc_page_flip(struct drm_crtc *crtc, struct drm_framebuffer *fb,
 	if (!s)
 		return -ENOMEM;
 
-	/* Don't let the buffers go away while we flip */
-	ret = nouveau_page_flip_reserve(old_bo, new_bo);
-	if (ret)
-		goto fail_free;
-
 	/* Initialize a page flip struct */
 	*s = (struct nouveau_page_flip_state)
 		{ { }, event, nouveau_crtc(crtc)->index,
 		  fb->bits_per_pixel, fb->pitches[0], crtc->x, crtc->y,
 		  new_bo->bo.offset };
 
+	ret = drm_vblank_get(dev, s->crtc);
+	if (ret)
+		goto fail_free;
+
+	/* Don't let the buffers go away while we flip */
+	ret = nouveau_page_flip_reserve(old_bo, new_bo);
+	if (ret)
+		goto fail_put;
+
 	/* Choose the channel the flip will be handled in */
 	fence = new_bo->bo.sync_obj;
 	if (fence)
@@ -614,6 +618,8 @@ nouveau_crtc_page_flip(struct drm_crtc *crtc, struct drm_framebuffer *fb,
 
 fail_unreserve:
 	nouveau_page_flip_unreserve(old_bo, new_bo, NULL);
+fail_put:
+	drm_vblank_put(dev, s->crtc);
 fail_free:
 	kfree(s);
 	return ret;
@@ -638,24 +644,16 @@ nouveau_finish_page_flip(struct nouveau_channel *chan,
 	}
 
 	s = list_first_entry(&fctx->flip, struct nouveau_page_flip_state, head);
-	if (s->event) {
-		struct drm_pending_vblank_event *e = s->event;
-		struct timeval now;
-
-		do_gettimeofday(&now);
-		e->event.sequence = 0;
-		e->event.tv_sec = now.tv_sec;
-		e->event.tv_usec = now.tv_usec;
-		list_add_tail(&e->base.link, &e->base.file_priv->event_list);
-		wake_up_interruptible(&e->base.file_priv->event_wait);
-	}
-
 	list_del(&s->head);
+
+	if (s->event)
+		drm_send_vblank_event(dev, s->crtc, s->event);
+	spin_unlock_irqrestore(&dev->event_lock, flags);
+	drm_vblank_put(dev, s->crtc);
+
 	if (ps)
 		*ps = *s;
 	kfree(s);
-
-	spin_unlock_irqrestore(&dev->event_lock, flags);
 	return 0;
 }

From: Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Subject: Re: mesa vdpau regression with "dri2: Fix potential race
 and crash for swap at next vblank."
Date: Thu, 28 Mar 2013 15:26:02 +0100
Message-ID: <515452FA.4070002@canonical.com>
References: <515422BA.6080702@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <515422BA.6080702-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
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

Op 28-03-13 12:00, Maarten Lankhorst schreef:

> Hey Mario,
>
> It seems that your ddx commit b4231dd715a8 is causing a regression when I use mplayer -vo vdpau rendering with mesa 9.1.
> It fails to start drawing here, leaving the mplayer screen black, I can make it recover usually by seeking or moving another
> window in front. When I revert the commit it behaves normally. Changing can_sync_to_vblank(draw) to 0 in
> nouveau_dri2_schedule_swap also fixes it.
>
> The nouveau kernel driver currently doesn't fill in a frame number, so MSC will always be zero for now,
> and this makes mplayer choose target_msc = 0 as 'swap at next interval', which appears to be broken by the commit.
>
> The following patch fixes frame numbers in the nouveau kernel module, but it only decreases the likelyhood of
> occuring, it still happens when seeking, for example.
>
> ~Maarten
>
Ohey found a flip bug too, that was weird, I'll send a patch for both. This is just silly...

--- a/drivers/gpu/drm/nouveau/nouveau_display.c
+++ b/drivers/gpu/drm/nouveau/nouveau_display.c
@@ -593,7 +597,7 @@ nouveau_crtc_page_flip(struct drm_crtc *crtc, struct drm_framebuffer *fb,
 
 	/* Emit a page flip */
 	if (nv_device(drm->device)->card_type >= NV_50) {
-		ret = nv50_display_flip_next(crtc, fb, chan, 0);
+		ret = nv50_display_flip_next(crtc, fb, chan, /*swap_interval=*/ 1);
 		if (ret) {
 			mutex_unlock(&chan->cli->mutex);
 			goto fail_unreserve;

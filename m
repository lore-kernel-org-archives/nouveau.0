From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [RFC v7 02/11] drm/vblank: Use spin_(un)lock_irq() in
 drm_crtc_vblank_off()
Date: Fri, 26 Jun 2020 22:47:13 +0200
Message-ID: <20200626204713.GG3278063@phenom.ffwll.local>
References: <20200624230318.126256-1-lyude@redhat.com>
 <20200624230318.126256-3-lyude@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200624230318.126256-3-lyude@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>, Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>
List-Id: nouveau.vger.kernel.org

On Wed, Jun 24, 2020 at 07:03:09PM -0400, Lyude Paul wrote:
> This got me confused for a bit while looking over this code: I had been
> planning on adding some blocking function calls into this function, but
> seeing the irqsave/irqrestore variants of spin_(un)lock() didn't make it
> very clear whether or not that would actually be safe.
> 
> So I went ahead and reviewed every single driver in the kernel that uses
> this function, and they all fall into three categories:
> 
> * Driver probe code
> * ->atomic_disable() callbacks
> * Legacy modesetting callbacks
> 
> All of these will be guaranteed to have IRQs enabled, which means it's
> perfectly safe to block here. Just to make things a little less
> confusing to others in the future, let's switch over to
> spin_lock_irq()/spin_unlock_irq() to make that fact a little more
> obvious.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>

I think the patch is correct, but now we're having a bit a inconsistency,
since all other functions where the same applies still use _irqsave. I
looked through the file and I think drm_vblank_get, drm_crtc_vblank_reset,
drm_crtc_vblank_on and drm_legacy_vblank_post_modeset,
drm_queue_vblank_event and drm_crtc_queue_sequence_ioctl are all candiates
for the same cleanup.

Maybe follow up patches for less confusion?

On this:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/drm_vblank.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
> index ce5c1e1d29963..e895f5331fdb4 100644
> --- a/drivers/gpu/drm/drm_vblank.c
> +++ b/drivers/gpu/drm/drm_vblank.c
> @@ -1283,13 +1283,12 @@ void drm_crtc_vblank_off(struct drm_crtc *crtc)
>  	struct drm_pending_vblank_event *e, *t;
>  
>  	ktime_t now;
> -	unsigned long irqflags;
>  	u64 seq;
>  
>  	if (drm_WARN_ON(dev, pipe >= dev->num_crtcs))
>  		return;
>  
> -	spin_lock_irqsave(&dev->event_lock, irqflags);
> +	spin_lock_irq(&dev->event_lock);
>  
>  	spin_lock(&dev->vbl_lock);
>  	drm_dbg_vbl(dev, "crtc %d, vblank enabled %d, inmodeset %d\n",
> @@ -1325,7 +1324,7 @@ void drm_crtc_vblank_off(struct drm_crtc *crtc)
>  		drm_vblank_put(dev, pipe);
>  		send_vblank_event(dev, e, seq, now);
>  	}
> -	spin_unlock_irqrestore(&dev->event_lock, irqflags);
> +	spin_unlock_irq(&dev->event_lock);
>  
>  	/* Will be reset by the modeset helpers when re-enabling the crtc by
>  	 * calling drm_calc_timestamping_constants(). */
> -- 
> 2.26.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

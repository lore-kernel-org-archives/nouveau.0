From: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Subject: Re: [PATCH 23/23] drm: Cleanup VBLANK callbacks in
 struct drm_driver
Date: Sun, 12 Jan 2020 23:53:12 +0100
Message-ID: <20200112225312.GC5340@dvetter-linux.ger.corp.intel.com>
References: <20200110092127.27847-1-tzimmermann@suse.de>
 <20200110092127.27847-24-tzimmermann@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200110092127.27847-24-tzimmermann-l3A5Bk7waGM@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Freedreno" <freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>
Cc: hamohammed.sa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, joonas.lahtinen-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org, amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, alexandre.torgue-qxv4g6HH51o@public.gmane.org, David1.Zhou-5C7GfCeVMHo@public.gmane.org, thellstrom-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org, sean-p7yTbzM4H96eqtR555YLDQ@public.gmane.org, patrik.r.jakobsson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-graphics-maintainer-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org, bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, harry.wentland-5C7GfCeVMHo@public.gmane.org, mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sunpeng.li-5C7GfCeVMHo@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, jani.nikula-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, rodrigo.vivi-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, vincent.abriou-qxv4g6HH51o@public.gmane.org, rodrigosiqueiramelo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, philippe.cornu-qxv4g6HH51o@public.gmane.org, yannick.fertre-qxv4g6HH51o@public.gmane.org, robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, daniel-/w4YWyX8dFk@public.gmane.org, alexander.deucher-5C7GfCeVMHo@public.gmane.org, freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, christian.koenig-5C7GfCeVMHo@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Fri, Jan 10, 2020 at 10:21:27AM +0100, Thomas Zimmermann wrote:
> All non-legacy users of VBLANK functions in struct drm_driver have been
> converted to use the respective interfaces in struct drm_crtc_funcs. The
> remaining users of VBLANK callbacks in struct drm_driver are legacy drivers
> with userspace modesetting.
> 
> There are no users left of get_vblank_timestamp(), so the callback is
> being removed. The other VBLANK callbacks are being moved to the legacy
> section at the end of struct drm_driver.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>

I think sprinkling some WARN_ON (in drm_dev_register or wherever) if new
drivers try to use the legacy hooks would be really nice. Experience says
someone is going to copypaste this stuff around forever otherwise.

Reviewed-by: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>

> ---
>  drivers/gpu/drm/drm_vblank.c |  39 +++++---------
>  include/drm/drm_drv.h        | 101 ++---------------------------------
>  2 files changed, 17 insertions(+), 123 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
> index 7cf436a4b908..ceff68474d4d 100644
> --- a/drivers/gpu/drm/drm_vblank.c
> +++ b/drivers/gpu/drm/drm_vblank.c
> @@ -138,10 +138,9 @@ static u32 __get_vblank_counter(struct drm_device *dev, unsigned int pipe)
>  
>  		if (crtc->funcs->get_vblank_counter)
>  			return crtc->funcs->get_vblank_counter(crtc);
> -	}
> -
> -	if (dev->driver->get_vblank_counter)
> +	} else if (dev->driver->get_vblank_counter) {
>  		return dev->driver->get_vblank_counter(dev, pipe);
> +	}
>  
>  	return drm_vblank_no_hw_counter(dev, pipe);
>  }
> @@ -334,8 +333,7 @@ u64 drm_crtc_accurate_vblank_count(struct drm_crtc *crtc)
>  	unsigned long flags;
>  
>  	WARN_ONCE(drm_debug_enabled(DRM_UT_VBL) &&
> -		  !crtc->funcs->get_vblank_timestamp &&
> -		  !dev->driver->get_vblank_timestamp,
> +		  !crtc->funcs->get_vblank_timestamp,
>  		  "This function requires support for accurate vblank timestamps.");
>  
>  	spin_lock_irqsave(&dev->vblank_time_lock, flags);
> @@ -357,13 +355,11 @@ static void __disable_vblank(struct drm_device *dev, unsigned int pipe)
>  		if (WARN_ON(!crtc))
>  			return;
>  
> -		if (crtc->funcs->disable_vblank) {
> +		if (crtc->funcs->disable_vblank)
>  			crtc->funcs->disable_vblank(crtc);
> -			return;
> -		}
> +	} else {
> +		dev->driver->disable_vblank(dev, pipe);
>  	}
> -
> -	dev->driver->disable_vblank(dev, pipe);
>  }
>  
>  /*
> @@ -791,9 +787,6 @@ drm_get_last_vbltimestamp(struct drm_device *dev, unsigned int pipe,
>  
>  		ret = crtc->funcs->get_vblank_timestamp(crtc, &max_error,
>  							tvblank, in_vblank_irq);
> -	} else if (dev->driver->get_vblank_timestamp && (max_error > 0)) {
> -		ret = dev->driver->get_vblank_timestamp(dev, pipe, &max_error,
> -							tvblank, in_vblank_irq);
>  	}
>  
>  	/* GPU high precision timestamp query unsupported or failed.
> @@ -1016,9 +1009,11 @@ static int __enable_vblank(struct drm_device *dev, unsigned int pipe)
>  
>  		if (crtc->funcs->enable_vblank)
>  			return crtc->funcs->enable_vblank(crtc);
> +	} else if (dev->driver->enable_vblank) {
> +		return dev->driver->enable_vblank(dev, pipe);
>  	}
>  
> -	return dev->driver->enable_vblank(dev, pipe);
> +	return -EINVAL;
>  }
>  
>  static int drm_vblank_enable(struct drm_device *dev, unsigned int pipe)
> @@ -1109,13 +1104,10 @@ static bool __vblank_disable_immediate(struct drm_device *dev, unsigned int pipe
>  		return false;
>  
>  	crtc = drm_crtc_from_index(dev, pipe);
> -	if (crtc && crtc->funcs->get_vblank_timestamp)
> -		return true;
> -
> -	if (dev->driver->get_vblank_timestamp)
> -		return true;
> +	if (!crtc || !crtc->funcs->get_vblank_timestamp)
> +		return false;
>  
> -	return false;
> +	return true;
>  }
>  
>  static void drm_vblank_put(struct drm_device *dev, unsigned int pipe)
> @@ -1798,7 +1790,6 @@ static void drm_handle_vblank_events(struct drm_device *dev, unsigned int pipe)
>  	struct drm_pending_vblank_event *e, *t;
>  	ktime_t now;
>  	u64 seq;
> -	bool high_prec;
>  
>  	assert_spin_locked(&dev->event_lock);
>  
> @@ -1818,10 +1809,8 @@ static void drm_handle_vblank_events(struct drm_device *dev, unsigned int pipe)
>  		send_vblank_event(dev, e, seq, now);
>  	}
>  
> -	high_prec = crtc->funcs->get_vblank_timestamp ||
> -		    dev->driver->get_vblank_timestamp;
> -
> -	trace_drm_vblank_event(pipe, seq, now, high_prec);
> +	trace_drm_vblank_event(pipe, seq, now,
> +			       crtc->funcs->get_vblank_timestamp != NULL);
>  }
>  
>  /**
> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
> index b704e252f3b2..e290b3aca6eb 100644
> --- a/include/drm/drm_drv.h
> +++ b/include/drm/drm_drv.h
> @@ -268,104 +268,6 @@ struct drm_driver {
>  	 */
>  	void (*release) (struct drm_device *);
>  
> -	/**
> -	 * @get_vblank_counter:
> -	 *
> -	 * Driver callback for fetching a raw hardware vblank counter for the
> -	 * CRTC specified with the pipe argument.  If a device doesn't have a
> -	 * hardware counter, the driver can simply leave the hook as NULL.
> -	 * The DRM core will account for missed vblank events while interrupts
> -	 * where disabled based on system timestamps.
> -	 *
> -	 * Wraparound handling and loss of events due to modesetting is dealt
> -	 * with in the DRM core code, as long as drivers call
> -	 * drm_crtc_vblank_off() and drm_crtc_vblank_on() when disabling or
> -	 * enabling a CRTC.
> -	 *
> -	 * This is deprecated and should not be used by new drivers.
> -	 * Use &drm_crtc_funcs.get_vblank_counter instead.
> -	 *
> -	 * Returns:
> -	 *
> -	 * Raw vblank counter value.
> -	 */
> -	u32 (*get_vblank_counter) (struct drm_device *dev, unsigned int pipe);
> -
> -	/**
> -	 * @enable_vblank:
> -	 *
> -	 * Enable vblank interrupts for the CRTC specified with the pipe
> -	 * argument.
> -	 *
> -	 * This is deprecated and should not be used by new drivers.
> -	 * Use &drm_crtc_funcs.enable_vblank instead.
> -	 *
> -	 * Returns:
> -	 *
> -	 * Zero on success, appropriate errno if the given @crtc's vblank
> -	 * interrupt cannot be enabled.
> -	 */
> -	int (*enable_vblank) (struct drm_device *dev, unsigned int pipe);
> -
> -	/**
> -	 * @disable_vblank:
> -	 *
> -	 * Disable vblank interrupts for the CRTC specified with the pipe
> -	 * argument.
> -	 *
> -	 * This is deprecated and should not be used by new drivers.
> -	 * Use &drm_crtc_funcs.disable_vblank instead.
> -	 */
> -	void (*disable_vblank) (struct drm_device *dev, unsigned int pipe);
> -
> -	/**
> -	 * @get_vblank_timestamp:
> -	 *
> -	 * Called by drm_get_last_vbltimestamp(). Should return a precise
> -	 * timestamp when the most recent VBLANK interval ended or will end.
> -	 *
> -	 * Specifically, the timestamp in @vblank_time should correspond as
> -	 * closely as possible to the time when the first video scanline of
> -	 * the video frame after the end of VBLANK will start scanning out,
> -	 * the time immediately after end of the VBLANK interval. If the
> -	 * @crtc is currently inside VBLANK, this will be a time in the future.
> -	 * If the @crtc is currently scanning out a frame, this will be the
> -	 * past start time of the current scanout. This is meant to adhere
> -	 * to the OpenML OML_sync_control extension specification.
> -	 *
> -	 * Paramters:
> -	 *
> -	 * dev:
> -	 *     dev DRM device handle.
> -	 * pipe:
> -	 *     crtc for which timestamp should be returned.
> -	 * max_error:
> -	 *     Maximum allowable timestamp error in nanoseconds.
> -	 *     Implementation should strive to provide timestamp
> -	 *     with an error of at most max_error nanoseconds.
> -	 *     Returns true upper bound on error for timestamp.
> -	 * vblank_time:
> -	 *     Target location for returned vblank timestamp.
> -	 * in_vblank_irq:
> -	 *     True when called from drm_crtc_handle_vblank().  Some drivers
> -	 *     need to apply some workarounds for gpu-specific vblank irq quirks
> -	 *     if flag is set.
> -	 *
> -	 * Returns:
> -	 *
> -	 * True on success, false on failure, which means the core should
> -	 * fallback to a simple timestamp taken in drm_crtc_handle_vblank().
> -	 *
> -	 * FIXME:
> -	 *
> -	 * We should move this hook to &struct drm_crtc_funcs like all the other
> -	 * vblank hooks.
> -	 */
> -	bool (*get_vblank_timestamp) (struct drm_device *dev, unsigned int pipe,
> -				     int *max_error,
> -				     ktime_t *vblank_time,
> -				     bool in_vblank_irq);
> -
>  	/**
>  	 * @irq_handler:
>  	 *
> @@ -720,6 +622,9 @@ struct drm_driver {
>  	int (*dma_ioctl) (struct drm_device *dev, void *data, struct drm_file *file_priv);
>  	int (*dma_quiescent) (struct drm_device *);
>  	int (*context_dtor) (struct drm_device *dev, int context);
> +	u32 (*get_vblank_counter)(struct drm_device *dev, unsigned int pipe);
> +	int (*enable_vblank)(struct drm_device *dev, unsigned int pipe);
> +	void (*disable_vblank)(struct drm_device *dev, unsigned int pipe);
>  	int dev_priv_size;
>  };
>  
> -- 
> 2.24.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

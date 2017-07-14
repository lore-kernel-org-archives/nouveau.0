From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [Intel-gfx] [PATCH v2 01/12] drm/nouveau: Fix error handling in
 nv50_disp_atomic_commit
Date: Fri, 14 Jul 2017 16:28:04 +0200
Message-ID: <20170714142804.6xkfv76cofeotk4j@phenom.ffwll.local>
References: <20170711143314.2148-1-maarten.lankhorst@linux.intel.com>
 <20170711143314.2148-2-maarten.lankhorst@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170711143314.2148-2-maarten.lankhorst@linux.intel.com>
Sender: stable-owner@vger.kernel.org
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>, "# v4 . 10+" <stable@vger.kernel.org>
List-Id: nouveau.vger.kernel.org

On Tue, Jul 11, 2017 at 04:33:03PM +0200, Maarten Lankhorst wrote:
> Make it more clear that post commit return ret is really return 0,
> 
> and add a missing drm_atomic_helper_cleanup_planes when
> drm_atomic_helper_wait_for_fences fails.
> 
> Fixes: 839ca903f12e ("drm/nouveau/kms/nv50: transition to atomic interfaces internally")
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: nouveau@lists.freedesktop.org
> Cc: <stable@vger.kernel.org> # v4.10+
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> ---
>  drivers/gpu/drm/nouveau/nv50_display.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nv50_display.c b/drivers/gpu/drm/nouveau/nv50_display.c
> index 42a85c14aea0..8fb55b96c40f 100644
> --- a/drivers/gpu/drm/nouveau/nv50_display.c
> +++ b/drivers/gpu/drm/nouveau/nv50_display.c
> @@ -4119,7 +4119,7 @@ nv50_disp_atomic_commit(struct drm_device *dev,
>  	if (!nonblock) {
>  		ret = drm_atomic_helper_wait_for_fences(dev, state, true);
>  		if (ret)
> -			goto done;
> +			goto err_cleanup;
>  	}
>  
>  	for_each_plane_in_state(state, plane, plane_state, i) {
> @@ -4147,7 +4147,7 @@ nv50_disp_atomic_commit(struct drm_device *dev,
>  		if (crtc->state->enable) {
>  			if (!drm->have_disp_power_ref) {
>  				drm->have_disp_power_ref = true;
> -				return ret;
> +				return 0;
>  			}
>  			active = true;
>  			break;
> @@ -4158,7 +4158,10 @@ nv50_disp_atomic_commit(struct drm_device *dev,
>  		pm_runtime_put_autosuspend(dev->dev);
>  		drm->have_disp_power_ref = false;
>  	}
> +	goto done;
>  

A bit convoluted, I prefer to wrap these in if (ret) to make them only run
for the failure case.

Either way: Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> +err_cleanup:
> +	drm_atomic_helper_cleanup_planes(dev, state);
>  done:
>  	pm_runtime_put_autosuspend(dev->dev);
>  	return ret;
> -- 
> 2.11.0
> 
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

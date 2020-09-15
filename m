From: Hyun Kwon <hyun.kwon@xilinx.com>
Subject: Re: [PATCH v2 20/21] drm/xlnx: Initialize DRM driver instance with
 CMA helper macro
Date: Tue, 15 Sep 2020 11:39:09 -0700
Message-ID: <20200915183909.GA2471550@xilinx.com>
References: <20200915145958.19993-1-tzimmermann@suse.de>
 <20200915145958.19993-21-tzimmermann@suse.de>
 <20200915155346.GA26029@pendragon.ideasonboard.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200915155346.GA26029@pendragon.ideasonboard.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, "hamohammed.sa@gmail.com" <hamohammed.sa@gmail.com>, "airlied@linux.ie" <airlied@linux.ie>, "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Michal Simek <michals@xilinx.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, "krzk@kernel.org" <krzk@kernel.org>, "sam@ravnborg.org" <sam@ravnborg.org>, "emil.velikov@collabora.com" <emil.velikov@collabora.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "jy0922.shim@samsung.com" <jy0922.shim@samsung.com>, "oleksandr_andrushchenko@epam.com" <oleksandr_andrushchenko@epam.com>, "tomi.valkeinen@ti.com" <tomi.valkeinen@ti.com>"linux-tegra@vger.kernel.org" <linux->
List-Id: nouveau.vger.kernel.org

Hi Tomas,

Thanks for the patch.

On Tue, Sep 15, 2020 at 08:53:46AM -0700, Laurent Pinchart wrote:
> Hi Thomas,
> 
> Thank you for the patch.
> 
> On Tue, Sep 15, 2020 at 04:59:57PM +0200, Thomas Zimmermann wrote:
> > The xlnx driver uses CMA helpers with default callback functions.
> > Initialize the driver structure with the rsp CMA helper macro. The
> > driver is being converted to use GEM object functions as part of
> > this change.
> > 
> > Two callbacks, .dumb_destroy and .gem_prime_import, were initialized
> > to their default implementations, so they are just kept empty now.
> > 
> > v2:
> > 	* initialize with DRM_GEM_CMA_DRIVER_OPS_WITH_DUMB_CREATE (Laurent)
> > 
> > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 

Reviewed-by: Hyun Kwon <hyun.kwon@xilinx.com>

Thanks,
-hyun

> > ---
> >  drivers/gpu/drm/xlnx/zynqmp_dpsub.c | 14 +-------------
> >  1 file changed, 1 insertion(+), 13 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
> > index 8e69303aad3f..f3ffc3703a0e 100644
> > --- a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
> > +++ b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
> > @@ -80,19 +80,7 @@ static struct drm_driver zynqmp_dpsub_drm_driver = {
> >  	.driver_features		= DRIVER_MODESET | DRIVER_GEM |
> >  					  DRIVER_ATOMIC,
> >  
> > -	.prime_handle_to_fd		= drm_gem_prime_handle_to_fd,
> > -	.prime_fd_to_handle		= drm_gem_prime_fd_to_handle,
> > -	.gem_prime_export		= drm_gem_prime_export,
> > -	.gem_prime_import		= drm_gem_prime_import,
> > -	.gem_prime_get_sg_table		= drm_gem_cma_prime_get_sg_table,
> > -	.gem_prime_import_sg_table	= drm_gem_cma_prime_import_sg_table,
> > -	.gem_prime_vmap			= drm_gem_cma_prime_vmap,
> > -	.gem_prime_vunmap		= drm_gem_cma_prime_vunmap,
> > -	.gem_prime_mmap			= drm_gem_cma_prime_mmap,
> > -	.gem_free_object_unlocked	= drm_gem_cma_free_object,
> > -	.gem_vm_ops			= &drm_gem_cma_vm_ops,
> > -	.dumb_create			= zynqmp_dpsub_dumb_create,
> > -	.dumb_destroy			= drm_gem_dumb_destroy,
> > +	DRM_GEM_CMA_DRIVER_OPS_WITH_DUMB_CREATE(zynqmp_dpsub_dumb_create),
> >  
> >  	.fops				= &zynqmp_dpsub_drm_fops,
> >  
> 
> -- 
> Regards,
> 
> Laurent Pinchart
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

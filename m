From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v3 7/7] drm/todo: Update entries around struct dma_buf_map
Date: Fri, 2 Oct 2020 20:45:54 +0200
Message-ID: <20201002184554.GN438822@phenom.ffwll.local>
References: <20200929151437.19717-1-tzimmermann@suse.de>
 <20200929151437.19717-8-tzimmermann@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200929151437.19717-8-tzimmermann@suse.de>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie, daniel@ffwll.ch, sam@ravnborg.org, alexander.deucher@amd.com, christian.koenig@amd.com, kraxel@redhat.com, l.stach@pengutronix.de, linux+etnaviv@armlinux.org.uk, christian.gmeiner@gmail.com, inki.dae@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com, kyungmin.park@samsung.com, kgene@kernel.org, krzk@kernel.org, yuq825@gmail.com, bskeggs@redhat.com, robh@kernel.org, tomeu.vizoso@collabora.com, steven.price@arm.com, alyssa.rosenzweig@collabora.com, hjc@rock-chips.com, heiko@sntech.de, hdegoede@redhat.com, sean@poorly.run, eric@anholt.net, oleksandr_andrushchenko@epam.com, ray.huang@amd.com, sumit.semwal@linaro.org, emil.velikov@collabora.com, luben.tuikov@amd.com, apaneers@amd.com, linus.walle
List-Id: nouveau.vger.kernel.org

On Tue, Sep 29, 2020 at 05:14:37PM +0200, Thomas Zimmermann wrote:
> Instances of struct dma_buf_map should be useful throughout DRM's
> memory management code. Furthermore, several drivers can now use
> generic fbdev emulation.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  Documentation/gpu/todo.rst | 24 ++++++++++++++++++++++--
>  1 file changed, 22 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> index 3751ac976c3e..023626c1837b 100644
> --- a/Documentation/gpu/todo.rst
> +++ b/Documentation/gpu/todo.rst
> @@ -197,8 +197,10 @@ Convert drivers to use drm_fbdev_generic_setup()
>  ------------------------------------------------
>  
>  Most drivers can use drm_fbdev_generic_setup(). Driver have to implement
> -atomic modesetting and GEM vmap support. Current generic fbdev emulation
> -expects the framebuffer in system memory (or system-like memory).
> +atomic modesetting and GEM vmap support. Historically, generic fbdev emulation
> +expected the framebuffer in system memory or system-like memory. By employing
> +struct dma_buf_map, drivers with frambuffers in I/O memory can be supported
> +as well.
>  
>  Contact: Maintainer of the driver you plan to convert
>  
> @@ -446,6 +448,24 @@ Contact: Ville Syrjälä, Daniel Vetter
>  
>  Level: Intermediate
>  
> +Use struct dma_buf_map throughout codebase
> +------------------------------------------
> +
> +Pointers to shared device memory are stored in struct dma_buf_map. Each
> +instance knows whether it refers to system or I/O memory. Most of the DRM-wide
> +interface have been converted to use struct dma_buf_map, but implementations
> +often still use raw pointers.
> +
> +The task is to use struct dma_buf_map where it makes sense.
> +
> +* Memory managers should use struct dma_buf_map for dma-buf-imported buffers.
> +* TTM might benefit from using struct dma_buf_map internally.
> +* Framebuffer copying and blitting helpers should operate on struct dma_buf_map.
> +
> +Contact: Thomas Zimmermann <tzimmermann@suse.de>, Christian König, Daniel Vetter
> +
> +Level: Intermediate
> +
>  
>  Core refactorings
>  =================
> -- 
> 2.28.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

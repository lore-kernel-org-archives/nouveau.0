From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/nouveau: Fix Kconfig indentation
Date: Wed, 20 Nov 2019 17:39:00 +0100
Message-ID: <20191120163900.GP30416@phenom.ffwll.local>
References: <20191120133619.11415-1-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191120133619.11415-1-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org, Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

On Wed, Nov 20, 2019 at 09:36:19PM +0800, Krzysztof Kozlowski wrote:
> Adjust indentation from spaces to tab (+optional two spaces) as in
> coding style with command like:
> 	$ sed -e 's/^        /\t/' -i */Kconfig
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Queued for 5.6 in drm-misc, thanks for your patch.
-Daniel
> ---
>  drivers/gpu/drm/nouveau/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/Kconfig b/drivers/gpu/drm/nouveau/Kconfig
> index 3558df043592..9c990266e876 100644
> --- a/drivers/gpu/drm/nouveau/Kconfig
> +++ b/drivers/gpu/drm/nouveau/Kconfig
> @@ -2,7 +2,7 @@
>  config DRM_NOUVEAU
>  	tristate "Nouveau (NVIDIA) cards"
>  	depends on DRM && PCI && MMU
> -        select FW_LOADER
> +	select FW_LOADER
>  	select DRM_KMS_HELPER
>  	select DRM_TTM
>  	select BACKLIGHT_CLASS_DEVICE if DRM_NOUVEAU_BACKLIGHT
> -- 
> 2.17.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

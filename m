From: Jerome Glisse <jglisse@redhat.com>
Subject: Re: [PATCH] drm/nouveau: Fix DEVICE_PRIVATE dependencies
Date: Wed, 17 Apr 2019 10:38:41 -0400
Message-ID: <20190417143841.GD3229@redhat.com>
References: <20190417142632.12992-1-yuehaibing@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190417142632.12992-1-yuehaibing@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yue Haibing <yuehaibing@huawei.com>
Cc: bskeggs@redhat.com, airlied@linux.ie, daniel@ffwll.ch, jgg@mellanox.com, rcampbell@nvidia.com, leonro@mellanox.com, akpm@linux-foundation.org, sfr@canb.auug.org.au, linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-mm@kvack.org
List-Id: nouveau.vger.kernel.org

On Wed, Apr 17, 2019 at 10:26:32PM +0800, Yue Haibing wrote:
> From: YueHaibing <yuehaibing@huawei.com>
> 
> During randconfig builds, I occasionally run into an invalid configuration
> 
> WARNING: unmet direct dependencies detected for DEVICE_PRIVATE
>   Depends on [n]: ARCH_HAS_HMM_DEVICE [=n] && ZONE_DEVICE [=n]
>   Selected by [y]:
>   - DRM_NOUVEAU_SVM [=y] && HAS_IOMEM [=y] && ARCH_HAS_HMM [=y] && DRM_NOUVEAU [=y] && STAGING [=y]
> 
> mm/memory.o: In function `do_swap_page':
> memory.c:(.text+0x2754): undefined reference to `device_private_entry_fault'
> 
> commit 5da25090ab04 ("mm/hmm: kconfig split HMM address space mirroring from device memory")
> split CONFIG_DEVICE_PRIVATE dependencies from
> ARCH_HAS_HMM to ARCH_HAS_HMM_DEVICE and ZONE_DEVICE,
> so enable DRM_NOUVEAU_SVM will trigger this warning,
> cause building failed.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Fixes: 5da25090ab04 ("mm/hmm: kconfig split HMM address space mirroring from device memory")
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Reviewed-by: Jérôme Glisse <jglisse@redhat.com>

> ---
>  drivers/gpu/drm/nouveau/Kconfig | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/Kconfig b/drivers/gpu/drm/nouveau/Kconfig
> index 00cd9ab..99e30c1 100644
> --- a/drivers/gpu/drm/nouveau/Kconfig
> +++ b/drivers/gpu/drm/nouveau/Kconfig
> @@ -74,7 +74,8 @@ config DRM_NOUVEAU_BACKLIGHT
>  
>  config DRM_NOUVEAU_SVM
>  	bool "(EXPERIMENTAL) Enable SVM (Shared Virtual Memory) support"
> -	depends on ARCH_HAS_HMM
> +	depends on ARCH_HAS_HMM_DEVICE
> +	depends on ZONE_DEVICE
>  	depends on DRM_NOUVEAU
>  	depends on STAGING
>  	select HMM_MIRROR
> -- 
> 2.7.4
> 
> 

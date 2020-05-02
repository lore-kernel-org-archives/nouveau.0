From: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH hmm v2 1/5] mm/hmm: make CONFIG_DEVICE_PRIVATE into a
 select
Date: Fri, 1 May 2020 22:47:37 -0700
Message-ID: <17b40a00-658a-1bf4-c14a-7543dd0d2f8c@nvidia.com>
References: <1-v2-b4e84f444c7d+24f57-hmm_no_flags_jgg@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1-v2-b4e84f444c7d+24f57-hmm_no_flags_jgg@mellanox.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jason Gunthorpe <jgg@ziepe.ca>, linux-mm@kvack.org, Ralph Campbell <rcampbell@nvidia.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>, =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>, "David (ChunMing) Zhou" <David1.Zhou@amd.com>, dri-devel@lists.freedesktop.org, Felix Kuehling <Felix.Kuehling@amd.com>, Christoph Hellwig <hch@lst.de>, intel-gfx@lists.freedesktop.org, =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>, linux-kernel@vger.kernel.org, Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>, nouveau@lists.freedesktop.org, "Yang, Philip" <Philip.Yang@amd.com>
List-Id: nouveau.vger.kernel.org

On 2020-05-01 11:20, Jason Gunthorpe wrote:
> From: Jason Gunthorpe <jgg@mellanox.com>
> 
> There is no reason for a user to select this or not directly - it should
> be selected by drivers that are going to use the feature, similar to how
> CONFIG_HMM_MIRROR works.

Yes, this is a nice touch.

Reviewed-by: John Hubbard <jhubbard@nvidia.com>

thanks,
-- 
John Hubbard
NVIDIA

> 
> Currently all drivers provide a feature kconfig that will disable use of
> DEVICE_PRIVATE in that driver, allowing users to avoid enabling this if
> they don't want the overhead.
> 
> Acked-by: Felix Kuehling <Felix.Kuehling@amd.com>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Signed-off-by: Jason Gunthorpe <jgg@mellanox.com>
> ---
>   arch/powerpc/Kconfig            | 2 +-
>   drivers/gpu/drm/nouveau/Kconfig | 2 +-
>   mm/Kconfig                      | 7 +------
>   3 files changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 924c541a926008..8de52aefdc74cc 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -455,7 +455,7 @@ config PPC_TRANSACTIONAL_MEM
>   config PPC_UV
>   	bool "Ultravisor support"
>   	depends on KVM_BOOK3S_HV_POSSIBLE
> -	depends on DEVICE_PRIVATE
> +	select DEVICE_PRIVATE
>   	default n
>   	help
>   	  This option paravirtualizes the kernel to run in POWER platforms that
> diff --git a/drivers/gpu/drm/nouveau/Kconfig b/drivers/gpu/drm/nouveau/Kconfig
> index d6e4ae1ef7053a..af5793f3e7c2cf 100644
> --- a/drivers/gpu/drm/nouveau/Kconfig
> +++ b/drivers/gpu/drm/nouveau/Kconfig
> @@ -86,10 +86,10 @@ config DRM_NOUVEAU_BACKLIGHT
>   
>   config DRM_NOUVEAU_SVM
>   	bool "(EXPERIMENTAL) Enable SVM (Shared Virtual Memory) support"
> -	depends on DEVICE_PRIVATE
>   	depends on DRM_NOUVEAU
>   	depends on MMU
>   	depends on STAGING
> +	select DEVICE_PRIVATE
>   	select HMM_MIRROR
>   	select MMU_NOTIFIER
>   	default n
> diff --git a/mm/Kconfig b/mm/Kconfig
> index c1acc34c1c358c..7ca36bf5f5058e 100644
> --- a/mm/Kconfig
> +++ b/mm/Kconfig
> @@ -805,15 +805,10 @@ config HMM_MIRROR
>   	depends on MMU
>   
>   config DEVICE_PRIVATE
> -	bool "Unaddressable device memory (GPU memory, ...)"
> +	bool
>   	depends on ZONE_DEVICE
>   	select DEV_PAGEMAP_OPS
>   
> -	help
> -	  Allows creation of struct pages to represent unaddressable device
> -	  memory; i.e., memory that is only accessible from the device (or
> -	  group of devices). You likely also want to select HMM_MIRROR.
> -
>   config FRAME_VECTOR
>   	bool
>   
> 

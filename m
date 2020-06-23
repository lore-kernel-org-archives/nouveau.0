From: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [RESEND PATCH 1/3] nouveau: fix migrate page regression
Date: Mon, 22 Jun 2020 17:51:26 -0700
Message-ID: <53751f8e-d901-df2e-a2e0-1b1484b31b81@nvidia.com>
References: <20200622233854.10889-1-rcampbell@nvidia.com>
 <20200622233854.10889-2-rcampbell@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200622233854.10889-2-rcampbell@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Ralph Campbell <rcampbell@nvidia.com>, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Jerome Glisse <jglisse@redhat.com>, Christoph Hellwig <hch@lst.de>, Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>
List-Id: nouveau.vger.kernel.org

On 2020-06-22 16:38, Ralph Campbell wrote:
> The patch to add zero page migration to GPU memory inadvertantly included

inadvertently

> part of a future change which broke normal page migration to GPU memory
> by copying too much data and corrupting GPU memory.
> Fix this by only copying one page instead of a byte count.
> 
> Fixes: 9d4296a7d4b3 ("drm/nouveau/nouveau/hmm: fix migrate zero page to GPU")
> Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
> ---
>   drivers/gpu/drm/nouveau/nouveau_dmem.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> index e5c230d9ae24..cc9993837508 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> @@ -550,7 +550,7 @@ static unsigned long nouveau_dmem_migrate_copy_one(struct nouveau_drm *drm,
>   					 DMA_BIDIRECTIONAL);
>   		if (dma_mapping_error(dev, *dma_addr))
>   			goto out_free_page;
> -		if (drm->dmem->migrate.copy_func(drm, page_size(spage),
> +		if (drm->dmem->migrate.copy_func(drm, 1,
>   			NOUVEAU_APER_VRAM, paddr, NOUVEAU_APER_HOST, *dma_addr))
>   			goto out_dma_unmap;
>   	} else {
>


I Am Not A Nouveau Expert, nor is it really clear to me how
page_size(spage) came to contain something other than a page's worth of
byte count, but this fix looks accurate to me. It's better for
maintenance, too, because the function never intends to migrate "some
number of bytes". It intends to migrate exactly one page.

Hope I'm not missing something fundamental, but:

Reviewed-by: John Hubbard <jhubbard@nvidia.com


thanks,
-- 
John Hubbard
NVIDIA

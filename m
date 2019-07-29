From: Ralph Campbell <rcampbell@nvidia.com>
Subject: Re: [PATCH 2/9] nouveau: reset dma_nr in
 nouveau_dmem_migrate_alloc_and_copy
Date: Mon, 29 Jul 2019 16:18:12 -0700
Message-ID: <26260dd4-f28d-f962-9e38-8bde45335099@nvidia.com>
References: <20190729142843.22320-1-hch@lst.de>
 <20190729142843.22320-3-hch@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190729142843.22320-3-hch@lst.de>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Christoph Hellwig <hch@lst.de>, =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>
Cc: Bharata B Rao <bharata@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org


On 7/29/19 7:28 AM, Christoph Hellwig wrote:
> When we start a new batch of dma_map operations we need to reset dma_nr,
> as we start filling a newly allocated array.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Ralph Campbell <rcampbell@nvidia.com>

> ---
>   drivers/gpu/drm/nouveau/nouveau_dmem.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> index 38416798abd4..e696157f771e 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> @@ -682,6 +682,7 @@ nouveau_dmem_migrate_alloc_and_copy(struct vm_area_struct *vma,
>   	migrate->dma = kmalloc(sizeof(*migrate->dma) * npages, GFP_KERNEL);
>   	if (!migrate->dma)
>   		goto error;
> +	migrate->dma_nr = 0;
>   
>   	/* Copy things over */
>   	copy = drm->dmem->migrate.copy_func;
> 

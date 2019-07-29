From: Ralph Campbell <rcampbell@nvidia.com>
Subject: Re: [PATCH 8/9] mm: remove the unused MIGRATE_PFN_DEVICE flag
Date: Mon, 29 Jul 2019 16:31:21 -0700
Message-ID: <ef44f3bf-0f99-c76b-bf4b-6770545b5e38@nvidia.com>
References: <20190729142843.22320-1-hch@lst.de>
 <20190729142843.22320-9-hch@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190729142843.22320-9-hch@lst.de>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Christoph Hellwig <hch@lst.de>, =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>
Cc: Bharata B Rao <bharata@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org


On 7/29/19 7:28 AM, Christoph Hellwig wrote:
> No one ever checks this flag, and we could easily get that information
> from the page if needed.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Ralph Campbell <rcampbell@nvidia.com>

> ---
>   drivers/gpu/drm/nouveau/nouveau_dmem.c | 3 +--
>   include/linux/migrate.h                | 1 -
>   mm/migrate.c                           | 4 ++--
>   3 files changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> index 6cb930755970..f04686a2c21f 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> @@ -582,8 +582,7 @@ static unsigned long nouveau_dmem_migrate_copy_one(struct nouveau_drm *drm,
>   			*dma_addr))
>   		goto out_dma_unmap;
>   
> -	return migrate_pfn(page_to_pfn(dpage)) |
> -		MIGRATE_PFN_LOCKED | MIGRATE_PFN_DEVICE;
> +	return migrate_pfn(page_to_pfn(dpage)) | MIGRATE_PFN_LOCKED;
>   
>   out_dma_unmap:
>   	dma_unmap_page(dev, *dma_addr, PAGE_SIZE, DMA_BIDIRECTIONAL);
> diff --git a/include/linux/migrate.h b/include/linux/migrate.h
> index 229153c2c496..8b46cfdb1a0e 100644
> --- a/include/linux/migrate.h
> +++ b/include/linux/migrate.h
> @@ -166,7 +166,6 @@ static inline int migrate_misplaced_transhuge_page(struct mm_struct *mm,
>   #define MIGRATE_PFN_MIGRATE	(1UL << 1)
>   #define MIGRATE_PFN_LOCKED	(1UL << 2)
>   #define MIGRATE_PFN_WRITE	(1UL << 3)
> -#define MIGRATE_PFN_DEVICE	(1UL << 4)
>   #define MIGRATE_PFN_SHIFT	6
>   
>   static inline struct page *migrate_pfn_to_page(unsigned long mpfn)
> diff --git a/mm/migrate.c b/mm/migrate.c
> index dc4e60a496f2..74735256e260 100644
> --- a/mm/migrate.c
> +++ b/mm/migrate.c
> @@ -2237,8 +2237,8 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>   				goto next;
>   
>   			page = device_private_entry_to_page(entry);
> -			mpfn = migrate_pfn(page_to_pfn(page))|
> -				MIGRATE_PFN_DEVICE | MIGRATE_PFN_MIGRATE;
> +			mpfn = migrate_pfn(page_to_pfn(page)) |
> +					MIGRATE_PFN_MIGRATE;
>   			if (is_write_device_private_entry(entry))
>   				mpfn |= MIGRATE_PFN_WRITE;
>   		} else {
> 

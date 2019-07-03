From: Ralph Campbell <rcampbell@nvidia.com>
Subject: Re: [PATCH 5/5] mm: remove the legacy hmm_pfn_* APIs
Date: Wed, 3 Jul 2019 13:26:34 -0700
Message-ID: <d234738d-92ee-a841-5d9b-22881f2ac545@nvidia.com>
References: <20190703184502.16234-1-hch@lst.de>
 <20190703184502.16234-6-hch@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190703184502.16234-6-hch@lst.de>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Christoph Hellwig <hch@lst.de>, =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>
Cc: linux-mm@kvack.org, nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org


On 7/3/19 11:45 AM, Christoph Hellwig wrote:
> Switch the one remaining user in nouveau over to its replacement,
> and remove all the wrappers.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Jason Gunthorpe <jgg@mellanox.com>

Reviewed-by: Ralph Campbell <rcampbell@nvidia.com>

> ---
>   drivers/gpu/drm/nouveau/nouveau_dmem.c |  2 +-
>   include/linux/hmm.h                    | 34 --------------------------
>   2 files changed, 1 insertion(+), 35 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> index 42c026010938..b9ced2e61667 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> @@ -844,7 +844,7 @@ nouveau_dmem_convert_pfn(struct nouveau_drm *drm,
>   		struct page *page;
>   		uint64_t addr;
>   
> -		page = hmm_pfn_to_page(range, range->pfns[i]);
> +		page = hmm_device_entry_to_page(range, range->pfns[i]);
>   		if (page == NULL)
>   			continue;
>   
> diff --git a/include/linux/hmm.h b/include/linux/hmm.h
> index 657606f48796..cdcd78627393 100644
> --- a/include/linux/hmm.h
> +++ b/include/linux/hmm.h
> @@ -290,40 +290,6 @@ static inline uint64_t hmm_device_entry_from_pfn(const struct hmm_range *range,
>   		range->flags[HMM_PFN_VALID];
>   }
>   
> -/*
> - * Old API:
> - * hmm_pfn_to_page()
> - * hmm_pfn_to_pfn()
> - * hmm_pfn_from_page()
> - * hmm_pfn_from_pfn()
> - *
> - * This are the OLD API please use new API, it is here to avoid cross-tree
> - * merge painfullness ie we convert things to new API in stages.
> - */
> -static inline struct page *hmm_pfn_to_page(const struct hmm_range *range,
> -					   uint64_t pfn)
> -{
> -	return hmm_device_entry_to_page(range, pfn);
> -}
> -
> -static inline unsigned long hmm_pfn_to_pfn(const struct hmm_range *range,
> -					   uint64_t pfn)
> -{
> -	return hmm_device_entry_to_pfn(range, pfn);
> -}
> -
> -static inline uint64_t hmm_pfn_from_page(const struct hmm_range *range,
> -					 struct page *page)
> -{
> -	return hmm_device_entry_from_page(range, page);
> -}
> -
> -static inline uint64_t hmm_pfn_from_pfn(const struct hmm_range *range,
> -					unsigned long pfn)
> -{
> -	return hmm_device_entry_from_pfn(range, pfn);
> -}
> -
>   /*
>    * Mirroring: how to synchronize device page table with CPU page table.
>    *
> 

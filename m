From: Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 2/2] mm: remove extra ZONE_DEVICE struct page
 refcount
Date: Mon, 28 Sep 2020 15:29:24 -0700
Message-ID: <78746c2f-4bbb-886f-6eb6-0daffab8be3f@nvidia.com>
References: <20200925204442.31348-1-rcampbell@nvidia.com>
 <20200925204442.31348-3-rcampbell@nvidia.com> <20200926064116.GB3540@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20200926064116.GB3540-jcswGhMUV9g@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
Cc: Yang Shi <yang.shi-KPsoFbNs7GizrGE5bRqYAgC/G2K4zDHf@public.gmane.org>, Zi Yan <ziy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Alistair Popple <apopple-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kvm-ppc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Bharata B Rao <bharata-tEXmvtCZX7AybS5Ee8rs3A@public.gmane.org>, Paul Mackerras <paulus-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, Matthew Wilcox <willy-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Jason Gunthorpe <jgg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Ira Weiny <ira.weiny-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, "Kirill A . Shutemov" <kirill.shutemov-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org


On 9/25/20 11:41 PM, Christoph Hellwig wrote:
> On Fri, Sep 25, 2020 at 01:44:42PM -0700, Ralph Campbell wrote:
>> ZONE_DEVICE struct pages have an extra reference count that complicates the
>> code for put_page() and several places in the kernel that need to check the
>> reference count to see that a page is not being used (gup, compaction,
>> migration, etc.). Clean up the code so the reference count doesn't need to
>> be treated specially for ZONE_DEVICE.
>>
>> Signed-off-by: Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>>   arch/powerpc/kvm/book3s_hv_uvmem.c     |  2 +-
>>   drivers/gpu/drm/nouveau/nouveau_dmem.c |  2 +-
>>   include/linux/dax.h                    |  2 +-
>>   include/linux/memremap.h               |  7 ++-
>>   include/linux/mm.h                     | 44 --------------
>>   lib/test_hmm.c                         |  2 +-
>>   mm/gup.c                               | 44 --------------
>>   mm/internal.h                          |  8 +++
>>   mm/memremap.c                          | 82 ++++++--------------------
>>   mm/migrate.c                           |  5 --
>>   mm/page_alloc.c                        |  3 +
>>   mm/swap.c                              | 46 +++------------
>>   12 files changed, 44 insertions(+), 203 deletions(-)
>>
>> diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
>> index 7705d5557239..e6ec98325fab 100644
>> --- a/arch/powerpc/kvm/book3s_hv_uvmem.c
>> +++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
>> @@ -711,7 +711,7 @@ static struct page *kvmppc_uvmem_get_page(unsigned long gpa, struct kvm *kvm)
>>   
>>   	dpage = pfn_to_page(uvmem_pfn);
>>   	dpage->zone_device_data = pvt;
>> -	get_page(dpage);
>> +	init_page_count(dpage);
>>   	lock_page(dpage);
>>   	return dpage;
>>   out_clear:
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
>> index 4e8112fde3e6..ca2e3c3edc36 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
>> @@ -323,7 +323,7 @@ nouveau_dmem_page_alloc_locked(struct nouveau_drm *drm)
>>   			return NULL;
>>   	}
>>   
>> -	get_page(page);
>> +	init_page_count(page);
>>   	lock_page(page);
>>   	return page;
>>   }
>> diff --git a/include/linux/dax.h b/include/linux/dax.h
>> index 3f78ed78d1d6..8d29f38645aa 100644
>> --- a/include/linux/dax.h
>> +++ b/include/linux/dax.h
>> @@ -240,7 +240,7 @@ static inline bool dax_mapping(struct address_space *mapping)
>>   
>>   static inline bool dax_layout_is_idle_page(struct page *page)
>>   {
>> -	return page_ref_count(page) <= 1;
>> +	return page_ref_count(page) == 0;
>>   }
>>   
>>   #endif
>> diff --git a/include/linux/memremap.h b/include/linux/memremap.h
>> index e5862746751b..f9224f88e4cd 100644
>> --- a/include/linux/memremap.h
>> +++ b/include/linux/memremap.h
>> @@ -65,9 +65,10 @@ enum memory_type {
>>   
>>   struct dev_pagemap_ops {
>>   	/*
>> -	 * Called once the page refcount reaches 1.  (ZONE_DEVICE pages never
>> -	 * reach 0 refcount unless there is a refcount bug. This allows the
>> -	 * device driver to implement its own memory management.)
>> +	 * Called once the page refcount reaches 0. The reference count
>> +	 * should be reset to one with init_page_count(page) before reusing
>> +	 * the page. This allows the device driver to implement its own
>> +	 * memory management.
>>   	 */
>>   	void (*page_free)(struct page *page);
>>   
>> diff --git a/include/linux/mm.h b/include/linux/mm.h
>> index b2f370f0b420..2159c2477aa3 100644
>> --- a/include/linux/mm.h
>> +++ b/include/linux/mm.h
>> @@ -1092,39 +1092,6 @@ static inline bool is_zone_device_page(const struct page *page)
>>   }
>>   #endif
>>   
>> -#ifdef CONFIG_DEV_PAGEMAP_OPS
>> -void free_devmap_managed_page(struct page *page);
>> -DECLARE_STATIC_KEY_FALSE(devmap_managed_key);
>> -
>> -static inline bool page_is_devmap_managed(struct page *page)
>> -{
>> -	if (!static_branch_unlikely(&devmap_managed_key))
>> -		return false;
>> -	if (!is_zone_device_page(page))
>> -		return false;
>> -	switch (page->pgmap->type) {
>> -	case MEMORY_DEVICE_PRIVATE:
>> -	case MEMORY_DEVICE_FS_DAX:
>> -		return true;
>> -	default:
>> -		break;
>> -	}
>> -	return false;
>> -}
>> -
>> -void put_devmap_managed_page(struct page *page);
>> -
>> -#else /* CONFIG_DEV_PAGEMAP_OPS */
>> -static inline bool page_is_devmap_managed(struct page *page)
>> -{
>> -	return false;
>> -}
>> -
>> -static inline void put_devmap_managed_page(struct page *page)
>> -{
>> -}
>> -#endif /* CONFIG_DEV_PAGEMAP_OPS */
>> -
>>   static inline bool is_device_private_page(const struct page *page)
>>   {
>>   	return IS_ENABLED(CONFIG_DEV_PAGEMAP_OPS) &&
>> @@ -1171,17 +1138,6 @@ static inline void put_page(struct page *page)
>>   {
>>   	page = compound_head(page);
>>   
>> -	/*
>> -	 * For devmap managed pages we need to catch refcount transition from
>> -	 * 2 to 1, when refcount reach one it means the page is free and we
>> -	 * need to inform the device driver through callback. See
>> -	 * include/linux/memremap.h and HMM for details.
>> -	 */
>> -	if (page_is_devmap_managed(page)) {
>> -		put_devmap_managed_page(page);
>> -		return;
>> -	}
>> -
>>   	if (put_page_testzero(page))
>>   		__put_page(page);
>>   }
>> diff --git a/lib/test_hmm.c b/lib/test_hmm.c
>> index e7dc3de355b7..1033b19c9c52 100644
>> --- a/lib/test_hmm.c
>> +++ b/lib/test_hmm.c
>> @@ -561,7 +561,7 @@ static struct page *dmirror_devmem_alloc_page(struct dmirror_device *mdevice)
>>   	}
>>   
>>   	dpage->zone_device_data = rpage;
>> -	get_page(dpage);
>> +	init_page_count(dpage);
>>   	lock_page(dpage);
>>   	return dpage;
>>   
> 
> Doesn't test_hmm also need to reinitialize the refcount before freeing
> the page in hmm_dmirror_exit?

The dmirror_zero_page is dead code, it isn't used. There is a patch queued in
linux-mm which removes it. Besides, it was allocated with alloc_page() so it
isn't a device private struct page.

>>   	int error, is_ram;
>> -	bool need_devmap_managed = true;
>>   
>>   	switch (pgmap->type) {
>>   	case MEMORY_DEVICE_PRIVATE:
>> @@ -217,11 +171,9 @@ void *memremap_pages(struct dev_pagemap *pgmap, int nid)
>>   		}
>>   		break;
>>   	case MEMORY_DEVICE_GENERIC:
> 
> The MEMORY_DEVICE_PRIVATE cases loses the sanity check that the
> page_free method is set.

I'll add that back into memremap_pages() with other sanity checks in v3.

> Otherwise this looks good.

Thanks!

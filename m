From: Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] mm: make device private reference counts zero
 based
Date: Fri, 9 Oct 2020 10:23:59 -0700
Message-ID: <303a9deb-1eb5-0c60-fdc3-ecc8e94fd497@nvidia.com>
References: <20201008172544.29905-1-rcampbell@nvidia.com>
 <20201009165350.GV2046448@iweiny-DESK2.sc.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20201009165350.GV2046448-J5EW/p2F9lUlb2qzJQmr9q2pdiUAq4bhAL8bYrjMMd8@public.gmane.org>
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
To: Ira Weiny <ira.weiny-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Yang Shi <yang.shi-KPsoFbNs7GizrGE5bRqYAgC/G2K4zDHf@public.gmane.org>, Zi Yan <ziy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Alistair Popple <apopple-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Matthew Wilcox <willy-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Bharata B Rao <bharata-tEXmvtCZX7AybS5Ee8rs3A@public.gmane.org>, Paul Mackerras <paulus-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, kvm-ppc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jason Gunthorpe <jgg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>, "Kirill A . Shutemov" <kirill.shutemov-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org


On 10/9/20 9:53 AM, Ira Weiny wrote:
> On Thu, Oct 08, 2020 at 10:25:44AM -0700, Ralph Campbell wrote:
>> ZONE_DEVICE struct pages have an extra reference count that complicates the
>> code for put_page() and several places in the kernel that need to check the
>> reference count to see that a page is not being used (gup, compaction,
>> migration, etc.). Clean up the code so the reference count doesn't need to
>> be treated specially for device private pages, leaving DAX as still being
>> a special case.
> 
> What about the check in mc_handle_swap_pte()?
> 
> mm/memcontrol.c:
> 
> 5513                 /*
> 5514                  * MEMORY_DEVICE_PRIVATE means ZONE_DEVICE page and which have
> 5515                  * a refcount of 1 when free (unlike normal page)
> 5516                  */
> 5517                 if (!page_ref_add_unless(page, 1, 1))
> 5518                         return NULL;
> 
> ... does that need to change?  Perhaps just the comment?

Thanks for spotting this.

Actually, this whole bit of code is never reached because the
   if (non_swap_entry(ent))
     return NULL;
covers device private pages and returns.

The device private pages are accounted for in mem_cgroup so this
probably needs fixing. I'll probably move the code before the
non_swap_entry() check and change the refcount increment to
page_ref_add_unless(page, 1, 0).

>>
>> Signed-off-by: Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>>
> 
> [snip]
> 
>>   
>>   void put_devmap_managed_page(struct page *page);
>> diff --git a/lib/test_hmm.c b/lib/test_hmm.c
>> index e151a7f10519..bf92a261fa6f 100644
>> --- a/lib/test_hmm.c
>> +++ b/lib/test_hmm.c
>> @@ -509,10 +509,15 @@ static bool dmirror_allocate_chunk(struct dmirror_device *mdevice,
>>   		mdevice->devmem_count * (DEVMEM_CHUNK_SIZE / (1024 * 1024)),
>>   		pfn_first, pfn_last);
>>   
>> +	/*
>> +	 * Pages are created with an initial reference count of one but should
>> +	 * have a reference count of zero while in the free state.
>> +	 */
>>   	spin_lock(&mdevice->lock);
>>   	for (pfn = pfn_first; pfn < pfn_last; pfn++) {
>>   		struct page *page = pfn_to_page(pfn);
>>   
>> +		set_page_count(page, 0);
> 
> This confuses me.  How does this and init_page_count() not confuse the buddy
> allocator?  Don't you have to reset the refcount somewhere after the test?

Device private struct pages are created with memmap_pages() and destroyed with
memunmap_pages(). They are never put on the LRU and never freed to the page
allocator. The refcount is set to zero by put_page() which triggers
the call to pgmap->page_free() instead. So only the driver handles the free pages
it creates.


>>   		page->zone_device_data = mdevice->free_pages;
>>   		mdevice->free_pages = page;
>>   	}
>> @@ -561,7 +566,7 @@ static struct page *dmirror_devmem_alloc_page(struct dmirror_device *mdevice)
>>   	}
>>   
>>   	dpage->zone_device_data = rpage;
>> -	get_page(dpage);
>> +	init_page_count(dpage);
>>   	lock_page(dpage);
>>   	return dpage;
>>   
>> diff --git a/mm/internal.h b/mm/internal.h
>> index c43ccdddb0f6..e1443b73aa9b 100644
>> --- a/mm/internal.h
>> +++ b/mm/internal.h
>>   
> 
> [snip]
> 
>> diff --git a/mm/swap.c b/mm/swap.c
>> index 0eb057141a04..93d880c6f73c 100644
>> --- a/mm/swap.c
>> +++ b/mm/swap.c
>> @@ -116,12 +116,11 @@ static void __put_compound_page(struct page *page)
>>   void __put_page(struct page *page)
>>   {
>>   	if (is_zone_device_page(page)) {
>> -		put_dev_pagemap(page->pgmap);
>> -
>>   		/*
>>   		 * The page belongs to the device that created pgmap. Do
>>   		 * not return it to page allocator.
>>   		 */
>> +		free_zone_device_page(page);
> 
> I really like this.
> 
> Ira
> 

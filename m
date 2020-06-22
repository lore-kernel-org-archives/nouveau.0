From: Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 13/16] mm: support THP migration to device private memory
Date: Mon, 22 Jun 2020 14:31:47 -0700
Message-ID: <a5f502f8-70cd-014b-8066-bbaeb8024a29@nvidia.com>
References: <20200619215649.32297-1-rcampbell@nvidia.com>
 <20200619215649.32297-14-rcampbell@nvidia.com>
 <F1872509-3B1F-4A8A-BFF5-E4D44E451920@nvidia.com>
 <b6eed976-c515-72d6-a7be-2296cab8f0d4@nvidia.com>
 <C7BEB563-3698-442C-A188-1B66CBE4CF63@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-rdma-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <C7BEB563-3698-442C-A188-1B66CBE4CF63-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-rdma-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zi Yan <ziy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, linux-kselftest-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jerome Glisse <jglisse-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, John Hubbard <jhubbard-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>, Jason Gunthorpe <jgg-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Shuah Khan <shuah-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: nouveau.vger.kernel.org


On 6/22/20 1:10 PM, Zi Yan wrote:
> On 22 Jun 2020, at 15:36, Ralph Campbell wrote:
> 
>> On 6/21/20 4:20 PM, Zi Yan wrote:
>>> On 19 Jun 2020, at 17:56, Ralph Campbell wrote:
>>>
>>>> Support transparent huge page migration to ZONE_DEVICE private memory.
>>>> A new flag (MIGRATE_PFN_COMPOUND) is added to the input PFN array to
>>>> indicate the huge page was fully mapped by the CPU.
>>>> Export prep_compound_page() so that device drivers can create huge
>>>> device private pages after calling memremap_pages().
>>>>
>>>> Signed-off-by: Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>>> ---
>>>>    include/linux/migrate.h |   1 +
>>>>    include/linux/mm.h      |   1 +
>>>>    mm/huge_memory.c        |  30 ++++--
>>>>    mm/internal.h           |   1 -
>>>>    mm/memory.c             |  10 +-
>>>>    mm/memremap.c           |   9 +-
>>>>    mm/migrate.c            | 226 ++++++++++++++++++++++++++++++++--------
>>>>    mm/page_alloc.c         |   1 +
>>>>    8 files changed, 226 insertions(+), 53 deletions(-)
>>>>
>>>> diff --git a/include/linux/migrate.h b/include/linux/migrate.h
>>>> index 3e546cbf03dd..f6a64965c8bd 100644
>>>> --- a/include/linux/migrate.h
>>>> +++ b/include/linux/migrate.h
>>>> @@ -166,6 +166,7 @@ static inline int migrate_misplaced_transhuge_page(struct mm_struct *mm,
>>>>    #define MIGRATE_PFN_MIGRATE	(1UL << 1)
>>>>    #define MIGRATE_PFN_LOCKED	(1UL << 2)
>>>>    #define MIGRATE_PFN_WRITE	(1UL << 3)
>>>> +#define MIGRATE_PFN_COMPOUND	(1UL << 4)
>>>>    #define MIGRATE_PFN_SHIFT	6
>>>>
>>>>    static inline struct page *migrate_pfn_to_page(unsigned long mpfn)
>>>> diff --git a/include/linux/mm.h b/include/linux/mm.h
>>>> index dc7b87310c10..020b9dd3cddb 100644
>>>> --- a/include/linux/mm.h
>>>> +++ b/include/linux/mm.h
>>>> @@ -932,6 +932,7 @@ static inline unsigned int page_shift(struct page *page)
>>>>    }
>>>>
>>>>    void free_compound_page(struct page *page);
>>>> +void prep_compound_page(struct page *page, unsigned int order);
>>>>
>>>>    #ifdef CONFIG_MMU
>>>>    /*
>>>> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
>>>> index 78c84bee7e29..25d95f7b1e98 100644
>>>> --- a/mm/huge_memory.c
>>>> +++ b/mm/huge_memory.c
>>>> @@ -1663,23 +1663,35 @@ int zap_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
>>>>    	} else {
>>>>    		struct page *page = NULL;
>>>>    		int flush_needed = 1;
>>>> +		bool is_anon = false;
>>>>
>>>>    		if (pmd_present(orig_pmd)) {
>>>>    			page = pmd_page(orig_pmd);
>>>> +			is_anon = PageAnon(page);
>>>>    			page_remove_rmap(page, true);
>>>>    			VM_BUG_ON_PAGE(page_mapcount(page) < 0, page);
>>>>    			VM_BUG_ON_PAGE(!PageHead(page), page);
>>>>    		} else if (thp_migration_supported()) {
>>>>    			swp_entry_t entry;
>>>>
>>>> -			VM_BUG_ON(!is_pmd_migration_entry(orig_pmd));
>>>>    			entry = pmd_to_swp_entry(orig_pmd);
>>>> -			page = pfn_to_page(swp_offset(entry));
>>>> +			if (is_device_private_entry(entry)) {
>>>> +				page = device_private_entry_to_page(entry);
>>>> +				is_anon = PageAnon(page);
>>>> +				page_remove_rmap(page, true);
>>>> +				VM_BUG_ON_PAGE(page_mapcount(page) < 0, page);
>>>> +				VM_BUG_ON_PAGE(!PageHead(page), page);
>>>> +				put_page(page);
>>>
>>> Why do you hide this code behind thp_migration_supported()? It seems that you just need
>>> pmd swap entry not pmd migration entry. Also the condition is not consistent with the code
>>> in __handle_mm_fault(), in which you handle is_device_private_entry() directly without
>>> checking thp_migration_support().
>>
>> Good point, I think "else if (thp_migration_supported())" should be
>> "else if (is_pmd_migration_entry(orig_pmd))" since if the PMD *is*
>> a device private or migration entry, then it should be handled and the
>> VM_BUG_ON() should be that thp_migration_supported() is true
>> (or maybe remove the VM_BUG_ON?).
> 
> I disagree. A device private entry is independent of a PMD migration entry, since a device private
> entry is just a swap entry, which is available when CONFIG_TRANSPARENT_HUGEPAGE. So for architectures
> support THP but not THP migration (like ARM64), your code should still work.

I'll fix this up for v2 and you can double check me.

> I would suggest you to check all the use of is_swap_pmd() and make sure the code
> can handle is_device_private_entry().

OK.

> For new device private code, you might need to guard it either statically or dynamically in case
> CONFIG_DEVICE_PRIVATE is disabled. Potentially, you would like to make sure a system without
> CONFIG_DEVICE_PRIVATE will not see is_device_private_entry() == true and give errors when it does.

I have compiled and run with CONFIG_DEVICE_PRIVATE off but I can test more combinations of
config settings.

>>
>>> Do we need to support split_huge_pmd() if a page is migrated to device? Any new code
>>> needed in split_huge_pmd()?
>>
>> I was thinking that any CPU usage of the device private page would cause it to be
>> migrated back to system memory as a whole PMD/PUD page but I'll double check.
>> At least there should be a check that the page isn't a device private page.
> 
> Well, that depends. If we can allocate a THP on CPU memory, we can migrate the whole page back.
> But if no THP is allocated due to low on free memory or memory fragmentation, I think you
> might need a fallback plan, either splitting the device private page and migrating smaller
> pages instead or reclaiming CPU memory until you get a THP. IMHO, the former might be preferred,
> since the latter might cost a lot of CPU cycles but still gives no THP after all.

Sounds reasonable. I'll work on adding the fallback path for v2.

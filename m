From: Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v4 6/6] mm/migrate: remove range invalidation
 in migrate_vma_pages()
Date: Fri, 31 Jul 2020 12:31:23 -0700
Message-ID: <b8c35d45-91d0-1c99-390a-049867af17fb@nvidia.com>
References: <20200723223004.9586-1-rcampbell@nvidia.com>
 <20200723223004.9586-7-rcampbell@nvidia.com>
 <20200728191940.GB159104@nvidia.com>
 <7f947311-0034-9148-1dca-fb9b9a10abc4@nvidia.com>
 <20200731191543.GJ24045@ziepe.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20200731191543.GJ24045-uk2M96/98Pc@public.gmane.org>
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
To: Jason Gunthorpe <jgg-uk2M96/98Pc@public.gmane.org>
Cc: linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kvm-ppc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Bharata B Rao <bharata-tEXmvtCZX7AybS5Ee8rs3A@public.gmane.org>, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-kselftest-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Shuah Khan <shuah-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
List-Id: nouveau.vger.kernel.org


On 7/31/20 12:15 PM, Jason Gunthorpe wrote:
> On Tue, Jul 28, 2020 at 03:04:07PM -0700, Ralph Campbell wrote:
>>
>> On 7/28/20 12:19 PM, Jason Gunthorpe wrote:
>>> On Thu, Jul 23, 2020 at 03:30:04PM -0700, Ralph Campbell wrote:
>>>> When migrating the special zero page, migrate_vma_pages() calls
>>>> mmu_notifier_invalidate_range_start() before replacing the zero page
>>>> PFN in the CPU page tables. This is unnecessary since the range was
>>>> invalidated in migrate_vma_setup() and the page table entry is checked
>>>> to be sure it hasn't changed between migrate_vma_setup() and
>>>> migrate_vma_pages(). Therefore, remove the redundant invalidation.
>>>
>>> I don't follow this logic, the purpose of the invalidation is also to
>>> clear out anything that may be mirroring this VA, and "the page hasn't
>>> changed" doesn't seem to rule out that case?
>>>
>>> I'm also not sure I follow where the zero page came from?
>>
>> The zero page comes from an anonymous private VMA that is read-only
>> and the user level CPU process tries to read the page data (or any
>> other read page fault).
>>
>>> Jason
>>>
>>
>> The overall migration process is:
>>
>> mmap_read_lock()
>>
>> migrate_vma_setup()
>>        // invalidates range, locks/isolates pages, puts migration entry in page table
>>
>> <driver allocates destination pages and copies source to dest>
>>
>> migrate_vma_pages()
>>        // moves source struct page info to destination struct page info.
>>        // clears migration flag for pages that can't be migrated.
>>
>> <driver updates device page tables for pages still migrating, rollback pages not migrating>
>>
>> migrate_vma_finalize()
>>        // replaces migration page table entry with destination page PFN.
>>
>> mmap_read_unlock()
>>
>> Since the address range is invalidated in the migrate_vma_setup() stage,
>> and the page is isolated from the LRU cache, locked, unmapped, and the page table
>> holds a migration entry (so the page can't be faulted and the CPU page table set
>> valid again), and there are no extra page references (pins), the page
>> "should not be modified".
> 
> That is the physical page though, it doesn't prove nobody else is
> reading the PTE.
>   
>> For pte_none()/is_zero_pfn() entries, migrate_vma_setup() leaves the
>> pte_none()/is_zero_pfn() entry in place but does still call
>> mmu_notifier_invalidate_range_start() for the whole range being migrated.
> 
> Ok..
> 
>> In the migrate_vma_pages() step, the pte page table is locked and the
>> pte entry checked to be sure it is still pte_none/is_zero_pfn(). If not,
>> the new page isn't inserted. If it is still none/zero, the new device private
>> struct page is inserted into the page table, replacing the pte_none()/is_zero_pfn()
>> page table entry. The secondary MMUs were already invalidated in the migrate_vma_setup()
>> step and a pte_none() or zero page can't be modified so the only invalidation needed
>> is the CPU TLB(s) for clearing the special zero page PTE entry.
> 
> No, the secondary MMU was invalidated but the invalidation start/end
> range was exited. That means a secondary MMU is immeidately able to
> reload the zero page into its MMU cache.
> 
> When this code replaces the PTE that has a zero page it also has to
> invalidate again so that secondary MMU's are guaranteed to pick up the
> new PTE value.
> 
> So, I still don't understand how this is safe?
> 
> Jason

Oops, you are right of course. I was only thinking of the device doing the migration
and forgetting about a second device faulting on the same page.
You can drop patch from the series.

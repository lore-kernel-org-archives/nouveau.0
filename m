From: Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 2/5] mm/migrate: add a direction parameter
 to migrate_vma
Date: Mon, 20 Jul 2020 16:53:44 -0700
Message-ID: <d458ffef-d205-e71d-1b8b-60721c42ca7f@nvidia.com>
References: <20200713172149.2310-1-rcampbell@nvidia.com>
 <20200713172149.2310-3-rcampbell@nvidia.com>
 <20200720183643.GA3028737@nvidia.com>
 <2e775a5d-9d62-de52-6799-3bbb09c88c5a@nvidia.com>
 <20200720195943.GH2021234@nvidia.com>
 <fdfde6a0-f2bf-c0b2-0283-c882aa755292@nvidia.com>
 <20200720231633.GI2021234@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20200720231633.GI2021234-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
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
To: Jason Gunthorpe <jgg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kvm-ppc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Bharata B Rao <bharata-tEXmvtCZX7AybS5Ee8rs3A@public.gmane.org>, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-kselftest-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Shuah Khan <shuah-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
List-Id: nouveau.vger.kernel.org


On 7/20/20 4:16 PM, Jason Gunthorpe wrote:
> On Mon, Jul 20, 2020 at 01:49:09PM -0700, Ralph Campbell wrote:
>>
>> On 7/20/20 12:59 PM, Jason Gunthorpe wrote:
>>> On Mon, Jul 20, 2020 at 12:54:53PM -0700, Ralph Campbell wrote:
>>>>>> diff --git a/include/linux/migrate.h b/include/linux/migrate.h
>>>>>> index 3e546cbf03dd..620f2235d7d4 100644
>>>>>> +++ b/include/linux/migrate.h
>>>>>> @@ -180,6 +180,11 @@ static inline unsigned long migrate_pfn(unsigned long pfn)
>>>>>>     	return (pfn << MIGRATE_PFN_SHIFT) | MIGRATE_PFN_VALID;
>>>>>>     }
>>>>>> +enum migrate_vma_direction {
>>>>>> +	MIGRATE_VMA_FROM_SYSTEM,
>>>>>> +	MIGRATE_VMA_FROM_DEVICE_PRIVATE,
>>>>>> +};
>>>>>
>>>>> I would have guessed this is more natural as _FROM_DEVICE_ and
>>>>> TO_DEVICE_ ?
>>>>
>>>> The caller controls where the destination memory is allocated so it isn't
>>>> necessarily device private memory, it could be from system to system.
>>>> The use case for system to system memory migration is for hardware
>>>> like ARM SMMU or PCIe ATS where a single set of page tables is shared by
>>>> the device and a CPU process over a coherent system memory bus.
>>>> Also many integrated GPUs in SOCs fall into this category too.
>>>
>>> Maybe just TO/FROM_DEIVCE then? Even though the memory is not
>>> DEVICE_PRIVATE it is still device owned pages right?
>>>
>>>> So to me, it makes more sense to specify the direction based on the
>>>> source location.
>>>
>>> It feels strange because the driver doesn't always know or control the
>>> source?
>>
>> The driver can't really know where the source is currently located because the
>> API is designed to not initially hold the page locks, migrate_vma_setup() only knows
>> the source once it holds the page table locks and isolates/locks the pages being
>> migrated. The direction and pgmap_owner are supposed to filter which pages
>> the caller is interested in migrating.
>> Perhaps the direction should instead be a flags field with separate bits for
>> system memory and device private memory selecting source candidates for
>> migration. I can imagine use cases for all 4 combinations of
>> d->d, d->s, s->d, and s->s being valid.
>>
>> I didn't really think a direction was needed, this was something that
>> Christoph Hellwig seemed to think made the API safer.
> 
> If it is a filter then just using those names would make sense
> 
> MIGRATE_VMA_SELECT_SYSTEM
> MIGRATE_VMA_SELECT_DEVICE_PRIVATE
> 
> SYSTEM feels like the wrong name too, doesn't linux have a formal name
> for RAM struct pages?

Highmem? Movable? Zone normal?
There are quite a few :-)
At the moment, only anonymous pages are being migrated but I expect
file backed pages to be supported at some point (but not DAX).
VM_PFNMAP and VM_MIXEDMAP might make sense some day with peer-to-peer
copies.

So MIGRATE_VMA_SELECT_SYSTEM seems OK to me.

> In your future coherent design how would the migrate select 'device'
> pages that are fully coherent? Are they still zone something pages
> that are OK for CPU usage?
> 
> Jason
> 

For pages that are device private, the pgmap_owner selects them (plus the
MIGRATE_VMA_SELECT_DEVICE_PRIVATE flag).
For pages that are migrating from system memory to system memory, I expect
the pages to be in different NUMA zones. Otherwise, there wouldn't be much
point in migrating them. And yes, the CPU can access them.
It might be useful to have a filter saying "migrate system memory not already
in NUMA zone X" if the MIGRATE_VMA_SELECT_SYSTEM flag is set.

Also, in support of the flags field, I'm looking at THP migration and I can
picture defining some request flags like hmm_range_fault() to say "migrate
THPs if they exist, otherwise split THPs".
A default_flags MIGRATE_PFN_REQ_FAULT would be useful if the source page is
swapped out. Currently, migrate_vma_setup() just skips these pages without
any indication to the caller why the page isn't being migrated or if retrying
is worth attempting.

From: Ralph Campbell <rcampbell@nvidia.com>
Subject: Re: [PATCH 09/16] mm/hmm: add output flag for compound page mapping
Date: Mon, 22 Jun 2020 16:26:41 -0700
Message-ID: <f5ae2cdd-5774-8d1e-5a30-657b611568b8@nvidia.com>
References: <20200619215649.32297-1-rcampbell@nvidia.com>
 <20200619215649.32297-10-rcampbell@nvidia.com>
 <20200622172520.GB2874652@mellanox.com>
 <15ba19a9-5f71-546b-bdea-31e65fc39693@nvidia.com>
 <20200622231835.GD2874652@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200622231835.GD2874652@mellanox.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jason Gunthorpe <jgg@mellanox.com>
Cc: nouveau@lists.freedesktop.org, linux-rdma@vger.kernel.org, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, Jerome Glisse <jglisse@redhat.com>, John Hubbard <jhubbard@nvidia.com>, Christoph Hellwig <hch@lst.de>, Ben Skeggs <bskeggs@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>
List-Id: nouveau.vger.kernel.org


On 6/22/20 4:18 PM, Jason Gunthorpe wrote:
> On Mon, Jun 22, 2020 at 11:10:05AM -0700, Ralph Campbell wrote:
>>
>> On 6/22/20 10:25 AM, Jason Gunthorpe wrote:
>>> On Fri, Jun 19, 2020 at 02:56:42PM -0700, Ralph Campbell wrote:
>>>> hmm_range_fault() returns an array of page frame numbers and flags for
>>>> how the pages are mapped in the requested process' page tables. The PFN
>>>> can be used to get the struct page with hmm_pfn_to_page() and the page size
>>>> order can be determined with compound_order(page) but if the page is larger
>>>> than order 0 (PAGE_SIZE), there is no indication that the page is mapped
>>>> using a larger page size. To be fully general, hmm_range_fault() would need
>>>> to return the mapping size to handle cases like a 1GB compound page being
>>>> mapped with 2MB PMD entries. However, the most common case is the mapping
>>>> size is the same as the underlying compound page size.
>>>> Add a new output flag to indicate this so that callers know it is safe to
>>>> use a large device page table mapping if one is available.
>>>
>>> But what size should the caller use?
>>>
>>> You already explained that the caller cannot use compound_ordet() to
>>> get the size, so what should it be?
>>>
>>> Probably this needs to be two flags, PUD and PMD, and the caller should
>>> use the PUD and PMD sizes to figure out how big it is?
>>>
>>> Jason
>>>
>>
>> I guess I didn't explain it as clearly as I thought. :-)
>>
>> The page size *can* be determined with compound_order(page) but without the
>> flag, the caller doesn't know how much of that page is being mapped by the
>> CPU. The flag says the CPU is mapping the whole compound page (based on compound_order)
>> and that the caller can use device mappings up to the size of compound_order(page).
> 
> No, I got it, I just don't like the assumption that just because a PMD
> or PUD points to a page that the only possible value for
> compound_page() is PMD or PUD respectively. Partial mapping should be
> possible in both cases, if not today, then maybe down the road with
> some of the large page work that has been floating about
> 
> It seems much safer to just directly encode the PUD/PMD size in the
> flags
> 
> Jason

That is fine with me. I'll make that change for v2.
I was just trying to minimize the number of flags being added.

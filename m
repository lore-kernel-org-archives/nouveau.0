From: Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 0/6] nouveau/hmm: add support for mapping large pages
Date: Mon, 11 May 2020 10:07:55 -0700
Message-ID: <04fed5a1-c777-8594-c869-8598da75c340@nvidia.com>
References: <20200508192009.15302-1-rcampbell@nvidia.com>
 <20200508195910.GR16070@bombadil.infradead.org>
 <72422dca-e025-002a-4748-addfb392ffc4@nvidia.com>
 <20200509031726.GT16070@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-rdma-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200509031726.GT16070-PfSpb0PWhxZc2C7mugBRk2EX/6BAtgUQ@public.gmane.org>
Content-Language: en-US
Sender: linux-rdma-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matthew Wilcox <willy-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, linux-kselftest-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jerome Glisse <jglisse-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, John Hubbard <jhubbard-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>, Jason Gunthorpe <jgg-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Shuah Khan <shuah-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: nouveau.vger.kernel.org


On 5/8/20 8:17 PM, Matthew Wilcox wrote:
> On Fri, May 08, 2020 at 01:17:55PM -0700, Ralph Campbell wrote:
>> On 5/8/20 12:59 PM, Matthew Wilcox wrote:
>>> On Fri, May 08, 2020 at 12:20:03PM -0700, Ralph Campbell wrote:
>>>> hmm_range_fault() returns an array of page frame numbers and flags for
>>>> how the pages are mapped in the requested process' page tables. The PFN
>>>> can be used to get the struct page with hmm_pfn_to_page() and the page size
>>>> order can be determined with compound_order(page) but if the page is larger
>>>> than order 0 (PAGE_SIZE), there is no indication that the page is mapped
>>>> using a larger page size. To be fully general, hmm_range_fault() would need
>>>> to return the mapping size to handle cases like a 1GB compound page being
>>>> mapped with 2MB PMD entries. However, the most common case is the mapping
>>>> size the same as the underlying compound page size.
>>>> This series adds a new output flag to indicate this so that callers know it
>>>> is safe to use a large device page table mapping if one is available.
>>>> Nouveau and the HMM tests are updated to use the new flag.
>>>
>>> This explanation doesn't make any sense.  It doesn't matter how somebody
>>> else has it mapped; if it's a PMD-sized page, you can map it with a
>>> 2MB mapping.
>>
>> Sure, the I/O will work OK, but is it safe?
>> Copy on write isn't an issue? splitting a PMD in one process due to
>> mprotect of a shared page will cause other process' page tables to be split
>> the same way?
> 
> Are you saying that if you call this function on an address range of a
> process which has done COW of a single page in the middle of a THP,
> you want to return with this flag clear, but if the THP is still intact,
> you want to set this flag?

Correct. I want the GPU to see the same faults that the CPU would see when trying
to access the same addresses. All faults, whether from CPU or GPU, end up calling
handle_mm_fault() to handle the fault and update the GPU/CPU page tables.

>> Recall that these are system memory pages that could be THPs, shmem, hugetlbfs,
>> mmap shared file pages, etc.

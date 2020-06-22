From: Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 09/16] mm/hmm: add output flag for compound page mapping
Date: Mon, 22 Jun 2020 11:10:05 -0700
Message-ID: <15ba19a9-5f71-546b-bdea-31e65fc39693@nvidia.com>
References: <20200619215649.32297-1-rcampbell@nvidia.com>
 <20200619215649.32297-10-rcampbell@nvidia.com>
 <20200622172520.GB2874652@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-rdma-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200622172520.GB2874652-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Content-Language: en-US
Sender: linux-rdma-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Gunthorpe <jgg-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, linux-kselftest-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jerome Glisse <jglisse-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, John Hubbard <jhubbard-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Shuah Khan <shuah-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: nouveau.vger.kernel.org


On 6/22/20 10:25 AM, Jason Gunthorpe wrote:
> On Fri, Jun 19, 2020 at 02:56:42PM -0700, Ralph Campbell wrote:
>> hmm_range_fault() returns an array of page frame numbers and flags for
>> how the pages are mapped in the requested process' page tables. The PFN
>> can be used to get the struct page with hmm_pfn_to_page() and the page size
>> order can be determined with compound_order(page) but if the page is larger
>> than order 0 (PAGE_SIZE), there is no indication that the page is mapped
>> using a larger page size. To be fully general, hmm_range_fault() would need
>> to return the mapping size to handle cases like a 1GB compound page being
>> mapped with 2MB PMD entries. However, the most common case is the mapping
>> size is the same as the underlying compound page size.
>> Add a new output flag to indicate this so that callers know it is safe to
>> use a large device page table mapping if one is available.
> 
> But what size should the caller use?
> 
> You already explained that the caller cannot use compound_ordet() to
> get the size, so what should it be?
> 
> Probably this needs to be two flags, PUD and PMD, and the caller should
> use the PUD and PMD sizes to figure out how big it is?
> 
> Jason
> 

I guess I didn't explain it as clearly as I thought. :-)

The page size *can* be determined with compound_order(page) but without the
flag, the caller doesn't know how much of that page is being mapped by the
CPU. The flag says the CPU is mapping the whole compound page (based on compound_order)
and that the caller can use device mappings up to the size of compound_order(page).

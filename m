From: Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 4/6] mm/hmm: add output flag for compound page mapping
Date: Fri, 8 May 2020 13:06:55 -0700
Message-ID: <1ec0511f-e6eb-3e11-ad6d-ad4e5b107464@nvidia.com>
References: <20200508192009.15302-1-rcampbell@nvidia.com>
 <20200508192009.15302-5-rcampbell@nvidia.com> <20200508195129.GA19740@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-rdma-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200508195129.GA19740-jcswGhMUV9g@public.gmane.org>
Content-Language: en-US
Sender: linux-rdma-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, linux-kselftest-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jerome Glisse <jglisse-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, John Hubbard <jhubbard-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jason Gunthorpe <jgg-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Shuah Khan <shuah-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, willy-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org
List-Id: nouveau.vger.kernel.org


On 5/8/20 12:51 PM, Christoph Hellwig wrote:
> On Fri, May 08, 2020 at 12:20:07PM -0700, Ralph Campbell wrote:
>> hmm_range_fault() returns an array of page frame numbers and flags for
>> how the pages are mapped in the requested process' page tables. The PFN
>> can be used to get the struct page with hmm_pfn_to_page() and the page size
>> order can be determined with compound_order(page) but if the page is larger
>> than order 0 (PAGE_SIZE), there is no indication that the page is mapped
>> using a larger page size. To be fully general, hmm_range_fault() would need
>> to return the mapping size to handle cases like a 1GB compound page being
>> mapped with 2MB PMD entries. However, the most common case is the mapping
>> size the same as the underlying compound page size.
>> Add a new output flag to indicate this so that callers know it is safe to
>> use a large device page table mapping if one is available.
> 
> Why do you need the flag?  The caller should be able to just use
> page_size() (or willys new thp_size helper).
> 

The question is whether or not a large page can be mapped with smaller
page table entries with different permissions. If one process has a 2MB
page mapped with 4K PTEs with different read/write permissions, I don't think
it would be OK for a device to map the whole 2MB with write access enabled.
The flag is supposed to indicate that the whole page can be mapped by the
device with the indicated read/write permissions.

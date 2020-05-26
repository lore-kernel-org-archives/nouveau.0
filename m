From: Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 0/6] nouveau/hmm: add support for mapping
 large pages
Date: Tue, 26 May 2020 10:32:48 -0700
Message-ID: <4743ec6e-a5a0-16ac-a1b8-992f851515f0@nvidia.com>
References: <20200508192009.15302-1-rcampbell@nvidia.com>
 <20200525134118.GA2536@ziepe.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20200525134118.GA2536-uk2M96/98Pc@public.gmane.org>
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
Cc: linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-kselftest-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Shuah Khan <shuah-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
List-Id: nouveau.vger.kernel.org


On 5/25/20 6:41 AM, Jason Gunthorpe wrote:
> On Fri, May 08, 2020 at 12:20:03PM -0700, Ralph Campbell wrote:
>> hmm_range_fault() returns an array of page frame numbers and flags for
>> how the pages are mapped in the requested process' page tables. The PFN
>> can be used to get the struct page with hmm_pfn_to_page() and the page size
>> order can be determined with compound_order(page) but if the page is larger
>> than order 0 (PAGE_SIZE), there is no indication that the page is mapped
>> using a larger page size. To be fully general, hmm_range_fault() would need
>> to return the mapping size to handle cases like a 1GB compound page being
>> mapped with 2MB PMD entries. However, the most common case is the mapping
>> size the same as the underlying compound page size.
>> This series adds a new output flag to indicate this so that callers know it
>> is safe to use a large device page table mapping if one is available.
>> Nouveau and the HMM tests are updated to use the new flag.
>>
>> Note that this series depends on a patch queued in Ben Skeggs' nouveau
>> tree ("nouveau/hmm: map pages after migration") and the patches queued
>> in Jason's HMM tree.
>> There is also a patch outstanding ("nouveau/hmm: fix nouveau_dmem_chunk
>> allocations") that is independent of the above and could be applied
>> before or after.
> 
> Did Christoph and Matt's remarks get addressed here?

Both questioned the need to add the HMM_PFN_COMPOUND flag to the
hmm_range_fault() output array saying that the PFN can be used to get the
struct page pointer and the page can be examined to determine the page size.
My response is that while is true, it is also important that the device only
access the same parts of a large page that the process/cpu has access to.
There are places where a large page is mapped with smaller page table entries
when a page is shared by multiple processes.
After I explained this, I haven't seen any further comments from Christoph
and Matt. I'm still looking for reviews, acks, or suggested changes.


> I think ODP could use something like this, currently it checks every
> page to get back to the huge page size and this flag would optimze
> that
> 
> Jason

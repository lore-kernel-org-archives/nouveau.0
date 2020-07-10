From: Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v3 0/5] mm/hmm/nouveau: add PMD system memory mapping
Date: Fri, 10 Jul 2020 13:13:46 -0700
Message-ID: <886151ff-c8e7-7b49-cc8d-c0e32fdc770b@nvidia.com>
References: <20200701225352.9649-1-rcampbell@nvidia.com>
 <20200710192704.GA2128670@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-rdma-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200710192704.GA2128670-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-rdma-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Gunthorpe <jgg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kselftest-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jerome Glisse <jglisse-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, John Hubbard <jhubbard-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Shuah Khan <shuah-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org


On 7/10/20 12:27 PM, Jason Gunthorpe wrote:
> On Wed, Jul 01, 2020 at 03:53:47PM -0700, Ralph Campbell wrote:
>> The goal for this series is to introduce the hmm_pfn_to_map_order()
>> function. This allows a device driver to know that a given 4K PFN is
>> actually mapped by the CPU using a larger sized CPU page table entry and
>> therefore the device driver can safely map system memory using larger
>> device MMU PTEs.
>> The series is based on 5.8.0-rc3 and is intended for Jason Gunthorpe's
>> hmm tree. These were originally part of a larger series:
>> https://lore.kernel.org/linux-mm/20200619215649.32297-1-rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org/
>>
>> Changes in v3:
>> Replaced the HMM_PFN_P[MU]D flags with hmm_pfn_to_map_order() to
>> indicate the size of the CPU mapping.
>>
>> Changes in v2:
>> Make the hmm_range_fault() API changes into a separate series and add
>>    two output flags for PMD/PUD instead of a single compund page flag as
>>    suggested by Jason Gunthorpe.
>> Make the nouveau page table changes a separate patch as suggested by
>>    Ben Skeggs.
>> Only add support for 2MB nouveau mappings initially since changing the
>> 1:1 CPU/GPU page table size assumptions requires a bigger set of changes.
>> Rebase to 5.8.0-rc3.
>>
>> Ralph Campbell (5):
>>    nouveau/hmm: fault one page at a time
>>    mm/hmm: add hmm_mapping order
>>    nouveau: fix mapping 2MB sysmem pages
>>    nouveau/hmm: support mapping large sysmem pages
>>    hmm: add tests for HMM_PFN_PMD flag
> 
> Applied to hmm.git.
> 
> I edited the comment for hmm_pfn_to_map_order() and added a function
> to compute the field.
> 
> Thanks,
> Jason

Looks good, thanks.

From: Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 08/16] nouveau/hmm: fault one page at a time
Date: Mon, 22 Jun 2020 11:44:59 -0700
Message-ID: <f529df0d-707c-cb67-ac12-356784e54ef8@nvidia.com>
References: <20200619215649.32297-1-rcampbell@nvidia.com>
 <20200619215649.32297-9-rcampbell@nvidia.com>
 <20200622172233.GA2874652@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-rdma-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200622172233.GA2874652-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Content-Language: en-US
Sender: linux-rdma-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Gunthorpe <jgg-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, linux-kselftest-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jerome Glisse <jglisse-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, John Hubbard <jhubbard-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Shuah Khan <shuah-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: nouveau.vger.kernel.org


On 6/22/20 10:22 AM, Jason Gunthorpe wrote:
> On Fri, Jun 19, 2020 at 02:56:41PM -0700, Ralph Campbell wrote:
>> The SVM page fault handler groups faults into a range of contiguous
>> virtual addresses and requests hmm_range_fault() to populate and
>> return the page frame number of system memory mapped by the CPU.
>> In preparation for supporting large pages to be mapped by the GPU,
>> process faults one page at a time. In addition, use the hmm_range
>> default_flags to fix a corner case where the input hmm_pfns array
>> is not reinitialized after hmm_range_fault() returns -EBUSY and must
>> be called again.
> 
> Are you sure? hmm_range_fault is pretty expensive per call..
> 
> Jason
> 

Short answer is no, I'm not 100% sure.

The GPU might generate a list of dozens or hundreds of fault entries in the
same 4K page, or sequential 4K pages, or some other stride.
A single 2MB mapping might satisfy all of those after calling hmm_range_fault()
for the first fault entry and then skipping all the other fault entries
that fall into that range. So mostly, I'm proposing this change because it
makes handling the compound page case and -EBUSY case simpler.

As for performance, that is hard to say because nouveau is missing policies
for whether to migrate data to GPU memory on a fault or to map system memory.
Since GPU memory is much higher bandwidth, overall performance
can be much higher if the data is migrated to the GPU's local memory but
currently, migration is only performed explicitly under application request
(via OpenCL clEnqueueSVMMigrateMem() call).
If the GPU is only accessing system memory a few times, then it can be faster
to map system memory and not migrate the data so it depends on the application.
Then there is thrashing to consider if the GPU and CPU are both trying to
access the same pages...

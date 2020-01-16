From: Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v6 5/6] nouveau: use new mmu interval notifiers
Date: Thu, 16 Jan 2020 12:16:30 -0800
Message-ID: <01adb7dd-589e-2cde-4fa9-68baa44c0976@nvidia.com>
References: <20200113224703.5917-1-rcampbell@nvidia.com>
 <20200113224703.5917-6-rcampbell@nvidia.com>
 <20200114125957.GO20978@mellanox.com>
 <5845f50e-8bc0-8068-ee21-4f910beb1255@nvidia.com>
 <20200116160002.GL20978@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-rdma-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200116160002.GL20978-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Content-Language: en-US
Sender: linux-rdma-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Gunthorpe <jgg-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Cc: "linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org" <linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-kselftest-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kselftest-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jerome Glisse <jglisse-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, John Hubbard <jhubbard-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Shuah Khan <shuah-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: nouveau.vger.kernel.org


On 1/16/20 8:00 AM, Jason Gunthorpe wrote:
> On Wed, Jan 15, 2020 at 02:09:47PM -0800, Ralph Campbell wrote:
> 
>> I don't understand the lifetime/membership issue. The driver is the only thing
>> that allocates, inserts, or removes struct mmu_interval_notifier and thus
>> completely controls the lifetime.
> 
> If the returned value is on the defered list it could be freed at any
> moment. The existing locks do not prevent it.
> 
>>>> +		ret = nouveau_svmm_interval_find(svmm, &range);
>>>> +		if (ret) {
>>>> +			up_read(&mm->mmap_sem);
>>>> +			return ret;
>>>> +		}
>>>> +		range.notifier_seq = mmu_interval_read_begin(range.notifier);
>>>>    		ret = hmm_range_fault(&range, 0);
>>>>    		up_read(&mm->mmap_sem);
>>>>    		if (ret <= 0) {
>>>
>>> I'm still not sure this is a better approach than what ODP does. It
>>> looks very expensive on the fault path..
>>>
>>> Jason
>>>
>>
>> ODP doesn't have this problem because users have to call ib_reg_mr()
>> before any I/O can happen to the process address space.
> 
> ODP supports a single 'full VA' call at process startup, just like
> these cases.
> 
>> That is when mmu_interval_notifier_insert() /
>> mmu_interval_notifier_remove() can be called and the driver doesn't
>> have to worry about the interval changing sizes or being removed
>> while I/O is happening.
> 
> No, for the 'ODP full process VA' (aka implicit ODP) mode it
> dynamically maintains a list of intervals. ODP chooses the align the
> dynamic intervals to it's HW page table levels, and not to SW VMAs.
> This is much simpler to manage and faster to fault, at the cost of
> capturing more VA for invalidations which have to be probed against
> the HW shadow PTEs.
> 
>> It isn't that expensive, there is an extra driver lock/unlock as
>> part of the lookup and possibly a find_vma() and kmalloc(GFP_ATOMIC)
>> for new intervals. Also, the deferred interval updates for munmap().
>> Compared to the cost of updating PTEs in the device and GPU fault
>> handling, this is minimal overhead.
> 
> Well, compared to ODP which does a single xa lookup with no lock to
> find its interval, this looks very expensive and not parallel.
> 
> I think if there is merit in having ranges cover the vmas and track
> changes then there is probably merit in having the core code provide
> much of that logic, not the driver.
> 
> But it would be interesting to see some kind of analysis on the two
> methods to decide if the complexity is worthwhile.
> 
> Jason
> 

Can you point me to the latest ODP code? Seems like my understanding is
quite off.

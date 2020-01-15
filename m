From: Ralph Campbell <rcampbell@nvidia.com>
Subject: Re: [PATCH v6 5/6] nouveau: use new mmu interval notifiers
Date: Wed, 15 Jan 2020 14:09:47 -0800
Message-ID: <5845f50e-8bc0-8068-ee21-4f910beb1255@nvidia.com>
References: <20200113224703.5917-1-rcampbell@nvidia.com>
 <20200113224703.5917-6-rcampbell@nvidia.com>
 <20200114125957.GO20978@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <20200114125957.GO20978@mellanox.com>
Content-Language: en-US
Sender: owner-linux-mm@kvack.org
To: Jason Gunthorpe <jgg@mellanox.com>
Cc: "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>, Jerome Glisse <jglisse@redhat.com>, John
 Hubbard <jhubbard@nvidia.com>, Christoph Hellwig <hch@lst.de>, Andrew Morton <akpm@linux-foundation.org>, Ben Skeggs <bskeggs@redhat.com>, Shuah Khan <shuah@kernel.org>
List-Id: nouveau.vger.kernel.org


On 1/14/20 5:00 AM, Jason Gunthorpe wrote:
> On Mon, Jan 13, 2020 at 02:47:02PM -0800, Ralph Campbell wrote:
>>   void
>>   nouveau_svmm_fini(struct nouveau_svmm **psvmm)
>>   {
>>   	struct nouveau_svmm *svmm = *psvmm;
>> +	struct mmu_interval_notifier *mni;
>> +
>>   	if (svmm) {
>>   		mutex_lock(&svmm->mutex);
>> +		while (true) {
>> +			mni = mmu_interval_notifier_find(svmm->mm,
>> +					&nouveau_svm_mni_ops, 0UL, ~0UL);
>> +			if (!mni)
>> +				break;
>> +			mmu_interval_notifier_put(mni);
> 
> Oh, now I really don't like the name 'put'. It looks like mni is
> refcounted here, and it isn't. put should be called 'remove_deferred'

OK.

> And then you also need a way to barrier this scheme on driver unload.

Good point. I can add something like
void mmu_interval_notifier_synchronize(struct mm_struct *mm)
that waits for deferred operations to complete similar to
mmu_interval_read_begin().

>> +		}
>>   		svmm->vmm = NULL;
>>   		mutex_unlock(&svmm->mutex);
>> -		mmu_notifier_put(&svmm->notifier);
> 
> While here it was actually a refcount.
> 
>> +static void nouveau_svmm_do_unmap(struct mmu_interval_notifier *mni,
>> +				 const struct mmu_notifier_range *range)
>> +{
>> +	struct svmm_interval *smi =
>> +		container_of(mni, struct svmm_interval, notifier);
>> +	struct nouveau_svmm *svmm = smi->svmm;
>> +	unsigned long start = mmu_interval_notifier_start(mni);
>> +	unsigned long last = mmu_interval_notifier_last(mni);
> 
> This whole algorithm only works if it is protected by the read side of
> the interval tree lock. Deserves at least a comment if not an
> assertion too.

This is called from the invalidate() callback and while holding the
driver page table lock so the struct mmu_interval_notifier and
the interval tree can't change.
I will add comments for v7.

>>   static int nouveau_range_fault(struct nouveau_svmm *svmm,
>>   			       struct nouveau_drm *drm, void *data, u32 size,
>> -			       u64 *pfns, struct svm_notifier *notifier)
>> +			       u64 *pfns, u64 start, u64 end)
>>   {
>>   	unsigned long timeout =
>>   		jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
>>   	/* Have HMM fault pages within the fault window to the GPU. */
>>   	struct hmm_range range = {
>> -		.notifier = &notifier->notifier,
>> -		.start = notifier->notifier.interval_tree.start,
>> -		.end = notifier->notifier.interval_tree.last + 1,
>> +		.start = start,
>> +		.end = end,
>>   		.pfns = pfns,
>>   		.flags = nouveau_svm_pfn_flags,
>>   		.values = nouveau_svm_pfn_values,
>> +		.default_flags = 0,
>> +		.pfn_flags_mask = ~0UL,
>>   		.pfn_shift = NVIF_VMM_PFNMAP_V0_ADDR_SHIFT,
>>   	};
>> -	struct mm_struct *mm = notifier->notifier.mm;
>> +	struct mm_struct *mm = svmm->mm;
>>   	long ret;
>>   
>>   	while (true) {
>>   		if (time_after(jiffies, timeout))
>>   			return -EBUSY;
>>   
>> -		range.notifier_seq = mmu_interval_read_begin(range.notifier);
>> -		range.default_flags = 0;
>> -		range.pfn_flags_mask = -1UL;
>>   		down_read(&mm->mmap_sem);
> 
> mmap sem doesn't have to be held for the interval search, and again we
> have lifetime issues with the membership here.

I agree mmap_sem isn't needed for the interval search, it is needed if
the search doesn't find a registered interval and one needs to be created
to cover the underlying VMA. If an arbitrary size interval was created
instead, then mmap_sem wouldn't be needed.
I don't understand the lifetime/membership issue. The driver is the only thing
that allocates, inserts, or removes struct mmu_interval_notifier and thus
completely controls the lifetime.

>> +		ret = nouveau_svmm_interval_find(svmm, &range);
>> +		if (ret) {
>> +			up_read(&mm->mmap_sem);
>> +			return ret;
>> +		}
>> +		range.notifier_seq = mmu_interval_read_begin(range.notifier);
>>   		ret = hmm_range_fault(&range, 0);
>>   		up_read(&mm->mmap_sem);
>>   		if (ret <= 0) {
> 
> I'm still not sure this is a better approach than what ODP does. It
> looks very expensive on the fault path..
> 
> Jason
> 

ODP doesn't have this problem because users have to call ib_reg_mr()
before any I/O can happen to the process address space. That is when
mmu_interval_notifier_insert() / mmu_interval_notifier_remove() can
be called and the driver doesn't have to worry about the interval
changing sizes or being removed while I/O is happening.
For GPU like devices, I'm trying to allow hardware access to any user
level address without pre-registering it. That means inserting mmu
interval notifiers for the ranges the GPU page faults on and updating
the intervals as munmap() calls remove parts of the address space.
I don't want to register an interval per page so the logical range
is the underlying VMA.

It isn't that expensive, there is an extra driver lock/unlock as
part of the lookup and possibly a find_vma() and kmalloc(GFP_ATOMIC)
for new intervals. Also, the deferred interval updates for munmap().
Compared to the cost of updating PTEs in the device and GPU fault
handling, this is minimal overhead.

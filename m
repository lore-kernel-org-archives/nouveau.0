From: Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v6 4/6] mm/mmu_notifier: add mmu_interval_notifier_find()
Date: Wed, 15 Jan 2020 14:05:24 -0800
Message-ID: <528c1cff-608c-d342-1e72-90d780555204@nvidia.com>
References: <20200113224703.5917-1-rcampbell@nvidia.com>
 <20200113224703.5917-5-rcampbell@nvidia.com>
 <20200114124956.GN20978@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-rdma-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200114124956.GN20978-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Content-Language: en-US
Sender: linux-rdma-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Gunthorpe <jgg-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Cc: "linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org" <linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-kselftest-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kselftest-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jerome Glisse <jglisse-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, John Hubbard <jhubbard-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Shuah Khan <shuah-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: nouveau.vger.kernel.org


On 1/14/20 4:49 AM, Jason Gunthorpe wrote:
> On Mon, Jan 13, 2020 at 02:47:01PM -0800, Ralph Campbell wrote:
>> diff --git a/mm/mmu_notifier.c b/mm/mmu_notifier.c
>> index 47ad9cc89aab..4efecc0f13cb 100644
>> +++ b/mm/mmu_notifier.c
>> @@ -1171,6 +1171,39 @@ void mmu_interval_notifier_update(struct mmu_interval_notifier *mni,
>>   }
>>   EXPORT_SYMBOL_GPL(mmu_interval_notifier_update);
>>   
>> +struct mmu_interval_notifier *mmu_interval_notifier_find(struct mm_struct *mm,
>> +				const struct mmu_interval_notifier_ops *ops,
>> +				unsigned long start, unsigned long last)
>> +{
>> +	struct mmu_notifier_mm *mmn_mm = mm->mmu_notifier_mm;
>> +	struct interval_tree_node *node;
>> +	struct mmu_interval_notifier *mni;
>> +	struct mmu_interval_notifier *res = NULL;
>> +
>> +	spin_lock(&mmn_mm->lock);
>> +	node = interval_tree_iter_first(&mmn_mm->itree, start, last);
>> +	if (node) {
>> +		mni = container_of(node, struct mmu_interval_notifier,
>> +				   interval_tree);
>> +		while (true) {
>> +			if (mni->ops == ops) {
>> +				res = mni;
>> +				break;
>> +			}
>> +			node = interval_tree_iter_next(&mni->interval_tree,
>> +						       start, last);
>> +			if (!node)
>> +				break;
>> +			mni = container_of(node, struct mmu_interval_notifier,
>> +					   interval_tree);
>> +		}
>> +	}
>> +	spin_unlock(&mmn_mm->lock);
> 
> This doesn't seem safe at all, here we are returning a pointer to
> memory from the interval tree with out any kind of lifetime
> protection.

It is memory that the driver has allocated and has full control over
the lifetime since the driver does all the insertions and removals.
The driver does have to hold the HW page table lock so lookups are
synchronized with interval insertions and removals and page table
entry insertions and removals.

> If the interval tree is read it must be left in the read lock state
> until the caller is done with the pointer.
> 
> .. and this poses all sorts of questions about consistency with items
> on the deferred list. Should find return an item undergoing deletion?

I don't think so. The deferred operations are all complete when
mmu_interval_read_begin() returns, and the sequence number check
with mmu_interval_read_retry() guarantees there have been no changes
while not holding the driver page table lock and calling hmm_range_fault().

> Should find return items using the old interval tree values or their
> new updated values?
> 
> Jason

I think it should only look at the old interval tree and not the deferred
insert/remove/updates as explained above.

From: Ralph Campbell <rcampbell@nvidia.com>
Subject: Re: [PATCH 3/5] mm/notifier: add migration invalidation type
Date: Fri, 10 Jul 2020 13:17:50 -0700
Message-ID: <9364c81b-10a1-1fe4-b2c2-f48a73d2e04a@nvidia.com>
References: <20200706222347.32290-1-rcampbell@nvidia.com>
 <20200706222347.32290-4-rcampbell@nvidia.com>
 <20200710193939.GA2129070@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <kvm-ppc-owner@vger.kernel.org>
In-Reply-To: <20200710193939.GA2129070@nvidia.com>
Content-Language: en-US
Sender: kvm-ppc-owner@vger.kernel.org
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: linux-rdma@vger.kernel.org, linux-mm@kvack.org, nouveau@lists.freedesktop.org, kvm-ppc@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, Jerome Glisse <jglisse@redhat.com>, John Hubbard <jhubbard@nvidia.com>, Christoph Hellwig <hch@lst.de>, Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>, Ben Skeggs <bskeggs@redhat.com>, Bharata B Rao <bharata@linux.ibm.com>
List-Id: nouveau.vger.kernel.org


On 7/10/20 12:39 PM, Jason Gunthorpe wrote:
> On Mon, Jul 06, 2020 at 03:23:45PM -0700, Ralph Campbell wrote:
>> Currently migrate_vma_setup() calls mmu_notifier_invalidate_range_start()
>> which flushes all device private page mappings whether or not a page
>> is being migrated to/from device private memory. In order to not disrupt
>> device mappings that are not being migrated, shift the responsibility
>> for clearing device private mappings to the device driver and leave
>> CPU page table unmapping handled by migrate_vma_setup(). To support
>> this, the caller of migrate_vma_setup() should always set struct
>> migrate_vma::src_owner to a non NULL value that matches the device
>> private page->pgmap->owner. This value is then passed to the struct
>> mmu_notifier_range with a new event type which the driver's invalidation
>> function can use to avoid device MMU invalidations.
>>
>> Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
>>   include/linux/mmu_notifier.h | 7 +++++++
>>   mm/migrate.c                 | 8 +++++++-
>>   2 files changed, 14 insertions(+), 1 deletion(-)
>>
>> diff --git a/include/linux/mmu_notifier.h b/include/linux/mmu_notifier.h
>> index fc68f3570e19..bd0b34dbe4de 100644
>> +++ b/include/linux/mmu_notifier.h
>> @@ -38,6 +38,10 @@ struct mmu_interval_notifier;
>>    *
>>    * @MMU_NOTIFY_RELEASE: used during mmu_interval_notifier invalidate to signal
>>    * that the mm refcount is zero and the range is no longer accessible.
>> + *
>> + * @MMU_NOTIFY_MIGRATE: used during migrate_vma_collect() invalidate to signal
>> + * a device driver to possibly ignore the invalidation if the src_own
>> + * field matches.
>>    */
>>   enum mmu_notifier_event {
>>   	MMU_NOTIFY_UNMAP = 0,
>> @@ -46,6 +50,7 @@ enum mmu_notifier_event {
>>   	MMU_NOTIFY_PROTECTION_PAGE,
>>   	MMU_NOTIFY_SOFT_DIRTY,
>>   	MMU_NOTIFY_RELEASE,
>> +	MMU_NOTIFY_MIGRATE,
>>   };
>>   
>>   #define MMU_NOTIFIER_RANGE_BLOCKABLE (1 << 0)
>> @@ -264,6 +269,7 @@ struct mmu_notifier_range {
>>   	unsigned long end;
>>   	unsigned flags;
>>   	enum mmu_notifier_event event;
>> +	void *data;
>>   };
> 
> This generic member usually ends up a bit ugly, can we do a tagged
> union instead?
> 
> union
> {
>       void *migrate_pgmap_owner;
> };
> 
> and probably drop the union until we actually need two things here.
> 
> Jason

OK, I'll send a v2 with this change.

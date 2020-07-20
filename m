From: Ralph Campbell <rcampbell@nvidia.com>
Subject: Re: [PATCH v2 0/5] mm/migrate: avoid device private invalidations
Date: Mon, 20 Jul 2020 12:58:20 -0700
Message-ID: <dd6ffaeb-df26-99e1-f6c5-bbe3e4153f04@nvidia.com>
References: <20200713172149.2310-1-rcampbell@nvidia.com>
 <20200720184119.GT2021248@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <kvm-ppc-owner@vger.kernel.org>
In-Reply-To: <20200720184119.GT2021248@mellanox.com>
Content-Language: en-US
Sender: kvm-ppc-owner@vger.kernel.org
To: Jason Gunthorpe <jgg@mellanox.com>
Cc: linux-rdma@vger.kernel.org, linux-mm@kvack.org, nouveau@lists.freedesktop.org, kvm-ppc@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, Jerome Glisse <jglisse@redhat.com>, John Hubbard <jhubbard@nvidia.com>, Christoph Hellwig <hch@lst.de>, Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>, Ben Skeggs <bskeggs@redhat.com>, Bharata B Rao <bharata@linux.ibm.com>
List-Id: nouveau.vger.kernel.org


On 7/20/20 11:41 AM, Jason Gunthorpe wrote:
> On Mon, Jul 13, 2020 at 10:21:44AM -0700, Ralph Campbell wrote:
>> The goal for this series is to avoid device private memory TLB
>> invalidations when migrating a range of addresses from system
>> memory to device private memory and some of those pages have already
>> been migrated. The approach taken is to introduce a new mmu notifier
>> invalidation event type and use that in the device driver to skip
>> invalidation callbacks from migrate_vma_setup(). The device driver is
>> also then expected to handle device MMU invalidations as part of the
>> migrate_vma_setup(), migrate_vma_pages(), migrate_vma_finalize() process.
>> Note that this is opt-in. A device driver can simply invalidate its MMU
>> in the mmu notifier callback and not handle MMU invalidations in the
>> migration sequence.
>>
>> This series is based on Jason Gunthorpe's HMM tree (linux-5.8.0-rc4).
>>
>> Also, this replaces the need for the following two patches I sent:
>> ("mm: fix migrate_vma_setup() src_owner and normal pages")
>> https://lore.kernel.org/linux-mm/20200622222008.9971-1-rcampbell@nvidia.com
>> ("nouveau: fix mixed normal and device private page migration")
>> https://lore.kernel.org/lkml/20200622233854.10889-3-rcampbell@nvidia.com
>>
>> Changes in v2:
>> Rebase to Jason Gunthorpe's HMM tree.
>> Added reviewed-by from Bharata B Rao.
>> Rename the mmu_notifier_range::data field to migrate_pgmap_owner as
>>    suggested by Jason Gunthorpe.
> 
> I didn't see anything stand out in this at this point, did you intend
> this to go to the HMM tree?
> 
> Thanks,
> Jason

Yes, please.

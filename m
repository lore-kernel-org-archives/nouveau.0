From: Ralph Campbell <rcampbell@nvidia.com>
Subject: Re: [PATCH v4 3/6] mm/notifier: add migration invalidation type
Date: Tue, 28 Jul 2020 13:57:31 -0700
Message-ID: <08eb43d9-9650-f050-9cfb-d8ba5df6c5dd@nvidia.com>
References: <20200723223004.9586-1-rcampbell@nvidia.com>
 <20200723223004.9586-4-rcampbell@nvidia.com>
 <20200728191518.GA159104@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <kvm-ppc-owner@vger.kernel.org>
In-Reply-To: <20200728191518.GA159104@nvidia.com>
Content-Language: en-US
Sender: kvm-ppc-owner@vger.kernel.org
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: linux-rdma@vger.kernel.org, linux-mm@kvack.org, nouveau@lists.freedesktop.org, kvm-ppc@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, Jerome Glisse <jglisse@redhat.com>, John Hubbard <jhubbard@nvidia.com>, Christoph Hellwig <hch@lst.de>, Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>, Ben Skeggs <bskeggs@redhat.com>, Bharata B Rao <bharata@linux.ibm.com>
List-Id: nouveau.vger.kernel.org


On 7/28/20 12:15 PM, Jason Gunthorpe wrote:
> On Thu, Jul 23, 2020 at 03:30:01PM -0700, Ralph Campbell wrote:
>>   static inline int mm_has_notifiers(struct mm_struct *mm)
>> @@ -513,6 +519,7 @@ static inline void mmu_notifier_range_init(struct mmu_notifier_range *range,
>>   	range->start = start;
>>   	range->end = end;
>>   	range->flags = flags;
>> +	range->migrate_pgmap_owner = NULL;
>>   }
> 
> Since this function is commonly called and nobody should read
> migrate_pgmap_owner unless MMU_NOTIFY_MIGRATE is set as the event,
> this assignment can be dropped.
> 
> Jason

I agree.
Acked-by: Ralph Campbell <rcampbell@nvidia.com>

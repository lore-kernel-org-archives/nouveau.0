From: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v4 3/6] mm/notifier: add migration invalidation type
Date: Tue, 28 Jul 2020 16:15:18 -0300
Message-ID: <20200728191518.GA159104@nvidia.com>
References: <20200723223004.9586-1-rcampbell@nvidia.com>
 <20200723223004.9586-4-rcampbell@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200723223004.9586-4-rcampbell@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ralph Campbell <rcampbell@nvidia.com>
Cc: linux-rdma@vger.kernel.org, linux-mm@kvack.org, nouveau@lists.freedesktop.org, kvm-ppc@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, Jerome Glisse <jglisse@redhat.com>, John Hubbard <jhubbard@nvidia.com>, Christoph Hellwig <hch@lst.de>, Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>, Ben Skeggs <bskeggs@redhat.com>, Bharata B Rao <bharata@linux.ibm.com>
List-Id: nouveau.vger.kernel.org

On Thu, Jul 23, 2020 at 03:30:01PM -0700, Ralph Campbell wrote:
>  static inline int mm_has_notifiers(struct mm_struct *mm)
> @@ -513,6 +519,7 @@ static inline void mmu_notifier_range_init(struct mmu_notifier_range *range,
>  	range->start = start;
>  	range->end = end;
>  	range->flags = flags;
> +	range->migrate_pgmap_owner = NULL;
>  }

Since this function is commonly called and nobody should read
migrate_pgmap_owner unless MMU_NOTIFY_MIGRATE is set as the event,
this assignment can be dropped.

Jason

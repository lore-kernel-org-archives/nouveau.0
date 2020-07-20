From: Jason Gunthorpe <jgg@mellanox.com>
Subject: Re: [PATCH v2 3/5] mm/notifier: add migration invalidation type
Date: Mon, 20 Jul 2020 15:40:20 -0300
Message-ID: <20200720184020.GS2021248@mellanox.com>
References: <20200713172149.2310-1-rcampbell@nvidia.com>
 <20200713172149.2310-4-rcampbell@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <kvm-ppc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200713172149.2310-4-rcampbell@nvidia.com>
Sender: kvm-ppc-owner@vger.kernel.org
To: Ralph Campbell <rcampbell@nvidia.com>
Cc: linux-rdma@vger.kernel.org, linux-mm@kvack.org, nouveau@lists.freedesktop.org, kvm-ppc@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, Jerome Glisse <jglisse@redhat.com>, John Hubbard <jhubbard@nvidia.com>, Christoph Hellwig <hch@lst.de>, Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>, Ben Skeggs <bskeggs@redhat.com>, Bharata B Rao <bharata@linux.ibm.com>
List-Id: nouveau.vger.kernel.org

On Mon, Jul 13, 2020 at 10:21:47AM -0700, Ralph Campbell wrote:
> Currently migrate_vma_setup() calls mmu_notifier_invalidate_range_start()
> which flushes all device private page mappings whether or not a page
> is being migrated to/from device private memory. In order to not disrupt
> device mappings that are not being migrated, shift the responsibility
> for clearing device private mappings to the device driver and leave
> CPU page table unmapping handled by migrate_vma_setup(). To support
> this, the caller of migrate_vma_setup() should always set struct
> migrate_vma::src_owner to a non NULL value that matches the device
> private page->pgmap->owner. This value is then passed to the struct
> mmu_notifier_range with a new event type which the driver's invalidation
> function can use to avoid device MMU invalidations.
> 
> Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
>  include/linux/mmu_notifier.h | 7 +++++++
>  mm/migrate.c                 | 8 +++++++-
>  2 files changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/mmu_notifier.h b/include/linux/mmu_notifier.h
> index fc68f3570e19..1921fcf6be5b 100644
> +++ b/include/linux/mmu_notifier.h
> @@ -38,6 +38,10 @@ struct mmu_interval_notifier;
>   *
>   * @MMU_NOTIFY_RELEASE: used during mmu_interval_notifier invalidate to signal
>   * that the mm refcount is zero and the range is no longer accessible.
> + *
> + * @MMU_NOTIFY_MIGRATE: used during migrate_vma_collect() invalidate to signal
> + * a device driver to possibly ignore the invalidation if the
> + * migrate_pgmap_owner field matches the driver's device private pgmap owner.
>   */
>  enum mmu_notifier_event {
>  	MMU_NOTIFY_UNMAP = 0,
> @@ -46,6 +50,7 @@ enum mmu_notifier_event {
>  	MMU_NOTIFY_PROTECTION_PAGE,
>  	MMU_NOTIFY_SOFT_DIRTY,
>  	MMU_NOTIFY_RELEASE,
> +	MMU_NOTIFY_MIGRATE,
>  };
>  
>  #define MMU_NOTIFIER_RANGE_BLOCKABLE (1 << 0)
> @@ -264,6 +269,7 @@ struct mmu_notifier_range {
>  	unsigned long end;
>  	unsigned flags;
>  	enum mmu_notifier_event event;
> +	void *migrate_pgmap_owner;
>  };
>  
>  static inline int mm_has_notifiers(struct mm_struct *mm)
> @@ -513,6 +519,7 @@ static inline void mmu_notifier_range_init(struct mmu_notifier_range *range,
>  	range->start = start;
>  	range->end = end;
>  	range->flags = flags;
> +	range->migrate_pgmap_owner = NULL;
>  }
>  
>  #define ptep_clear_flush_young_notify(__vma, __address, __ptep)		\
> diff --git a/mm/migrate.c b/mm/migrate.c
> index 2bbc5c4c672e..9b3dcb81be5f 100644
> +++ b/mm/migrate.c
> @@ -2391,8 +2391,14 @@ static void migrate_vma_collect(struct migrate_vma *migrate)
>  {
>  	struct mmu_notifier_range range;
>  
> -	mmu_notifier_range_init(&range, MMU_NOTIFY_CLEAR, 0, NULL,
> +	/*
> +	 * Note that the src_owner is passed to the mmu notifier callback so
> +	 * that the registered device driver can skip invalidating device
> +	 * private page mappings that won't be migrated.
> +	 */
> +	mmu_notifier_range_init(&range, MMU_NOTIFY_MIGRATE, 0, migrate->vma,
>  			migrate->vma->vm_mm, migrate->start, migrate->end);

So the idea is that src_owner is always set to the pgmap owner when
working with DEVICE_PRIVATE?

But then the comment in the prior patch should be fixed:

@@ -199,11 +204,12 @@  struct migrate_vma {
 
 	/*
 	 * Set to the owner value also stored in page->pgmap->owner for
+	 * migrating device private memory. The direction also needs to
+	 * be set to MIGRATE_VMA_FROM_DEVICE_PRIVATE.

To say the caller must always provide src_owner.

And that field should probably be renamed at this point, as there is
nothing "src" about it. It is just the pgmap_owner of the
DEVICE_PRIVATE pages the TO/FROM DEVICE migration is working on.

Jason

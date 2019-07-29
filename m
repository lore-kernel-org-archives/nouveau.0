From: Jerome Glisse <jglisse@redhat.com>
Subject: Re: [PATCH 9/9] mm: remove the MIGRATE_PFN_WRITE flag
Date: Mon, 29 Jul 2019 19:30:44 -0400
Message-ID: <20190729233044.GA7171@redhat.com>
References: <20190729142843.22320-1-hch@lst.de>
 <20190729142843.22320-10-hch@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190729142843.22320-10-hch@lst.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Christoph Hellwig <hch@lst.de>
Cc: Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>, Bharata B Rao <bharata@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

On Mon, Jul 29, 2019 at 05:28:43PM +0300, Christoph Hellwig wrote:
> The MIGRATE_PFN_WRITE is only used locally in migrate_vma_collect_pmd,
> where it can be replaced with a simple boolean local variable.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

NAK that flag is useful, for instance a anonymous vma might have
some of its page read only even if the vma has write permission.

It seems that the code in nouveau is wrong (probably lost that
in various rebase/rework) as this flag should be use to decide
wether to map the device memory with write permission or not.

I am traveling right now, i will investigate what happened to
nouveau code.

Cheers,
Jérôme

> ---
>  include/linux/migrate.h | 1 -
>  mm/migrate.c            | 9 +++++----
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/include/linux/migrate.h b/include/linux/migrate.h
> index 8b46cfdb1a0e..ba74ef5a7702 100644
> --- a/include/linux/migrate.h
> +++ b/include/linux/migrate.h
> @@ -165,7 +165,6 @@ static inline int migrate_misplaced_transhuge_page(struct mm_struct *mm,
>  #define MIGRATE_PFN_VALID	(1UL << 0)
>  #define MIGRATE_PFN_MIGRATE	(1UL << 1)
>  #define MIGRATE_PFN_LOCKED	(1UL << 2)
> -#define MIGRATE_PFN_WRITE	(1UL << 3)
>  #define MIGRATE_PFN_SHIFT	6
>  
>  static inline struct page *migrate_pfn_to_page(unsigned long mpfn)
> diff --git a/mm/migrate.c b/mm/migrate.c
> index 74735256e260..724f92dcc31b 100644
> --- a/mm/migrate.c
> +++ b/mm/migrate.c
> @@ -2212,6 +2212,7 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>  		unsigned long mpfn, pfn;
>  		struct page *page;
>  		swp_entry_t entry;
> +		bool writable = false;
>  		pte_t pte;
>  
>  		pte = *ptep;
> @@ -2240,7 +2241,7 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>  			mpfn = migrate_pfn(page_to_pfn(page)) |
>  					MIGRATE_PFN_MIGRATE;
>  			if (is_write_device_private_entry(entry))
> -				mpfn |= MIGRATE_PFN_WRITE;
> +				writable = true;
>  		} else {
>  			if (is_zero_pfn(pfn)) {
>  				mpfn = MIGRATE_PFN_MIGRATE;
> @@ -2250,7 +2251,8 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>  			}
>  			page = vm_normal_page(migrate->vma, addr, pte);
>  			mpfn = migrate_pfn(pfn) | MIGRATE_PFN_MIGRATE;
> -			mpfn |= pte_write(pte) ? MIGRATE_PFN_WRITE : 0;
> +			if (pte_write(pte))
> +				writable = true;
>  		}
>  
>  		/* FIXME support THP */
> @@ -2284,8 +2286,7 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>  			ptep_get_and_clear(mm, addr, ptep);
>  
>  			/* Setup special migration page table entry */
> -			entry = make_migration_entry(page, mpfn &
> -						     MIGRATE_PFN_WRITE);
> +			entry = make_migration_entry(page, writable);
>  			swp_pte = swp_entry_to_pte(entry);
>  			if (pte_soft_dirty(pte))
>  				swp_pte = pte_swp_mksoft_dirty(swp_pte);
> -- 
> 2.20.1
> 

From: Yang Shi <shy828301@gmail.com>
Subject: Re: [PATCH v2 1/7] mm/thp: fix __split_huge_pmd_locked() for
 migration PMD
Date: Wed, 2 Sep 2020 13:29:56 -0700
Message-ID: <CAHbLzkqAHfVq4upkJBvWQ9XtXFfFx5=qUO4+i5XjFeNwS9XVHg@mail.gmail.com>
References: <20200902165830.5367-1-rcampbell@nvidia.com> <20200902165830.5367-2-rcampbell@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200902165830.5367-2-rcampbell@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ralph Campbell <rcampbell@nvidia.com>
Cc: Linux MM <linux-mm@kvack.org>, nouveau@lists.freedesktop.org, linux-kselftest@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jerome Glisse <jglisse@redhat.com>, John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, Christoph Hellwig <hch@lst.de>, Jason Gunthorpe <jgg@nvidia.com>, Bharata B Rao <bharata@linux.ibm.com>, Ben Skeggs <bskeggs@redhat.com>, Shuah Khan <shuah@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
List-Id: nouveau.vger.kernel.org

On Wed, Sep 2, 2020 at 9:58 AM Ralph Campbell <rcampbell@nvidia.com> wrote:
>
> A migrating transparent huge page has to already be unmapped. Otherwise,
> the page could be modified while it is being copied to a new page and
> data could be lost. The function __split_huge_pmd() checks for a PMD
> migration entry before calling __split_huge_pmd_locked() leading one to
> think that __split_huge_pmd_locked() can handle splitting a migrating PMD.
> However, the code always increments the page->_mapcount and adjusts the
> memory control group accounting assuming the page is mapped.
> Also, if the PMD entry is a migration PMD entry, the call to
> is_huge_zero_pmd(*pmd) is incorrect because it calls pmd_pfn(pmd) instead
> of migration_entry_to_pfn(pmd_to_swp_entry(pmd)).
> Fix these problems by checking for a PMD migration entry.

Thanks for catching this. The fix looks good to me. Reviewed-by: Yang
Shi <shy828301@gmail.com>

I think this fix can go separately with the series.
>
> Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
> ---
>  mm/huge_memory.c | 42 +++++++++++++++++++++++-------------------
>  1 file changed, 23 insertions(+), 19 deletions(-)
>
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index 2a468a4acb0a..606d712d9505 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -2023,7 +2023,7 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
>                 put_page(page);
>                 add_mm_counter(mm, mm_counter_file(page), -HPAGE_PMD_NR);
>                 return;
> -       } else if (is_huge_zero_pmd(*pmd)) {
> +       } else if (pmd_trans_huge(*pmd) && is_huge_zero_pmd(*pmd)) {
>                 /*
>                  * FIXME: Do we want to invalidate secondary mmu by calling
>                  * mmu_notifier_invalidate_range() see comments below inside
> @@ -2117,30 +2117,34 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
>                 pte = pte_offset_map(&_pmd, addr);
>                 BUG_ON(!pte_none(*pte));
>                 set_pte_at(mm, addr, pte, entry);
> -               atomic_inc(&page[i]._mapcount);
> -               pte_unmap(pte);
> -       }
> -
> -       /*
> -        * Set PG_double_map before dropping compound_mapcount to avoid
> -        * false-negative page_mapped().
> -        */
> -       if (compound_mapcount(page) > 1 && !TestSetPageDoubleMap(page)) {
> -               for (i = 0; i < HPAGE_PMD_NR; i++)
> +               if (!pmd_migration)
>                         atomic_inc(&page[i]._mapcount);
> +               pte_unmap(pte);
>         }
>
> -       lock_page_memcg(page);
> -       if (atomic_add_negative(-1, compound_mapcount_ptr(page))) {
> -               /* Last compound_mapcount is gone. */
> -               __dec_lruvec_page_state(page, NR_ANON_THPS);
> -               if (TestClearPageDoubleMap(page)) {
> -                       /* No need in mapcount reference anymore */
> +       if (!pmd_migration) {
> +               /*
> +                * Set PG_double_map before dropping compound_mapcount to avoid
> +                * false-negative page_mapped().
> +                */
> +               if (compound_mapcount(page) > 1 &&
> +                   !TestSetPageDoubleMap(page)) {
>                         for (i = 0; i < HPAGE_PMD_NR; i++)
> -                               atomic_dec(&page[i]._mapcount);
> +                               atomic_inc(&page[i]._mapcount);
> +               }
> +
> +               lock_page_memcg(page);
> +               if (atomic_add_negative(-1, compound_mapcount_ptr(page))) {
> +                       /* Last compound_mapcount is gone. */
> +                       __dec_lruvec_page_state(page, NR_ANON_THPS);
> +                       if (TestClearPageDoubleMap(page)) {
> +                               /* No need in mapcount reference anymore */
> +                               for (i = 0; i < HPAGE_PMD_NR; i++)
> +                                       atomic_dec(&page[i]._mapcount);
> +                       }
>                 }
> +               unlock_page_memcg(page);
>         }
> -       unlock_page_memcg(page);
>
>         smp_wmb(); /* make pte visible before pmd */
>         pmd_populate(mm, pmd, pgtable);
> --
> 2.20.1
>
>

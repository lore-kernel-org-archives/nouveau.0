From: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v3 4/6] mm/thp: add THP allocation helper
Date: Fri, 6 Nov 2020 09:01:47 +0100
Message-ID: <20201106080147.GD31341@lst.de>
References: <20201106005147.20113-1-rcampbell@nvidia.com> <20201106005147.20113-5-rcampbell@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20201106005147.20113-5-rcampbell@nvidia.com>
To: Ralph Campbell <rcampbell@nvidia.com>
Cc: linux-mm@kvack.org, nouveau@lists.freedesktop.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, Jerome Glisse <jglisse@redhat.com>, John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, Christoph Hellwig <hch@lst.de>, Jason Gunthorpe <jgg@nvidia.com>, Bharata B Rao <bharata@linux.ibm.com>, Zi Yan <ziy@nvidia.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, Yang Shi <yang.shi@linux.alibaba.com>, Ben Skeggs <bskeggs@redhat.com>, Shuah Khan <shuah@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
List-Id: nouveau.vger.kernel.org

> +#ifdef CONFIG_TRANSPARENT_HUGEPAGE
> +extern struct page *alloc_transhugepage(struct vm_area_struct *vma,
> +					unsigned long addr);

No need for the extern.  And also here: do we actually need the stub,
or can the caller make sure (using IS_ENABLED and similar) that the
compiler knows the code is dead?

> +struct page *alloc_transhugepage(struct vm_area_struct *vma,
> +				 unsigned long haddr)
> +{
> +	gfp_t gfp;
> +	struct page *page;
> +
> +	gfp = alloc_hugepage_direct_gfpmask(vma);
> +	page = alloc_hugepage_vma(gfp, vma, haddr, HPAGE_PMD_ORDER);
> +	if (page)
> +		prep_transhuge_page(page);
> +	return page;

I think do_huge_pmd_anonymous_page should be switched to use this
helper as well.

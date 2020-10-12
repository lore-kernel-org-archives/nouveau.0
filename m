From: Dan Williams <dan.j.williams@intel.com>
Subject: Re: [PATCH v2] mm/hmm: make device private reference counts zero based
Date: Mon, 12 Oct 2020 14:14:07 -0700
Message-ID: <CAPcyv4ijD+=3rje1CfSG4XKuRNfuAWOui93NQV09NmBte_gc0w@mail.gmail.com>
References: <20201012174540.17328-1-rcampbell@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <kvm-ppc-owner@vger.kernel.org>
In-Reply-To: <20201012174540.17328-1-rcampbell@nvidia.com>
To: Ralph Campbell <rcampbell@nvidia.com>
Cc: Linux MM <linux-mm@kvack.org>, kvm-ppc@vger.kernel.org, nouveau@lists.freedesktop.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ira Weiny <ira.weiny@intel.com>, Matthew Wilcox <willy@infradead.org>, Jerome Glisse <jglisse@redhat.com>, John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, Christoph Hellwig <hch@lst.de>, Jason Gunthorpe <jgg@nvidia.com>, Zi Yan <ziy@nvidia.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, Yang Shi <yang.shi@linux.alibaba.com>, Paul Mackerras <paulus@ozlabs.org>, Ben Skeggs <bskeggs@redhat.com>, Andrew Morton <akpm@linux-foundation.org>
List-Id: nouveau.vger.kernel.org

On Mon, Oct 12, 2020 at 10:46 AM Ralph Campbell <rcampbell@nvidia.com> wrote:
>
> ZONE_DEVICE struct pages have an extra reference count that complicates the
> code for put_page() and several places in the kernel that need to check the
> reference count to see that a page is not being used (gup, compaction,
> migration, etc.). Clean up the code so the reference count doesn't need to
> be treated specially for device private pages, leaving DAX as still being
> a special case.

Please no half-step to removing the special casing...

[..]
> +void free_zone_device_page(struct page *page)
> +{
> +       if (!is_device_private_page(page))
>                 return;

That seems too subtle to be acceptable to me. All ZONE_DEVICE pages
need to have the same relationship with respect to idle-ness and the
page reference count.

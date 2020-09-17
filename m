From: Dan Williams <dan.j.williams@intel.com>
Subject: Re: [PATCH] mm: remove extra ZONE_DEVICE struct page refcount
Date: Wed, 16 Sep 2020 17:32:43 -0700
Message-ID: <CAPcyv4h=fWucxiiwZ9ZVbax-QTcHMJGkzdYRKCkL+E6+AUqwEw@mail.gmail.com>
References: <20200914224509.17699-1-rcampbell@nvidia.com> <CAPcyv4gVJuWsOtejrKvWgByq=c1niwQOZ0HHYaSo4h6vc-Xw+Q@mail.gmail.com>
 <10b4b85c-f1e9-b6b5-74cd-6190ee0aca5d@nvidia.com> <20200915162956.GA21990@infradead.org>
 <6dff5231-26d5-1aec-0c05-6880cf747642@nvidia.com> <20200916053653.GA7321@lst.de>
 <d3f80030-2ac4-384c-fd7e-66affb229577@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <kvm-ppc-owner@vger.kernel.org>
In-Reply-To: <d3f80030-2ac4-384c-fd7e-66affb229577@nvidia.com>
To: Ralph Campbell <rcampbell@nvidia.com>
Cc: Christoph Hellwig <hch@lst.de>, Christoph Hellwig <hch@infradead.org>, Linux MM <linux-mm@kvack.org>, kvm-ppc@vger.kernel.org, nouveau@lists.freedesktop.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ira Weiny <ira.weiny@intel.com>, Matthew Wilcox <willy@infradead.org>, Jerome Glisse <jglisse@redhat.com>, John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>, Bharata B Rao <bharata@linux.ibm.com>, Zi Yan <ziy@nvidia.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, Yang Shi <yang.shi@linux.alibaba.com>, Paul Mackerras <paulus@ozlabs.org>, Ben Skeggs <bskeggs@redhat.com>, Andrew Morton <akpm@linux-foundation.org>
List-Id: nouveau.vger.kernel.org

On Wed, Sep 16, 2020 at 5:29 PM Ralph Campbell <rcampbell@nvidia.com> wrote:
>
>
> On 9/15/20 10:36 PM, Christoph Hellwig wrote:
> > On Tue, Sep 15, 2020 at 09:39:47AM -0700, Ralph Campbell wrote:
> >>> I don't think any of the three ->page_free instances even cares about
> >>> the page refcount.
> >>>
> >> Not true. The page_free() callback records the page is free by setting
> >> a bit or putting the page on a free list but when it allocates a free
> >> device private struct page to be used with migrate_vma_setup(), it needs to
> >> increment the refcount.
> >>
> >> For the ZONE_DEVICE MEMORY_DEVICE_GENERIC and MEMORY_DEVICE_PCI_P2PDMA
> >> struct pages, I think you are correct because they don't define page_free()
> >> and from what I can see, don't decrement the page refcount to zero.
> >
> > Umm, the whole point of ZONE_DEVICE is to have a struct page for
> > something that is not system memory.  For both the ppc kvm case (magic
> > hypervisor pool) and Noveau (device internal) memory that clear is the
> > case.  But looks like test_hmm uses normal pages to fake this up, so
> > I was wrong about the third caller.  But I think we can just call
> > set_page_count just before freeing the page there with a comment
> > explaining what is goin on.
>
> Dan Williams thought that having the ZONE_DEVICE struct pages
> be on a free list with a refcount of one was a bit strange and
> that the driver should handle the zero to one transition.
> But, that would mean a bit more invasive change to the 3 drivers
> to set the reference count to zero after calling memremap_pages()
> and setting the reference count to one when allocating a struct
> page. What you are suggesting is what I also proposed in v1.

IIUC, isn't what Christoph recommending is that drivers handle
set_page_count() directly rather than the core since some are prepared
for it to be zero on entry?

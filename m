From: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH] mm: remove extra ZONE_DEVICE struct page refcount
Date: Tue, 15 Sep 2020 17:29:56 +0100
Message-ID: <20200915162956.GA21990@infradead.org>
References: <20200914224509.17699-1-rcampbell@nvidia.com>
 <CAPcyv4gVJuWsOtejrKvWgByq=c1niwQOZ0HHYaSo4h6vc-Xw+Q@mail.gmail.com>
 <10b4b85c-f1e9-b6b5-74cd-6190ee0aca5d@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <10b4b85c-f1e9-b6b5-74cd-6190ee0aca5d@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ralph Campbell <rcampbell@nvidia.com>
Cc: Dan Williams <dan.j.williams@intel.com>, Linux MM <linux-mm@kvack.org>, kvm-ppc@vger.kernel.org, nouveau@lists.freedesktop.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ira Weiny <ira.weiny@intel.com>, Matthew Wilcox <willy@infradead.org>, Jerome Glisse <jglisse@redhat.com>, John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, Christoph Hellwig <hch@lst.de>, Jason Gunthorpe <jgg@nvidia.com>, Bharata B Rao <bharata@linux.ibm.com>, Zi Yan <ziy@nvidia.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, Yang Shi <yang.shi@linux.alibaba.com>, Paul Mackerras <paulus@ozlabs.org>, Ben Skeggs <bskeggs@redhat.com>, Andrew Morton <akpm@linux-foundation.org>
List-Id: nouveau.vger.kernel.org

On Mon, Sep 14, 2020 at 04:53:25PM -0700, Ralph Campbell wrote:
> Since set_page_refcounted() is defined in mm_interal.h I would have to
> move the definition to someplace like page_ref.h or have the drivers
> cal init_page_count() or set_page_count() since get_page() calls
> VM_BUG_ON_PAGE() if refcount == 0.
> I'll move set_page_refcounted() since that is what the page allocator
> uses and seems named for the purpose.

I don't think any of the three ->page_free instances even cares about
the page refcount.

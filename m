From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v3 3/6] mm: support THP migration to device private memory
Date: Sat, 5 Dec 2020 09:22:59 +0100
Message-ID: <20201205082259.l7fdwfxdvi5xn3kz@Air-de-Roger>
References: <20201106005147.20113-1-rcampbell@nvidia.com>
 <20201106005147.20113-4-rcampbell@nvidia.com> <20201106080322.GE31341@lst.de>
 <a7b8b90c-09b7-2009-0784-908b61f61ef2@nvidia.com>
 <20201109091415.GC28918@lst.de>
 <bbf1f0df-85f3-5887-050e-beb2aad750f2@nvidia.com>
 <20201120200133.GH917484@nvidia.com> <20201202100854.GB7597@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20201202100854.GB7597@lst.de>
To: Christoph Hellwig <hch@lst.de>
Cc: Jason Gunthorpe <jgg@nvidia.com>, Ralph Campbell <rcampbell@nvidia.com>, linux-mm@kvack.org, nouveau@lists.freedesktop.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, Jerome Glisse <jglisse@redhat.com>, John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, Bharata B Rao <bharata@linux.ibm.com>, Zi Yan <ziy@nvidia.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, Yang Shi <yang.shi@linux.alibaba.com>, Ben Skeggs <bskeggs@redhat.com>, Shuah Khan <shuah@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
List-Id: nouveau.vger.kernel.org

On Wed, Dec 02, 2020 at 11:08:54AM +0100, Christoph Hellwig wrote:
> On Fri, Nov 20, 2020 at 04:01:33PM -0400, Jason Gunthorpe wrote:
> > On Wed, Nov 11, 2020 at 03:38:42PM -0800, Ralph Campbell wrote:
> > 
> > > MEMORY_DEVICE_GENERIC:
> > > Struct pages are created in dev_dax_probe() and represent non-volatile memory.
> > > The device can be mmap()'ed which calls dax_mmap() which sets
> > > vma->vm_flags | VM_HUGEPAGE.
> > > A CPU page fault will result in a PTE, PMD, or PUD sized page
> > > (but not compound) to be inserted by vmf_insert_mixed() which will call either
> > > insert_pfn() or insert_page().
> > > Neither insert_pfn() nor insert_page() increments the page reference
> > > count.
> > 
> > But why was this done? It seems very strange to put a pfn with a
> > struct page into a VMA and then deliberately not take the refcount for
> > the duration of that pfn being in the VMA?
> > 
> > What prevents memunmap_pages() from progressing while VMAs still point
> > at the memory?
> 
> Agreed.  Adding Roger who added MEMORY_DEVICE_GENERIC and the only
> user.

MEMORY_DEVICE_GENERIC is just a rename of the previous
MEMORY_DEVICE_DEVDAX, and seems to be used by the DAX device apart
from Xen?

It's main purpose is to be able to allocate unused physical memory
ranges and have a baking struct page for them, so they can be used to
map foreign memory when running on Xen.

I'm currently on leave and won't be back until the end of the month,
could you please Cc the Xen maintainers if you modify the logic here
in order to make sure it will work for Xen?

Thanks, Roger.

From: Ralph Campbell <rcampbell@nvidia.com>
Subject: Re: [PATCH] mm: remove extra ZONE_DEVICE struct page refcount
Date: Tue, 15 Sep 2020 09:39:47 -0700
Message-ID: <6dff5231-26d5-1aec-0c05-6880cf747642@nvidia.com>
References: <20200914224509.17699-1-rcampbell@nvidia.com>
 <CAPcyv4gVJuWsOtejrKvWgByq=c1niwQOZ0HHYaSo4h6vc-Xw+Q@mail.gmail.com>
 <10b4b85c-f1e9-b6b5-74cd-6190ee0aca5d@nvidia.com>
 <20200915162956.GA21990@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200915162956.GA21990@infradead.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Christoph Hellwig <hch@infradead.org>
Cc: Dan Williams <dan.j.williams@intel.com>, Linux MM <linux-mm@kvack.org>, kvm-ppc@vger.kernel.org, nouveau@lists.freedesktop.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ira Weiny <ira.weiny@intel.com>, Matthew Wilcox <willy@infradead.org>, Jerome Glisse <jglisse@redhat.com>, John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, Christoph Hellwig <hch@lst.de>, Jason Gunthorpe <jgg@nvidia.com>, Bharata B Rao <bharata@linux.ibm.com>, Zi Yan <ziy@nvidia.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, Yang Shi <yang.shi@linux.alibaba.com>, Paul Mackerras <paulus@ozlabs.org>, Ben Skeggs <bskeggs@redhat.com>, Andrew Morton <akpm@linux-foundation.org>
List-Id: nouveau.vger.kernel.org


On 9/15/20 9:29 AM, Christoph Hellwig wrote:
> On Mon, Sep 14, 2020 at 04:53:25PM -0700, Ralph Campbell wrote:
>> Since set_page_refcounted() is defined in mm_interal.h I would have to
>> move the definition to someplace like page_ref.h or have the drivers
>> cal init_page_count() or set_page_count() since get_page() calls
>> VM_BUG_ON_PAGE() if refcount == 0.
>> I'll move set_page_refcounted() since that is what the page allocator
>> uses and seems named for the purpose.
> 
> I don't think any of the three ->page_free instances even cares about
> the page refcount.
> 
Not true. The page_free() callback records the page is free by setting
a bit or putting the page on a free list but when it allocates a free
device private struct page to be used with migrate_vma_setup(), it needs to
increment the refcount.

For the ZONE_DEVICE MEMORY_DEVICE_GENERIC and MEMORY_DEVICE_PCI_P2PDMA
struct pages, I think you are correct because they don't define page_free()
and from what I can see, don't decrement the page refcount to zero.

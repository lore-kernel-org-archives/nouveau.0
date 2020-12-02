From: Logan Gunthorpe <logang@deltatee.com>
Subject: Re: [PATCH v3 3/6] mm: support THP migration to device private memory
Date: Wed, 2 Dec 2020 11:01:06 -0700
Message-ID: <7229bb21-7bf7-4989-e7cf-210834190693@deltatee.com>
References: <20201106005147.20113-1-rcampbell@nvidia.com>
 <20201106005147.20113-4-rcampbell@nvidia.com> <20201106080322.GE31341@lst.de>
 <a7b8b90c-09b7-2009-0784-908b61f61ef2@nvidia.com>
 <20201109091415.GC28918@lst.de>
 <bbf1f0df-85f3-5887-050e-beb2aad750f2@nvidia.com>
 <20201202101426.GC7597@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20201202101426.GC7597@lst.de>
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, Ralph Campbell <rcampbell@nvidia.com>
Cc: linux-mm@kvack.org, nouveau@lists.freedesktop.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, Jerome Glisse <jglisse@redhat.com>, John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>, Bharata B Rao <bharata@linux.ibm.com>, Zi Yan <ziy@nvidia.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, Yang Shi <yang.shi@linux.alibaba.com>, Ben Skeggs <bskeggs@redhat.com>, Shuah Khan <shuah@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Dan Williams <dan.j.williams@intel.com>, linux-nvdimm@lists.01.org, linux-fsdevel@vger.kernel.org
List-Id: nouveau.vger.kernel.org



On 2020-12-02 3:14 a.m., Christoph Hellwig wrote:>>
MEMORY_DEVICE_PCI_P2PDMA:
>> Struct pages are created in pci_p2pdma_add_resource() and represent device
>> memory accessible by PCIe bar address space. Memory is allocated with
>> pci_alloc_p2pmem() based on a byte length but the gen_pool_alloc_owner()
>> call will allocate memory in a minimum of PAGE_SIZE units.
>> Reference counting is +1 per *allocation* on the pgmap->ref reference count.
>> Note that this is not +1 per page which is what put_page() expects. So
>> currently, a get_page()/put_page() works OK because the page reference count
>> only goes 1->2 and 2->1. If it went to zero, the pgmap->ref reference count
>> would be incorrect if the allocation size was greater than one page.
>>
>> I see pci_alloc_p2pmem() is called by nvme_alloc_sq_cmds() and
>> pci_p2pmem_alloc_sgl() to create a command queue and a struct scatterlist *.
>> Looks like sg_page(sg) returns the ZONE_DEVICE struct page of the scatterlist.
>> There are a huge number of places sg_page() is called so it is hard to tell
>> whether or not get_page()/put_page() is ever called on MEMORY_DEVICE_PCI_P2PDMA
>> pages.
> 
> Nothing should call get_page/put_page on them, as they are not treated
> as refcountable memory.  More importantly nothing is allowed to keep
> a reference longer than the time of the I/O.

Yes, right now this is safe, as Christoph notes there are no places
where these should be got/put.

But eventually we'll need to change how pci_alloc_p2pmem() works to take
references on the actual pages and allow freeing individual pages,
similar to what you suggest. This is one of the issues Jason pointed out
in my last RFC to try to pass these pages through GUP.

Logan

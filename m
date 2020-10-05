From: Ralph Campbell <rcampbell@nvidia.com>
Subject: Re: [RFC PATCH v3 2/2] mm: remove extra ZONE_DEVICE struct page
 refcount
Date: Mon, 5 Oct 2020 09:40:02 -0700
Message-ID: <1fbc3d0c-327a-6a8c-31c9-bb4c43e97b88@nvidia.com>
References: <20201001181715.17416-1-rcampbell@nvidia.com>
 <20201001181715.17416-3-rcampbell@nvidia.com> <20201002055930.GB8891@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <kvm-ppc-owner@vger.kernel.org>
In-Reply-To: <20201002055930.GB8891@lst.de>
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>
Cc: linux-mm@kvack.org, kvm-ppc@vger.kernel.org, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>, Ira Weiny <ira.weiny@intel.com>, Matthew Wilcox <willy@infradead.org>, Jerome Glisse <jglisse@redhat.com>, John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>, Bharata B Rao <bharata@linux.ibm.com>, Zi Yan <ziy@nvidia.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, Yang Shi <yang.shi@linux.alibaba.com>, Paul Mackerras <paulus@ozlabs.org>, Ben Skeggs <bskeggs@redhat.com>, Andrew Morton <akpm@linux-foundation.org>
List-Id: nouveau.vger.kernel.org


On 10/1/20 10:59 PM, Christoph Hellwig wrote:
> On Thu, Oct 01, 2020 at 11:17:15AM -0700, Ralph Campbell wrote:
>> ZONE_DEVICE struct pages have an extra reference count that complicates the
>> code for put_page() and several places in the kernel that need to check the
>> reference count to see that a page is not being used (gup, compaction,
>> migration, etc.). Clean up the code so the reference count doesn't need to
>> be treated specially for ZONE_DEVICE.
>>
>> Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
> 
> Looks good,
> 
> Reviewed-by: Christoph Hellwig <hch@lst.de>

Thanks for the review.

I still have reservations about making this an official patch.
Did you see the updated cover letter?
Basically, I'm concerned about ZONE_DEVICE struct pages being inserted into
the process page table with a zero reference count with vmf_insert_mixed().
If it is to be a non-zero reference count, then DAX, pmem, and other uses
of ZONE_DEVICE pages need to be changed (or vmf_insert_mixed()) to
inc/dec in appropriate places but I don't feel I know that code well enough
to make those changes.

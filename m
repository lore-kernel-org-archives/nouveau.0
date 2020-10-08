From: Ralph Campbell <rcampbell@nvidia.com>
Subject: Re: [RFC PATCH v3 2/2] mm: remove extra ZONE_DEVICE struct page
 refcount
Date: Thu, 8 Oct 2020 09:45:55 -0700
Message-ID: <751582db-9f03-dfbf-1466-131e051def37@nvidia.com>
References: <20201001181715.17416-1-rcampbell@nvidia.com>
 <20201001181715.17416-3-rcampbell@nvidia.com>
 <20201008051702.GA4773@ram-ibm-com.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <kvm-ppc-owner@vger.kernel.org>
In-Reply-To: <20201008051702.GA4773@ram-ibm-com.ibm.com>
Content-Language: en-US
To: Ram Pai <linuxram@us.ibm.com>
Cc: linux-mm@kvack.org, kvm-ppc@vger.kernel.org, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>, Ira Weiny <ira.weiny@intel.com>, Matthew Wilcox <willy@infradead.org>, Jerome Glisse <jglisse@redhat.com>, John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, Christoph Hellwig <hch@lst.de>, Jason Gunthorpe <jgg@nvidia.com>, Bharata B Rao <bharata@linux.ibm.com>, Zi Yan <ziy@nvidia.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, Yang Shi <yang.shi@linux.alibaba.com>, Paul Mackerras <paulus@ozlabs.org>, Ben Skeggs <bskeggs@redhat.com>, Andrew Morton <akpm@linux-foundation.org>
List-Id: nouveau.vger.kernel.org


On 10/7/20 10:17 PM, Ram Pai wrote:
> On Thu, Oct 01, 2020 at 11:17:15AM -0700, Ralph Campbell wrote:
>> ZONE_DEVICE struct pages have an extra reference count that complicates the
>> code for put_page() and several places in the kernel that need to check the
>> reference count to see that a page is not being used (gup, compaction,
>> migration, etc.). Clean up the code so the reference count doesn't need to
>> be treated specially for ZONE_DEVICE.
> 
> 
> I was hoping this patch would resolve a page-reference issue that we run
> into at random times while migrating a page to a device page backed by
> secure-memory.
> 
> Unfortunately I continue to see the problem. There is a reference
> held on that page, which fails the migration.
> 
> FYI
> RP

I'm willing to look into it but I would need more information.
Can you give any more details about the conditions when it happens?
It would be great if you have a program that reproduces the problem.

From: Ralph Campbell <rcampbell@nvidia.com>
Subject: Re: [PATCH v3 1/6] mm/thp: add prep_transhuge_device_private_page()
Date: Fri, 6 Nov 2020 12:56:47 -0800
Message-ID: <e2d3b996-e1a9-ccc1-8b7a-31df840b8ebb@nvidia.com>
References: <20201106005147.20113-1-rcampbell@nvidia.com>
 <20201106005147.20113-2-rcampbell@nvidia.com> <20201106075554.GA31341@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20201106075554.GA31341@lst.de>
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>
Cc: linux-mm@kvack.org, nouveau@lists.freedesktop.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, Jerome Glisse <jglisse@redhat.com>, John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>, Bharata B Rao <bharata@linux.ibm.com>, Zi Yan <ziy@nvidia.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, Yang Shi <yang.shi@linux.alibaba.com>, Ben Skeggs <bskeggs@redhat.com>, Shuah Khan <shuah@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
List-Id: nouveau.vger.kernel.org


On 11/5/20 11:55 PM, Christoph Hellwig wrote:
> On Thu, Nov 05, 2020 at 04:51:42PM -0800, Ralph Campbell wrote:
>> +extern void prep_transhuge_device_private_page(struct page *page);
> 
> No need for the extern.

Right, I was just copying the style.
Would you like to see a preparatory patch that removes extern for the other
declarations in huge_mm.h?

>> +static inline void prep_transhuge_device_private_page(struct page *page)
>> +{
>> +}
> 
> Is the code to call this even reachable if THP support is configured
> out?  If not just declaring it unconditionally and letting dead code
> elimination do its job might be a tad cleaner.

The HMM test driver depends on TRANSPARENT_HUGEPAGE but the nouveau SVM
option doesn't and SVM is still useful if TRANSPARENT_HUGEPAGE is not configured.

The problem with defining prep_transhuge_device_private_page() in huge_mm.h
as a static inline function is that prep_compound_page() and prep_transhuge_page()
would have to be EXPORT_SYMBOL_GPL which are currently mm internal only.
The intent is to make this helper callable by separate device driver modules
using struct pages created with memremap_pages().

>> +void prep_transhuge_device_private_page(struct page *page)
> 
> I think a kerneldoc comment explaining what this function is useful for
> would be helpful.

That is a good idea. I'll add it to v4.

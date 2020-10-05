From: Ralph Campbell <rcampbell@nvidia.com>
Subject: Re: [RFC PATCH v3 1/2] ext4/xfs: add page refcount helper
Date: Mon, 5 Oct 2020 09:29:04 -0700
Message-ID: <2789432c-e3b2-e3f4-1904-c96f03ea9c2a@nvidia.com>
References: <20201001181715.17416-1-rcampbell@nvidia.com>
 <20201001181715.17416-2-rcampbell@nvidia.com> <20201002055627.GA8891@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <kvm-ppc-owner@vger.kernel.org>
In-Reply-To: <20201002055627.GA8891@lst.de>
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>
Cc: linux-mm@kvack.org, kvm-ppc@vger.kernel.org, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>, Ira Weiny <ira.weiny@intel.com>, Matthew Wilcox <willy@infradead.org>, Jerome Glisse <jglisse@redhat.com>, John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>, Bharata B Rao <bharata@linux.ibm.com>, Zi Yan <ziy@nvidia.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, Yang Shi <yang.shi@linux.alibaba.com>, Paul Mackerras <paulus@ozlabs.org>, Ben Skeggs <bskeggs@redhat.com>, Andrew Morton <akpm@linux-foundation.org>
List-Id: nouveau.vger.kernel.org



On 10/1/20 10:56 PM, Christoph Hellwig wrote:
> On Thu, Oct 01, 2020 at 11:17:14AM -0700, Ralph Campbell wrote:
>> There are several places where ZONE_DEVICE struct pages assume a reference
>> count == 1 means the page is idle and free. Instead of open coding this,
>> add a helper function to hide this detail.
>>
>> Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
> 
> Looks good:
> 
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> 

Thanks for the review.
I'll resend this as an independent patch.

From: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 3/4] mm: simplify device private page handling in
 hmm_range_fault
Date: Tue, 17 Mar 2020 08:34:54 +0100
Message-ID: <20200317073454.GA5843@lst.de>
References: <20200316193216.920734-1-hch@lst.de> <20200316193216.920734-4-hch@lst.de> <7256f88d-809e-4aba-3c46-a223bd8cc521@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <kvm-ppc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <7256f88d-809e-4aba-3c46-a223bd8cc521@nvidia.com>
Sender: kvm-ppc-owner@vger.kernel.org
To: Ralph Campbell <rcampbell@nvidia.com>
Cc: Christoph Hellwig <hch@lst.de>, Jason Gunthorpe <jgg@ziepe.ca>, Dan Williams <dan.j.williams@intel.com>, Bharata B Rao <bharata@linux.ibm.com>, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Ben Skeggs <bskeggs@redhat.com>, Jerome Glisse <jglisse@redhat.com>, kvm-ppc@vger.kernel.org, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-mm@kvack.org
List-Id: nouveau.vger.kernel.org

On Mon, Mar 16, 2020 at 03:49:51PM -0700, Ralph Campbell wrote:
> On 3/16/20 12:32 PM, Christoph Hellwig wrote:
>> Remove the code to fault device private pages back into system memory
>> that has never been used by any driver.  Also replace the usage of the
>> HMM_PFN_DEVICE_PRIVATE flag in the pfns array with a simple
>> is_device_private_page check in nouveau.
>>
>> Signed-off-by: Christoph Hellwig <hch@lst.de>
>
> Getting rid of HMM_PFN_DEVICE_PRIVATE seems reasonable to me since a driver can
> look at the struct page but what if a driver needs to fault in a page from
> another device's private memory? Should it call handle_mm_fault()?

Obviously no driver cared for that so far.  Once we have test cases
for that and thus testable code we can add code to fault it in from
hmm_vma_handle_pte.

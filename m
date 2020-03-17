From: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH 3/4] mm: simplify device private page handling in
 hmm_range_fault
Date: Tue, 17 Mar 2020 09:15:36 -0300
Message-ID: <20200317121536.GQ20941@ziepe.ca>
References: <20200316193216.920734-1-hch@lst.de>
 <20200316193216.920734-4-hch@lst.de>
 <7256f88d-809e-4aba-3c46-a223bd8cc521@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <kvm-ppc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <7256f88d-809e-4aba-3c46-a223bd8cc521@nvidia.com>
Sender: kvm-ppc-owner@vger.kernel.org
To: Ralph Campbell <rcampbell@nvidia.com>
Cc: Christoph Hellwig <hch@lst.de>, Dan Williams <dan.j.williams@intel.com>, Bharata B Rao <bharata@linux.ibm.com>, Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, Ben Skeggs <bskeggs@redhat.com>, Jerome Glisse <jglisse@redhat.com>, kvm-ppc@vger.kernel.org, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-mm@kvack.org
List-Id: nouveau.vger.kernel.org

On Mon, Mar 16, 2020 at 03:49:51PM -0700, Ralph Campbell wrote:
> 
> On 3/16/20 12:32 PM, Christoph Hellwig wrote:
> > Remove the code to fault device private pages back into system memory
> > that has never been used by any driver.  Also replace the usage of the
> > HMM_PFN_DEVICE_PRIVATE flag in the pfns array with a simple
> > is_device_private_page check in nouveau.
> > 
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> 
> Getting rid of HMM_PFN_DEVICE_PRIVATE seems reasonable to me since a driver can
> look at the struct page but what if a driver needs to fault in a page from
> another device's private memory? Should it call handle_mm_fault()?

Isn't that what this series basically does?

The dev_private_owner is set to the type of pgmap the device knows how
to handle, and everything else is automatically faulted for the
device.

If the device does not know how to handle device_private then it sets
dev_private_owner to NULL and it never gets device_private pfns.

Since the device_private pfn cannot be dma mapped, drivers must have
explicit support for them.

Jason

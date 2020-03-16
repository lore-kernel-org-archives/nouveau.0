From: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 2/2] mm: remove device private page support from
 hmm_range_fault
Date: Mon, 16 Mar 2020 19:58:22 +0100
Message-ID: <20200316185822.GA25473@lst.de>
References: <20200316175259.908713-1-hch@lst.de> <20200316175259.908713-3-hch@lst.de> <c099cc3c-c19f-9d61-4297-2e83df899ca4@nvidia.com> <20200316184935.GA25322@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <kvm-ppc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200316184935.GA25322@lst.de>
Sender: kvm-ppc-owner@vger.kernel.org
To: Ralph Campbell <rcampbell@nvidia.com>
Cc: Christoph Hellwig <hch@lst.de>, Jason Gunthorpe <jgg@ziepe.ca>, Dan Williams <dan.j.williams@intel.com>, Bharata B Rao <bharata@linux.ibm.com>, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Ben Skeggs <bskeggs@redhat.com>, Jerome Glisse <jglisse@redhat.com>, kvm-ppc@vger.kernel.org, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-mm@kvack.org
List-Id: nouveau.vger.kernel.org

On Mon, Mar 16, 2020 at 07:49:35PM +0100, Christoph Hellwig wrote:
> On Mon, Mar 16, 2020 at 11:42:19AM -0700, Ralph Campbell wrote:
> >
> > On 3/16/20 10:52 AM, Christoph Hellwig wrote:
> >> No driver has actually used properly wire up and support this feature.
> >> There is various code related to it in nouveau, but as far as I can tell
> >> it never actually got turned on, and the only changes since the initial
> >> commit are global cleanups.
> >
> > This is not actually true. OpenCL 2.x does support SVM with nouveau and
> > device private memory via clEnqueueSVMMigrateMem().
> > Also, Ben Skeggs has accepted a set of patches to map GPU memory after being
> > migrated and this change would conflict with that.
> 
> Can you explain me how we actually invoke this code?
> 
> For that we'd need HMM_PFN_DEVICE_PRIVATE NVIF_VMM_PFNMAP_V0_VRAM
> set in ->pfns before calling hmm_range_fault, which isn't happening.

Ok, looks like the fault side is unused, but we need to keep the
non-fault path in place.  I'll fix up the patch.

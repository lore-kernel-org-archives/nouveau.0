From: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [RESEND PATCH 2/3] nouveau: fix mixed normal and device private
 page migration
Date: Thu, 25 Jun 2020 14:31:44 -0300
Message-ID: <20200625173144.GT6578@ziepe.ca>
References: <20200622233854.10889-1-rcampbell@nvidia.com>
 <20200622233854.10889-3-rcampbell@nvidia.com>
 <20200624072355.GB18609@lst.de>
 <330f6a82-d01d-db97-1dec-69346f41e707@nvidia.com>
 <a9aba057-3786-8204-f782-6e8f3c290b35@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <a9aba057-3786-8204-f782-6e8f3c290b35@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ralph Campbell <rcampbell@nvidia.com>
Cc: Christoph Hellwig <hch@lst.de>, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, Jerome Glisse <jglisse@redhat.com>, John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, Bharata B Rao <bharata@linux.ibm.com>
List-Id: nouveau.vger.kernel.org

On Thu, Jun 25, 2020 at 10:25:38AM -0700, Ralph Campbell wrote:
> Making sure to include linux-mm and Bharata B Rao for IBM's
> use of migrate_vma*().
> 
> On 6/24/20 11:10 AM, Ralph Campbell wrote:
> > 
> > On 6/24/20 12:23 AM, Christoph Hellwig wrote:
> > > On Mon, Jun 22, 2020 at 04:38:53PM -0700, Ralph Campbell wrote:
> > > > The OpenCL function clEnqueueSVMMigrateMem(), without any flags, will
> > > > migrate memory in the given address range to device private memory. The
> > > > source pages might already have been migrated to device private memory.
> > > > In that case, the source struct page is not checked to see if it is
> > > > a device private page and incorrectly computes the GPU's physical
> > > > address of local memory leading to data corruption.
> > > > Fix this by checking the source struct page and computing the correct
> > > > physical address.
> > > 
> > > I'm really worried about all this delicate code to fix the mixed
> > > ranges.  Can't we make it clear at the migrate_vma_* level if we want
> > > to migrate from or two device private memory, and then skip all the work
> > > for regions of memory that already are in the right place?  This might be
> > > a little more work initially, but I think it leads to a much better
> > > API.
> > > 
> > 
> > The current code does encode the direction with src_owner != NULL meaning
> > device private to system memory and src_owner == NULL meaning system
> > memory to device private memory. This patch would obviously defeat that
> > so perhaps a flag could be added to the struct migrate_vma to indicate the
> > direction but I'm unclear how that makes things less delicate.
> > Can you expand on what you are worried about?
> > 
> > The issue with invalidations might be better addressed by letting the device
> > driver handle device private page TLB invalidations when migrating to
> > system memory and changing migrate_vma_setup() to only invalidate CPU
> > TLB entries for normal pages being migrated to device private memory.
> > If a page isn't migrating, it seems inefficient to invalidate those TLB
> > entries.
> > 
> > Any other suggestions?
> 
> After a night's sleep, I think this might work. What do others think?
> 
> 1) Add a new MMU_NOTIFY_MIGRATE enum to mmu_notifier_event.
> 
> 2) Change migrate_vma_collect() to use the new MMU_NOTIFY_MIGRATE event type.
>
> 3) Modify nouveau_svmm_invalidate_range_start() to simply return (no invalidations)
> for MMU_NOTIFY_MIGRATE mmu notifier callbacks.

Isn't it a bit of an assumption that migrate_vma_collect() is only
used by nouveau itself?

What if some other devices' device_private pages are being migrated?

Jason

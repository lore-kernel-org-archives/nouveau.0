From: Christoph Hellwig <hch@lst.de>
Subject: Re: [RESEND PATCH 2/3] nouveau: fix mixed normal and device
 private page migration
Date: Wed, 24 Jun 2020 09:23:55 +0200
Message-ID: <20200624072355.GB18609@lst.de>
References: <20200622233854.10889-1-rcampbell@nvidia.com> <20200622233854.10889-3-rcampbell@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200622233854.10889-3-rcampbell@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ralph Campbell <rcampbell@nvidia.com>
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, Jerome Glisse <jglisse@redhat.com>, John Hubbard <jhubbard@nvidia.com>, Christoph Hellwig <hch@lst.de>, Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>
List-Id: nouveau.vger.kernel.org

On Mon, Jun 22, 2020 at 04:38:53PM -0700, Ralph Campbell wrote:
> The OpenCL function clEnqueueSVMMigrateMem(), without any flags, will
> migrate memory in the given address range to device private memory. The
> source pages might already have been migrated to device private memory.
> In that case, the source struct page is not checked to see if it is
> a device private page and incorrectly computes the GPU's physical
> address of local memory leading to data corruption.
> Fix this by checking the source struct page and computing the correct
> physical address.

I'm really worried about all this delicate code to fix the mixed
ranges.  Can't we make it clear at the migrate_vma_* level if we want
to migrate from or two device private memory, and then skip all the work
for regions of memory that already are in the right place?  This might be
a little more work initially, but I think it leads to a much better
API.

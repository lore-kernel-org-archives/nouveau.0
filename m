From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: Re: [PATCH 15/18] dma-mapping: add a new dma_alloc_pages API
Date: Tue, 22 Sep 2020 10:53:14 +0200
Message-ID: <20200922085314.GI8477@alpha.franken.de>
References: <20200915155122.1768241-1-hch@lst.de>
 <20200915155122.1768241-16-hch@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-mips-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200915155122.1768241-16-hch@lst.de>
To: Christoph Hellwig <hch@lst.de>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Ben Skeggs <bskeggs@redhat.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Tomasz Figa <tfiga@chromium.org>, Matt Porter <mporter@kernel.crashing.org>, iommu@lists.linux-foundation.org, Stefan Richter <stefanr@s5r6.in-berlin.de>, linux1394-devel@lists.sourceforge.net, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, nouveau@lists.freedesktop.org, netdev@vger.kernel.org, linux-scsi@vger.kernel.org, linux-mm@kvack
List-Id: nouveau.vger.kernel.org

On Tue, Sep 15, 2020 at 05:51:19PM +0200, Christoph Hellwig wrote:
> This API is the equivalent of alloc_pages, except that the returned memory
> is guaranteed to be DMA addressable by the passed in device.  The
> implementation will also be used to provide a more sensible replacement
> for DMA_ATTR_NON_CONSISTENT flag.
> 
> Additionally dma_alloc_noncoherent is switched over to use dma_alloc_pages
> as its backend.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  Documentation/core-api/dma-attributes.rst |  8 ---
>  arch/alpha/kernel/pci_iommu.c             |  2 +
>  arch/arm/mm/dma-mapping-nommu.c           |  2 +
>  arch/arm/mm/dma-mapping.c                 |  4 ++
>  arch/ia64/hp/common/sba_iommu.c           |  2 +
>  arch/mips/jazz/jazzdma.c                  |  7 +--
>  arch/powerpc/kernel/dma-iommu.c           |  2 +
>  arch/powerpc/platforms/ps3/system-bus.c   |  4 ++
>  arch/powerpc/platforms/pseries/vio.c      |  2 +
>  arch/s390/pci/pci_dma.c                   |  2 +
>  arch/x86/kernel/amd_gart_64.c             |  2 +
>  drivers/iommu/dma-iommu.c                 |  2 +
>  drivers/iommu/intel/iommu.c               |  4 ++
>  drivers/parisc/ccio-dma.c                 |  2 +
>  drivers/parisc/sba_iommu.c                |  2 +
>  drivers/xen/swiotlb-xen.c                 |  2 +
>  include/linux/dma-direct.h                |  5 ++
>  include/linux/dma-mapping.h               | 34 ++++++------
>  include/linux/dma-noncoherent.h           |  3 --
>  kernel/dma/direct.c                       | 52 ++++++++++++++++++-
>  kernel/dma/mapping.c                      | 63 +++++++++++++++++++++--
>  kernel/dma/ops_helpers.c                  | 35 +++++++++++++
>  kernel/dma/virt.c                         |  2 +
>  23 files changed, 206 insertions(+), 37 deletions(-)

Acked-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de> (MIPS part)

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

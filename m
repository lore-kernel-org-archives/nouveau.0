From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: DMA-API: cacheline tracking ENOMEM, dma-debug disabled due to
 nouveau ?
Date: Fri, 16 Aug 2019 20:45:11 +0200
Message-ID: <CAKMK7uGb0twmXUXS5GVN0mmGW-csWH524psJFfdFYuou9YXFDw@mail.gmail.com>
References: <20190814145033.GA11190@Red> <20190814174927.GT7444@phenom.ffwll.local>
 <20190816143146.GB30445@Red>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190816143146.GB30445@Red>
Sender: linux-kernel-owner@vger.kernel.org
To: Corentin Labbe <clabbe.montjoie@gmail.com>
Cc: Ben Skeggs <bskeggs@redhat.com>, Dave Airlie <airlied@linux.ie>, Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, dri-devel <dri-devel@lists.freedesktop.org>, Nouveau Dev <nouveau@lists.freedesktop.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>
List-Id: nouveau.vger.kernel.org

On Fri, Aug 16, 2019 at 4:31 PM Corentin Labbe
<clabbe.montjoie@gmail.com> wrote:
> On Wed, Aug 14, 2019 at 07:49:27PM +0200, Daniel Vetter wrote:
> > On Wed, Aug 14, 2019 at 04:50:33PM +0200, Corentin Labbe wrote:
> > > Hello
> > >
> > > Since lot of release (at least since 4.19), I hit the following error message:
> > > DMA-API: cacheline tracking ENOMEM, dma-debug disabled
> > >
> > > After hitting that, I try to check who is creating so many DMA mapping and see:
> > > cat /sys/kernel/debug/dma-api/dump | cut -d' ' -f2 | sort | uniq -c
> > >       6 ahci
> > >     257 e1000e
> > >       6 ehci-pci
> > >    5891 nouveau
> > >      24 uhci_hcd
> > >
> > > Does nouveau having this high number of DMA mapping is normal ?
> >
> > Yeah seems perfectly fine for a gpu.
>
> Note that it never go down and when I terminate my X session, it stays the same.
> So without any "real" GPU work, does it is still normal to have so many active mapping ?

Might just be the dma_alloc cache. It should go down under memory
pressure I think. Otherwise might also be a leak.

> For example, when doing some transfer, the ahci mapping number changes and then always go down to 6.

gpu drivers tend to cache everything, all the time ...
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch

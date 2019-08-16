From: Corentin Labbe <clabbe.montjoie@gmail.com>
Subject: Re: DMA-API: cacheline tracking ENOMEM, dma-debug disabled due to
 nouveau ?
Date: Fri, 16 Aug 2019 16:31:46 +0200
Message-ID: <20190816143146.GB30445@Red>
References: <20190814145033.GA11190@Red>
 <20190814174927.GT7444@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190814174927.GT7444@phenom.ffwll.local>
Sender: linux-kernel-owner@vger.kernel.org
To: bskeggs@redhat.com, airlied@linux.ie, hch@lst.de, m.szyprowski@samsung.com, robin.murphy@arm.com, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org
List-Id: nouveau.vger.kernel.org

On Wed, Aug 14, 2019 at 07:49:27PM +0200, Daniel Vetter wrote:
> On Wed, Aug 14, 2019 at 04:50:33PM +0200, Corentin Labbe wrote:
> > Hello
> > 
> > Since lot of release (at least since 4.19), I hit the following error message:
> > DMA-API: cacheline tracking ENOMEM, dma-debug disabled
> > 
> > After hitting that, I try to check who is creating so many DMA mapping and see:
> > cat /sys/kernel/debug/dma-api/dump | cut -d' ' -f2 | sort | uniq -c
> >       6 ahci
> >     257 e1000e
> >       6 ehci-pci
> >    5891 nouveau
> >      24 uhci_hcd
> > 
> > Does nouveau having this high number of DMA mapping is normal ?
> 
> Yeah seems perfectly fine for a gpu.

Note that it never go down and when I terminate my X session, it stays the same.
So without any "real" GPU work, does it is still normal to have so many active mapping ?

For example, when doing some transfer, the ahci mapping number changes and then always go down to 6.

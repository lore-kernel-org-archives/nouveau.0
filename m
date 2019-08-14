From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: DMA-API: cacheline tracking ENOMEM, dma-debug disabled due to
 nouveau ?
Date: Wed, 14 Aug 2019 19:49:27 +0200
Message-ID: <20190814174927.GT7444@phenom.ffwll.local>
References: <20190814145033.GA11190@Red>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190814145033.GA11190@Red>
Sender: linux-kernel-owner@vger.kernel.org
To: Corentin Labbe <clabbe.montjoie@gmail.com>
Cc: bskeggs@redhat.com, airlied@linux.ie, daniel@ffwll.ch, hch@lst.de, m.szyprowski@samsung.com, robin.murphy@arm.com, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org
List-Id: nouveau.vger.kernel.org

On Wed, Aug 14, 2019 at 04:50:33PM +0200, Corentin Labbe wrote:
> Hello
> 
> Since lot of release (at least since 4.19), I hit the following error message:
> DMA-API: cacheline tracking ENOMEM, dma-debug disabled
> 
> After hitting that, I try to check who is creating so many DMA mapping and see:
> cat /sys/kernel/debug/dma-api/dump | cut -d' ' -f2 | sort | uniq -c
>       6 ahci
>     257 e1000e
>       6 ehci-pci
>    5891 nouveau
>      24 uhci_hcd
> 
> Does nouveau having this high number of DMA mapping is normal ?

Yeah seems perfectly fine for a gpu.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

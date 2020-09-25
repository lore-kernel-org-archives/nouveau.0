From: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 08/18] dma-mapping: add a new dma_alloc_noncoherent API
Date: Fri, 25 Sep 2020 12:15:37 +0100
Message-ID: <c8ea4023-3e19-d63b-d936-46a04f502a61@arm.com>
References: <20200915155122.1768241-1-hch@lst.de>
 <20200915155122.1768241-9-hch@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20200915155122.1768241-9-hch@lst.de>
Content-Language: en-GB
To: Christoph Hellwig <hch@lst.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Ben Skeggs <bskeggs@redhat.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Tomasz Figa <tfiga@chromium.org>, Matt Porter <mporter@kernel.crashing.org>, iommu@lists.linux-foundation.org
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, linux-scsi@vger.kernel.org, linux-parisc@vger.kernel.org, linux-doc@vger.kernel.org, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, linux-mm@kvack.org, Stefan Richter <stefanr@s5r6.in-berlin.de>, netdev@vger.kernel.org, linux1394-devel@lists.sourceforge.net, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: nouveau.vger.kernel.org

On 2020-09-15 16:51, Christoph Hellwig wrote:
[...]
> +These APIs allow to allocate pages in the kernel direct mapping that are
> +guaranteed to be DMA addressable.  This means that unlike dma_alloc_coherent,
> +virt_to_page can be called on the resulting address, and the resulting

Nit: if we explicitly describe this as if it's a guarantee that can be 
relied upon...

> +struct page can be used for everything a struct page is suitable for.

[...]
> +This routine allocates a region of <size> bytes of consistent memory.  It
> +returns a pointer to the allocated region (in the processor's virtual address
> +space) or NULL if the allocation failed.  The returned memory may or may not
> +be in the kernels direct mapping.  Drivers must not call virt_to_page on
> +the returned memory region.

...then forbid this document's target audience from relying on it, 
something seems off. At the very least it's unhelpfully unclear :/

Given patch #17, I suspect that the first paragraph is the one that's no 
longer true.

Robin.

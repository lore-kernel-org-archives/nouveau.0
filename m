From: Tomasz Figa <tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 05/28] media/v4l2: remove V4L2-FLAG-MEMORY-NON-CONSISTENT
Date: Thu, 20 Aug 2020 12:24:31 +0200
Message-ID: <CAAFQd5AknYpP5BamC=wJkEJyO-q47V6Gc+HT65h6B+HyT+-xjQ@mail.gmail.com>
References: <20200819065555.1802761-1-hch@lst.de>
 <20200819065555.1802761-6-hch@lst.de>
 <CAAFQd5COLxjydDYrfx47ht8tj-aNPiaVnC+WyQA7nvpW4gs=ww@mail.gmail.com>
 <62e4f4fc-c8a5-3ee8-c576-fe7178cb4356@arm.com>
 <CAAFQd5AcCTDguB2C9KyDiutXWoEvBL8tL7+a==Uo8vj_8CLOJw@mail.gmail.com>
 <2b32f1d8-16f7-3352-40a5-420993d52fb5@arm.com> <20200820050214.GA4815@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
In-Reply-To: <20200820050214.GA4815-jcswGhMUV9g@public.gmane.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/iommu>,
 <mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/iommu/>
List-Post: <mailto:iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
List-Help: <mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/iommu>,
 <mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=subscribe>
Errors-To: iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org
Sender: "iommu" <iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
To: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-ia64-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux Doc Mailing List <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-nvme-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mips-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "James E.J. Bottomley" <James.Bottomley-JuX6DAaQMKPCXq6kfMZ53/egYHeGw8Jk@public.gmane.org>, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, linux-samsung-soc <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Joonyoung Shim <jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-scsi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "list-Y9sIeH5OGRo@public.gmane.org:IOMMU DRIVERS" <iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Matt Porter <mporter-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Linux Media Mailing List <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Tom Lendacky <thomas.lendacky-5C7GfCeVMHo@public.gmane.org>, Pawel Osciak <pawel-FA/gS7QP4orQT0dZR+AlfA@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "list-Y9sIeH5OGRo@public.gmane.org:IOMMU DRIVERS <iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>,
 Joerg Roedel <joro-zLv9SwRftAIdnm+yROfE0A@public.gmane.org>, " <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Thu, Aug 20, 2020 at 7:02 AM Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org> wrote:
>
> On Wed, Aug 19, 2020 at 03:07:04PM +0100, Robin Murphy wrote:
> >> FWIW, I asked back in time what the plan is for non-coherent
> >> allocations and it seemed like DMA_ATTR_NON_CONSISTENT and
> >> dma_sync_*() was supposed to be the right thing to go with. [2] The
> >> same thread also explains why dma_alloc_pages() isn't suitable for the
> >> users of dma_alloc_attrs() and DMA_ATTR_NON_CONSISTENT.
> >
> > AFAICS even back then Christoph was implying getting rid of NON_CONSISTENT
> > and *replacing* it with something streaming-API-based - i.e. this series -
> > not encouraging mixing the existing APIs. It doesn't seem impossible to
> > implement a remapping version of this new dma_alloc_pages() for
> > IOMMU-backed ops if it's really warranted (although at that point it seems
> > like "non-coherent" vb2-dc starts to have significant conceptual overlap
> > with vb2-sg).
>
> You can alway vmap the returned pages from dma_alloc_pages, but it will
> make cache invalidation hell - you'll need to use
> invalidate_kernel_vmap_range and flush_kernel_vmap_range to properly
> handle virtually indexed caches.
>
> Or with remapping you mean using the iommu do de-scatter/gather?

Ideally, both.

For remapping in the CPU sense, there are drivers which rely on a
contiguous kernel mapping of the vb2 buffers, which was provided by
dma_alloc_attrs(). I think they could be reworked to work on single
pages, but that would significantly complicate the code. At the same
time, such drivers would actually benefit from a cached mapping,
because they often have non-bursty, random access patterns.

Then, in the IOMMU sense, the whole idea of videobuf2-dma-contig is to
rely on the DMA API to always provide device-contiguous memory, as
required by the hardware which only has a single pointer and size.

>
> You can implement that trivially implement it yourself for the iommu
> case:
>
> {
>         merge_boundary = dma_get_merge_boundary(dev);
>         if (!merge_boundary || merge_boundary > chunk_size - 1) {
>                 /* can't coalesce */
>                 return -EINVAL;
>         }
>
>
>         nents = DIV_ROUND_UP(total_size, chunk_size);
>         sg = sgl_alloc();
>         for_each_sgl() {
>                 sg->page = __alloc_pages(get_order(chunk_size))
>                 sg->len = chunk_size;
>         }
>         dma_map_sg(sg, DMA_ATTR_SKIP_CPU_SYNC);
>         // you are guaranteed to get a single dma_addr out
> }
>
> Of course this still uses the scatterlist structure with its annoying
> mix of input and output parametes, so I'd rather not expose it as
> an official API at the DMA layer.

The problem with the above open coded approach is that it requires
explicit handling of the non-IOMMU and IOMMU cases and this is exactly
what we don't want to have in vb2 and what was actually the job of the
DMA API to hide. Is the plan to actually move the IOMMU handling out
of the DMA API?

Do you think we could instead turn it into a dma_alloc_noncoherent()
helper, which has similar semantics as dma_alloc_attrs() and handles
the various corner cases (e.g. invalidate_kernel_vmap_range and
flush_kernel_vmap_range) to achieve the desired functionality without
delegating the "hell", as you called it, to the users?

Best regards,
Tomasz

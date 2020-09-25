From: Tomasz Figa <tfiga@chromium.org>
Subject: Re: [PATCH 01/18] media/v4l2: remove V4L2-FLAG-MEMORY-NON-CONSISTENT
 flag
Date: Fri, 25 Sep 2020 18:47:12 +0000
Message-ID: <20200925184712.GC3607091@chromium.org>
References: <20200915155122.1768241-1-hch@lst.de>
 <20200915155122.1768241-2-hch@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200915155122.1768241-2-hch@lst.de>
To: Christoph Hellwig <hch@lst.de>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Ben Skeggs <bskeggs@redhat.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Matt Porter <mporter@kernel.crashing.org>, iommu@lists.linux-foundation.org, Stefan Richter <stefanr@s5r6.in-berlin.de>, linux1394-devel@lists.sourceforge.net, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, nouveau@lists.freedesktop.org, netdev@vger.kernel.org, linux-scsi@vger.kernel.org
List-Id: nouveau.vger.kernel.org

Hi Christoph,

On Tue, Sep 15, 2020 at 05:51:05PM +0200, Christoph Hellwig wrote:
> From: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
> 
> The patch partially reverts some of the UAPI bits of the buffer
> cache management hints. Namely, the queue consistency (memory
> coherency) user-space hint because, as it turned out, the kernel
> implementation of this feature was misusing DMA_ATTR_NON_CONSISTENT.
> 
> The patch revers both kernel and user space parts: removes the
> DMA consistency attr functions, rollbacks changes to v4l2_requestbuffers,
> v4l2_create_buffers structures and corresponding UAPI functions
> (plus compat32 layer) and cleanups the documentation.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  .../userspace-api/media/v4l/buffer.rst        | 17 -------
>  .../media/v4l/vidioc-create-bufs.rst          |  6 +--
>  .../media/v4l/vidioc-reqbufs.rst              | 12 +----
>  .../media/common/videobuf2/videobuf2-core.c   | 46 +++----------------
>  .../common/videobuf2/videobuf2-dma-contig.c   | 19 --------
>  .../media/common/videobuf2/videobuf2-dma-sg.c |  3 +-
>  .../media/common/videobuf2/videobuf2-v4l2.c   | 18 +-------
>  drivers/media/v4l2-core/v4l2-compat-ioctl32.c | 10 +---
>  drivers/media/v4l2-core/v4l2-ioctl.c          |  5 +-
>  include/media/videobuf2-core.h                |  7 +--
>  include/uapi/linux/videodev2.h                | 13 +-----
>  11 files changed, 22 insertions(+), 134 deletions(-)

Acked-by: Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz

From: Thomas Bogendoerfer <tsbogend-I1c7kopa9pxLokYuJOExCg@public.gmane.org>
Subject: Re: [PATCH 07/18] 53c700: improve non-coherent DMA handling
Date: Tue, 22 Sep 2020 10:49:34 +0200
Message-ID: <20200922084934.GB8477@alpha.franken.de>
References: <20200915155122.1768241-1-hch@lst.de>
 <20200915155122.1768241-8-hch@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200915155122.1768241-8-hch-jcswGhMUV9g@public.gmane.org>
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
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "James E.J. Bottomley" <James.Bottomley-d9PhHud1JfjCXq6kfMZ53/egYHeGw8Jk@public.gmane.org>, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, linux1394-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Joonyoung Shim <jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-scsi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Matt Porter <mporter-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-parisc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Seung-Woo Kim <sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-mips-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, Stefan Richter <stefanr-MtYdepGKPcBMYopoZt5u/LNAH6kLmebB@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Tue, Sep 15, 2020 at 05:51:11PM +0200, Christoph Hellwig wrote:
> Switch the 53c700 driver to only use non-coherent descriptor memory if it
> really has to because dma_alloc_coherent fails.  This doesn't matter for
> any of the platforms it runs on currently, but that will change soon.
> 
> To help with this two new helpers to transfer ownership to and from the
> device are added that abstract the syncing of the non-coherent memory.
> The two current bidirectional cases are mapped to transfers to the
> device, as that appears to what they are used for.  Note that for parisc,
> which is the only architecture this driver needs to use non-coherent
> memory on, the direction argument of dma_cache_sync is ignored, so this
> will not change behavior in any way.
> 
> Signed-off-by: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
> ---
>  drivers/scsi/53c700.c | 113 +++++++++++++++++++++++-------------------
>  drivers/scsi/53c700.h |  17 ++++---
>  2 files changed, 72 insertions(+), 58 deletions(-)

Tested-by: Thomas Bogendoerfer <tsbogend-I1c7kopa9pxLokYuJOExCg@public.gmane.org>

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

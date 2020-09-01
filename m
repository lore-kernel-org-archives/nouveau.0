From: James Bottomley <James.Bottomley-d9PhHud1JfjCXq6kfMZ53/egYHeGw8Jk@public.gmane.org>
Subject: Re: [PATCH 07/28] 53c700: improve non-coherent DMA handling
Date: Tue, 01 Sep 2020 07:52:40 -0700
Message-ID: <1598971960.4238.5.camel@HansenPartnership.com>
References: <20200819065555.1802761-1-hch@lst.de>
 <20200819065555.1802761-8-hch@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
In-Reply-To: <20200819065555.1802761-8-hch-jcswGhMUV9g@public.gmane.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/iommu>,
 <mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/iommu/>
List-Post: <mailto:iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
List-Help: <mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/iommu>,
 <mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=subscribe>
Errors-To: iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org
Sender: "iommu" <iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
To: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thomas Bogendoerfer <tsbogend-I1c7kopa9pxLokYuJOExCg@public.gmane.org>, Joonyoung Shim <jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Seung-Woo Kim <sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Pawel Osciak <pawel-FA/gS7QP4orQT0dZR+AlfA@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Matt Porter <mporter-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org
Cc: Tom Lendacky <thomas.lendacky-5C7GfCeVMHo@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-ia64-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-scsi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-parisc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-nvme-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mips-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Wed, 2020-08-19 at 08:55 +0200, Christoph Hellwig wrote:
> Switch the 53c700 driver to only use non-coherent descriptor memory
> if it really has to because dma_alloc_coherent fails.  This doesn't
> matter for any of the platforms it runs on currently, but that will
> change soon.
> 
> To help with this two new helpers to transfer ownership to and from
> the device are added that abstract the syncing of the non-coherent
> memory. The two current bidirectional cases are mapped to transfers
> to the device, as that appears to what they are used for.  Note that
> for parisc, which is the only architecture this driver needs to use
> non-coherent memory on, the direction argument of dma_cache_sync is
> ignored, so this will not change behavior in any way.

I think this looks mostly OK, except for one misnamed parameter below. 
Unfortunately, the last non-coherent parisc was the 700 series and I no
longer own a box, so I can't test that part of it (I can fire up the
C360 to test it on a coherent arch).

[...]
> diff --git a/drivers/scsi/53c700.h b/drivers/scsi/53c700.h
> index 05fe439b66afe5..0f545b05fe611d 100644
> --- a/drivers/scsi/53c700.h
> +++ b/drivers/scsi/53c700.h
> @@ -209,6 +209,7 @@ struct NCR_700_Host_Parameters {
>  #endif
>  	__u32	chip710:1;	/* set if really a 710 not
> 700 */
>  	__u32	burst_length:4;	/* set to 0 to disable
> 710 bursting */
> +	__u32	noncoherent:1;	/* needs to use non-
> coherent DMA */
>  
>  	/* NOTHING BELOW HERE NEEDS ALTERING */
>  	__u32	fast:1;		/* if we can alter the
> SCSI bus clock
> @@ -429,7 +430,7 @@ struct NCR_700_Host_Parameters {
>  	for(i=0; i< (sizeof(A_##symbol##_used) / sizeof(__u32));
> i++) { \
>  		__u32 val =
> bS_to_cpu((script)[A_##symbol##_used[i]]) + da; \
>  		(script)[A_##symbol##_used[i]] = bS_to_host(val); \
> -		dma_cache_sync((dev),
> &(script)[A_##symbol##_used[i]], 4, DMA_TO_DEVICE); \
> +		dma_sync_to_dev((dev),
> &(script)[A_##symbol##_used[i]], 4); \
>  		DEBUG((" script, patching %s at %d to %pad\n", \
>  		       #symbol, A_##symbol##_used[i], &da)); \
>  	} \
> @@ -441,7 +442,7 @@ struct NCR_700_Host_Parameters {
>  	dma_addr_t da = value; \
>  	for(i=0; i< (sizeof(A_##symbol##_used) / sizeof(__u32));
> i++) { \
>  		(script)[A_##symbol##_used[i]] = bS_to_host(da); \
> -		dma_cache_sync((dev),
> &(script)[A_##symbol##_used[i]], 4, DMA_TO_DEVICE); \
> +		dma_sync_to_dev((dev),
> &(script)[A_##symbol##_used[i]], 4); \
>  		DEBUG((" script, patching %s at %d to %pad\n", \
>  		       #symbol, A_##symbol##_used[i], &da)); \
>  	} \
> @@ -456,7 +457,7 @@ struct NCR_700_Host_Parameters {
>  		val &= 0xff00ffff; \
>  		val |= ((value) & 0xff) << 16; \
>  		(script)[A_##symbol##_used[i]] = bS_to_host(val); \
> -		dma_cache_sync((dev),
> &(script)[A_##symbol##_used[i]], 4, DMA_TO_DEVICE); \
> +		dma_sync_to_dev((dev),
> &(script)[A_##symbol##_used[i]], 4); \
>  		DEBUG((" script, patching ID field %s at %d to
> 0x%x\n", \
>  		       #symbol, A_##symbol##_used[i], val)); \
>  	} \
> @@ -470,7 +471,7 @@ struct NCR_700_Host_Parameters {
>  		val &= 0xffff0000; \
>  		val |= ((value) & 0xffff); \
>  		(script)[A_##symbol##_used[i]] = bS_to_host(val); \
> -		dma_cache_sync((dev),
> &(script)[A_##symbol##_used[i]], 4, DMA_TO_DEVICE); \
> +		dma_sync_to_dev((dev),
> &(script)[A_##symbol##_used[i]], 4); \
>  		DEBUG((" script, patching short field %s at %d to
> 0x%x\n", \
>  		       #symbol, A_##symbol##_used[i], val)); \
>  	} \

These macro arguments need updating.  Since you changed the input from
hostdata->dev to hostdata, leaving the macro argument as dev is simply
misleading.  It needs to become hostdata or h.

James

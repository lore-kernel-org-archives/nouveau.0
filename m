From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau: remove redundant comments
 listing classes
Date: Wed, 17 Oct 2012 14:32:15 +1000
Message-ID: <20121017043215.GB4049@turiel.redhat.com>
References: <20121016214530.GD21336@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20121016214530.GD21336-OI9uyE9O0yo@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Tue, Oct 16, 2012 at 11:45:30PM +0200, Marcin Slusarz wrote:
> Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
NACK on this one.  I did ponder doing such a thing myself when I first
added the defines for the class names too, and decided against it as
this will (at some point) become a user-facing header, and I was
planning on documenting the differences between class revisions in the
commented blocks.

Ben.

> ---
>  drivers/gpu/drm/nouveau/core/include/core/class.h | 31 +++--------------------
>  1 file changed, 4 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/core/include/core/class.h b/drivers/gpu/drm/nouveau/core/include/core/class.h
> index 6180ae9..5b739de 100644
> --- a/drivers/gpu/drm/nouveau/core/include/core/class.h
> +++ b/drivers/gpu/drm/nouveau/core/include/core/class.h
> @@ -1,10 +1,7 @@
>  #ifndef __NOUVEAU_CLASS_H__
>  #define __NOUVEAU_CLASS_H__
>  
> -/* Device class
> - *
> - * 0080: NV_DEVICE
> - */
> +/* Device class */
>  #define NV_DEVICE_CLASS                                              0x00000080
>  
>  #define NV_DEVICE_DISABLE_IDENTIFY                        0x0000000000000001ULL
> @@ -30,12 +27,7 @@ struct nv_device_class {
>  	u64 debug0;	/* as above, but *internal* ids, and *NOT* ABI */
>  };
>  
> -/* DMA object classes
> - *
> - * 0002: NV_DMA_FROM_MEMORY
> - * 0003: NV_DMA_TO_MEMORY
> - * 003d: NV_DMA_IN_MEMORY
> - */
> +/* DMA object classes */
>  #define NV_DMA_FROM_MEMORY_CLASS                                     0x00000002
>  #define NV_DMA_TO_MEMORY_CLASS                                       0x00000003
>  #define NV_DMA_IN_MEMORY_CLASS                                       0x0000003d
> @@ -59,15 +51,7 @@ struct nv_dma_class {
>  	u64 limit;
>  };
>  
> -/* DMA FIFO channel classes
> - *
> - * 006b: NV03_CHANNEL_DMA
> - * 006e: NV10_CHANNEL_DMA
> - * 176e: NV17_CHANNEL_DMA
> - * 406e: NV40_CHANNEL_DMA
> - * 506e: NV50_CHANNEL_DMA
> - * 826e: NV84_CHANNEL_DMA
> - */
> +/* DMA FIFO channel classes */
>  #define NV03_CHANNEL_DMA_CLASS                                       0x0000006b
>  #define NV10_CHANNEL_DMA_CLASS                                       0x0000006e
>  #define NV17_CHANNEL_DMA_CLASS                                       0x0000176e
> @@ -81,14 +65,7 @@ struct nv03_channel_dma_class {
>  	u64 offset;
>  };
>  
> -/* Indirect FIFO channel classes
> - *
> - * 506f: NV50_CHANNEL_IND
> - * 826f: NV84_CHANNEL_IND
> - * 906f: NVC0_CHANNEL_IND
> - * a06f: NVE0_CHANNEL_IND
> - */
> -
> +/* Indirect FIFO channel classes */
>  #define NV50_CHANNEL_IND_CLASS                                       0x0000506f
>  #define NV84_CHANNEL_IND_CLASS                                       0x0000826f
>  #define NVC0_CHANNEL_IND_CLASS                                       0x0000906f
> -- 
> 1.7.12
> 
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau

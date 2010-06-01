From: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: "typo" in "drm/nv50: cast IGP memory location to u64
 before shifting"
Date: Wed, 02 Jun 2010 08:40:01 +1000
Message-ID: <1275432001.3727.0.camel@nisroch>
References: <20100601164633.GA2854@joi.lan>
Reply-To: bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20100601164633.GA2854-OI9uyE9O0yo@public.gmane.org>
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

On Tue, 2010-06-01 at 18:46 +0200, Marcin Slusarz wrote:
> Hi
> 
> This does not look right:
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_mem.c b/drivers/gpu/drm/nouveau/nouveau_mem.c
> index 775a701..c1fd42b 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_mem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_mem.c
> @@ -540,7 +540,8 @@ nouveau_mem_detect(struct drm_device *dev)
>  		dev_priv->vram_size  = nv_rd32(dev, NV04_FIFO_DATA);
>  		dev_priv->vram_size &= NV10_FIFO_DATA_RAM_AMOUNT_MB_MASK;
>  		if (dev_priv->chipset == 0xaa || dev_priv->chipset == 0xac)
> -			dev_priv->vram_sys_base = nv_rd32(dev, 0x100e10) << 12;
> +			dev_priv->vram_sys_base = nv_rd32(dev, 0x100e10);
> +			dev_priv->vram_sys_base <<= 12;
>  	}
>  
>  	NV_INFO(dev, "Detected %dMiB VRAM\n", (int)(dev_priv->vram_size >> 20));
> 
> You forgot to add {} around these lines...
Oops, fail.  Luckily it doesn't actually matter at all in this case, but
I've fixed it anyway.

Thanks!
Ben.
> 
> Marcin
> 
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau

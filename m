From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm/nv84: decode PCRYPT errors
Date: Wed, 13 Jun 2012 23:12:18 +1000
Message-ID: <20120613131218.GA5116@nisroch.redhat.com>
References: <20120610222053.GA32589@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20120610222053.GA32589-OI9uyE9O0yo@public.gmane.org>
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

On Mon, Jun 11, 2012 at 12:21:12AM +0200, Marcin Slusarz wrote:
> 
Pushed, thanks.

> Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/gpu/drm/nouveau/nv84_crypt.c |   19 ++++++++++++++++---
>  1 files changed, 16 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nv84_crypt.c b/drivers/gpu/drm/nouveau/nv84_crypt.c
> index 6059f0e..88beab7 100644
> --- a/drivers/gpu/drm/nouveau/nv84_crypt.c
> +++ b/drivers/gpu/drm/nouveau/nv84_crypt.c
> @@ -32,6 +32,7 @@
>  #include "nouveau_instmem.h"
>  #include "nouveau_gpuobj.h"
>  #include "nouveau_crypt.h"
> +#include "nouveau_graph.h"
>  
>  struct nv84_crypt_priv {
>  	struct nouveau_crypt_priv base;
> @@ -120,18 +121,30 @@ nv84_crypt_tlb_flush(struct nouveau_device *ndev, int engine)
>  	return nv50_vm_flush_engine(ndev, 0x0a);
>  }
>  
> +static struct nouveau_bitfield nv84_crypt_intr[] = {
> +	{ 0x00000001, "INVALID_STATE" },
> +	{ 0x00000002, "ILLEGAL_MTHD" },
> +	{ 0x00000004, "ILLEGAL_CLASS" },
> +	{ 0x00000080, "QUERY" },
> +	{ 0x00000100, "FAULT" },
> +	{}
> +};
> +
>  static void
>  nv84_crypt_isr(struct nouveau_device *ndev)
>  {
>  	u32 stat = nv_rd32(ndev, 0x102130);
>  	u32 mthd = nv_rd32(ndev, 0x102190);
>  	u32 data = nv_rd32(ndev, 0x102194);
> -	u32 inst = nv_rd32(ndev, 0x102188) & 0x7fffffff;
> +	u64 inst = (u64)(nv_rd32(ndev, 0x102188) & 0x7fffffff) << 12;
>  	int show = nouveau_ratelimit();
> +	int chid = nv50_graph_isr_chid(ndev, inst);
>  
>  	if (show) {
> -		NV_INFO(ndev, "PCRYPT_INTR: 0x%08x 0x%08x 0x%08x 0x%08x\n",
> -			     stat, mthd, data, inst);
> +		NV_INFO(ndev, "PCRYPT -");
> +		nouveau_bitfield_print(nv84_crypt_intr, stat);
> +		printk(KERN_CONT " - ch %d (0x%010llx) mthd 0x%04x data 0x%08x\n",
> +			chid, inst, mthd, data);
>  	}
>  
>  	nv_wr32(ndev, 0x102130, stat);
> -- 
> 1.7.8.6
> 
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau

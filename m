From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 01/10] drm/nv50: decode PGRAPH status
 registers on TLB flush fail
Date: Mon, 20 Aug 2012 16:27:18 +1000
Message-ID: <20120820062718.GB2013@nisroch.redhat.com>
References: <1345410004-27729-1-git-send-email-marcin.slusarz@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1345410004-27729-1-git-send-email-marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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

On Sun, Aug 19, 2012 at 10:59:56PM +0200, Marcin Slusarz wrote:
> Now it outputs:
> nouveau E[  PGRAPH][0000:02:00.0] PGRAPH TLB flush idle timeout fail
> nouveau E[  PGRAPH][0000:02:00.0] PGRAPH_STATUS: BUSY DISPATCH VFETCH CCACHE_UNK4 STRMOUT_GSCHED_UNK5 UNK14XX UNK1CXX CLIPID ZCULL ENG2D UNK34XX TPRAST TPROP ROP (0x011fde03)
> nouveau E[  PGRAPH][0000:02:00.0] PGRAPH_VSTATUS_0: CCACHE (0x00145b4d)
> nouveau E[  PGRAPH][0000:02:00.0] PGRAPH_VSTATUS_1: (0x0000002d)
> nouveau E[  PGRAPH][0000:02:00.0] PGRAPH_VSTATUS_2: ENG2D ROP (0x0034db40)
> 
> instead of:
> [drm] nouveau 0000:02:00.0: PGRAPH TLB flush idle timeout fail: 0x011fde03 0x00145b4d 0x0000002d 0x0034db40

I didn't push these first few patches yet as I have a couple of thoughts on it.

Mostly I was thinking we should probably have a:

nv_printf(obj, lvl, fmt, args...)

to replace the printk's which just does a continued print while still obeying
the debug level?

> 
> Based on envytools docs.
> 
> Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/gpu/drm/nouveau/core/engine/graph/nv50.c |   78 ++++++++++++++++++++-
>  1 files changed, 74 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/core/engine/graph/nv50.c b/drivers/gpu/drm/nouveau/core/engine/graph/nv50.c
> index c93b525..f60aec9 100644
> --- a/drivers/gpu/drm/nouveau/core/engine/graph/nv50.c
> +++ b/drivers/gpu/drm/nouveau/core/engine/graph/nv50.c
> @@ -184,6 +184,62 @@ nv50_graph_tlb_flush(struct nouveau_engine *engine)
>  	return 0;
>  }
>  
> +static struct nouveau_bitfield nv50_pgraph_status[] = {
> +	{ 1<<0, "BUSY" }, /* set when any bit is set */
> +	{ 1<<1, "DISPATCH" },
> +	{ 1<<2, "UNK2" },
> +	{ 1<<3, "UNK3" },
> +	{ 1<<4, "UNK4" },
> +	{ 1<<5, "UNK5" },
> +	{ 1<<6, "M2MF" },
> +	{ 1<<7, "UNK7" },
> +	{ 1<<8, "CTXPROG" },
> +	{ 1<<9, "VFETCH" },
> +	{ 1<<10, "CCACHE_UNK4" },
> +	{ 1<<11, "STRMOUT_GSCHED_UNK5" },
> +	{ 1<<12, "UNK14XX" },
> +	{ 1<<13, "UNK24XX_CSCHED" },
> +	{ 1<<14, "UNK1CXX" },
> +	{ 1<<15, "CLIPID" },
> +	{ 1<<16, "ZCULL" },
> +	{ 1<<17, "ENG2D" },
> +	{ 1<<18, "UNK34XX" },
> +	{ 1<<19, "TPRAST" },
> +	{ 1<<20, "TPROP" },
> +	{ 1<<21, "TEX" },
> +	{ 1<<22, "TPVP" },
> +	{ 1<<23, "MP" },
> +	{ 1<<24, "ROP" },
> +	{}
> +};
hex bitfields please :)

> +
> +static const char *const nv50_pgraph_vstatus_0[] = {
> +	"VFETCH", "CCACHE", "UNK4", "UNK5", "GSCHED", "STRMOUT", "UNK14XX", NULL
> +};
> +
> +static const char *const nv50_pgraph_vstatus_1[] = {
> +	"TPRAST", "TPROP", "TEXTURE", "TPVP", "MP", NULL
> +};
> +
> +static const char *const nv50_pgraph_vstatus_2[] = {
> +	"UNK24XX", "CSCHED", "UNK1CXX", "CLIPID", "ZCULL", "ENG2D", "UNK34XX",
> +	"ROP", NULL
> +};
> +
> +static void nouveau_pgraph_vstatus_print(const char *const units[], u32 status)
> +{
> +	int i;
> +	u32 tmp = status;
> +	for (i = 0; units[i] && tmp; i++) {
> +		if ((tmp & 7) == 1)
> +			pr_cont("%s ", units[i]);
> +		tmp >>= 3;
> +	}
> +	if (tmp)
> +		pr_cont("invalid: %x ", tmp);
> +	pr_cont("(0x%08x)\n", status);
> +}
> +
>  static int
>  nv84_graph_tlb_flush(struct nouveau_engine *engine)
>  {
> @@ -219,10 +275,24 @@ nv84_graph_tlb_flush(struct nouveau_engine *engine)
>  		 !(timeout = ptimer->read(ptimer) - start > 2000000000));
>  
>  	if (timeout) {
> -		nv_error(priv, "PGRAPH TLB flush idle timeout fail: "
> -			      "0x%08x 0x%08x 0x%08x 0x%08x\n",
> -			 nv_rd32(priv, 0x400700), nv_rd32(priv, 0x400380),
> -			 nv_rd32(priv, 0x400384), nv_rd32(priv, 0x400388));
> +		nv_error(priv, "PGRAPH TLB flush idle timeout fail\n");
> +
> +		nv_error(priv, "PGRAPH_STATUS: ");
> +		tmp = nv_rd32(priv, 0x400700);
> +		nouveau_bitfield_print(nv50_pgraph_status, tmp);
> +		pr_cont(" (0x%08x)\n", tmp);
> +
> +		nv_error(priv, "PGRAPH_VSTATUS_0: ");
> +		nouveau_pgraph_vstatus_print(nv50_pgraph_vstatus_0,
> +				nv_rd32(priv, 0x400380));
> +
> +		nv_error(priv, "PGRAPH_VSTATUS_1: ");
> +		nouveau_pgraph_vstatus_print(nv50_pgraph_vstatus_1,
> +				nv_rd32(priv, 0x400384));
> +
> +		nv_error(priv, "PGRAPH_VSTATUS_2: ");
> +		nouveau_pgraph_vstatus_print(nv50_pgraph_vstatus_2,
> +				nv_rd32(priv, 0x400388));
>  	}
>  
>  	nv50_vm_flush_engine(&engine->base, 0x00);
> -- 
> 1.7.8.6
> 
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau

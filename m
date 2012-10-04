From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 01/10] drm/nv50: decode PGRAPH status
 registers on TLB flush fail
Date: Thu, 4 Oct 2012 13:43:15 +0200
Message-ID: <20121004114315.GD4979@joi.lan>
References: <1345410004-27729-1-git-send-email-marcin.slusarz@gmail.com>
	<20120820062718.GB2013@nisroch.redhat.com>
	<20120820170246.GA3143@joi.lan> <20120820220832.GB5687@joi.lan>
	<20120912224753.GA8067@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20120912224753.GA8067-OI9uyE9O0yo@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Thu, Sep 13, 2012 at 12:47:53AM +0200, Marcin Slusarz wrote:
> On Tue, Aug 21, 2012 at 12:08:32AM +0200, Marcin Slusarz wrote:
> > On Mon, Aug 20, 2012 at 07:02:46PM +0200, Marcin Slusarz wrote:
> > > On Mon, Aug 20, 2012 at 04:27:18PM +1000, Ben Skeggs wrote:
> > > > On Sun, Aug 19, 2012 at 10:59:56PM +0200, Marcin Slusarz wrote:
> > > > > Now it outputs:
> > > > > nouveau E[  PGRAPH][0000:02:00.0] PGRAPH TLB flush idle timeout fail
> > > > > nouveau E[  PGRAPH][0000:02:00.0] PGRAPH_STATUS: BUSY DISPATCH VFETCH CCACHE_UNK4 STRMOUT_GSCHED_UNK5 UNK14XX UNK1CXX CLIPID ZCULL ENG2D UNK34XX TPRAST TPROP ROP (0x011fde03)
> > > > > nouveau E[  PGRAPH][0000:02:00.0] PGRAPH_VSTATUS_0: CCACHE (0x00145b4d)
> > > > > nouveau E[  PGRAPH][0000:02:00.0] PGRAPH_VSTATUS_1: (0x0000002d)
> > > > > nouveau E[  PGRAPH][0000:02:00.0] PGRAPH_VSTATUS_2: ENG2D ROP (0x0034db40)
> > > > > 
> > > > > instead of:
> > > > > [drm] nouveau 0000:02:00.0: PGRAPH TLB flush idle timeout fail: 0x011fde03 0x00145b4d 0x0000002d 0x0034db40
> > > > 
> > > > I didn't push these first few patches yet as I have a couple of thoughts on it.
> > > > 
> > > > Mostly I was thinking we should probably have a:
> > > > 
> > > > nv_printf(obj, lvl, fmt, args...)
> > > > 
> > > > to replace the printk's which just does a continued print while still obeying
> > > > the debug level?
> > > 
> > > Well, this patch does not use nv_printk_enabled, so these concerns should
> > > not apply to it, right? I'll fix up bitfield list and resend it.
> 
> New version, which prints VSTATUS regs on one line.
> 
> PS: I pushed this and some other patches to my github repo.
>  ( https://github.com/mslusarz/linux )
> ---
> From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Subject: [PATCH 01/11] drm/nv50: decode PGRAPH status registers on TLB flush fail
> 
> Now it outputs:
> nouveau E[  PGRAPH][0000:02:00.0] PGRAPH TLB flush idle timeout fail
> nouveau E[  PGRAPH][0000:02:00.0] PGRAPH_STATUS: BUSY DISPATCH VFETCH CCACHE_UNK4 STRMOUT_GSCHED_UNK5 UNK14XX UNK1CXX CLIPID ZCULL ENG2D UNK34XX TPRAST TPROP ROP (0x011fde03)
> nouveau E[  PGRAPH][0000:02:00.0] PGRAPH_VSTATUS: CCACHE (0x00145b4d) (0x0000002d) ENG2D ROP (0x0034db40)
> 
> instead of:
> [drm] nouveau 0000:02:00.0: PGRAPH TLB flush idle timeout fail: 0x011fde03 0x00145b4d 0x0000002d 0x0034db40
> 
> Based on envytools docs.
> 
> Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/gpu/drm/nouveau/core/engine/graph/nv50.c | 75 ++++++++++++++++++++++--
>  1 file changed, 71 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/core/engine/graph/nv50.c b/drivers/gpu/drm/nouveau/core/engine/graph/nv50.c
> index ab3b9dc..5f1adca 100644
> --- a/drivers/gpu/drm/nouveau/core/engine/graph/nv50.c
> +++ b/drivers/gpu/drm/nouveau/core/engine/graph/nv50.c
> @@ -184,6 +184,62 @@ nv50_graph_tlb_flush(struct nouveau_engine *engine)
>  	return 0;
>  }
>  
> +static const struct nouveau_bitfield nv50_pgraph_status[] = {
> +	{ 0x00000001, "BUSY" }, /* set when any bit is set */
> +	{ 0x00000002, "DISPATCH" },
> +	{ 0x00000004, "UNK2" },
> +	{ 0x00000008, "UNK3" },
> +	{ 0x00000010, "UNK4" },
> +	{ 0x00000020, "UNK5" },
> +	{ 0x00000040, "M2MF" },
> +	{ 0x00000080, "UNK7" },
> +	{ 0x00000100, "CTXPROG" },
> +	{ 0x00000200, "VFETCH" },
> +	{ 0x00000400, "CCACHE_UNK4" },
> +	{ 0x00000800, "STRMOUT_GSCHED_UNK5" },
> +	{ 0x00001000, "UNK14XX" },
> +	{ 0x00002000, "UNK24XX_CSCHED" },
> +	{ 0x00004000, "UNK1CXX" },
> +	{ 0x00008000, "CLIPID" },
> +	{ 0x00010000, "ZCULL" },
> +	{ 0x00020000, "ENG2D" },
> +	{ 0x00040000, "UNK34XX" },
> +	{ 0x00080000, "TPRAST" },
> +	{ 0x00100000, "TPROP" },
> +	{ 0x00200000, "TEX" },
> +	{ 0x00400000, "TPVP" },
> +	{ 0x00800000, "MP" },
> +	{ 0x01000000, "ROP" },
> +	{}
> +};
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
> +	pr_cont("(0x%08x) ", status);
> +}
> +
>  static int
>  nv84_graph_tlb_flush(struct nouveau_engine *engine)
>  {
> @@ -219,10 +275,21 @@ nv84_graph_tlb_flush(struct nouveau_engine *engine)
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
> +		nv_error(priv, "PGRAPH_VSTATUS: ");
> +		nouveau_pgraph_vstatus_print(nv50_pgraph_vstatus_0,
> +				nv_rd32(priv, 0x400380));
> +		nouveau_pgraph_vstatus_print(nv50_pgraph_vstatus_1,
> +				nv_rd32(priv, 0x400384));
> +		nouveau_pgraph_vstatus_print(nv50_pgraph_vstatus_2,
> +				nv_rd32(priv, 0x400388));
> +		pr_cont("\n");
>  	}
>  
>  	nv50_vm_flush_engine(&engine->base, 0x00);
> -- 


ping

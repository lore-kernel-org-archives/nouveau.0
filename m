From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] drm/nv50: fix typos in CCACHE error
 reporting
Date: Mon, 14 Feb 2011 11:26:16 +1000
Message-ID: <1297646780.2037.1.camel@nisroch>
References: <1297626403-3349-2-git-send-email-marcin.slusarz@gmail.com>
Reply-To: skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1297626403-3349-2-git-send-email-marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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

On Sun, 2011-02-13 at 20:46 +0100, Marcin Slusarz wrote:
> The code was supposed to print registers around 0x405018 (which is read
> earlier), not 0x405818.
Thanks, pushed.

Ben.

> 
> Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/gpu/drm/nouveau/nv50_graph.c |    8 ++++----
>  1 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nv50_graph.c b/drivers/gpu/drm/nouveau/nv50_graph.c
> index 37e21d2..c75cff1 100644
> --- a/drivers/gpu/drm/nouveau/nv50_graph.c
> +++ b/drivers/gpu/drm/nouveau/nv50_graph.c
> @@ -912,10 +912,10 @@ nv50_pgraph_trap_handler(struct drm_device *dev, u32 display, u64 inst, u32 chid
>  			printk("\n");
>  			NV_INFO(dev, "PGRAPH - TRAP_CCACHE %08x %08x %08x %08x"
>  				     " %08x %08x %08x\n",
> -				nv_rd32(dev, 0x405800), nv_rd32(dev, 0x405804),
> -				nv_rd32(dev, 0x405808), nv_rd32(dev, 0x40580c),
> -				nv_rd32(dev, 0x405810), nv_rd32(dev, 0x405814),
> -				nv_rd32(dev, 0x40581c));
> +				nv_rd32(dev, 0x405000), nv_rd32(dev, 0x405004),
> +				nv_rd32(dev, 0x405008), nv_rd32(dev, 0x40500c),
> +				nv_rd32(dev, 0x405010), nv_rd32(dev, 0x405014),
> +				nv_rd32(dev, 0x40501c));
>  
>  		}
>  

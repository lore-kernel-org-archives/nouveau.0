From: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau: remove set but unused variable.
Date: Wed, 1 Jan 2020 19:48:43 +0100
Message-ID: <20200101184843.GA3856@dvetter-linux.ger.corp.intel.com>
References: <20191231205607.1005-1-wambui.karugax@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20191231205607.1005-1-wambui.karugax-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Wambui Karuga <wambui.karugax-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: airlied-cv59FeDIM0c@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, daniel-/w4YWyX8dFk@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Tue, Dec 31, 2019 at 11:56:07PM +0300, Wambui Karuga wrote:
> The local variable `pclks` is defined and set but not used and can
> therefore be removed.
> Issue found by coccinelle.
> 
> Signed-off-by: Wambui Karuga <wambui.karugax-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/gpu/drm/nouveau/dispnv04/arb.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/dispnv04/arb.c b/drivers/gpu/drm/nouveau/dispnv04/arb.c
> index 362495535e69..f607a04d262d 100644
> --- a/drivers/gpu/drm/nouveau/dispnv04/arb.c
> +++ b/drivers/gpu/drm/nouveau/dispnv04/arb.c
> @@ -54,7 +54,7 @@ static void
>  nv04_calc_arb(struct nv_fifo_info *fifo, struct nv_sim_state *arb)
>  {
>  	int pagemiss, cas, width, bpp;
> -	int nvclks, mclks, pclks, crtpagemiss;
> +	int nvclks, mclks, crtpagemiss;

Hm, reading the code (just from how stuff is named) I wonder whether the
original idea was that the calculation for us_p should us pclks, not
nvclks, but given that this code is as old as the initial nouveau merge
probably not a good idea to touch it. Plus I guess not many with a vintage
nv04 in working condition around to even test stuff ...

Ben, what should we do here?
-Daniel

>  	int found, mclk_extra, mclk_loop, cbs, m1, p1;
>  	int mclk_freq, pclk_freq, nvclk_freq;
>  	int us_m, us_n, us_p, crtc_drain_rate;
> @@ -69,7 +69,6 @@ nv04_calc_arb(struct nv_fifo_info *fifo, struct nv_sim_state *arb)
>  	bpp = arb->bpp;
>  	cbs = 128;
>  
> -	pclks = 2;
>  	nvclks = 10;
>  	mclks = 13 + cas;
>  	mclk_extra = 3;
> -- 
> 2.17.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

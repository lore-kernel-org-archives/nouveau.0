From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau/clock: fix support for more than
 2 monitors on nve0
Date: Mon, 7 Jan 2013 13:53:40 +1000
Message-ID: <20130107035340.GA5401@turiel.bne.redhat.com>
References: <1357317553-30296-1-git-send-email-aleksi@torhamo.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1357317553-30296-1-git-send-email-aleksi-P/PbomOFYFrR7s880joybQ@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Aleksi Torhamo <aleksi-P/PbomOFYFrR7s880joybQ@public.gmane.org>, h@turiel.bne.redhat.com
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Fri, Jan 04, 2013 at 06:39:13PM +0200, Aleksi Torhamo wrote:
> Fixes regression introduced in commit 70790f4f
> "drm/nouveau/clock: pull in the implementation from all over the place"
> 
> When code was moved from nv50_crtc_set_clock to nvc0_clock_pll_set,
> the PLLs it is used for got limited to only the first two VPLLs.
> 
> nv50_crtc_set_clock was only called to change VPLLs, so it didn't
> limit what it was used for in any way. Since nvc0_clock_pll_set is
> used for all PLLs, it has to specify which PLLs the code is used for,
> and only listed the first two VPLLs.
Thanks, queued in nouveau's kernel tree.

> 
> Fixes: https://bugs.freedesktop.org/show_bug.cgi?id=58735
> 
> This patch is a -stable candidate for 3.7.
> 
> Signed-off-by: Aleksi Torhamo <aleksi-P/PbomOFYFrR7s880joybQ@public.gmane.org>
> Tested-by: Aleksi Torhamo <aleksi-P/PbomOFYFrR7s880joybQ@public.gmane.org>
> Tested-by: Sean Santos <quantheory-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> ---
>  .../gpu/drm/nouveau/core/include/subdev/bios/pll.h |    2 ++
>  drivers/gpu/drm/nouveau/core/subdev/clock/nvc0.c   |    2 ++
>  2 files changed, 4 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/core/include/subdev/bios/pll.h b/drivers/gpu/drm/nouveau/core/include/subdev/bios/pll.h
> index c345097..b2f3d4d 100644
> --- a/drivers/gpu/drm/nouveau/core/include/subdev/bios/pll.h
> +++ b/drivers/gpu/drm/nouveau/core/include/subdev/bios/pll.h
> @@ -38,6 +38,8 @@ enum nvbios_pll_type {
>  	PLL_UNK42  = 0x42,
>  	PLL_VPLL0  = 0x80,
>  	PLL_VPLL1  = 0x81,
> +	PLL_VPLL2  = 0x82,
> +	PLL_VPLL3  = 0x83,
>  	PLL_MAX    = 0xff
>  };
>  
> diff --git a/drivers/gpu/drm/nouveau/core/subdev/clock/nvc0.c b/drivers/gpu/drm/nouveau/core/subdev/clock/nvc0.c
> index f6962c9..7c96262 100644
> --- a/drivers/gpu/drm/nouveau/core/subdev/clock/nvc0.c
> +++ b/drivers/gpu/drm/nouveau/core/subdev/clock/nvc0.c
> @@ -52,6 +52,8 @@ nvc0_clock_pll_set(struct nouveau_clock *clk, u32 type, u32 freq)
>  	switch (info.type) {
>  	case PLL_VPLL0:
>  	case PLL_VPLL1:
> +	case PLL_VPLL2:
> +	case PLL_VPLL3:
>  		nv_mask(priv, info.reg + 0x0c, 0x00000000, 0x00000100);
>  		nv_wr32(priv, info.reg + 0x04, (P << 16) | (N << 8) | M);
>  		nv_wr32(priv, info.reg + 0x10, fN << 16);
> -- 
> 1.7.8.6
> 
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau

From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/1] nv50: improve nv50_pm_clock_get()
Date: Fri, 18 Mar 2011 22:04:09 +1000
Message-ID: <1300449860.2258.2.camel@nisroch>
References: <1300410948-12022-1-git-send-email-emil.l.velikov@gmail.com>
Reply-To: skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1300410948-12022-1-git-send-email-emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Fri, 2011-03-18 at 01:15 +0000, Emil Velikov wrote:
> On some cards the memory and/or shader pll can be switched off/disabled
> Check and return the linked/standart clock
> 
> Signed-off-by: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/gpu/drm/nouveau/nv50_pm.c |   13 +++++++++++++
>  1 files changed, 13 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nv50_pm.c b/drivers/gpu/drm/nouveau/nv50_pm.c
> index 7dbb305..c01a64f 100644
> --- a/drivers/gpu/drm/nouveau/nv50_pm.c
> +++ b/drivers/gpu/drm/nouveau/nv50_pm.c
> @@ -47,6 +47,19 @@ nv50_pm_clock_get(struct drm_device *dev, u32 id)
>  
>  	reg0 = nv_rd32(dev, pll.reg + 0);
>  	reg1 = nv_rd32(dev, pll.reg + 4);
> +
> +	if ((reg0 & 0x80000000) == 0) {
> +		if (id == PLL_SHADER) {
> +			NV_INFO(dev, "Shader PLL appears to be OFF\n");
> +			ret = nv50_pm_clock_get(dev, PLL_CORE);
> +			if (ret > 0)
> +				return ret*2;
This seems somewhat OK, from what I recall seeing.  Have you seen any
definite evidence to suggest that the shaders actually run at double the
core clock if the PLL is "off"?

> +		} else if (id == PLL_MEMORY) {
> +			NV_INFO(dev, "Memory PLL appears to be OFF\n");
> +			return 100*1000;
This, is more dubious.  Are you trying to indicate that it's running at
the reference clock?  Or always at a fixed 100MHz?

Ben.
> +		}
> +	}
> +
>  	P = (reg0 & 0x00070000) >> 16;
>  	N = (reg1 & 0x0000ff00) >> 8;
>  	M = (reg1 & 0x000000ff);

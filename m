From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm/nv41/pm: Write to correct registers on
 nv41_fan_set()
Date: Fri, 05 Aug 2011 09:08:57 +1000
Message-ID: <1312499341.2147.1.camel@nisroch>
References: <1312482164-11599-1-git-send-email-emil.l.velikov@gmail.com>
Reply-To: skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1312482164-11599-1-git-send-email-emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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

On Thu, 2011-08-04 at 19:22 +0100, Emil Velikov wrote:
> Signed-off-by: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/gpu/drm/nouveau/nv40_pm.c |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
Oops, copy+pasto probably.  I just rebased nouveau git onto 3.0-final,
and squashed the fix into the original commit.

Ben.
> 
> diff --git a/drivers/gpu/drm/nouveau/nv40_pm.c b/drivers/gpu/drm/nouveau/nv40_pm.c
> index c5ad31c..aa9fded 100644
> --- a/drivers/gpu/drm/nouveau/nv40_pm.c
> +++ b/drivers/gpu/drm/nouveau/nv40_pm.c
> @@ -380,7 +380,7 @@ nv41_pm_fanspeed_set(struct drm_device *dev, int percent)
>  	u32 divs = pm->pwm_divisor;
>  	u32 duty = ((100 - percent) * divs) / 100;
>  
> -	nv_wr32(dev, 0x0010f8, divs);
> -	nv_wr32(dev, 0x0010f4, duty | 0x80000000);
> +	nv_wr32(dev, 0x0015f8, divs);
> +	nv_wr32(dev, 0x0015f4, duty | 0x80000000);
>  	return 0;
>  }

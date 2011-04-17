From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm/nvc0/pm: read core/shader/memory clocks
 (more) correctly
Date: Mon, 18 Apr 2011 08:32:39 +1000
Message-ID: <1303079563.13003.1.camel@nisroch>
References: <1303053035-25716-1-git-send-email-martin.peres@free.fr>
Reply-To: skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1303053035-25716-1-git-send-email-martin.peres-GANU6spQydw@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Sun, 2011-04-17 at 17:10 +0200, Martin Peres wrote:
> ---
>  drivers/gpu/drm/nouveau/nouveau_perf.c |    6 +++---
>  1 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_perf.c b/drivers/gpu/drm/nouveau/nouveau_perf.c
> index 950caba..d64a98a 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_perf.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_perf.c
> @@ -177,9 +177,9 @@ nouveau_perf_init(struct drm_device *dev)
>  #define subent(n) entry[perf[2] + ((n) * perf[3])]
>  			perflvl->fanspeed = 0; /*XXX*/
>  			perflvl->voltage = entry[2];
> -			perflvl->core = (ROM16(subent(0)) & 0xfff) * 1000;
> -			perflvl->shader = (ROM16(subent(1)) & 0xfff) * 1000;
> -			perflvl->memory = (ROM16(subent(2)) & 0xfff) * 1000;
> +			perflvl->core = (ROM16(subent(3)) & 0xfff) * 1000;
> +			perflvl->shader = (ROM16(subent(3)) & 0xfff) / 2 * 1000;
> +			perflvl->memory = (ROM16(subent(5)) & 0xfff) * 1000;
Um, NACK.  This is *definitely* very very wrong on NVA8, which uses
version 0x40 of this table too.

Ben.

>  			break;
>  		}
>  

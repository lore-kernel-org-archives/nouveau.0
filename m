From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/1] nv30: Fix parsing of perf table
Date: Sat, 19 Mar 2011 11:40:30 +1000
Message-ID: <1300498838.2258.7.camel@nisroch>
References: <1300449733.2258.0.camel@nisroch>
	<1300479593-15388-1-git-send-email-emil.l.velikov@gmail.com>
Reply-To: skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1300479593-15388-1-git-send-email-emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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

On Fri, 2011-03-18 at 20:19 +0000, Emil Velikov wrote:
> Perf tables v 1.2 and 1.3 (seen on Geforce FX/ 5) are not long enough to store the voltage label/id
> 
> v2 - Remove comment from the code
Thank you :)

Pushed, with the log message line split to fit into 80 chars.

Ben.
> 
> Signed-off-by: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/gpu/drm/nouveau/nouveau_perf.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_perf.c b/drivers/gpu/drm/nouveau/nouveau_perf.c
> index ac62a1b..670e3cb 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_perf.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_perf.c
> @@ -134,7 +134,7 @@ nouveau_perf_init(struct drm_device *dev)
>  		case 0x13:
>  		case 0x15:
>  			perflvl->fanspeed = entry[55];
> -			perflvl->voltage = entry[56];
> +			perflvl->voltage = (recordlen > 56) ? entry[56] : 0;
>  			perflvl->core = ROM32(entry[1]) * 10;
>  			perflvl->memory = ROM32(entry[5]) * 20;
>  			break;

From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau/pm: Prevent overflow in
 nouveau_perf_init()
Date: Thu, 16 Jun 2011 13:43:59 +1000
Message-ID: <1308195843.3446.0.camel@nisroch>
References: <1307795432-5417-1-git-send-email-emil.l.velikov@gmail.com>
Reply-To: skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1307795432-5417-1-git-send-email-emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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

On Sat, 2011-06-11 at 13:30 +0100, Emil Velikov wrote:
> While parsing the perf table, there is no check if
> the num of entries read from the vbios is less than
> the currently allocated number.
> 
> In case of a buggy vbios this will cause overwriting
> of kernel memory, causing aditional problems.
> 
> Add a simple check in order to prevent the case
I've pushed this.  I'm not entirely certain we shouldn't just bail out
completely if this is the case, I suspect that if there's this many, the
VBIOS image is probably very screwed.

This'll do for now :)

Ben.
> 
> Signed-off-by: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/gpu/drm/nouveau/nouveau_perf.c |    5 +++++
>  1 files changed, 5 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_perf.c b/drivers/gpu/drm/nouveau/nouveau_perf.c
> index f2d98c9..b0e995f 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_perf.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_perf.c
> @@ -225,6 +225,11 @@ nouveau_perf_init(struct drm_device *dev)
>  		entries   = perf[2];
>  	}
>  
> +	if (entries > NOUVEAU_PM_MAX_LEVEL) {
> +		NV_DEBUG(dev, "perf table has too many entries - buggy vbios?\n");
> +		entries = NOUVEAU_PM_MAX_LEVEL;
> +	}
> +
>  	entry = perf + headerlen;
>  	for (i = 0; i < entries; i++) {
>  		struct nouveau_pm_level *perflvl = &pm->perflvl[pm->nr_perflvl];

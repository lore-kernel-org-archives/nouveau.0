From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau: fix pm initialization order
Date: Wed, 26 Sep 2012 11:09:03 +1000
Message-ID: <20120926010903.GB17068@turiel.bne.redhat.com>
References: <1348554700-7137-1-git-send-email-dmitry_eremin@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1348554700-7137-1-git-send-email-dmitry_eremin-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Dmitry Eremin-Solenikov <dmitry_eremin-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Tue, Sep 25, 2012 at 10:31:40AM +0400, Dmitry Eremin-Solenikov wrote:
> If nouveau_pm_perflvl_get() fails, pm->profiles list will be left
> uninitialized, which causes oops during nouveau_pm_fini().
> 
> Move INIT_LIST_HEAD before call to nouveau_pm_perflvl_get().
Pushed, thanks!

> 
> Signed-off-by: Dmitry Eremin-Solenikov <dmitry_eremin-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/gpu/drm/nouveau/nouveau_pm.c |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_pm.c b/drivers/gpu/drm/nouveau/nouveau_pm.c
> index 3c55ec2..d2f2de6 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_pm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_pm.c
> @@ -916,6 +916,8 @@ nouveau_pm_init(struct drm_device *dev)
>  	nouveau_volt_init(dev);
>  	nouveau_temp_init(dev);
>  
> +	INIT_LIST_HEAD(&pm->profiles);
> +
>  	/* determine current ("boot") performance level */
>  	ret = nouveau_pm_perflvl_get(dev, &pm->boot);
>  	if (ret) {
> @@ -927,7 +929,6 @@ nouveau_pm_init(struct drm_device *dev)
>  	strncpy(pm->boot.profile.name, "boot", 4);
>  	pm->boot.profile.func = &nouveau_pm_static_profile_func;
>  
> -	INIT_LIST_HEAD(&pm->profiles);
>  	list_add(&pm->boot.profile.head, &pm->profiles);
>  
>  	pm->profile_ac = &pm->boot.profile;
> -- 
> 1.7.10.4
> 
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau

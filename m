From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau: remove >1 sclass support from
 nouveau_parent_create_
Date: Mon, 8 Oct 2012 11:06:46 +1000
Message-ID: <20121008010646.GB4197@turiel.bne.redhat.com>
References: <1349650171-25045-4-git-send-email-marcin.slusarz@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1349650171-25045-4-git-send-email-marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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

On Mon, Oct 08, 2012 at 12:49:30AM +0200, Marcin Slusarz wrote:
> It's unused (only one codepath passes sclass at all and it's always one),
> broken (overwrites the same field, leaking previous one) and confusing.
It's only *currently* unused, I have WIP code in branches that uses it,
otherwise it wouldn't still exist :)

I will take a look today at the claims it's broken, it wasn't at some
point but may have got busted along the way somehow.

Thanks!
Ben.

> 
> Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/gpu/drm/nouveau/core/core/client.c           | 2 +-
>  drivers/gpu/drm/nouveau/core/core/parent.c           | 3 +--
>  drivers/gpu/drm/nouveau/core/include/subdev/device.h | 2 +-
>  drivers/gpu/drm/nouveau/core/subdev/device/base.c    | 6 +++---
>  4 files changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/core/core/client.c b/drivers/gpu/drm/nouveau/core/core/client.c
> index c617f04..87850ec 100644
> --- a/drivers/gpu/drm/nouveau/core/core/client.c
> +++ b/drivers/gpu/drm/nouveau/core/core/client.c
> @@ -58,7 +58,7 @@ nouveau_client_create_(const char *name, u64 devname, const char *cfg,
>  		return -ENODEV;
>  
>  	ret = nouveau_namedb_create_(NULL, NULL, &nouveau_client_oclass,
> -				     NV_CLIENT_CLASS, nouveau_device_sclass,
> +				     NV_CLIENT_CLASS, &nouveau_device_sclass,
>  				     0, length, pobject);
>  	client = *pobject;
>  	if (ret)
> diff --git a/drivers/gpu/drm/nouveau/core/core/parent.c b/drivers/gpu/drm/nouveau/core/core/parent.c
> index 0e7733c..1a48e58 100644
> --- a/drivers/gpu/drm/nouveau/core/core/parent.c
> +++ b/drivers/gpu/drm/nouveau/core/core/parent.c
> @@ -85,7 +85,7 @@ nouveau_parent_create_(struct nouveau_object *parent,
>  	if (ret)
>  		return ret;
>  
> -	while (sclass && sclass->ofuncs) {
> +	if (sclass && sclass->ofuncs) {
>  		nclass = kzalloc(sizeof(*nclass), GFP_KERNEL);
>  		if (!nclass)
>  			return -ENOMEM;
> @@ -94,7 +94,6 @@ nouveau_parent_create_(struct nouveau_object *parent,
>  		object->sclass = nclass;
>  		nclass->engine = engine ? nv_engine(engine) : NULL;
>  		nclass->oclass = sclass;
> -		sclass++;
>  	}
>  
>  	object->engine = engcls;
> diff --git a/drivers/gpu/drm/nouveau/core/include/subdev/device.h b/drivers/gpu/drm/nouveau/core/include/subdev/device.h
> index c9e4c4a..0966f33 100644
> --- a/drivers/gpu/drm/nouveau/core/include/subdev/device.h
> +++ b/drivers/gpu/drm/nouveau/core/include/subdev/device.h
> @@ -18,7 +18,7 @@ int nv50_identify(struct nouveau_device *);
>  int nvc0_identify(struct nouveau_device *);
>  int nve0_identify(struct nouveau_device *);
>  
> -extern struct nouveau_oclass nouveau_device_sclass[];
> +extern struct nouveau_oclass nouveau_device_sclass;
>  struct nouveau_device *nouveau_device_find(u64 name);
>  
>  #endif
> diff --git a/drivers/gpu/drm/nouveau/core/subdev/device/base.c b/drivers/gpu/drm/nouveau/core/subdev/device/base.c
> index 2cec8a8..352a940 100644
> --- a/drivers/gpu/drm/nouveau/core/subdev/device/base.c
> +++ b/drivers/gpu/drm/nouveau/core/subdev/device/base.c
> @@ -409,9 +409,9 @@ nouveau_devobj_ofuncs = {
>   * nouveau_device: engine functions
>   *****************************************************************************/
>  struct nouveau_oclass
> -nouveau_device_sclass[] = {
> -	{ 0x0080, &nouveau_devobj_ofuncs },
> -	{}
> +nouveau_device_sclass = {
> +	.handle = 0x0080,
> +	.ofuncs = &nouveau_devobj_ofuncs,
>  };
>  
>  static void
> -- 
> 1.7.12
> 
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau

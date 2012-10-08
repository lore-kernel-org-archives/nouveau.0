From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau: fix error handling in core/core
 object creation functions
Date: Mon, 8 Oct 2012 11:05:33 +1000
Message-ID: <20121008010533.GA4197@turiel.bne.redhat.com>
References: <1349650171-25045-5-git-send-email-marcin.slusarz@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1349650171-25045-5-git-send-email-marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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

On Mon, Oct 08, 2012 at 12:49:31AM +0200, Marcin Slusarz wrote:
> Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
> This patch relies on "drm/nouveau: remove >1 sclass support from nouveau_parent_create_".
> 
> There are *many* *more* code paths without proper error handling -
This is *not* a bug.  An object's constructor should be called via
nouveau_object_ctor(), which has the semantics that the constructor
returns and error *and* a pointer returned via pobject, then the
class's destructor will be called to cleanup.

Ben.

> I counted
> at least 106 in 41 functions. If someone would like to do a bit of janitorial
> work I marked those code paths and uploaded "patch" here:
> http://people.freedesktop.org/~mslusarz/0001-codepaths-without-error-handling.patch
> (Please let me know if you are going to fix those to not duplicate work)
> ---
>  drivers/gpu/drm/nouveau/core/core/engine.c | 1 +
>  drivers/gpu/drm/nouveau/core/core/gpuobj.c | 9 ++++++---
>  drivers/gpu/drm/nouveau/core/core/parent.c | 4 +++-
>  3 files changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/core/core/engine.c b/drivers/gpu/drm/nouveau/core/core/engine.c
> index 09b3bd5..4319854 100644
> --- a/drivers/gpu/drm/nouveau/core/core/engine.c
> +++ b/drivers/gpu/drm/nouveau/core/core/engine.c
> @@ -44,6 +44,7 @@ nouveau_engine_create_(struct nouveau_object *parent,
>  		return ret;
>  
>  	if (!nouveau_boolopt(device->cfgopt, iname, enable)) {
> +		nouveau_subdev_destroy(&engine->base);
>  		if (!enable)
>  			nv_warn(engine, "disabled, %s=1 to enable\n", iname);
>  		return -ENODEV;
> diff --git a/drivers/gpu/drm/nouveau/core/core/gpuobj.c b/drivers/gpu/drm/nouveau/core/core/gpuobj.c
> index c2a7608..6254d52 100644
> --- a/drivers/gpu/drm/nouveau/core/core/gpuobj.c
> +++ b/drivers/gpu/drm/nouveau/core/core/gpuobj.c
> @@ -40,7 +40,7 @@ nouveau_gpuobj_destroy(struct nouveau_gpuobj *gpuobj)
>  	}
>  
>  	if (gpuobj->heap.block_size)
> -		nouveau_mm_fini(&gpuobj->heap);
> +		WARN_ON(nouveau_mm_fini(&gpuobj->heap));
>  
>  	nouveau_object_destroy(&gpuobj->base);
>  }
> @@ -113,7 +113,7 @@ nouveau_gpuobj_create_(struct nouveau_object *parent,
>  		ret = nouveau_mm_head(heap, 1, size, size,
>  				      max(align, (u32)1), &gpuobj->node);
>  		if (ret)
> -			return ret;
> +			goto err;
>  
>  		gpuobj->addr += gpuobj->node->offset;
>  	}
> @@ -121,7 +121,7 @@ nouveau_gpuobj_create_(struct nouveau_object *parent,
>  	if (gpuobj->flags & NVOBJ_FLAG_HEAP) {
>  		ret = nouveau_mm_init(&gpuobj->heap, 0, gpuobj->size, 1);
>  		if (ret)
> -			return ret;
> +			goto err;
>  	}
>  
>  	if (flags & NVOBJ_FLAG_ZERO_ALLOC) {
> @@ -130,6 +130,9 @@ nouveau_gpuobj_create_(struct nouveau_object *parent,
>  	}
>  
>  	return ret;
> +err:
> +	nouveau_gpuobj_destroy(gpuobj);
> +	return ret;
>  }
>  
>  struct nouveau_gpuobj_class {
> diff --git a/drivers/gpu/drm/nouveau/core/core/parent.c b/drivers/gpu/drm/nouveau/core/core/parent.c
> index 1a48e58..d2ea7c2 100644
> --- a/drivers/gpu/drm/nouveau/core/core/parent.c
> +++ b/drivers/gpu/drm/nouveau/core/core/parent.c
> @@ -87,8 +87,10 @@ nouveau_parent_create_(struct nouveau_object *parent,
>  
>  	if (sclass && sclass->ofuncs) {
>  		nclass = kzalloc(sizeof(*nclass), GFP_KERNEL);
> -		if (!nclass)
> +		if (!nclass) {
> +			nouveau_parent_destroy(object);
>  			return -ENOMEM;
> +		}
>  
>  		nclass->sclass = object->sclass;
>  		object->sclass = nclass;
> -- 
> 1.7.12
> 
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau

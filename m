From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 09/10] drm/nv50/evo: store iomem pointer in
 properly typed field
Date: Mon, 20 Aug 2012 16:32:11 +1000
Message-ID: <20120820063211.GE2013@nisroch.redhat.com>
References: <1345410004-27729-9-git-send-email-marcin.slusarz@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1345410004-27729-9-git-send-email-marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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

On Sun, Aug 19, 2012 at 11:00:04PM +0200, Marcin Slusarz wrote:
> Abuse of function pointer was noticed by sparse.
I'm aware of this horror, however I didn't apply the patch.  I have work in
progress that'll get rid of this nasty stuff before the tree goes upstream,
doing it this way was a quick hack to keep things working and be able to
push the tree until it's ready.

> 
> Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/gpu/drm/nouveau/nv50_evo.c |   18 ++++++++++++------
>  1 files changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nv50_evo.c b/drivers/gpu/drm/nouveau/nv50_evo.c
> index 0f53416..0483cbd 100644
> --- a/drivers/gpu/drm/nouveau/nv50_evo.c
> +++ b/drivers/gpu/drm/nouveau/nv50_evo.c
> @@ -33,17 +33,22 @@
>  #include <subdev/timer.h>
>  #include <subdev/fb.h>
>  
> +struct evo_object {
> +	struct nouveau_object parent;
> +	void __iomem *iomem;
> +};
> +
>  static u32
>  nv50_evo_rd32(struct nouveau_object *object, u32 addr)
>  {
> -	void __iomem *iomem = object->oclass->ofuncs->rd08;
> +	void __iomem *iomem = ((struct evo_object *)object)->iomem;
>  	return ioread32_native(iomem + addr);
>  }
>  
>  static void
>  nv50_evo_wr32(struct nouveau_object *object, u32 addr, u32 data)
>  {
> -	void __iomem *iomem = object->oclass->ofuncs->rd08;
> +	void __iomem *iomem = ((struct evo_object *)object)->iomem;
>  	iowrite32_native(data, iomem + addr);
>  }
>  
> @@ -60,7 +65,7 @@ nv50_evo_channel_del(struct nouveau_channel **pevo)
>  	nouveau_bo_ref(NULL, &evo->push.buffer);
>  
>  	if (evo->object)
> -		iounmap(evo->object->oclass->ofuncs);
> +		iounmap(((struct evo_object *)evo->object)->iomem);
>  
>  	kfree(evo);
>  }
> @@ -112,6 +117,7 @@ nv50_evo_channel_new(struct drm_device *dev, int chid,
>  	struct nouveau_drm *drm = nouveau_drm(dev);
>  	struct nv50_display *disp = nv50_display(dev);
>  	struct nouveau_channel *evo;
> +	struct evo_object *evo_object;
>  	int ret;
>  
>  	evo = kzalloc(sizeof(struct nouveau_channel), GFP_KERNEL);
> @@ -142,7 +148,8 @@ nv50_evo_channel_new(struct drm_device *dev, int chid,
>  		return ret;
>  	}
>  
> -	evo->object = kzalloc(sizeof(*evo->object), GFP_KERNEL);
> +	evo_object = kzalloc(sizeof(*evo_object), GFP_KERNEL);
> +	evo->object = &evo_object->parent;
>  #ifdef NOUVEAU_OBJECT_MAGIC
>  	evo->object->_magic = NOUVEAU_OBJECT_MAGIC;
>  #endif
> @@ -154,8 +161,7 @@ nv50_evo_channel_new(struct drm_device *dev, int chid,
>  		kzalloc(sizeof(*evo->object->oclass->ofuncs), GFP_KERNEL);
>  	evo->object->oclass->ofuncs->rd32 = nv50_evo_rd32;
>  	evo->object->oclass->ofuncs->wr32 = nv50_evo_wr32;
> -	evo->object->oclass->ofuncs->rd08 =
> -		ioremap(pci_resource_start(dev->pdev, 0) +
> +	evo_object->iomem = ioremap(pci_resource_start(dev->pdev, 0) +
>  			NV50_PDISPLAY_USER(evo->handle), PAGE_SIZE);
>  	return 0;
>  }
> -- 
> 1.7.8.6
> 
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau

From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau: comment out unused
 _nouveau_parent_ctor
Date: Mon, 8 Oct 2012 11:07:34 +1000
Message-ID: <20121008010734.GC4197@turiel.bne.redhat.com>
References: <1349650171-25045-2-git-send-email-marcin.slusarz@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1349650171-25045-2-git-send-email-marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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

On Mon, Oct 08, 2012 at 12:49:28AM +0200, Marcin Slusarz wrote:
> Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/gpu/drm/nouveau/core/core/parent.c         | 2 ++
>  drivers/gpu/drm/nouveau/core/include/core/parent.h | 3 +++
>  2 files changed, 5 insertions(+)
Feel free to just kill it completely.  There's a few bits and pieces
of left-overs like this around the place, I'll be killing them as
I run across them too.

What do you think?

Ben.

> 
> diff --git a/drivers/gpu/drm/nouveau/core/core/parent.c b/drivers/gpu/drm/nouveau/core/core/parent.c
> index a1ea034..0e7733c 100644
> --- a/drivers/gpu/drm/nouveau/core/core/parent.c
> +++ b/drivers/gpu/drm/nouveau/core/core/parent.c
> @@ -101,6 +101,7 @@ nouveau_parent_create_(struct nouveau_object *parent,
>  	return 0;
>  }
>  
> +#if 0
>  int
>  _nouveau_parent_ctor(struct nouveau_object *parent,
>  		     struct nouveau_object *engine,
> @@ -117,6 +118,7 @@ _nouveau_parent_ctor(struct nouveau_object *parent,
>  
>  	return 0;
>  }
> +#endif
>  
>  void
>  nouveau_parent_destroy(struct nouveau_parent *parent)
> diff --git a/drivers/gpu/drm/nouveau/core/include/core/parent.h b/drivers/gpu/drm/nouveau/core/include/core/parent.h
> index d3aa251..58bf6b5 100644
> --- a/drivers/gpu/drm/nouveau/core/include/core/parent.h
> +++ b/drivers/gpu/drm/nouveau/core/include/core/parent.h
> @@ -50,9 +50,12 @@ int  nouveau_parent_create_(struct nouveau_object *, struct nouveau_object *,
>  			    int size, void **);
>  void nouveau_parent_destroy(struct nouveau_parent *);
>  
> +#if 0
>  int  _nouveau_parent_ctor(struct nouveau_object *, struct nouveau_object *,
>  			  struct nouveau_oclass *, void *, u32,
>  			  struct nouveau_object **);
> +#endif
> +
>  void _nouveau_parent_dtor(struct nouveau_object *);
>  #define _nouveau_parent_init _nouveau_object_init
>  #define _nouveau_parent_fini _nouveau_object_fini
> -- 
> 1.7.12
> 
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau

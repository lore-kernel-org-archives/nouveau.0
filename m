From: Ronald <ronald645-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau: fix TTM_PL_TT memtype on pre-nv50
Date: Sun, 16 Feb 2014 10:29:40 +0100
Message-ID: <CAF1_xX3ut-eqERupeS6faq_ADOBszgB0THcK+iG2tetApqvGYg@mail.gmail.com>
References: <1392524821-10358-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1392524821-10358-1-git-send-email-imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Maarten Lankhorst <maarten.lankhorst-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

2014-02-16 5:27 GMT+01:00 Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>:
> Commit a55409066 ("drm/nv50-: map TTM_PL_SYSTEM through a BAR for CPU
> access") made it possible to work with tiled memory. However
> mem->mm_node is not a nouveau_mem for AGP-using pre-NV50 cards, but a
> drm_mm_node, as created by the ttm_bo_manager_func. As such, extend the
> untiled check to explicitly include all pre-nv50 cards.
>
> Reported-by: Ronald <ronald645-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Bugzilla: https://bugs.freedesktop.org/show_bug.cgi?id=74613
> Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
> ---

Tested-by: Ronald Uitermark <ronald645-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

> Hmmm... this seems like a really fragile semantic, I wonder if more
> mem->mm_node usages have to be audited. But this one's quick and easy. I'd
> rather see something a little more solid around dealing with these
> differences, but not sure how without reading all the ttm gunk. Perhaps just
> make sure it's always a nouveau_mem by wrapping the ttm_bo_manager logic?
>
>  drivers/gpu/drm/nouveau/nouveau_bo.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
> index 488686d..4aed171 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> @@ -1249,7 +1249,7 @@ nouveau_ttm_io_mem_reserve(struct ttm_bo_device *bdev, struct ttm_mem_reg *mem)
>                         mem->bus.is_iomem = !dev->agp->cant_use_aperture;
>                 }
>  #endif
> -               if (!node->memtype)
> +               if (nv_device(drm->device)->card_type < NV_50 || !node->memtype)
>                         /* untiled */
>                         break;
>                 /* fallthrough, tiled memory */
> --
> 1.8.3.2
>

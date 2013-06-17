From: Ben Skeggs <skeggsb@gmail.com>
Subject: Re: [PATCH] drm/nouveau: remove limit on gart
Date: Tue, 18 Jun 2013 09:48:31 +1000
Message-ID: <CACAvsv6zG797_VsMDBedmM8xgYEj9OvLJAVqX9JGuhEcQ8ZWBw@mail.gmail.com>
References: <51BF0A75.5080803@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <51BF0A75.5080803@canonical.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Maarten Lankhorst <maarten.lankhorst@canonical.com>
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

On Mon, Jun 17, 2013 at 11:09 PM, Maarten Lankhorst
<maarten.lankhorst@canonical.com> wrote:
> Most graphics cards nowadays have a multiple of this limit as their vram, so
> limiting GART doesn't seem to make much sense.
Pushed, thanks :)

>
> Signed-off-by: Maarten >Lnkhorst <maarten.lankhorst@canonical.com>
> ---
> diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c b/drivers/gpu/drm/nouveau/nouveau_ttm.c
> index 3a5e19a..41ddecd 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_ttm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_ttm.c
> @@ -168,9 +168,6 @@ nouveau_gart_manager_new(struct ttm_mem_type_manager *man,
>         struct nouveau_bo *nvbo = nouveau_bo(bo);
>         struct nouveau_mem *node;
>
> -       if (unlikely((mem->num_pages << PAGE_SHIFT) >= 512 * 1024 * 1024))
> -               return -ENOMEM;
> -
>         node = kzalloc(sizeof(*node), GFP_KERNEL);
>         if (!node)
>                 return -ENOMEM;
> @@ -406,8 +403,6 @@ nouveau_ttm_init(struct nouveau_drm *drm)
>         /* GART init */
>         if (drm->agp.stat != ENABLED) {
>                 drm->gem.gart_available = nouveau_vmmgr(drm->device)->limit;
> -               if (drm->gem.gart_available > 512 * 1024 * 1024)
> -                       drm->gem.gart_available = 512 * 1024 * 1024;
>         } else {
>                 drm->gem.gart_available = drm->agp.size;
>         }
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel

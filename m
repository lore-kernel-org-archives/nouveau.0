From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: Re: [PATCH 2/2] drm/mediatek: Use struct dma_buf_map in GEM vmap ops
Date: Wed, 11 Nov 2020 22:23:15 +0800
Message-ID: <CAAOTY__QuyEA7c4H+eSvrSdFTZttB4DXbjr6HLWoH8WovOD1eQ@mail.gmail.com>
References: <20201109103242.19544-1-tzimmermann@suse.de> <20201109103242.19544-3-tzimmermann@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20201109103242.19544-3-tzimmermann@suse.de>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, robdclark@gmail.com, sean@poorly.run, linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, DRI Development <dri-devel@lists.freedesktop.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Dave Airlie <airlied@redhat.com>, Lucas Stach <l.stach@pengutronix.de>, Russell King <linux+etnaviv@armlinux.org.uk>, Christian Gmeiner <christian.gmeiner@gmail.com>, Qiang Yu <yuq825@gmail.com>, Ben Skeggs <bskeggs@redhat.com>, Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Steven
List-Id: nouveau.vger.kernel.org

Hi, Thomas:

Thomas Zimmermann <tzimmermann@suse.de> =E6=96=BC 2020=E5=B9=B411=E6=9C=889=
=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=886:32=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> Fixes a build failure with mediatek.
>
> This change was supposed to be part of commit 49a3f51dfeee ("drm/gem:
> Use struct dma_buf_map in GEM vmap ops and convert GEM backends"), but
> mediatek was forgotten.

Acked-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 49a3f51dfeee ("drm/gem: Use struct dma_buf_map in GEM vmap ops and=
 convert GEM backends")
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Russell King <linux+etnaviv@armlinux.org.uk>
> Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
> Cc: Qiang Yu <yuq825@gmail.com>
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> Cc: Steven Price <steven.price@arm.com>
> Cc: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: Sandy Huang <hjc@rock-chips.com>
> Cc: "Heiko St=C3=BCbner" <heiko@sntech.de>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Eric Anholt <eric@anholt.net>
> Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> Cc: Melissa Wen <melissa.srw@gmail.com>
> Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
> Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: Emil Velikov <emil.velikov@collabora.com>
> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> Cc: Arunpravin <apaneers@amd.com>
> Cc: Huang Rui <ray.huang@amd.com>
> Cc: Luben Tuikov <luben.tuikov@amd.com>
> Cc: Madhav Chauhan <madhav.chauhan@amd.com>
> Cc: Nirmoy Das <Nirmoy.Das@amd.com>
> Cc: Jason Gunthorpe <jgg@ziepe.ca>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: dri-devel@lists.freedesktop.org
> Cc: etnaviv@lists.freedesktop.org
> Cc: lima@lists.freedesktop.org
> Cc: nouveau@lists.freedesktop.org
> Cc: virtualization@lists.linux-foundation.org
> Cc: spice-devel@lists.freedesktop.org
> Cc: amd-gfx@lists.freedesktop.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-rockchip@lists.infradead.org
> Cc: xen-devel@lists.xenproject.org
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_gem.c | 20 ++++++++++++--------
>  drivers/gpu/drm/mediatek/mtk_drm_gem.h |  4 ++--
>  2 files changed, 14 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.c b/drivers/gpu/drm/med=
iatek/mtk_drm_gem.c
> index cdd1a6e61564..28a2ee1336ef 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_gem.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
> @@ -240,23 +240,25 @@ struct drm_gem_object *mtk_gem_prime_import_sg_tabl=
e(struct drm_device *dev,
>         return &mtk_gem->base;
>  }
>
> -void *mtk_drm_gem_prime_vmap(struct drm_gem_object *obj)
> +int mtk_drm_gem_prime_vmap(struct drm_gem_object *obj, struct dma_buf_ma=
p *map)
>  {
>         struct mtk_drm_gem_obj *mtk_gem =3D to_mtk_gem_obj(obj);
> -       struct sg_table *sgt;
> +       struct sg_table *sgt =3D NULL;
>         unsigned int npages;
>
>         if (mtk_gem->kvaddr)
> -               return mtk_gem->kvaddr;
> +               goto out;
>
>         sgt =3D mtk_gem_prime_get_sg_table(obj);
>         if (IS_ERR(sgt))
> -               return NULL;
> +               return PTR_ERR(sgt);
>
>         npages =3D obj->size >> PAGE_SHIFT;
>         mtk_gem->pages =3D kcalloc(npages, sizeof(*mtk_gem->pages), GFP_K=
ERNEL);
> -       if (!mtk_gem->pages)
> -               goto out;
> +       if (!mtk_gem->pages) {
> +               kfree(sgt);
> +               return -ENOMEM;
> +       }
>
>         drm_prime_sg_to_page_addr_arrays(sgt, mtk_gem->pages, NULL, npage=
s);
>
> @@ -265,13 +267,15 @@ void *mtk_drm_gem_prime_vmap(struct drm_gem_object =
*obj)
>
>  out:
>         kfree(sgt);
> +       dma_buf_map_set_vaddr(map, mtk_gem->kvaddr);
>
> -       return mtk_gem->kvaddr;
> +       return 0;
>  }
>
> -void mtk_drm_gem_prime_vunmap(struct drm_gem_object *obj, void *vaddr)
> +void mtk_drm_gem_prime_vunmap(struct drm_gem_object *obj, struct dma_buf=
_map *map)
>  {
>         struct mtk_drm_gem_obj *mtk_gem =3D to_mtk_gem_obj(obj);
> +       void *vaddr =3D map->vaddr;
>
>         if (!mtk_gem->pages)
>                 return;
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.h b/drivers/gpu/drm/med=
iatek/mtk_drm_gem.h
> index ff9f976d9807..6da5ccb4b933 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_gem.h
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_gem.h
> @@ -45,7 +45,7 @@ int mtk_drm_gem_mmap_buf(struct drm_gem_object *obj,
>  struct sg_table *mtk_gem_prime_get_sg_table(struct drm_gem_object *obj);
>  struct drm_gem_object *mtk_gem_prime_import_sg_table(struct drm_device *=
dev,
>                         struct dma_buf_attachment *attach, struct sg_tabl=
e *sg);
> -void *mtk_drm_gem_prime_vmap(struct drm_gem_object *obj);
> -void mtk_drm_gem_prime_vunmap(struct drm_gem_object *obj, void *vaddr);
> +int mtk_drm_gem_prime_vmap(struct drm_gem_object *obj, struct dma_buf_ma=
p *map);
> +void mtk_drm_gem_prime_vunmap(struct drm_gem_object *obj, struct dma_buf=
_map *map);
>
>  #endif
> --
> 2.29.2
>

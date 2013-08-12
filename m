From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: Re: [Nouveau] [PATCH] drm/nouveau: fix ltcg memory initialization
	after suspend
Date: Mon, 12 Aug 2013 12:19:15 -0400
Message-ID: <CAKb7UvgddSoPofO4pHoFjp74oWErxHWK=JTykvJ4JkpiCxoLWg@mail.gmail.com>
References: <5208BC6D.6040808@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <5208BC6D.6040808@canonical.com>
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

On Mon, Aug 12, 2013 at 6:43 AM, Maarten Lankhorst
<maarten.lankhorst@canonical.com> wrote:
> Some registers were not initialized in init, this causes them to be
> uninitialized after suspend.
>
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@canonical.com>
> ---
> diff --git a/drivers/gpu/drm/nouveau/core/subdev/ltcg/nvc0.c b/drivers/gpu/drm/nouveau/core/subdev/ltcg/nvc0.c
> index bcca883..7288940 100644
> --- a/drivers/gpu/drm/nouveau/core/subdev/ltcg/nvc0.c
> +++ b/drivers/gpu/drm/nouveau/core/subdev/ltcg/nvc0.c
> @@ -30,8 +30,9 @@ struct nvc0_ltcg_priv {
>         struct nouveau_ltcg base;
>         u32 part_nr;
>         u32 subp_nr;
> -       struct nouveau_mm tags;
>         u32 num_tags;
> +       u32 tag_base;
> +       struct nouveau_mm tags;
>         struct nouveau_mm_node *tag_ram;
>  };
>
> @@ -117,10 +118,6 @@ nvc0_ltcg_init_tag_ram(struct nouveau_fb *pfb, struct nvc0_ltcg_priv *priv)
>         u32 tag_size, tag_margin, tag_align;
>         int ret;
>
> -       nv_wr32(priv, 0x17e8d8, priv->part_nr);
> -       if (nv_device(pfb)->card_type >= NV_E0)
> -               nv_wr32(priv, 0x17e000, priv->part_nr);
> -
>         /* tags for 1/4 of VRAM should be enough (8192/4 per GiB of VRAM) */
>         priv->num_tags = (pfb->ram->size >> 17) / 4;
>         if (priv->num_tags > (1 << 17))
> @@ -152,7 +149,7 @@ nvc0_ltcg_init_tag_ram(struct nouveau_fb *pfb, struct nvc0_ltcg_priv *priv)
>                 tag_base += tag_align - 1;
>                 ret = do_div(tag_base, tag_align);
>
> -               nv_wr32(priv, 0x17e8d4, tag_base);
> +               priv->tag_base = tag_base;
>         }
>         ret = nouveau_mm_init(&priv->tags, 0, priv->num_tags, 1);
>
> @@ -182,8 +179,6 @@ nvc0_ltcg_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
>         }
>         priv->subp_nr = nv_rd32(priv, 0x17e8dc) >> 28;
>
> -       nv_mask(priv, 0x17e820, 0x00100000, 0x00000000); /* INTR_EN &= ~0x10 */
> -
>         ret = nvc0_ltcg_init_tag_ram(pfb, priv);
>         if (ret)
>                 return ret;
> @@ -209,13 +204,36 @@ nvc0_ltcg_dtor(struct nouveau_object *object)
>         nouveau_ltcg_destroy(ltcg);
>  }
>
> +int
> +nvc0_ltcg_init(struct nouveau_object *object)

This should probably be a static int.

> +{
> +       struct nouveau_ltcg *ltcg = (struct nouveau_ltcg *)object;
> +       struct nvc0_ltcg_priv *priv = (struct nvc0_ltcg_priv *)ltcg;
> +       struct nouveau_fb *pfb = nouveau_fb(ltcg->base.base.parent);

Hm, it's all a bit confusing, but wouldn't nouveau_fb(ltcg) (or priv)
work just fine here? nv_device looks at ->parent... but perhaps not
hard enough :)

> +       int ret;
> +
> +       ret = nouveau_subdev_init(&pfb->base);

Should this be &ltcg->base? (Or nouveau_ltcg_init(ltcg) for consistency...)

> +       if (ret)
> +               return ret;
> +
> +       nv_mask(priv, 0x17e820, 0x00100000, 0x00000000); /* INTR_EN &= ~0x10 */
> +
> +       nv_wr32(priv, 0x17e8d8, priv->part_nr);
> +       if (nv_device(pfb)->card_type >= NV_E0)
> +               nv_wr32(priv, 0x17e000, priv->part_nr);
> +
> +       nv_wr32(priv, 0x17e8d4, priv->tag_base);
> +
> +       return 0;
> +}
> +
>  struct nouveau_oclass
>  nvc0_ltcg_oclass = {
>         .handle = NV_SUBDEV(LTCG, 0xc0),
>         .ofuncs = &(struct nouveau_ofuncs) {
>                 .ctor = nvc0_ltcg_ctor,
>                 .dtor = nvc0_ltcg_dtor,
> -               .init = _nouveau_ltcg_init,
> +               .init = nvc0_ltcg_init,
>                 .fini = _nouveau_ltcg_fini,
>         },
>  };
>
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau

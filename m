From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau/therm: ack any pending IRQ at
	init v2
Date: Wed, 4 Sep 2013 11:52:06 +1000
Message-ID: <CACAvsv6+9TqeTjMeMPdAwDrxLbbZ1sBJDQFmE7Xum9ryebns7g@mail.gmail.com>
References: <1377907131-15099-2-git-send-email-martin.peres@free.fr>
	<1377907571-15301-1-git-send-email-martin.peres@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1377907571-15301-1-git-send-email-martin.peres-GANU6spQydw@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Martin Peres <martin.peres-BktLLJ5BOkI@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Sat, Aug 31, 2013 at 10:06 AM, Martin Peres <martin.peres-GANU6spQydw@public.gmane.org> wrote:
> From: Martin Peres <martin.peres-BktLLJ5BOkI@public.gmane.org>
>
> This is safe because ptherm hasn't been configured yet and will be a
> little further down the initialization path. Ptherm should be safe
> regarding to runtime reconfiguration.
Any objections to instead sticking the ACK in a single fini() hook
(along with additional code to disable all therm interrupts), and
having the IRQ handle silently ignore any non-requested IRQs (see what
the copy engine irq handler does, for example)?

Ben.
>
> v2:
> - do not limit this patch to nv84-a3 and make it nv84+
>
> Signed-off-by: Martin Peres <martin.peres-BktLLJ5BOkI@public.gmane.org>
> ---
>  drivers/gpu/drm/nouveau/core/subdev/therm/nv84.c | 19 ++++++++++++++++++-
>  drivers/gpu/drm/nouveau/core/subdev/therm/nva3.c |  4 ++++
>  drivers/gpu/drm/nouveau/core/subdev/therm/nvd0.c |  4 ++++
>  3 files changed, 26 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/core/subdev/therm/nv84.c b/drivers/gpu/drm/nouveau/core/subdev/therm/nv84.c
> index 42ba633..8615d62 100644
> --- a/drivers/gpu/drm/nouveau/core/subdev/therm/nv84.c
> +++ b/drivers/gpu/drm/nouveau/core/subdev/therm/nv84.c
> @@ -209,13 +209,30 @@ nv84_therm_ctor(struct nouveau_object *parent,
>         return nouveau_therm_preinit(&priv->base.base);
>  }
>
> +static int
> +nv84_therm_init(struct nouveau_object *object)
> +{
> +       struct nv84_therm_priv *priv = (void *)object;
> +       int ret;
> +
> +       ret = nouveau_therm_init(&priv->base.base);
> +       if (ret)
> +               return ret;
> +
> +       /* ACK ptherm IRQs */
> +       nv_wr32(object, 0x20100, 0xffffffff);
> +       nv_wr32(object, 0x1100, 0x10000); /* PBUS */
> +
> +       return 0;
> +}
> +
>  struct nouveau_oclass
>  nv84_therm_oclass = {
>         .handle = NV_SUBDEV(THERM, 0x84),
>         .ofuncs = &(struct nouveau_ofuncs) {
>                 .ctor = nv84_therm_ctor,
>                 .dtor = _nouveau_therm_dtor,
> -               .init = _nouveau_therm_init,
> +               .init = nv84_therm_init,
>                 .fini = _nouveau_therm_fini,
>         },
>  };
> diff --git a/drivers/gpu/drm/nouveau/core/subdev/therm/nva3.c b/drivers/gpu/drm/nouveau/core/subdev/therm/nva3.c
> index d11a7c4..f740eeb 100644
> --- a/drivers/gpu/drm/nouveau/core/subdev/therm/nva3.c
> +++ b/drivers/gpu/drm/nouveau/core/subdev/therm/nva3.c
> @@ -60,6 +60,10 @@ nva3_therm_init(struct nouveau_object *object)
>         }
>         nv_mask(priv, 0x00e720, 0x00000002, 0x00000000);
>
> +       /* ACK ptherm IRQs */
> +       nv_wr32(object, 0x20100, 0xffffffff);
> +       nv_wr32(object, 0x1100, 0x10000); /* PBUS */
> +
>         return 0;
>  }
>
> diff --git a/drivers/gpu/drm/nouveau/core/subdev/therm/nvd0.c b/drivers/gpu/drm/nouveau/core/subdev/therm/nvd0.c
> index 54c28bd..d9b5103 100644
> --- a/drivers/gpu/drm/nouveau/core/subdev/therm/nvd0.c
> +++ b/drivers/gpu/drm/nouveau/core/subdev/therm/nvd0.c
> @@ -114,6 +114,10 @@ nvd0_therm_init(struct nouveau_object *object)
>         }
>         nv_mask(priv, 0x00e720, 0x00000002, 0x00000000);
>
> +       /* ACK ptherm IRQs */
> +       nv_wr32(object, 0x20100, 0xffffffff);
> +       nv_wr32(object, 0x1100, 0x10000); /* PBUS */
> +
>         return 0;
>  }
>
> --
> 1.8.4
>
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau

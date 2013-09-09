From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] drm/nouveau/therm: ack any pending IRQ at
	init
Date: Mon, 9 Sep 2013 15:37:03 +1000
Message-ID: <CACAvsv6rDc5U1hHS796g82bfvgJLW13SmTbawx3Wvjeixd2nQQ@mail.gmail.com>
References: <1378680208-11431-1-git-send-email-martin.peres@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1378680208-11431-1-git-send-email-martin.peres-GANU6spQydw@public.gmane.org>
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

On Mon, Sep 9, 2013 at 8:43 AM, Martin Peres <martin.peres-GANU6spQydw@public.gmane.org> wrote:
> From: Martin Peres <martin.peres-BktLLJ5BOkI@public.gmane.org>
>
> This is safe because ptherm hasn't been configured yet and will be a
> little further down the initialization path. Ptherm should be safe
> regarding to runtime reconfiguration.
Merged: http://cgit.freedesktop.org/~darktama/nouveau/commit/?id=2ef5018234b80e6bc78816c09cc6baef3081fb8d

Thanks!

>
> v2:
>   - do not limit this patch to nv84-a3 and make it nv84+
>
> v3:
>   - move the ack to fini()
>   - disable IRQs on fini()
>   - silently ignore un-requested IRQs
>
> Signed-off-by: Martin Peres <martin.peres-BktLLJ5BOkI@public.gmane.org>
> ---
>  drivers/gpu/drm/nouveau/core/subdev/therm/nv84.c | 17 +++++++++++++++--
>  drivers/gpu/drm/nouveau/core/subdev/therm/nva3.c |  2 +-
>  drivers/gpu/drm/nouveau/core/subdev/therm/nvd0.c |  2 +-
>  drivers/gpu/drm/nouveau/core/subdev/therm/priv.h |  1 +
>  4 files changed, 18 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/core/subdev/therm/nv84.c b/drivers/gpu/drm/nouveau/core/subdev/therm/nv84.c
> index 42ba633..1d15c52 100644
> --- a/drivers/gpu/drm/nouveau/core/subdev/therm/nv84.c
> +++ b/drivers/gpu/drm/nouveau/core/subdev/therm/nv84.c
> @@ -126,7 +126,7 @@ nv84_therm_intr(struct nouveau_subdev *subdev)
>
>         spin_lock_irqsave(&priv->sensor.alarm_program_lock, flags);
>
> -       intr = nv_rd32(therm, 0x20100);
> +       intr = nv_rd32(therm, 0x20100) & 0x3ff;
>
>         /* THRS_4: downclock */
>         if (intr & 0x002) {
> @@ -209,6 +209,19 @@ nv84_therm_ctor(struct nouveau_object *parent,
>         return nouveau_therm_preinit(&priv->base.base);
>  }
>
> +int
> +nv84_therm_fini(struct nouveau_object *object, bool suspend)
> +{
> +       /* Disable PTherm IRQs */
> +       nv_wr32(object, 0x20000, 0x00000000);
> +
> +       /* ACK all PTherm IRQs */
> +       nv_wr32(object, 0x20100, 0xffffffff);
> +       nv_wr32(object, 0x1100, 0x10000); /* PBUS */
> +
> +       return _nouveau_therm_fini(object, suspend);
> +}
> +
>  struct nouveau_oclass
>  nv84_therm_oclass = {
>         .handle = NV_SUBDEV(THERM, 0x84),
> @@ -216,6 +229,6 @@ nv84_therm_oclass = {
>                 .ctor = nv84_therm_ctor,
>                 .dtor = _nouveau_therm_dtor,
>                 .init = _nouveau_therm_init,
> -               .fini = _nouveau_therm_fini,
> +               .fini = nv84_therm_fini,
>         },
>  };
> diff --git a/drivers/gpu/drm/nouveau/core/subdev/therm/nva3.c b/drivers/gpu/drm/nouveau/core/subdev/therm/nva3.c
> index d11a7c4..3b2c458 100644
> --- a/drivers/gpu/drm/nouveau/core/subdev/therm/nva3.c
> +++ b/drivers/gpu/drm/nouveau/core/subdev/therm/nva3.c
> @@ -94,6 +94,6 @@ nva3_therm_oclass = {
>                 .ctor = nva3_therm_ctor,
>                 .dtor = _nouveau_therm_dtor,
>                 .init = nva3_therm_init,
> -               .fini = _nouveau_therm_fini,
> +               .fini = nv84_therm_fini,
>         },
>  };
> diff --git a/drivers/gpu/drm/nouveau/core/subdev/therm/nvd0.c b/drivers/gpu/drm/nouveau/core/subdev/therm/nvd0.c
> index 54c28bd..4dd4f81 100644
> --- a/drivers/gpu/drm/nouveau/core/subdev/therm/nvd0.c
> +++ b/drivers/gpu/drm/nouveau/core/subdev/therm/nvd0.c
> @@ -148,6 +148,6 @@ nvd0_therm_oclass = {
>                 .ctor = nvd0_therm_ctor,
>                 .dtor = _nouveau_therm_dtor,
>                 .init = nvd0_therm_init,
> -               .fini = _nouveau_therm_fini,
> +               .fini = nv84_therm_fini,
>         },
>  };
> diff --git a/drivers/gpu/drm/nouveau/core/subdev/therm/priv.h b/drivers/gpu/drm/nouveau/core/subdev/therm/priv.h
> index dd38529..508b1ec 100644
> --- a/drivers/gpu/drm/nouveau/core/subdev/therm/priv.h
> +++ b/drivers/gpu/drm/nouveau/core/subdev/therm/priv.h
> @@ -144,6 +144,7 @@ int nv50_fan_pwm_get(struct nouveau_therm *, int, u32 *, u32 *);
>  int nv50_fan_pwm_set(struct nouveau_therm *, int, u32, u32);
>  int nv50_fan_pwm_clock(struct nouveau_therm *);
>  int nv84_temp_get(struct nouveau_therm *therm);
> +int nv84_therm_fini(struct nouveau_object *object, bool suspend);
>
>  int nva3_therm_fan_sense(struct nouveau_therm *);
>
> --
> 1.8.4
>
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau

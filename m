From: Ben Skeggs <skeggsb@gmail.com>
Subject: Re: [PATCH 1/3] drm/nouveau: fix vblank interrupt being called before
	event is setup
Date: Tue, 30 Jul 2013 12:42:14 +1000
Message-ID: <CACAvsv5enVEYL1_9qMN1+8qfbjiv4rQFhCanFvbK46bJpL_4Dg@mail.gmail.com>
References: <51EE8888.4030302@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <51EE8888.4030302@canonical.com>
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

On Tue, Jul 23, 2013 at 11:43 PM, Maarten Lankhorst
<maarten.lankhorst@canonical.com> wrote:
> Sort of fixes mmiotrace for me again, I could sear I sent a similar patch before
> the rework to event interface, so I guess it got reintroduced.
I don't know how/why you think this fixes anything.  The interrupt
handler can't possibly be called until after priv->base.vblank has
been initialised...

Seriously, go look, the subdev interrupt handler pointer isn't filled
in (and can't be) until after nouveau_disp_create() has been called,
and nouveau_disp_create() initialises priv->base.vblank before it
returns...

Ben.


>
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@canonical.com>
> ---
> diff --git a/drivers/gpu/drm/nouveau/core/engine/disp/nv50.c b/drivers/gpu/drm/nouveau/core/engine/disp/nv50.c
> index 7e3875d..35e526b 100644
> --- a/drivers/gpu/drm/nouveau/core/engine/disp/nv50.c
> +++ b/drivers/gpu/drm/nouveau/core/engine/disp/nv50.c
> @@ -1266,13 +1266,15 @@ nv50_disp_intr(struct nouveau_subdev *subdev)
>         }
>
>         if (intr1 & 0x00000004) {
> -               nouveau_event_trigger(priv->base.vblank, 0);
> +               if (priv->base.vblank)
> +                       nouveau_event_trigger(priv->base.vblank, 0);
>                 nv_wr32(priv, 0x610024, 0x00000004);
>                 intr1 &= ~0x00000004;
>         }
>
>         if (intr1 & 0x00000008) {
> -               nouveau_event_trigger(priv->base.vblank, 1);
> +               if (priv->base.vblank)
> +                       nouveau_event_trigger(priv->base.vblank, 1);
>                 nv_wr32(priv, 0x610024, 0x00000008);
>                 intr1 &= ~0x00000008;
>         }
> diff --git a/drivers/gpu/drm/nouveau/core/engine/disp/nvd0.c b/drivers/gpu/drm/nouveau/core/engine/disp/nvd0.c
> index 52dd7a1..4095f65 100644
> --- a/drivers/gpu/drm/nouveau/core/engine/disp/nvd0.c
> +++ b/drivers/gpu/drm/nouveau/core/engine/disp/nvd0.c
> @@ -941,7 +941,7 @@ nvd0_disp_intr(struct nouveau_subdev *subdev)
>                 u32 mask = 0x01000000 << i;
>                 if (mask & intr) {
>                         u32 stat = nv_rd32(priv, 0x6100bc + (i * 0x800));
> -                       if (stat & 0x00000001)
> +                       if ((stat & 0x00000001) && priv->base.vblank)
>                                 nouveau_event_trigger(priv->base.vblank, i);
>                         nv_mask(priv, 0x6100bc + (i * 0x800), 0, 0);
>                         nv_rd32(priv, 0x6100c0 + (i * 0x800));
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel

From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau: don't hold spin lock while
	calling kzalloc with GFP_KERNEL
Date: Mon, 8 Feb 2010 18:39:42 +0100
Message-ID: <6d4bc9fc1002080939r2f3066b8k2e4541391628acc9@mail.gmail.com>
References: <1265650698-4773-1-git-send-email-madman2003@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1265650698-4773-1-git-send-email-madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Added the "Tested-by", added Marcin's real name. And added a spin
unlock in the nv50 fifo failure path.

Will push in a day if there are no further comments.

Maarten.

On Mon, Feb 8, 2010 at 6:38 PM, Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wro=
te:
> - Marcin Slusarz pointed out that this triggers a BUG_ON, because kzalloc=
 could
> sleep.
> - The irq handler should restore the value NV03_PFIFO_CACHES, but still i=
t's
> better if this stuff doesn't happen in the middle of fifo create context.=
 I see
> no reason in spin locking pgraph create context, it isn't activated at th=
at
> stage.
> - Move and rename the lock after some discussion with Marcin, even better
> naming suggestions are appreciated.
>
> Tested-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Signed-off-by: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
> =A0drivers/gpu/drm/nouveau/nouveau_channel.c | =A0 =A09 ++-------
> =A0drivers/gpu/drm/nouveau/nouveau_drv.h =A0 =A0 | =A0 =A04 +++-
> =A0drivers/gpu/drm/nouveau/nouveau_irq.c =A0 =A0 | =A0 =A04 ++--
> =A0drivers/gpu/drm/nouveau/nouveau_state.c =A0 | =A0 =A02 +-
> =A0drivers/gpu/drm/nouveau/nv04_fifo.c =A0 =A0 =A0 | =A0 =A05 +++++
> =A0drivers/gpu/drm/nouveau/nv40_fifo.c =A0 =A0 =A0 | =A0 =A05 +++++
> =A0drivers/gpu/drm/nouveau/nv50_fifo.c =A0 =A0 =A0 | =A0 =A05 +++++
> =A07 files changed, 23 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_channel.c b/drivers/gpu/drm/=
nouveau/nouveau_channel.c
> index d25ed61..f7ca950 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_channel.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_channel.c
> @@ -113,7 +113,6 @@ nouveau_channel_alloc(struct drm_device *dev, struct =
nouveau_channel **chan_ret,
> =A0 =A0 =A0 =A0struct nouveau_pgraph_engine *pgraph =3D &dev_priv->engine=
.graph;
> =A0 =A0 =A0 =A0struct nouveau_fifo_engine *pfifo =3D &dev_priv->engine.fi=
fo;
> =A0 =A0 =A0 =A0struct nouveau_channel *chan;
> - =A0 =A0 =A0 unsigned long flags;
> =A0 =A0 =A0 =A0int channel, user;
> =A0 =A0 =A0 =A0int ret;
>
> @@ -204,8 +203,6 @@ nouveau_channel_alloc(struct drm_device *dev, struct =
nouveau_channel **chan_ret,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return ret;
> =A0 =A0 =A0 =A0}
>
> - =A0 =A0 =A0 spin_lock_irqsave(&dev_priv->engine.lock, flags);
> -
> =A0 =A0 =A0 =A0/* disable the fifo caches */
> =A0 =A0 =A0 =A0pfifo->reassign(dev, false);
>
> @@ -225,8 +222,6 @@ nouveau_channel_alloc(struct drm_device *dev, struct =
nouveau_channel **chan_ret,
>
> =A0 =A0 =A0 =A0pfifo->reassign(dev, true);
>
> - =A0 =A0 =A0 spin_unlock_irqrestore(&dev_priv->engine.lock, flags);
> -
> =A0 =A0 =A0 =A0ret =3D nouveau_dma_init(chan);
> =A0 =A0 =A0 =A0if (!ret)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ret =3D nouveau_fence_init(chan);
> @@ -290,7 +285,7 @@ nouveau_channel_free(struct nouveau_channel *chan)
> =A0 =A0 =A0 =A0if (pgraph->channel(dev) =3D=3D chan)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0nouveau_wait_for_idle(dev);
>
> - =A0 =A0 =A0 spin_lock_irqsave(&dev_priv->engine.lock, flags);
> + =A0 =A0 =A0 spin_lock_irqsave(&dev_priv->context_switch_lock, flags);
>
> =A0 =A0 =A0 =A0pgraph->fifo_access(dev, false);
> =A0 =A0 =A0 =A0if (pgraph->channel(dev) =3D=3D chan)
> @@ -307,7 +302,7 @@ nouveau_channel_free(struct nouveau_channel *chan)
>
> =A0 =A0 =A0 =A0pfifo->reassign(dev, true);
>
> - =A0 =A0 =A0 spin_unlock_irqrestore(&dev_priv->engine.lock, flags);
> + =A0 =A0 =A0 spin_unlock_irqrestore(&dev_priv->context_switch_lock, flag=
s);
>
> =A0 =A0 =A0 =A0/* Release the channel's resources */
> =A0 =A0 =A0 =A0nouveau_gpuobj_ref_del(dev, &chan->pushbuf);
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouv=
eau/nouveau_drv.h
> index 64987a9..ea55a41 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drv.h
> +++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
> @@ -358,7 +358,6 @@ struct nouveau_engine {
> =A0 =A0 =A0 =A0struct nouveau_fb_engine =A0 =A0 =A0fb;
> =A0 =A0 =A0 =A0struct nouveau_pgraph_engine =A0graph;
> =A0 =A0 =A0 =A0struct nouveau_fifo_engine =A0 =A0fifo;
> - =A0 =A0 =A0 spinlock_t lock;
> =A0};
>
> =A0struct nouveau_pll_vals {
> @@ -534,6 +533,9 @@ struct drm_nouveau_private {
> =A0 =A0 =A0 =A0struct nouveau_engine engine;
> =A0 =A0 =A0 =A0struct nouveau_channel *channel;
>
> + =A0 =A0 =A0 /* For PFIFO and PGRAPH. */
> + =A0 =A0 =A0 spinlock_t context_switch_lock;
> +
> =A0 =A0 =A0 =A0/* RAMIN configuration, RAMFC, RAMHT and RAMRO offsets */
> =A0 =A0 =A0 =A0struct nouveau_gpuobj *ramht;
> =A0 =A0 =A0 =A0uint32_t ramin_rsvd_vram;
> diff --git a/drivers/gpu/drm/nouveau/nouveau_irq.c b/drivers/gpu/drm/nouv=
eau/nouveau_irq.c
> index cffc9bc..95220dd 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_irq.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_irq.c
> @@ -697,7 +697,7 @@ nouveau_irq_handler(DRM_IRQ_ARGS)
> =A0 =A0 =A0 =A0if (!status)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return IRQ_NONE;
>
> - =A0 =A0 =A0 spin_lock_irqsave(&dev_priv->engine.lock, flags);
> + =A0 =A0 =A0 spin_lock_irqsave(&dev_priv->context_switch_lock, flags);
>
> =A0 =A0 =A0 =A0if (dev_priv->fbdev_info) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0fbdev_flags =3D dev_priv->fbdev_info->flag=
s;
> @@ -736,7 +736,7 @@ nouveau_irq_handler(DRM_IRQ_ARGS)
> =A0 =A0 =A0 =A0if (dev_priv->fbdev_info)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0dev_priv->fbdev_info->flags =3D fbdev_flag=
s;
>
> - =A0 =A0 =A0 spin_unlock_irqrestore(&dev_priv->engine.lock, flags);
> + =A0 =A0 =A0 spin_unlock_irqrestore(&dev_priv->context_switch_lock, flag=
s);
>
> =A0 =A0 =A0 =A0return IRQ_HANDLED;
> =A0}
> diff --git a/drivers/gpu/drm/nouveau/nouveau_state.c b/drivers/gpu/drm/no=
uveau/nouveau_state.c
> index 3586667..0a2a437 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_state.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_state.c
> @@ -383,7 +383,7 @@ nouveau_card_init(struct drm_device *dev)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto out;
> =A0 =A0 =A0 =A0engine =3D &dev_priv->engine;
> =A0 =A0 =A0 =A0dev_priv->init_state =3D NOUVEAU_CARD_INIT_FAILED;
> - =A0 =A0 =A0 spin_lock_init(&dev_priv->engine.lock);
> + =A0 =A0 =A0 spin_lock_init(&dev_priv->context_switch_lock);
>
> =A0 =A0 =A0 =A0/* Parse BIOS tables / Run init tables if card not POSTed =
*/
> =A0 =A0 =A0 =A0if (drm_core_check_feature(dev, DRIVER_MODESET)) {
> diff --git a/drivers/gpu/drm/nouveau/nv04_fifo.c b/drivers/gpu/drm/nouvea=
u/nv04_fifo.c
> index f31347b..66fe559 100644
> --- a/drivers/gpu/drm/nouveau/nv04_fifo.c
> +++ b/drivers/gpu/drm/nouveau/nv04_fifo.c
> @@ -117,6 +117,7 @@ nv04_fifo_create_context(struct nouveau_channel *chan)
> =A0{
> =A0 =A0 =A0 =A0struct drm_device *dev =3D chan->dev;
> =A0 =A0 =A0 =A0struct drm_nouveau_private *dev_priv =3D dev->dev_private;
> + =A0 =A0 =A0 unsigned long flags;
> =A0 =A0 =A0 =A0int ret;
>
> =A0 =A0 =A0 =A0ret =3D nouveau_gpuobj_new_fake(dev, NV04_RAMFC(chan->id),=
 ~0,
> @@ -127,6 +128,8 @@ nv04_fifo_create_context(struct nouveau_channel *chan)
> =A0 =A0 =A0 =A0if (ret)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return ret;
>
> + =A0 =A0 =A0 spin_lock_irqsave(&dev_priv->context_switch_lock, flags);
> +
> =A0 =A0 =A0 =A0/* Setup initial state */
> =A0 =A0 =A0 =A0dev_priv->engine.instmem.prepare_access(dev, true);
> =A0 =A0 =A0 =A0RAMFC_WR(DMA_PUT, chan->pushbuf_base);
> @@ -144,6 +147,8 @@ nv04_fifo_create_context(struct nouveau_channel *chan)
> =A0 =A0 =A0 =A0/* enable the fifo dma operation */
> =A0 =A0 =A0 =A0nv_wr32(dev, NV04_PFIFO_MODE,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0nv_rd32(dev, NV04_PFIFO_MODE) | (1 << chan=
->id));
> +
> + =A0 =A0 =A0 spin_unlock_irqrestore(&dev_priv->context_switch_lock, flag=
s);
> =A0 =A0 =A0 =A0return 0;
> =A0}
>
> diff --git a/drivers/gpu/drm/nouveau/nv40_fifo.c b/drivers/gpu/drm/nouvea=
u/nv40_fifo.c
> index b4f19cc..6b2ef4a 100644
> --- a/drivers/gpu/drm/nouveau/nv40_fifo.c
> +++ b/drivers/gpu/drm/nouveau/nv40_fifo.c
> @@ -37,6 +37,7 @@ nv40_fifo_create_context(struct nouveau_channel *chan)
> =A0 =A0 =A0 =A0struct drm_device *dev =3D chan->dev;
> =A0 =A0 =A0 =A0struct drm_nouveau_private *dev_priv =3D dev->dev_private;
> =A0 =A0 =A0 =A0uint32_t fc =3D NV40_RAMFC(chan->id);
> + =A0 =A0 =A0 unsigned long flags;
> =A0 =A0 =A0 =A0int ret;
>
> =A0 =A0 =A0 =A0ret =3D nouveau_gpuobj_new_fake(dev, NV40_RAMFC(chan->id),=
 ~0,
> @@ -45,6 +46,8 @@ nv40_fifo_create_context(struct nouveau_channel *chan)
> =A0 =A0 =A0 =A0if (ret)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return ret;
>
> + =A0 =A0 =A0 spin_lock_irqsave(&dev_priv->context_switch_lock, flags);
> +
> =A0 =A0 =A0 =A0dev_priv->engine.instmem.prepare_access(dev, true);
> =A0 =A0 =A0 =A0nv_wi32(dev, fc + =A00, chan->pushbuf_base);
> =A0 =A0 =A0 =A0nv_wi32(dev, fc + =A04, chan->pushbuf_base);
> @@ -63,6 +66,8 @@ nv40_fifo_create_context(struct nouveau_channel *chan)
> =A0 =A0 =A0 =A0/* enable the fifo dma operation */
> =A0 =A0 =A0 =A0nv_wr32(dev, NV04_PFIFO_MODE,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0nv_rd32(dev, NV04_PFIFO_MODE) | (1 << chan=
->id));
> +
> + =A0 =A0 =A0 spin_unlock_irqrestore(&dev_priv->context_switch_lock, flag=
s);
> =A0 =A0 =A0 =A0return 0;
> =A0}
>
> diff --git a/drivers/gpu/drm/nouveau/nv50_fifo.c b/drivers/gpu/drm/nouvea=
u/nv50_fifo.c
> index 204a79f..369ecb4 100644
> --- a/drivers/gpu/drm/nouveau/nv50_fifo.c
> +++ b/drivers/gpu/drm/nouveau/nv50_fifo.c
> @@ -243,6 +243,7 @@ nv50_fifo_create_context(struct nouveau_channel *chan)
> =A0 =A0 =A0 =A0struct drm_device *dev =3D chan->dev;
> =A0 =A0 =A0 =A0struct drm_nouveau_private *dev_priv =3D dev->dev_private;
> =A0 =A0 =A0 =A0struct nouveau_gpuobj *ramfc =3D NULL;
> + =A0 =A0 =A0 unsigned long flags;
> =A0 =A0 =A0 =A0int ret;
>
> =A0 =A0 =A0 =A0NV_DEBUG(dev, "ch%d\n", chan->id);
> @@ -278,6 +279,8 @@ nv50_fifo_create_context(struct nouveau_channel *chan)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return ret;
> =A0 =A0 =A0 =A0}
>
> + =A0 =A0 =A0 spin_lock_irqsave(&dev_priv->context_switch_lock, flags);
> +
> =A0 =A0 =A0 =A0dev_priv->engine.instmem.prepare_access(dev, true);
>
> =A0 =A0 =A0 =A0nv_wo32(dev, ramfc, 0x08/4, chan->pushbuf_base);
> @@ -306,10 +309,12 @@ nv50_fifo_create_context(struct nouveau_channel *ch=
an)
> =A0 =A0 =A0 =A0ret =3D nv50_fifo_channel_enable(dev, chan->id, false);
> =A0 =A0 =A0 =A0if (ret) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0NV_ERROR(dev, "error enabling ch%d: %d\n",=
 chan->id, ret);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 spin_unlock_irqrestore(&dev_priv->context_s=
witch_lock, flags);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0nouveau_gpuobj_ref_del(dev, &chan->ramfc);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return ret;
> =A0 =A0 =A0 =A0}
>
> + =A0 =A0 =A0 spin_unlock_irqrestore(&dev_priv->context_switch_lock, flag=
s);
> =A0 =A0 =A0 =A0return 0;
> =A0}
>
> --
> 1.6.6.1
>
>

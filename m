From: Ben Skeggs <skeggsb@gmail.com>
Subject: Re: [PATCH] drm/nv84-: write fence value on exit, and restore value
	on init.
Date: Wed, 4 Sep 2013 13:21:19 +1000
Message-ID: <CACAvsv6Aj2abkDV4-HPykMT9gKWw5U8AHkiBzvnOH5UND6nUDQ@mail.gmail.com>
References: <1378132262-19453-1-git-send-email-maarten.lankhorst@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <1378132262-19453-1-git-send-email-maarten.lankhorst@canonical.com>
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

On Tue, Sep 3, 2013 at 12:31 AM, Maarten Lankhorst
<maarten.lankhorst@canonical.com> wrote:
> This increases the chance slightly that recovery from lockup can happen
> succesfully.
I'd *really* love to see proof of this.  When channels die, all
outstanding fences are marked as signalled.  This should do absolutely
nothing...

>
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@canonical.com>
> ---
>  drivers/gpu/drm/nouveau/nv84_fence.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nv84_fence.c b/drivers/gpu/drm/nouveau/nv84_fence.c
> index 2cf0ade..daf4b18 100644
> --- a/drivers/gpu/drm/nouveau/nv84_fence.c
> +++ b/drivers/gpu/drm/nouveau/nv84_fence.c
> @@ -122,8 +122,11 @@ nv84_fence_context_del(struct nouveau_channel *chan)
>         struct drm_device *dev = chan->drm->dev;
>         struct nv84_fence_priv *priv = chan->drm->fence;
>         struct nv84_fence_chan *fctx = chan->fence;
> +       struct nouveau_fifo_chan *fifo = (void *)chan->object;
>         int i;
>
> +       nouveau_bo_wr32(priv->bo, fifo->chid * 16/4, fctx->base.sequence);
> +
>         for (i = 0; i < dev->mode_config.num_crtc; i++) {
>                 struct nouveau_bo *bo = nv50_display_crtc_sema(dev, i);
>                 nouveau_bo_vma_del(bo, &fctx->dispc_vma[i]);
> @@ -168,7 +171,7 @@ nv84_fence_context_new(struct nouveau_channel *chan)
>                 ret = nouveau_bo_vma_add(bo, client->vm, &fctx->dispc_vma[i]);
>         }
>
> -       nouveau_bo_wr32(priv->bo, fifo->chid * 16/4, 0x00000000);
> +       fctx->base.sequence = nouveau_bo_rd32(priv->bo, fifo->chid * 16/4);
>
>         if (ret)
>                 nv84_fence_context_del(chan);
> --
> 1.8.3.4
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel

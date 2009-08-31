From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau: init some list_heads
Date: Mon, 31 Aug 2009 21:37:34 +0300
Message-ID: <20090831213734.22cde00a@daedalus.pq.iki.fi>
References: <1251323616-25702-1-git-send-email-madman2003@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1251323616-25702-1-git-send-email-madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Wed, 26 Aug 2009 23:53:36 +0200
Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> - In the case of nvbo->head it is really important to avoid an OOPS if ttm_buffer_object_init fails.
> 
> Signed-off-by: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Aren't you going to push this?
I still haven't really reviewed this, but go ahead.

> ---
>  drivers/gpu/drm/nouveau/nouveau_bo.c      |    2 ++
>  drivers/gpu/drm/nouveau/nouveau_channel.c |    1 +
>  drivers/gpu/drm/nouveau/nouveau_object.c  |    1 +
>  3 files changed, 4 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
> index 24d6f8f..6b8ef6b 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> @@ -63,6 +63,8 @@ nouveau_bo_new(struct drm_device *dev, struct nouveau_channel *chan,
>  	nvbo = kzalloc(sizeof(struct nouveau_bo), GFP_KERNEL);
>  	if (!nvbo)
>  		return -ENOMEM;
> +	INIT_LIST_HEAD(&nvbo->head);
> +	INIT_LIST_HEAD(&nvbo->entry);
>  	nvbo->mappable = mappable;
>  	nvbo->no_vm = no_vm;
>  	nvbo->tile_mode = tile_mode;
> diff --git a/drivers/gpu/drm/nouveau/nouveau_channel.c b/drivers/gpu/drm/nouveau/nouveau_channel.c
> index 382c5b5..6c31d7f 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_channel.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_channel.c
> @@ -138,6 +138,7 @@ nouveau_channel_alloc(struct drm_device *dev, struct nouveau_channel **chan_ret,
>  		return -ENOMEM;
>  	dev_priv->fifo_alloc_count++;
>  	chan = dev_priv->fifos[channel];
> +	INIT_LIST_HEAD(&chan->nvsw.vbl_wait);
>  	chan->dev = dev;
>  	chan->id = channel;
>  	chan->file_priv = file_priv;
> diff --git a/drivers/gpu/drm/nouveau/nouveau_object.c b/drivers/gpu/drm/nouveau/nouveau_object.c
> index 65d8d25..efcce79 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_object.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_object.c
> @@ -468,6 +468,7 @@ nouveau_gpuobj_ref_add(struct drm_device *dev, struct nouveau_channel *chan,
>  	ref = kzalloc(sizeof(*ref), GFP_KERNEL);
>  	if (!ref)
>  		return -ENOMEM;
> +	INIT_LIST_HEAD(&ref->list);
>  	ref->gpuobj   = gpuobj;
>  	ref->channel  = chan;
>  	ref->instance = instance;
> -- 
> 1.6.4
> 
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
> 


-- 
Pekka Paalanen
http://www.iki.fi/pq/

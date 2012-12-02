From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau: unpin pushbuffer bo before
	destroying it
Date: Sun, 2 Dec 2012 12:30:06 +0100
Message-ID: <20121202113006.GA3215@joi.lan>
References: <20121125220228.GD13248@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20121125220228.GD13248-OI9uyE9O0yo@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Sun, Nov 25, 2012 at 11:02:28PM +0100, Marcin Slusarz wrote:
> Fixes GART leak (as accounted by nouveau_drm.gem.gart_available).
> 
> Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
> 
> Running glxinfo in a loop is enough to trigger it - after several thousand
> runs (depending on GART size), X server crashes and does not come back in
> a correct state (corruptions and crashes).
> 
> With this patch applied, it's possible again to do full piglit run (with
> concurrency disabled) without crashes or lockups.
> 
> ---

Please consider applying this patch for 3.7/3.7.x. This bug is easily
reproducible and has fatal consequences (gpu is unusuable after 1st crash).

>  drivers/gpu/drm/nouveau/nouveau_chan.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.c b/drivers/gpu/drm/nouveau/nouveau_chan.c
> index 1363578..174300b 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_chan.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_chan.c
> @@ -76,6 +76,8 @@ nouveau_channel_del(struct nouveau_channel **pchan)
>  		nouveau_object_del(client, NVDRM_DEVICE, chan->push.handle);
>  		nouveau_bo_vma_del(chan->push.buffer, &chan->push.vma);
>  		nouveau_bo_unmap(chan->push.buffer);
> +		if (chan->push.buffer && chan->push.buffer->pin_refcnt)
> +			nouveau_bo_unpin(chan->push.buffer);
>  		nouveau_bo_ref(NULL, &chan->push.buffer);
>  		kfree(chan);
>  	}
> -- 
> 1.7.12
> 

From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau: fix fillrect color on nv50
Date: Tue, 22 Dec 2009 08:49:13 +1000
Message-ID: <1261435753.5889.0.camel@nisroch>
References: <20091221220041.GA2656@joi.lan>
Reply-To: skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20091221220041.GA2656-OI9uyE9O0yo@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Mon, 2009-12-21 at 23:00 +0100, Marcin Slusarz wrote:
> struct fb_fillrect->color is not a color, but index into pseudo_palette array
> 
Thanks, applied to git.

Ben.
> Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/gpu/drm/nouveau/nv50_fbcon.c |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nv50_fbcon.c b/drivers/gpu/drm/nouveau/nv50_fbcon.c
> index 6bcc6d3..c966ef8 100644
> --- a/drivers/gpu/drm/nouveau/nv50_fbcon.c
> +++ b/drivers/gpu/drm/nouveau/nv50_fbcon.c
> @@ -10,6 +10,7 @@ nv50_fbcon_fillrect(struct fb_info *info, const struct fb_fillrect *rect)
>  	struct drm_device *dev = par->dev;
>  	struct drm_nouveau_private *dev_priv = dev->dev_private;
>  	struct nouveau_channel *chan = dev_priv->channel;
> +	uint32_t color = ((uint32_t *) info->pseudo_palette)[rect->color];
>  
>  	if (info->state != FBINFO_STATE_RUNNING)
>  		return;
> @@ -31,7 +32,7 @@ nv50_fbcon_fillrect(struct fb_info *info, const struct fb_fillrect *rect)
>  		OUT_RING(chan, 1);
>  	}
>  	BEGIN_RING(chan, NvSub2D, 0x0588, 1);
> -	OUT_RING(chan, rect->color);
> +	OUT_RING(chan, color);
>  	BEGIN_RING(chan, NvSub2D, 0x0600, 4);
>  	OUT_RING(chan, rect->dx);
>  	OUT_RING(chan, rect->dy);

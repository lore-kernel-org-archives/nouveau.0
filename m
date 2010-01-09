From: Alexey Dobriyan <adobriyan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] nouveau: nv50: fix ->pseudo_palette usage
Date: Sat, 9 Jan 2010 18:05:24 +0200
Message-ID: <20100109160524.GA4258@x200>
References: <20100103091742.GA11518@x200>
 <1262557056.18387.6.camel@nisroch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1262557056.18387.6.camel@nisroch>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Mon, Jan 04, 2010 at 08:17:36AM +1000, Ben Skeggs wrote:
> On Sun, 2010-01-03 at 11:17 +0200, Alexey Dobriyan wrote:
> > Sometimes struct fb_fillrect::color is color, sometimes palette index.
> This doesn't apply on current git, which already has a similar (though,
> not quite the same) patch applied.  We may yet need some additional
> fixes from your patch, I'll look at testing that soon.

Ehh?
They're the same except I haven't changed nv04, because of no hardware.

> > --- a/drivers/gpu/drm/nouveau/nv50_fbcon.c
> > +++ b/drivers/gpu/drm/nouveau/nv50_fbcon.c
> > @@ -10,6 +10,7 @@ nv50_fbcon_fillrect(struct fb_info *info, const struct fb_fillrect *rect)
> >  	struct drm_device *dev = par->dev;
> >  	struct drm_nouveau_private *dev_priv = dev->dev_private;
> >  	struct nouveau_channel *chan = dev_priv->channel;
> > +	uint32_t color;
> >  
> >  	if (info->state != FBINFO_STATE_RUNNING)
> >  		return;
> > @@ -31,7 +32,12 @@ nv50_fbcon_fillrect(struct fb_info *info, const struct fb_fillrect *rect)
> >  		OUT_RING(chan, 1);
> >  	}
> >  	BEGIN_RING(chan, NvSub2D, 0x0588, 1);
> > -	OUT_RING(chan, rect->color);
> > +	if (info->fix.visual == FB_VISUAL_TRUECOLOR ||
> > +	    info->fix.visual == FB_VISUAL_DIRECTCOLOR) {
> > +		color = ((uint32_t *)info->pseudo_palette)[rect->color];
> > +	} else
> > +		color = rect->color;
> > +	OUT_RING(chan, color);
> >  	BEGIN_RING(chan, NvSub2D, 0x0600, 4);

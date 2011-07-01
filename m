From: "George Spelvin" <linux-gpGsJRJZ3PBBDgjK7y7TUQ@public.gmane.org>
Subject: Re: nouveaufb problems with NV18
Date: 1 Jul 2011 19:11:55 -0400
Message-ID: <20110701231155.24191.qmail@science.horizon.com>
References: <20110701201516.GB3162@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20110701201516.GB3162-OI9uyE9O0yo@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: linux-gpGsJRJZ3PBBDgjK7y7TUQ@public.gmane.org, marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

> No. As suggested by mwk on irc the problem is probably in kernel - on NV1x, nouveau
> allocates color buffers only in bottom half of VRAM, so if fbcon takes almost half of it and
> there are some other allocations, second 8MB buffer cannot be allocated.
> Can you test this patch to verify it?
> --
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
> index 890d50e..6884c88 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> @@ -146,7 +146,7 @@ set_placement_range(struct nouveau_bo *nvbo, uint32_t type)
>  	struct drm_nouveau_private *dev_priv = nouveau_bdev(nvbo->bo.bdev);
>  	int vram_pages = dev_priv->vram_size >> PAGE_SHIFT;
>  
> -	if (dev_priv->card_type == NV_10 &&
> +	if (0 && dev_priv->card_type == NV_10 &&
>  	    nvbo->tile_mode && (type & TTM_PL_FLAG_VRAM) &&
>  	    nvbo->bo.mem.num_pages < vram_pages / 2) {
>  		/*

Yes, it works at DefaultDepth 24.  I'm not at the computer any more,
so I can't speak for the display quality, but I have a good looking
Xorg.0.log and a running gdm3.

Interestingly, the vertical display offset I noticed on the console is
also present in the X display.  The frame buffer is shifted down about
16 pixels (about the height of the default arrow cursor), and the gap
is filled with copies of the top scan line.

The cursor position is not offset, meaning that it changes appearance
when it's apparently 16 pixels above a hot-spot.

I'll find a camera and take a picture.

Thank you again!

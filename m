From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm/nv50/fb: Fix nullptr-deref on IGPs
Date: Wed, 09 Jan 2013 05:46:40 +0000
Message-ID: <50ED0440.5060609@gmail.com>
References: <1357699233-29046-1-git-send-email-r.spliet@student.tudelft.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1357699233-29046-1-git-send-email-r.spliet-oe7qfRrRQfeEZXFvZSAUrfP6llvjuJOh@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Roy Spliet <r.spliet-oe7qfRrRQfeEZXFvZSAUrfP6llvjuJOh@public.gmane.org>
Cc: Nouveau devlist <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On 09/01/13 02:40, Roy Spliet wrote:
> When COMP_MAX_TAG == 0, the tags mm was uninitialised. Fixed by initialising with zero length.
> 
> v2: Fix style error
> 
> Signed-off-by: Roy Spliet <r.spliet-oe7qfRrRQfeEZXFvZSAUrfP6llvjuJOh@public.gmane.org>
> Tested-by: Roy Spliet <r.spliet-oe7qfRrRQfeEZXFvZSAUrfP6llvjuJOh@public.gmane.org>
> ---
>  drivers/gpu/drm/nouveau/core/subdev/fb/base.c | 9 +++++++--
>  drivers/gpu/drm/nouveau/core/subdev/fb/nv50.c | 5 +++--
>  2 files changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/core/subdev/fb/base.c b/drivers/gpu/drm/nouveau/core/subdev/fb/base.c
> index d6d1600..e1b5773 100644
> --- a/drivers/gpu/drm/nouveau/core/subdev/fb/base.c
> +++ b/drivers/gpu/drm/nouveau/core/subdev/fb/base.c
> @@ -86,8 +86,13 @@ nouveau_fb_preinit(struct nouveau_fb *pfb)
>  			return ret;
>  	}
>  
> -	if (!nouveau_mm_initialised(&pfb->tags) && tags) {
> -		ret = nouveau_mm_init(&pfb->tags, 0, ++tags, 1);
Btw the commit that introduced this code, changed "tags" to "++tags"

> +	if (!nouveau_mm_initialised(&pfb->tags)) {
> +		if(tags) {
> +			ret = nouveau_mm_init(&pfb->tags, 0, ++tags, 1);
> +		} else {
> +			ret = nouveau_mm_init(&pfb->tags, 0, 0, 1);
> +		}
> +
>  		if (ret)
>  			return ret;
>  	}
> diff --git a/drivers/gpu/drm/nouveau/core/subdev/fb/nv50.c b/drivers/gpu/drm/nouveau/core/subdev/fb/nv50.c
> index a4338d9..0772ec9 100644
> --- a/drivers/gpu/drm/nouveau/core/subdev/fb/nv50.c
> +++ b/drivers/gpu/drm/nouveau/core/subdev/fb/nv50.c
> @@ -101,7 +101,7 @@ nv50_fb_vram_init(struct nouveau_fb *pfb)
>  	struct nouveau_bios *bios = nouveau_bios(device);
>  	const u32 rsvd_head = ( 256 * 1024) >> 12; /* vga memory */
>  	const u32 rsvd_tail = (1024 * 1024) >> 12; /* vbios etc */
> -	u32 size;
> +	u32 size, tags = 0;
>  	int ret;
>  
>  	pfb->ram.size = nv_rd32(pfb, 0x10020c);
> @@ -142,10 +142,11 @@ nv50_fb_vram_init(struct nouveau_fb *pfb)
>  			return ret;
>  
>  		pfb->ram.ranks = (nv_rd32(pfb, 0x100200) & 0x4) ? 2 : 1;
> +		tags = nv_rd32(pfb, 0x100320);
>  		break;
>  	}
>  
> -	return nv_rd32(pfb, 0x100320);
> +	return tags;
>  }
>  
>  static int
> 

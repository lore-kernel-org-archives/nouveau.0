From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Mesa-dev] [PATCH 02/12] nv50: setup scissors on
	clear_render_target/depth_stencil
Date: Wed, 21 May 2014 19:57:14 +0100
Message-ID: <537CF70A.4000905@gmail.com>
References: <1400629206-4447-1-git-send-email-imirkin@alum.mit.edu>
 <1400629206-4447-3-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1400629206-4447-3-git-send-email-imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>, mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: "10.2" <mesa-stable-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: nouveau.vger.kernel.org

On 21/05/14 00:39, Ilia Mirkin wrote:
> From: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
> 
> [imirkin: add logic to also clear the "regular" scissors]
Can you please share why are you've added the "regular" scissors ?
Does it matter if we set the screen scissors before the render target params?

Thanks
Emil

> Reviewed-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
> Cc: "10.2" <mesa-stable-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
> ---
>  src/gallium/drivers/nouveau/nv50/nv50_surface.c | 20 ++++++++++++++++++--
>  1 file changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/src/gallium/drivers/nouveau/nv50/nv50_surface.c b/src/gallium/drivers/nouveau/nv50/nv50_surface.c
> index 1f37527..6e68fb8 100644
> --- a/src/gallium/drivers/nouveau/nv50/nv50_surface.c
> +++ b/src/gallium/drivers/nouveau/nv50/nv50_surface.c
> @@ -288,6 +288,14 @@ nv50_clear_render_target(struct pipe_context *pipe,
>  
>     PUSH_REFN(push, bo, mt->base.domain | NOUVEAU_BO_WR);
>  
> +   BEGIN_NV04(push, NV50_3D(SCREEN_SCISSOR_HORIZ), 2);
> +   PUSH_DATA (push, ( width << 16) | dstx);
> +   PUSH_DATA (push, (height << 16) | dsty);
> +   BEGIN_NV04(push, NV50_3D(SCISSOR_HORIZ(0)), 2);
> +   PUSH_DATA (push, 8192 << 16);
> +   PUSH_DATA (push, 8192 << 16);
> +   nv50->scissors_dirty |= 1;
> +
>     BEGIN_NV04(push, NV50_3D(RT_CONTROL), 1);
>     PUSH_DATA (push, 1);
>     BEGIN_NV04(push, NV50_3D(RT_ADDRESS_HIGH(0)), 5);
> @@ -325,7 +333,7 @@ nv50_clear_render_target(struct pipe_context *pipe,
>                   (z << NV50_3D_CLEAR_BUFFERS_LAYER__SHIFT));
>     }
>  
> -   nv50->dirty |= NV50_NEW_FRAMEBUFFER;
> +   nv50->dirty |= NV50_NEW_FRAMEBUFFER | NV50_NEW_SCISSOR;
>  }
>  
>  static void
> @@ -364,6 +372,14 @@ nv50_clear_depth_stencil(struct pipe_context *pipe,
>  
>     PUSH_REFN(push, bo, mt->base.domain | NOUVEAU_BO_WR);
>  
> +   BEGIN_NV04(push, NV50_3D(SCREEN_SCISSOR_HORIZ), 2);
> +   PUSH_DATA (push, ( width << 16) | dstx);
> +   PUSH_DATA (push, (height << 16) | dsty);
> +   BEGIN_NV04(push, NV50_3D(SCISSOR_HORIZ(0)), 2);
> +   PUSH_DATA (push, 8192 << 16);
> +   PUSH_DATA (push, 8192 << 16);
> +   nv50->scissors_dirty |= 1;
> +
>     BEGIN_NV04(push, NV50_3D(ZETA_ADDRESS_HIGH), 5);
>     PUSH_DATAh(push, bo->offset + sf->offset);
>     PUSH_DATA (push, bo->offset + sf->offset);
> @@ -390,7 +406,7 @@ nv50_clear_depth_stencil(struct pipe_context *pipe,
>                   (z << NV50_3D_CLEAR_BUFFERS_LAYER__SHIFT));
>     }
>  
> -   nv50->dirty |= NV50_NEW_FRAMEBUFFER;
> +   nv50->dirty |= NV50_NEW_FRAMEBUFFER | NV50_NEW_SCISSOR;
>  }
>  
>  void
> 

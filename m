From: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
Subject: Re: [PATCH 1/2] nv50: don't emit reloc markers after a
 referenced vtxbuf is mapped
Date: Sun, 20 Dec 2009 15:01:59 +0100
Message-ID: <4B2E2E57.5070902@student.tuwien.ac.at>
References: <1261314083-3294-1-git-send-email-madman2003@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1261314083-3294-1-git-send-email-madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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

On 20.12.2009 14:01, Maarten Maathuis wrote:+static int
> +nv50_pre_pipebuffer_map(struct pipe_screen *pscreen, struct pipe_buffer *pb,
> +	unsigned usage)
> +{
> +	struct nv50_screen *screen = nv50_screen(pscreen);
> +	struct nv50_context *ctx = screen->cur_ctx;
> +
> +	if (!(pb->usage & PIPE_BUFFER_USAGE_VERTEX))
> +		return 0;
> +
> +	/* Our vtxbuf got mapped, it can no longer be considered part of current
> +	 * state, mark it as such, to avoid problematic relocs. */
> +	if (ctx && ctx->state.vtxbuf && so_bo_is_reloc(ctx->state.vtxbuf,
> +		nouveau_bo(pb)))
> +		ctx->state.vtxbuf->emit_reloc_on_flush = false;
> +
> +	return 0;
> +}
> +
>   
Wouldn't it be better to instead kill the vtxbuf stateobj here and
set nv50->dirty |= NV50_NEW_ARRAYS ?
We won't be drawing at that moment, and thus validate will be
called again before using vtxbufs.
If we don't emit *ANY* relocations and we do not flush again before
the next draw, some relocs of state that wasn't updated might not be
in place.
I can't think a lot about it right now because I have to go now ...

Christoph
>  struct pipe_screen *
>  nv50_screen_create(struct pipe_winsys *ws, struct nouveau_device *dev)
>  {
> @@ -201,6 +220,7 @@ nv50_screen_create(struct pipe_winsys *ws, struct nouveau_device *dev)
>  	pscreen->get_param = nv50_screen_get_param;
>  	pscreen->get_paramf = nv50_screen_get_paramf;
>  	pscreen->is_format_supported = nv50_screen_is_format_supported;
> +	screen->base.pre_pipebuffer_map_callback = nv50_pre_pipebuffer_map;
>  
>  	nv50_screen_init_miptree_functions(pscreen);
>  	nv50_transfer_init_screen_functions(pscreen);
> diff --git a/src/gallium/drivers/nv50/nv50_screen.h b/src/gallium/drivers/nv50/nv50_screen.h
> index 61e24a5..a038a4e 100644
> --- a/src/gallium/drivers/nv50/nv50_screen.h
> +++ b/src/gallium/drivers/nv50/nv50_screen.h
> @@ -2,6 +2,7 @@
>  #define __NV50_SCREEN_H__
>  
>  #include "nouveau/nouveau_screen.h"
> +#include "nv50_context.h"
>  
>  struct nv50_screen {
>  	struct nouveau_screen base;
> @@ -9,6 +10,7 @@ struct nv50_screen {
>  	struct nouveau_winsys *nvws;
>  
>  	unsigned cur_pctx;
> +	struct nv50_context *cur_ctx;
>  
>  	struct nouveau_grobj *tesla;
>  	struct nouveau_grobj *eng2d;
> diff --git a/src/gallium/drivers/nv50/nv50_state_validate.c b/src/gallium/drivers/nv50/nv50_state_validate.c
> index 871e809..8cf4ff4 100644
> --- a/src/gallium/drivers/nv50/nv50_state_validate.c
> +++ b/src/gallium/drivers/nv50/nv50_state_validate.c
> @@ -185,6 +185,8 @@ nv50_state_emit(struct nv50_context *nv50)
>  	struct nv50_screen *screen = nv50->screen;
>  	struct nouveau_channel *chan = screen->base.channel;
>  
> +	screen->cur_ctx = nv50;
> +
>  	if (nv50->pctx_id != screen->cur_pctx) {
>  		if (nv50->state.fb)
>  			nv50->state.dirty |= NV50_NEW_FRAMEBUFFER;
> diff --git a/src/gallium/drivers/nv50/nv50_vbo.c b/src/gallium/drivers/nv50/nv50_vbo.c
> index db54380..ce6e4eb 100644
> --- a/src/gallium/drivers/nv50/nv50_vbo.c
> +++ b/src/gallium/drivers/nv50/nv50_vbo.c
> @@ -325,8 +325,10 @@ nv50_vbo_static_attrib(struct nv50_context *nv50, unsigned attrib,
>  		return FALSE;
>  
>  	ret = nouveau_bo_map(bo, NOUVEAU_BO_RD);
> -	if (ret)
> +	if (ret) {
> +		nouveau_bo_unmap(bo);
>  		return FALSE;
> +	}
>  	v = (float *)(bo->map + (vb->buffer_offset + ve->src_offset));
>  
>  	so = *pso;
>   

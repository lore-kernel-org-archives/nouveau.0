From: Roland Scheidegger <sroland@vmware.com>
Subject: Re: [PATCH] nv50: make sure to clear _all_ layers of all
 attachments
Date: Thu, 13 Feb 2014 17:38:43 +0100
Message-ID: <52FCF513.8040602@vmware.com>
References: <1392286416-16569-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <mesa-dev-bounces@lists.freedesktop.org>
In-Reply-To: <1392286416-16569-1-git-send-email-imirkin@alum.mit.edu>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/mesa-dev>
List-Post: <mailto:mesa-dev@lists.freedesktop.org>
List-Help: <mailto:mesa-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: mesa-dev-bounces@lists.freedesktop.org
Errors-To: mesa-dev-bounces@lists.freedesktop.org
To: Ilia Mirkin <imirkin@alum.mit.edu>, Christoph Bumiller <e0425955@student.tuwien.ac.at>, mesa-dev@lists.freedesktop.org, nouveau@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

Hmm that reminds me when I implemented layered rendering in llvmpipe I
figured we'd only need to store the min amount of layers, because
rendering is undefined if the index is higher anyway. But of course I
didn't think about clears so we can't do that now correctly. Ah well if
anyone would really care it is fixable...
In any case the idea behind the patch looks good to me.

Roland


Am 13.02.2014 11:13, schrieb Ilia Mirkin:
> Unfortunately there's only one RT_ARRAY_MODE setting for all
> attachments, so clears were previously truncated to the minimum number
> of layers any attachment had. Instead set the RT_ARRAY_MODE to 512 (the
> max number of layers) before doing the clear. This fixes
> gl-3.2-layered-rendering-clear-color-mismatched-layer-count.
> 
> Signed-off-by: Ilia Mirkin <imirkin@alum.mit.edu>
> ---
> 
> Haven't had a chance to do a full piglit run on this yet, but it does fix the
> failing test. Have a look. I'm not sure if zeta can have layers, it seems like
> a couple of things assumed it couldn't. I've changed that assumption around.
> 
>  src/gallium/drivers/nouveau/nv50/nv50_context.h       |  2 ++
>  .../drivers/nouveau/nv50/nv50_state_validate.c        |  1 +
>  src/gallium/drivers/nouveau/nv50/nv50_surface.c       | 19 +++++++++++++++++--
>  3 files changed, 20 insertions(+), 2 deletions(-)
> 
> diff --git a/src/gallium/drivers/nouveau/nv50/nv50_context.h b/src/gallium/drivers/nouveau/nv50/nv50_context.h
> index 57a3090..84ff46e 100644
> --- a/src/gallium/drivers/nouveau/nv50/nv50_context.h
> +++ b/src/gallium/drivers/nouveau/nv50/nv50_context.h
> @@ -173,6 +173,8 @@ struct nv50_context {
>  
>     boolean vbo_push_hint;
>  
> +   uint32_t rt_array_mode;
> +
>     struct pipe_query *cond_query;
>     boolean cond_cond;
>     uint cond_mode;
> diff --git a/src/gallium/drivers/nouveau/nv50/nv50_state_validate.c b/src/gallium/drivers/nouveau/nv50/nv50_state_validate.c
> index f953422..100d02d 100644
> --- a/src/gallium/drivers/nouveau/nv50/nv50_state_validate.c
> +++ b/src/gallium/drivers/nouveau/nv50/nv50_state_validate.c
> @@ -65,6 +65,7 @@ nv50_validate_fb(struct nv50_context *nv50)
>           PUSH_DATA (push, sf->height);
>           BEGIN_NV04(push, NV50_3D(RT_ARRAY_MODE), 1);
>           PUSH_DATA (push, array_mode | array_size);
> +         nv50->rt_array_mode = array_mode | array_size;
>        } else {
>           PUSH_DATA (push, 0);
>           PUSH_DATA (push, 0);
> diff --git a/src/gallium/drivers/nouveau/nv50/nv50_surface.c b/src/gallium/drivers/nouveau/nv50/nv50_surface.c
> index a22436b..68924c9 100644
> --- a/src/gallium/drivers/nouveau/nv50/nv50_surface.c
> +++ b/src/gallium/drivers/nouveau/nv50/nv50_surface.c
> @@ -303,7 +303,7 @@ nv50_clear_render_target(struct pipe_context *pipe,
>        PUSH_DATA(push, NV50_3D_RT_HORIZ_LINEAR | mt->level[0].pitch);
>     PUSH_DATA (push, sf->height);
>     BEGIN_NV04(push, NV50_3D(RT_ARRAY_MODE), 1);
> -   PUSH_DATA (push, 1);
> +   PUSH_DATA (push, 512);
>  
>     if (!nouveau_bo_memtype(bo)) {
>        BEGIN_NV04(push, NV50_3D(ZETA_ENABLE), 1);
> @@ -366,7 +366,7 @@ nv50_clear_depth_stencil(struct pipe_context *pipe,
>     PUSH_DATA (push, bo->offset + sf->offset);
>     PUSH_DATA (push, nv50_format_table[dst->format].rt);
>     PUSH_DATA (push, mt->level[sf->base.u.tex.level].tile_mode);
> -   PUSH_DATA (push, 0);
> +   PUSH_DATA (push, mt->layer_stride >> 2);
>     BEGIN_NV04(push, NV50_3D(ZETA_ENABLE), 1);
>     PUSH_DATA (push, 1);
>     BEGIN_NV04(push, NV50_3D(ZETA_HORIZ), 3);
> @@ -374,6 +374,9 @@ nv50_clear_depth_stencil(struct pipe_context *pipe,
>     PUSH_DATA (push, sf->height);
>     PUSH_DATA (push, (1 << 16) | 1);
>  
> +   BEGIN_NV04(push, NV50_3D(RT_ARRAY_MODE), 1);
> +   PUSH_DATA (push, 512);
> +
>     BEGIN_NV04(push, NV50_3D(VIEWPORT_HORIZ(0)), 2);
>     PUSH_DATA (push, (width << 16) | dstx);
>     PUSH_DATA (push, (height << 16) | dsty);
> @@ -402,6 +405,14 @@ nv50_clear(struct pipe_context *pipe, unsigned buffers,
>     if (!nv50_state_validate(nv50, NV50_NEW_FRAMEBUFFER, 9 + (fb->nr_cbufs * 2)))
>        return;
>  
> +   /* We have to clear ALL of the layers, not up to the min number of layers
> +    * of any attachment. Don't touch 3d textures, they can't be arrays. The
> +    * above nv50_state_validate call will have written to rt_array_mode. */
> +   if (!(nv50->rt_array_mode & NV50_3D_RT_ARRAY_MODE_MODE_3D)) {
> +      BEGIN_NV04(push, NV50_3D(RT_ARRAY_MODE), 1);
> +      PUSH_DATA (push, 512);
> +   }
> +
>     if (buffers & PIPE_CLEAR_COLOR && fb->nr_cbufs) {
>        BEGIN_NV04(push, NV50_3D(CLEAR_COLOR(0)), 4);
>        PUSH_DATAf(push, color->f[0]);
> @@ -459,6 +470,10 @@ nv50_clear(struct pipe_context *pipe, unsigned buffers,
>                      (j << NV50_3D_CLEAR_BUFFERS_LAYER__SHIFT));
>        }
>     }
> +
> +   /* restore the array mode */
> +   BEGIN_NV04(push, NV50_3D(RT_ARRAY_MODE), 1);
> +   PUSH_DATA (push, nv50->rt_array_mode);
>  }
>  
>  
> 

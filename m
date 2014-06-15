From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: Re: [PATCH v2 1/3] nvc0: implement multiple
 viewports/scissors, enable ARB_viewport_array
Date: Sun, 15 Jun 2014 17:11:12 -0400
Message-ID: <CAKb7Uvh0+q9D960NvUMR8iaiSMfeDb8xMeJ=LLKqgWvrG05Zmw@mail.gmail.com>
References: <1402860246-24772-1-git-send-email-tobias.johannes.klausmann@mni.thm.de>
 <1402860246-24772-2-git-send-email-tobias.johannes.klausmann@mni.thm.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <mesa-dev-bounces@lists.freedesktop.org>
In-Reply-To: <1402860246-24772-2-git-send-email-tobias.johannes.klausmann@mni.thm.de>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/mesa-dev>,
 <mailto:mesa-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/mesa-dev>
List-Post: <mailto:mesa-dev@lists.freedesktop.org>
List-Help: <mailto:mesa-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/mesa-dev>,
 <mailto:mesa-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: mesa-dev-bounces@lists.freedesktop.org
Sender: "mesa-dev" <mesa-dev-bounces@lists.freedesktop.org>
To: Tobias Klausmann <tobias.johannes.klausmann@mni.thm.de>
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "mesa-dev@lists.freedesktop.org" <mesa-dev@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

I've made a few small fixes to this -- you forget to set the
scissors/viewports dirty to ~0 on context switch, and also marking the
first scissor dirty after a 3d blit (which I was forgetting to do on
nv50 as well... oops). I'll push this out shortly with my
modifications.

Thanks for the contribution!

  -ilia

On Sun, Jun 15, 2014 at 3:24 PM, Tobias Klausmann
<tobias.johannes.klausmann@mni.thm.de> wrote:
> Signed-off-by: Tobias Klausmann <tobias.johannes.klausmann@mni.thm.de>
> ---
>  src/gallium/drivers/nouveau/nvc0/nvc0_context.h    |   7 +-
>  src/gallium/drivers/nouveau/nvc0/nvc0_program.c    |   2 +-
>  src/gallium/drivers/nouveau/nvc0/nvc0_screen.c     |  20 ++--
>  src/gallium/drivers/nouveau/nvc0/nvc0_screen.h     |   3 +
>  src/gallium/drivers/nouveau/nvc0/nvc0_state.c      |  27 +++--
>  .../drivers/nouveau/nvc0/nvc0_state_validate.c     | 116 +++++++++++++--------
>  6 files changed, 112 insertions(+), 63 deletions(-)
>
> diff --git a/src/gallium/drivers/nouveau/nvc0/nvc0_context.h b/src/gallium/drivers/nouveau/nvc0/nvc0_context.h
> index 76416a0..674dd3c 100644
> --- a/src/gallium/drivers/nouveau/nvc0/nvc0_context.h
> +++ b/src/gallium/drivers/nouveau/nvc0/nvc0_context.h
> @@ -178,8 +178,11 @@ struct nvc0_context {
>     struct pipe_blend_color blend_colour;
>     struct pipe_stencil_ref stencil_ref;
>     struct pipe_poly_stipple stipple;
> -   struct pipe_scissor_state scissor;
> -   struct pipe_viewport_state viewport;
> +
> +   struct pipe_scissor_state scissors[NVC0_MAX_VIEWPORTS];
> +   unsigned scissors_dirty;
> +   struct pipe_viewport_state viewports[NVC0_MAX_VIEWPORTS];
> +   unsigned viewports_dirty;
>     struct pipe_clip_state clip;
>
>     unsigned sample_mask;
> diff --git a/src/gallium/drivers/nouveau/nvc0/nvc0_program.c b/src/gallium/drivers/nouveau/nvc0/nvc0_program.c
> index 1c82a9a..667fbc8 100644
> --- a/src/gallium/drivers/nouveau/nvc0/nvc0_program.c
> +++ b/src/gallium/drivers/nouveau/nvc0/nvc0_program.c
> @@ -64,7 +64,7 @@ nvc0_shader_output_address(unsigned sn, unsigned si, unsigned ubase)
>     case NV50_SEMANTIC_TESSFACTOR:    return 0x000 + si * 0x4;
>     case TGSI_SEMANTIC_PRIMID:        return 0x060;
>     case TGSI_SEMANTIC_LAYER:         return 0x064;
> -   case NV50_SEMANTIC_VIEWPORTINDEX: return 0x068;
> +   case TGSI_SEMANTIC_VIEWPORT_INDEX:return 0x068;
>     case TGSI_SEMANTIC_PSIZE:         return 0x06c;
>     case TGSI_SEMANTIC_POSITION:      return 0x070;
>     case TGSI_SEMANTIC_GENERIC:       return ubase + si * 0x10;
> diff --git a/src/gallium/drivers/nouveau/nvc0/nvc0_screen.c b/src/gallium/drivers/nouveau/nvc0/nvc0_screen.c
> index 3e6b011..3fdb6ae 100644
> --- a/src/gallium/drivers/nouveau/nvc0/nvc0_screen.c
> +++ b/src/gallium/drivers/nouveau/nvc0/nvc0_screen.c
> @@ -183,7 +183,7 @@ nvc0_screen_get_param(struct pipe_screen *pscreen, enum pipe_cap param)
>     case PIPE_CAP_FAKE_SW_MSAA:
>        return 0;
>     case PIPE_CAP_MAX_VIEWPORTS:
> -      return 1;
> +      return NVC0_MAX_VIEWPORTS;
>     case PIPE_CAP_TEXTURE_QUERY_LOD:
>     case PIPE_CAP_SAMPLE_SHADING:
>     case PIPE_CAP_TEXTURE_GATHER_OFFSETS:
> @@ -933,19 +933,23 @@ nvc0_screen_create(struct nouveau_device *dev)
>
>     BEGIN_NVC0(push, NVC0_3D(VIEWPORT_TRANSFORM_EN), 1);
>     PUSH_DATA (push, 1);
> -   BEGIN_NVC0(push, NVC0_3D(DEPTH_RANGE_NEAR(0)), 2);
> -   PUSH_DATAf(push, 0.0f);
> -   PUSH_DATAf(push, 1.0f);
> +   for (i = 0; i < NVC0_MAX_VIEWPORTS; i++) {
> +      BEGIN_NVC0(push, NVC0_3D(DEPTH_RANGE_NEAR(i)), 2);
> +      PUSH_DATAf(push, 0.0f);
> +      PUSH_DATAf(push, 1.0f);
> +   }
>     BEGIN_NVC0(push, NVC0_3D(VIEW_VOLUME_CLIP_CTRL), 1);
>     PUSH_DATA (push, NVC0_3D_VIEW_VOLUME_CLIP_CTRL_UNK1_UNK1);
>
>     /* We use scissors instead of exact view volume clipping,
>      * so they're always enabled.
>      */
> -   BEGIN_NVC0(push, NVC0_3D(SCISSOR_ENABLE(0)), 3);
> -   PUSH_DATA (push, 1);
> -   PUSH_DATA (push, 8192 << 16);
> -   PUSH_DATA (push, 8192 << 16);
> +   for (i = 0; i < NVC0_MAX_VIEWPORTS; i++) {
> +      BEGIN_NVC0(push, NVC0_3D(SCISSOR_ENABLE(i)), 3);
> +      PUSH_DATA (push, 1);
> +      PUSH_DATA (push, 8192 << 16);
> +      PUSH_DATA (push, 8192 << 16);
> +   }
>
>  #define MK_MACRO(m, n) i = nvc0_graph_set_macro(screen, m, i, sizeof(n), n);
>
> diff --git a/src/gallium/drivers/nouveau/nvc0/nvc0_screen.h b/src/gallium/drivers/nouveau/nvc0/nvc0_screen.h
> index c58add5..4802057 100644
> --- a/src/gallium/drivers/nouveau/nvc0/nvc0_screen.h
> +++ b/src/gallium/drivers/nouveau/nvc0/nvc0_screen.h
> @@ -20,6 +20,9 @@
>
>  #define NVC0_MAX_SURFACE_SLOTS 16
>
> +#define NVC0_MAX_VIEWPORTS 16
> +
> +
>  struct nvc0_context;
>
>  struct nvc0_blitter;
> diff --git a/src/gallium/drivers/nouveau/nvc0/nvc0_state.c b/src/gallium/drivers/nouveau/nvc0/nvc0_state.c
> index 27e5cd8..c92aaac 100644
> --- a/src/gallium/drivers/nouveau/nvc0/nvc0_state.c
> +++ b/src/gallium/drivers/nouveau/nvc0/nvc0_state.c
> @@ -909,10 +909,17 @@ nvc0_set_scissor_states(struct pipe_context *pipe,
>                          unsigned num_scissors,
>                          const struct pipe_scissor_state *scissor)
>  {
> -    struct nvc0_context *nvc0 = nvc0_context(pipe);
> +   struct nvc0_context *nvc0 = nvc0_context(pipe);
> +   int i;
>
> -    nvc0->scissor = *scissor;
> -    nvc0->dirty |= NVC0_NEW_SCISSOR;
> +   assert(start_slot + num_scissors <= NVC0_MAX_VIEWPORTS);
> +   for (i = 0; i < num_scissors; i++) {
> +      if (!memcmp(&nvc0->scissors[start_slot + i], &scissor[i], sizeof(*scissor)))
> +         continue;
> +      nvc0->scissors[start_slot + i] = scissor[i];
> +      nvc0->scissors_dirty |= 1 << (start_slot + i);
> +      nvc0->dirty |= NVC0_NEW_SCISSOR;
> +   }
>  }
>
>  static void
> @@ -921,10 +928,18 @@ nvc0_set_viewport_states(struct pipe_context *pipe,
>                           unsigned num_viewports,
>                           const struct pipe_viewport_state *vpt)
>  {
> -    struct nvc0_context *nvc0 = nvc0_context(pipe);
> +   struct nvc0_context *nvc0 = nvc0_context(pipe);
> +   int i;
> +
> +   assert(start_slot + num_viewports <= NVC0_MAX_VIEWPORTS);
> +   for (i = 0; i < num_viewports; i++) {
> +      if (!memcmp(&nvc0->viewports[start_slot + i], &vpt[i], sizeof(*vpt)))
> +         continue;
> +      nvc0->viewports[start_slot + i] = vpt[i];
> +      nvc0->viewports_dirty |= 1 << (start_slot + i);
> +      nvc0->dirty |= NVC0_NEW_VIEWPORT;
> +   }
>
> -    nvc0->viewport = *vpt;
> -    nvc0->dirty |= NVC0_NEW_VIEWPORT;
>  }
>
>  static void
> diff --git a/src/gallium/drivers/nouveau/nvc0/nvc0_state_validate.c b/src/gallium/drivers/nouveau/nvc0/nvc0_state_validate.c
> index dcec910..7383b6a 100644
> --- a/src/gallium/drivers/nouveau/nvc0/nvc0_state_validate.c
> +++ b/src/gallium/drivers/nouveau/nvc0/nvc0_state_validate.c
> @@ -236,59 +236,83 @@ nvc0_validate_stipple(struct nvc0_context *nvc0)
>  static void
>  nvc0_validate_scissor(struct nvc0_context *nvc0)
>  {
> -    struct nouveau_pushbuf *push = nvc0->base.pushbuf;
> -    struct pipe_scissor_state *s = &nvc0->scissor;
> +   int i;
> +   struct nouveau_pushbuf *push = nvc0->base.pushbuf;
>
> -    if (!(nvc0->dirty & NVC0_NEW_SCISSOR) &&
> -        nvc0->rast->pipe.scissor == nvc0->state.scissor)
> -       return;
> -    nvc0->state.scissor = nvc0->rast->pipe.scissor;
> +   if (!(nvc0->dirty & NVC0_NEW_SCISSOR) &&
> +      nvc0->rast->pipe.scissor == nvc0->state.scissor)
> +      return;
>
> -    BEGIN_NVC0(push, NVC0_3D(SCISSOR_HORIZ(0)), 2);
> -    if (nvc0->rast->pipe.scissor) {
> -       PUSH_DATA(push, (s->maxx << 16) | s->minx);
> -       PUSH_DATA(push, (s->maxy << 16) | s->miny);
> -    } else {
> -       PUSH_DATA(push, (0xffff << 16) | 0);
> -       PUSH_DATA(push, (0xffff << 16) | 0);
> -    }
> +   if (nvc0->state.scissor != nvc0->rast->pipe.scissor)
> +      nvc0->scissors_dirty = (1 << NVC0_MAX_VIEWPORTS) - 1;
> +
> +   nvc0->state.scissor = nvc0->rast->pipe.scissor;
> +
> +   for (i = 0; i < NVC0_MAX_VIEWPORTS; i++) {
> +      struct pipe_scissor_state *s = &nvc0->scissors[i];
> +      if (!(nvc0->scissors_dirty & (1 << i)))
> +         continue;
> +
> +
> +      BEGIN_NVC0(push, NVC0_3D(SCISSOR_HORIZ(i)), 2);
> +      if (nvc0->rast->pipe.scissor) {
> +         PUSH_DATA(push, (s->maxx << 16) | s->minx);
> +         PUSH_DATA(push, (s->maxy << 16) | s->miny);
> +      } else {
> +         PUSH_DATA(push, (0xffff << 16) | 0);
> +         PUSH_DATA(push, (0xffff << 16) | 0);
> +      }
> +   }
> +   nvc0->scissors_dirty = 0;
>  }
>
>  static void
>  nvc0_validate_viewport(struct nvc0_context *nvc0)
>  {
> -    struct nouveau_pushbuf *push = nvc0->base.pushbuf;
> -    struct pipe_viewport_state *vp = &nvc0->viewport;
> -    int x, y, w, h;
> -    float zmin, zmax;
> -
> -    BEGIN_NVC0(push, NVC0_3D(VIEWPORT_TRANSLATE_X(0)), 3);
> -    PUSH_DATAf(push, vp->translate[0]);
> -    PUSH_DATAf(push, vp->translate[1]);
> -    PUSH_DATAf(push, vp->translate[2]);
> -    BEGIN_NVC0(push, NVC0_3D(VIEWPORT_SCALE_X(0)), 3);
> -    PUSH_DATAf(push, vp->scale[0]);
> -    PUSH_DATAf(push, vp->scale[1]);
> -    PUSH_DATAf(push, vp->scale[2]);
> -
> -    /* now set the viewport rectangle to viewport dimensions for clipping */
> -
> -    x = util_iround(MAX2(0.0f, vp->translate[0] - fabsf(vp->scale[0])));
> -    y = util_iround(MAX2(0.0f, vp->translate[1] - fabsf(vp->scale[1])));
> -    w = util_iround(vp->translate[0] + fabsf(vp->scale[0])) - x;
> -    h = util_iround(vp->translate[1] + fabsf(vp->scale[1])) - y;
> -
> -    zmin = vp->translate[2] - fabsf(vp->scale[2]);
> -    zmax = vp->translate[2] + fabsf(vp->scale[2]);
> -
> -    nvc0->vport_int[0] = (w << 16) | x;
> -    nvc0->vport_int[1] = (h << 16) | y;
> -    BEGIN_NVC0(push, NVC0_3D(VIEWPORT_HORIZ(0)), 2);
> -    PUSH_DATA (push, nvc0->vport_int[0]);
> -    PUSH_DATA (push, nvc0->vport_int[1]);
> -    BEGIN_NVC0(push, NVC0_3D(DEPTH_RANGE_NEAR(0)), 2);
> -    PUSH_DATAf(push, zmin);
> -    PUSH_DATAf(push, zmax);
> +   struct nouveau_pushbuf *push = nvc0->base.pushbuf;
> +   int x, y, w, h, i;
> +   float zmin, zmax;
> +
> +   for (i = 0; i < NVC0_MAX_VIEWPORTS; i++) {
> +      struct pipe_viewport_state *vp = &nvc0->viewports[i];
> +
> +      if (!(nvc0->viewports_dirty & (1 << i)))
> +         continue;
> +
> +      BEGIN_NVC0(push, NVC0_3D(VIEWPORT_TRANSLATE_X(i)), 3);
> +      PUSH_DATAf(push, vp->translate[0]);
> +      PUSH_DATAf(push, vp->translate[1]);
> +      PUSH_DATAf(push, vp->translate[2]);
> +
> +      BEGIN_NVC0(push, NVC0_3D(VIEWPORT_SCALE_X(i)), 3);
> +      PUSH_DATAf(push, vp->scale[0]);
> +      PUSH_DATAf(push, vp->scale[1]);
> +      PUSH_DATAf(push, vp->scale[2]);
> +
> +      /* now set the viewport rectangle to viewport dimensions for clipping */
> +
> +      x = util_iround(MAX2(0.0f, vp->translate[0] - fabsf(vp->scale[0])));
> +      y = util_iround(MAX2(0.0f, vp->translate[1] - fabsf(vp->scale[1])));
> +      w = util_iround(vp->translate[0] + fabsf(vp->scale[0])) - x;
> +      h = util_iround(vp->translate[1] + fabsf(vp->scale[1])) - y;
> +
> +      BEGIN_NVC0(push, NVC0_3D(VIEWPORT_HORIZ(i)), 2);
> +      PUSH_DATA (push, (w << 16) | x);
> +      PUSH_DATA (push, (h << 16) | y);
> +
> +      if (i == 0) {
> +         nvc0->vport_int[0] = (w << 16) | x;
> +         nvc0->vport_int[1] = (h << 16) | y;
> +      }
> +
> +      zmin = vp->translate[2] - fabsf(vp->scale[2]);
> +      zmax = vp->translate[2] + fabsf(vp->scale[2]);
> +
> +      BEGIN_NVC0(push, NVC0_3D(DEPTH_RANGE_NEAR(i)), 2);
> +      PUSH_DATAf(push, zmin);
> +      PUSH_DATAf(push, zmax);
> +   }
> +   nvc0->viewports_dirty = 0;
>  }
>
>  static INLINE void
> --
> 1.8.4.5
>

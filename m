From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: [PATCH] nouveau: fix chipset checks for nv1a by using
	the oclass instead
Date: Wed, 12 Feb 2014 21:10:53 -0500
Message-ID: <CAKb7UvjLGSB2AspKpNtWKJ_9qiVsnzSGmp6fam1C2Pf=2Q6UPg@mail.gmail.com>
References: <1392256976-24050-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1392256976-24050-1-git-send-email-imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>, "mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Cc: "9.2 10.0 10.1" <mesa-stable-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "John F. Godfrey" <jfgodfrey-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Wed, Feb 12, 2014 at 9:02 PM, Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> wrote:
> Commit f4ebcd133b9 ("dri/nouveau: NV17_3D class is not available for
> NV1a chipset") fixed this partially by using the correct 3d class.
> However there were a lot of checks left over comparing against the
> chipset.
>
> Reported-and-tested-by: John F. Godfrey <jfgodfrey-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>

Er, that should also have a

Cc: 9.2 10.0 10.1 <mesa-stable-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>

> ---
>
> I guess I didn't have to change the >= 0x11 checks, but seemed nicer for
> consistency.
>
>  src/mesa/drivers/dri/nouveau/nv10_context.c      | 8 ++++----
>  src/mesa/drivers/dri/nouveau/nv10_state_fb.c     | 4 ++--
>  src/mesa/drivers/dri/nouveau/nv10_state_raster.c | 3 ++-
>  3 files changed, 8 insertions(+), 7 deletions(-)
>
> diff --git a/src/mesa/drivers/dri/nouveau/nv10_context.c b/src/mesa/drivers/dri/nouveau/nv10_context.c
> index 8582cb2..4773014 100644
> --- a/src/mesa/drivers/dri/nouveau/nv10_context.c
> +++ b/src/mesa/drivers/dri/nouveau/nv10_context.c
> @@ -63,7 +63,7 @@ nv10_use_viewport_zclear(struct gl_context *ctx)
>         struct gl_framebuffer *fb = ctx->DrawBuffer;
>         struct gl_renderbuffer *depthRb = fb->Attachment[BUFFER_DEPTH].Renderbuffer;
>
> -       return context_chipset(ctx) < 0x17 &&
> +       return context_eng3d(ctx)->oclass < NV17_3D_CLASS &&
>                 !nctx->hierz.clear_blocked && depthRb &&
>                 (_mesa_get_format_bits(depthRb->Format,
>                                        GL_DEPTH_BITS) >= 24);
> @@ -184,7 +184,7 @@ nv10_clear(struct gl_context *ctx, GLbitfield buffers)
>         }
>
>         if ((buffers & BUFFER_BIT_DEPTH) && ctx->Depth.Mask) {
> -               if (context_chipset(ctx) >= 0x17)
> +               if (context_eng3d(ctx)->oclass >= NV17_3D_CLASS)
>                         nv17_zclear(ctx, &buffers);
>                 else
>                         nv10_zclear(ctx, &buffers);
> @@ -245,7 +245,7 @@ nv10_hwctx_init(struct gl_context *ctx)
>         BEGIN_NV04(push, NV04_GRAPH(3D, NOP), 1);
>         PUSH_DATA (push, 0);
>
> -       if (context_chipset(ctx) >= 0x17) {
> +       if (context_eng3d(ctx)->oclass >= NV17_3D_CLASS) {
>                 BEGIN_NV04(push, NV17_3D(UNK01AC), 2);
>                 PUSH_DATA (push, fifo->vram);
>                 PUSH_DATA (push, fifo->vram);
> @@ -257,7 +257,7 @@ nv10_hwctx_init(struct gl_context *ctx)
>                 PUSH_DATA (push, 1);
>         }
>
> -       if (context_chipset(ctx) >= 0x11) {
> +       if (context_eng3d(ctx)->oclass >= NV15_3D_CLASS) {
>                 BEGIN_NV04(push, SUBC_3D(0x120), 3);
>                 PUSH_DATA (push, 0);
>                 PUSH_DATA (push, 1);
> diff --git a/src/mesa/drivers/dri/nouveau/nv10_state_fb.c b/src/mesa/drivers/dri/nouveau/nv10_state_fb.c
> index 19769e5..fb66b2d 100644
> --- a/src/mesa/drivers/dri/nouveau/nv10_state_fb.c
> +++ b/src/mesa/drivers/dri/nouveau/nv10_state_fb.c
> @@ -106,7 +106,7 @@ nv10_emit_framebuffer(struct gl_context *ctx, int emit)
>
>         /* At least nv11 seems to get sad if we don't do this before
>          * swapping RTs.*/
> -       if (context_chipset(ctx) < 0x17) {
> +       if (context_eng3d(ctx)->oclass < NV17_3D_CLASS) {
>                 int i;
>
>                 for (i = 0; i < 6; i++) {
> @@ -140,7 +140,7 @@ nv10_emit_framebuffer(struct gl_context *ctx, int emit)
>                 PUSH_MTHDl(push, NV10_3D(ZETA_OFFSET), BUFCTX_FB,
>                                  s->bo, 0, bo_flags);
>
> -               if (context_chipset(ctx) >= 0x17) {
> +               if (context_eng3d(ctx)->oclass >= NV17_3D_CLASS) {
>                         setup_hierz_buffer(ctx);
>                         context_dirty(ctx, ZCLEAR);
>                 }
> diff --git a/src/mesa/drivers/dri/nouveau/nv10_state_raster.c b/src/mesa/drivers/dri/nouveau/nv10_state_raster.c
> index bd4a78e..da414a0 100644
> --- a/src/mesa/drivers/dri/nouveau/nv10_state_raster.c
> +++ b/src/mesa/drivers/dri/nouveau/nv10_state_raster.c
> @@ -28,6 +28,7 @@
>  #include "nouveau_context.h"
>  #include "nouveau_gldefs.h"
>  #include "nouveau_util.h"
> +#include "nv_object.xml.h"
>  #include "nv10_3d.xml.h"
>  #include "nv10_driver.h"
>
> @@ -120,7 +121,7 @@ nv10_emit_logic_opcode(struct gl_context *ctx, int emit)
>         struct nouveau_pushbuf *push = context_push(ctx);
>
>         assert(!ctx->Color.ColorLogicOpEnabled
> -              || context_chipset(ctx) >= 0x11);
> +              || context_eng3d(ctx)->oclass >= NV15_3D_CLASS);
>
>         BEGIN_NV04(push, NV11_3D(COLOR_LOGIC_OP_ENABLE), 2);
>         PUSH_DATAb(push, ctx->Color.ColorLogicOpEnabled);
> --
> 1.8.3.2
>

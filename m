From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Mesa-dev] [PATCH] nv50,
 nvc0: only clear out the buffers that we were asked to clear
Date: Thu, 23 Jan 2014 20:11:03 +0000
Message-ID: <52E17757.2010807@gmail.com>
References: <1389925395-22379-1-git-send-email-imirkin@alum.mit.edu>
	<1389925395-22379-2-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1389925395-22379-2-git-send-email-imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>, mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On 17/01/14 02:23, Ilia Mirkin wrote:
> Fixes fbo-drawbuffers-none glClearBuffer piglit test.
> 
> Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
> ---
> 
> Only tested on nv50, but implementations seem similar enough.
> 
>  src/gallium/drivers/nouveau/nv50/nv50_surface.c | 17 +++++++++--------
>  src/gallium/drivers/nouveau/nvc0/nvc0_surface.c | 17 +++++++++--------
>  2 files changed, 18 insertions(+), 16 deletions(-)
> 
> diff --git a/src/gallium/drivers/nouveau/nv50/nv50_surface.c b/src/gallium/drivers/nouveau/nv50/nv50_surface.c
> index 358f57a..eb27429 100644
> --- a/src/gallium/drivers/nouveau/nv50/nv50_surface.c
> +++ b/src/gallium/drivers/nouveau/nv50/nv50_surface.c
> @@ -408,9 +408,6 @@ nv50_clear(struct pipe_context *pipe, unsigned buffers,
>        PUSH_DATAf(push, color->f[1]);
>        PUSH_DATAf(push, color->f[2]);
>        PUSH_DATAf(push, color->f[3]);
> -      mode =
> -         NV50_3D_CLEAR_BUFFERS_R | NV50_3D_CLEAR_BUFFERS_G |
> -         NV50_3D_CLEAR_BUFFERS_B | NV50_3D_CLEAR_BUFFERS_A;
>     }
>  
I'm not sure why you've dropped the mode from above. I'm guessing that
the initial assumption was that if there is a color buffer it must be at
cbuf[0].

The corrected version in your github branch looks alot better, it
handles the above case and does not overwrite the clear buffer on rt0.

That one is Reviewed-by: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>     if (buffers & PIPE_CLEAR_DEPTH) {
> @@ -425,12 +422,16 @@ nv50_clear(struct pipe_context *pipe, unsigned buffers,
>        mode |= NV50_3D_CLEAR_BUFFERS_S;
>     }
>  
> -   BEGIN_NV04(push, NV50_3D(CLEAR_BUFFERS), 1);
> -   PUSH_DATA (push, mode);
> -
> -   for (i = 1; i < fb->nr_cbufs; i++) {
> +   if (mode) {
>        BEGIN_NV04(push, NV50_3D(CLEAR_BUFFERS), 1);
> -      PUSH_DATA (push, (i << 6) | 0x3c);
> +      PUSH_DATA (push, mode);
> +   }
> +
> +   for (i = 0; i < fb->nr_cbufs; i++) {
> +      if (buffers & (PIPE_CLEAR_COLOR0 << i)) {
> +         BEGIN_NV04(push, NV50_3D(CLEAR_BUFFERS), 1);
> +         PUSH_DATA (push, (i << 6) | 0x3c);
> +      }
>     }
>  }
>  
> diff --git a/src/gallium/drivers/nouveau/nvc0/nvc0_surface.c b/src/gallium/drivers/nouveau/nvc0/nvc0_surface.c
> index 5375bd4..0c12bce 100644
> --- a/src/gallium/drivers/nouveau/nvc0/nvc0_surface.c
> +++ b/src/gallium/drivers/nouveau/nvc0/nvc0_surface.c
> @@ -427,9 +427,6 @@ nvc0_clear(struct pipe_context *pipe, unsigned buffers,
>        PUSH_DATAf(push, color->f[1]);
>        PUSH_DATAf(push, color->f[2]);
>        PUSH_DATAf(push, color->f[3]);
> -      mode =
> -         NVC0_3D_CLEAR_BUFFERS_R | NVC0_3D_CLEAR_BUFFERS_G |
> -         NVC0_3D_CLEAR_BUFFERS_B | NVC0_3D_CLEAR_BUFFERS_A;
>     }
>  
>     if (buffers & PIPE_CLEAR_DEPTH) {
> @@ -444,12 +441,16 @@ nvc0_clear(struct pipe_context *pipe, unsigned buffers,
>        mode |= NVC0_3D_CLEAR_BUFFERS_S;
>     }
>  
> -   BEGIN_NVC0(push, NVC0_3D(CLEAR_BUFFERS), 1);
> -   PUSH_DATA (push, mode);
> -
> -   for (i = 1; i < fb->nr_cbufs; i++) {
> +   if (mode) {
>        BEGIN_NVC0(push, NVC0_3D(CLEAR_BUFFERS), 1);
> -      PUSH_DATA (push, (i << 6) | 0x3c);
> +      PUSH_DATA (push, mode);
> +   }
> +
> +   for (i = 0; i < fb->nr_cbufs; i++) {
> +      if (buffers & (PIPE_CLEAR_COLOR0 << i)) {
> +         BEGIN_NVC0(push, NVC0_3D(CLEAR_BUFFERS), 1);
> +         PUSH_DATA (push, (i << 6) | 0x3c);
> +      }
>     }
>  }
>  
> 

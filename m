From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: [PATCH 2/3] nvc0: mark scissor in nvc0_clear_{}
Date: Sat, 14 Jun 2014 11:46:46 -0400
Message-ID: <CAKb7UvgfWjJUeWj5WcvNQ41kJALyuJzR-29xn-6Ns+2hQaYjjw@mail.gmail.com>
References: <1402756870-2207-1-git-send-email-tobias.johannes.klausmann@mni.thm.de>
 <1402756870-2207-3-git-send-email-tobias.johannes.klausmann@mni.thm.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1402756870-2207-3-git-send-email-tobias.johannes.klausmann-AqjdNwhu20eELgA04lAiVw@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Tobias Klausmann <tobias.johannes.klausmann-AqjdNwhu20eELgA04lAiVw@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Sat, Jun 14, 2014 at 10:41 AM, Tobias Klausmann
<tobias.johannes.klausmann-AqjdNwhu20eELgA04lAiVw@public.gmane.org> wrote:
> Signed-off-by: Tobias Klausmann <tobias.johannes.klausmann-AqjdNwhu20eELgA04lAiVw@public.gmane.org>
> ---
>  src/gallium/drivers/nouveau/nvc0/nvc0_surface.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/src/gallium/drivers/nouveau/nvc0/nvc0_surface.c b/src/gallium/drivers/nouveau/nvc0/nvc0_surface.c
> index c28ec6d..72227b8 100644
> --- a/src/gallium/drivers/nouveau/nvc0/nvc0_surface.c
> +++ b/src/gallium/drivers/nouveau/nvc0/nvc0_surface.c
> @@ -298,6 +298,7 @@ nvc0_clear_render_target(struct pipe_context *pipe,
>     BEGIN_NVC0(push, NVC0_3D(SCREEN_SCISSOR_HORIZ), 2);
>     PUSH_DATA (push, ( width << 16) | dstx);
>     PUSH_DATA (push, (height << 16) | dsty);
> +   nvc0->scissors_dirty |= 1;

Can you explain why these changes are needed? You don't modify the
scissor here (only the screen scissor)...

>
>     BEGIN_NVC0(push, NVC0_3D(RT_CONTROL), 1);
>     PUSH_DATA (push, 1);
> @@ -447,6 +448,7 @@ nvc0_clear_buffer(struct pipe_context *pipe,
>     BEGIN_NVC0(push, NVC0_3D(SCREEN_SCISSOR_HORIZ), 2);
>     PUSH_DATA (push, width << 16);
>     PUSH_DATA (push, height << 16);
> +   nvc0->scissors_dirty |= 1;
>
>     IMMED_NVC0(push, NVC0_3D(RT_CONTROL), 1);
>
> @@ -521,6 +523,7 @@ nvc0_clear_depth_stencil(struct pipe_context *pipe,
>         BEGIN_NVC0(push, NVC0_3D(SCREEN_SCISSOR_HORIZ), 2);
>         PUSH_DATA (push, ( width << 16) | dstx);
>         PUSH_DATA (push, (height << 16) | dsty);
> +       nvc0->scissors_dirty |= 1;
>
>         BEGIN_NVC0(push, NVC0_3D(ZETA_ADDRESS_HIGH), 5);
>         PUSH_DATAh(push, mt->base.address + sf->offset);
> --
> 1.8.4.5
>

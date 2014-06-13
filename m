From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] drm/nouveau: Fix overlap while zeroing
 zcull regions
Date: Fri, 13 Jun 2014 12:08:44 +1000
Message-ID: <CACAvsv78kLXVXyxWnWA26tydqkMFiA5Y8wQqViE2_5=wLaSK2g@mail.gmail.com>
References: <pierre.morrow@free.fr>
 <1402619670-21368-1-git-send-email-pierre.morrow@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1402619670-21368-1-git-send-email-pierre.morrow-GANU6spQydw@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org>
Cc: Ben Skeggs <bskeggs-8RVElS0ezzQdnm+yROfE0A@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Fri, Jun 13, 2014 at 10:34 AM, Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org> wrote:
> The specified stride was not correct, resulting in erases overlapping and part
> of the zcull regions being not erased at all.
Hey Pierre,

Thanks, I've merged both patches.

>
> Signed-off-by: Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org>
> ---
>  drivers/gpu/drm/nouveau/core/engine/graph/nv50.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/core/engine/graph/nv50.c b/drivers/gpu/drm/nouveau/core/engine/graph/nv50.c
> index 2c7809e..a36adcd 100644
> --- a/drivers/gpu/drm/nouveau/core/engine/graph/nv50.c
> +++ b/drivers/gpu/drm/nouveau/core/engine/graph/nv50.c
> @@ -991,10 +991,10 @@ nv50_graph_init(struct nouveau_object *object)
>
>         /* zero out zcull regions */
>         for (i = 0; i < 8; i++) {
> -               nv_wr32(priv, 0x402c20 + (i * 8), 0x00000000);
> -               nv_wr32(priv, 0x402c24 + (i * 8), 0x00000000);
> -               nv_wr32(priv, 0x402c28 + (i * 8), 0x00000000);
> -               nv_wr32(priv, 0x402c2c + (i * 8), 0x00000000);
> +               nv_wr32(priv, 0x402c20 + (i * 0x10), 0x00000000);
> +               nv_wr32(priv, 0x402c24 + (i * 0x10), 0x00000000);
> +               nv_wr32(priv, 0x402c28 + (i * 0x10), 0x00000000);
> +               nv_wr32(priv, 0x402c2c + (i * 0x10), 0x00000000);
>         }
>         return 0;
>  }
> --
> 2.0.0
>
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau

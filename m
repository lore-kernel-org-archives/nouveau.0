From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/3] therm/nv84+: do not expose non-calibrated
 internal temp sensor
Date: Thu, 28 Aug 2014 08:53:12 +1000
Message-ID: <CACAvsv7QXLPVzwLYLABhDYs3qK5qZ+Ak7Pi0g=n9c7U=i4Xmcg@mail.gmail.com>
References: <1408914911-5022-1-git-send-email-martin.peres@free.fr>
 <1408914911-5022-3-git-send-email-martin.peres@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1408914911-5022-3-git-send-email-martin.peres-GANU6spQydw@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Mon, Aug 25, 2014 at 7:15 AM, Martin Peres <martin.peres-GANU6spQydw@public.gmane.org> wrote:
> Signed-off-by: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
Hey Martin,

Merged all three patches.

Thanks :)

> ---
>  nvkm/subdev/therm/nv84.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/nvkm/subdev/therm/nv84.c b/nvkm/subdev/therm/nv84.c
> index 38b16d9..14e2e09 100644
> --- a/nvkm/subdev/therm/nv84.c
> +++ b/nvkm/subdev/therm/nv84.c
> @@ -33,7 +33,12 @@ struct nv84_therm_priv {
>  int
>  nv84_temp_get(struct nouveau_therm *therm)
>  {
> -       return nv_rd32(therm, 0x20400);
> +       struct nouveau_fuse *fuse = nouveau_fuse(therm);
> +
> +       if (nv_ro32(fuse, 0x1a8) == 1)
> +               return nv_rd32(therm, 0x20400);
> +       else
> +               return -ENODEV;
>  }
>
>  void
> --
> 2.0.0
>
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau

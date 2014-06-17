From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau: fix oops in display destructor
	with headless cards
Date: Tue, 17 Jun 2014 23:10:31 +1000
Message-ID: <CACAvsv4h1SxPZA1XDgk3oVZz1Exwr78R03w7BTiaq3RxGS-7cw@mail.gmail.com>
References: <53A03C3C.5070606@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <53A03C3C.5070606-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Tue, Jun 17, 2014 at 11:01 PM, Maarten Lankhorst
<maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org> wrote:
> If init doesn't run then disp->outp might not be initialized, resulting in an oops.
This can't actually happen (in the very least, it's not supposed
to)... What makes you think it can?

>
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
> ---
> diff --git a/drivers/gpu/drm/nouveau/core/engine/disp/base.c b/drivers/gpu/drm/nouveau/core/engine/disp/base.c
> index c41f656abe64..9c38c5e40500 100644
> --- a/drivers/gpu/drm/nouveau/core/engine/disp/base.c
> +++ b/drivers/gpu/drm/nouveau/core/engine/disp/base.c
> @@ -99,8 +99,10 @@ _nouveau_disp_dtor(struct nouveau_object *object)
>
>         nouveau_event_destroy(&disp->vblank);
>
> -       list_for_each_entry_safe(outp, outt, &disp->outp, head) {
> -               nouveau_object_ref(NULL, (struct nouveau_object **)&outp);
> +       if (disp->outp.next) {
> +               list_for_each_entry_safe(outp, outt, &disp->outp, head) {
> +                       nouveau_object_ref(NULL, (struct nouveau_object **)&outp);
> +               }
>         }
>
>         nouveau_engine_destroy(&disp->base);
>
> _______________________________________________
> dri-devel mailing list
> dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel

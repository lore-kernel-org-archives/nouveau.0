From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] perfmon: do not forget to destroy the engine
	context
Date: Tue, 5 Aug 2014 09:35:04 +1000
Message-ID: <CACAvsv4UeeW9vdf4Z+tqqii4uPomj9XoAoaUXtKJg_bKnJya6A@mail.gmail.com>
References: <1405936784-1696-1-git-send-email-samuel.pitoiset@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1405936784-1696-1-git-send-email-samuel.pitoiset-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Samuel Pitoiset <samuel.pitoiset-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Mon, Jul 21, 2014 at 7:59 PM, Samuel Pitoiset
<samuel.pitoiset-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> This fixes a crash when we reload Nouveau DRM.
Thanks Samuel :)

>
> Signed-off-by: Samuel Pitoiset <samuel.pitoiset-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  nvkm/engine/perfmon/base.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/nvkm/engine/perfmon/base.c b/nvkm/engine/perfmon/base.c
> index e9c5e51..7481003 100644
> --- a/nvkm/engine/perfmon/base.c
> +++ b/nvkm/engine/perfmon/base.c
> @@ -303,6 +303,7 @@ nouveau_perfctx_dtor(struct nouveau_object *object)
>  {
>         struct nouveau_perfmon *ppm = (void *)object->engine;
>         mutex_lock(&nv_subdev(ppm)->mutex);
> +       nouveau_engctx_destroy(&ppm->context->base);
>         ppm->context = NULL;
>         mutex_unlock(&nv_subdev(ppm)->mutex);
>  }
> --
> 2.0.0
>
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau

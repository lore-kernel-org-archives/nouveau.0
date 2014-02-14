From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau/fb: use correct ram oclass for
	nv1a hardware
Date: Fri, 14 Feb 2014 12:00:37 +1000
Message-ID: <CACAvsv7S71ORM-zCQtDyxJZ3BYXqdcO_HwTRbtfaE0YsF5DuZQ@mail.gmail.com>
References: <1392169302-8155-1-git-send-email-emil.l.velikov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1392169302-8155-1-git-send-email-emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Wed, Feb 12, 2014 at 11:41 AM, Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> commit 8613e7314ac254fdd67ed46192f021d76141e4c9
> Author: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> Date:   Mon Oct 21 08:50:25 2013 +1000
>
>     drm/nouveau/fb: remove ram oclass argument from base fb constructor
>
> Introduced a unfortunate regression by using nv10 ram oclass for nv1a
> hardware, causing corruption and eventually system lockup.
>
> Bugzilla: https://bugs.freedesktop.org/show_bug.cgi?id=74866
> Reported-by: John F. Godfrey <jfgodfrey-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Signed-off-by: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org # 3.13+
Thanks :)

> ---
>  drivers/gpu/drm/nouveau/core/subdev/fb/nv1a.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/core/subdev/fb/nv1a.c b/drivers/gpu/drm/nouveau/core/subdev/fb/nv1a.c
> index 9159a5c..265d125 100644
> --- a/drivers/gpu/drm/nouveau/core/subdev/fb/nv1a.c
> +++ b/drivers/gpu/drm/nouveau/core/subdev/fb/nv1a.c
> @@ -36,7 +36,7 @@ nv1a_fb_oclass = &(struct nv04_fb_impl) {
>                 .fini = _nouveau_fb_fini,
>         },
>         .base.memtype = nv04_fb_memtype_valid,
> -       .base.ram = &nv10_ram_oclass,
> +       .base.ram = &nv1a_ram_oclass,
>         .tile.regions = 8,
>         .tile.init = nv10_fb_tile_init,
>         .tile.fini = nv10_fb_tile_fini,
> --
> 1.8.5.4
>
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau

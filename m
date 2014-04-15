From: Sergei Antonov <saproj-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau/bios: fix a bit shift error
	introduced by 457e77b
Date: Tue, 15 Apr 2014 23:49:33 +0200
Message-ID: <CABikg9yL9y49ws5yJq9R0LV7++ysgPD0wwAeoNd3g8Tm34ysHg@mail.gmail.com>
References: <1397596717-6862-1-git-send-email-saproj@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1397596717-6862-1-git-send-email-saproj-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On 15 April 2014 23:18, Sergei Antonov <saproj-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Commit 457e77b26428ab4a24998eecfb99f27fa4195397 added two checks applied to a
> value received from nv_rd32(bios, 0x619f04). But after this new piece of code
> is executed, the addr local variable does not hold the same value it used to
> hold before the commit. Here is what is was assigned in the original code:
>         (u64)(nv_rd32(bios, 0x619f04) & 0xffffff00) << 8
> in the committed code it ends up with this value:
>         (u64)(nv_rd32(bios, 0x619f04) >> 8) << 8
> These expressions are obviously not equivalent.
>
> My Nvidia video card does not show anything on the display when I boot a
> kernel containing this commit.
>
> The patch fixes the code so that the new checks are still done, but the
> side effect of an incorrect addr value is gone.
>
> Cc: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> Cc: Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> Cc: Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
> Signed-off-by: Sergei Antonov <saproj-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/gpu/drm/nouveau/core/subdev/bios/base.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/core/subdev/bios/base.c b/drivers/gpu/drm/nouveau/core/subdev/bios/base.c
> index e9df94f..291adb6 100644
> --- a/drivers/gpu/drm/nouveau/core/subdev/bios/base.c
> +++ b/drivers/gpu/drm/nouveau/core/subdev/bios/base.c
> @@ -109,7 +109,7 @@ nouveau_bios_shadow_pramin(struct nouveau_bios *bios)
>                         return;
>                 }
>
> -               addr = (u64)(addr >> 8) << 8;
> +               addr = (u64)(addr & 0xffffff00) << 8;

I just noticed that "(u64)" is redundant here. Can it be removed in
the patch without resubmitting, Andrew?

>                 if (!addr) {
>                         addr  = (u64)nv_rd32(bios, 0x001700) << 16;
>                         addr += 0xf0000;
> --
> 1.9.0
>

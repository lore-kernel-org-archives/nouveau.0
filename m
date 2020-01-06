From: Ben Skeggs <skeggsb@gmail.com>
Subject: Re: [Nouveau] [PATCH -next] drm/nouveau/nv04: Use match_string()
 helper to simplify the code
Date: Mon, 6 Jan 2020 11:06:05 +1000
Message-ID: <CACAvsv6GAO18farNBWy5t-tXyTkZHtNDxZEfHeNpZ475yMdGUA@mail.gmail.com>
References: <20191230024628.11820-1-yuehaibing@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191230024628.11820-1-yuehaibing@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: YueHaibing <yuehaibing@huawei.com>
Cc: Ben Skeggs <bskeggs@redhat.com>, Dave Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Sam Ravnborg <sam@ravnborg.org>, Alex Deucher <alexander.deucher@amd.com>, Jani Nikula <jani.nikula@intel.com>, Harry Wentland <harry.wentland@amd.com>, ML nouveau <nouveau@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>, ML dri-devel <dri-devel@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

On Mon, 30 Dec 2019 at 12:48, YueHaibing <yuehaibing@huawei.com> wrote:
>
> match_string() returns the array index of a matching string.
> Use it instead of the open-coded implementation.
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
Thanks!

> ---
>  drivers/gpu/drm/nouveau/dispnv04/tvnv17.c | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c b/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
> index 03466f0..3a9489e 100644
> --- a/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
> +++ b/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
> @@ -644,16 +644,13 @@ static int nv17_tv_create_resources(struct drm_encoder *encoder,
>         int i;
>
>         if (nouveau_tv_norm) {
> -               for (i = 0; i < num_tv_norms; i++) {
> -                       if (!strcmp(nv17_tv_norm_names[i], nouveau_tv_norm)) {
> -                               tv_enc->tv_norm = i;
> -                               break;
> -                       }
> -               }
> -
> -               if (i == num_tv_norms)
> +               i = match_string(nv17_tv_norm_names, num_tv_norms,
> +                                nouveau_tv_norm);
> +               if (i < 0)
>                         NV_WARN(drm, "Invalid TV norm setting \"%s\"\n",
>                                 nouveau_tv_norm);
> +               else
> +                       tv_enc->tv_norm = i;
>         }
>
>         drm_mode_create_tv_properties(dev, num_tv_norms, nv17_tv_norm_names);
> --
> 2.7.4
>
>
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau

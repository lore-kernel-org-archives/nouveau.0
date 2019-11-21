From: Navid Emamdoost <navid.emamdoost@gmail.com>
Subject: Re: [PATCH] drm/nouveau: Fix memory leak in nouveau_bo_alloc
Date: Thu, 21 Nov 2019 12:09:04 -0600
Message-ID: <CAEkB2ERA6Rx9fZiwXH+m8_OV8to0TuLJRVRiUKfKtSoeoT0uJw@mail.gmail.com>
References: <20191021211449.9104-1-navid.emamdoost@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191021211449.9104-1-navid.emamdoost@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>
Cc: Navid Emamdoost <emamd001@umn.edu>, LKML <linux-kernel@vger.kernel.org>
List-Id: nouveau.vger.kernel.org

On Mon, Oct 21, 2019 at 4:14 PM Navid Emamdoost
<navid.emamdoost@gmail.com> wrote:
>
> In the implementation of nouveau_bo_alloc() if it fails to determine the
> target page size via pi, then the allocated memory for nvbo should be
> released.
>
> Fixes: 019cbd4a4feb ("drm/nouveau: Initialize GEM object before TTM object")
> Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>

Would you please review this patch?


Thanks,
Navid.

> ---
>  drivers/gpu/drm/nouveau/nouveau_bo.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
> index f8015e0318d7..18857cf44068 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> @@ -276,8 +276,10 @@ nouveau_bo_alloc(struct nouveau_cli *cli, u64 *size, int *align, u32 flags,
>                         break;
>         }
>
> -       if (WARN_ON(pi < 0))
> +       if (WARN_ON(pi < 0)) {
> +               kfree(nvbo);
>                 return ERR_PTR(-EINVAL);
> +       }
>
>         /* Disable compression if suitable settings couldn't be found. */
>         if (nvbo->comp && !vmm->page[pi].comp) {
> --
> 2.17.1
>


-- 
Navid.

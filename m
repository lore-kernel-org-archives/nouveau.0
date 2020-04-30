From: Ben Skeggs <skeggsb@gmail.com>
Subject: Re: [PATCH -next] drm/nouveau/acr: Use kmemdup instead of kmalloc and memcpy
Date: Thu, 30 Apr 2020 13:58:30 +1000
Message-ID: <CACAvsv5qXhLkspF0==z36xY1R1Uv=-XUHEwnH52GDurivbF5Tw@mail.gmail.com>
References: <1587472651-105308-1-git-send-email-zou_wei@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1587472651-105308-1-git-send-email-zou_wei@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Zou Wei <zou_wei@huawei.com>
Cc: Ben Skeggs <bskeggs@redhat.com>, Dave Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, ML dri-devel <dri-devel@lists.freedesktop.org>, ML nouveau <nouveau@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: nouveau.vger.kernel.org

Thanks!

On Wed, 22 Apr 2020 at 16:56, Zou Wei <zou_wei@huawei.com> wrote:
>
> Fixes coccicheck warning:
>
> drivers/gpu/drm/nouveau/nvkm/subdev/acr/hsfw.c:103:23-30: WARNING opportunity for kmemdup
> drivers/gpu/drm/nouveau/nvkm/subdev/acr/hsfw.c:113:22-29: WARNING opportunity for kmemdup
>
> Fixes: 22dcda45a3d1 ("drm/nouveau/acr: implement new subdev to replace "secure boot"")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zou Wei <zou_wei@huawei.com>
> ---
>  drivers/gpu/drm/nouveau/nvkm/subdev/acr/hsfw.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/hsfw.c b/drivers/gpu/drm/nouveau/nvkm/subdev/acr/hsfw.c
> index aecce2d..667fa01 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/hsfw.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/acr/hsfw.c
> @@ -100,25 +100,21 @@ nvkm_acr_hsfw_load_image(struct nvkm_acr *acr, const char *name, int ver,
>         hsfw->data_size = lhdr->data_size;
>
>         hsfw->sig.prod.size = fwhdr->sig_prod_size;
> -       hsfw->sig.prod.data = kmalloc(hsfw->sig.prod.size, GFP_KERNEL);
> +       hsfw->sig.prod.data = kmemdup(fw->data + fwhdr->sig_prod_offset + sig,
> +                                     hsfw->sig.prod.size, GFP_KERNEL);
>         if (!hsfw->sig.prod.data) {
>                 ret = -ENOMEM;
>                 goto done;
>         }
>
> -       memcpy(hsfw->sig.prod.data, fw->data + fwhdr->sig_prod_offset + sig,
> -              hsfw->sig.prod.size);
> -
>         hsfw->sig.dbg.size = fwhdr->sig_dbg_size;
> -       hsfw->sig.dbg.data = kmalloc(hsfw->sig.dbg.size, GFP_KERNEL);
> +       hsfw->sig.dbg.data = kmemdup(fw->data + fwhdr->sig_dbg_offset + sig,
> +                                    hsfw->sig.dbg.size, GFP_KERNEL);
>         if (!hsfw->sig.dbg.data) {
>                 ret = -ENOMEM;
>                 goto done;
>         }
>
> -       memcpy(hsfw->sig.dbg.data, fw->data + fwhdr->sig_dbg_offset + sig,
> -              hsfw->sig.dbg.size);
> -
>         hsfw->sig.patch_loc = loc;
>  done:
>         nvkm_firmware_put(fw);
> --
> 2.6.2
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

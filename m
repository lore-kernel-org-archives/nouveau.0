From: Karol Herbst <kherbst@redhat.com>
Subject: Re: [Nouveau] [PATCH] drm/nouveau/acr: fix a coding style in nvkm_acr_lsfw_load_bl_inst_data_sig()
Date: Mon, 3 Aug 2020 12:42:34 +0200
Message-ID: <CACO55tsFuRmHac1_7KdebdrgGk=bAh2_aAUB302PH9rSSxdsjQ@mail.gmail.com>
References: <20200803034827.100685-1-jingxiangfeng@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200803034827.100685-1-jingxiangfeng@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jing Xiangfeng <jingxiangfeng@huawei.com>
Cc: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, nouveau <nouveau@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

Reviewed-by: Karol Herbst <kherbst@redhat.com>

On Mon, Aug 3, 2020 at 5:46 AM Jing Xiangfeng <jingxiangfeng@huawei.com> wrote:
>
> This patch performs the following changes:
> 1. remove a redundant parentheses around the  nvkm_acr_lsfw_add() calls
> 2. do assignment before this if condition, it is more readable
>
> Signed-off-by: Jing Xiangfeng <jingxiangfeng@huawei.com>
> ---
>  drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c b/drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c
> index 07d1830126ab..5f6006418472 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c
> @@ -191,7 +191,8 @@ nvkm_acr_lsfw_load_bl_inst_data_sig(struct nvkm_subdev *subdev,
>         u32 *bldata;
>         int ret;
>
> -       if (IS_ERR((lsfw = nvkm_acr_lsfw_add(func, acr, falcon, id))))
> +       lsfw = nvkm_acr_lsfw_add(func, acr, falcon, id);
> +       if (IS_ERR(lsfw))
>                 return PTR_ERR(lsfw);
>
>         ret = nvkm_firmware_load_name(subdev, path, "bl", ver, &bl);
> --
> 2.17.1
>
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
>

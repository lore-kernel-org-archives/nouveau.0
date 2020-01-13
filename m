From: Ben Skeggs <skeggsb@gmail.com>
Subject: Re: [Nouveau] [PATCH -next] drm/ttm: Remove set but not used variable
 'mem'
Date: Mon, 13 Jan 2020 10:07:05 +1000
Message-ID: <CACAvsv4LQAs_GAavgywod1ksxvKe5JE6FNGMnULbnJACJ280KQ@mail.gmail.com>
References: <20200110072837.48060-1-yuehaibing@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20200110072837.48060-1-yuehaibing@huawei.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: YueHaibing <yuehaibing@huawei.com>
Cc: Dave Airlie <airlied@linux.ie>, ML nouveau <nouveau@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>, ML dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
List-Id: nouveau.vger.kernel.org

On Fri, 10 Jan 2020 at 17:32, YueHaibing <yuehaibing@huawei.com> wrote:
>
> drivers/gpu/drm/nouveau/nouveau_ttm.c: In function nouveau_vram_manager_new:
> drivers/gpu/drm/nouveau/nouveau_ttm.c:66:22: warning: variable mem set but not used [-Wunused-but-set-variable]
> drivers/gpu/drm/nouveau/nouveau_ttm.c: In function nouveau_gart_manager_new:
> drivers/gpu/drm/nouveau/nouveau_ttm.c:106:22: warning: variable mem set but not used [-Wunused-but-set-variable]
>
> They are not used any more, so remove it.
Thanks!

>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_ttm.c | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c b/drivers/gpu/drm/nouveau/nouveau_ttm.c
> index 77a0c6a..7ca0a24 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_ttm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_ttm.c
> @@ -63,14 +63,12 @@ nouveau_vram_manager_new(struct ttm_mem_type_manager *man,
>  {
>         struct nouveau_bo *nvbo = nouveau_bo(bo);
>         struct nouveau_drm *drm = nouveau_bdev(bo->bdev);
> -       struct nouveau_mem *mem;
>         int ret;
>
>         if (drm->client.device.info.ram_size == 0)
>                 return -ENOMEM;
>
>         ret = nouveau_mem_new(&drm->master, nvbo->kind, nvbo->comp, reg);
> -       mem = nouveau_mem(reg);
>         if (ret)
>                 return ret;
>
> @@ -103,11 +101,9 @@ nouveau_gart_manager_new(struct ttm_mem_type_manager *man,
>  {
>         struct nouveau_bo *nvbo = nouveau_bo(bo);
>         struct nouveau_drm *drm = nouveau_bdev(bo->bdev);
> -       struct nouveau_mem *mem;
>         int ret;
>
>         ret = nouveau_mem_new(&drm->master, nvbo->kind, nvbo->comp, reg);
> -       mem = nouveau_mem(reg);
>         if (ret)
>                 return ret;
>
> --
> 2.7.4
>
>
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau

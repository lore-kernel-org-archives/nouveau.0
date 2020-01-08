From: Ben Skeggs <skeggsb@gmail.com>
Subject: Re: [PATCH] nouveau/secboot/gm20b: initialize pointer in
 gm20b_secboot_new()
Date: Thu, 9 Jan 2020 09:58:04 +1000
Message-ID: <CACAvsv4ifPYma15xDfu43yanyznpNFyN1vgFrYmao=tdhE6Qjg@mail.gmail.com>
References: <20200108054601.mdwwtcqqpge2iwca@kili.mountain>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20200108054601.mdwwtcqqpge2iwca@kili.mountain>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: David Airlie <airlied@linux.ie>, ML nouveau <nouveau@lists.freedesktop.org>, kernel-janitors@vger.kernel.org, ML dri-devel <dri-devel@lists.freedesktop.org>, Alexandre Courbot <acourbot@nvidia.com>, Ben Skeggs <bskeggs@redhat.com>
List-Id: nouveau.vger.kernel.org

On Wed, 8 Jan 2020 at 15:46, Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> We accidentally set "psb" which is a no-op instead of "*psb" so it
> generates a static checker warning.  We should probably set it before
> the first error return so that it's always initialized.
You actually don't need to do either, *psb will be NULL already on
entry to the function.  But removing the assignment in the error path
should be done still.

Ben.

>
> Fixes: 923f1bd27bf1 ("drm/nouveau/secboot/gm20b: add secure boot support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> Static analysis.  I'm not sure how this is called.
>
>  drivers/gpu/drm/nouveau/nvkm/subdev/secboot/gm20b.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/gm20b.c b/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/gm20b.c
> index df8b919dcf09..ace6fefba428 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/gm20b.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/gm20b.c
> @@ -108,6 +108,7 @@ gm20b_secboot_new(struct nvkm_device *device, int index,
>         struct gm200_secboot *gsb;
>         struct nvkm_acr *acr;
>
> +       *psb = NULL;
>         acr = acr_r352_new(BIT(NVKM_SECBOOT_FALCON_FECS) |
>                            BIT(NVKM_SECBOOT_FALCON_PMU));
>         if (IS_ERR(acr))
> @@ -116,10 +117,8 @@ gm20b_secboot_new(struct nvkm_device *device, int index,
>         acr->optional_falcons = BIT(NVKM_SECBOOT_FALCON_PMU);
>
>         gsb = kzalloc(sizeof(*gsb), GFP_KERNEL);
> -       if (!gsb) {
> -               psb = NULL;
> +       if (!gsb)
>                 return -ENOMEM;
> -       }
>         *psb = &gsb->base;
>
>         ret = nvkm_secboot_ctor(&gm20b_secboot, acr, device, index, &gsb->base);
> --
> 2.11.0
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

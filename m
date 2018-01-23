From: Karol Herbst <kherbst@redhat.com>
Subject: Re: [Nouveau] [PATCH] drm/nouveau/mmu: Fix trailing semicolon
Date: Tue, 23 Jan 2018 11:20:34 +0100
Message-ID: <CACO55ttSA5jbuS2z2CaPD72G7+=EjCO7WUeA-rxh5dpkDaBhag@mail.gmail.com>
References: <20180117185315.26808-1-luisbg@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180117185315.26808-1-luisbg@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Luis de Bethencourt <luisbg@kernel.org>
Cc: linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>, nouveau <nouveau@lists.freedesktop.org>, dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>, Joe Perches <joe@perches.com>
List-Id: nouveau.vger.kernel.org

Reviewed-by: Karol Herbst <kherbst@redhat.com>

On Wed, Jan 17, 2018 at 7:53 PM, Luis de Bethencourt <luisbg@kernel.org> wrote:
> The trailing semicolon is an empty statement that does no operation.
> Removing it since it doesn't do anything.
>
> Signed-off-by: Luis de Bethencourt <luisbg@kernel.org>
> ---
>
> Hi,
>
> After fixing the same thing in drivers/staging/rtl8723bs/, Joe Perches
> suggested I fix it treewide [0].
>
> Best regards
> Luis
>
>
> [0] http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/2018-January/115410.html
> [1] http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/2018-January/115390.html
>
>  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
> index e35d3e17cd7c..93946dcee319 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
> @@ -642,7 +642,7 @@ nvkm_vmm_ptes_sparse(struct nvkm_vmm *vmm, u64 addr, u64 size, bool ref)
>                         else
>                                 block = (size >> page[i].shift) << page[i].shift;
>                 } else {
> -                       block = (size >> page[i].shift) << page[i].shift;;
> +                       block = (size >> page[i].shift) << page[i].shift;
>                 }
>
>                 /* Perform operation. */
> --
> 2.15.1
>
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau

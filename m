From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Subject: Re: [PATCH v3] drm/nouveau/fb/nv50: set DMA mask before mapping
 scratch page
Date: Thu, 14 Jul 2016 15:13:13 +0200
Message-ID: <CAKv+Gu-cUPkYGthnrNqanZNLTsjc4V8Cazvbkr300BSE98_y1g@mail.gmail.com>
References: <1467910768-2643-1-git-send-email-ard.biesheuvel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1467910768-2643-1-git-send-email-ard.biesheuvel@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, bskeggs@redhat.com
Cc: airlied@linux.ie, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>
List-Id: nouveau.vger.kernel.org

On 7 July 2016 at 18:59, Ard Biesheuvel <ard.biesheuvel@linaro.org> wrote:
> The 100c08 scratch page is mapped using dma_map_page() before the TTM
> layer has had a chance to set the DMA mask. This means we are still
> running with the default of 32 when this code executes, and this causes
> problems for platforms with no memory below 4 GB (such as AMD Seattle)
>
> So move the dma_map_page() to the .init hook, and set the streaming DMA
> mask based on the MMU subdev parameters before performing the call.
>
> Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
> ---
> I am sure there is a much better way to address this, but this fixes the
> problem I get on AMD Seattle with a GeForce 210 PCIe card:
>
>    nouveau 0000:02:00.0: enabling device (0000 -> 0003)
>    nouveau 0000:02:00.0: NVIDIA GT218 (0a8280b1)
>    nouveau 0000:02:00.0: bios: version 70.18.a6.00.00
>    nouveau 0000:02:00.0: fb ctor failed, -14
>    nouveau: probe of 0000:02:00.0 failed with error -14
>
> v2: replace incorrect comparison of dma_addr_t type var against NULL
> v3: rework code to get rid of DMA_ERROR_CODE references, which is not
>     defined on all architectures
>

Ping?


>  drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv50.c | 40 ++++++++++++++------
>  1 file changed, 29 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv50.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv50.c
> index 1b5fb02eab2a..f713cb3fe56c 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv50.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv50.c
> @@ -216,11 +216,33 @@ nv50_fb_init(struct nvkm_fb *base)
>         struct nv50_fb *fb = nv50_fb(base);
>         struct nvkm_device *device = fb->base.subdev.device;
>
> +       if (!fb->r100c08) {
> +               /* We are calling the DMA api way before the TTM layer sets the
> +                * DMA mask based on the MMU subdev parameters. This means we
> +                * are using the default DMA mask of 32, which may cause
> +                * problems on systems with no RAM below the 4 GB mark. So set
> +                * the streaming DMA mask here as well.
> +                */
> +               dma_addr_t addr;
> +
> +               dma_set_mask(device->dev, DMA_BIT_MASK(device->mmu->dma_bits));
> +
> +               addr = dma_map_page(device->dev, fb->r100c08_page, 0, PAGE_SIZE,
> +                                   DMA_BIDIRECTIONAL);
> +               if (!dma_mapping_error(device->dev, addr)) {
> +                       fb->r100c08 = addr;
> +               } else {
> +                       nvkm_warn(&fb->base.subdev,
> +                                 "dma_map_page() failed on 100c08 page\n");
> +               }
> +       }
> +
>         /* Not a clue what this is exactly.  Without pointing it at a
>          * scratch page, VRAM->GART blits with M2MF (as in DDX DFS)
>          * cause IOMMU "read from address 0" errors (rh#561267)
>          */
> -       nvkm_wr32(device, 0x100c08, fb->r100c08 >> 8);
> +       if (fb->r100c08)
> +               nvkm_wr32(device, 0x100c08, fb->r100c08 >> 8);
>
>         /* This is needed to get meaningful information from 100c90
>          * on traps. No idea what these values mean exactly. */
> @@ -233,11 +255,11 @@ nv50_fb_dtor(struct nvkm_fb *base)
>         struct nv50_fb *fb = nv50_fb(base);
>         struct nvkm_device *device = fb->base.subdev.device;
>
> -       if (fb->r100c08_page) {
> +       if (fb->r100c08)
>                 dma_unmap_page(device->dev, fb->r100c08, PAGE_SIZE,
>                                DMA_BIDIRECTIONAL);
> -               __free_page(fb->r100c08_page);
> -       }
> +
> +       __free_page(fb->r100c08_page);
>
>         return fb;
>  }
> @@ -264,13 +286,9 @@ nv50_fb_new_(const struct nv50_fb_func *func, struct nvkm_device *device,
>         *pfb = &fb->base;
>
>         fb->r100c08_page = alloc_page(GFP_KERNEL | __GFP_ZERO);
> -       if (fb->r100c08_page) {
> -               fb->r100c08 = dma_map_page(device->dev, fb->r100c08_page, 0,
> -                                          PAGE_SIZE, DMA_BIDIRECTIONAL);
> -               if (dma_mapping_error(device->dev, fb->r100c08))
> -                       return -EFAULT;
> -       } else {
> -               nvkm_warn(&fb->base.subdev, "failed 100c08 page alloc\n");
> +       if (!fb->r100c08_page) {
> +               nvkm_error(&fb->base.subdev, "failed 100c08 page alloc\n");
> +               return -ENOMEM;
>         }
>
>         return 0;
> --
> 2.7.4
>

From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau/device: fix changing endianess
 code to work on older GPUs
Date: Tue, 13 Oct 2020 09:54:51 -0400
Message-ID: <CAKb7UviY1aYvvCk_yK6eHfvR322XG3b_Aq60XcGb0NUNBAw7Gw@mail.gmail.com>
References: <20201013120126.59411-1-kherbst@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20201013120126.59411-1-kherbst-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: 202010101049.37663.linux-82g5Cmo2vi4@public.gmane.org
Cc: nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ondrej Zary <linux-82g5Cmo2vi4@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Tue, Oct 13, 2020 at 8:01 AM Karol Herbst <kherbst-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
>
> With this we try to detect if the endianess switch works and assume LE if
> not. Suggested by Ben.
>
> Fixes: 51c05340e407 ("drm/nouveau/device: detect if changing endianness failed")
> ---
>  .../gpu/drm/nouveau/nvkm/engine/device/base.c | 39 ++++++++++++-------
>  1 file changed, 26 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
> index dcb70677d0acc..7851bec5f0e5f 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
> @@ -2924,17 +2924,34 @@ nvkm_device_del(struct nvkm_device **pdevice)
>         }
>  }
>
> +/* returns true if the GPU is in the CPU native byte order */
>  static inline bool
>  nvkm_device_endianness(struct nvkm_device *device)
>  {
> -       u32 boot1 = nvkm_rd32(device, 0x000004) & 0x01000001;
>  #ifdef __BIG_ENDIAN
> -       if (!boot1)
> -               return false;
> +       const bool big_endian = true;
>  #else
> -       if (boot1)
> -               return false;
> +       const bool big_endian = false;
>  #endif
> +
> +       /* Read NV_PMC_BOOT_1, and assume non-functional endian switch if it
> +        * doesn't contain the expected values.
> +        */
> +       u32 pmc_boot_1 = nvkm_rd32(device, 0x000004);
> +       if (pmc_boot_1 && pmc_boot_1 != 0x01000001)

Are you sure there are no other bits in there, esp on newer GPUs?

> +               return !big_endian; /* Assume GPU is LE in this case. */
> +
> +       /* 0 means LE and 0x01000001 means BE GPU. Condition is true when
> +        * GPU/CPU endianness don't match.
> +        */
> +       if (big_endian == !pmc_boot_1) {
> +               nvkm_wr32(device, 0x000004, 0x01000001);
> +               nvkm_rd32(device, 0x000000);
> +               if (nvkm_rd32(device, 0x000004) != (big_endian ? 0x01000001 : 0x00000000))
> +                       return !big_endian; /* Assume GPU is LE on any unexpected read-back. */
> +       }
> +
> +       /* CPU/GPU endianness should (hopefully) match. */
>         return true;
>  }
>
> @@ -2987,14 +3004,10 @@ nvkm_device_ctor(const struct nvkm_device_func *func,
>         if (detect) {
>                 /* switch mmio to cpu's native endianness */
>                 if (!nvkm_device_endianness(device)) {
> -                       nvkm_wr32(device, 0x000004, 0x01000001);
> -                       nvkm_rd32(device, 0x000000);
> -                       if (!nvkm_device_endianness(device)) {
> -                               nvdev_error(device,
> -                                           "GPU not supported on big-endian\n");
> -                               ret = -ENOSYS;
> -                               goto done;
> -                       }
> +                       nvdev_error(device,
> +                                   "Couldn't switch GPU to CPUs endianess\n");
> +                       ret = -ENOSYS;
> +                       goto done;
>                 }
>
>                 boot0 = nvkm_rd32(device, 0x000000);
> --
> 2.26.2
>
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau

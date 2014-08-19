From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm: Fix duplicate definition of
	NV04_PFB_BOOT_0_*
Date: Tue, 19 Aug 2014 12:57:02 +1000
Message-ID: <CACAvsv7Rb9sBV+tS4UecPVyPivPwPc3VfDgR3g-+dGHKpnVebQ@mail.gmail.com>
References: <1408393973-6772-1-git-send-email-pierre.morrow@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1408393973-6772-1-git-send-email-pierre.morrow-GANU6spQydw@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Tue, Aug 19, 2014 at 6:32 AM, Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org> wrote:
> Signed-off-by: Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org>
Thanks Pierre,  I've pulled both patches.

> ---
>  drm/core/include/subdev/fb/regsnv04.h |  1 +
>  nvkm/include/subdev/fb/regsnv04.h     | 21 +++++++++++++++++++++
>  nvkm/subdev/devinit/fbmem.h           | 18 ++----------------
>  nvkm/subdev/fb/ramnv04.c              | 17 +----------------
>  4 files changed, 25 insertions(+), 32 deletions(-)
>  create mode 120000 drm/core/include/subdev/fb/regsnv04.h
>  create mode 100644 nvkm/include/subdev/fb/regsnv04.h
>
> diff --git a/drm/core/include/subdev/fb/regsnv04.h b/drm/core/include/subdev/fb/regsnv04.h
> new file mode 120000
> index 0000000..cc2ea25
> --- /dev/null
> +++ b/drm/core/include/subdev/fb/regsnv04.h
> @@ -0,0 +1 @@
> +../../../../../nvkm/include/subdev/fb/regsnv04.h
> \ No newline at end of file
> diff --git a/nvkm/include/subdev/fb/regsnv04.h b/nvkm/include/subdev/fb/regsnv04.h
> new file mode 100644
> index 0000000..0f7fc0c
> --- /dev/null
> +++ b/nvkm/include/subdev/fb/regsnv04.h
> @@ -0,0 +1,21 @@
> +#ifndef __NOUVEAU_FB_REGS_04_H__
> +#define __NOUVEAU_FB_REGS_04_H__
> +
> +#define NV04_PFB_BOOT_0                                                0x00100000
> +#      define NV04_PFB_BOOT_0_RAM_AMOUNT                       0x00000003
> +#      define NV04_PFB_BOOT_0_RAM_AMOUNT_32MB                  0x00000000
> +#      define NV04_PFB_BOOT_0_RAM_AMOUNT_4MB                   0x00000001
> +#      define NV04_PFB_BOOT_0_RAM_AMOUNT_8MB                   0x00000002
> +#      define NV04_PFB_BOOT_0_RAM_AMOUNT_16MB                  0x00000003
> +#      define NV04_PFB_BOOT_0_RAM_WIDTH_128                    0x00000004
> +#      define NV04_PFB_BOOT_0_RAM_TYPE                         0x00000028
> +#      define NV04_PFB_BOOT_0_RAM_TYPE_SGRAM_8MBIT             0x00000000
> +#      define NV04_PFB_BOOT_0_RAM_TYPE_SGRAM_16MBIT            0x00000008
> +#      define NV04_PFB_BOOT_0_RAM_TYPE_SGRAM_16MBIT_4BANK      0x00000010
> +#      define NV04_PFB_BOOT_0_RAM_TYPE_SDRAM_16MBIT            0x00000018
> +#      define NV04_PFB_BOOT_0_RAM_TYPE_SDRAM_64MBIT            0x00000020
> +#      define NV04_PFB_BOOT_0_RAM_TYPE_SDRAM_64MBITX16         0x00000028
> +#      define NV04_PFB_BOOT_0_UMA_ENABLE                       0x00000100
> +#      define NV04_PFB_BOOT_0_UMA_SIZE                         0x0000f000
> +
> +#endif
> diff --git a/nvkm/subdev/devinit/fbmem.h b/nvkm/subdev/devinit/fbmem.h
> index 4fe49cf..6103484 100644
> --- a/nvkm/subdev/devinit/fbmem.h
> +++ b/nvkm/subdev/devinit/fbmem.h
> @@ -26,22 +26,8 @@
>
>  #include <core/device.h>
>
> -#define NV04_PFB_BOOT_0                                                0x00100000
> -#      define NV04_PFB_BOOT_0_RAM_AMOUNT                       0x00000003
> -#      define NV04_PFB_BOOT_0_RAM_AMOUNT_32MB                  0x00000000
> -#      define NV04_PFB_BOOT_0_RAM_AMOUNT_4MB                   0x00000001
> -#      define NV04_PFB_BOOT_0_RAM_AMOUNT_8MB                   0x00000002
> -#      define NV04_PFB_BOOT_0_RAM_AMOUNT_16MB                  0x00000003
> -#      define NV04_PFB_BOOT_0_RAM_WIDTH_128                    0x00000004
> -#      define NV04_PFB_BOOT_0_RAM_TYPE                         0x00000028
> -#      define NV04_PFB_BOOT_0_RAM_TYPE_SGRAM_8MBIT             0x00000000
> -#      define NV04_PFB_BOOT_0_RAM_TYPE_SGRAM_16MBIT            0x00000008
> -#      define NV04_PFB_BOOT_0_RAM_TYPE_SGRAM_16MBIT_4BANK      0x00000010
> -#      define NV04_PFB_BOOT_0_RAM_TYPE_SDRAM_16MBIT            0x00000018
> -#      define NV04_PFB_BOOT_0_RAM_TYPE_SDRAM_64MBIT            0x00000020
> -#      define NV04_PFB_BOOT_0_RAM_TYPE_SDRAM_64MBITX16         0x00000028
> -#      define NV04_PFB_BOOT_0_UMA_ENABLE                       0x00000100
> -#      define NV04_PFB_BOOT_0_UMA_SIZE                         0x0000f000
> +#include <subdev/fb/regsnv04.h>
> +
>  #define NV04_PFB_DEBUG_0                                       0x00100080
>  #      define NV04_PFB_DEBUG_0_PAGE_MODE                       0x00000001
>  #      define NV04_PFB_DEBUG_0_REFRESH_OFF                     0x00000010
> diff --git a/nvkm/subdev/fb/ramnv04.c b/nvkm/subdev/fb/ramnv04.c
> index e781080..1972268 100644
> --- a/nvkm/subdev/fb/ramnv04.c
> +++ b/nvkm/subdev/fb/ramnv04.c
> @@ -22,22 +22,7 @@
>   * Authors: Ben Skeggs
>   */
>
> -#define NV04_PFB_BOOT_0                                                0x00100000
> -#      define NV04_PFB_BOOT_0_RAM_AMOUNT                       0x00000003
> -#      define NV04_PFB_BOOT_0_RAM_AMOUNT_32MB                  0x00000000
> -#      define NV04_PFB_BOOT_0_RAM_AMOUNT_4MB                   0x00000001
> -#      define NV04_PFB_BOOT_0_RAM_AMOUNT_8MB                   0x00000002
> -#      define NV04_PFB_BOOT_0_RAM_AMOUNT_16MB                  0x00000003
> -#      define NV04_PFB_BOOT_0_RAM_WIDTH_128                    0x00000004
> -#      define NV04_PFB_BOOT_0_RAM_TYPE                         0x00000028
> -#      define NV04_PFB_BOOT_0_RAM_TYPE_SGRAM_8MBIT             0x00000000
> -#      define NV04_PFB_BOOT_0_RAM_TYPE_SGRAM_16MBIT            0x00000008
> -#      define NV04_PFB_BOOT_0_RAM_TYPE_SGRAM_16MBIT_4BANK      0x00000010
> -#      define NV04_PFB_BOOT_0_RAM_TYPE_SDRAM_16MBIT            0x00000018
> -#      define NV04_PFB_BOOT_0_RAM_TYPE_SDRAM_64MBIT            0x00000020
> -#      define NV04_PFB_BOOT_0_RAM_TYPE_SDRAM_64MBITX16         0x00000028
> -#      define NV04_PFB_BOOT_0_UMA_ENABLE                       0x00000100
> -#      define NV04_PFB_BOOT_0_UMA_SIZE                         0x0000f000
> +#include <subdev/fb/regsnv04.h>
>
>  #include "priv.h"
>
> --
> 2.0.4
>
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau

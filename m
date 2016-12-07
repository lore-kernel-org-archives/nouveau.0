From: Martin Peres <martin.peres@free.fr>
Subject: Re: [PATCH] nouveau/led: introduce CONFIG_DRM_NOUVEAU_LEDS
Date: Wed, 7 Dec 2016 05:53:50 +0200
Message-ID: <1ab276eb-ec98-0f79-7770-e50aa8561410@free.fr>
References: <20161207033226.10802-1-martin.peres@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20161207033226.10802-1-martin.peres@free.fr>
Sender: stable-owner@vger.kernel.org
To: nouveau@lists.freedesktop.org
Cc: "# 4 . 9 . x-" <stable@vger.kernel.org>
List-Id: nouveau.vger.kernel.org

On 07/12/16 05:32, Martin Peres wrote:
> This fixes the auto-magic detection of LEDS_CLASS by fixing the case
> where nouveau would be built-in and the LEDS_CLASS would be built as
> as module.
>
> Cc: <stable@vger.kernel.org> # 4.9.x-
> Reported-by: Intel's 0-DAY
> Signed-off-by: Martin Peres <martin.peres@free.fr>
> ---
>   drivers/gpu/drm/nouveau/Kbuild  | 2 +-
>   drivers/gpu/drm/nouveau/Kconfig | 9 +++++++++
>   2 files changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/Kbuild b/drivers/gpu/drm/nouveau/Kbuild
> index fde6e36..0935396 100644
> --- a/drivers/gpu/drm/nouveau/Kbuild
> +++ b/drivers/gpu/drm/nouveau/Kbuild
> @@ -22,7 +22,7 @@ nouveau-$(CONFIG_DEBUG_FS) += nouveau_debugfs.o
>   nouveau-y += nouveau_drm.o
>   nouveau-y += nouveau_hwmon.o
>   nouveau-$(CONFIG_COMPAT) += nouveau_ioc32.o
> -nouveau-$(CONFIG_LEDS_CLASS) += nouveau_led.o
> +nouveau-$(CONFIG_DRM_NOUVEAU_LEDS) += nouveau_led.o
>   nouveau-y += nouveau_nvif.o
>   nouveau-$(CONFIG_NOUVEAU_PLATFORM_DRIVER) += nouveau_platform.o
>   nouveau-y += nouveau_usif.o # userspace <-> nvif
> diff --git a/drivers/gpu/drm/nouveau/Kconfig b/drivers/gpu/drm/nouveau/Kconfig
> index 2922a82..9dbb816 100644
> --- a/drivers/gpu/drm/nouveau/Kconfig
> +++ b/drivers/gpu/drm/nouveau/Kconfig
> @@ -16,6 +16,7 @@ config DRM_NOUVEAU
>   	select INPUT if ACPI && X86
>   	select THERMAL if ACPI && X86
>   	select ACPI_VIDEO if ACPI && X86
> +	select LEDS_CLASS if DRM_NOUVEAU_LEDS
>   	help
>   	  Choose this option for open-source NVIDIA support.
>   
> @@ -62,3 +63,11 @@ config DRM_NOUVEAU_BACKLIGHT
>   	help
>   	  Say Y here if you want to control the backlight of your display
>   	  (e.g. a laptop panel).
> +
> +config DRM_NOUVEAU_LEDS
> +	bool "Support for high-end GPUs' NVIDIA-logo LED control"
> +	depends on DRM_NOUVEAU
> +	default y
> +	help
> +	  Say Y here if you want to control the LED behind the NVIDIA logo on
> +	  high-end GPUs.

Cancel this,the thread "[PATCH] drm/nouveau: fix LEDS_CLASS=m 
configuration" on
DRI-devel explained why it was a bad idea (circular dependencies).

Will implement his proposal of using IS_REACHABLE instead of IS_DEFINED.

Martin

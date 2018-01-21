From: Martin Peres <martin.peres@free.fr>
Subject: Re: [RFC 1/4] drm/nouveau: Add support for basic clockgating on
 Kepler1
Date: Sun, 21 Jan 2018 22:49:17 +0200
Message-ID: <4cac297d-9335-81a9-6854-316654cd6dec@free.fr>
References: <20180115220755.16780-1-lyude@redhat.com>
 <20180115220755.16780-2-lyude@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180115220755.16780-2-lyude@redhat.com>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Lyude Paul <lyude@redhat.com>, nouveau@lists.freedesktop.org
Cc: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Karol Herbst <karolherbst@gmail.com>, Philippe Ombredanne <pombredanne@nexb.com>, Rhys Kidd <rhyskidd@gmail.com>, Alexandre Courbot <acourbot@nvidia.com>, Ilia Mirkin <imirkin@alum.mit.edu>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

On 16/01/18 00:06, Lyude Paul wrote:
> This adds support for enabling automatic clockgating on nvidia GPUs for
> Kepler1, referred to as "CG" throughout the driver. This is one of two
> powersaving levels that Kepler1 supports.

Thanks a lot for all this work! It was long overdue and it is nice to
see the project finally getting to an end, after passing into so many hands!

> 
> This introduces two therm helpers for controlling basic clockgating:
> 	nvkm_therm_clkgate_enable() - enables clockgating through
> 	CG_CTRL, done after initializing the GPU fully
> 	nvkm_therm_clkgate_fini() - prepares clockgating for suspend or
> 	driver unload
> 
> As well, we add the nouveau kernel config parameter NvPmEnableGating,
> which can be set to the highest level of clockgating (in this case, we
> only have CG) the user desires to enable. Since we've only had limited
> testing on this thus far, we disable this by default.

I am not sure I understand the purpose of this level here. As far as I
understand, you only have per-engine control whether you want to enable
CG or not. What you call BLCG and SLCG levels just mean "don't use the
boot values, but rather use our values (taken from nvidia)".

Now, here comes the nasty part: NVIDIA only ever validated the boot
values (I guess they are extremely safe ones), and the optimised values
(the ones coming from your patch 2, 3, and 4 along with the level 3.

I think introducing a single parameter that controls both CG, PG, and
automatic reclocking would be safer. For CG and PG, it would be a
all-or-nothing (either boot values, or everything like nvidia).

> 
> A lot of this code was originally going to be based off of fermi;
> however it turns out that while Fermi's the first line of GPUs that
> introduced this kind of power saving, Fermi requires more fine tuned
> control of the CG_CTRL registers from the driver while reclocking that
> we don't entirely understand yet.
> 
> For the simple parts we will be sharing with Fermi for certain however,
> we at least add those into a new subdev/therm/gf100.h header.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  .../gpu/drm/nouveau/include/nvkm/subdev/therm.h    |  10 ++
>  drivers/gpu/drm/nouveau/nvkm/engine/device/base.c  |  17 +--
>  drivers/gpu/drm/nouveau/nvkm/subdev/therm/Kbuild   |   1 +
>  drivers/gpu/drm/nouveau/nvkm/subdev/therm/base.c   |  72 +++++++++--
>  drivers/gpu/drm/nouveau/nvkm/subdev/therm/gf100.h  |  35 ++++++
>  drivers/gpu/drm/nouveau/nvkm/subdev/therm/gf119.c  |   8 +-
>  drivers/gpu/drm/nouveau/nvkm/subdev/therm/gk104.c  | 135 +++++++++++++++++++++
>  drivers/gpu/drm/nouveau/nvkm/subdev/therm/gk104.h  |  56 +++++++++
>  drivers/gpu/drm/nouveau/nvkm/subdev/therm/priv.h   |  15 ++-
>  9 files changed, 328 insertions(+), 21 deletions(-)
>  create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/therm/gf100.h
>  create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/therm/gk104.c
>  create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/therm/gk104.h
> 
> diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/therm.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/therm.h
> index b1ac47eb786e..a9204c09975b 100644
> --- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/therm.h
> +++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/therm.h
> @@ -46,6 +46,11 @@ enum nvkm_therm_attr_type {
>  	NVKM_THERM_ATTR_THRS_SHUTDOWN_HYST = 17,
>  };
>  
> +enum nvkm_therm_clkgate_level {
> +	NVKM_THERM_CLKGATE_NONE = 0,
> +	NVKM_THERM_CLKGATE_CG, /* basic clockgating */
> +};
> +
>  struct nvkm_therm {
>  	const struct nvkm_therm_func *func;
>  	struct nvkm_subdev subdev;
> @@ -85,17 +90,22 @@ struct nvkm_therm {
>  
>  	int (*attr_get)(struct nvkm_therm *, enum nvkm_therm_attr_type);
>  	int (*attr_set)(struct nvkm_therm *, enum nvkm_therm_attr_type, int);
> +
> +	enum nvkm_therm_clkgate_level clkgate_level;
>  };
>  
>  int nvkm_therm_temp_get(struct nvkm_therm *);
>  int nvkm_therm_fan_sense(struct nvkm_therm *);
>  int nvkm_therm_cstate(struct nvkm_therm *, int, int);
> +void nvkm_therm_clkgate_enable(struct nvkm_therm *);
> +void nvkm_therm_clkgate_fini(struct nvkm_therm *, bool);
>  
>  int nv40_therm_new(struct nvkm_device *, int, struct nvkm_therm **);
>  int nv50_therm_new(struct nvkm_device *, int, struct nvkm_therm **);
>  int g84_therm_new(struct nvkm_device *, int, struct nvkm_therm **);
>  int gt215_therm_new(struct nvkm_device *, int, struct nvkm_therm **);
>  int gf119_therm_new(struct nvkm_device *, int, struct nvkm_therm **);
> +int gk104_therm_new(struct nvkm_device *, int, struct nvkm_therm **);
>  int gm107_therm_new(struct nvkm_device *, int, struct nvkm_therm **);
>  int gm200_therm_new(struct nvkm_device *, int, struct nvkm_therm **);
>  int gp100_therm_new(struct nvkm_device *, int, struct nvkm_therm **);
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
> index 00eeaaffeae5..6c5f966c66ad 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
> @@ -28,6 +28,7 @@
>  #include <core/option.h>
>  
>  #include <subdev/bios.h>
> +#include <subdev/therm.h>
>  
>  static DEFINE_MUTEX(nv_devices_mutex);
>  static LIST_HEAD(nv_devices);
> @@ -1682,7 +1683,7 @@ nve4_chipset = {
>  	.mxm = nv50_mxm_new,
>  	.pci = gk104_pci_new,
>  	.pmu = gk104_pmu_new,
> -	.therm = gf119_therm_new,
> +	.therm = gk104_therm_new,
>  	.timer = nv41_timer_new,
>  	.top = gk104_top_new,
>  	.volt = gk104_volt_new,
> @@ -1721,7 +1722,7 @@ nve6_chipset = {
>  	.mxm = nv50_mxm_new,
>  	.pci = gk104_pci_new,
>  	.pmu = gk104_pmu_new,
> -	.therm = gf119_therm_new,
> +	.therm = gk104_therm_new,
>  	.timer = nv41_timer_new,
>  	.top = gk104_top_new,
>  	.volt = gk104_volt_new,
> @@ -1760,7 +1761,7 @@ nve7_chipset = {
>  	.mxm = nv50_mxm_new,
>  	.pci = gk104_pci_new,
>  	.pmu = gk104_pmu_new,
> -	.therm = gf119_therm_new,
> +	.therm = gk104_therm_new,
>  	.timer = nv41_timer_new,
>  	.top = gk104_top_new,
>  	.volt = gk104_volt_new,
> @@ -1824,7 +1825,7 @@ nvf0_chipset = {
>  	.mxm = nv50_mxm_new,
>  	.pci = gk104_pci_new,
>  	.pmu = gk110_pmu_new,
> -	.therm = gf119_therm_new,
> +	.therm = gk104_therm_new,
>  	.timer = nv41_timer_new,
>  	.top = gk104_top_new,
>  	.volt = gk104_volt_new,
> @@ -1862,7 +1863,7 @@ nvf1_chipset = {
>  	.mxm = nv50_mxm_new,
>  	.pci = gk104_pci_new,
>  	.pmu = gk110_pmu_new,
> -	.therm = gf119_therm_new,
> +	.therm = gk104_therm_new,
>  	.timer = nv41_timer_new,
>  	.top = gk104_top_new,
>  	.volt = gk104_volt_new,
> @@ -1900,7 +1901,7 @@ nv106_chipset = {
>  	.mxm = nv50_mxm_new,
>  	.pci = gk104_pci_new,
>  	.pmu = gk208_pmu_new,
> -	.therm = gf119_therm_new,
> +	.therm = gk104_therm_new,
>  	.timer = nv41_timer_new,
>  	.top = gk104_top_new,
>  	.volt = gk104_volt_new,
> @@ -1938,7 +1939,7 @@ nv108_chipset = {
>  	.mxm = nv50_mxm_new,
>  	.pci = gk104_pci_new,
>  	.pmu = gk208_pmu_new,
> -	.therm = gf119_therm_new,
> +	.therm = gk104_therm_new,
>  	.timer = nv41_timer_new,
>  	.top = gk104_top_new,
>  	.volt = gk104_volt_new,
> @@ -2508,6 +2509,7 @@ nvkm_device_fini(struct nvkm_device *device, bool suspend)
>  		}
>  	}
>  
> +	nvkm_therm_clkgate_fini(device->therm, suspend);
>  
>  	if (device->func->fini)
>  		device->func->fini(device, suspend);
> @@ -2597,6 +2599,7 @@ nvkm_device_init(struct nvkm_device *device)
>  	}
>  
>  	nvkm_acpi_init(device);
> +	nvkm_therm_clkgate_enable(device->therm);
>  
>  	time = ktime_to_us(ktime_get()) - time;
>  	nvdev_trace(device, "init completed in %lldus\n", time);
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/therm/Kbuild b/drivers/gpu/drm/nouveau/nvkm/subdev/therm/Kbuild
> index 7ba56b12badd..4bac4772d8ed 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/therm/Kbuild
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/therm/Kbuild
> @@ -10,6 +10,7 @@ nvkm-y += nvkm/subdev/therm/nv50.o
>  nvkm-y += nvkm/subdev/therm/g84.o
>  nvkm-y += nvkm/subdev/therm/gt215.o
>  nvkm-y += nvkm/subdev/therm/gf119.o
> +nvkm-y += nvkm/subdev/therm/gk104.o
>  nvkm-y += nvkm/subdev/therm/gm107.o
>  nvkm-y += nvkm/subdev/therm/gm200.o
>  nvkm-y += nvkm/subdev/therm/gp100.o
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/therm/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/therm/base.c
> index f27fc6d0d4c6..ba1a3aabb559 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/therm/base.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/therm/base.c
> @@ -21,6 +21,7 @@
>   *
>   * Authors: Martin Peres
>   */
> +#include <nvkm/core/option.h>
>  #include "priv.h"
>  
>  int
> @@ -297,6 +298,47 @@ nvkm_therm_attr_set(struct nvkm_therm *therm,
>  	return -EINVAL;
>  }
>  
> +void
> +nvkm_therm_clkgate_enable(struct nvkm_therm *therm)
> +{
> +	if (!therm->func->clkgate_enable || !therm->clkgate_level)
> +		return;
> +
> +	nvkm_debug(&therm->subdev,
> +		   "Enabling clock/powergating\n");
> +	therm->func->clkgate_enable(therm);
> +}
> +
> +void
> +nvkm_therm_clkgate_fini(struct nvkm_therm *therm, bool suspend)
> +{
> +	if (!therm->func->clkgate_fini || !therm->clkgate_level)
> +		return;
> +
> +	nvkm_debug(&therm->subdev,
> +		   "Preparing clock/powergating for %s\n",
> +		   suspend ? "suspend" : "fini");
> +	therm->func->clkgate_fini(therm, suspend);
> +}
> +
> +static void
> +nvkm_therm_clkgate_oneinit(struct nvkm_therm *therm)
> +{
> +	const char *clkgate_str;
> +
> +	if (!therm->func->clkgate_enable || !therm->clkgate_level)
> +		return;
> +
> +	switch (therm->clkgate_level) {
> +	case NVKM_THERM_CLKGATE_CG: clkgate_str = "CG"; break;
> +	default: BUG();
> +	}
> +
> +	nvkm_info(&therm->subdev,
> +		  "Clock/powergating enabled up to level %d (%s)\n",
> +		  therm->clkgate_level, clkgate_str);

This message is a bit odd, whether we keep the notion of levels or not.

Can you get rid of the mention of powergating given that this is not
part of this patchset?

If you agree with having a single enable bit for CG, then a simple:
"Clockgating status: (boot|optimized)" would work perfectly.

> +}
> +
>  static void
>  nvkm_therm_intr(struct nvkm_subdev *subdev)
>  {
> @@ -333,6 +375,7 @@ nvkm_therm_oneinit(struct nvkm_subdev *subdev)
>  	nvkm_therm_fan_ctor(therm);
>  	nvkm_therm_fan_mode(therm, NVKM_THERM_CTRL_AUTO);
>  	nvkm_therm_sensor_preinit(therm);
> +	nvkm_therm_clkgate_oneinit(therm);
>  	return 0;
>  }
>  
> @@ -374,15 +417,10 @@ nvkm_therm = {
>  	.intr = nvkm_therm_intr,
>  };
>  
> -int
> -nvkm_therm_new_(const struct nvkm_therm_func *func, struct nvkm_device *device,
> -		int index, struct nvkm_therm **ptherm)
> +void
> +nvkm_therm_ctor(struct nvkm_therm *therm, struct nvkm_device *device,
> +		int index, const struct nvkm_therm_func *func)
>  {
> -	struct nvkm_therm *therm;
> -
> -	if (!(therm = *ptherm = kzalloc(sizeof(*therm), GFP_KERNEL)))
> -		return -ENOMEM;
> -
>  	nvkm_subdev_ctor(&nvkm_therm, device, index, &therm->subdev);
>  	therm->func = func;
>  
> @@ -395,5 +433,23 @@ nvkm_therm_new_(const struct nvkm_therm_func *func, struct nvkm_device *device,
>  	therm->attr_get = nvkm_therm_attr_get;
>  	therm->attr_set = nvkm_therm_attr_set;
>  	therm->mode = therm->suspend = -1; /* undefined */
> +
> +	therm->clkgate_level =
> +		clamp((int)nvkm_longopt(device->cfgopt,
> +					"NvPmEnableGating",
> +					NVKM_THERM_CLKGATE_NONE),
> +		      NVKM_THERM_CLKGATE_NONE, NVKM_THERM_CLKGATE_CG);
> +}
> +
> +int
> +nvkm_therm_new_(const struct nvkm_therm_func *func, struct nvkm_device *device,
> +		int index, struct nvkm_therm **ptherm)
> +{
> +	struct nvkm_therm *therm;
> +
> +	if (!(therm = *ptherm = kzalloc(sizeof(*therm), GFP_KERNEL)))
> +		return -ENOMEM;
> +
> +	nvkm_therm_ctor(therm, device, index, func);
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/therm/gf100.h b/drivers/gpu/drm/nouveau/nvkm/subdev/therm/gf100.h
> new file mode 100644
> index 000000000000..cfb25af77c60
> --- /dev/null
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/therm/gf100.h
> @@ -0,0 +1,35 @@
> +/*
> + * Copyright 2018 Red Hat Inc.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + * OTHER DEALINGS IN THE SOFTWARE.
> + *
> + * Authors: Lyude Paul
> + */
> +
> +#ifndef __GF100_THERM_H__
> +#define __GF100_THERM_H__
> +
> +#include <core/device.h>
> +
> +struct gf100_idle_filter {
> +	u32 fecs;
> +	u32 hubmmu;
> +};
> +
> +#endif
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/therm/gf119.c b/drivers/gpu/drm/nouveau/nvkm/subdev/therm/gf119.c
> index 06dcfd6ee966..0981b02790e2 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/therm/gf119.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/therm/gf119.c
> @@ -49,7 +49,7 @@ pwm_info(struct nvkm_therm *therm, int line)
>  	return -ENODEV;
>  }
>  
> -static int
> +int
>  gf119_fan_pwm_ctrl(struct nvkm_therm *therm, int line, bool enable)
>  {
>  	struct nvkm_device *device = therm->subdev.device;
> @@ -63,7 +63,7 @@ gf119_fan_pwm_ctrl(struct nvkm_therm *therm, int line, bool enable)
>  	return 0;
>  }
>  
> -static int
> +int
>  gf119_fan_pwm_get(struct nvkm_therm *therm, int line, u32 *divs, u32 *duty)
>  {
>  	struct nvkm_device *device = therm->subdev.device;
> @@ -85,7 +85,7 @@ gf119_fan_pwm_get(struct nvkm_therm *therm, int line, u32 *divs, u32 *duty)
>  	return -EINVAL;
>  }
>  
> -static int
> +int
>  gf119_fan_pwm_set(struct nvkm_therm *therm, int line, u32 divs, u32 duty)
>  {
>  	struct nvkm_device *device = therm->subdev.device;
> @@ -102,7 +102,7 @@ gf119_fan_pwm_set(struct nvkm_therm *therm, int line, u32 divs, u32 duty)
>  	return 0;
>  }
>  
> -static int
> +int
>  gf119_fan_pwm_clock(struct nvkm_therm *therm, int line)
>  {
>  	struct nvkm_device *device = therm->subdev.device;
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/therm/gk104.c b/drivers/gpu/drm/nouveau/nvkm/subdev/therm/gk104.c
> new file mode 100644
> index 000000000000..81bc73a6d143
> --- /dev/null
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/therm/gk104.c
> @@ -0,0 +1,135 @@
> +/*
> + * Copyright 2018 Red Hat Inc.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + * OTHER DEALINGS IN THE SOFTWARE.
> + *
> + * Authors: Lyude Paul
> + */
> +#include <core/device.h>
> +
> +#include "priv.h"
> +#include "gk104.h"
> +
> +void
> +gk104_clkgate_enable(struct nvkm_therm *base)
> +{
> +	struct gk104_therm *therm = gk104_therm(base);
> +	struct nvkm_device *dev = therm->base.subdev.device;
> +	const struct gk104_clkgate_engine_info *order = therm->clkgate_order;
> +	int i;
> +
> +	/* Program ENG_MANT, ENG_FILTER */
> +	for (i = 0; order[i].engine != NVKM_SUBDEV_NR; i++) {
> +		if (!nvkm_device_subdev(dev, order[i].engine))
> +			continue;
> +
> +		nvkm_mask(dev, 0x20200 + order[i].offset, 0xff00, 0x4500);
> +	}
> +
> +	/* magic */
> +	nvkm_wr32(dev, 0x020288, therm->idle_filter->fecs);
> +	nvkm_wr32(dev, 0x02028c, therm->idle_filter->hubmmu);

All this time, I thought these parameters were for power gating... I
also did not expect that clock gating had to be disabled before we could
program them.

Great find!

> +
> +	/* Enable clockgating (ENG_CLK = RUN->AUTO) */
> +	for (i = 0; order[i].engine != NVKM_SUBDEV_NR; i++) {
> +		if (!nvkm_device_subdev(dev, order[i].engine))
> +			continue;
> +
> +		nvkm_mask(dev, 0x20200 + order[i].offset, 0x00ff, 0x0045);
> +	}
> +}
> +
> +void
> +gk104_clkgate_fini(struct nvkm_therm *base, bool suspend)
> +{
> +	struct gk104_therm *therm = gk104_therm(base);
> +	struct nvkm_device *dev = therm->base.subdev.device;
> +	const struct gk104_clkgate_engine_info *order = therm->clkgate_order;
> +	int i;
> +
> +	/* ENG_CLK = AUTO->RUN, ENG_PWR = RUN->AUTO */
> +	for (i = 0; order[i].engine != NVKM_SUBDEV_NR; i++) {
> +		if (!nvkm_device_subdev(dev, order[i].engine))
> +			continue;
> +
> +		nvkm_mask(dev, 0x20200 + order[i].offset, 0xff, 0x54);
> +	}
> +}
> +
> +const struct gk104_clkgate_engine_info gk104_clkgate_engine_info[] = {
> +	{ NVKM_ENGINE_GR,     0x00 },
> +	{ NVKM_ENGINE_MSPDEC, 0x04 },
> +	{ NVKM_ENGINE_MSPPP,  0x08 },
> +	{ NVKM_ENGINE_MSVLD,  0x0c },
> +	{ NVKM_ENGINE_CE0,    0x10 },
> +	{ NVKM_ENGINE_CE1,    0x14 },
> +	{ NVKM_ENGINE_MSENC,  0x18 },
> +	{ NVKM_ENGINE_CE2,    0x1c },
> +	{ NVKM_SUBDEV_NR, 0 },
> +};
> +
> +const struct gf100_idle_filter gk104_idle_filter = {
> +	.fecs = 0x00001000,
> +	.hubmmu = 0x00001000,
> +};
> +
> +static const struct nvkm_therm_func
> +gk104_therm_func = {
> +	.init = gf119_therm_init,
> +	.fini = g84_therm_fini,
> +	.pwm_ctrl = gf119_fan_pwm_ctrl,
> +	.pwm_get = gf119_fan_pwm_get,
> +	.pwm_set = gf119_fan_pwm_set,
> +	.pwm_clock = gf119_fan_pwm_clock,
> +	.temp_get = g84_temp_get,
> +	.fan_sense = gt215_therm_fan_sense,
> +	.program_alarms = nvkm_therm_program_alarms_polling,
> +	.clkgate_enable = gk104_clkgate_enable,
> +	.clkgate_fini = gk104_clkgate_fini,
> +};
> +
> +int
> +gk104_therm_new_(const struct nvkm_therm_func *func,
> +		 struct nvkm_device *device,
> +		 int index,
> +		 const struct gk104_clkgate_engine_info *clkgate_order,
> +		 const struct gf100_idle_filter *idle_filter,
> +		 struct nvkm_therm **ptherm)
> +{
> +	struct gk104_therm *therm = kzalloc(sizeof(*therm), GFP_KERNEL);
> +
> +	if (!therm)
> +		return -ENOMEM;
> +
> +	nvkm_therm_ctor(&therm->base, device, index, func);
> +	*ptherm = &therm->base;
> +	therm->clkgate_order = clkgate_order;
> +	therm->idle_filter = idle_filter;
> +
> +	return 0;
> +}

Why introduce gk104_therm_new_? I can't find references to it in this
patch (outside of the function below) or in the following patches.

As you even export this function, it looks like you used to use this
function in an earlier revision of this series.

Aside from all these nitpicks, the approach is quite self contained and
I like the following patches. Well done!

Once we settle on the configuration parameter, I can give you my R-b :)

Martin

> +
> +int
> +gk104_therm_new(struct nvkm_device *device,
> +		int index, struct nvkm_therm **ptherm)
> +{
> +	return gk104_therm_new_(&gk104_therm_func, device, index,
> +				gk104_clkgate_engine_info, &gk104_idle_filter,
> +				ptherm);
> +}
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/therm/gk104.h b/drivers/gpu/drm/nouveau/nvkm/subdev/therm/gk104.h
> new file mode 100644
> index 000000000000..a2bb5304469f
> --- /dev/null
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/therm/gk104.h
> @@ -0,0 +1,56 @@
> +/*
> + * Copyright 2018 Red Hat Inc.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + * OTHER DEALINGS IN THE SOFTWARE.
> + *
> + * Authors: Lyude Paul
> + */
> +
> +#ifndef __GK104_THERM_H__
> +#define __GK104_THERM_H__
> +#define gk104_therm(p) (container_of((p), struct gk104_therm, base))
> +
> +#include <subdev/therm.h>
> +#include "priv.h"
> +#include "gf100.h"
> +
> +struct gk104_clkgate_engine_info {
> +	enum nvkm_devidx engine;
> +	u8 offset;
> +};
> +
> +struct gk104_therm {
> +	struct nvkm_therm base;
> +
> +	const struct gk104_clkgate_engine_info *clkgate_order;
> +	const struct gf100_idle_filter *idle_filter;
> +};
> +
> +int
> +gk104_therm_new_(const struct nvkm_therm_func *func,
> +		 struct nvkm_device *device,
> +		 int,
> +		 const struct gk104_clkgate_engine_info *,
> +		 const struct gf100_idle_filter *,
> +		 struct nvkm_therm **);
> +
> +extern const struct gk104_clkgate_engine_info gk104_clkgate_engine_info[];
> +extern const struct gf100_idle_filter gk104_idle_filter;
> +
> +#endif
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/therm/priv.h b/drivers/gpu/drm/nouveau/nvkm/subdev/therm/priv.h
> index 1f46e371d7c4..f30202dd88e7 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/therm/priv.h
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/therm/priv.h
> @@ -32,6 +32,8 @@
>  
>  int nvkm_therm_new_(const struct nvkm_therm_func *, struct nvkm_device *,
>  		    int index, struct nvkm_therm **);
> +void nvkm_therm_ctor(struct nvkm_therm *therm, struct nvkm_device *device,
> +		     int index, const struct nvkm_therm_func *func);
>  
>  struct nvkm_fan {
>  	struct nvkm_therm *parent;
> @@ -66,8 +68,6 @@ int nvkm_therm_fan_set(struct nvkm_therm *, bool now, int percent);
>  int nvkm_therm_fan_user_get(struct nvkm_therm *);
>  int nvkm_therm_fan_user_set(struct nvkm_therm *, int percent);
>  
> -int nvkm_therm_preinit(struct nvkm_therm *);
> -
>  int  nvkm_therm_sensor_init(struct nvkm_therm *);
>  int  nvkm_therm_sensor_fini(struct nvkm_therm *, bool suspend);
>  void nvkm_therm_sensor_preinit(struct nvkm_therm *);
> @@ -96,6 +96,9 @@ struct nvkm_therm_func {
>  	int (*fan_sense)(struct nvkm_therm *);
>  
>  	void (*program_alarms)(struct nvkm_therm *);
> +
> +	void (*clkgate_enable)(struct nvkm_therm *);
> +	void (*clkgate_fini)(struct nvkm_therm *, bool);
>  };
>  
>  void nv40_therm_intr(struct nvkm_therm *);
> @@ -112,8 +115,16 @@ void g84_therm_fini(struct nvkm_therm *);
>  int gt215_therm_fan_sense(struct nvkm_therm *);
>  
>  void g84_therm_init(struct nvkm_therm *);
> +
> +int gf119_fan_pwm_ctrl(struct nvkm_therm *, int, bool);
> +int gf119_fan_pwm_get(struct nvkm_therm *, int, u32 *, u32 *);
> +int gf119_fan_pwm_set(struct nvkm_therm *, int, u32, u32);
> +int gf119_fan_pwm_clock(struct nvkm_therm *, int);
>  void gf119_therm_init(struct nvkm_therm *);
>  
> +void gk104_clkgate_enable(struct nvkm_therm *);
> +void gk104_clkgate_fini(struct nvkm_therm *, bool);
> +
>  int nvkm_fanpwm_create(struct nvkm_therm *, struct dcb_gpio_func *);
>  int nvkm_fantog_create(struct nvkm_therm *, struct dcb_gpio_func *);
>  int nvkm_fannil_create(struct nvkm_therm *);
> 

From: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/3] drm/gk20a: reclocking support
Date: Mon, 14 Jul 2014 11:20:35 +0900
Message-ID: <CAAVeFu+MOYtHczCs9UW6MoMUQQyLXc2qSVwdZMBd=hVQ3hRoNg@mail.gmail.com>
References: <1404977677-22248-1-git-send-email-acourbot@nvidia.com>
 <1404977677-22248-4-git-send-email-acourbot@nvidia.com>
 <53BF0E2E.4010305@nimrod-online.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <53BF0E2E.4010305-FA6nBp6kBxZzu6KWmfFNGwC/G2K4zDHf@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Roy Spliet <seven-FA6nBp6kBxZzu6KWmfFNGwC/G2K4zDHf@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Hi Roy,

On Fri, Jul 11, 2014 at 7:05 AM, Roy Spliet <seven-FA6nBp6kBxZzu6KWmfFNGwC/G2K4zDHf@public.gmane.org> wrote:
> Hey Alex,
>
> Thanks. I have a couple of questions and remarks, but really, those should
> be treated as discussion points rather than anything else. Besides some
> inline comments, I was curious whether it is not necessary to pause PFIFO
> and the engines like done with at least NVA3-NVAF? Or is the transition
> smooth enough?

AFAIK there is no need to pause the engines during a clock transition,
as the ChromeOS driver does not do it.

>
> op 10-07-14 09:34, Alexandre Courbot schreef:
>
>> Add support for reclocking on GK20A, using a statically-defined pstates
>> table. The algorithms for calculating the coefficients and setting the
>> clocks are directly taken from the ChromeOS kernel.
>>
>> Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>>   drivers/gpu/drm/nouveau/Makefile                   |   1 +
>>   drivers/gpu/drm/nouveau/core/engine/device/nve0.c  |   1 +
>>   .../gpu/drm/nouveau/core/include/subdev/clock.h    |   1 +
>>   drivers/gpu/drm/nouveau/core/subdev/clock/gk20a.c  | 670
>> +++++++++++++++++++++
>>   4 files changed, 673 insertions(+)
>>   create mode 100644 drivers/gpu/drm/nouveau/core/subdev/clock/gk20a.c
>>
>> diff --git a/drivers/gpu/drm/nouveau/Makefile
>> b/drivers/gpu/drm/nouveau/Makefile
>> index a882ca0f3819..205d1ae7dd03 100644
>> --- a/drivers/gpu/drm/nouveau/Makefile
>> +++ b/drivers/gpu/drm/nouveau/Makefile
>> @@ -65,6 +65,7 @@ nouveau-y += core/subdev/clock/nva3.o
>>   nouveau-y += core/subdev/clock/nvaa.o
>>   nouveau-y += core/subdev/clock/nvc0.o
>>   nouveau-y += core/subdev/clock/nve0.o
>> +nouveau-y += core/subdev/clock/gk20a.o
>>   nouveau-y += core/subdev/clock/pllnv04.o
>>   nouveau-y += core/subdev/clock/pllnva3.o
>>   nouveau-y += core/subdev/devinit/base.o
>> diff --git a/drivers/gpu/drm/nouveau/core/engine/device/nve0.c
>> b/drivers/gpu/drm/nouveau/core/engine/device/nve0.c
>> index c75e9fc9b25f..a8b5184088b5 100644
>> --- a/drivers/gpu/drm/nouveau/core/engine/device/nve0.c
>> +++ b/drivers/gpu/drm/nouveau/core/engine/device/nve0.c
>> @@ -158,6 +158,7 @@ nve0_identify(struct nouveau_device *device)
>>                 break;
>>         case 0xea:
>>                 device->cname = "GK20A";
>> +               device->oclass[NVDEV_SUBDEV_CLOCK  ] =
>> &gk20a_clock_oclass;
>>                 device->oclass[NVDEV_SUBDEV_MC     ] =  nvc3_mc_oclass;
>>                 device->oclass[NVDEV_SUBDEV_BUS    ] =  nvc0_bus_oclass;
>>                 device->oclass[NVDEV_SUBDEV_TIMER  ] =
>> &gk20a_timer_oclass;
>> diff --git a/drivers/gpu/drm/nouveau/core/include/subdev/clock.h
>> b/drivers/gpu/drm/nouveau/core/include/subdev/clock.h
>> index c0fe191c9787..9fed2834f25e 100644
>> --- a/drivers/gpu/drm/nouveau/core/include/subdev/clock.h
>> +++ b/drivers/gpu/drm/nouveau/core/include/subdev/clock.h
>> @@ -138,6 +138,7 @@ extern struct nouveau_oclass *nvaa_clock_oclass;
>>   extern struct nouveau_oclass nva3_clock_oclass;
>>   extern struct nouveau_oclass nvc0_clock_oclass;
>>   extern struct nouveau_oclass nve0_clock_oclass;
>> +extern struct nouveau_oclass gk20a_clock_oclass;
>>     int nv04_clock_pll_set(struct nouveau_clock *, u32 type, u32 freq);
>>   int nv04_clock_pll_calc(struct nouveau_clock *, struct nvbios_pll *,
>> diff --git a/drivers/gpu/drm/nouveau/core/subdev/clock/gk20a.c
>> b/drivers/gpu/drm/nouveau/core/subdev/clock/gk20a.c
>> new file mode 100644
>> index 000000000000..e175cfda0a48
>> --- /dev/null
>> +++ b/drivers/gpu/drm/nouveau/core/subdev/clock/gk20a.c
>> @@ -0,0 +1,670 @@
>> +/*
>> + * Copyright (c) 2014, NVIDIA CORPORATION. All rights reserved.
>> + *
>> + * Permission is hereby granted, free of charge, to any person obtaining
>> a
>> + * copy of this software and associated documentation files (the
>> "Software"),
>> + * to deal in the Software without restriction, including without
>> limitation
>> + * the rights to use, copy, modify, merge, publish, distribute,
>> sublicense,
>> + * and/or sell copies of the Software, and to permit persons to whom the
>> + * Software is furnished to do so, subject to the following conditions:
>> + *
>> + * The above copyright notice and this permission notice shall be
>> included in
>> + * all copies or substantial portions of the Software.
>> + *
>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
>> EXPRESS OR
>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
>> MERCHANTABILITY,
>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT
>> SHALL
>> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
>> OTHER
>> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
>> ARISING
>> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
>> + * DEALINGS IN THE SOFTWARE.
>> + *
>> + * Shamelessly ripped off from ChromeOS's gk20a/clk_pllg.c
>> + *
>> + */
>> +
>> +#define MHZ (1000 * 1000)
>> +
>> +#define MASK(w)        ((1 << w) - 1)
>> +
>> +#define SYS_GPCPLL_CFG_BASE                    0x00137000
>> +#define GPC_BCASE_GPCPLL_CFG_BASE              0x00132800
>> +
>> +#define GPCPLL_CFG             (SYS_GPCPLL_CFG_BASE + 0)
>> +#define GPCPLL_CFG_ENABLE      BIT(0)
>> +#define GPCPLL_CFG_IDDQ                BIT(1)
>> +#define GPCPLL_CFG_LOCK_DET_OFF        BIT(4)
>> +#define GPCPLL_CFG_LOCK                BIT(17)
>> +
>> +#define GPCPLL_COEFF           (SYS_GPCPLL_CFG_BASE + 4)
>> +#define GPCPLL_COEFF_M_SHIFT   0
>> +#define GPCPLL_COEFF_M_WIDTH   8
>> +#define GPCPLL_COEFF_N_SHIFT   8
>> +#define GPCPLL_COEFF_N_WIDTH   8
>> +#define GPCPLL_COEFF_P_SHIFT   16
>> +#define GPCPLL_COEFF_P_WIDTH   6
>> +
>> +#define GPCPLL_CFG2                    (SYS_GPCPLL_CFG_BASE + 0xc)
>> +#define GPCPLL_CFG2_SETUP2_SHIFT       16
>> +#define GPCPLL_CFG2_PLL_STEPA_SHIFT    24
>> +
>> +#define GPCPLL_CFG3                    (SYS_GPCPLL_CFG_BASE + 0x18)
>> +#define GPCPLL_CFG3_PLL_STEPB_SHIFT    16
>> +
>> +#define GPCPLL_NDIV_SLOWDOWN                   (SYS_GPCPLL_CFG_BASE +
>> 0x1c)
>> +#define GPCPLL_NDIV_SLOWDOWN_NDIV_LO_SHIFT     0
>> +#define GPCPLL_NDIV_SLOWDOWN_NDIV_MID_SHIFT    8
>> +#define GPCPLL_NDIV_SLOWDOWN_STEP_SIZE_LO2MID_SHIFT    16
>> +#define GPCPLL_NDIV_SLOWDOWN_SLOWDOWN_USING_PLL_SHIFT  22
>> +#define GPCPLL_NDIV_SLOWDOWN_EN_DYNRAMP_SHIFT  31
>> +
>> +#define SEL_VCO                                (SYS_GPCPLL_CFG_BASE +
>> 0x100)
>> +#define SEL_VCO_GPC2CLK_OUT_SHIFT      0
>> +
>> +#define GPC2CLK_OUT                    (SYS_GPCPLL_CFG_BASE + 0x250)
>> +#define GPC2CLK_OUT_SDIV14_INDIV4_WIDTH        1
>> +#define GPC2CLK_OUT_SDIV14_INDIV4_SHIFT        31
>> +#define GPC2CLK_OUT_SDIV14_INDIV4_MODE 1
>> +#define GPC2CLK_OUT_VCODIV_WIDTH       6
>> +#define GPC2CLK_OUT_VCODIV_SHIFT       8
>> +#define GPC2CLK_OUT_VCODIV1            0
>> +#define GPC2CLK_OUT_VCODIV_MASK
>> (MASK(GPC2CLK_OUT_VCODIV_WIDTH) << \
>> +                                       GPC2CLK_OUT_VCODIV_SHIFT)
>> +#define        GPC2CLK_OUT_BYPDIV_WIDTH        6
>> +#define GPC2CLK_OUT_BYPDIV_SHIFT       0
>> +#define GPC2CLK_OUT_BYPDIV31           0x3c
>> +#define GPC2CLK_OUT_INIT_MASK  ((MASK(GPC2CLK_OUT_SDIV14_INDIV4_WIDTH) <<
>> \
>> +               GPC2CLK_OUT_SDIV14_INDIV4_SHIFT)\
>> +               | (MASK(GPC2CLK_OUT_VCODIV_WIDTH) <<
>> GPC2CLK_OUT_VCODIV_SHIFT)\
>> +               | (MASK(GPC2CLK_OUT_BYPDIV_WIDTH) <<
>> GPC2CLK_OUT_BYPDIV_SHIFT))
>> +#define GPC2CLK_OUT_INIT_VAL   ((GPC2CLK_OUT_SDIV14_INDIV4_MODE << \
>> +               GPC2CLK_OUT_SDIV14_INDIV4_SHIFT) \
>> +               | (GPC2CLK_OUT_VCODIV1 << GPC2CLK_OUT_VCODIV_SHIFT) \
>> +               | (GPC2CLK_OUT_BYPDIV31 << GPC2CLK_OUT_BYPDIV_SHIFT))
>> +
>> +#define GPC_BCAST_NDIV_SLOWDOWN_DEBUG  (GPC_BCASE_GPCPLL_CFG_BASE + 0xa0)
>> +#define GPC_BCAST_NDIV_SLOWDOWN_DEBUG_PLL_DYNRAMP_DONE_SYNCED_SHIFT    24
>> +#define GPC_BCAST_NDIV_SLOWDOWN_DEBUG_PLL_DYNRAMP_DONE_SYNCED_MASK \
>> +           (0x1 <<
>> GPC_BCAST_NDIV_SLOWDOWN_DEBUG_PLL_DYNRAMP_DONE_SYNCED_SHIFT)
>
> When I got started, these registers were defined in envytools/rnndb, and the
> defines were generated into nouveau_reg.h. Now I believe this header
> generation process hasn't been done for a long time, but I do believe it
> would be good to keep a link between the names in the documentation and the
> names in the source code to improve readability for new people. What is your
> policy and guideline for this? Is there a possibility of updating envytools
> along (or in a separate patch)?

The register and fields names provided here are "official" to the best
of my knowledge. Unfortunately I do not think we are ready to
contribute to envytools at the moment. :( But of course anyone is free
and welcome to use the information provided in these patches to
improve the Nouveau documentation.

Also if it is preferred to have these definitions come in their own
header (as they could also be used for at least the NVE0 driver) or
another format, please let me know and I will try to comply for the
next revision.

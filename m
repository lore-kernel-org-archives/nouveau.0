From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau/dp: restore DP suspend/resume
	functionality
Date: Wed, 7 May 2014 15:35:38 +1000
Message-ID: <CACAvsv6bnPQbYkAYVqxfy7YEqOkZXFBSKC9K8OsrS6AHjnpaRQ@mail.gmail.com>
References: <1399229294-3987-1-git-send-email-saproj@gmail.com>
 <CACAvsv7ZCXvSP6H6hRrNf04DS2LQoYSEjnLuAQwLoANoB4Q5cw@mail.gmail.com>
 <CABikg9xcCmpn=X_2PHh56Akznnwk1+35-iK2zTXXtuNoGp5Tfg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CABikg9xcCmpn=X_2PHh56Akznnwk1+35-iK2zTXXtuNoGp5Tfg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Sergei Antonov <saproj-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Mon, May 5, 2014 at 8:34 PM, Sergei Antonov <saproj-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On 5 May 2014 01:43, Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> On Mon, May 5, 2014 at 4:48 AM, Sergei Antonov <saproj-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>> The following commit from about a year ago removed nouveau_dp_dpms() which
>>> did steps required to suspend and resume a monitor connected via DisplayPort.
>>>
>>>     commit 0a0afd282fd715dd63d64b243299a64da14f8e8d
>>>     Author: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>>>     Date:   Mon Feb 18 23:17:53 2013 -0500
>>>     drm/nv50-/disp: move DP link training to core and train from supervisor
>>>
>>> My computer with NVIDIA GeForce GT 640M did not blank the screen after a period
>>> of inactivity, the screen was always on. When in framebuffer console mode
>>> the system switched to blank mode internally but continued to show picture
>>> on the screen which produced ugly artifacts as new lines were output.
>>>
>>> This patch resurrects some of the removed code to restore the lost
>>> functionality. Some of the resurrected code was removed by the aforementioned
>>> commit, some by a later cleanup done by 9a7046d55f319b2dde5d2536cc2adb01ebdbe09e
>>>
>>> The code was updated to make it compatible with the current state of the driver.
>>> Here is how it now works. If the connection is DCB_OUTPUT_DP, call
>>> nouveau_dp_dpms() which does DP_SET_POWER and, if we are resuming, initiates
>>> DP link training by sending NV94_DISP_SOR_DP_TRAIN to have nv50_sor_mthd()
>>> call nouveau_dp_train().
>> Thank you.  This, as you've seen, would appear to solve the issue.
>> There's a little more to the power-down to be done however (such as
>> shutting down the lanes at the SOR, which, yes, we never did before
>> either), and potential races between the supervisor running link
>> training and a dpms on.
>
> I'm curious about these races. The old code in nouveau_dp.c contained this:
> - /* some sinks toggle hotplug in response to some of the actions
> - * we take during link training (DP_SET_POWER is one), we need
> - * to ignore them for the moment to avoid races.
> - */
> I wonder how DP_SET_POWER is taken during link training.
VBIOS scripts call it.

>
>> I'm about to (as in, this week) start some work which will address
>> this and some other DP issues as they've become more urgent here too.
>>
>> Thanks again,
>> Ben.
>>
>>>
>>> Cc: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>>> Cc: Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>>> Signed-off-by: Sergei Antonov <saproj-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>> ---
>>>  drivers/gpu/drm/nouveau/core/engine/disp/nv94.c    |  1 +
>>>  drivers/gpu/drm/nouveau/core/engine/disp/nva3.c    |  1 +
>>>  drivers/gpu/drm/nouveau/core/engine/disp/nvd0.c    |  1 +
>>>  drivers/gpu/drm/nouveau/core/engine/disp/sornv50.c | 12 +++++++++++
>>>  drivers/gpu/drm/nouveau/core/include/core/class.h  |  1 +
>>>  drivers/gpu/drm/nouveau/nouveau_dp.c               | 24 ++++++++++++++++++++++
>>>  drivers/gpu/drm/nouveau/nv50_display.c             |  7 +++++--
>>>  7 files changed, 45 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/nouveau/core/engine/disp/nv94.c b/drivers/gpu/drm/nouveau/core/engine/disp/nv94.c
>>> index 6844061..1f24b10 100644
>>> --- a/drivers/gpu/drm/nouveau/core/engine/disp/nv94.c
>>> +++ b/drivers/gpu/drm/nouveau/core/engine/disp/nv94.c
>>> @@ -77,6 +77,7 @@ nv94_disp_base_omthds[] = {
>>>         { SOR_MTHD(NV50_DISP_SOR_PWR)         , nv50_sor_mthd },
>>>         { SOR_MTHD(NV84_DISP_SOR_HDMI_PWR)    , nv50_sor_mthd },
>>>         { SOR_MTHD(NV50_DISP_SOR_LVDS_SCRIPT) , nv50_sor_mthd },
>>> +       { SOR_MTHD(NV94_DISP_SOR_DP_TRAIN)    , nv50_sor_mthd },
>>>         { DAC_MTHD(NV50_DISP_DAC_PWR)         , nv50_dac_mthd },
>>>         { DAC_MTHD(NV50_DISP_DAC_LOAD)        , nv50_dac_mthd },
>>>         { PIOR_MTHD(NV50_DISP_PIOR_PWR)       , nv50_pior_mthd },
>>> diff --git a/drivers/gpu/drm/nouveau/core/engine/disp/nva3.c b/drivers/gpu/drm/nouveau/core/engine/disp/nva3.c
>>> index 46cb2ce..59054ff6 100644
>>> --- a/drivers/gpu/drm/nouveau/core/engine/disp/nva3.c
>>> +++ b/drivers/gpu/drm/nouveau/core/engine/disp/nva3.c
>>> @@ -50,6 +50,7 @@ nva3_disp_base_omthds[] = {
>>>         { SOR_MTHD(NVA3_DISP_SOR_HDA_ELD)     , nv50_sor_mthd },
>>>         { SOR_MTHD(NV84_DISP_SOR_HDMI_PWR)    , nv50_sor_mthd },
>>>         { SOR_MTHD(NV50_DISP_SOR_LVDS_SCRIPT) , nv50_sor_mthd },
>>> +       { SOR_MTHD(NV94_DISP_SOR_DP_TRAIN)    , nv50_sor_mthd },
>>>         { DAC_MTHD(NV50_DISP_DAC_PWR)         , nv50_dac_mthd },
>>>         { DAC_MTHD(NV50_DISP_DAC_LOAD)        , nv50_dac_mthd },
>>>         { PIOR_MTHD(NV50_DISP_PIOR_PWR)       , nv50_pior_mthd },
>>> diff --git a/drivers/gpu/drm/nouveau/core/engine/disp/nvd0.c b/drivers/gpu/drm/nouveau/core/engine/disp/nvd0.c
>>> index 7762665..8790c4c 100644
>>> --- a/drivers/gpu/drm/nouveau/core/engine/disp/nvd0.c
>>> +++ b/drivers/gpu/drm/nouveau/core/engine/disp/nvd0.c
>>> @@ -887,6 +887,7 @@ nvd0_disp_base_omthds[] = {
>>>         { SOR_MTHD(NVA3_DISP_SOR_HDA_ELD)     , nv50_sor_mthd },
>>>         { SOR_MTHD(NV84_DISP_SOR_HDMI_PWR)    , nv50_sor_mthd },
>>>         { SOR_MTHD(NV50_DISP_SOR_LVDS_SCRIPT) , nv50_sor_mthd },
>>> +       { SOR_MTHD(NV94_DISP_SOR_DP_TRAIN)    , nv50_sor_mthd },
>>>         { DAC_MTHD(NV50_DISP_DAC_PWR)         , nv50_dac_mthd },
>>>         { DAC_MTHD(NV50_DISP_DAC_LOAD)        , nv50_dac_mthd },
>>>         { PIOR_MTHD(NV50_DISP_PIOR_PWR)       , nv50_pior_mthd },
>>> diff --git a/drivers/gpu/drm/nouveau/core/engine/disp/sornv50.c b/drivers/gpu/drm/nouveau/core/engine/disp/sornv50.c
>>> index 526b752..5238e65 100644
>>> --- a/drivers/gpu/drm/nouveau/core/engine/disp/sornv50.c
>>> +++ b/drivers/gpu/drm/nouveau/core/engine/disp/sornv50.c
>>> @@ -47,8 +47,14 @@ int
>>>  nv50_sor_mthd(struct nouveau_object *object, u32 mthd, void *args, u32 size)
>>>  {
>>>         struct nv50_disp_priv *priv = (void *)object->engine;
>>> +       struct nouveau_bios *bios = nouveau_bios(priv);
>>> +       const u16 type = (mthd & NV50_DISP_SOR_MTHD_TYPE) >> 12;
>>>         const u8  head = (mthd & NV50_DISP_SOR_MTHD_HEAD) >> 3;
>>> +       const u8  link = (mthd & NV50_DISP_SOR_MTHD_LINK) >> 2;
>>>         const u8    or = (mthd & NV50_DISP_SOR_MTHD_OR);
>>> +       const u16 mask = (0x0100 << head) | (0x0040 << link) | (0x0001 << or);
>>> +       struct dcb_output outp;
>>> +       u8  ver, hdr;
>>>         u32 data;
>>>         int ret = -EINVAL;
>>>
>>> @@ -56,6 +62,8 @@ nv50_sor_mthd(struct nouveau_object *object, u32 mthd, void *args, u32 size)
>>>                 return -EINVAL;
>>>         data = *(u32 *)args;
>>>
>>> +       if (type && !dcb_outp_match(bios, type, mask, &ver, &hdr, &outp))
>>> +               return -ENODEV;
>>>
>>>         switch (mthd & ~0x3f) {
>>>         case NV50_DISP_SOR_PWR:
>>> @@ -71,6 +79,10 @@ nv50_sor_mthd(struct nouveau_object *object, u32 mthd, void *args, u32 size)
>>>                 priv->sor.lvdsconf = data & NV50_DISP_SOR_LVDS_SCRIPT_ID;
>>>                 ret = 0;
>>>                 break;
>>> +       case NV94_DISP_SOR_DP_TRAIN:
>>> +               ret = nouveau_dp_train(&priv->base, priv->sor.dp, &outp,
>>> +                                      head, data);
>>> +               break;
>>>         default:
>>>                 BUG_ON(1);
>>>         }
>>> diff --git a/drivers/gpu/drm/nouveau/core/include/core/class.h b/drivers/gpu/drm/nouveau/core/include/core/class.h
>>> index 9c0cd73..a32f515 100644
>>> --- a/drivers/gpu/drm/nouveau/core/include/core/class.h
>>> +++ b/drivers/gpu/drm/nouveau/core/include/core/class.h
>>> @@ -295,6 +295,7 @@ struct nv04_display_scanoutpos {
>>>  #define NV84_DISP_SOR_HDMI_PWR_REKEY                                 0x0000007f
>>>  #define NV50_DISP_SOR_LVDS_SCRIPT                                    0x00013000
>>>  #define NV50_DISP_SOR_LVDS_SCRIPT_ID                                 0x0000ffff
>>> +#define NV94_DISP_SOR_DP_TRAIN                                       0x00016000
>>>
>>>  #define NV50_DISP_DAC_MTHD                                           0x00020000
>>>  #define NV50_DISP_DAC_MTHD_TYPE                                      0x0000f000
>>> diff --git a/drivers/gpu/drm/nouveau/nouveau_dp.c b/drivers/gpu/drm/nouveau/nouveau_dp.c
>>> index 36fd225..ee1bc27 100644
>>> --- a/drivers/gpu/drm/nouveau/nouveau_dp.c
>>> +++ b/drivers/gpu/drm/nouveau/nouveau_dp.c
>>> @@ -35,6 +35,30 @@
>>>  #include <subdev/gpio.h>
>>>  #include <subdev/i2c.h>
>>>
>>> +void
>>> +nouveau_dp_dpms(struct drm_encoder *encoder, int mode, u32 datarate,
>>> +               struct nouveau_object *core)
>>> +{
>>> +       struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
>>> +       struct nouveau_i2c_port *auxch;
>>> +       int or = nv_encoder->or;
>>> +       u8 status;
>>> +
>>> +       auxch = nv_encoder->i2c;
>>> +       if (!auxch)
>>> +               return;
>>> +
>>> +       if (mode == DRM_MODE_DPMS_ON)
>>> +               status = DP_SET_POWER_D0;
>>> +       else
>>> +               status = DP_SET_POWER_D3;
>>> +
>>> +       nv_wraux(auxch, DP_SET_POWER, &status, 1);
>>> +
>>> +       if (mode == DRM_MODE_DPMS_ON)
>>> +               nv_call(core, NV94_DISP_SOR_DP_TRAIN + or, datarate);
>>> +}
>>> +
>>>  static void
>>>  nouveau_dp_probe_oui(struct drm_device *dev, struct nouveau_i2c_port *auxch,
>>>                      u8 *dpcd)
>>> diff --git a/drivers/gpu/drm/nouveau/nv50_display.c b/drivers/gpu/drm/nouveau/nv50_display.c
>>> index 58af547..98fd94d 100644
>>> --- a/drivers/gpu/drm/nouveau/nv50_display.c
>>> +++ b/drivers/gpu/drm/nouveau/nv50_display.c
>>> @@ -1720,7 +1720,7 @@ nv50_sor_dpms(struct drm_encoder *encoder, int mode)
>>>  {
>>>         struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
>>>         struct drm_device *dev = encoder->dev;
>>> -       struct nv50_disp *disp = nv50_disp(dev);
>>> +       struct nouveau_object *core = nv50_disp(dev)->core;
>>>         struct drm_encoder *partner;
>>>         int or = nv_encoder->or;
>>>
>>> @@ -1740,7 +1740,10 @@ nv50_sor_dpms(struct drm_encoder *encoder, int mode)
>>>                 }
>>>         }
>>>
>>> -       nv_call(disp->core, NV50_DISP_SOR_PWR + or, (mode == DRM_MODE_DPMS_ON));
>>> +       nv_call(core, NV50_DISP_SOR_PWR + or, mode == DRM_MODE_DPMS_ON);
>>> +
>>> +       if (nv_encoder->dcb->type == DCB_OUTPUT_DP)
>>> +               nouveau_dp_dpms(encoder, mode, nv_encoder->dp.datarate, core);
>>>  }
>>>
>>>  static bool
>>> --
>>> 1.9.0
>>>
>>> _______________________________________________
>>> Nouveau mailing list
>>> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
>>> http://lists.freedesktop.org/mailman/listinfo/nouveau

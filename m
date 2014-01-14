From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Fwd: [PATCH] Fix null dereference oopses for nv40
 cards] kernel 3.13.0-rc8
Date: Tue, 14 Jan 2014 14:50:12 +0000
Message-ID: <52D54EA4.1080100@gmail.com>
References: <1389669776.1320.5.camel@s2895bg>	<CACAvsv41kYncW3y_atf3LhEy7k6SOf-geHfcQRFmtMQYBBRZPg@mail.gmail.com>
	<CACAvsv7-3nLH=47oXCXkP3PGP+UXrBgHyW1qy-YjXq41xf_e+Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CACAvsv7-3nLH=47oXCXkP3PGP+UXrBgHyW1qy-YjXq41xf_e+Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Bob Gleitsmann <rjgleits-Bdlq13kUjeyLZ21kGMrzwg@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On 14/01/14 05:15, Ben Skeggs wrote:
> On Tue, Jan 14, 2014 at 3:07 PM, Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> On Tue, Jan 14, 2014 at 1:22 PM, Bob Gleitsmann <rjgleits-Bdlq13kUjeyLZ21kGMrzwg@public.gmane.org> wrote:
>>> I should have mentioned that this applies to Linus' 3.13.0-rc7 and rc8
>>> git. Maybe it's obvious.
>> Hey Bob,
>>
>> Thanks for reporting this.  Can you try the attached patch instead and
>> report if it helps you?
> Thinko in first attempt, new one attached.
> 
Seems to resolve the problem over at
https://bugs.freedesktop.org/show_bug.cgi?id=73607

Thanks Ben
>>
>> Ben.
>>
>>>
>>> Sorry about that.
>>>
>>> Bob
>>> -------- Forwarded Message --------
>>> From: Bob Gleitsmann <rjgleits-Bdlq13kUjeyLZ21kGMrzwg@public.gmane.org>
>>> To: bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
>>> Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
>>> Subject: [PATCH] Fix null dereference oopses for nv40 cards
>>> Date: Mon, 13 Jan 2014 01:45:36 -0500
>>>
>>> The problem affects nv40 cards during booting. It comes from there being
>>> two places where subdev arrays are maintained. A commit was recently
>>> added to make the two equal. However, the struct nouveau_device version
>>> ends up being referenced before it is initialized. The problem arises
>>> during the creation of the INSTMEM and THERM subdevs. '
>>>
>>> Signed off by: Bob Gleitsmann rjgleits-Bdlq13kUjeyLZ21kGMrzwg@public.gmane.org
>>>
>>> diff --git a/drivers/gpu/drm/nouveau/core/subdev/instmem/nv40.c b/drivers/gpu/drm/nouveau/core/subdev/instmem/nv40.c
>>> index b10a143..0f494ca 100644
>>> --- a/drivers/gpu/drm/nouveau/core/subdev/instmem/nv40.c
>>> +++ b/drivers/gpu/drm/nouveau/core/subdev/instmem/nv40.c
>>> @@ -23,6 +23,7 @@
>>>   */
>>>
>>>  #include <engine/graph/nv40.h>
>>> +#include <core/device.h>
>>>
>>>  #include "nv04.h"
>>>
>>> @@ -38,6 +39,7 @@ nv40_instmem_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
>>>
>>>         ret = nouveau_instmem_create(parent, engine, oclass, &priv);
>>>         *pobject = nv_object(priv);
>>> +       device->subdev[NVDEV_SUBDEV_INSTMEM] = *pobject;
>>>         if (ret)
>>>                 return ret;
>>>
>>> diff --git a/drivers/gpu/drm/nouveau/core/subdev/therm/nv40.c b/drivers/gpu/drm/nouveau/core/subdev/therm/nv40.c
>>> index 002e51b..59b25be 100644
>>> --- a/drivers/gpu/drm/nouveau/core/subdev/therm/nv40.c
>>> +++ b/drivers/gpu/drm/nouveau/core/subdev/therm/nv40.c
>>> @@ -187,9 +187,11 @@ nv40_therm_ctor(struct nouveau_object *parent,
>>>  {
>>>         struct nv40_therm_priv *priv;
>>>         int ret;
>>> +       struct nouveau_device *device = nv_device(parent);
>>>
>>>         ret = nouveau_therm_create(parent, engine, oclass, &priv);
>>>         *pobject = nv_object(priv);
>>> +       device->subdev[NVDEV_SUBDEV_THERM] = *pobject;
>>>         if (ret)
>>>                 return ret;
>>>
>>>
>>>
>>>
>>> _______________________________________________
>>> Nouveau mailing list
>>> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
>>> http://lists.freedesktop.org/mailman/listinfo/nouveau
>>>
>>>
>>> _______________________________________________
>>> Nouveau mailing list
>>> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
>>> http://lists.freedesktop.org/mailman/listinfo/nouveau

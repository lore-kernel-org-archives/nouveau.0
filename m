From: Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau: Ack interrupts for some fuc
	engines
Date: Wed, 27 Mar 2013 07:21:52 +0100
Message-ID: <51529000.3050300@canonical.com>
References: <5150175D.3070808@gmail.com> <20130325181456.GA8026@joi.lan>
	<51514044.1040709@canonical.com> <20130326202952.GA11307@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20130326202952.GA11307-OI9uyE9O0yo@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Maarten Lankhorst <m.b.lankhorst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Op 26-03-13 21:29, Marcin Slusarz schreef:
> On Tue, Mar 26, 2013 at 07:29:24AM +0100, Maarten Lankhorst wrote:
>> Op 25-03-13 19:14, Marcin Slusarz schreef:
>>> On Mon, Mar 25, 2013 at 10:22:37AM +0100, Maarten Lankhorst wrote:
>>>> Fixes 100% cpu usage when the exit interrupt never got acked.
>>>>
>>>> Signed-off-by: Maarten Lankhorst <m.b.lankhorst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>>> ---
>>>> diff --git a/drivers/gpu/drm/nouveau/core/core/falcon.c b/drivers/gpu/drm/nouveau/core/core/falcon.c
>>>> index e05c157..b11c5f3 100644
>>>> --- a/drivers/gpu/drm/nouveau/core/core/falcon.c
>>>> +++ b/drivers/gpu/drm/nouveau/core/core/falcon.c
>>>> @@ -229,6 +229,24 @@ _nouveau_falcon_fini(struct nouveau_object *object, bool suspend)
>>>>  	return nouveau_engine_fini(&falcon->base, suspend);
>>>>  }
>>>>  
>>>> +void
>>>> +nouveau_falcon_intr(struct nouveau_subdev *subdev)
>>>> +{
>>>> +	struct nouveau_falcon *falcon = (void*)subdev;
>>>> +	u32 intr = nv_ro32(falcon, 0x008);
>>>> +
>>>> +	nv_wo32(falcon, 0x004, intr);
>>>> +
>>>> +	if (intr & 0x10) {
>>>> +		intr &= ~0x10;
>>>> +
>>>> +		nv_info(falcon, "Exit interrupt called\n");
>>> Do you really want to print it at "info" level? How frequent it is?
>> It shouldn't be often, I want it to run at the error level since that usually
>> means the firmware exited prematurely/crashed and things go bad, but it
>> happens with the secret scrubber finishing on initialization too. That one
>> is harmless though.
> Maybe it should say:
> nv_error(falcon, "firmware exited prematurely\n");
> ?
>
That is only 1 of the 2 causes, the other is when it's a secret engine (CRYPT/BSP/VP for <nvd0) and the scrubber finished running. In that case it's not an error.

~Maarten

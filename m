From: =?ISO-8859-1?Q?Christian_K=F6nig?= <deathsimple-ANTagKRnAhcb1SvskN2V4Q@public.gmane.org>
Subject: Re: [PATCH 09/17] drm/radeon: use common fence
 implementation for fences
Date: Tue, 22 Jul 2014 15:45:30 +0200
Message-ID: <53CE6AFA.1060807@vodafone.de>
References: <20140709093124.11354.3774.stgit@patser>
 <20140709122953.11354.46381.stgit@patser>
 <CAPM=9tyD2ZbrcGDC3hfNb7qNdzsfnyD-ZwM7G-nOgxeu5YKuSg@mail.gmail.com>
 <53CE2421.5040906@amd.com> <20140722114607.GL15237@phenom.ffwll.local>
 <20140722115737.GN15237@phenom.ffwll.local> <53CE56ED.4040109@vodafone.de>
 <20140722132652.GO15237@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20140722132652.GO15237-dv86pmgwkMBes7Z6vYuT8azUEOm+Xw19@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: =?ISO-8859-1?Q?Christian_K=F6nig?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>, Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, Thomas Hellstrom <thellstrom-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org>, nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "Deucher, Alexander" <alexander.deucher-5C7GfCeVMHo@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Am 22.07.2014 15:26, schrieb Daniel Vetter:
> On Tue, Jul 22, 2014 at 02:19:57PM +0200, Christian K=F6nig wrote:
>> Am 22.07.2014 13:57, schrieb Daniel Vetter:
>>> On Tue, Jul 22, 2014 at 01:46:07PM +0200, Daniel Vetter wrote:
>>>> On Tue, Jul 22, 2014 at 10:43:13AM +0200, Christian K=F6nig wrote:
>>>>> Am 22.07.2014 06:05, schrieb Dave Airlie:
>>>>>> On 9 July 2014 22:29, Maarten Lankhorst <maarten.lankhorst@canonical=
.com> wrote:
>>>>>>> Signed-off-by: Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
>>>>>>> ---
>>>>>>>   drivers/gpu/drm/radeon/radeon.h        |   15 +-
>>>>>>>   drivers/gpu/drm/radeon/radeon_device.c |   60 ++++++++-
>>>>>>>   drivers/gpu/drm/radeon/radeon_fence.c  |  223 +++++++++++++++++++=
+++++++------
>>>>>>>   3 files changed, 248 insertions(+), 50 deletions(-)
>>>>>>>
>>>>>>  From what I can see this is still suffering from the problem that we
>>>>>> need to find a proper solution to,
>>>>>>
>>>>>> My summary of the issues after talking to Jerome and Ben and
>>>>>> re-reading things is:
>>>>>>
>>>>>> We really need to work out a better interface into the drivers to be
>>>>>> able to avoid random atomic entrypoints,
>>>>> Which is exactly what I criticized from the very first beginning. Goo=
d to
>>>>> know that I'm not the only one thinking that this isn't such a good i=
dea.
>>>> I guess I've lost context a bit, but which atomic entry point are we
>>>> talking about? Afaics the only one that's mandatory is the is
>>>> fence->signaled callback to check whether a fence really has been
>>>> signalled. It's used internally by the fence code to avoid spurious
>>>> wakeups. Afaik that should be doable already on any hardware. If that's
>>>> not the case then we can always track the signalled state in software =
and
>>>> double-check in a worker thread before updating the sw state. And wrap
>>>> this all up into a special fence class if there's more than one driver
>>>> needing this.
>>> One thing I've forgotten: The i915 scheduler that's floating around runs
>>> its bottom half from irq context. So I really want to be able to check
>>> fence state from irq context and I also want to make it possible
>>> (possible! not mandatory) to register callbacks which are run from any
>>> context asap after the fence is signalled.
>> NAK, that's just the bad design I've talked about. Checking fence state
>> inside the same driver from interrupt context is OK, because it's the
>> drivers interrupt that we are talking about here.
>>
>> Checking fence status from another drivers interrupt context is what rea=
lly
>> concerns me here, cause your driver doesn't have the slightest idea if t=
he
>> called driver is really capable of checking the fence right now.
> I guess my mail hasn't been clear then. If you don't like it we could add
> a bit of glue to insulate the madness and bad design i915 might do from
> radeon. That imo doesn't invalidate the overall fence interfaces.
>
> So what about the following:
> - fence->enabling_signaling is restricted to be called from process
>    context. We don't use any different yet, so would boild down to adding=
 a
>    WARN_ON(in_interrupt) or so to fence_enable_sw_signalling.
>
> - Make fence->signaled optional (already the case) and don't implement it
>    in readon (i.e. reduce this patch here). Only downside is that radeon
>    needs to correctly (i.e. without races or so) call fence_signal. And t=
he
>    cross-driver synchronization might be a bit less efficient. Note that
>    you can call fence_signal from wherever you want to, so hopefully that
>    doesn't restrict your implementation.
>
> End result: No one calls into radeon from interrupt context, and this is
> guaranteed.
>
> Would that be something you can agree to?

No, the whole enable_signaling stuff should go away. No callback from =

the driver into the fence code, only the other way around.

fence->signaled as well as fence->wait should become mandatory and only =

called from process context without holding any locks, neither atomic =

nor any mutex/semaphore (rcu might be ok).

> Like I've said I think restricting the insanity other people are willing
> to live with just because you don't like it isn't right. But it is
> certainly right for you to insist on not being forced into any such
> design. I think the above would achieve this.

I don't think so. If it's just me I would say that I'm just to cautious =

and the idea is still save to apply to the whole kernel.

But since Dave, Jerome and Ben seems to have similar concerns I think we =

need to agree to a minimum and save interface for all drivers.

Christian.

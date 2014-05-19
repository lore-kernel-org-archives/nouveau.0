From: Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Subject: Re: [RFC PATCH v1 08/16] drm/radeon: use common fence
 implementation for fences
Date: Mon, 19 May 2014 15:35:56 +0200
Message-ID: <537A08BC.7060501@canonical.com>
References: <20140514145134.21163.32350.stgit@patser>
 <20140514145809.21163.64947.stgit@patser> <53738BCC.2070809@vodafone.de>
 <5374131D.4010906@canonical.com> <53748702.6070606@vodafone.de>
 <53748AFA.8010109@canonical.com> <53748BFD.1050608@vodafone.de>
 <5374BB4A.6070102@canonical.com> <5374BEE2.4060608@vodafone.de>
 <5374CC9A.9090905@canonical.com> <5374E1B5.2020408@vodafone.de>
 <5374E410.1080203@canonical.com> <5374E792.4070607@vodafone.de>
 <5379BA04.8000901@canonical.com> <5379C06D.3050507@vodafone.de>
 <5379D8AD.1000904@canonical.com> <5379F96C.1060806@vodafone.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <5379F96C.1060806-ANTagKRnAhcb1SvskN2V4Q@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: =?ISO-8859-1?Q?Christian_K=F6nig?= <deathsimple-ANTagKRnAhcb1SvskN2V4Q@public.gmane.org>, airlied-cv59FeDIM0c@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

op 19-05-14 14:30, Christian K=F6nig schreef:
> Am 19.05.2014 12:10, schrieb Maarten Lankhorst:
>> op 19-05-14 10:27, Christian K=F6nig schreef:
>>> Am 19.05.2014 10:00, schrieb Maarten Lankhorst:
>>> [SNIP]
>>> The problem here is that the whole approach collides with the way we do=
 reset handling from a conceptual point of view. Every IOCTL or other call =
chain into the driver is protected by the read side of the exclusive_lock s=
emaphore. So in the case of a GPU lockup we can take the write side of the =
semaphore and so make sure that we have nobody else accessing the hardware =
or internal driver structures only changed at init time.
>>>
>>> Leaking a drivers IRQ context into another driver as well as calling in=
to a driver in atomic context is just a quite uncommon approach and should =
be considered very carefully.
>>>
>>> I would rather vote for a completely synchronous interface only allowin=
g blocking waits and checks if a fence is signaled from not atomic context.
>>>
>>> If a driver needs to avoid blocking it should just use a workqueue and =
checking a fence outside your own driver is probably be better done in a bo=
ttom halve handler anyway.
>>
>> Except that you might want to do something like
>> fence_is_signaled() in another driver to check whether you need to
>> defer, or can submit the batch buffer immediately, saving a bunch of
>> context switches. Running the is_signaled atomic is really useful here
>> because it means you can't do too many scary things in your is_signaled
>> handler.
>
> This is indeed a nice optimization, but nothing more. If you want to prov=
ide a is_signalled interface for atomic context then this should be optiona=
l, not mandatory.
See below.
>> In case of enable_signaling it was the only sane solution, because
>> fence_signal can be called from irq context, and any calls after that to
>> fence_add_callback and fence_wait aren't allowed to do anything, so
>> fence_enable_sw_signaling and the default wait implementation must be
>> atomic. fence_wait itself doesn't have to be, so it's easy to grab
>> exclusive_lock there.
>
> I don't think you understood my point here: Completely drop enable_signal=
ing, it's unnecessary and only complicates the interface.
>
> We purposely avoided exactly this paradigm in the past and I haven't seen=
 any good argument to start with it now.

In the common case a lot more fences will be emitted than will be waited on.
This means it makes sense to delay signaling a fence with fence_signal for
as long as possible. But when a fence user wants to work with a fence
some way is needed to ensure that the fence will complete. This is the idea
behind .enable_signaling, it tells the fence driver to call fence_signal on
the fence 'soon' because there are now waiters for it.

The atomic .signaled is optional, and can be set to NULL, but there is
no guarantee that fence_is_signaled will ever return true in that case,
unless fence_enable_sw_signaling is called (which calls .enable_signaling).

Providing a custom wait function is optional in the interface, if the defau=
lt wait
function is used all waiters are signaled when fence_signal is called.

Removing enable_signaling would only make sense if fence_signal was removed=
 too,
but that would mean that fence_is_signaled could no longer exist in the cor=
e fence
code, and would mean completely rewriting the interface.

~Maarten

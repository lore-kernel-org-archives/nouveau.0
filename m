From: =?ISO-8859-1?Q?Christian_K=F6nig?= <deathsimple-ANTagKRnAhcb1SvskN2V4Q@public.gmane.org>
Subject: Re: [RFC PATCH v1 08/16] drm/radeon: use common fence
 implementation for fences
Date: Thu, 15 May 2014 17:48:05 +0200
Message-ID: <5374E1B5.2020408@vodafone.de>
References: <20140514145134.21163.32350.stgit@patser>
 <20140514145809.21163.64947.stgit@patser> <53738BCC.2070809@vodafone.de>
 <5374131D.4010906@canonical.com> <53748702.6070606@vodafone.de>
 <53748AFA.8010109@canonical.com> <53748BFD.1050608@vodafone.de>
 <5374BB4A.6070102@canonical.com> <5374BEE2.4060608@vodafone.de>
 <5374CC9A.9090905@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <5374CC9A.9090905-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, airlied-cv59FeDIM0c@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Am 15.05.2014 16:18, schrieb Maarten Lankhorst:
> op 15-05-14 15:19, Christian K=F6nig schreef:
>> Am 15.05.2014 15:04, schrieb Maarten Lankhorst:
>>> op 15-05-14 11:42, Christian K=F6nig schreef:
>>>> Am 15.05.2014 11:38, schrieb Maarten Lankhorst:
>>>>> op 15-05-14 11:21, Christian K=F6nig schreef:
>>>>>> Am 15.05.2014 03:06, schrieb Maarten Lankhorst:
>>>>>>> op 14-05-14 17:29, Christian K=F6nig schreef:
>>>>>>>>> +    /* did fence get signaled after we enabled the sw irq? */
>>>>>>>>> +    if =

>>>>>>>>> (atomic64_read(&fence->rdev->fence_drv[fence->ring].last_seq) =

>>>>>>>>> >=3D fence->seq) {
>>>>>>>>> +        radeon_irq_kms_sw_irq_put(fence->rdev, fence->ring);
>>>>>>>>> +        return false;
>>>>>>>>> +    }
>>>>>>>>> +
>>>>>>>>> +    fence->fence_wake.flags =3D 0;
>>>>>>>>> +    fence->fence_wake.private =3D NULL;
>>>>>>>>> +    fence->fence_wake.func =3D radeon_fence_check_signaled;
>>>>>>>>> + __add_wait_queue(&fence->rdev->fence_queue, =

>>>>>>>>> &fence->fence_wake);
>>>>>>>>> +    fence_get(f);
>>>>>>>> That looks like a race condition to me. The fence needs to be =

>>>>>>>> added to the wait queue before the check, not after.
>>>>>>>>
>>>>>>>> Apart from that the whole approach looks like a really bad idea =

>>>>>>>> to me. How for example is lockup detection supposed to happen =

>>>>>>>> with this? =

>>>>>>> It's not a race condition because fence_queue.lock is held when =

>>>>>>> this function is called.
>>>>>> Ah, I see. That's also the reason why you moved the wake_up_all =

>>>>>> out of the processing function.
>>>>> Correct. :-)
>>>>>>> Lockup's a bit of a weird problem, the changes wouldn't allow =

>>>>>>> core ttm code to handle the lockup any more,
>>>>>>> but any driver specific wait code would still handle this. I did =

>>>>>>> this by design, because in future patches the wait
>>>>>>> function may be called from outside of the radeon driver. The =

>>>>>>> official wait function takes a timeout parameter,
>>>>>>> so lockups wouldn't be fatal if the timeout is set to something =

>>>>>>> like 30*HZ for example, it would still return
>>>>>>> and report that the function timed out.
>>>>>> Timeouts help with the detection of the lockup, but not at all =

>>>>>> with the handling of them.
>>>>>>
>>>>>> What we essentially need is a wait callback into the driver that =

>>>>>> is called in non atomic context without any locks held.
>>>>>>
>>>>>> This way we can block for the fence to become signaled with a =

>>>>>> timeout and can then also initiate the reset handling if necessary.
>>>>>>
>>>>>> The way you designed the interface now means that the driver =

>>>>>> never gets a chance to wait for the hardware to become idle and =

>>>>>> so never has the opportunity to the reset the whole thing.
>>>>> You could set up a hangcheck timer like intel does, and end up =

>>>>> with a reliable hangcheck detection that doesn't depend on cpu =

>>>>> waits. :-) Or override the default wait function and restore the =

>>>>> old behavior.
>>>>
>>>> Overriding the default wait function sounds better, please =

>>>> implement it this way.
>>>>
>>>> Thanks,
>>>> Christian. =

>>>
>>> Does this modification look sane?
>> Adding the timeout is on my todo list for quite some time as well, so =

>> this part makes sense.
>>
>>> +static long __radeon_fence_wait(struct fence *f, bool intr, long =

>>> timeout)
>>> +{
>>> +    struct radeon_fence *fence =3D to_radeon_fence(f);
>>> +    u64 target_seq[RADEON_NUM_RINGS] =3D {};
>>> +
>>> +    target_seq[fence->ring] =3D fence->seq;
>>> +    return radeon_fence_wait_seq_timeout(fence->rdev, target_seq, =

>>> intr, timeout);
>>> +}
>> When this call is comming from outside the radeon driver you need to =

>> lock rdev->exclusive_lock here to make sure not to interfere with a =

>> possible reset.
> Ah thanks, I'll add that.
>
>>>      .get_timeline_name =3D radeon_fence_get_timeline_name,
>>>      .enable_signaling =3D radeon_fence_enable_signaling,
>>>      .signaled =3D __radeon_fence_signaled,
>> Do we still need those callback when we implemented the wait callback?
> .get_timeline_name is used for debugging (trace events).
> .signaled is the non-blocking call to check if the fence is signaled =

> or not.
> .enable_signaling is used for adding callbacks upon fence completion, =

> the default 'fence_default_wait' uses it, so
> when it works no separate implementation is needed unless you want to =

> do more than just waiting.
> It's also used when fence_add_callback is called. i915 can be patched =

> to use it. ;-)

I just meant enable_signaling, the other ones are fine with me. The =

problem with enable_signaling is that it's called with a spin lock held, =

so we can't sleep.

While resetting the GPU could be moved out into a timer the problem here =

is that I can't lock rdev->exclusive_lock in such situations.

This means when i915 would call into radeon to enable signaling for a =

fence we can't make sure that there is not GPU reset running on another =

CPU. And touching the IRQ registers while a reset is going on is a =

really good recipe to lockup the whole system.

Christian.

>
> ~Maarten

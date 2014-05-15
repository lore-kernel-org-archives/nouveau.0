From: Maarten Lankhorst <maarten.lankhorst@canonical.com>
Subject: Re: [RFC PATCH v1 08/16] drm/radeon: use common fence implementation
 for fences
Date: Thu, 15 May 2014 17:58:08 +0200
Message-ID: <5374E410.1080203@canonical.com>
References: <20140514145134.21163.32350.stgit@patser>
 <20140514145809.21163.64947.stgit@patser> <53738BCC.2070809@vodafone.de>
 <5374131D.4010906@canonical.com> <53748702.6070606@vodafone.de>
 <53748AFA.8010109@canonical.com> <53748BFD.1050608@vodafone.de>
 <5374BB4A.6070102@canonical.com> <5374BEE2.4060608@vodafone.de>
 <5374CC9A.9090905@canonical.com> <5374E1B5.2020408@vodafone.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Content-Transfer-Encoding: quoted-printable
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <5374E1B5.2020408@vodafone.de>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: =?ISO-8859-1?Q?Christian_K=F6nig?= <deathsimple@vodafone.de>, airlied@linux.ie
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

op 15-05-14 17:48, Christian K=F6nig schreef:
> Am 15.05.2014 16:18, schrieb Maarten Lankhorst:
>> op 15-05-14 15:19, Christian K=F6nig schreef:
>>> Am 15.05.2014 15:04, schrieb Maarten Lankhorst:
>>>> op 15-05-14 11:42, Christian K=F6nig schreef:
>>>>> Am 15.05.2014 11:38, schrieb Maarten Lankhorst:
>>>>>> op 15-05-14 11:21, Christian K=F6nig schreef:
>>>>>>> Am 15.05.2014 03:06, schrieb Maarten Lankhorst:
>>>>>>>> op 14-05-14 17:29, Christian K=F6nig schreef:
>>>>>>>>>> +    /* did fence get signaled after we enabled the sw irq? */
>>>>>>>>>> +    if (atomic64_read(&fence->rdev->fence_drv[fence->ring].last=
_seq) >=3D fence->seq) {
>>>>>>>>>> + radeon_irq_kms_sw_irq_put(fence->rdev, fence->ring);
>>>>>>>>>> +        return false;
>>>>>>>>>> +    }
>>>>>>>>>> +
>>>>>>>>>> +    fence->fence_wake.flags =3D 0;
>>>>>>>>>> +    fence->fence_wake.private =3D NULL;
>>>>>>>>>> +    fence->fence_wake.func =3D radeon_fence_check_signaled;
>>>>>>>>>> + __add_wait_queue(&fence->rdev->fence_queue, &fence->fence_wake=
);
>>>>>>>>>> +    fence_get(f);
>>>>>>>>> That looks like a race condition to me. The fence needs to be add=
ed to the wait queue before the check, not after.
>>>>>>>>>
>>>>>>>>> Apart from that the whole approach looks like a really bad idea t=
o me. How for example is lockup detection supposed to happen with this? =

>>>>>>>> It's not a race condition because fence_queue.lock is held when th=
is function is called.
>>>>>>> Ah, I see. That's also the reason why you moved the wake_up_all out=
 of the processing function.
>>>>>> Correct. :-)
>>>>>>>> Lockup's a bit of a weird problem, the changes wouldn't allow core=
 ttm code to handle the lockup any more,
>>>>>>>> but any driver specific wait code would still handle this. I did t=
his by design, because in future patches the wait
>>>>>>>> function may be called from outside of the radeon driver. The offi=
cial wait function takes a timeout parameter,
>>>>>>>> so lockups wouldn't be fatal if the timeout is set to something li=
ke 30*HZ for example, it would still return
>>>>>>>> and report that the function timed out.
>>>>>>> Timeouts help with the detection of the lockup, but not at all with=
 the handling of them.
>>>>>>>
>>>>>>> What we essentially need is a wait callback into the driver that is=
 called in non atomic context without any locks held.
>>>>>>>
>>>>>>> This way we can block for the fence to become signaled with a timeo=
ut and can then also initiate the reset handling if necessary.
>>>>>>>
>>>>>>> The way you designed the interface now means that the driver never =
gets a chance to wait for the hardware to become idle and so never has the =
opportunity to the reset the whole thing.
>>>>>> You could set up a hangcheck timer like intel does, and end up with =
a reliable hangcheck detection that doesn't depend on cpu waits. :-) Or ove=
rride the default wait function and restore the old behavior.
>>>>>
>>>>> Overriding the default wait function sounds better, please implement =
it this way.
>>>>>
>>>>> Thanks,
>>>>> Christian. =

>>>>
>>>> Does this modification look sane?
>>> Adding the timeout is on my todo list for quite some time as well, so t=
his part makes sense.
>>>
>>>> +static long __radeon_fence_wait(struct fence *f, bool intr, long time=
out)
>>>> +{
>>>> +    struct radeon_fence *fence =3D to_radeon_fence(f);
>>>> +    u64 target_seq[RADEON_NUM_RINGS] =3D {};
>>>> +
>>>> +    target_seq[fence->ring] =3D fence->seq;
>>>> +    return radeon_fence_wait_seq_timeout(fence->rdev, target_seq, int=
r, timeout);
>>>> +}
>>> When this call is comming from outside the radeon driver you need to lo=
ck rdev->exclusive_lock here to make sure not to interfere with a possible =
reset.
>> Ah thanks, I'll add that.
>>
>>>>      .get_timeline_name =3D radeon_fence_get_timeline_name,
>>>>      .enable_signaling =3D radeon_fence_enable_signaling,
>>>>      .signaled =3D __radeon_fence_signaled,
>>> Do we still need those callback when we implemented the wait callback?
>> .get_timeline_name is used for debugging (trace events).
>> .signaled is the non-blocking call to check if the fence is signaled or =
not.
>> .enable_signaling is used for adding callbacks upon fence completion, th=
e default 'fence_default_wait' uses it, so
>> when it works no separate implementation is needed unless you want to do=
 more than just waiting.
>> It's also used when fence_add_callback is called. i915 can be patched to=
 use it. ;-)
>
> I just meant enable_signaling, the other ones are fine with me. The probl=
em with enable_signaling is that it's called with a spin lock held, so we c=
an't sleep.
>
> While resetting the GPU could be moved out into a timer the problem here =
is that I can't lock rdev->exclusive_lock in such situations.
>
> This means when i915 would call into radeon to enable signaling for a fen=
ce we can't make sure that there is not GPU reset running on another CPU. A=
nd touching the IRQ registers while a reset is going on is a really good re=
cipe to lockup the whole system.
If you increase the irq counter on all rings before doing a gpu reset, adju=
st the state and call sw_irq_put when done this race could never happen. Or=
 am I missing something?

~Maarten

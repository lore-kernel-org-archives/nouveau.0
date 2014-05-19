From: Maarten Lankhorst <maarten.lankhorst@canonical.com>
Subject: Re: [RFC PATCH v1 08/16] drm/radeon: use common fence implementation
 for fences
Date: Mon, 19 May 2014 10:00:04 +0200
Message-ID: <5379BA04.8000901@canonical.com>
References: <20140514145134.21163.32350.stgit@patser>
 <20140514145809.21163.64947.stgit@patser> <53738BCC.2070809@vodafone.de>
 <5374131D.4010906@canonical.com> <53748702.6070606@vodafone.de>
 <53748AFA.8010109@canonical.com> <53748BFD.1050608@vodafone.de>
 <5374BB4A.6070102@canonical.com> <5374BEE2.4060608@vodafone.de>
 <5374CC9A.9090905@canonical.com> <5374E1B5.2020408@vodafone.de>
 <5374E410.1080203@canonical.com> <5374E792.4070607@vodafone.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Content-Transfer-Encoding: quoted-printable
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <5374E792.4070607@vodafone.de>
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

op 15-05-14 18:13, Christian K=F6nig schreef:
> Am 15.05.2014 17:58, schrieb Maarten Lankhorst:
>> op 15-05-14 17:48, Christian K=F6nig schreef:
>>> Am 15.05.2014 16:18, schrieb Maarten Lankhorst:
>>>> op 15-05-14 15:19, Christian K=F6nig schreef:
>>>>> Am 15.05.2014 15:04, schrieb Maarten Lankhorst:
>>>>>> op 15-05-14 11:42, Christian K=F6nig schreef:
>>>>>>> Am 15.05.2014 11:38, schrieb Maarten Lankhorst:
>>>>>>>> op 15-05-14 11:21, Christian K=F6nig schreef:
>>>>>>>>> Am 15.05.2014 03:06, schrieb Maarten Lankhorst:
>>>>>>>>>> op 14-05-14 17:29, Christian K=F6nig schreef:
>>>>>>>>>>>> +    /* did fence get signaled after we enabled the sw irq? */
>>>>>>>>>>>> +    if (atomic64_read(&fence->rdev->fence_drv[fence->ring].la=
st_seq) >=3D fence->seq) {
>>>>>>>>>>>> + radeon_irq_kms_sw_irq_put(fence->rdev, fence->ring);
>>>>>>>>>>>> +        return false;
>>>>>>>>>>>> +    }
>>>>>>>>>>>> +
>>>>>>>>>>>> +    fence->fence_wake.flags =3D 0;
>>>>>>>>>>>> +    fence->fence_wake.private =3D NULL;
>>>>>>>>>>>> +    fence->fence_wake.func =3D radeon_fence_check_signaled;
>>>>>>>>>>>> + __add_wait_queue(&fence->rdev->fence_queue, &fence->fence_wa=
ke);
>>>>>>>>>>>> +    fence_get(f);
>>>>>>>>>>> That looks like a race condition to me. The fence needs to be a=
dded to the wait queue before the check, not after.
>>>>>>>>>>>
>>>>>>>>>>> Apart from that the whole approach looks like a really bad idea=
 to me. How for example is lockup detection supposed to happen with this? =

>>>>>>>>>> It's not a race condition because fence_queue.lock is held when =
this function is called.
>>>>>>>>> Ah, I see. That's also the reason why you moved the wake_up_all o=
ut of the processing function.
>>>>>>>> Correct. :-)
>>>>>>>>>> Lockup's a bit of a weird problem, the changes wouldn't allow co=
re ttm code to handle the lockup any more,
>>>>>>>>>> but any driver specific wait code would still handle this. I did=
 this by design, because in future patches the wait
>>>>>>>>>> function may be called from outside of the radeon driver. The of=
ficial wait function takes a timeout parameter,
>>>>>>>>>> so lockups wouldn't be fatal if the timeout is set to something =
like 30*HZ for example, it would still return
>>>>>>>>>> and report that the function timed out.
>>>>>>>>> Timeouts help with the detection of the lockup, but not at all wi=
th the handling of them.
>>>>>>>>>
>>>>>>>>> What we essentially need is a wait callback into the driver that =
is called in non atomic context without any locks held.
>>>>>>>>>
>>>>>>>>> This way we can block for the fence to become signaled with a tim=
eout and can then also initiate the reset handling if necessary.
>>>>>>>>>
>>>>>>>>> The way you designed the interface now means that the driver neve=
r gets a chance to wait for the hardware to become idle and so never has th=
e opportunity to the reset the whole thing.
>>>>>>>> You could set up a hangcheck timer like intel does, and end up wit=
h a reliable hangcheck detection that doesn't depend on cpu waits. :-) Or o=
verride the default wait function and restore the old behavior.
>>>>>>>
>>>>>>> Overriding the default wait function sounds better, please implemen=
t it this way.
>>>>>>>
>>>>>>> Thanks,
>>>>>>> Christian. =

>>>>>>
>>>>>> Does this modification look sane?
>>>>> Adding the timeout is on my todo list for quite some time as well, so=
 this part makes sense.
>>>>>
>>>>>> +static long __radeon_fence_wait(struct fence *f, bool intr, long ti=
meout)
>>>>>> +{
>>>>>> +    struct radeon_fence *fence =3D to_radeon_fence(f);
>>>>>> +    u64 target_seq[RADEON_NUM_RINGS] =3D {};
>>>>>> +
>>>>>> +    target_seq[fence->ring] =3D fence->seq;
>>>>>> +    return radeon_fence_wait_seq_timeout(fence->rdev, target_seq, i=
ntr, timeout);
>>>>>> +}
>>>>> When this call is comming from outside the radeon driver you need to =
lock rdev->exclusive_lock here to make sure not to interfere with a possibl=
e reset.
>>>> Ah thanks, I'll add that.
>>>>
>>>>>>      .get_timeline_name =3D radeon_fence_get_timeline_name,
>>>>>>      .enable_signaling =3D radeon_fence_enable_signaling,
>>>>>>      .signaled =3D __radeon_fence_signaled,
>>>>> Do we still need those callback when we implemented the wait callback?
>>>> .get_timeline_name is used for debugging (trace events).
>>>> .signaled is the non-blocking call to check if the fence is signaled o=
r not.
>>>> .enable_signaling is used for adding callbacks upon fence completion, =
the default 'fence_default_wait' uses it, so
>>>> when it works no separate implementation is needed unless you want to =
do more than just waiting.
>>>> It's also used when fence_add_callback is called. i915 can be patched =
to use it. ;-)
>>>
>>> I just meant enable_signaling, the other ones are fine with me. The pro=
blem with enable_signaling is that it's called with a spin lock held, so we=
 can't sleep.
>>>
>>> While resetting the GPU could be moved out into a timer the problem her=
e is that I can't lock rdev->exclusive_lock in such situations.
>>>
>>> This means when i915 would call into radeon to enable signaling for a f=
ence we can't make sure that there is not GPU reset running on another CPU.=
 And touching the IRQ registers while a reset is going on is a really good =
recipe to lockup the whole system.
>> If you increase the irq counter on all rings before doing a gpu reset, a=
djust the state and call sw_irq_put when done this race could never happen.=
 Or am I missing something?
>>
> Beside that's being extremely ugly in the case of a hard PCI reset even t=
ouching any register or just accessing VRAM in this moment can crash the bo=
x. Just working around the enable/disable of the interrupt here won't help =
us much.
>
> Adding another spin lock won't work so well either, because the reset fun=
ction itself wants to sleep as well.
>
> The only solution I see off hand is making the critical reset code path w=
ork in atomic context as well, but that's not really doable cause AFAIK we =
need to work with functions from the PCI subsystem and spinning on a lock f=
or up to a second is not really desirable also.
I've checked the code a little but that can be the case now as well. the ne=
w implementation's __radeon_fence_wait will be protected by the exclusive_l=
ock,, but enable_signaling is only protected by the fence_queue.lock and is=
_signaled is not protected. But this is not a change from the current situa=
tion, so it would only become a problem if the gpu hangs in a cross-device =
situation.

I think adding 1 to the irq refcount in the reset sequence and adding a dow=
n_read_trylock on the exclusive lock would help. If the trylock fails we co=
uld perform only the safe actions without touching any of the gpu registers=
 or vram, adding the refcount is needed to ensure enable_signaling works as=
 intended.

~Maarten

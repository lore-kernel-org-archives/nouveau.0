From: Maarten Lankhorst <maarten.lankhorst@canonical.com>
Subject: Re: [RFC PATCH v1 08/16] drm/radeon: use common fence implementation
 for fences
Date: Thu, 15 May 2014 11:38:02 +0200
Message-ID: <53748AFA.8010109@canonical.com>
References: <20140514145134.21163.32350.stgit@patser>
 <20140514145809.21163.64947.stgit@patser> <53738BCC.2070809@vodafone.de>
 <5374131D.4010906@canonical.com> <53748702.6070606@vodafone.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Content-Transfer-Encoding: quoted-printable
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <53748702.6070606@vodafone.de>
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

op 15-05-14 11:21, Christian K=F6nig schreef:
> Am 15.05.2014 03:06, schrieb Maarten Lankhorst:
>> op 14-05-14 17:29, Christian K=F6nig schreef:
>>>> +    /* did fence get signaled after we enabled the sw irq? */
>>>> +    if (atomic64_read(&fence->rdev->fence_drv[fence->ring].last_seq) =
>=3D fence->seq) {
>>>> +        radeon_irq_kms_sw_irq_put(fence->rdev, fence->ring);
>>>> +        return false;
>>>> +    }
>>>> +
>>>> +    fence->fence_wake.flags =3D 0;
>>>> +    fence->fence_wake.private =3D NULL;
>>>> +    fence->fence_wake.func =3D radeon_fence_check_signaled;
>>>> +    __add_wait_queue(&fence->rdev->fence_queue, &fence->fence_wake);
>>>> +    fence_get(f);
>>> That looks like a race condition to me. The fence needs to be added to =
the wait queue before the check, not after.
>>>
>>> Apart from that the whole approach looks like a really bad idea to me. =
How for example is lockup detection supposed to happen with this? =

>> It's not a race condition because fence_queue.lock is held when this fun=
ction is called.
> Ah, I see. That's also the reason why you moved the wake_up_all out of th=
e processing function.
Correct. :-)
>> Lockup's a bit of a weird problem, the changes wouldn't allow core ttm c=
ode to handle the lockup any more,
>> but any driver specific wait code would still handle this. I did this by=
 design, because in future patches the wait
>> function may be called from outside of the radeon driver. The official w=
ait function takes a timeout parameter,
>> so lockups wouldn't be fatal if the timeout is set to something like 30*=
HZ for example, it would still return
>> and report that the function timed out.
> Timeouts help with the detection of the lockup, but not at all with the h=
andling of them.
>
> What we essentially need is a wait callback into the driver that is calle=
d in non atomic context without any locks held.
>
> This way we can block for the fence to become signaled with a timeout and=
 can then also initiate the reset handling if necessary.
>
> The way you designed the interface now means that the driver never gets a=
 chance to wait for the hardware to become idle and so never has the opport=
unity to the reset the whole thing.
You could set up a hangcheck timer like intel does, and end up with a relia=
ble hangcheck detection that doesn't depend on cpu waits. :-) Or override t=
he default wait function and restore the old behavior.

~Maarten

From: Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Subject: Re: [RFC PATCH v1 08/16] drm/radeon: use common fence
 implementation for fences
Date: Thu, 15 May 2014 03:06:37 +0200
Message-ID: <5374131D.4010906@canonical.com>
References: <20140514145134.21163.32350.stgit@patser>
 <20140514145809.21163.64947.stgit@patser> <53738BCC.2070809@vodafone.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <53738BCC.2070809-ANTagKRnAhcb1SvskN2V4Q@public.gmane.org>
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

op 14-05-14 17:29, Christian K=F6nig schreef:
>> +    /* did fence get signaled after we enabled the sw irq? */
>> +    if (atomic64_read(&fence->rdev->fence_drv[fence->ring].last_seq) >=
=3D fence->seq) {
>> +        radeon_irq_kms_sw_irq_put(fence->rdev, fence->ring);
>> +        return false;
>> +    }
>> +
>> +    fence->fence_wake.flags =3D 0;
>> +    fence->fence_wake.private =3D NULL;
>> +    fence->fence_wake.func =3D radeon_fence_check_signaled;
>> +    __add_wait_queue(&fence->rdev->fence_queue, &fence->fence_wake);
>> +    fence_get(f);
> That looks like a race condition to me. The fence needs to be added to th=
e wait queue before the check, not after.
>
> Apart from that the whole approach looks like a really bad idea to me. Ho=
w for example is lockup detection supposed to happen with this? =

It's not a race condition because fence_queue.lock is held when this functi=
on is called.

Lockup's a bit of a weird problem, the changes wouldn't allow core ttm code=
 to handle the lockup any more,
but any driver specific wait code would still handle this. I did this by de=
sign, because in future patches the wait
function may be called from outside of the radeon driver. The official wait=
 function takes a timeout parameter,
so lockups wouldn't be fatal if the timeout is set to something like 30*HZ =
for example, it would still return
and report that the function timed out.

~Maarten

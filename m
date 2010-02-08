From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau: don't hold spin lock while
	calling kzalloc with GFP_KERNEL
Date: Mon, 8 Feb 2010 12:02:01 +0100
Message-ID: <6d4bc9fc1002080302v2f6d6010i2880fc4a8d1523a8@mail.gmail.com>
References: <1265505080-7099-1-git-send-email-madman2003@gmail.com>
	<20100208123059.7e8154bf@daedalus.pq.iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20100208123059.7e8154bf-cxYvVS3buNOdIgDiPM52R8c4bpwCjbIv@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Thanks for pointing that out, is it preferred to use goto style
failure or just stick the spin unlock everywhere where you return?

Maarten.

On Mon, Feb 8, 2010 at 11:30 AM, Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org> wrote:
> On Sun, =A07 Feb 2010 02:11:20 +0100
> Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
>> - 'joi' on irc pointed out that this triggers a BUG_ON, because
>> kzalloc could sleep.
>> - The irq handler should restore the value NV03_PFIFO_CACHES, but
>> still it's better if this stuff doesn't happen in the middle of
>> fifo create context. I see no reason in spin locking pgraph
>> create context, it isn't activated at that stage.
>> - Move and rename the lock after some discussion with 'joi', even
>> better naming suggestions are appreciated.
>>
>> Signed-off-by: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>> =A0drivers/gpu/drm/nouveau/nouveau_channel.c | =A0 =A09 ++-------
>> =A0drivers/gpu/drm/nouveau/nouveau_drv.h =A0 =A0 | =A0 =A04 +++-
>> =A0drivers/gpu/drm/nouveau/nouveau_irq.c =A0 =A0 | =A0 =A04 ++--
>> =A0drivers/gpu/drm/nouveau/nouveau_state.c =A0 | =A0 =A02 +-
>> =A0drivers/gpu/drm/nouveau/nv04_fifo.c =A0 =A0 =A0 | =A0 =A05 +++++
>> =A0drivers/gpu/drm/nouveau/nv40_fifo.c =A0 =A0 =A0 | =A0 =A05 +++++
>> =A0drivers/gpu/drm/nouveau/nv50_fifo.c =A0 =A0 =A0 | =A0 =A04 ++++
>> =A07 files changed, 22 insertions(+), 11 deletions(-)
>
> <...>
>
>> diff --git a/drivers/gpu/drm/nouveau/nv50_fifo.c
>> b/drivers/gpu/drm/nouveau/nv50_fifo.c index 204a79f..983e43b
>> 100644 --- a/drivers/gpu/drm/nouveau/nv50_fifo.c
>> +++ b/drivers/gpu/drm/nouveau/nv50_fifo.c
>> @@ -243,6 +243,7 @@ nv50_fifo_create_context(struct
>> nouveau_channel *chan) struct drm_device *dev =3D chan->dev;
>> =A0 =A0 =A0 struct drm_nouveau_private *dev_priv =3D dev->dev_private;
>> =A0 =A0 =A0 struct nouveau_gpuobj *ramfc =3D NULL;
>> + =A0 =A0 unsigned long flags;
>> =A0 =A0 =A0 int ret;
>>
>> =A0 =A0 =A0 NV_DEBUG(dev, "ch%d\n", chan->id);
>> @@ -278,6 +279,8 @@ nv50_fifo_create_context(struct
>> nouveau_channel *chan) return ret;
>> =A0 =A0 =A0 }
>>
>> + =A0 =A0 spin_lock_irqsave(&dev_priv->context_switch_lock, flags);
>> +
>> =A0 =A0 =A0 dev_priv->engine.instmem.prepare_access(dev, true);
>>
>> =A0 =A0 =A0 nv_wo32(dev, ramfc, 0x08/4, chan->pushbuf_base);
>> @@ -310,6 +313,7 @@ nv50_fifo_create_context(struct
>> nouveau_channel *chan) return ret;
>> =A0 =A0 =A0 }
>>
>> + =A0 =A0 spin_unlock_irqrestore(&dev_priv->context_switch_lock,
>> flags); return 0;
>> =A0}
>
> After this patch, sparse complains:
> drivers/gpu/drm/nouveau/nv50_fifo.c:241:1: warning: context imbalance in =
'nv50_fifo_create_context' - different lock contexts for basic block
>
> Near the end of the function, the failure exit path does not unlock the
> spinlock.
>
> Btw. before this patch nouveau_channel_alloc() contains two cases of
> failure path not releasing the spinlock, plus, under the spinlock,
> a call to a function that re-locks the spinlock, hence hangs.
> Sparse does warn about exiting a function without releasing a
> spinlock in every path, i.e., inconsistent lock behaviour.
>
> Thanks.
>
> --
> Pekka Paalanen
> http://www.iki.fi/pq/
>

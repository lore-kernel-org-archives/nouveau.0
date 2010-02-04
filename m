From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 6/6] drm/nouveau: give pgraph a chance to idle
	before spinlock
Date: Thu, 4 Feb 2010 21:11:37 +0100
Message-ID: <6d4bc9fc1002041211h17a11caclb6e23bee9636934e@mail.gmail.com>
References: <1265146565-6048-1-git-send-email-madman2003@gmail.com>
	<1265146565-6048-2-git-send-email-madman2003@gmail.com>
	<1265146565-6048-3-git-send-email-madman2003@gmail.com>
	<1265146565-6048-4-git-send-email-madman2003@gmail.com>
	<1265146565-6048-5-git-send-email-madman2003@gmail.com>
	<1265146565-6048-6-git-send-email-madman2003@gmail.com>
	<6d4bc9fc1002031002w18832748k1b62344dbe55adce@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <6d4bc9fc1002031002w18832748k1b62344dbe55adce-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Pushed as announced, with a few minor style changes that checkpatch pointed=
 out.

On Wed, Feb 3, 2010 at 7:02 PM, Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wro=
te:
> Patches 4-6 will be pushed tomorrow if there are no objections.
>
> Acks or comments appreciated as usual.
>
> Maarten.
>
> On Tue, Feb 2, 2010 at 10:36 PM, Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> =
wrote:
>> - Under some rare conditions i've managed to get pgraph errors after the
>> =A0channel is closed, which has very undesirable effects.
>> - This is the only reason i can think off.
>>
>> Signed-off-by: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>> =A0drivers/gpu/drm/nouveau/nouveau_channel.c | =A0 13 ++++++++++---
>> =A01 files changed, 10 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_channel.c b/drivers/gpu/drm=
/nouveau/nouveau_channel.c
>> index 86399f6..d25ed61 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_channel.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_channel.c
>> @@ -280,11 +280,18 @@ nouveau_channel_free(struct nouveau_channel *chan)
>> =A0 =A0 =A0 =A0 */
>> =A0 =A0 =A0 =A0nouveau_fence_fini(chan);
>>
>> - =A0 =A0 =A0 spin_lock_irqsave(&dev_priv->engine.lock, flags);
>> -
>> - =A0 =A0 =A0 /* Ensure the channel is no longer active on the GPU */
>> + =A0 =A0 =A0 /* This will prevent pfifo from switching channels. */
>> =A0 =A0 =A0 =A0pfifo->reassign(dev, false);
>>
>> + =A0 =A0 =A0 /* We want to give pgraph a chance to idle and get rid of =
all potential
>> + =A0 =A0 =A0 =A0* errors. We need to do this before the lock, otherwise=
 the irq handler
>> + =A0 =A0 =A0 =A0* is unable to process them.
>> + =A0 =A0 =A0 =A0*/
>> + =A0 =A0 =A0 if (pgraph->channel(dev) =3D=3D chan)
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 nouveau_wait_for_idle(dev);
>> +
>> + =A0 =A0 =A0 spin_lock_irqsave(&dev_priv->engine.lock, flags);
>> +
>> =A0 =A0 =A0 =A0pgraph->fifo_access(dev, false);
>> =A0 =A0 =A0 =A0if (pgraph->channel(dev) =3D=3D chan)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0pgraph->unload_context(dev);
>> --
>> 1.6.6.1
>>
>>
>

From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/6] drm/nv50: delete ramfc object after
	disabling fifo, not before
Date: Wed, 3 Feb 2010 19:01:07 +0100
Message-ID: <6d4bc9fc1002031001x4fe1d785lb126f0b66c2c0897@mail.gmail.com>
References: <1265146565-6048-1-git-send-email-madman2003@gmail.com>
	<1265146565-6048-2-git-send-email-madman2003@gmail.com>
	<1265146565-6048-3-git-send-email-madman2003@gmail.com>
	<6d4bc9fc1002021337n781618bfkd4e7220eb832fc21@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <6d4bc9fc1002021337n781618bfkd4e7220eb832fc21-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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

1-3 pushed as announced.

On Tue, Feb 2, 2010 at 10:37 PM, Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wr=
ote:
> I intend to push patch 1-3 tomorrow if there are no objections.
>
> Acks are appreciated as usual.
>
> On Tue, Feb 2, 2010 at 10:36 PM, Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> =
wrote:
>> - ramfc is zero'ed upon destruction, so it's safer to do things in the r=
ight
>> order.
>>
>> Signed-off-by: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>> =A0drivers/gpu/drm/nouveau/nv50_fifo.c | =A0 =A09 ++++++---
>> =A01 files changed, 6 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/nouveau/nv50_fifo.c b/drivers/gpu/drm/nouve=
au/nv50_fifo.c
>> index 32b244b..204a79f 100644
>> --- a/drivers/gpu/drm/nouveau/nv50_fifo.c
>> +++ b/drivers/gpu/drm/nouveau/nv50_fifo.c
>> @@ -317,17 +317,20 @@ void
>> =A0nv50_fifo_destroy_context(struct nouveau_channel *chan)
>> =A0{
>> =A0 =A0 =A0 =A0struct drm_device *dev =3D chan->dev;
>> + =A0 =A0 =A0 struct nouveau_gpuobj_ref *ramfc =3D chan->ramfc;
>>
>> =A0 =A0 =A0 =A0NV_DEBUG(dev, "ch%d\n", chan->id);
>>
>> - =A0 =A0 =A0 nouveau_gpuobj_ref_del(dev, &chan->ramfc);
>> - =A0 =A0 =A0 nouveau_gpuobj_ref_del(dev, &chan->cache);
>> -
>> + =A0 =A0 =A0 /* This will ensure the channel is seen as disabled. */
>> + =A0 =A0 =A0 chan->ramfc =3D NULL;
>> =A0 =A0 =A0 =A0nv50_fifo_channel_disable(dev, chan->id, false);
>>
>> =A0 =A0 =A0 =A0/* Dummy channel, also used on ch 127 */
>> =A0 =A0 =A0 =A0if (chan->id =3D=3D 0)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0nv50_fifo_channel_disable(dev, 127, false=
);
>> +
>> + =A0 =A0 =A0 nouveau_gpuobj_ref_del(dev, &ramfc);
>> + =A0 =A0 =A0 nouveau_gpuobj_ref_del(dev, &chan->cache);
>> =A0}
>>
>> =A0int
>> --
>> 1.6.6.1
>>
>>
>

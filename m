From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] nouveau: avoid running out of relocs
Date: Sat, 5 Dec 2009 00:35:28 +0100
Message-ID: <6d4bc9fc0912041535j44a0792bvb13395d683537466@mail.gmail.com>
References: <1259963980-6698-1-git-send-email-madman2003@gmail.com>
	<1259969574.2897.1.camel@nisroch>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1259969574.2897.1.camel@nisroch>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

So the so_emit flush that was there was busted to begin with?

On Sat, Dec 5, 2009 at 12:32 AM, Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> NACK. =A0You'll want to do this once, at the start of nv50_state_emit(),
> if we run out *during* state_emit() something's gone very wrong, and
> we'd need to fallback to software as the DDX does.
>
> Having the flush occur mid-frame will cause other issues.
>
> Ben.
>
> On Fri, 2009-12-04 at 22:59 +0100, Maarten Maathuis wrote:
>> Signed-off-by: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>> =A0src/gallium/drivers/nouveau/nouveau_stateobj.h | =A0 12 ++++++++----
>> =A01 files changed, 8 insertions(+), 4 deletions(-)
>>
>> diff --git a/src/gallium/drivers/nouveau/nouveau_stateobj.h b/src/galliu=
m/drivers/nouveau/nouveau_stateobj.h
>> index b595405..28f483f 100644
>> --- a/src/gallium/drivers/nouveau/nouveau_stateobj.h
>> +++ b/src/gallium/drivers/nouveau/nouveau_stateobj.h
>> @@ -113,8 +113,10 @@ so_emit(struct nouveau_channel *chan, struct nouvea=
u_stateobj *so)
>> =A0 =A0 =A0 unsigned nr, i;
>>
>> =A0 =A0 =A0 nr =3D so->cur - so->push;
>> - =A0 =A0 if (pb->remaining < nr)
>> - =A0 =A0 =A0 =A0 =A0 =A0 nouveau_pushbuf_flush(chan, nr);
>> + =A0 =A0 /* This will flush if we need space.
>> + =A0 =A0 =A0* We don't actually need the marker.
>> + =A0 =A0 =A0*/
>> + =A0 =A0 nouveau_pushbuf_marker_emit(chan, nr, so->cur_reloc);
>> =A0 =A0 =A0 pb->remaining -=3D nr;
>>
>> =A0 =A0 =A0 memcpy(pb->cur, so->push, nr * 4);
>> @@ -138,8 +140,10 @@ so_emit_reloc_markers(struct nouveau_channel *chan,=
 struct nouveau_stateobj *so)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 return;
>>
>> =A0 =A0 =A0 i =3D so->cur_reloc << 1;
>> - =A0 =A0 if (pb->remaining < i)
>> - =A0 =A0 =A0 =A0 =A0 =A0 nouveau_pushbuf_flush(chan, i);
>> + =A0 =A0 /* This will flush if we need space.
>> + =A0 =A0 =A0* We don't actually need the marker.
>> + =A0 =A0 =A0*/
>> + =A0 =A0 nouveau_pushbuf_marker_emit(chan, i, i);
>> =A0 =A0 =A0 pb->remaining -=3D i;
>>
>> =A0 =A0 =A0 for (i =3D 0; i < so->cur_reloc; i++) {
>
>
>

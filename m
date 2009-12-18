From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] nouveau: don't emit reloc markers for bo's
	that are mapped
Date: Fri, 18 Dec 2009 11:07:36 +0100
Message-ID: <6d4bc9fc0912180207j3d16d3fbxad12971052264e5e@mail.gmail.com>
References: <1261098373-27809-1-git-send-email-madman2003@gmail.com>
	<4B2B5227.7040906@student.tuwien.ac.at>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4B2B5227.7040906-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Fri, Dec 18, 2009 at 10:57 AM, Christoph Bumiller
<e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org> wrote:
> Maarten Maathuis schrieb:
>> Signed-off-by: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>> =A0src/gallium/drivers/nouveau/nouveau_stateobj.h | =A0 =A09 +++++++++
>> =A01 files changed, 9 insertions(+), 0 deletions(-)
>>
>> diff --git a/src/gallium/drivers/nouveau/nouveau_stateobj.h b/src/galliu=
m/drivers/nouveau/nouveau_stateobj.h
>> index 9aee9e4..6c40f64 100644
>> --- a/src/gallium/drivers/nouveau/nouveau_stateobj.h
>> +++ b/src/gallium/drivers/nouveau/nouveau_stateobj.h
>> @@ -163,6 +163,15 @@ so_emit_reloc_markers(struct nouveau_channel *chan,=
 struct nouveau_stateobj *so)
>> =A0 =A0 =A0 for (i =3D 0; i < so->cur_reloc; i++) {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct nouveau_stateobj_reloc *r =3D &so->re=
loc[i];
>>
>> + =A0 =A0 =A0 =A0 =A0 =A0 /* This is probably a vbo which has caused a p=
ushbuf flush
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0* before mapping. Don't try to reloc it aga=
in, it will cause
> don't you mean un-mapping here ?
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0* problems, because important stuff is skip=
ped.
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0*/
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (r->bo->map) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pb->remaining +=3D 2;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 continue;
>> + =A0 =A0 =A0 =A0 =A0 =A0 }
>> +
> Should that be able to happen ?
> I mean, the state tracker probably should have unmapped the VBOs again
> before making us to use them for drawing (or doesn't it ?), and if *we*
> mapped the VBO because we're using the VERTEX_DATA immediate mode, there
> should be no relocation in any of the state objects we emit relocation
> markers for.
>
> Btw. in case of an error in the immediate path (i.e. if the vertex
> element is invalid) I forgot to unmap the vbufs again, and there
> might be double unmap in in nv50_map_vbufs because I didn't check if
> map was NULL there.
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 if ((ret =3D nouveau_pushbuf_emit_reloc(chan=
, pb->cur++, r->bo,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0r->packet, 0,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0(r->flags & (NOUVEAU_BO_VRAM |
>
> Christoph
> (sorry, forgot to CC to the list in first send)
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
>

What i think is happening here (a bit of a guess, adjusted as i wrote
it here, because my first idea was wrong). VBO is used, vbo is filled,
vbo state is emitted, vbo/pipe buffer is mapped (by the statetracker),
but libdrm_nouveau realizes that the pushbuf needs a flush. At that
point reloc markers in flush notify is fine, since it happens before
the map. But if the pushbuf gets flushed again, the the reloc markers
will try to emit a buffer that is mapped.

This is the only thing i can think off, but i admit i still see kernel
warnings about trying to emit buffers which are mapped by same process
sometimes. So i will have a closer look at the vbo code soon.

Maarten.

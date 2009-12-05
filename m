From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH] nouveau: avoid running out of relocs
Date: Sat, 05 Dec 2009 17:07:38 +0100
Message-ID: <87ocmdpfp1.fsf@riseup.net>
References: <1259963980-6698-1-git-send-email-madman2003@gmail.com>
	<1259969574.2897.1.camel@nisroch>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0467262664=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1259969574.2897.1.camel@nisroch> (Ben Skeggs's message of "Sat,
	05 Dec 2009 09:32:54 +1000")
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Mime-version: 1.0
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============0467262664==
Content-Type: multipart/signed; boundary="==-=-=";
	micalg=pgp-sha1; protocol="application/pgp-signature"

--==-=-=
Content-Type: multipart/mixed; boundary="=-=-="

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:

> NACK.  You'll want to do this once, at the start of nv50_state_emit(),
> if we run out *during* state_emit() something's gone very wrong, and
> we'd need to fallback to software as the DDX does.
>
> Having the flush occur mid-frame will cause other issues.
>

It shouldn't, at least for nv50. If a mid-frame flush happens
nv50_state_flush_notify() will re-emit anything that's needed to go on
with the state emission, so Maarten's proposal looks fine to me as long
as he or someone else fixes the nv[34]0 pipe drivers to use flush
notifiers. :)

Software fallbacks could still be handled this way: if a BO cannot be
relocated you just rewind the pushbuf up to the last marker and then you
kick it off to clean up any references to the buffers software rendering
is going to be performed on.

> Ben.
>
> On Fri, 2009-12-04 at 22:59 +0100, Maarten Maathuis wrote:
>> Signed-off-by: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>  src/gallium/drivers/nouveau/nouveau_stateobj.h |   12 ++++++++----
>>  1 files changed, 8 insertions(+), 4 deletions(-)
>>=20
>> diff --git a/src/gallium/drivers/nouveau/nouveau_stateobj.h b/src/galliu=
m/drivers/nouveau/nouveau_stateobj.h
>> index b595405..28f483f 100644
>> --- a/src/gallium/drivers/nouveau/nouveau_stateobj.h
>> +++ b/src/gallium/drivers/nouveau/nouveau_stateobj.h
>> @@ -113,8 +113,10 @@ so_emit(struct nouveau_channel *chan, struct nouvea=
u_stateobj *so)
>>  	unsigned nr, i;
>>=20=20
>>  	nr =3D so->cur - so->push;
>> -	if (pb->remaining < nr)
>> -		nouveau_pushbuf_flush(chan, nr);
>> +	/* This will flush if we need space.
>> +	 * We don't actually need the marker.
>> +	 */
>> +	nouveau_pushbuf_marker_emit(chan, nr, so->cur_reloc);
>>  	pb->remaining -=3D nr;
>>=20=20
>>  	memcpy(pb->cur, so->push, nr * 4);
>> @@ -138,8 +140,10 @@ so_emit_reloc_markers(struct nouveau_channel *chan,=
 struct nouveau_stateobj *so)
>>  		return;
>>=20=20
>>  	i =3D so->cur_reloc << 1;
>> -	if (pb->remaining < i)
>> -		nouveau_pushbuf_flush(chan, i);
>> +	/* This will flush if we need space.
>> +	 * We don't actually need the marker.
>> +	 */
>> +	nouveau_pushbuf_marker_emit(chan, i, i);
>>  	pb->remaining -=3D i;
>>=20=20
>>  	for (i =3D 0; i < so->cur_reloc; i++) {
>
>
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau

--=-=-=--

--==-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAksahUoACgkQ196Zy2qEI5crHgCgvw48/MLUkcYA9Lfivyjsx/sJ
XlIAoLASRblENs7Bb/PkqVToDn8COERd
=KvPj
-----END PGP SIGNATURE-----
--==-=-=--

--===============0467262664==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0467262664==--

From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [libdrm 09/13] nouveau: import and install a
 selection of nvif headers from the kernel
Date: Fri, 27 Nov 2015 11:07:51 +1000
Message-ID: <5657ACE7.1030801@gmail.com>
References: <1448522050-4873-1-git-send-email-skeggsb@gmail.com>
 <1448522050-4873-9-git-send-email-skeggsb@gmail.com>
 <CACvgo53xNBm-HHMX2GvWh3EVr7v5SEzbJnGsQkEk2khEf1SYOg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1011461402=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CACvgo53xNBm-HHMX2GvWh3EVr7v5SEzbJnGsQkEk2khEf1SYOg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: ML nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1011461402==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="GcEtfmKpKMQqh3CsoRHJRlDgTD9GHctlA"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--GcEtfmKpKMQqh3CsoRHJRlDgTD9GHctlA
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 11/27/2015 07:14 AM, Emil Velikov wrote:
> On 26 November 2015 at 07:14, Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> From: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>=20
>> --- a/nouveau/Makefile.am
>> +++ b/nouveau/Makefile.am
>> @@ -14,9 +14,18 @@ libdrm_nouveau_la_LIBADD =3D ../libdrm.la @PTHREADS=
TUBS_LIBS@
>>
>>  libdrm_nouveau_la_SOURCES =3D $(LIBDRM_NOUVEAU_FILES)
>>
>> -libdrm_nouveauincludedir =3D ${includedir}/libdrm
>> +libdrm_nouveauincludedir =3D ${includedir}/libdrm/nouveau
> Can we mention the change in the commit message, please ?
>=20
> This will be a nice test for places missing LIBDRM_NOUVEAU_CFLAGS :-)
> I take it that neither mesa nor ddx explode with this change ?
Nope, they take it just fine.  I tested all sorts of combinations of
kernel (supports nvif vs not), libdrm (patched/unpatched), ddx (making
sure it builds), and mesa (patched/unpatched) to make sure that nothing
regressed.

Ben.

>=20
> -Emil
>=20


--GcEtfmKpKMQqh3CsoRHJRlDgTD9GHctlA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWV6znAAoJEHYLnGJQkpH7iiYP/36pXiRNWTihGskMieXD4IFJ
ZKeXTiyjNS++XCJaU6xCUxVLBED6rIT6neZEpZCarYRDOs09jiwYcnETcr8EXoOe
hlJ7eGx4e+sVhlsDonJg/Cj8zykIt6VZMlMcaxFhgm4LtR0BySE2JmTFx5SPfHRv
T8i3A058hyiyxstopTH77RvXVnzAV7ybDo3HlHMYEEPMsHEgYujIucLGCK3Wd52p
PBUydODuGTTPLtHDAjiC9a35sljCot/30YeRySP5N8DacF1MePvlyVD70nKVzqL1
LyMpoB66PJyV7IO5pvg8HJchU0SyAr0xaykoDlfGilZD11jtFBsXOWk05Mt1DayF
zkikW2EsFZJvXzXmn9rwgI8YegKNwEe+9Aa4s5xxNHbJxtDjSsIIt/Z6bPNIcCkO
lXnASBjKxdX2iVzZRJfx5eVmNH7WyVKFYlw4FSaAfNSXCWuH5IAchAj09wHY9KjZ
NLCFjvwJJXKukeegc4e/l0M4uE7GBHzIxCE3gRW3B7EFOY6ZbHsBMXL57Kzsvy5s
YSWAMxxh+fZs/HE2fw7vupbUxrl7/TrqvC1moMEHcwvkDXA3rM58+mCcFvW7SYZ2
IB1NA9two1Ek2cLco6+AMRBLCzWoyvQpR5TCJSj7MZ8LXtHH7b52lkS8Y2PdTIHj
s5sqMe+/RAJ8xj1UYNDM
=KVeY
-----END PGP SIGNATURE-----

--GcEtfmKpKMQqh3CsoRHJRlDgTD9GHctlA--

--===============1011461402==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1011461402==--

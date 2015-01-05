From: Lukasz Stelmach <stlman-IjDXvh/HVVUAvxtiuMwx3w@public.gmane.org>
Subject: Re: sys-kernel/gentoo-sources-3.17.7 - nouveau driver
 fails at system resume - nouveau E[ PGRAPH][0000:01:00.0] PGRAPH TLB flush
 idle timeout fail
Date: Mon, 05 Jan 2015 23:08:28 +0100
Message-ID: <54AB0B5C.4040609@poczta.fm>
References: <54A916A9.5040706@poczta.fm>
 <CAKb7UvjA_m4eZTGtCGfpOmP-pOwmGZ-2KEP3ZDAxnAUPZ-XVsQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0482091960=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAKb7UvjA_m4eZTGtCGfpOmP-pOwmGZ-2KEP3ZDAxnAUPZ-XVsQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0482091960==
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="BHcRKE608Gn7p85TjTQpQbPn48WQlV5cX"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--BHcRKE608Gn7p85TjTQpQbPn48WQlV5cX
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

It appears that in case of 3.17.7 as well as 3.19-rc2 the
nouveau.nofbaccel=3D1 helps. I don't get tons of "E[ PGRAPH]"
messages after resume and and the machine works OK in general.

On 04.01.2015 18:54, Ilia Mirkin wrote:
> Try booting with `nouveau.nofbaccel=3D1` and see if that helps. Some
> many kernels ago, acceleration of the console on fb resume got fixed,
> and is now causing issues for you and a few others. This will turn off
> fbcon accel, which should hopefully sidestep the issue.
>=20
> On Sun, Jan 4, 2015 at 5:32 AM, Lukasz Stelmach <stlman-IjDXvh/HVVUAvxtiuMwx3w@public.gmane.org> wrot=
e:
>> Hello,
>>
>> I'd like to bring to your attention a bug report[1] I have filed
>> on the Gentoo bugzilla about a regression (quite an old one) in
>> the nouveau driver.
>>
>> If there is anything missing in the report that could help fixing
>> the problem, please feel free to ask.
>>
>> [1] https://bugs.gentoo.org/show_bug.cgi?id=3D534038

--=20
By=C5=82o mi bardzo mi=C5=82o.                   Twoje oczy lubi=C4=85 mn=
ie
>=C5=81ukasz<                                     i to mnie zgubi  (c)SNL=



--BHcRKE608Gn7p85TjTQpQbPn48WQlV5cX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUqwtkAAoJEAC2l2xjkdNxa+oH/2vVDbj2CPIa7oeeAC+UJ2FY
SbZxRMw/YWy3Bc1x+M4wilQSy2Na7dXXGxPU8fnfTrB1E1n5Az1TK28IenVQ5BAg
OuFBMF6X3n+gcX1c5CfYSCozd6VcrPbUwxO6wGPp5Yx5UZdJCv8cg5Ut4y7mG3JT
JKy4jZY56X/kg0TdOdUZdp1ckOeXqdecCijYP90kyCqjxxnGuSPSQe8h6YnAl7ID
rDu4PBh7tlXnWXg72ekX4f+8Kt7ed/T6JE7XBGXkuFamlcKfL2tifcLsotORLzVO
vZF4mEEdJYRbqaP4kyVR0NwfViluMZrtmveVY0jO9Yqvw76X8D6BwndvV1nv7Oo=
=sY/l
-----END PGP SIGNATURE-----

--BHcRKE608Gn7p85TjTQpQbPn48WQlV5cX--

--===============0482091960==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0482091960==--

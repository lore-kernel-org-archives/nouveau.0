From: Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org>
Subject: Re: NVAC "No Signal"
Date: Wed, 19 Oct 2016 19:58:06 +0200
Message-ID: <20161019175806.uqksdyiyr3dpkzu3@pmoreau.org>
References: <1de93d48-bc1c-bab4-11c4-395bfdfba7bb@gmail.com>
 <CAEXux-ZHdmop1c8F3FGRzAa_otwVjHUsT7OCVg6ObP_dg-Pcdw@mail.gmail.com>
 <90c3d7fc-16c9-bc81-8812-a9a1e86415dc@gmail.com>
 <CAEXux-Zr9SaRgSoVGCJKGO59CNYqq1MEwTo1ib23dCD+rxebjw@mail.gmail.com>
 <1f02c18b-e472-e3bc-9302-646d20e59d46@gmail.com>
 <CAEXux-a=F+AAr--rf8Dk_Cekcfk7yFF49mK4tW6MH4Xv=-2puA@mail.gmail.com>
 <07fa54e9-1a6f-de75-52ee-cc8aee96a541@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0871134007=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <07fa54e9-1a6f-de75-52ee-cc8aee96a541-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: poma <pomidorabelisima-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org


--===============0871134007==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="34mywhueix22nrai"
Content-Disposition: inline


--34mywhueix22nrai
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On 07:37 pm - Oct 19 2016, poma wrote:
> On 19.10.2016 17:03, Karol Herbst wrote:
>=20
> > You don't get why I try to say. We have to actually find out when to
> > apply this workaround, not to create some silly whitelist/blacklist.
> > It's the last option, we never want to actually use.
> >=20
>=20
> Well if you do not say, who can understand!? :)
> Besides, you can mock with "silly" whitelist/blacklist", however there is=
 nothing wrong with the method as such, it is used practically everywhere.
>=20
> > And even if we would have to create such lists, who tells us, that if
> > affects every GPU with your device id? Usually quirks are applied
> > depending on the sub-vendor-id and sub-device-id if actually required.
> >=20
> > In the end we need something like this: If byte X in table Y is set in
> > the vbios or if bits A-B in reg Z in the MMIO space are set to
> > whatever, we have to apply that workaround.
> >=20
> > In the end we should also wait until Ben replies, because he might
> > know the exact reasons why this workaround was actually needed.
> >=20
>=20
> If you eager to leave it broken even more than three months that have alr=
eady been passed since the original commit ...
>=20
> > We might have a GPU with the same chipset like yours and we might be
> > able to verify the issue
> >=20
>=20
> Ah, I see.
> You do not have confidence in my test results, good to know.

Testing on another GPU with the same chipset does not mean he does not trust
your results. For example, my laptop (which also has an NVAC) has been
triggering the no-signal message on external monitors way before Ben=E2=80=
=99s patch
landed, but only for some adapters. I haven=E2=80=99t tried Ben=E2=80=99s p=
atch yet, nor yours,
but I will certainly do it, and see what effect each of them has.

Regards,
Pierre

>=20
> Oh! Carol
>=20
>=20
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau

--34mywhueix22nrai
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYB7QoAAoJEK9AXpC17Pcjno8P+QGSOfs5aXHbRZy6zDP3Btyl
da2LsHiI5qFswq+HYDvYmvFy00CImXvqpTYIZvB8hd5StxLnPjF+yxXOglA2/K8X
TQ/5TeaNm+zvVld8doD3soR389/ne3lLtYVYVsFuBBVrL0+JZWUqfLHsly4wZL1a
Tacfw4oWOE0rlzUyvfYn9Z7ilKhv7dedfRjVGcIc55pPwiWlSr+rGYGknmhO8Ovo
jQgLowEcfEX+aU1oDaRi7mwm18jvyrkwe5Mtjus4nyDrWkstWM+Eklp8p8FwYEzA
nnCukK96xoFaUzKP72OBlOErSN78dCID5UhIks2onSa6bSZjk6Owftjs3hdd/34T
rGWOm4do38bix72I8eD27se2bskpOYepmpqivBPTZ+2ArPM88cxcJCYrV8yvaZ9/
0AUtTvYgnK2DMHfBH+3dZk1eCwdZ6VLB639Bb1LZiUDuuA9+RL8C2cVCErI3isnS
KiX479CwMTK+UWRceVRbE3vAaS0vlryVuSGEQgMglQKYoLEycxUvs5p57LktWM7z
ZQvqP/uuWsdV2kRlCfnjrIXaZZFIxoKDWfz0Mll6ybumLWMmYXvjtDrNHxv6iafx
z8kuTs8GpYoAZ1z2LBtguhObWpwclUzrYZ+e2Vv534shCQBnS9AukKH1qnTYnxbH
qso/OgHofrbFvoetPn9v
=uY4Q
-----END PGP SIGNATURE-----

--34mywhueix22nrai--

--===============0871134007==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0871134007==--

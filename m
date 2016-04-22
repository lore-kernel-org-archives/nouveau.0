From: Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org>
Subject: Re: GM108GLM?
Date: Fri, 22 Apr 2016 09:33:17 +0200
Message-ID: <20160422073317.GA5655@Sovereign.cs.lth.se>
References: <56FA7B55.6080208@translucent.dk>
 <20160331205745.GA1723@pmoreau.org>
 <CAKb7Uvgf_zzk3zaPMXbtj=6DqrT2bjrY_GpgarvV-Dv0jb=8pQ@mail.gmail.com>
 <20160331211231.GB1723@pmoreau.org>
 <5714B399.7020303@translucent.dk>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0729428400=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <5714B399.7020303-VZMzO6RJk8wFoxwNN1DV/Q@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Sune =?utf-8?B?TcO4bGdhYXJk?= <smo-VZMzO6RJk8wFoxwNN1DV/Q@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org


--===============0729428400==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8t9RHnE3ZwKMSgU+"
Content-Disposition: inline


--8t9RHnE3ZwKMSgU+
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

A patch was merged yesterday to recognise GM108 (see
https://github.com/skeggsb/nouveau/commit/3da1f2a19e5e8dc8d68a4400d9cca01c6=
4ecd59e).
I guess it will make it into 4.7.

Pierre

On 12:14 PM - Apr 18 2016, Sune M=C3=B8lgaard wrote:
> Is there anything I can do in this regard?
>=20
> /smo
>=20
> On 2016-03-31 23:12, Pierre Moreau wrote:
> > Oh, hum, GM108 is NV118 and not NV108 which is Gk208=E2=80=A6 My bad!
> >=20
> > SMF from the bug report seemed to have some working setup, and since he=
 didn't
> > pinged back, I guess it's working nicely. But some more checking might =
still be
> > needed?
> >=20
> > On 04:59 PM - Mar 31 2016, Ilia Mirkin wrote:
> >> Actually GM108 is not one of the recognized chips. Someone needs to go
> >> through and check that its goldens didn't change. Nobody's done that.
> >>
> >> See https://bugs.freedesktop.org/show_bug.cgi?id=3D89558
> >>
> >> On Thu, Mar 31, 2016 at 4:57 PM, Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org>=
 wrote:
> >>> Hello,
> >>>
> >>> Acceleration support for GM107 was merged in kernel 4.1, and modesett=
ing
> >>> support was added to 3.15. Which kernel version did you try? The GM10=
8 chipset
> >>> seems to be recognised since at least 2015/08/20.
> >>>
> >>> Regards,
> >>>
> >>> Pierre Moreau
> >>>
> >>>
> >>> On 02:55 PM - Mar 29 2016, Sune M=C3=B8lgaard wrote:
> >>>> Hiya,
> >>>>
> >>>> Is there any change for Quadro K620M support at some point in time, =
and
> >>>> what can I do to help, apart from the info below?
> >>>>
> >>>> Best regards,
> >>>>
> >>>> Sune M=C3=B8lgaard
> >>>>
> >>>> dmesg |grep -i nouveau
> >>>> [    1.164919] nouveau 0000:08:00.0: unknown chipset (1183a0a2)
> >>>> [    1.164943] nouveau: probe of 0000:08:00.0 failed with error -12
> >>>>
> >>>> lspci|grep -i nvidi
> >>>> 08:00.0 3D controller: NVIDIA Corporation GM108GLM [Quadro K620M] (r=
ev a2)
> >>>> _______________________________________________
> >>>> Nouveau mailing list
> >>>> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> >>>> https://lists.freedesktop.org/mailman/listinfo/nouveau
> >>>
> >>> _______________________________________________
> >>> Nouveau mailing list
> >>> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> >>> https://lists.freedesktop.org/mailman/listinfo/nouveau
> >>>
> >> _______________________________________________
> >> Nouveau mailing list
> >> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> >> https://lists.freedesktop.org/mailman/listinfo/nouveau
>=20
>=20




> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau


--8t9RHnE3ZwKMSgU+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXGdOrAAoJEI7uMhYTPh3w4JoQALx1BUVZoixmuJVV6pPvmV42
ADrDDf98E1h9GU4pPj+n/zgtDcHYb21BP2z1yoLhgE7lyr/1JOiJ+6O3FcoBotkp
tvhmO2oP5QM+8EKKuG9gWUACPGUL/JdIAkGOh/nvJh5kl1avmjJJBz2B0n4a6rcD
ysyVBSqhJggi3szChJC2lfS0goYAW/JkpnH/mRSDiqHTbYmifHrAfekZ0aN6/Chm
IaU9pYe+JpcF9n5/BM42vAgMNj6N7hK0NghtPXeqsM1jLzqw06hfw/bnfhzL4IuY
h/lZuket7UP7fijq1BIOBvMapGDiApyPyBEmmcoCd9AVQ0JRs8AKsY630KlU3mQe
tXpZ2ZSPJdgvovZ6JYEcklpCbFowhRps9jveq+M6Npozzj7qDC86LFlH3QwmDnDs
uW2svCnZ+rKnFm/OaGtVIzqmuvn+a69T9FHtRKKW8OC9SQ/ppCbFzb9dPJPtRnQf
K+PsbqtBsG1ZV7fJ1g/evZMHlkTOQWgRhM3Fb+ese9l/KZdaSha/UI4iySLEykfS
m3HYLFHbXpD5J9XDRjUI1hdPvm35GzTK9uI0DeU3NxIGWVw5L+X/bnNdznxh+X0G
6YNTewpahcNC983elpSTAEoyT3fSPcrIObNiuI9R/H7dCIF3UGeknR6uVyzdZ2yP
sij9axuerAwdR7BUCBZu
=UIPU
-----END PGP SIGNATURE-----

--8t9RHnE3ZwKMSgU+--

--===============0729428400==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0729428400==--

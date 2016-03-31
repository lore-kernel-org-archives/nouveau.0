From: Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org>
Subject: Re: GM108GLM?
Date: Thu, 31 Mar 2016 23:12:31 +0200
Message-ID: <20160331211231.GB1723@pmoreau.org>
References: <56FA7B55.6080208@translucent.dk>
 <20160331205745.GA1723@pmoreau.org>
 <CAKb7Uvgf_zzk3zaPMXbtj=6DqrT2bjrY_GpgarvV-Dv0jb=8pQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0822909803=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAKb7Uvgf_zzk3zaPMXbtj=6DqrT2bjrY_GpgarvV-Dv0jb=8pQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org


--===============0822909803==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9zSXsLTf0vkW971A"
Content-Disposition: inline


--9zSXsLTf0vkW971A
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Oh, hum, GM108 is NV118 and not NV108 which is Gk208=E2=80=A6 My bad!

SMF from the bug report seemed to have some working setup, and since he did=
n't
pinged back, I guess it's working nicely. But some more checking might stil=
l be
needed?

On 04:59 PM - Mar 31 2016, Ilia Mirkin wrote:
> Actually GM108 is not one of the recognized chips. Someone needs to go
> through and check that its goldens didn't change. Nobody's done that.
>=20
> See https://bugs.freedesktop.org/show_bug.cgi?id=3D89558
>=20
> On Thu, Mar 31, 2016 at 4:57 PM, Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org> wr=
ote:
> > Hello,
> >
> > Acceleration support for GM107 was merged in kernel 4.1, and modesetting
> > support was added to 3.15. Which kernel version did you try? The GM108 =
chipset
> > seems to be recognised since at least 2015/08/20.
> >
> > Regards,
> >
> > Pierre Moreau
> >
> >
> > On 02:55 PM - Mar 29 2016, Sune M=C3=B8lgaard wrote:
> >> Hiya,
> >>
> >> Is there any change for Quadro K620M support at some point in time, and
> >> what can I do to help, apart from the info below?
> >>
> >> Best regards,
> >>
> >> Sune M=C3=B8lgaard
> >>
> >> dmesg |grep -i nouveau
> >> [    1.164919] nouveau 0000:08:00.0: unknown chipset (1183a0a2)
> >> [    1.164943] nouveau: probe of 0000:08:00.0 failed with error -12
> >>
> >> lspci|grep -i nvidi
> >> 08:00.0 3D controller: NVIDIA Corporation GM108GLM [Quadro K620M] (rev=
 a2)
> >> _______________________________________________
> >> Nouveau mailing list
> >> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> >> https://lists.freedesktop.org/mailman/listinfo/nouveau
> >
> > _______________________________________________
> > Nouveau mailing list
> > Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> > https://lists.freedesktop.org/mailman/listinfo/nouveau
> >
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau

--9zSXsLTf0vkW971A
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJW/ZK4AAoJEI7uMhYTPh3w92kP/32VUT1lQPTk0x6ugTJgkVtV
5/Ecrb6K2S9LiDngQr5j9OK7dER7IZbfeFldta9pPkkZ6tq6dlQmR0oiM/wlmsrF
i5mLk4cLhdQWhWZ31tcp25VL5JiWwE3AqPOZiGxtLVLyDDXeGAMHXz436p2KsEiP
hZbopDDrUdVsBGIHFhfUh/G1BgYMIpTkYEMg0UfzTwC0z+KvoPkzOGSTtLCjuMvC
bPwGsmVD4waNpyBtqCeUANupu2cRvskBIKD8JQIJSx7FXmHA68fT8as7DpIzH38b
5HSoAYI2caoa0QyMGtZEmBjj4+UrDXkXPT0b1xpQYcB6gYoBYpdADzUImeLHcdMf
aiY5qDoZImoBDJI5axAjEnztKRkwBhPm3K8uPdA+kt8Dx2SVXuLJsbRCs2WzwNQ+
nFo7OU8E+DfMg2QLDSeTtKohvhV3jJ/iGN+OGxZzxfC5COGWxGvcEMS3E3JtN8sU
VRrEn4QbMBDTFrsPGhot6C58nTGONrF5OWalWHx5g8hXoHMSFjVfn11MJ2Px0U6v
8FVcR0wTlRbyIdtKV39p5lK/Jzvg9AwiMQC7zbrC67CKx+imkLEHkfsyLwH5ohqc
ipp+04yY6eQuamnHtnDH7JWkblZ6yYurphg6GzbajMRaa++DNhS+HqF58knpwzPN
F+72krKqQm9ZTSp7C3qW
=fhnm
-----END PGP SIGNATURE-----

--9zSXsLTf0vkW971A--

--===============0822909803==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0822909803==--

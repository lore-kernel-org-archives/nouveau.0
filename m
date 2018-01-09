From: Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org>
Subject: Re: [PATCH] ramgf100: Fix small typo.
Date: Tue, 9 Jan 2018 10:57:09 +0100
Message-ID: <20180109095708.h7bno7iflnqfys7r@pmoreau.org>
References: <20170728012010.9376-1-rosenp@gmail.com>
 <20171229213706.tseyuimojjfkxpcb@pmoreau.org>
 <CAKxU2N_Y7dEoGqYoJ1jrDmbt=kY5YNq+e-zUG_pnvRsJbtvsAQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1689289885=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAKxU2N_Y7dEoGqYoJ1jrDmbt=kY5YNq+e-zUG_pnvRsJbtvsAQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Rosen Penev <rosenp-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org


--===============1689289885==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="a6ge2ypwmke4bvls"
Content-Disposition: inline


--a6ge2ypwmke4bvls
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Indeed, it looks like the devel-clk branch does not have that typo.

On 2017-12-29 =E2=80=94 13:39, Rosen Penev wrote:
> This is fixed in a different nouveau branch. from Ben Skeggs last I remem=
ber.
>=20
> On Fri, Dec 29, 2017 at 1:37 PM, Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org> wr=
ote:
> > The typo is still present in master.
> > Not sure whether it will help you Ben, regarding Fermi reclocking, but =
it
> > shouldn=E2=80=99t harm in reducing possible errors. :-)
> >
> > Regards,
> > Pierre
> >
> > On 2017-07-27 =E2=80=94 18:20, Rosen Penev wrote:
> >> Signed-off by: Rosen Penev <rosenp-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >> ---
> >>  drm/nouveau/nvkm/subdev/fb/ramgf100.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/drm/nouveau/nvkm/subdev/fb/ramgf100.c b/drm/nouveau/nvkm/=
subdev/fb/ramgf100.c
> >> index 4a9bd4f1..feb8820c 100644
> >> --- a/drm/nouveau/nvkm/subdev/fb/ramgf100.c
> >> +++ b/drm/nouveau/nvkm/subdev/fb/ramgf100.c
> >> @@ -717,7 +717,7 @@ gf100_ram_new_(const struct nvkm_ram_func *func,
> >>       ram->fuc.r_0x10f9b4 =3D ramfuc_reg(0x10f9b4);
> >>       ram->fuc.r_0x10fb04 =3D ramfuc_reg(0x10fb04);
> >>       ram->fuc.r_0x10fb08 =3D ramfuc_reg(0x10fb08);
> >> -     ram->fuc.r_0x137310 =3D ramfuc_reg(0x137300);
> >> +     ram->fuc.r_0x137300 =3D ramfuc_reg(0x137300);
> >>       ram->fuc.r_0x137310 =3D ramfuc_reg(0x137310);
> >>       ram->fuc.r_0x137360 =3D ramfuc_reg(0x137360);
> >>       ram->fuc.r_0x1373ec =3D ramfuc_reg(0x1373ec);
> >> --
> >> 2.13.3
> >>
> >> _______________________________________________
> >> Nouveau mailing list
> >> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> >> https://lists.freedesktop.org/mailman/listinfo/nouveau
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau

--a6ge2ypwmke4bvls
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEYgBv5JnnDxeItcEHU3l4X80+KSQFAlpUke4ACgkQU3l4X80+
KST2sw//aNXuVx/f2MGisbALWTdXTo9QLnNWaeyIZGoh/xk3nEGur/lLR/cQ69eU
qHLjiteGXVqRFBzdamoXuiUaBeYEF/eGPAZsQruUBy27OfCzpAsU7BuAae+dy/kN
1PXLL+So4NJNwEJqLc5VfBq6ru6QLnuA5gK10ajXtqRuvFPd3q5Q9wVhq1EzvS8G
nbhI7ru/6qaY/aRO6FtvLnZNFG6TeR33b2JO6+pC1owth1zFA9RGfWlwF0GBMyRH
LemJktBuQ6eY0jPxyFNJj0umH+47XTYtnLm9W/5DFQeofxd0RXXcB4JjAaNfHOG5
pAXexDtZStnxUJrzR4zQjoXEDSRmSscXRG8i4E76GcMBz1hioBmlAeEApFHyc/cN
xoZNiZMlJyVkrPQDZSk2l+nOJZ8HtXxjZk0wnWRHJrR8+1WnoswAWK2jwX5/Xg4s
NBcr2/bOYzx9UoDJctV8riof/P205wEzdxjiI3kIh+Mjw6MNrCs7fr7C0j6jgu3S
vOMZod0Q7dX90SJ+OpOL8otWMJ7p9waGHWbPjcaNJgttSlM800RrZL7eCMyhGtmr
pYtEd/XFQTE7+iaRu56sW19hbg+5MIoVvSJIGMWda7xVa6O6GNgGW8vFAZrYsI91
A4aKVEsiUmitzBYtHE9O6d8dv7iAeLjI/aUafZdiYh+z7GXYmdo=
=Qu/Y
-----END PGP SIGNATURE-----

--a6ge2ypwmke4bvls--

--===============1689289885==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1689289885==--

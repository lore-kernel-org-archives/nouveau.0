From: Pierre Moreau <pierre.morrow@free.fr>
Subject: Re: [Nouveau] [PATCH 1/2] nouveau/bl: Assign different names to
 interfaces
Date: Sun, 17 Apr 2016 10:18:08 +0200
Message-ID: <20160417081808.GA4595@Normandy.alltele.se>
References: <1460732242-4161-1-git-send-email-pierre.morrow@free.fr>
 <CAKb7Uvg3OxWuooJ=otSb1N_yRr1VcVgvH4K0DDy1zzDs9js4CA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1178282444=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAKb7Uvg3OxWuooJ=otSb1N_yRr1VcVgvH4K0DDy1zzDs9js4CA@mail.gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Ilia Mirkin <imirkin@alum.mit.edu>
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org


--===============1178282444==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3V7upXqbjpZ4EhLz"
Content-Disposition: inline


--3V7upXqbjpZ4EhLz
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[=E2=80=A6]

>=20
> > +       const int nb =3D atomic_inc_return(&bl_interfaces_nb) - 1;
>=20
> This kinda sucks if you reload nouveau a bunch. How about using an
> "ida". Have a look in drivers/gpu/drm/drm_crtc.c for how I use that
> one.

I had a quick look at drm_crtc.c. This seems to be exactly what I need, exc=
ept
that I do not see how I can enforce to have one of the active ones being na=
med
`nv_backlight`, to not break (possibly) existing userspace applications. (I=
=E2=80=99m
guessing that I would be doing the same as in drm_crtc.c: looping over all
connectors and assigning them an ida, regardless of them being active or no=
t,
as they might become active later on.)

There is another issue that I failed to address with this patch, and just
realised about it. Each time `nvXX_backlight_init(connector)` is called on a
connector, a new backlight device is created, and is stored in
`drm->backlight`, which is unique at a device level, not connector level,
meaning the old one just gets overriden (and leaked). Having a list
`drm->backlights` should solve this issue. Would that be fine with you Ben?

Pierre

>=20
> > +       if (nb > 0 && nb < 100)
> > +               sprintf(backlight_name, "nv_backlight%d", nb);
> > +       else
> > +               sprintf(backlight_name, "nv_backlight");
> > +       return backlight_name;
> > +}
> > --
> > 2.8.0
> >
> > _______________________________________________
> > Nouveau mailing list
> > Nouveau@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/nouveau

--3V7upXqbjpZ4EhLz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXE0a5AAoJEI7uMhYTPh3ww1UP+wVTHFTQc9hA8AZw4ykdzQZ9
z6577mpTpdCiXQf+TTuENKJKO//E9V0OBsuE/laQF6SnCrBR1vXiJpyU44BbTLuv
8WbVzOLAExHjl8LWXIf3zbfFIYZNIZKr6h07DFGOWAlxlQ3ncrSH5ZbrqDijex4p
ADrwbd0s0xx88r6QCBivVJSWtWD24ScfYP8ggSo6zXwTOG5J3gIvtoZetWuY84La
9IPG8YBdlyBFfpGOirKh0LF8BvIkSGGOCkiaRPETx1ptagHnP9GRTWgAkQndNc3y
3/3M2MpX3iiJ8PE72VlgXB+sePFtP1GZjfdTX0eLpM8f+S2heieAZJGK3siBc8E8
v8hWk0QSoj+8sI3H1KRvbiHUq73P4SY9i8iSZcTSDuk/7UIWV/z9P9wbzBm2zueP
5UToZnoYi/wMp3UmXimRS5qOLQXk7Ql6eEqhJJ3M4Y3hUt4vlu52CLaiVNGRQ74S
a7pQry4CNXAaykPw1wwOnfc5NGRn5y9qZfetBPuNAWQJI+oaWDrjJIJ/B3rI4lBz
PNWy1Qo0eZBQutA/Bd+V2p4T6AtOJysN6LeEQzG8p+Nq6ZstvOp/F1BL1hW4Hb7w
B+TQPnVoFYj/GyyXGsed/osYqug+zs3J2xxpQd8NjCbAGnvphrNJI9OIJS5UykfV
RTm18poVF4EsWuSunaxe
=H8sE
-----END PGP SIGNATURE-----

--3V7upXqbjpZ4EhLz--

--===============1178282444==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1178282444==--

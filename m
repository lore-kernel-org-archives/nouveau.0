From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [Nouveau] noveau: emergency shutdown handling is overcomplex and
 broken
Date: Tue, 25 Oct 2016 13:13:00 +0200
Message-ID: <20161025111300.GB25855@amd>
References: <20161025105050.GA20923@amd>
 <CAEXux-YC5CRsEXc0EKxVgEgcQEO6J9cu5WeeAvorTfUHEDcr-Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1035417428=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAEXux-YC5CRsEXc0EKxVgEgcQEO6J9cu5WeeAvorTfUHEDcr-Q@mail.gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Karol Herbst <karolherbst@gmail.com>
Cc: ML nouveau <nouveau@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>, dri-devel <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: nouveau.vger.kernel.org


--===============1035417428==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tsOsTdHNUZQcU9Ye"
Content-Disposition: inline


--tsOsTdHNUZQcU9Ye
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue 2016-10-25 13:09:25, Karol Herbst wrote:
> Thanks for the pointer.
>=20
> But I don't like this patch. If you find a bug, make a bug report or
> just fix it if you know the fix already. Or write something in
> IRC. Or

I found a bug, and this is my bug report. Can you take care and fix
it?

									Pavel



> write on the Mailing list as a general question or something else
>=20
> But I really don't agree on doing it this way. You would have needed
> like the same amount of time to actual fix the problem.
>=20
> Anyway, for adding a printk:
>=20
> struct nvkm_subdev *subdev =3D &therm->subdev;
> nvkm_error(subdev, "message");
>=20
> 2016-10-25 12:50 GMT+02:00 Pavel Machek <pavel@ucw.cz>:
> >
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/therm/temp.c b/drivers=
/gpu/drm/nouveau/nvkm/subdev/therm/temp.c
> > index b9703c0..adb1deb 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/therm/temp.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/therm/temp.c
> > @@ -120,6 +120,11 @@ nvkm_therm_sensor_event(struct nvkm_therm *therm, =
enum nvkm_therm_thrs thrs,
> >                         struct work_struct *work;
> >
> >                         work =3D kmalloc(sizeof(*work), GFP_ATOMIC);
> > +                       /* FIXME:
> > +                          1) this is total overkill, orderly_poweroff(=
) already
> > +                          uses schedule_work internally
> > +                          2) it would  be good to at least printk what=
 is going on
> > +                       */
> >                         if (work) {
> >                                 INIT_WORK(work, nv_poweroff_work);
> >                                 schedule_work(work);
> >
> > GFP_ATOMIC is not reliable. Plus, see the fixme.
> >
> > Best regards,
> >                                                                        =
 Pavel
> >
> > --
> > (english) http://www.livejournal.com/~pavelmachek
> > (cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses=
/blog.html
> >
> > _______________________________________________
> > Nouveau mailing list
> > Nouveau@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/nouveau
> >

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--tsOsTdHNUZQcU9Ye
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlgPPjwACgkQMOfwapXb+vJc0ACbBl2+Fl2LAL/fcNOrOz5MSRKy
sH4AoIdisul4OtYZt+jrJ0mras1uhUwB
=4hgQ
-----END PGP SIGNATURE-----

--tsOsTdHNUZQcU9Ye--

--===============1035417428==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1035417428==--

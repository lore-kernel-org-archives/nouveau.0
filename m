From: Pavel Machek <pavel@ucw.cz>
Subject: noveau: emergency shutdown handling is overcomplex and broken
Date: Tue, 25 Oct 2016 12:50:50 +0200
Message-ID: <20161025105050.GA20923@amd>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="OXfL5xGRrasGEqWY"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: bskeggs@redhat.com, airlied@linux.ie, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org


--OXfL5xGRrasGEqWY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/therm/temp.c b/drivers/gpu=
/drm/nouveau/nvkm/subdev/therm/temp.c
index b9703c0..adb1deb 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/therm/temp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/therm/temp.c
@@ -120,6 +120,11 @@ nvkm_therm_sensor_event(struct nvkm_therm *therm, enum=
 nvkm_therm_thrs thrs,
 			struct work_struct *work;
=20
 			work =3D kmalloc(sizeof(*work), GFP_ATOMIC);
+			/* FIXME:
+			   1) this is total overkill, orderly_poweroff() already
+			   uses schedule_work internally
+			   2) it would  be good to at least printk what is going on
+			*/
 			if (work) {
 				INIT_WORK(work, nv_poweroff_work);
 				schedule_work(work);

GFP_ATOMIC is not reliable. Plus, see the fixme.

Best regards,
									Pavel
								=09
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--OXfL5xGRrasGEqWY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlgPOQoACgkQMOfwapXb+vLThwCgjLo7i3ed4+y7j9NLmS0X+iiP
pIkAn1ZQ8byD0QiNDZ/6Fiqk60PLI8Wp
=59WN
-----END PGP SIGNATURE-----

--OXfL5xGRrasGEqWY--

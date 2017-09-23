From: Pavel Machek <pavel@ucw.cz>
Subject: drivers/gpu/drm/nouveau/nvkm/subdev/therm/temp.c: broken emergency
 poweroff handling
Date: Sat, 23 Sep 2017 21:04:06 +0200
Message-ID: <20170923190406.GA21587@amd>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="huq684BweRXVnRxX"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: bskeggs@redhat.com, airlied@linux.ie, colin.king@canonical.com, martin.peres@free.fr, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org


--huq684BweRXVnRxX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

Not only it is unneccessarily complex, it is also broken; GFP_ATOMIC
allocation can fail.. and then you fail to shut down the machine.

Someone please fix this.

Thanks,
								Pavel

--- a/drivers/gpu/drm/nouveau/nvkm/subdev/therm/temp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/therm/temp.c
@@ -120,6 +120,11 @@ nvkm_therm_sensor_event(struct nvkm_therm *therm, enum=
 nvkm_therm_thrs thrs,
                        struct work_struct *work;

                        work =3D kmalloc(sizeof(*work), GFP_ATOMIC);
+                       /* FIXME:
+                          1) this is total overkill, orderly_poweroff() al=
ready
+                          uses schedule_work internally
+                          2) it would  be good to at least printk what is =
going on
+                       */
                        if (work) {
                                INIT_WORK(work, nv_poweroff_work);
                                schedule_work(work);


--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--huq684BweRXVnRxX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlnGsCYACgkQMOfwapXb+vJNcACgk7h8X3WoQQPlyMRVABEgQJz6
oXIAn01Qk9OojEvV+BUAqeMM7v52yjT8
=2gQa
-----END PGP SIGNATURE-----

--huq684BweRXVnRxX--

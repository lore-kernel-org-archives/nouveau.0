From: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v5 0/6] Suppor for various power sensors on
	GF100+
Date: Thu, 25 Feb 2016 08:22:49 +1000
Message-ID: <56CE2D39.3090509@redhat.com>
References: <1456344481-934-1-git-send-email-nouveau@karolherbst.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1417894135=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1456344481-934-1-git-send-email-nouveau-lIBOoy2+GI7scQ4cX5LuPg@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Karol Herbst <nouveau-lIBOoy2+GI7scQ4cX5LuPg@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1417894135==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="CAR79C5f1tA7qdri73tTCuUUKSQvuMiwS"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--CAR79C5f1tA7qdri73tTCuUUKSQvuMiwS
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 02/25/2016 06:07 AM, Karol Herbst wrote:
> This is a complete rework from the first version I sent out.
>=20
> Now the implementation is more centered around the power_rails we find =
in the
> SENSE table instead of extdev centered. This makes the implementation a=
 lot
> easier and straightforward.
>=20
> I've added support for the INA219, INA209 and INA3221 sensors found on =
multiple
> Fermi and Kepler cards.
>=20
> The power consumption is also exported via hwmon, so "sensors" will be =
able to
> print it in userspace.
>=20
> This work is based on Martins initial power sensor work and most of the=
 ground
> work was just copied from him.
Looks OK to me, but needs a rebase on top of my tree (will conflict with
secure boot patches I just merged) before merging.

Thanks,
Ben.

>=20
> Happy testing
>=20
> changes in v3: fixes ina2x9, rebase on current master
> changes in v4: some minor ina2x9 fixes and get it to work on maxwell ge=
n2
> changes in v5: final polishing
>=20
> Tested-by: Stefan H=C3=BChner <stefan-Xd65/bSt805AfugRpC6u6w@public.gmane.org> on gm206
>=20
> Karol Herbst (4):
>   iccsense: implement for ina209, ina219 and ina3221
>   hwmon: add power consumption
>   hwmon: don't require therm to be valid to get any data
>   bios/extdev: also parse v4.1 table
>=20
> Martin Peres (2):
>   subdev/iccsense: add new subdev for power sensors
>   nvbios/iccsense: add parsing of the SENSE table
>=20
>  drm/nouveau/include/nvif/device.h               |   1 +
>  drm/nouveau/include/nvkm/core/device.h          |  83 +++++----
>  drm/nouveau/include/nvkm/subdev/bios/extdev.h   |   3 +
>  drm/nouveau/include/nvkm/subdev/bios/iccsense.h |  16 ++
>  drm/nouveau/include/nvkm/subdev/i2c.h           |  31 ++++
>  drm/nouveau/include/nvkm/subdev/iccsense.h      |  17 ++
>  drm/nouveau/nouveau_hwmon.c                     |  75 ++++++--
>  drm/nouveau/nvkm/core/subdev.c                  |  83 ++++-----
>  drm/nouveau/nvkm/engine/device/base.c           | 144 ++++++++-------
>  drm/nouveau/nvkm/engine/device/priv.h           |   1 +
>  drm/nouveau/nvkm/subdev/Kbuild                  |   1 +
>  drm/nouveau/nvkm/subdev/bios/Kbuild             |   1 +
>  drm/nouveau/nvkm/subdev/bios/extdev.c           |   2 +-
>  drm/nouveau/nvkm/subdev/bios/iccsense.c         | 100 ++++++++++
>  drm/nouveau/nvkm/subdev/iccsense/Kbuild         |   2 +
>  drm/nouveau/nvkm/subdev/iccsense/base.c         | 232 ++++++++++++++++=
++++++++
>  drm/nouveau/nvkm/subdev/iccsense/gf100.c        |  31 ++++
>  drm/nouveau/nvkm/subdev/iccsense/priv.h         |  16 ++
>  18 files changed, 676 insertions(+), 163 deletions(-)
>  create mode 100644 drm/nouveau/include/nvkm/subdev/bios/iccsense.h
>  create mode 100644 drm/nouveau/include/nvkm/subdev/iccsense.h
>  create mode 100644 drm/nouveau/nvkm/subdev/bios/iccsense.c
>  create mode 100644 drm/nouveau/nvkm/subdev/iccsense/Kbuild
>  create mode 100644 drm/nouveau/nvkm/subdev/iccsense/base.c
>  create mode 100644 drm/nouveau/nvkm/subdev/iccsense/gf100.c
>  create mode 100644 drm/nouveau/nvkm/subdev/iccsense/priv.h
>=20


--CAR79C5f1tA7qdri73tTCuUUKSQvuMiwS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWzi05AAoJEHYLnGJQkpH7mR4P/AxdXonntge/X7qhNgqIq7YH
hXVPGQn3a9uCprOHTGEYYeSKPwH6+EGoD92tSBoghC4LEB4v5nnMhK/qrBneUPus
gAqNL9o3VY/MUds2i1h2aNGFk7331pu5kp9s5wokpnsN1QHIVVs8hAj9Ep4atazc
D43WAM+IwGNGsi5YgMdIP1CXoytM+KsCdepnQwxvJqXNQyOGN05lkFq1/mAfHs9t
NQeZbd2PvGme0MFH66TXhJaxKcXzN4rv7tGBYsoqT7YcjAW4K3Jpe/WmYa05JLPI
tj3tgWA6K0JvzKocLbXLeCkoz8oZ5Xc6oMXJ0WkOzial+RmrUmd6c8gHyEpHah7f
/dqCzLv1zUAMPIigWdA1tsd7CfWlSrgZQQIq3c3/JtjftIqAtGa4E+6DgnW6BPcB
sMUS6i6rY40YZUb336HDgOYN+LrLQmhdyafSAx4Ir6Cd4qkmsLZf4VCo4dKg9l1Q
eZKZ4VxTesklpGw9nzz2nSevkCsnNyAHM/5VDV3oO3czQgYB4P5eVm+MixGpAZ/R
WUa7CunudzkuYtD8lDk3Ko02rXzronmwEXRHbwcn5VQnfnF/EXwLSQBELYw3iT0+
1hlCA8obbLYXGXHYZliHspTjYQR5vUepu7vMYr5BWxtseMJ+hTBuGxjUTqPvoM3R
GBrsh1dllNF3m9v6DDfO
=t8fH
-----END PGP SIGNATURE-----

--CAR79C5f1tA7qdri73tTCuUUKSQvuMiwS--

--===============1417894135==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1417894135==--

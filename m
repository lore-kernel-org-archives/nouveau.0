From: Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org>
Subject: Re: drm/nouveau: Remove no longer needed local
 ACPI_VIDEO_NOTIFY_PROBE define
Date: Sat, 22 Jul 2017 13:54:15 +0200
Message-ID: <20170722115415.uthmdaqj3tdjmmn6@pmoreau.org>
References: <20170526073508.4044-1-hdegoede@redhat.com>
 <7412d557-9b08-3d46-568b-bc1940ad4e40@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0835557882=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <7412d557-9b08-3d46-568b-bc1940ad4e40-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0835557882==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tli54shuxi6qroga"
Content-Disposition: inline


--tli54shuxi6qroga
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org>

On 2017-06-21 =E2=80=94 15:19, Hans de Goede wrote:
> Hi,
>=20
> On 26-05-17 09:35, Hans De Goede wrote:
> > The local #define of ACPI_VIDEO_NOTIFY_PROBE was only added temporarily
> > to avoid a dependency between the acpi and nouveau trees while merging.
> >=20
> > This is now properly defined in acpi/video.h and the local #define can
> > be dropped.
> >=20
> > Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>=20
> ping, what is the status of this patch ?
>=20
> Regards,
>=20
> Hans
>=20
>=20
> > ---
> >   drivers/gpu/drm/nouveau/nouveau_display.c | 9 ---------
> >   1 file changed, 9 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/dr=
m/nouveau/nouveau_display.c
> > index 549763f5e17d..70de2079b2cc 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_display.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_display.c
> > @@ -369,15 +369,6 @@ nouveau_display_hpd_work(struct work_struct *work)
> >   #ifdef CONFIG_ACPI
> > -/*
> > - * Hans de Goede: This define belongs in acpi/video.h, I've submitted =
a patch
> > - * to the acpi subsys to move it there from drivers/acpi/acpi_video.c .
> > - * This should be dropped once that is merged.
> > - */
> > -#ifndef ACPI_VIDEO_NOTIFY_PROBE
> > -#define ACPI_VIDEO_NOTIFY_PROBE			0x81
> > -#endif
> > -
> >   static int
> >   nouveau_display_acpi_ntfy(struct notifier_block *nb, unsigned long va=
l,
> >   			  void *data)
> >=20
> _______________________________________________
> dri-devel mailing list
> dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

--tli54shuxi6qroga
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEYgBv5JnnDxeItcEHU3l4X80+KSQFAllzPOcACgkQU3l4X80+
KSSc9A//TKuSgUGlzt8gKq16DUarm/AitQy1tlrTucP1yjeMzmLvpfa5wbHDFQDp
PAiW2O6y+gMXrH9Vjlpw5UVE3xzA8iGP6INxSqO97uUlTn/Eg0+UfMQKqn6fvdOK
WGXRPbSTPnFff47G8Vzq+eT04j7itonv4N1/w9OLh3eHh5Pj1mfnWwGZPYdvy5nF
okW/mcuX7ji9suvCbrcvSXSdcv4izH0CUXzKa31NGE2VjUpW67GJRGwAAd81qYUg
itT91kp/1MrKiX5JxaHhwGNVaPHEqZuA/2/BUy3S3mTQPY9uKrQ8dZ2/TzHX1eOk
3kb469D/IRC02kT0qobDw1XHiG90BJ4bzlET8n4N7Ya2mskIUmpFx8A1s8brANEF
2y0+8Vj+EyNFYfqU6TQBw/ukD6c/WF5zFkJ7X9TtI5QMoWwydLcMnFk6b7Z6rsE3
28NXYXpxim/fvDfhgBCjPP7xajWeYOQ2kF995xXqdFfJYt1Zf88SzgpQlVuZSaG+
KNQ5NmC/TP2YrMLD4wZSPt21oMCSYfvsX3dF8j9AC2ZSmC8uHIojb1TyN8WUYDk8
2hOjSZK1q6UmwEln0ElC7uvxiEQr2Lg2Qst65WqRSWtDC6rLzhL2jw6A3PeID5uW
QTJxhfPMFNmM4y3ABLIJhenc3sZmrQW5EEnabzhG7sTLVQvVPLg=
=zBFI
-----END PGP SIGNATURE-----

--tli54shuxi6qroga--

--===============0835557882==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0835557882==--

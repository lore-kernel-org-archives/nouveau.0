From: Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org>
Subject: Re: drm/nouveau: Remove no longer needed local
 ACPI_VIDEO_NOTIFY_PROBE define
Date: Fri, 29 Dec 2017 22:53:09 +0100
Message-ID: <20171229215308.jgtuji5nn5ahk5nq@pmoreau.org>
References: <20170526073508.4044-1-hdegoede@redhat.com>
 <7412d557-9b08-3d46-568b-bc1940ad4e40@redhat.com>
 <20170722115415.uthmdaqj3tdjmmn6@pmoreau.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1521059423=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20170722115415.uthmdaqj3tdjmmn6-WLoDKDh+7sdAfugRpC6u6w@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1521059423==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zrqllgutffk5jerd"
Content-Disposition: inline


--zrqllgutffk5jerd
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Ping

On 2017-07-22 =E2=80=94 13:54, Pierre Moreau wrote:
> Reviewed-by: Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org>
>=20
> On 2017-06-21 =E2=80=94 15:19, Hans de Goede wrote:
> > Hi,
> >=20
> > On 26-05-17 09:35, Hans De Goede wrote:
> > > The local #define of ACPI_VIDEO_NOTIFY_PROBE was only added temporari=
ly
> > > to avoid a dependency between the acpi and nouveau trees while mergin=
g.
> > >=20
> > > This is now properly defined in acpi/video.h and the local #define can
> > > be dropped.
> > >=20
> > > Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> >=20
> > ping, what is the status of this patch ?
> >=20
> > Regards,
> >=20
> > Hans
> >=20
> >=20
> > > ---
> > >   drivers/gpu/drm/nouveau/nouveau_display.c | 9 ---------
> > >   1 file changed, 9 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/=
drm/nouveau/nouveau_display.c
> > > index 549763f5e17d..70de2079b2cc 100644
> > > --- a/drivers/gpu/drm/nouveau/nouveau_display.c
> > > +++ b/drivers/gpu/drm/nouveau/nouveau_display.c
> > > @@ -369,15 +369,6 @@ nouveau_display_hpd_work(struct work_struct *wor=
k)
> > >   #ifdef CONFIG_ACPI
> > > -/*
> > > - * Hans de Goede: This define belongs in acpi/video.h, I've submitte=
d a patch
> > > - * to the acpi subsys to move it there from drivers/acpi/acpi_video.=
c .
> > > - * This should be dropped once that is merged.
> > > - */
> > > -#ifndef ACPI_VIDEO_NOTIFY_PROBE
> > > -#define ACPI_VIDEO_NOTIFY_PROBE			0x81
> > > -#endif
> > > -
> > >   static int
> > >   nouveau_display_acpi_ntfy(struct notifier_block *nb, unsigned long =
val,
> > >   			  void *data)
> > >=20
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel



> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau


--zrqllgutffk5jerd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEYgBv5JnnDxeItcEHU3l4X80+KSQFAlpGuUQACgkQU3l4X80+
KSQ79w//dKOlTLopnJORZ5UdrMornvcSZozdAFRJKp0xv7MykKdvyJjxaOuX8Ogg
OYU0+J43/gp0uswxT07BP/Zg6BDLPBI8wMaJaY7pZFTQfKh9YdQlG23xyAFdQUak
1sgO0kEEs/5p03tZ3fEwWLxkOFqqcfmM6YAzGOt0dAlUo8S7D/CQNRWZ4IKxBdfa
F9sxeumoRbMZ6qxflxOx9hPVlCJF9IpU8h6HX6FhOe2qL6R1vWQpLUXTw8By8GCD
JHga8pTH/UOkwPsnbjDKIpBTyAXHzX3ZEOCUSEkqXgH9+6hVoiBCHNmAfN45d0ne
rTheLEZ/NumDyVsnUCLZX+H+1DIGnMK28C4qbLXAPBCIcaH7hdgdfhYSbKqbrCBy
a0IL5EIMXGmUTBHKb/mqZP+fYKsA/l4hhBgHyzaCXmZ4M3SfCohiS1lIORgjVnnI
7S+koqOZiKl6g+R/arU8Y6NBum9oUi3m9nh3K8Zx+txFLisC1Q/RSjT4GDPbVOsF
oJqcrw4ITNKs0fLPiAMPjh1HQsv9vmgNA1YokHWW1889oiXSdPhCB45+5D+FhN8B
UHD/z5DPffHKL3qJros7cnkibBIS/WlcEvSZGJDwLVvlVeXL7emPiDRA8dxxGN4b
x3s5o4m3bv2pBhmd0hOcMIjtTqFQX6ZlaX6NaZuZcmZfgfkIxeY=
=qCaW
-----END PGP SIGNATURE-----

--zrqllgutffk5jerd--

--===============1521059423==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1521059423==--

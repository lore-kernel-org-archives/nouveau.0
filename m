From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: Re: GeForce FX5200 dual DVI & Samsung 204b
Date: Tue, 05 Oct 2010 14:55:42 +0200
Message-ID: <87fwwkhk8h.fsf@riseup.net>
References: <4C9E0167.8000507@pfu.pl>
	<20100928004117.0a0ae0ca@daedalus.pq.iki.fi> <4CA1C6C0.1000709@pfu.pl>
	<20100928170227.00665f76@daedalus.pq.iki.fi> <4CA21515.4030903@pfu.pl>
	<20100929193136.644e0d68@daedalus.pq.iki.fi>
	<878w2jike0.fsf@riseup.net> <4CA4A934.4080109@pfu.pl>
	<87zkuzgqsv.fsf@riseup.net> <4CA4D199.8010403@pfu.pl>
	<87pqvuhksw.fsf@riseup.net> <4CA5B64D.8000608@pfu.pl>
	<871v88hgam.fsf@riseup.net> <4CAAFB3A.8010804@pfu.pl>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1220738840=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4CAAFB3A.8010804-t9zbU3WrWHI@public.gmane.org> ("Grzesiek =?utf-8?Q?S=C3=B3jka=22'?=
	=?utf-8?Q?s?= message of "Tue, 05 Oct 2010 12:17:30 +0200")
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Grzesiek =?utf-8?Q?S=C3=B3jka?= <pld-t9zbU3WrWHI@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============1220738840==
Content-Type: multipart/signed; boundary="==-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--==-=-=
Content-Type: multipart/mixed; boundary="=-=-="

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Grzesiek S=C3=B3jka <pld-t9zbU3WrWHI@public.gmane.org> writes:

> On 10/02/10 15:31, Francisco Jerez wrote:
>> Ah, I think you're hitting the bandwidth limitation of the nv34
>> integrated TMDS transmitter. The attached patch should help with the
>> console modesetting problem, but you'll still need to set the modelines
>> manually (and force panel rescaling) if you want to go up to 1600x1200,
>> because your GPU *cannot* handle the video mode your monitor is asking
>> for.
>
> Your patch works fine. Now I have clear image at both displays. Only
> disadvantage is that the resolution is 1280x1024 (PixClk 135MHz). So I
> was wondering if it is possible to force particular modeline (by
> editing the kernel source tree??). The mode:
>
> Modeline "1600x1200_def" 144  1600 1628 1788 1920  1200 1201 1204 1250
>
> works fine with the XServer. Is it possible to force it at the console??
>
You could try to force a reduced blanking mode in the kernel command
line like: "video=3DDVI-I-1:1600x1200RM". But it isn't going to work with
GPU rescaling, the attached patch (on top of the previous one) will make
the kernel detect that, and automatically fall back to panel rescaling.

> Thanks again!
>
> PS. I'm afraid that my system is not very stable when the AGP support
> is turned on both using the nouveau kernel source tree and the PLD
> patched 2.6.35-5 version with an extra amd-k7-agp patch. The Xserver
> uses the driver:
Unstable? How? What's the problem?

> [    38.842] (II) Module nouveau: vendor=3D"X.Org Foundation"
> [    38.842]    compiled for 1.9.0, module version =3D 0.0.16
> [    38.842]    Module class: X.Org Video Driver
> [    38.842]    ABI class: X.Org Video Driver, version 8.0


--=-=-=
Content-Type: text/x-diff
Content-Disposition: attachment; filename=nouveau_force_panel_scaling.patch
Content-Transfer-Encoding: quoted-printable

diff --git a/drivers/gpu/drm/nouveau/nv04_dfp.c b/drivers/gpu/drm/nouveau/n=
v04_dfp.c
index c936403..0d6ee18 100644
=2D-- a/drivers/gpu/drm/nouveau/nv04_dfp.c
+++ b/drivers/gpu/drm/nouveau/nv04_dfp.c
@@ -185,14 +185,19 @@ static bool nv04_dfp_mode_fixup(struct drm_encoder *e=
ncoder,
 	struct nouveau_encoder *nv_encoder =3D nouveau_encoder(encoder);
 	struct nouveau_connector *nv_connector =3D nouveau_encoder_connector_get(=
nv_encoder);
=20
=2D	/* For internal panels and gpu scaling on DVI we need the native mode */
=2D	if (nv_connector->scaling_mode !=3D DRM_MODE_SCALE_NONE) {
=2D		if (!nv_connector->native_mode)
=2D			return false;
+	if (!nv_connector->native_mode ||
+	    mode->hdisplay > nv_connector->native_mode->hdisplay ||
+	    mode->vdisplay > nv_connector->native_mode->vdisplay) {
+		NV_DEBUG_KMS(encoder->dev, "Mode larger than native mode, "
+			     "forcing panel rescaling.\n");
+		nv_encoder->mode =3D *adjusted_mode;
+
+	} else if (nv_connector->scaling_mode =3D=3D DRM_MODE_SCALE_NONE) {
+		nv_encoder->mode =3D *adjusted_mode;
+
+	} else {
 		nv_encoder->mode =3D *nv_connector->native_mode;
 		adjusted_mode->clock =3D nv_connector->native_mode->clock;
=2D	} else {
=2D		nv_encoder->mode =3D *adjusted_mode;
 	}
=20
 	return true;

--=-=-=--

--==-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iF4EAREIAAYFAkyrIE8ACgkQg5k4nX1Sv1sAeQEAg5PCWxFyesWa0KsZ7pwiUGiR
MHePAkGTap8DPbUrQuMBAIFvM5Iayx5dfl4MN5krqSo9P8GoTavrzAHLMQdFB2KN
=pFP5
-----END PGP SIGNATURE-----
--==-=-=--

--===============1220738840==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1220738840==--

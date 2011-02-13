From: GatoLoko <gatoloko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Bug 33967] No image on a VGA screen attached to DVI
 with a dvi to vga adaptor on NVa3 card..
Date: Sun, 13 Feb 2011 04:11:18 +0100
Message-ID: <4D574BD6.603@gmail.com>
References: <bug-33967-8800@http.bugs.freedesktop.org/>
	<20110207203446.94A0D13004E@annarchy.freedesktop.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0948363968=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20110207203446.94A0D13004E-4GnqB8vgsbnwRzGw0Gvu8Q/tdpCO6/zZ@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--===============0948363968==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------enigE957E49CF1C74BA5F42E0909"

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enigE957E49CF1C74BA5F42E0909
Content-Type: multipart/mixed;
 boundary="------------020409050300060305080603"

This is a multi-part message in MIME format.
--------------020409050300060305080603
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

I got bored, and started messing with the code. Found a
apply_dcb_connector_quirks function on nouveau_bios.c, made by Ben
Skeggs to fix a similar problem I had with a different card, and seems
pretty easy to extend it for this new card. But my C skills are very
rusty and it feels "too easy" to be true, so now it scares me to build
and run my own patch.

Can somebody have a look at it and hit me in the head if I'm doing it wro=
ng?


--=20
GatoLoko



--------------020409050300060305080603
Content-Type: text/x-patch;
 name="nouveau_gt-240x-ya_dcb_quirk.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="nouveau_gt-240x-ya_dcb_quirk.patch"

diff --git a/drivers/gpu/drm/nouveau/nouveau_bios.c b/drivers/gpu/drm/nou=
veau/nouveau_bios.c
index 7b7a184..d37ddc9 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bios.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bios.c
@@ -5948,6 +5948,13 @@ apply_dcb_connector_quirks(struct nvbios *bios, in=
t idx)
 		if (cte->type =3D=3D DCB_CONNECTOR_HDMI_1)
 			cte->type =3D DCB_CONNECTOR_DVI_I;
 	}
+	/* XFX GT-240X-YA */
+	if (nv_match_device(dev, 0x0ca3, 0x1682, 0x3003)) {
+		if (cte->type =3D=3D DCB_CONNECTOR_DVI_I_1)
+			cte->type =3D DCB_CONNECTOR_VGA;
+		if (cte->type =3D=3D DCB_CONNECTOR_VGA_1)
+			cte->type =3D DCB_CONNECTOR_DVI_I;
+	}
 }
=20
 static void

--------------020409050300060305080603--

--------------enigE957E49CF1C74BA5F42E0909
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iF4EAREIAAYFAk1XS94ACgkQMF2GslzCSEvtYAEAxRQsuFIv+eDNVZtillZJMo1T
WiJySJzPmP0HictjAg0A+wUXYzjFlZKHjzXKst8egx4pNSFjkD1PsY9c4IeX5tkw
=nrRs
-----END PGP SIGNATURE-----

--------------enigE957E49CF1C74BA5F42E0909--

--===============0948363968==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0948363968==--

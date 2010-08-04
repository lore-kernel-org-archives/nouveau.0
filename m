From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: Re: [nouveau-drm] failed to set mode on crtc
Date: Wed, 04 Aug 2010 21:04:46 +0200
Message-ID: <877hk6i4hd.fsf@riseup.net>
References: <4C574463.3080201@interia.pl>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0220523755=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4C574463.3080201-khu2bkKidpXVItvQsEIGlw@public.gmane.org> (yaiba kurogane's message of "Tue,
	03 Aug 2010 00:19:15 +0200")
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: yaiba.kurogane-khu2bkKidpXVItvQsEIGlw@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============0220523755==
Content-Type: multipart/signed; boundary="==-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--==-=-=
Content-Type: multipart/mixed; boundary="=-=-="

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

yaiba.kurogane-khu2bkKidpXVItvQsEIGlw@public.gmane.org writes:

>  Hi. I have a problem with current kernel 2.6.35 and nouveau module
> compiled from git (today).From xorg.0.log I got information that no
> output was found.And here is some nasty kernel logs:
>
> [...]
> What is going on?
>
Your BIOS lacks some information we need for modesetting. The attached
patch should fix it, can you give it a try?


--=-=-=
Content-Type: text/x-diff
Content-Disposition: attachment; filename=nouveau_nodcb_init_or.patch
Content-Transfer-Encoding: quoted-printable

diff --git a/drivers/gpu/drm/nouveau/nouveau_bios.c b/drivers/gpu/drm/nouve=
au/nouveau_bios.c
index 23a7bec..fc35e9d 100644
=2D-- a/drivers/gpu/drm/nouveau/nouveau_bios.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bios.c
@@ -5855,7 +5855,7 @@ static void fabricate_vga_output(struct dcb_table *dc=
b, int i2c, int heads)
 	entry->i2c_index =3D i2c;
 	entry->heads =3D heads;
 	entry->location =3D DCB_LOC_ON_CHIP;
=2D	/* "or" mostly unused in early gen crt modesetting, 0 is fine */
+	entry->or =3D 1;
 }
=20
 static void fabricate_dvi_i_output(struct dcb_table *dcb, bool twoHeads)

--=-=-=--

--==-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iF4EAREIAAYFAkxZuc4ACgkQg5k4nX1Sv1uLPAEAhVKIH6EGoUKiDcpAUKWCR5zj
GS4XlK1/mhj/roQ1Cy8BAJ8vHx4gMhHYWgieaIFg+TmWgZuPYcB3U0rve6gRmvn0
=4Fsc
-----END PGP SIGNATURE-----
--==-=-=--

--===============0220523755==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0220523755==--

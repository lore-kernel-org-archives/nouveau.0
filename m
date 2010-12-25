From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH] nv04_exa: kill useless WAIT_RING
Date: Sat, 25 Dec 2010 14:58:57 +0100
Message-ID: <87k4iyymvy.fsf@riseup.net>
References: <1292797054-12001-1-git-send-email-chantry.xavier@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1591119983=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1292797054-12001-1-git-send-email-chantry.xavier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
	(Xavier Chantry's message of "Sun, 19 Dec 2010 23:17:34 +0100")
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Xavier Chantry <chantry.xavier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============1591119983==
Content-Type: multipart/signed; boundary="==-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--==-=-=
Content-Type: multipart/mixed; boundary="=-=-="

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Xavier Chantry <chantry.xavier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:

> ---
>  src/nv04_exa.c |    2 --
>  1 files changed, 0 insertions(+), 2 deletions(-)
>
> diff --git a/src/nv04_exa.c b/src/nv04_exa.c
> index 2760d4b..bc20ca3 100644
> --- a/src/nv04_exa.c
> +++ b/src/nv04_exa.c
> @@ -148,7 +148,6 @@ NV04EXASolid (PixmapPtr pPixmap, int x1, int y1, int =
x2, int y2)
>  	int width =3D x2-x1;
>  	int height =3D y2-y1;
>=20=20
> -	WAIT_RING (chan, 3);
>  	BEGIN_RING(chan, rect,
>  		   NV04_GDI_RECTANGLE_TEXT_UNCLIPPED_RECTANGLE_POINT(0), 2);
>  	OUT_RING  (chan, (x1 << 16) | y1);
> @@ -278,7 +277,6 @@ NV04EXACopy(PixmapPtr pDstPixmap, int srcX, int srcY,=
 int dstX, int dstY,
>  		dstY =3D 0;
>  	}
>=20=20
> -	WAIT_RING (chan, 4);
>  	BEGIN_RING(chan, blit, NV01_IMAGE_BLIT_POINT_IN, 3);
>  	OUT_RING  (chan, (srcY << 16) | srcX);
>  	OUT_RING  (chan, (dstY << 16) | dstX);

Thanks, pushed.

--=-=-=--

--==-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iF4EAREIAAYFAk0V+KIACgkQg5k4nX1Sv1sa5wEAhpeQMcGZ9prx6rAzmRP/0fAS
9I2Xt1mhLmNhuPP5h+kA/1UFf8raSjHXkDiP6W+OqDoaAaxSvK7mZjXM3yVJJ0Q6
=wJJW
-----END PGP SIGNATURE-----
--==-=-=--

--===============1591119983==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1591119983==--

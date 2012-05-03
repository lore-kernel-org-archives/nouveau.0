From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH] nouveau/dri2: don't try to page flip pixmaps
Date: Thu, 03 May 2012 15:15:51 +0200
Message-ID: <87397hv20o.fsf@riseup.net>
References: <20120503125016.GA8466@joi.lan>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1982436671=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20120503125016.GA8466-OI9uyE9O0yo@public.gmane.org> (Marcin Slusarz's message of
	"Thu, 3 May 2012 14:50:16 +0200")
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Michel =?utf-8?Q?D=C3=A4nzer?= <michel-otUistvHUpPR7s880joybQ@public.gmane.org>
List-Id: nouveau.vger.kernel.org

--===============1982436671==
Content-Type: multipart/signed; boundary="==-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--==-=-=
Content-Type: multipart/mixed; boundary="=-=-="

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:

> Port of commit ae45d7e6d8e6844cd4586c9ee97c21b257fa788f in xf86-video-ati.
>
> Fixes https://bugs.freedesktop.org/show_bug.cgi?id=3D49351
>
> (Additionally, don't try to pageflip if user disabled it in xorg.conf.
> Currently this change is a no-op, because can_exchange returns true only =
when
> page flipping is enabled, but commit 169512fbe91f0671a90dfee5e280357f0a4e=
f701 -
> which changed can_exchange behavior - is due to be reverted)
> ---
>  src/nouveau_dri2.c |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)
>
> diff --git a/src/nouveau_dri2.c b/src/nouveau_dri2.c
> index 588735f..3d8d22f 100644
> --- a/src/nouveau_dri2.c
> +++ b/src/nouveau_dri2.c
> @@ -328,7 +328,8 @@ nouveau_dri2_finish_swap(DrawablePtr draw, unsigned i=
nt frame,
>  		type =3D DRI2_EXCHANGE_COMPLETE;
>  		DamageRegionAppend(draw, &reg);
>=20=20
> -		if (DRI2CanFlip(draw)) {
> +		if (DRI2CanFlip(draw) && pNv->has_pageflip &&
> +				draw->type =3D=3D DRAWABLE_WINDOW) {

Hey,

How about 'if (nouveau_exa_pixmap_is_onscreen(dst_pix)) {...'?  We
should really never get to that point unless we know for sure that we
can either flip or exchange, so the 'has_pageflip' check is redundant.

>  			type =3D DRI2_FLIP_COMPLETE;
>  			ret =3D drmmode_page_flip(draw, src_pix,
>  						violate_oml(draw) ? NULL : s,

--=-=-=--

--==-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iF4EAREIAAYFAk+ihQsACgkQg5k4nX1Sv1tf3QD7BjN/ZjRH7yB1N+Px5ioYZWNK
ueObpY4/H2R0pMa+rwMBAJJBbV4CWZQVnsXwQFhSfk5sH7YkzuTYUvMueuFZd06/
=Cu4f
-----END PGP SIGNATURE-----
--==-=-=--

--===============1982436671==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1982436671==--

From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau/kms: Implement KDB debug hooks
	for nouveau KMS.
Date: Thu, 26 Aug 2010 18:55:41 +0200
Message-ID: <87aao99uuq.fsf@riseup.net>
References: <m3iq9yqd7w.fsf@pullcord.laptop.org>
	<4C5ACF3F.8050409@windriver.com>
	<m3hbj0fju3.fsf_-_@pullcord.laptop.org>
	<m3aaoimqrp.fsf_-_@pullcord.laptop.org> <87eidsemcf.fsf@riseup.net>
	<m3k4nhqcia.fsf_-_@pullcord.laptop.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1329603229=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <m3k4nhqcia.fsf_-_-0VGQAjvlmrQzNDMTQreKSUB+6BGkLq7r@public.gmane.org> (Chris Ball's message of
	"Mon, 23 Aug 2010 16:50:53 -0400")
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Chris Ball <cjb-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, kgdb-bugreport-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Jesse Barnes <jbarnes-Y1mF5jBUw70BENJcbMCuUQ@public.gmane.org>, Jason Wessel <jason.wessel-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>
List-Id: nouveau.vger.kernel.org

--===============1329603229==
Content-Type: multipart/signed; boundary="==-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--==-=-=
Content-Type: multipart/mixed; boundary="=-=-="

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Chris Ball <cjb-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org> writes:

> Hi Francisco,
>
>    > There is a problem with this on pre-nv20 cards. Fbcon
>    > acceleration won't work properly with IRQs disabled because you
>    > miss the context switching interrupts: You'll get a locked up
>    > fbcon if you hit sysrq-g when there's some process using the GPU.
>    >=20
>    > I'd suggest disabling acceleration while in debug mode
>    > (e.g. using nouveau_fbcon_save_disable_accel()). That aside the
>    > patch looks good to me.
>
> Thanks very much for this.  Here's a (only compile-tested) patch for
> this, on top of jwessel's current kgdb-next branch.  Jason, would you
> mind testing on pre-nv20 and applying?
>
Thanks, it looks OK to me, and I just tested it successfully on
nv11. You can have my "Acked-by" on both nouveau patches if you need it.

> Thanks,
>
> - Chris.
>
>
> From: Chris Ball <cjb-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org>
> Subject: [PATCH] drm/nouveau/kms: Avoid a hang entering KDB with VT accel=
 on.
>
> Francisco Jerez advises that pre-nv20 cards would hang if we entered
> kdb with accel on and IRQs disabled, so we now disable accel before
> entering kdb and re-enable it on the way back out.
>
> Signed-off-by: Chris Ball <cjb-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org>
> Cc: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
> Cc: Jason Wessel <jason.wessel-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>
> ---
>  drivers/gpu/drm/nouveau/nv04_crtc.c |    9 +++++++++
>  1 files changed, 9 insertions(+), 0 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nv04_crtc.c b/drivers/gpu/drm/nouvea=
u/nv04_crtc.c
> index fb669dd..427f90e 100644
> --- a/drivers/gpu/drm/nouveau/nv04_crtc.c
> +++ b/drivers/gpu/drm/nouveau/nv04_crtc.c
> @@ -31,10 +31,11 @@
>  #include "nouveau_connector.h"
>  #include "nouveau_crtc.h"
>  #include "nouveau_fb.h"
>  #include "nouveau_hw.h"
>  #include "nvreg.h"
> +#include "nouveau_fbcon.h"
>=20=20
>  static int
>  nv04_crtc_mode_set_base(struct drm_crtc *crtc, int x, int y,
>  			struct drm_framebuffer *old_fb);
>=20=20
> @@ -858,10 +859,18 @@ nv04_crtc_mode_set_base(struct drm_crtc *crtc, int =
x, int y,
>  static int
>  nv04_crtc_mode_set_base_atomic(struct drm_crtc *crtc,
>  			       struct drm_framebuffer *fb,
>  			       int x, int y, int enter)
>  {
> +	struct drm_nouveau_private *dev_priv =3D crtc->dev->dev_private;
> +	struct drm_device *dev =3D dev_priv->dev;
> +
> +	if (enter)
> +		nouveau_fbcon_save_disable_accel(dev);
> +	else
> +		nouveau_fbcon_restore_accel(dev);
> +
>  	return nv04_crtc_do_mode_set_base(crtc, fb, x, y, true);
>  }
>=20=20
>  static void nv04_cursor_upload(struct drm_device *dev, struct nouveau_bo=
 *src,
>  			       struct nouveau_bo *dst)

--=-=-=--

--==-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iF4EAREIAAYFAkx2nI0ACgkQg5k4nX1Sv1sybwD/XIUnljGzsza6wNKi98oEdTf/
GP/FO7T5qMNYUbPGjG8BAIHSXg6p5oZ+bZ/A+gWPGsLbkyScq52+S9Vn9dwHUmHi
=EFhV
-----END PGP SIGNATURE-----
--==-=-=--

--===============1329603229==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1329603229==--

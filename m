From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau: fix nv40 gart size
Date: Mon, 18 Oct 2010 15:47:48 +0200
Message-ID: <87sk03d33v.fsf@riseup.net>
References: <1287321287.2215.13.camel@workstation>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0950595866=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1287321287.2215.13.camel@workstation> (Lucas Stach's message of
	"Sun, 17 Oct 2010 15:14:47 +0200")
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Cc: Nouveau Dev List <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

--===============0950595866==
Content-Type: multipart/signed; boundary="==-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--==-=-=
Content-Type: multipart/mixed; boundary="=-=-="

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org> writes:

> Nouveau sets GART size to 64MiB for all cards before nv50, but nv40 has
> enough RAMIN space to support 512MiB GART size. This patch fixes this
> value to make use of this hardware capability.
>
> Signed-off-by: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
> ---
The patch doesn't seem to apply, I guess it's been corrupted on the way.
Can you please resend?

> drivers/gpu/drm/nouveau/nouveau_sgdma.c |    6 +++++-
> 1 files changed, 5 insertions(+), 1 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_sgdma.c
> b/drivers/gpu/drm/nouveau/nouveau_sgdma.c
> index 7f028fe..388b3e1 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_sgdma.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_sgdma.c
> @@ -224,7 +224,11 @@ nouveau_sgdma_init(struct drm_device *dev)
> int i, ret;
>
> if (dev_priv->card_type < NV_50) {
> - aper_size = (64 * 1024 * 1024);
> + if(dev_priv->card_type < NV_40) {
> + aper_size = (64 * 1024 * 1024);
> + } else {
> + aper_size = (512 * 1024 * 1024);
> + }
> obj_size  = (aper_size >> NV_CTXDMA_PAGE_SHIFT) * 4;
> obj_size += 8; /* ctxdma header */
> } else {

--=-=-=--

--==-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iF4EAREIAAYFAky8UAUACgkQg5k4nX1Sv1s+EwD7BVhkXSh6nz60I1nFdlUoLtvu
2pOyvl2UXQLE9Tp9eD4A/AgLyegSswV28BhKrMTC5qodELAglUFTglvZXWb5VbS8
=0hkI
-----END PGP SIGNATURE-----
--==-=-=--

--===============0950595866==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0950595866==--

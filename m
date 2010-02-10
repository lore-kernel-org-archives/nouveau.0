From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH] Remove some UMS leftovers.
Date: Wed, 10 Feb 2010 19:32:52 +0100
Message-ID: <871vgt7xgr.fsf@riseup.net>
References: <1265748677-31650-1-git-send-email-koriakin@0x04.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0018764418=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1265748677-31650-1-git-send-email-koriakin-mP9o5jsk0RY@public.gmane.org> ("Marcin
	=?utf-8?Q?Ko=C5=9Bcielnicki=22's?= message of "Tue, 9 Feb 2010 20:51:17
	+0000")
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Mime-version: 1.0
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Marcin =?utf-8?Q?Ko=C5=9Bcielnicki?= <koriakin-mP9o5jsk0RY@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============0018764418==
Content-Type: multipart/signed; boundary="==-=-=";
	micalg=pgp-sha1; protocol="application/pgp-signature"

--==-=-=
Content-Type: multipart/mixed; boundary="=-=-="

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Marcin Ko=C5=9Bcielnicki <koriakin-mP9o5jsk0RY@public.gmane.org> writes:

> ---
>  src/nv_driver.c |   32 +-------------------------------
>  1 files changed, 1 insertions(+), 31 deletions(-)
>
> diff --git a/src/nv_driver.c b/src/nv_driver.c
> index 248a151..9606d97 100644
> --- a/src/nv_driver.c
> +++ b/src/nv_driver.c
> @@ -315,8 +315,6 @@ NVAdjustFrame(int scrnIndex, int x, int y, int flags)
>  /*
>   * This is called when VT switching back to the X server.  Its job is
>   * to reinitialise the video mode.
> - *
> - * We may wish to unmap video/MMIO memory too.
>   */
>=20=20
>  /* Mandatory */
> @@ -333,9 +331,6 @@ NVEnterVT(int scrnIndex, int flags)
>  	if (ret)
>  		ErrorF("Unable to get master: %d\n", ret);
>=20=20
> -	if (!pNv->NoAccel)
> -		NVAccelCommonInit(pScrn);
> -
>  	pNv->allow_dpms =3D FALSE;
>  	if (!xf86SetDesiredModes(pScrn))
>  		return FALSE;
> @@ -350,8 +345,6 @@ NVEnterVT(int scrnIndex, int flags)
>  /*
>   * This is called when VT switching away from the X server.  Its job is
>   * to restore the previous (text) mode.
> - *
> - * We may wish to remap video/MMIO memory too.
>   */
>=20=20
>  /* Mandatory */
> @@ -586,24 +579,6 @@ NVPreInit(ScrnInfoPtr pScrn, int flags)
>  	MessageType from;
>  	int ret, i;
>=20=20
> -	if (flags & PROBE_DETECT) {
> -		EntityInfoPtr pEnt =3D xf86GetEntityInfo(pScrn->entityList[0]);
> -
> -		if (!pEnt)
> -			return FALSE;
> -
> -		i =3D pEnt->index;
> -		xfree(pEnt);
> -
> -		if (xf86LoadSubModule(pScrn, "vbe")) {
> -			vbeInfoPtr pVbe =3D VBEInit(NULL, i);
> -			ConfiguredMonitor =3D vbeDoEDID(pVbe, NULL);
> -			vbeFree(pVbe);
> -		}
> -
> -		return TRUE;
> -	}
> -
>  	/*
>  	 * Note: This function is only called once at server startup, and
>  	 * not at the start of each server generation.  This means that
> @@ -733,11 +708,6 @@ NVPreInit(ScrnInfoPtr pScrn, int flags)
>  			      xf86GetVisualName(pScrn->defaultVisual), pScrn->depth);
>  	}
>=20=20
> -	/* The vgahw module should be loaded here when needed */
> -	if (!xf86LoadSubModule(pScrn, "vgahw")) {
> -		NVPreInitFail("\n");
> -	}
> -
>  	/* We use a programmable clock */
>  	pScrn->progClock =3D TRUE;
>=20=20
> @@ -905,7 +875,7 @@ NVMapMem(ScrnInfoPtr pScrn)
>  }
>=20=20
>  /*
> - * Unmap the framebuffer and MMIO memory.
> + * Unmap the framebuffer and offscreen memory.
>   */
>=20=20
>  static Bool

Thanks, pushed with some minor changes.

--=-=-=--

--==-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkty+9UACgkQ196Zy2qEI5ckQACeIrO3WFCf0htA1lMCvU6hokEq
F08Anjhg2mlpYeiOgD53BCqBRCGsFkup
=WLat
-----END PGP SIGNATURE-----
--==-=-=--

--===============0018764418==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0018764418==--

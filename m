From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH] Reflow logic to make it easier to follow
Date: Fri, 30 Jul 2010 12:52:17 +0200
Message-ID: <87zkx9dyxq.fsf@riseup.net>
References: <1280441163-18695-1-git-send-email-tom@dbservice.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0268320225=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1280441163-18695-1-git-send-email-tom-ix/z9KG6G0Jl57MIdRCFDg@public.gmane.org> (Tomas
	Carnecky's message of "Fri, 30 Jul 2010 00:06:03 +0200")
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Tomas Carnecky <tom-ix/z9KG6G0Jl57MIdRCFDg@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============0268320225==
Content-Type: multipart/signed; boundary="==-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--==-=-=
Content-Type: multipart/mixed; boundary="=-=-="

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Tomas Carnecky <tom-ix/z9KG6G0Jl57MIdRCFDg@public.gmane.org> writes:

> The control flow was:
>
> if (!y) {
>   ppix =3D ...
> }
>
> if (y) {
>   ...
> } else if (x) {
>   use ppix for something
> } else {
>   use ppix for something
> }
>
> Merge the if(!y) block with the two else branches. This avoids
> a false-positive in the clang static analyzer, it can't know that
> !y and x are mutually exclusive.
>
> The result looks something like this:
>
> if (y) {
>   ...
> } else {
>   ppix =3D ...
>   if (x) {
>     use ppix for something
>   } else {
>     use ppix for something
>   }
> }

This patch makes the code go above the 80-column limit, that's probably
the reason it was structured that way.

>
> Signed-off-by: Tomas Carnecky <tom-ix/z9KG6G0Jl57MIdRCFDg@public.gmane.org>
> ---
>
> This patch actually compiles. There are still a couple clang warnings, but
> those are dead assignments and one dead initialization. If there is inter=
est
> I can send patches for those as well. The clang results can be viewed at
> http://stuff.caurea.org/clang-static-analyzer/nouveau
>
Sure, patches are welcome. I wouldn't bother with the warnings found in
the overlay code though, those functions are currently unused and
they'll eventually be moved to the kernel.

>  src/nouveau_xv.c |  114 ++++++++++++++++++++++++++----------------------=
------
>  1 files changed, 55 insertions(+), 59 deletions(-)
>
> diff --git a/src/nouveau_xv.c b/src/nouveau_xv.c
> index 4437aa6..eb43207 100644
> --- a/src/nouveau_xv.c
> +++ b/src/nouveau_xv.c
> @@ -920,7 +920,6 @@ NVPutImage(ScrnInfoPtr pScrn, short src_x, short src_=
y, short drw_x,
>  {
>  	NVPortPrivPtr pPriv =3D (NVPortPrivPtr)data;
>  	NVPtr pNv =3D NVPTR(pScrn);
> -	PixmapPtr ppix;
>  	/* source box */
>  	INT32 xa =3D 0, xb =3D 0, ya =3D 0, yb =3D 0;
>  	/* size to allocate in VRAM and in GART respectively */
> @@ -1249,11 +1248,29 @@ CPU_copy:
>  	if (pPriv->currentHostBuffer !=3D NO_PRIV_HOST_BUFFER_AVAILABLE)
>  		pPriv->currentHostBuffer ^=3D 1;
>=20=20
> -	/* If we're not using the hw overlay, we're rendering into a pixmap
> -	 * and need to take a couple of additional steps...
> -	 */
> -	if (!(action_flags & USE_OVERLAY)) {
> -		ppix =3D NVGetDrawablePixmap(pDraw);
> +	if (action_flags & USE_OVERLAY) {
> +		if (pNv->Architecture =3D=3D NV_ARCH_04) {
> +			NV04PutOverlayImage(pScrn, pPriv->video_mem, offset,
> +					    id, dstPitch, &dstBox, 0, 0,
> +					    xb, yb, npixels, nlines,
> +					    src_w, src_h, drw_w, drw_h,
> +					    clipBoxes);
> +		} else {
> +			NV10PutOverlayImage(pScrn, pPriv->video_mem, offset,
> +					    uv_offset, id, dstPitch, &dstBox,
> +					    0, 0, xb, yb,
> +					    npixels, nlines, src_w, src_h,
> +					    drw_w, drw_h, clipBoxes);
> +		}
> +
> +		pPriv->currentBuffer ^=3D 1;
> +	} else {
> +		int ret =3D BadImplementation;
> +
> +		/* If we're not using the hw overlay, we're rendering into a pixmap
> +		 * and need to take a couple of additional steps...
> +		 */
> +		PixmapPtr ppix =3D NVGetDrawablePixmap(pDraw);
>=20=20
>  		/* Ensure pixmap is in offscreen memory */
>  		pNv->exa_force_cp =3D TRUE;
> @@ -1274,69 +1291,48 @@ CPU_copy:
>  			dstBox.y2 -=3D ppix->screen_y;
>  		}
>  #endif
> -	}
> -
> -	if (action_flags & USE_OVERLAY) {
> -		if (pNv->Architecture =3D=3D NV_ARCH_04) {
> -			NV04PutOverlayImage(pScrn, pPriv->video_mem, offset,
> -					    id, dstPitch, &dstBox, 0, 0,
> -					    xb, yb, npixels, nlines,
> -					    src_w, src_h, drw_w, drw_h,
> -					    clipBoxes);
> -		} else {
> -			NV10PutOverlayImage(pScrn, pPriv->video_mem, offset,
> -					    uv_offset, id, dstPitch, &dstBox,
> -					    0, 0, xb, yb,
> -					    npixels, nlines, src_w, src_h,
> -					    drw_w, drw_h, clipBoxes);
> -		}
>=20=20
> -		pPriv->currentBuffer ^=3D 1;
> -	} else=20
> -	if (action_flags & USE_TEXTURE) {
> -		int ret =3D BadImplementation;
>=20=20
> -		if (pNv->Architecture =3D=3D NV_ARCH_30) {
> -			ret =3D NV30PutTextureImage(pScrn, pPriv->video_mem,
> -						  offset, uv_offset,
> -						  id, dstPitch, &dstBox, 0, 0,
> -						  xb, yb, npixels, nlines,
> -						  src_w, src_h, drw_w, drw_h,
> -						  clipBoxes, ppix, pPriv);
> -		} else
> -		if (pNv->Architecture =3D=3D NV_ARCH_40) {
> -			ret =3D NV40PutTextureImage(pScrn, pPriv->video_mem,=20
> -						  offset, uv_offset,
> -						  id, dstPitch, &dstBox, 0, 0,
> -						  xb, yb, npixels, nlines,
> -						  src_w, src_h, drw_w, drw_h,
> -						  clipBoxes, ppix, pPriv);
> -		} else
> -		if (pNv->Architecture =3D=3D NV_ARCH_50) {
> -			ret =3D nv50_xv_image_put(pScrn, pPriv->video_mem,
> -						offset, uv_offset,
> -						id, dstPitch, &dstBox, 0, 0,
> -						xb, yb, npixels, nlines,
> -						src_w, src_h, drw_w, drw_h,
> -						clipBoxes, ppix, pPriv);
> +		if (action_flags & USE_TEXTURE) {
> +			if (pNv->Architecture =3D=3D NV_ARCH_30) {
> +				ret =3D NV30PutTextureImage(pScrn, pPriv->video_mem,
> +							  offset, uv_offset,
> +							  id, dstPitch, &dstBox, 0, 0,
> +							  xb, yb, npixels, nlines,
> +							  src_w, src_h, drw_w, drw_h,
> +							  clipBoxes, ppix, pPriv);
> +			} else
> +			if (pNv->Architecture =3D=3D NV_ARCH_40) {
> +				ret =3D NV40PutTextureImage(pScrn, pPriv->video_mem,=20
> +							  offset, uv_offset,
> +							  id, dstPitch, &dstBox, 0, 0,
> +							  xb, yb, npixels, nlines,
> +							  src_w, src_h, drw_w, drw_h,
> +							  clipBoxes, ppix, pPriv);
> +			} else
> +			if (pNv->Architecture =3D=3D NV_ARCH_50) {
> +				ret =3D nv50_xv_image_put(pScrn, pPriv->video_mem,
> +							offset, uv_offset,
> +							id, dstPitch, &dstBox, 0, 0,
> +							xb, yb, npixels, nlines,
> +							src_w, src_h, drw_w, drw_h,
> +							clipBoxes, ppix, pPriv);
> +			}
> +		} else {
> +			ret =3D NVPutBlitImage(pScrn, pPriv->video_mem, offset, id,
> +					     dstPitch, &dstBox, 0, 0, xb, yb, npixels,
> +					     nlines, src_w, src_h, drw_w, drw_h,
> +					     clipBoxes, ppix);
>  		}
>=20=20
>  		if (ret !=3D Success)
>  			return ret;
> -	} else {
> -		ret =3D NVPutBlitImage(pScrn, pPriv->video_mem, offset, id,
> -				     dstPitch, &dstBox, 0, 0, xb, yb, npixels,
> -				     nlines, src_w, src_h, drw_w, drw_h,
> -				     clipBoxes, ppix);
> -		if (ret !=3D Success)
> -			return ret;
> -	}
>=20=20
>  #ifdef COMPOSITE
> -	/* Damage tracking */
> -	if (!(action_flags & USE_OVERLAY))
> +		/* Damage tracking */
>  		DamageDamageRegion(&ppix->drawable, clipBoxes);
>  #endif
> +	}
>=20=20
>  	return Success;
>  }

--=-=-=--

--==-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iF4EAREIAAYFAkxSruIACgkQg5k4nX1Sv1s5bQEAjY3Tw/YLHTZ/oMDlxqhOV8rH
Cmf05/faYYoGvZAvPjcA/2d4HneIhOn/dSIdWZRb/ytJ13QL75KI4fgN9bXlKD7m
=aAAa
-----END PGP SIGNATURE-----
--==-=-=--

--===============0268320225==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0268320225==--

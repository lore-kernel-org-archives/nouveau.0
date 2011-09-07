From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH 3/3] dri2: Fixes to swap scheduling,
	especially for copy-swaps.
Date: Thu, 08 Sep 2011 01:00:27 +0200
Message-ID: <87wrdkufec.fsf@riseup.net>
References: <1314984801-12029-1-git-send-email-mario.kleiner@tuebingen.mpg.de>
	<1314984801-12029-4-git-send-email-mario.kleiner@tuebingen.mpg.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0804704259=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1314984801-12029-4-git-send-email-mario.kleiner-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org>
	(Mario Kleiner's message of "Fri, 2 Sep 2011 19:33:21 +0200")
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Mario Kleiner <mario.kleiner-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============0804704259==
Content-Type: multipart/signed; boundary="==-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--==-=-=
Content-Type: multipart/mixed; boundary="=-=-="

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Mario Kleiner <mario.kleiner-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org> writes:

> Treats vblank event scheduling for the non-pageflip swap
> case correctly. Allows vblank controlled swaps for redirected
> windows. Fixes some corner-cases in OML_sync_control scheduling
> when divisor and remainder parameters are used.
>
> Signed-off-by: Mario Kleiner <mario.kleiner-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org>
> ---
>  src/nouveau_dri2.c |   71 ++++++++++++++++++++++++++++++++++++++++++++--=
-----
>  1 files changed, 61 insertions(+), 10 deletions(-)
>
> diff --git a/src/nouveau_dri2.c b/src/nouveau_dri2.c
> index 9f0ee97..f14dea4 100644
> --- a/src/nouveau_dri2.c
> +++ b/src/nouveau_dri2.c
> @@ -196,10 +196,8 @@ can_sync_to_vblank(DrawablePtr draw)
>  {
>  	ScrnInfoPtr scrn =3D xf86Screens[draw->pScreen->myNum];
>  	NVPtr pNv =3D NVPTR(scrn);
> -	PixmapPtr pix =3D NVGetDrawablePixmap(draw);
>=20=20
>  	return pNv->glx_vblank &&
> -		nouveau_exa_pixmap_is_onscreen(pix) &&

I'm not sure that this is the right way to fix this problem, depending
on the kind of transformations that the compositing manager is doing
you're likely to end up picking a CRTC at random... I just have the
impression that for redirected windows syncing to vblank is no longer
our responsibility, but rather the compositing manager's.

>  		nv_window_belongs_to_crtc(scrn, draw->x, draw->y,
>  					  draw->width, draw->height);
>  }
> @@ -344,9 +342,40 @@ nouveau_dri2_schedule_swap(ClientPtr client, Drawabl=
ePtr draw,
>  			   CARD64 *target_msc, CARD64 divisor, CARD64 remainder,
>  			   DRI2SwapEventPtr func, void *data)
>  {
> +	PixmapPtr dst_pix;
> +	PixmapPtr src_pix =3D nouveau_dri2_buffer(src)->ppix;
>  	struct nouveau_dri2_vblank_state *s;
>  	CARD64 current_msc, expect_msc;
> -	int ret;
> +	int ret, flip =3D 0;
> +	Bool front_updated;
> +
> +	/* Truncate to match kernel interfaces; means occasional overflow
> +	 * misses, but that's generally not a big deal.
> +	 */
> +	*target_msc &=3D 0xffffffff;
> +	divisor &=3D 0xffffffff;
> +	remainder &=3D 0xffffffff;
> +
This doesn't really fix the problem with our 32bit counters wrapping
around, but, as the comment says, it's not a big deal...

> +	/* Update frontbuffer pixmap and name: Could have changed due to
> +	 * window (un)redirection as part of compositing.
> +	 */
> +	front_updated =3D update_front(draw, dst);
> +
> +	/* Assign frontbuffer pixmap, after update in update_front() */
> +	dst_pix =3D nouveau_dri2_buffer(dst)->ppix;
> +
> +	/* Flips need to be submitted one frame before */
> +	if (DRI2CanFlip(draw) && front_updated &&
> +	    can_exchange(draw, dst_pix, src_pix)) {
> +		flip =3D 1;
> +	}
> +
> +	/* Correct target_msc by 'flip' if this is a page-flipped swap.
> +	 * Do it early, so handling of different timing constraints
> +	 * for divisor, remainder and msc vs. target_msc works.
> +	 */
> +	if (*target_msc > 0)
> +		*target_msc -=3D (CARD64) flip;

We don't need the code above, blits are submitted one frame before as
well - the wait for the final vblank is done in hardware by the GPU
itself, that way we don't have to worry about tearing caused by the GPU
being too busy to finish all its previous work in time for the specified
vblank interval.

>=20=20
>  	/* Initialize a swap structure */
>  	s =3D malloc(sizeof(*s));
> @@ -363,19 +392,34 @@ nouveau_dri2_schedule_swap(ClientPtr client, Drawab=
lePtr draw,
>  		if (ret)
>  			goto fail;
>=20=20
> -		/* Calculate a swap target if we don't have one */
> -		if (current_msc >=3D *target_msc && divisor)
> +		/* Calculate a swap target if we don't have one or if
> +		 * divisor/remainder relationship must be satisfied.
> +		 */
Hm, the divisor/remainder relationship having to be satisfied is just
what one has to do when "we don't have one".

> +		if (current_msc >=3D *target_msc && divisor) {
>  			*target_msc =3D current_msc + divisor
>  				- (current_msc - remainder) % divisor;
>=20=20
> -		/* Request a vblank event one frame before the target */
> +			/* Account for extra pageflip delay if flip > 0 */
> +			*target_msc -=3D (CARD64) flip;
> +		}
> +
> +		/* Request a vblank event one frame before the target, unless
> +		 * this is a copy-swap, in which case we need to make sure
> +		 * it is only dispatched at the target frame or later.
> +		 */
>  		ret =3D nouveau_wait_vblank(draw, DRM_VBLANK_ABSOLUTE |
> -					  DRM_VBLANK_EVENT,
> -					  max(current_msc, *target_msc - 1),
> +					  DRM_VBLANK_EVENT |
> +					  ((flip) ? 0 : DRM_VBLANK_NEXTONMISS),
> +					  max(current_msc, *target_msc),
>  					  &expect_msc, NULL, s);
>  		if (ret)
>  			goto fail;
> -		s->frame =3D (unsigned int) expect_msc & 0xffffffff;
> +
> +		/* Store expected target_msc for later consistency check and
> +		 * return it to server for proper swap_interval implementation.
> +		 */
> +		s->frame =3D ((unsigned int) (expect_msc & 0xffffffff)) + flip ;
> +		*target_msc =3D s->frame;

No need for this, same comment as above.

>  	} else {
>  		/* We can't/don't want to sync to vblank, just swap. */
>  		nouveau_dri2_finish_swap(draw, 0, 0, 0, s);
> @@ -396,6 +440,13 @@ nouveau_dri2_schedule_wait(ClientPtr client, Drawabl=
ePtr draw,
>  	CARD64 current_msc;
>  	int ret;
>=20=20
> +	/* Truncate to match kernel interfaces; means occasional overflow
> +	 * misses, but that's generally not a big deal.
> +	 */
> +	target_msc &=3D 0xffffffff;
> +	divisor &=3D 0xffffffff;
> +	remainder &=3D 0xffffffff;
> +
>  	if (!can_sync_to_vblank(draw)) {
>  		DRI2WaitMSCComplete(client, draw, target_msc, 0, 0);
>  		return TRUE;
> @@ -415,7 +466,7 @@ nouveau_dri2_schedule_wait(ClientPtr client, Drawable=
Ptr draw,
>  		goto fail;
>=20=20
>  	/* Calculate a wait target if we don't have one */
> -	if (current_msc > target_msc && divisor)
> +	if (current_msc >=3D target_msc && divisor)
>  		target_msc =3D current_msc + divisor
>  			- (current_msc - remainder) % divisor;

--=-=-=--

--==-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iF4EAREIAAYFAk5n94sACgkQg5k4nX1Sv1t+SgD/SSC3aYSZFdhlHauoxRbbeSa4
VGMHps7B4tDRWsRnlgkBAIp8cn7jWnOowpvLN5OIvNyqk59jdYKz7yWJFbnoh/nZ
=uDaT
-----END PGP SIGNATURE-----
--==-=-=--

--===============0804704259==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0804704259==--

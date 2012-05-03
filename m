From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH] nouveau/dri2: don't try to page flip pixmaps
Date: Fri, 04 May 2012 00:31:04 +0200
Message-ID: <87wr4sucbb.fsf@riseup.net>
References: <20120503125016.GA8466@joi.lan> <87397hv20o.fsf@riseup.net>
	<20120503164648.GA1761@joi.lan>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1689263513=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20120503164648.GA1761-OI9uyE9O0yo@public.gmane.org> (Marcin Slusarz's message of
	"Thu, 3 May 2012 18:46:48 +0200")
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

--===============1689263513==
Content-Type: multipart/signed; boundary="==-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--==-=-=
Content-Type: multipart/mixed; boundary="=-=-="

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:

> On Thu, May 03, 2012 at 03:15:51PM +0200, Francisco Jerez wrote:
>> Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:
>>=20
>> > Port of commit ae45d7e6d8e6844cd4586c9ee97c21b257fa788f in xf86-video-=
ati.
>> >
>> > Fixes https://bugs.freedesktop.org/show_bug.cgi?id=3D49351
>> >
>> > (Additionally, don't try to pageflip if user disabled it in xorg.conf.
>> > Currently this change is a no-op, because can_exchange returns true on=
ly when
>> > page flipping is enabled, but commit 169512fbe91f0671a90dfee5e280357f0=
a4ef701 -
>> > which changed can_exchange behavior - is due to be reverted)
>> > ---
>> >  src/nouveau_dri2.c |    3 ++-
>> >  1 files changed, 2 insertions(+), 1 deletions(-)
>> >
>> > diff --git a/src/nouveau_dri2.c b/src/nouveau_dri2.c
>> > index 588735f..3d8d22f 100644
>> > --- a/src/nouveau_dri2.c
>> > +++ b/src/nouveau_dri2.c
>> > @@ -328,7 +328,8 @@ nouveau_dri2_finish_swap(DrawablePtr draw, unsigne=
d int frame,
>> >  		type =3D DRI2_EXCHANGE_COMPLETE;
>> >  		DamageRegionAppend(draw, &reg);
>> >=20=20
>> > -		if (DRI2CanFlip(draw)) {
>> > +		if (DRI2CanFlip(draw) && pNv->has_pageflip &&
>> > +				draw->type =3D=3D DRAWABLE_WINDOW) {
>>=20
>> Hey,
>>=20
>> How about 'if (nouveau_exa_pixmap_is_onscreen(dst_pix)) {...'?  We
>> should really never get to that point unless we know for sure that we
>> can either flip or exchange, so the 'has_pageflip' check is redundant.
>
> I see your point, but it's all non obvious. How about this patch instead?
> :)
>
I guess the confusion stems from the meaning of "exchange": Do you
exchange as well as you flip or does one exclude the other?  This code
only (used to) make sense if you read it the first way, i.e. as if
"flip" were the subset of "exchange" you use with on-screen windows. :P

That said, I'm OK with changing the name of "can_exchange" to
"can_exchange_or_flip" if that makes its meaning clearer.  TBH the rest
of the changes in this patch don't really look to me like they're making
anything easier to understand.  That's quite a personal matter though.

> ---
> From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Subject: [PATCH] dri2: don't try to page flip pixmaps
>
> Based on commit ae45d7e6d8e6844cd4586c9ee97c21b257fa788f in xf86-video-at=
i.
>
> Fixes https://bugs.freedesktop.org/show_bug.cgi?id=3D49351
> ---
>  src/nouveau_dri2.c |   31 ++++++++++++++++++++-----------
>  1 files changed, 20 insertions(+), 11 deletions(-)
>
> diff --git a/src/nouveau_dri2.c b/src/nouveau_dri2.c
> index 588735f..86039ef 100644
> --- a/src/nouveau_dri2.c
> +++ b/src/nouveau_dri2.c
> @@ -178,12 +178,14 @@ update_front(DrawablePtr draw, DRI2BufferPtr front)
>  }
>=20=20
>  static Bool
> -can_exchange(DrawablePtr draw, PixmapPtr dst_pix, PixmapPtr src_pix)
> +can_exchange_or_flip(DrawablePtr draw, PixmapPtr dst_pix, PixmapPtr src_=
pix,
> +		Bool *flip)
>  {
>  	ScrnInfoPtr scrn =3D xf86Screens[draw->pScreen->myNum];
>  	xf86CrtcConfigPtr xf86_config =3D XF86_CRTC_CONFIG_PTR(scrn);
>  	NVPtr pNv =3D NVPTR(scrn);
>  	int i;
> +	Bool dst_is_screen;
>=20=20
>  	for (i =3D 0; i < xf86_config->num_crtc; i++) {
>  		xf86CrtcPtr crtc =3D xf86_config->crtc[i];
> @@ -192,11 +194,17 @@ can_exchange(DrawablePtr draw, PixmapPtr dst_pix, P=
ixmapPtr src_pix)
>=20=20
>  	}
>=20=20
> -	return ((DRI2CanFlip(draw) && pNv->has_pageflip)) &&
> -		dst_pix->drawable.width =3D=3D src_pix->drawable.width &&
> -		dst_pix->drawable.height =3D=3D src_pix->drawable.height &&
> -		dst_pix->drawable.bitsPerPixel =3D=3D src_pix->drawable.bitsPerPixel &&
> -		dst_pix->devKind =3D=3D src_pix->devKind;
> +	if (dst_pix->drawable.width !=3D src_pix->drawable.width ||
> +			dst_pix->drawable.height !=3D src_pix->drawable.height ||
> +			dst_pix->drawable.bitsPerPixel !=3D src_pix->drawable.bitsPerPixel ||
> +			dst_pix->devKind !=3D src_pix->devKind)
> +		return FALSE;
> +
> +	dst_is_screen =3D nouveau_exa_pixmap_is_onscreen(dst_pix);
> +	*flip =3D dst_is_screen && pNv->has_pageflip && DRI2CanFlip(draw);
> +
> +	/* Exchange path is currently disabled, see fdo bug 35930 */
> +	return *flip /*|| !dst_is_screen*/;
>  }
>=20=20
>  static Bool
> @@ -280,7 +288,7 @@ nouveau_dri2_finish_swap(DrawablePtr draw, unsigned i=
nt frame,
>  	struct nouveau_pushbuf *push =3D pNv->pushbuf;
>  	RegionRec reg;
>  	int type, ret;
> -	Bool front_updated;
> +	Bool front_updated, flip;
>=20=20
>  	REGION_INIT(0, &reg, (&(BoxRec){ 0, 0, draw->width, draw->height }), 0);
>  	REGION_TRANSLATE(0, &reg, draw->x, draw->y);
> @@ -324,17 +332,18 @@ nouveau_dri2_finish_swap(DrawablePtr draw, unsigned=
 int frame,
>  		nouveau_pushbuf_kick(push, push->channel);
>  	}
>=20=20
> -	if (front_updated && can_exchange(draw, dst_pix, src_pix)) {
> -		type =3D DRI2_EXCHANGE_COMPLETE;
> +	if (front_updated && can_exchange_or_flip(draw, dst_pix, src_pix, &flip=
)) {
>  		DamageRegionAppend(draw, &reg);
>=20=20
> -		if (DRI2CanFlip(draw)) {
> +		if (flip) {
>  			type =3D DRI2_FLIP_COMPLETE;
>  			ret =3D drmmode_page_flip(draw, src_pix,
>  						violate_oml(draw) ? NULL : s,
>  						ref_crtc_hw_id);
>  			if (!ret)
>  				goto out;
> +		} else {
> +			type =3D DRI2_EXCHANGE_COMPLETE;
>  		}
>=20=20
>  		SWAP(s->dst->name, s->src->name);
> @@ -343,7 +352,7 @@ nouveau_dri2_finish_swap(DrawablePtr draw, unsigned i=
nt frame,
>  		DamageRegionProcessPending(draw);
>=20=20
>  		/* If it is a page flip, finish it in the flip event handler. */
> -		if ((type =3D=3D DRI2_FLIP_COMPLETE) && !violate_oml(draw))
> +		if (flip && !violate_oml(draw))
>  			return;
>  	} else {
>  		type =3D DRI2_BLIT_COMPLETE;

--=-=-=--

--==-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iF4EAREIAAYFAk+jBzMACgkQg5k4nX1Sv1vr2AEAjvR3imT2V0gCswTDgqXj19P4
23g4V9iEg32yJK5Qz3oBAJQy6ULNI8RELyyljQYgDIunDESqrfPt8sPiBeXj8KW0
=f7/H
-----END PGP SIGNATURE-----
--==-=-=--

--===============1689263513==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1689263513==--

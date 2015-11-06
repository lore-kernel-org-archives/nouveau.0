From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau: Fix pre-nv50 pageflip events
Date: Fri, 6 Nov 2015 18:19:30 +0100
Message-ID: <20151106171930.GA24026@ulmo>
References: <1446242140-6766-1-git-send-email-daniel.vetter@ffwll.ch>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1150695236=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1446242140-6766-1-git-send-email-daniel.vetter-/w4YWyX8dFk@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
Cc: Mario Kleiner <mario.kleiner.de-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Nouveau Dev <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, DRI Development <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Daniel Vetter <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org


--===============1150695236==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Nq2Wo0NMKNjxTN9z"
Content-Disposition: inline


--Nq2Wo0NMKNjxTN9z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Cc +=3D Mario Kleiner, Mario, can you take a look whether this proposed
solution makes sense and fixes the issues you were seeing back when you
posted the patch in commit:

commit af4870e406126b7ac0ae7c7ce5751f25ebe60f28
Author: Mario Kleiner <mario.kleiner.de-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Date:   Tue May 13 00:42:08 2014 +0200

    drm/nouveau/kms/nv04-nv40: fix pageflip events via special case.

    Cards with nv04 display engine can't reliably use vblank
    counts and timestamps computed via drm_handle_vblank(), as
    the function gets invoked after sending the pageflip events.

    Fix this by defaulting to the old crtcid =3D -1 fallback path
    on <=3D NV-50 cards, and only using the precise path on NV-50
    and later.

    Signed-off-by: Mario Kleiner <mario.kleiner.de-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
    Signed-off-by: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
    Cc: <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org> # 3.13+

Do you happen to still have the setup around where you saw this?

Thierry

On Fri, Oct 30, 2015 at 10:55:40PM +0100, Daniel Vetter wrote:
> Apparently pre-nv50 pageflip events happen before the actual vblank
> period. Therefore that functionality got semi-disabled in
>=20
> commit af4870e406126b7ac0ae7c7ce5751f25ebe60f28
> Author: Mario Kleiner <mario.kleiner.de-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Date:   Tue May 13 00:42:08 2014 +0200
>=20
>     drm/nouveau/kms/nv04-nv40: fix pageflip events via special case.
>=20
> Unfortunately that hack got uprooted in
>=20
> commit cc1ef118fc099295ae6aabbacc8af94d8d8885eb
> Author: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Date:   Wed Aug 12 17:00:31 2015 +0200
>=20
>     drm/irq: Make pipe unsigned and name consistent
>=20
> Trigering a warning when trying to sample the vblank timestamp for a
> non-existing pipe. There's a few ways to fix this:
>=20
> - Open-code the old behaviour, which just enshrines this slight
>   breakage of the userspace ABI.
>=20
> - Revert Mario's commit and again inflict broken timestamps, again not
>   pretty.
>=20
> - Fix this for real by delaying the pageflip TS until the next vblank
>   interrupt, thereby making it accurate.
>=20
> This patch implements the third option. Since having a page flip
> interrupt that happens when the pageflip gets armed and not when it
> completes in the next vblank seems to be fairly common (older i915 hw
> works very similarly) create a new helper to arm vblank events for
> such drivers.
>=20
> Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=3D106431
> Cc: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Cc: Mario Kleiner <mario.kleiner.de-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> Cc: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
> Signed-off-by: Daniel Vetter <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
> ---
>=20
> Note that due to lack of hw this is completely untested. But I think
> it's the right way to fix this.
> -Daniel
> ---
>  drivers/gpu/drm/drm_irq.c                 | 56 +++++++++++++++++++++++++=
+++++-
>  drivers/gpu/drm/nouveau/nouveau_display.c | 16 ++++-----
>  include/drm/drmP.h                        |  4 +++
>  3 files changed, 66 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_irq.c b/drivers/gpu/drm/drm_irq.c
> index 46dbc34b81ba..b3e1f58666a6 100644
> --- a/drivers/gpu/drm/drm_irq.c
> +++ b/drivers/gpu/drm/drm_irq.c
> @@ -972,7 +972,8 @@ static void send_vblank_event(struct drm_device *dev,
>  		struct drm_pending_vblank_event *e,
>  		unsigned long seq, struct timeval *now)
>  {
> -	WARN_ON_SMP(!spin_is_locked(&dev->event_lock));
> +	assert_spin_locked(&dev->event_lock);
> +
>  	e->event.sequence =3D seq;
>  	e->event.tv_sec =3D now->tv_sec;
>  	e->event.tv_usec =3D now->tv_usec;
> @@ -985,6 +986,59 @@ static void send_vblank_event(struct drm_device *dev,
>  }
> =20
>  /**
> + * drm_arm_vblank_event - arm vblanke event after pageflip
> + * @dev: DRM device
> + * @pipe: CRTC index
> + * @e: the event to prepare to send
> + *
> + * A lot of drivers need to generate vblank events for the very next vbl=
ank
> + * interrupt. For example when the page flip interrupt happens when the =
page
> + * flip gets armed, but not when it actually executes within the next vb=
lank
> + * period. This helper function implements exactly the required vblank a=
rming
> + * behaviour.
> + *
> + * Caller must hold event lock. Caller must also hold a vblank reference=
 for the
> + * event @e, which will be dropped when the next vblank arrives.
> + *
> + * This is the legacy version of drm_crtc_arm_vblank_event().
> + */
> +void drm_arm_vblank_event(struct drm_device *dev, unsigned int pipe,
> +			  struct drm_pending_vblank_event *e)
> +{
> +	struct timeval now;
> +	unsigned int seq;
> +
> +	assert_spin_locked(&dev->event_lock);
> +
> +	e->pipe =3D pipe;
> +	list_add_tail(&e->base.link, &dev->vblank_event_list);
> +}
> +EXPORT_SYMBOL(drm_arm_vblank_event);
> +
> +/**
> + * drm_arm_vblank_event - arm vblanke event after pageflip
> + * @crtc: the source CRTC of the vblank event
> + * @e: the event to send
> + *
> + * A lot of drivers need to generate vblank events for the very next vbl=
ank
> + * interrupt. For example when the page flip interrupt happens when the =
page
> + * flip gets armed, but not when it actually executes within the next vb=
lank
> + * period. This helper function implements exactly the required vblank a=
rming
> + * behaviour.
> + *
> + * Caller must hold event lock. Caller must also hold a vblank reference=
 for the
> + * event @e, which will be dropped when the next vblank arrives.
> + *
> + * This is the native KMS version of drm_send_vblank_event().
> + */
> +void drm_crtc_arm_vblank_event(struct drm_crtc *crtc,
> +			       struct drm_pending_vblank_event *e)
> +{
> +	drm_arm_vblank_event(crtc->dev, drm_crtc_index(crtc), e);
> +}
> +EXPORT_SYMBOL(drm_crtc_arm_vblank_event);
> +
> +/**
>   * drm_send_vblank_event - helper to send vblank event after pageflip
>   * @dev: DRM device
>   * @pipe: CRTC index
> diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/=
nouveau/nouveau_display.c
> index 184445d4abbf..041e5f84538c 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_display.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_display.c
> @@ -826,7 +826,6 @@ nouveau_finish_page_flip(struct nouveau_channel *chan,
>  	struct drm_device *dev =3D drm->dev;
>  	struct nouveau_page_flip_state *s;
>  	unsigned long flags;
> -	int crtcid =3D -1;
> =20
>  	spin_lock_irqsave(&dev->event_lock, flags);
> =20
> @@ -838,16 +837,15 @@ nouveau_finish_page_flip(struct nouveau_channel *ch=
an,
> =20
>  	s =3D list_first_entry(&fctx->flip, struct nouveau_page_flip_state, hea=
d);
>  	if (s->event) {
> -		/* Vblank timestamps/counts are only correct on >=3D NV-50 */
> -		if (drm->device.info.family >=3D NV_DEVICE_INFO_V0_TESLA)
> -			crtcid =3D s->crtc;
> -
> -		drm_send_vblank_event(dev, crtcid, s->event);
> +		if (drm->device.info.family < NV_DEVICE_INFO_V0_TESLA) {
> +			drm_arm_vblank_event(dev, s->crtc, s->event);
> +		} else {
> +			drm_send_vblank_event(dev, s->crtc, s->event);
> +			/* Give up ownership of vblank for page-flipped crtc */
> +			drm_vblank_put(dev, s->crtc);
> +		}
>  	}
> =20
> -	/* Give up ownership of vblank for page-flipped crtc */
> -	drm_vblank_put(dev, s->crtc);
> -
>  	list_del(&s->head);
>  	if (ps)
>  		*ps =3D *s;
> diff --git a/include/drm/drmP.h b/include/drm/drmP.h
> index eb513341b6ee..4c91ac419d5d 100644
> --- a/include/drm/drmP.h
> +++ b/include/drm/drmP.h
> @@ -948,6 +948,10 @@ extern void drm_send_vblank_event(struct drm_device =
*dev, unsigned int pipe,
>  				  struct drm_pending_vblank_event *e);
>  extern void drm_crtc_send_vblank_event(struct drm_crtc *crtc,
>  				       struct drm_pending_vblank_event *e);
> +void drm_send_vblank_event(struct drm_device *dev, unsigned int pipe,
> +			   struct drm_pending_vblank_event *e);
> +void drm_crtc_send_vblank_event(struct drm_crtc *crtc,
> +				struct drm_pending_vblank_event *e);
>  extern bool drm_handle_vblank(struct drm_device *dev, unsigned int pipe);
>  extern bool drm_crtc_handle_vblank(struct drm_crtc *crtc);
>  extern int drm_vblank_get(struct drm_device *dev, unsigned int pipe);
> --=20
> 2.5.1
>=20
> _______________________________________________
> dri-devel mailing list
> dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel

--Nq2Wo0NMKNjxTN9z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWPOEeAAoJEN0jrNd/PrOh07YP/3Ktd3gIrWmwMwAbd3KKjiBT
UzckwCgN0l/FnQjYJYsowCQ04AC+k5mwqd5APsFXFCtaj1UeHvc/3wCUFfMRGDhG
fhM3oue3TWpNVQh8PxejV2MfORL4qik36YC/pyV6qRpa0USB0arQwZp3nGdK/2E5
2zaJOQroVm47l1LB+cUBLoEDJ81gxbk5m+qp6XieE63+2LHpkYWPNEnE/y9X5M5I
kohE6V9PDJajMLm4FPNXlOv3M3CXo94ryLwJAMhkcRooXGoqq/DRcX+u5HlG30v5
gmw+gyAX41phPujat3WtLISMkAOSJa2s/RxS3OkF2aE5Wtyk49S7DaAr8B6n1SCr
NEGO9rsSQEfRJHAzYlryMDiRNfWNgPfIWbtZ3FeuyI3qywF59QtnnIbWErlIRTXU
7S9Ftp8QB4G+TyC65AqdtnHbaujiPnQVFfx5gN3lxM8BiE1fC1wcoqhxU8hATrzR
7q4UjniZz9VahjAMIuo2tVHQQoZKime0f8PUwcRHWGoUPBCvFyD6B9gx5Y5nIKZ7
CJEctJ/vio/Au1oIk3Prq8iZcrbJrt3bMSL11eM9bZIn45iWu6w3xSunO0cNEnD0
Q9VeOHRIL0f6rArCOB3yvLQHznq5fYC0lcDBDLyNMlL7w5BgVI0BCC2cBhv1Wsa8
JG4djOQ4CZ09/bbMxEpK
=WTaW
-----END PGP SIGNATURE-----

--Nq2Wo0NMKNjxTN9z--

--===============1150695236==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1150695236==--

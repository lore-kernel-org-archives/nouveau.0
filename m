From: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 02/10] drm: Rename plane atomic_check state names
Date: Fri, 15 Jan 2021 15:13:49 +0100
Message-ID: <20210115141349.7oq5hwsj37qcpk5j@gilmour>
References: <20210115125703.1315064-1-maxime@cerno.tech>
 <20210115125703.1315064-2-maxime@cerno.tech>
 <221e5626-d97c-9d4e-07cc-e696c92ceb65@suse.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="pc7g53zcvckyysz5"
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <221e5626-d97c-9d4e-07cc-e696c92ceb65@suse.de>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, Alex Deucher <alexander.deucher@amd.com>, Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, Daniel Vetter <daniel@ffwll.ch>, "James (Qian) Wang" <james.qian.wang@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, Mihail Atanassov <mihail.atanassov@arm.com>, Brian Starkey <brian.starkey@arm.com>, Russell King <linux@armlinux.org.uk>, Dave Airlie <airlied@redhat.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@sams>
List-Id: nouveau.vger.kernel.org


--pc7g53zcvckyysz5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Jan 15, 2021 at 02:46:36PM +0100, Thomas Zimmermann wrote:
> Hi
>=20
> Am 15.01.21 um 13:56 schrieb Maxime Ripard:
> > diff --git a/drivers/gpu/drm/imx/ipuv3-plane.c b/drivers/gpu/drm/imx/ip=
uv3-plane.c
> > index 8a4235d9d9f1..2cb09e9d9306 100644
> > --- a/drivers/gpu/drm/imx/ipuv3-plane.c
> > +++ b/drivers/gpu/drm/imx/ipuv3-plane.c
> > @@ -344,12 +344,12 @@ static const struct drm_plane_funcs ipu_plane_fun=
cs =3D {
> >   };
> >   static int ipu_plane_atomic_check(struct drm_plane *plane,
> > -				  struct drm_plane_state *state)
> > +				  struct drm_plane_state *new_state)
>=20
> It's not 'new_plane_state' ?

That function is using old_state for plane->state:

> >   {
> >   	struct drm_plane_state *old_state =3D plane->state;

Here ^

So it felt more natural to keep the convention in use in that driver

Maxime

--pc7g53zcvckyysz5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYAGjHQAKCRDj7w1vZxhR
xRyQAP9z6jgYoVLN5O08Gfa2bipU5kwBoAnOqoWm5tZt0atb8QEA9iY4poTgz6cv
u2lw2ErmnQLG6Rt10lvZcTmjIdOF5QI=
=AOj1
-----END PGP SIGNATURE-----

--pc7g53zcvckyysz5--

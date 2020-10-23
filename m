From: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 5/5] drm/<drivers>: Constify struct
 drm_driver
Date: Fri, 23 Oct 2020 17:13:11 +0200
Message-ID: <20201023151311.dd246rt5chohjw57@gilmour.lan>
References: <20201023122811.2374118-1-daniel.vetter@ffwll.ch>
 <20201023122811.2374118-5-daniel.vetter@ffwll.ch>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0460546326=="
Return-path: <intel-gfx-bounces@lists.freedesktop.org>
In-Reply-To: <20201023122811.2374118-5-daniel.vetter@ffwll.ch>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Leo Li <sunpeng.li@amd.com>, nouveau@lists.freedesktop.org, Intel Graphics Development <intel-gfx@lists.freedesktop.org>, DRI Development <dri-devel@lists.freedesktop.org>, virtualization@lists.linux-foundation.org, Eric Anholt <eric@anholt.net>, Gerd Hoffmann <kraxel@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>, Alex Deucher <alexander.deucher@amd.com>, Dave Airlie <airlied@redhat.com>, Harry Wentland <harry.wentland@amd.com>, Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, Ben Skeggs <bskeggs@redhat.com>
List-Id: nouveau.vger.kernel.org


--===============0460546326==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="v4ipol7ndp77sm72"
Content-Disposition: inline


--v4ipol7ndp77sm72
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2020 at 02:28:11PM +0200, Daniel Vetter wrote:
> Only the following drivers aren't converted:
> - amdgpu, because of the driver_feature mangling due to virt support
> - nouveau, because DRIVER_ATOMIC uapi is still not the default on the
>   platforms where it's supported (i.e. again driver_feature mangling)
> - vc4, again because of driver_feature mangling
> - qxl, because the ioctl table is somewhere else and moving that is
>   maybe a bit too much, hence the num_ioctls assignment prevents a
>   const driver structure.
>=20
> Note that for armada I also went ahead and made the ioctl array const.
>=20
> Only cc'ing the driver people who've not been converted (everyone else
> is way too much).
>=20
> Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: virtualization@lists.linux-foundation.org
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Leo Li <sunpeng.li@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Christian K=F6nig <christian.koenig@amd.com>
> Cc: Eric Anholt <eric@anholt.net>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: nouveau@lists.freedesktop.org
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>


Acked-by: Maxime Ripard <mripard@kernel.org>

Maxime

--v4ipol7ndp77sm72
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX5LzBwAKCRDj7w1vZxhR
xQeYAP90dRsz0KSJ0nih77xgZfEUElpITJItnWR67S1ZmoKEwwEAoNThieyWwPHB
68gdd7FrdMZXhjQv8Q+AZTU3S7CBZg8=
=rHUD
-----END PGP SIGNATURE-----

--v4ipol7ndp77sm72--

--===============0460546326==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx

--===============0460546326==--

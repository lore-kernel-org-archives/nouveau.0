From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [Nouveau] [PATCH 3/3] drm/nouveau/kms/nv50-: Limit MST BPC to 8
Date: Mon, 18 Nov 2019 14:36:14 +0100
Message-ID: <20191118133614.GE2246533@ulmo>
References: <20191115210728.3467-1-lyude@redhat.com>
 <20191115210728.3467-4-lyude@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="BQPnanjtCNWHyqYD"
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191115210728.3467-4-lyude@redhat.com>
Sender: stable-owner@vger.kernel.org
To: Lyude Paul <lyude@redhat.com>
Cc: nouveau@lists.freedesktop.org, Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, Jerry Zuo <Jerry.Zuo@amd.com>, Sean Paul <seanpaul@chromium.org>, Ben Skeggs <bskeggs@redhat.com>, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@redhat.com>, Harry Wentland <harry.wentland@amd.com>, Juston Li <juston.li@intel.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
List-Id: nouveau.vger.kernel.org


--BQPnanjtCNWHyqYD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 15, 2019 at 04:07:20PM -0500, Lyude Paul wrote:
> Noticed this while working on some unrelated CRC stuff. Currently,
> userspace has very little support for BPCs higher than 8. While this
> doesn't matter for most things, on MST topologies we need to be careful
> about ensuring that we do our best to make any given display
> configuration fit within the bandwidth restraints of the topology, since
> otherwise less people's monitor configurations will work.
>=20
> Allowing for BPC settings higher than 8 dramatically increases the
> required bandwidth for displays in most configurations, and consequently
> makes it a lot less likely that said display configurations will pass
> the atomic check.
>=20
> In the future we want to fix this correctly by making it so that we
> adjust the bpp for each display in a topology to be as high as possible,
> while making sure to lower the bpp of each display in the event that we
> run out of bandwidth and need to rerun our atomic check. But for now,
> follow the behavior that both i915 and amdgpu are sticking to.
>=20
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Fixes: 232c9eec417a ("drm/nouveau: Use atomic VCPI helpers for MST")
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: David Airlie <airlied@redhat.com>
> Cc: Jerry Zuo <Jerry.Zuo@amd.com>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Juston Li <juston.li@intel.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Sean Paul <seanpaul@chromium.org>
> Cc: <stable@vger.kernel.org> # v5.1+
> ---
>  drivers/gpu/drm/nouveau/dispnv50/disp.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)

Reviewed-by: Thierry Reding <treding@nvidia.com>

--BQPnanjtCNWHyqYD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl3Snk4ACgkQ3SOs138+
s6Fi2RAApHjuN6J8fn0XmvXm7CFGwT84x9lf01uGyvRtrhJ7ULOpVbTfcHXk1SL8
Ip8eaNj04DbxO73u9G+2lJkIXmVbyOKxZwCpi9A/UAAoXIspnzZZ6nCWy6124Iqm
qpawUa+0q4uz8A/VdALzp60ZilNvX4pZn+mNPbK2V9lrG28vLx0iS6xc+BkMRC4Y
rkDmXsdUNiCbVs8OsSK7bBCE3c+g7Z8Hu6z5h5O8yxcG2JDTVLAPindmyZ83Q0qT
yqSqqi72QycmqyQ9prZylChv7/z/s7HNp6rMtGG6oCGwguZlwKdIz/Ko01hEKxbd
OuX3vhGDe2bhAr/QowPbL4b5ST8ZmeyJ37lldmZAihWEK+BAQHESX/NoaWqDoctc
NRIPdzWXvF2VCEy3rLNuUd24ugv+kW9zOYv0ezBoCqq2VZuxSC5Q4rQRFH94oQQ1
OHvPgNRe6P4ZX8gLiZmDdTzQsgJntf/2npXLlJv8muRDuCWqC/d8kGc9xFINqsok
pPOBq5OhavcKXVO41RRju8ZqVpy0y+YYqWDynpr97SMTtp11HN3vcrZiB117xllh
Fv5rY400AGDpwsaeH/eRm2a+T0Ov2DkegEPFu0IjCuKJ9xMV5RxftSw3HD/7M5hC
w+hD4Ixncpohqgaml6M7U/gUIJdafT6N7D8S4LlTcKhvsDFSpVU=
=Mrw/
-----END PGP SIGNATURE-----

--BQPnanjtCNWHyqYD--

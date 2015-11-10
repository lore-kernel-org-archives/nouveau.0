From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau: Fix pre-nv50 pageflip events (v3)
Date: Tue, 10 Nov 2015 17:00:35 +0100
Message-ID: <20151110160033.GB25368@ulmo.nvidia.com>
References: <1447167452-998-1-git-send-email-mario.kleiner.de@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0759987880=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1447167452-998-1-git-send-email-mario.kleiner.de-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Mario Kleiner <mario.kleiner.de-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============0759987880==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="A6N2fC+uXW/VQSAv"
Content-Disposition: inline

--A6N2fC+uXW/VQSAv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2015 at 03:54:52PM +0100, Mario Kleiner wrote:
> From: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
>=20
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
>=20
> v2 (mario): Integrate my own review comments into Daniels patch.
>    - Fix function prototypes in drmP.h
>    - Add missing vblank_put() for pageflip completion without
>      pageflip event.
>    - Initialize sequence number for queued pageflip event to avoid
>      trouble in drm_handle_vblank_events().
>    - Remove dead code and spelling fix.
>=20
> v3 (mario): Add a signed-off-by and cc stable tag per Ilja's advice.
>=20
> Signed-off-by: Daniel Vetter <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
> (v1) Reviewed-by: Mario Kleiner <mario.kleiner.de-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> (v2/v3) Signed-off-by: Mario Kleiner <mario.kleiner.de-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>=20
> Cc: stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org # v4.3
> ---
>  drivers/gpu/drm/drm_irq.c                 | 54 +++++++++++++++++++++++++=
+++++-
>  drivers/gpu/drm/nouveau/nouveau_display.c | 19 ++++++-----
>  include/drm/drmP.h                        |  4 +++
>  3 files changed, 68 insertions(+), 9 deletions(-)

This looks good to me. Let me clean this up a little and submit it to
Dave.

Thierry

--A6N2fC+uXW/VQSAv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWQhShAAoJEN0jrNd/PrOhO9cP/AxjQTg0NyXxYKCJwsT4nV/d
/BtJWMhp5jUvbVNSLJ0MRBut8GuQUtP4dabE2O0monsxarAZ7G/ly3JdVf5vJdJL
dFTaWPzwVjpfov5xncQVzKK8tuMfLT5PgUftBXDGMa+kfRp2n11GrWJWiTRUv1ed
ruODW3HXOivNWlA/NvxxU2+GYzu3DALdAWpR13pGZoEyyqXdRQ9eXoa7ksDHVU77
45O+XxqpuNouOL78AgL8zi2zuK7QyZAXdGonC9ROAONhEsx8PTfRlJTzuFTOr9vb
MF9NcT+EYghKsD/XRfpjTMIi1eEqG+gkmH/SgKI4AWzWGETMe26/eBzOWS9//pPH
97wVqyeeepgJQV0NzDL9pvkolCpnHMTHPwoe0on1R1RUA7vSvQhZqvLHwEFTh+Yg
fN6j05x8qHMXEAeMcnehPcqKXUTEcXbG6dH29Vsy43PuJW8NSfhCAqEWNeY3saA8
vNQr84wkzVgy440cdVQC4eOmdrs1pgrCFVYxGSHweNjScSKDaCHMw0FTXuLe7ngU
2UW5OmicZTv45KZVmmhEBBj2q7Da/f8tO8Ej1J3P8K6NdzMvNROYopUpfK/zSpHG
avcVnJpZ2NCsBpoVRE0Vm257adEwJqaCpAzG8mYa4yTqQJy6hxW2Iq/xERUk4lk7
aStD8xmOm2+XOYSN1Ovx
=FSt8
-----END PGP SIGNATURE-----

--A6N2fC+uXW/VQSAv--

--===============0759987880==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0759987880==--

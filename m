From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [Nouveau] [PATCH v2] drm/nouveau: Document nouveau support for
 Tegra in DRIVER_DESC
Date: Thu, 12 Oct 2017 13:41:44 +0200
Message-ID: <20171012114144.GA4453@ulmo>
References: <20170811105616.9727-1-rhyskidd@gmail.com>
 <20171001141353.25420-1-rhyskidd@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1493322253=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20171001141353.25420-1-rhyskidd@gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Rhys Kidd <rhyskidd@gmail.com>
Cc: nouveau@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>, dri-devel@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org


--===============1493322253==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8t9RHnE3ZwKMSgU+"
Content-Disposition: inline


--8t9RHnE3ZwKMSgU+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 01, 2017 at 10:13:53AM -0400, Rhys Kidd wrote:
> nouveau supports the Tegra K1 and higher after the SoC-based GPUs converg=
ed
> with the main GeForce GPU families.
>=20
> v2:
> - Qualify that support is Tegra K1+ (Martin Peres)
>=20
> Signed-off-by: Rhys Kidd <rhyskidd@gmail.com>
> Reviewed-by: Martin Peres <martin.peres@free.fr>
> Acked-by: Pierre Moreau <pierre.morrow@free.fr>
> ---
>  drivers/gpu/drm/nouveau/nouveau_drv.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Ben's probably picked this up already, but FWIW:

Acked-by: Thierry Reding <treding@nvidia.com>

--8t9RHnE3ZwKMSgU+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlnfVPgACgkQ3SOs138+
s6ER7w//d8fuBSblsLBiDUN1RL9putsTqjI7WVD3w09kWJrgMy3MnkjEmJTSbMIH
Awi2O6MZN0Q/y88zGd3p315waDvzh+r68IQBYbc/U8MAIDvge1E5OuUadaMWYyag
aNo1Ph2ZA+NDgLXqcwYa/mXjrKEZ0VAhpAJ1PylU8uiFcH5fmeEGMu1iR0wNn36G
bj7HSzoPkPw9cCK1169Rs/c8jZI3p80ayZYD1APDQ3ADA49jQZ1tsyuPD2ejotU2
grEo9JrzV30RPHitxAlr6ECOiafPl4lEcWDg/c+MV3dg7P4024RvcWRswI1And/u
DGCyGagvmEXO+Wj1KE0KBFZPK+10Sv7S/xviWUrgLpg2dtXJS6e9rfDB+47Aclpf
Bvds3HTUoI5mVVDLhHlLmkcenF9fgVt/CzCadCtLnSdfVWUAo8IZt4xOY6tbn+P+
/A9ewEmNpK4cYS997WMtTjpdZWvMmO0XwVoaQ/x7OUxOhzHlOJVTiGgy0vvwjBTo
uRk60/IXyXKjsH8FQtXZic70tje6s1SlxbSlkjAeER/yyu8fAsAt33bJ1E+N5hjO
sFLKpRgi+TS8VtZ+/347UcAfkqXvr8pfQRivikZu1lD1sDCMBrOczUctuiMhmLfG
LR4vEDu5by/qvrRoX7rOpUprxXUEDHBTJRZd+RzMtd2zSG38mYA=
=9sIk
-----END PGP SIGNATURE-----

--8t9RHnE3ZwKMSgU+--

--===============1493322253==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1493322253==--

From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [Nouveau] [PATCH] drm/nouveau/bar/gk20a: Avoid bar teardown
 during init
Date: Wed, 10 Jan 2018 13:20:32 +0100
Message-ID: <20180110122032.GA26614@ulmo>
References: <1515065349-10187-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2101720851=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1515065349-10187-1-git-send-email-jonathanh@nvidia.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>, Guillaume Tucker <guillaume.tucker@collabora.com>
List-Id: nouveau.vger.kernel.org


--===============2101720851==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="LZvS9be/3tNcYl/X"
Content-Disposition: inline


--LZvS9be/3tNcYl/X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 04, 2018 at 11:29:09AM +0000, Jon Hunter wrote:
> Commit bbb163e18960 ("drm/nouveau/bar: implement bar1 teardown")
> introduced add a teardown helper function for BAR1. During
> initialisation of the Nouveau, initially all the teardown helpers are
> called once, before calling their init counterparts. For gk20a, after
> the BAR1 teardown function is called, the device is hanging during the
> initialisation of the FB sub-device. At this point it is unclear why
> this is happening and this is still under investigation. However, this
> change is preventing Tegra124 devices from booting when Nouveau is
> enabled. To allow Tegra124 to boot, remove the teardown helper for
> gk20a.
>=20
> This is based upon a previous patch by Guillaume Tucker but limits
> the workaround to only gk20a GPUs.
>=20
> Fixes: bbb163e18960 ("drm/nouveau/bar: implement bar1 teardown")
> Reported-by: Guillaume Tucker <guillaume.tucker@collabora.com>
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
> I am not happy that we do not yet fully understand the cause of
> the hang, but I am talking with a few people at NVIDIA about this
> and have a few things to look into. However, given that we are
> close to v4.15 being released and I am not sure we will have a
> proper fix in place before, I think it is best to workaround
> this for now.
>=20
>  drivers/gpu/drm/nouveau/nvkm/subdev/bar/base.c  | 3 ++-
>  drivers/gpu/drm/nouveau/nvkm/subdev/bar/gk20a.c | 1 -
>  2 files changed, 2 insertions(+), 2 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--LZvS9be/3tNcYl/X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlpWBRAACgkQ3SOs138+
s6FdNQ//aOmckBoZHjhYFaC4zPHo6x5ld/FuFc4pYngjexsR3xIi8L7qXxtcxpwT
mI4PUgn5rfPLtzfqrV4cWHjQfYfxPRLiSN9z8lNtZbb5CUCMLaTZS9dfNOIOr3eS
Kr8Ihhlcz4a6aBjm4YxA2eWz6mHM/lsiDJQ/8DcS6UyyKw1QS8s+kjbn3JlelJdp
t5z6DEQ4BtnijyjrVE3ht+IkIQExv6aLjyDu66z1N3JjsyNYree64WqJQDMEWoUH
6bOlAEE1FZB3ns3R1llO092RB4VyIeo/rcGdpjTCAoU8zFqbQLd/nQKFaCEfKalk
2v6QGu+a11gATGKUOaf+XqUOeX8QMnn/BRTt70JwugfAn2wxeBA6Ey94Sm6k10tn
VvnWTetds7httN/jjulJUzjwNNwL7cJv6UQIToqaFD85ebHi1xzd7CZiP4V/SvJM
uyx25M2kBaLkH+VrSBstVkZxdtm1F+GrVS1nkujWxtkyMn93ZQI/4fPrClrh3QTS
AIW47YUxFgad1JUFWKUhfPJuKojqZfvrRZUN5s9rwSkrNJG5gjpFP9Ae6TtUTqcQ
zBY4cRKJFgtmM6B2R4avU2f7Nt+7M0eCbT8KwIN4lTH30WeQ0nEypd0vkqXd6kxc
Bxe5+7dbb8fvdzS0FTeAJZE6nz78xTeLDuXTb154OkLVtkZ5vro=
=OTyl
-----END PGP SIGNATURE-----

--LZvS9be/3tNcYl/X--

--===============2101720851==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============2101720851==--

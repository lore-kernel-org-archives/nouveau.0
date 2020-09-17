From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 14/21] drm/tegra: Introduce GEM object
 functions
Date: Thu, 17 Sep 2020 12:56:20 +0200
Message-ID: <20200917105620.GK3515672@ulmo>
References: <20200915145958.19993-1-tzimmermann@suse.de>
 <20200915145958.19993-15-tzimmermann@suse.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2125274682=="
Return-path: <freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20200915145958.19993-15-tzimmermann-l3A5Bk7waGM@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Freedreno" <freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>
Cc: hamohammed.sa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, andrey.grodzovsky-5C7GfCeVMHo@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, joonas.lahtinen-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org, nirmoy.das-5C7GfCeVMHo@public.gmane.org, robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org, sumit.semwal-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, emil.velikov-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, oleksandr_andrushchenko-uRwfk40T5oI@public.gmane.org, tomi.valkeinen-l0cyMroinI0@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, patrik.r.jakobsson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, xen-devel-GuqFBffKawtpuQazS67q72D2FQJk+8+b@public.gmane.org, intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, matthew.auld-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, chunkuang.hu-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, andi.shyti-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, daniel-/w4YWyX8dFk@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, marek.olsak-5C7GfCeVMHo@public.gmane.org, tianci.yin-5C7GfCeVMHo@public.gmane.org, maarten
List-Id: nouveau.vger.kernel.org


--===============2125274682==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="NqNl6FRZtoRUn5bW"
Content-Disposition: inline


--NqNl6FRZtoRUn5bW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2020 at 04:59:51PM +0200, Thomas Zimmermann wrote:
> GEM object functions deprecate several similar callback interfaces in
> struct drm_driver. This patch replaces the per-driver callbacks with
> per-instance callbacks in tegra.
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>
> ---
>  drivers/gpu/drm/tegra/drm.c | 4 ----
>  drivers/gpu/drm/tegra/gem.c | 8 ++++++++
>  2 files changed, 8 insertions(+), 4 deletions(-)

Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--NqNl6FRZtoRUn5bW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9jQNQACgkQ3SOs138+
s6HfWQ//YmrWsVV1CJUAgb5t2QX4pCrujVRekVE/g1njlA/b4hb8UrTwixaZox4k
Y6ALc4RAngHpnPoebK9HTtI7eQ6gV3NzTvOZN432iqInp8UuFdrqwY9hkRcS5ak9
gNSHqMgl0BAkIdZ7VM5EWvVcbSkWsGbOR2uTx45m3hieqf80Jlyto/yqcH8yHm0Y
dNhlRIxSS23lHF4c79jOtCPyJjF2DaErfz+qFiFLmdV60AjeCfl6LZZSuSNSbSNv
Ht8OICXXHv9dKx6IbgyAAJIf77DsMDyXHzNC6YxoBH1c1X3JgEinuNaj8h+ZXxrT
klWtayTZ15xforiBumJH+Zi23DA+95v6eigfHDVje5APtRHxDgdnNOhW6zRF049I
powiLvCaS10xJVB7+4DlXmvdJTRaw8jNMcOYR0Yyg5fwrbkjkHyFsi2iQyzclBEJ
KM5kjLzpgBQpaEgpsCqxY0TJ0/bU/VdL532UpAyCK7D9RxN8sdhfU7A4xuwwAeNP
t63YCPEKs9kd0rKW4W6tUOEm9IeNiHL0CL55oYNDUNk0ddTtmdlQkFKSOfDbGBwe
X3RtJeu0oG5S40RXucqy2J4BJO5tKcymjFb3xqjaCP8nDF3ozvgmq/Hu4+MWkeL7
b/rNCCE8o02rDlLqOHqxccc+bQXs6tQBkwI0mESWxpdRfBPoyt8=
=1YYz
-----END PGP SIGNATURE-----

--NqNl6FRZtoRUn5bW--

--===============2125274682==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Freedreno mailing list
Freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
https://lists.freedesktop.org/mailman/listinfo/freedreno

--===============2125274682==--

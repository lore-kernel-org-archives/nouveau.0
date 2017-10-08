From: Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org>
Subject: Re: [RFC PATCH 04/29] clk: Rename nvkm_pstate_calc to
 nvkm_clk_update and export it
Date: Sun, 8 Oct 2017 12:41:29 +0200
Message-ID: <20171008104129.k2irj2mon7mmkfoj@pmoreau.org>
References: <20170915171129.5009-1-karolherbst@gmail.com>
 <20170915171129.5009-5-karolherbst@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1494203572=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20170915171129.5009-5-karolherbst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Karol Herbst <karolherbst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1494203572==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="g4zvxpfemxzt2sgj"
Content-Disposition: inline


--g4zvxpfemxzt2sgj
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2017-09-15 =E2=80=94 17:11, Karol Herbst wrote:
> This function will be used to update the current clock state.
>=20
> This will happen for various reasons:
>   * Temperature changes
>   * User changes clocking state
>   * Load changes
>=20
> v2: remove parameter name
>=20
> Signed-off-by: Karol Herbst <karolherbst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drm/nouveau/include/nvkm/subdev/clk.h |  1 +
>  drm/nouveau/nvkm/subdev/clk/base.c    | 26 ++++++++++++++++----------
>  2 files changed, 17 insertions(+), 10 deletions(-)
>=20
> diff --git a/drm/nouveau/include/nvkm/subdev/clk.h b/drm/nouveau/include/=
nvkm/subdev/clk.h
> index e5275f74..ce3bbcfe 100644
> --- a/drm/nouveau/include/nvkm/subdev/clk.h
> +++ b/drm/nouveau/include/nvkm/subdev/clk.h
> @@ -123,6 +123,7 @@ int nvkm_clk_ustate(struct nvkm_clk *, int req, int p=
wr);
>  int nvkm_clk_astate(struct nvkm_clk *, int req, int rel, bool wait);
>  int nvkm_clk_dstate(struct nvkm_clk *, int req, int rel);
>  int nvkm_clk_tstate(struct nvkm_clk *, u8 temperature);
> +int nvkm_clk_update(struct nvkm_clk *, bool wait);
> =20
>  int nv04_clk_new(struct nvkm_device *, int, struct nvkm_clk **);
>  int nv40_clk_new(struct nvkm_device *, int, struct nvkm_clk **);
> diff --git a/drm/nouveau/nvkm/subdev/clk/base.c b/drm/nouveau/nvkm/subdev=
/clk/base.c
> index e4c8d310..ecff3ff3 100644
> --- a/drm/nouveau/nvkm/subdev/clk/base.c
> +++ b/drm/nouveau/nvkm/subdev/clk/base.c
> @@ -296,7 +296,7 @@ nvkm_pstate_prog(struct nvkm_clk *clk, int pstatei)
>  }
> =20
>  static void
> -nvkm_pstate_work(struct work_struct *work)
> +nvkm_clk_update_work(struct work_struct *work)
>  {
>  	struct nvkm_clk *clk =3D container_of(work, typeof(*clk), work);
>  	struct nvkm_subdev *subdev =3D &clk->subdev;
> @@ -332,9 +332,15 @@ nvkm_pstate_work(struct work_struct *work)
>  	nvkm_notify_get(&clk->pwrsrc_ntfy);
>  }
> =20
> -static int
> -nvkm_pstate_calc(struct nvkm_clk *clk, bool wait)
> +int
> +nvkm_clk_update(struct nvkm_clk *clk, bool wait)
>  {
> +	if (!clk)
> +		return -EINVAL;
> +
> +	if (!clk->allow_reclock)
> +		return -ENODEV;
> +
>  	atomic_set(&clk->waiting, 1);
>  	schedule_work(&clk->work);
>  	if (wait)
> @@ -524,7 +530,7 @@ nvkm_clk_ustate(struct nvkm_clk *clk, int req, int pw=
r)
>  	if (ret >=3D 0) {
>  		if (ret -=3D 2, pwr) clk->ustate_ac =3D ret;
>  		else		   clk->ustate_dc =3D ret;
> -		return nvkm_pstate_calc(clk, true);
> +		return nvkm_clk_update(clk, true);
>  	}
>  	return ret;
>  }
> @@ -536,7 +542,7 @@ nvkm_clk_astate(struct nvkm_clk *clk, int req, int re=
l, bool wait)
>  	if ( rel) clk->astate +=3D rel;
>  	clk->astate =3D min(clk->astate, clk->state_nr - 1);
>  	clk->astate =3D max(clk->astate, 0);
> -	return nvkm_pstate_calc(clk, wait);
> +	return nvkm_clk_update(clk, wait);
>  }
> =20
>  int
> @@ -545,7 +551,7 @@ nvkm_clk_tstate(struct nvkm_clk *clk, u8 temp)
>  	if (clk->temp =3D=3D temp)
>  		return 0;
>  	clk->temp =3D temp;
> -	return nvkm_pstate_calc(clk, false);
> +	return nvkm_clk_update(clk, false);
>  }
> =20
>  int
> @@ -555,7 +561,7 @@ nvkm_clk_dstate(struct nvkm_clk *clk, int req, int re=
l)
>  	if ( rel) clk->dstate +=3D rel;
>  	clk->dstate =3D min(clk->dstate, clk->state_nr - 1);
>  	clk->dstate =3D max(clk->dstate, 0);
> -	return nvkm_pstate_calc(clk, true);
> +	return nvkm_clk_update(clk, true);
>  }
> =20
>  static int
> @@ -563,7 +569,7 @@ nvkm_clk_pwrsrc(struct nvkm_notify *notify)
>  {
>  	struct nvkm_clk *clk =3D
>  		container_of(notify, typeof(*clk), pwrsrc_ntfy);
> -	nvkm_pstate_calc(clk, false);
> +	nvkm_clk_update(clk, false);
>  	return NVKM_NOTIFY_DROP;

Same here as below, shouldn=E2=80=99t there be some error checking on what
`nvkm_clk_update()` returned, as it can fail?

>  }
> =20
> @@ -618,7 +624,7 @@ nvkm_clk_init(struct nvkm_subdev *subdev)
>  	clk->dstate =3D 0;
>  	clk->pstate =3D -1;
>  	clk->temp =3D 90; /* reasonable default value */
> -	nvkm_pstate_calc(clk, true);
> +	nvkm_clk_update(clk, true);
>  	return 0;

`nvkm_pstate_calc()` did not return any error code, but `nvkm_clk_update()`=
 now
can, so shouldn=E2=80=99t the function return the return value of `nvkm_clk=
_update()`
instead? Or at least do some error checking on what `nvkm_clk_update()`
returned?

>  }
> =20
> @@ -675,7 +681,7 @@ nvkm_clk_ctor(const struct nvkm_clk_func *func, struc=
t nvkm_device *device,
>  	clk->ustate_dc =3D -1;
>  	clk->allow_reclock =3D allow_reclock;
> =20
> -	INIT_WORK(&clk->work, nvkm_pstate_work);
> +	INIT_WORK(&clk->work, nvkm_clk_update_work);
>  	init_waitqueue_head(&clk->wait);
>  	atomic_set(&clk->waiting, 0);
> =20
> --=20
> 2.14.1
>=20
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau

--g4zvxpfemxzt2sgj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEYgBv5JnnDxeItcEHU3l4X80+KSQFAlnaANYACgkQU3l4X80+
KSSrFQ//aNxb/7u5W+D8KGX2fUWX43ghpVE1UFchZ992Mxp4HgWEuUmmY1vc+vi7
crMAgcpsrRgwxr1mnDK0n7KwJr3fa53KupLGt9anyaTJsEOYNme8beBjDU5PgUHA
/K9pQFQQ+nkegkn3489XcdZI3O+WixH+/lg15/fmBfWICodITcOAYw6+wr47UpiT
28cf3qggqonTE4zwW9ZZtR4QvSHXS7ljaf8oLI++UrIuUBY1Fv5rP9oN2+SMwctk
nt0fQJMtMuVEKWFmQRJhnstWxnEBm+X+2LwHYBH0ayalHLcARM+REftNdno4E7oF
NN1RujBZizoZgNo3FcwqKLqmHHmJ9jdXfDX2HPOqAtIy5kOFoGEwEOd6f0+y3HZy
PeJpBQFJwMYiOOShiG9iNrUupSJ5XAvq01GUGt0gC2o3W4ioNuqOrpwoknVZOqBv
TOxFGuEf1cKyOtvPe4fAAPq0jVrn1N7g0o8AqHuwPKfW1qyPu1LVjPhRtEO46xaB
erTSTXk4eZ5MGWoF36QEpUst7Z0VHHV9caD8c4ktTWi/O1btR68hLS50fE7TTOgq
1hUZbLf7I1KfOTU37WHTuX02V0mlT3sgUqc37Qvk3A4rfUhytOfrTE3IwQgGMAdW
SmR4YtP8iLr9eJtZo0aJ8jdSSgBajab5GERZdOajJ9ai1/2/Nrs=
=qMYK
-----END PGP SIGNATURE-----

--g4zvxpfemxzt2sgj--

--===============1494203572==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1494203572==--

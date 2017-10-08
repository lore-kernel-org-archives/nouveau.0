From: Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org>
Subject: Re: [RFC PATCH 06/29] clk: Make pstate a pointer to
 nvkm_pstate
Date: Sun, 8 Oct 2017 13:47:33 +0200
Message-ID: <20171008114733.ypjk3vyimyj3bt6i@pmoreau.org>
References: <20170915171129.5009-1-karolherbst@gmail.com>
 <20170915171129.5009-7-karolherbst@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0471003943=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20170915171129.5009-7-karolherbst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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


--===============0471003943==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="24rasl2utzfs3b77"
Content-Disposition: inline


--24rasl2utzfs3b77
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The patch seems fine but I found it super confusing that sometimes `pstate`=
 is
a pointer (for example `clk->pstate`), sometimes it is an int (for example
`args->v0.pstate`).

On 2017-09-15 =E2=80=94 17:11, Karol Herbst wrote:
> We will access the current cstate at least every second and this saves us
> some CPU cycles looking them up every second.
>=20
> v2: Rewording commit message.
>=20
> Signed-off-by: Karol Herbst <karolherbst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Reviewed-by: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
> ---
>  drm/nouveau/include/nvkm/subdev/clk.h |  4 +++-
>  drm/nouveau/nvkm/engine/device/ctrl.c |  5 ++++-
>  drm/nouveau/nvkm/subdev/clk/base.c    | 17 ++++++++++++-----
>  drm/nouveau/nvkm/subdev/pmu/gk20a.c   | 18 +++++++-----------
>  4 files changed, 26 insertions(+), 18 deletions(-)
>=20
> diff --git a/drm/nouveau/include/nvkm/subdev/clk.h b/drm/nouveau/include/=
nvkm/subdev/clk.h
> index 1340f5b8..ec537e08 100644
> --- a/drm/nouveau/include/nvkm/subdev/clk.h
> +++ b/drm/nouveau/include/nvkm/subdev/clk.h
> @@ -10,6 +10,8 @@ struct nvkm_pll_vals;
>  #define NVKM_CLK_CSTATE_BASE    -2 /* pstate base */
>  #define NVKM_CLK_CSTATE_HIGHEST -3 /* highest possible */
> =20
> +#define NVKM_CLK_PSTATE_DEFAULT -1
> +
>  enum nv_clk_src {
>  	nv_clk_src_crystal,
>  	nv_clk_src_href,
> @@ -95,7 +97,7 @@ struct nvkm_clk {
> =20
>  	struct nvkm_notify pwrsrc_ntfy;
>  	int pwrsrc;
> -	int pstate; /* current */
> +	struct nvkm_pstate *pstate; /* current */
>  	int ustate_ac; /* user-requested (-1 disabled, -2 perfmon) */
>  	int ustate_dc; /* user-requested (-1 disabled, -2 perfmon) */
>  	int astate; /* perfmon adjustment (base) */
> diff --git a/drm/nouveau/nvkm/engine/device/ctrl.c b/drm/nouveau/nvkm/eng=
ine/device/ctrl.c
> index b0ece71a..da70626c 100644
> --- a/drm/nouveau/nvkm/engine/device/ctrl.c
> +++ b/drm/nouveau/nvkm/engine/device/ctrl.c
> @@ -52,7 +52,10 @@ nvkm_control_mthd_pstate_info(struct nvkm_control *ctr=
l, void *data, u32 size)
>  		args->v0.ustate_ac =3D clk->ustate_ac;
>  		args->v0.ustate_dc =3D clk->ustate_dc;
>  		args->v0.pwrsrc =3D clk->pwrsrc;
> -		args->v0.pstate =3D clk->pstate;
> +		if (clk->pstate)
> +			args->v0.pstate =3D clk->pstate->pstate;
> +		else
> +			args->v0.pstate =3D NVKM_CLK_PSTATE_DEFAULT;
>  	} else {
>  		args->v0.count =3D 0;
>  		args->v0.ustate_ac =3D NVIF_CONTROL_PSTATE_INFO_V0_USTATE_DISABLE;
> diff --git a/drm/nouveau/nvkm/subdev/clk/base.c b/drm/nouveau/nvkm/subdev=
/clk/base.c
> index 07d530ed..0d4d9fdf 100644
> --- a/drm/nouveau/nvkm/subdev/clk/base.c
> +++ b/drm/nouveau/nvkm/subdev/clk/base.c
> @@ -271,13 +271,16 @@ nvkm_pstate_prog(struct nvkm_clk *clk, int pstatei)
>  	struct nvkm_pstate *pstate;
>  	int ret, idx =3D 0;
> =20
> +	if (pstatei =3D=3D NVKM_CLK_PSTATE_DEFAULT)
> +		return 0;
> +
>  	list_for_each_entry(pstate, &clk->states, head) {
>  		if (idx++ =3D=3D pstatei)
>  			break;
>  	}
> =20
>  	nvkm_debug(subdev, "setting performance state %d\n", pstatei);
> -	clk->pstate =3D pstatei;
> +	clk->pstate =3D pstate;
> =20
>  	nvkm_pcie_set_link(pci, pstate->pcie_speed, pstate->pcie_width);
> =20
> @@ -306,8 +309,12 @@ nvkm_clk_update_work(struct work_struct *work)
>  		return;
>  	clk->pwrsrc =3D power_supply_is_system_supplied();
> =20
> +	if (clk->pstate)
> +		pstate =3D clk->pstate->pstate;
> +	else
> +		pstate =3D NVKM_CLK_PSTATE_DEFAULT;
>  	nvkm_trace(subdev, "P %d PWR %d U(AC) %d U(DC) %d A %d T %d=C2=B0C\n",
> -		   clk->pstate, clk->pwrsrc, clk->ustate_ac, clk->ustate_dc,
> +		   pstate, clk->pwrsrc, clk->ustate_ac, clk->ustate_dc,
>  		   clk->astate, clk->temp);
> =20
>  	pstate =3D clk->pwrsrc ? clk->ustate_ac : clk->ustate_dc;

In the if-statement following the previous line, the -1 could be replaced by
NVKM_CLK_PSTATE_DEFAULT.

> @@ -315,11 +322,11 @@ nvkm_clk_update_work(struct work_struct *work)
>  		pstate =3D (pstate < 0) ? clk->astate : pstate;

Can `pstate` have negative values other than -1?

>  		pstate =3D min(pstate, clk->state_nr - 1);
>  	} else {
> -		pstate =3D clk->pstate =3D -1;
> +		pstate =3D NVKM_CLK_PSTATE_DEFAULT;

Shouldn=E2=80=99t you also reset `clk->pstate` to NULL? Or maybe it is
`nvkm_pstate_prog()` which should do it if
`pstatei =3D=3D NVKM_CLK_PSTATE_DEFAULT`.

>  	}
> =20
>  	nvkm_trace(subdev, "-> %d\n", pstate);
> -	if (pstate !=3D clk->pstate) {
> +	if (!clk->pstate || pstate !=3D clk->pstate->pstate) {
>  		int ret =3D nvkm_pstate_prog(clk, pstate);
>  		if (ret) {
>  			nvkm_error(subdev, "error setting pstate %d: %d\n",
> @@ -610,7 +617,7 @@ nvkm_clk_init(struct nvkm_subdev *subdev)
>  		return clk->func->init(clk);
> =20
>  	clk->astate =3D clk->state_nr - 1;
> -	clk->pstate =3D -1;
> +	clk->pstate =3D NULL;
>  	clk->temp =3D 90; /* reasonable default value */
>  	nvkm_clk_update(clk, true);
>  	return 0;
> diff --git a/drm/nouveau/nvkm/subdev/pmu/gk20a.c b/drm/nouveau/nvkm/subde=
v/pmu/gk20a.c
> index 05e81855..de579726 100644
> --- a/drm/nouveau/nvkm/subdev/pmu/gk20a.c
> +++ b/drm/nouveau/nvkm/subdev/pmu/gk20a.c
> @@ -55,24 +55,22 @@ gk20a_pmu_dvfs_target(struct gk20a_pmu *pmu, int *sta=
te)
>  	return nvkm_clk_astate(clk, *state, 0, false);
>  }
> =20
> -static void
> -gk20a_pmu_dvfs_get_cur_state(struct gk20a_pmu *pmu, int *state)
> -{
> -	struct nvkm_clk *clk =3D pmu->base.subdev.device->clk;
> -
> -	*state =3D clk->pstate;
> -}
> -
>  static int
>  gk20a_pmu_dvfs_get_target_state(struct gk20a_pmu *pmu,
>  				int *state, int load)
>  {
>  	struct gk20a_pmu_dvfs_data *data =3D pmu->data;
>  	struct nvkm_clk *clk =3D pmu->base.subdev.device->clk;
> +	struct nvkm_pstate *pstate =3D clk->pstate;
>  	int cur_level, level;
> =20
> +	if (!pstate) {
> +		*state =3D 0;
> +		return 1;
> +	}
> +
>  	/* For GK20A, the performance level is directly mapped to pstate */
> -	level =3D cur_level =3D clk->pstate;
> +	level =3D cur_level =3D clk->pstate->pstate;
> =20
>  	if (load > data->p_load_max) {
>  		level =3D min(clk->state_nr - 1, level + (clk->state_nr / 3));
> @@ -142,8 +140,6 @@ gk20a_pmu_dvfs_work(struct nvkm_alarm *alarm)
>  	nvkm_trace(subdev, "utilization =3D %d %%, avg_load =3D %d %%\n",
>  		   utilization, data->avg_load);
> =20
> -	gk20a_pmu_dvfs_get_cur_state(pmu, &state);
> -
>  	if (gk20a_pmu_dvfs_get_target_state(pmu, &state, data->avg_load)) {
>  		nvkm_trace(subdev, "set new state to %d\n", state);
>  		gk20a_pmu_dvfs_target(pmu, &state);
> --=20
> 2.14.1
>=20
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau

--24rasl2utzfs3b77
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEYgBv5JnnDxeItcEHU3l4X80+KSQFAlnaEFEACgkQU3l4X80+
KSShNw//UUp9FY+iwBQVlclWIIpDmOIxa7Iy4bPvghittcigK/GFAknt6dLy5Tea
rwxXuuWLRYdg85Ld72UsM9DSvl26lKmJUQNre9ggq1iZzjPOIL5rYDgWbQW5QyzH
UaE+jbmoxWHfBjoF4HQMLadsK73VibvlctQVsiF73Q83BFahfGxbH6x+iun0oKYW
t0n6fZyCll3XULy5PFTI1kJUaVNKre4hWoLAEVuDjRldWgJapZ3MeOEdkCSZA+hN
Mol+Rywi6/TbluPZAdV8f52Kw0KlF9+6IgE/qU7xQata1a4j9L11jwJhvTIS68Q9
FW/EWmMFApfaqa9CLAWxyj+4sypIFjqeqt7S0SAKwbtNEIY675687h5d4+F2Rh+C
gGVenHRgBDi0GEJk8cmCKjJjAW0Bi3p5VVO9G1HvExRjqSLpX0JwiEEAARvj2r8C
5IkWcJbo79pcOv6pKhkQtWdYKV6LO6z8XWX6+hxsumyusu3/gX+jn0MgfyLfgLa3
33c5f4smpSEPa9Fe+UlRmT8kB/v2noO/5U12yqBrXtNDRwyACvck4PAsyUho+TTd
3OtidTxcrP2Xh01MVQGhI/JLt4GpmlTZ6LfUETRFizIbrcfOL0KmmGLxslFcX7cn
3Y61SzbY7e2rGaOMmACjJXkM4xdgAJW9Ils0zHvjkvPpnmoSVK8=
=mlV1
-----END PGP SIGNATURE-----

--24rasl2utzfs3b77--

--===============0471003943==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0471003943==--

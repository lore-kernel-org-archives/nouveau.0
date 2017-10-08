From: Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org>
Subject: Re: [RFC PATCH 01/29] therm: split return code and value
 in nvkm_get_temp
Date: Sun, 8 Oct 2017 12:16:02 +0200
Message-ID: <20171008101602.oyskycfk3hxditfv@pmoreau.org>
References: <20170915171129.5009-1-karolherbst@gmail.com>
 <20170915171129.5009-2-karolherbst@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0340738843=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20170915171129.5009-2-karolherbst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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


--===============0340738843==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3t6h4rvg36twaznc"
Content-Disposition: inline


--3t6h4rvg36twaznc
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

As you changed the return value of `temp_get()` to solely be the error code=
, or
absence of an error, I would change all those tests that checked whether the
returned value was strictly less, or greater than, 0 to now only compare
against 0 (no error). For example,

  if (therm && therm->attr_get && nvkm_therm_temp_get(therm, &val) < 0)
  if (therm->func->temp_get(therm, &val) >=3D 0)

could become

  if (therm && therm->attr_get && nvkm_therm_temp_get(therm, &val))
  if (!therm->func->temp_get(therm, &val))

to match other error checking code.

More comments below

On 2017-09-15 =E2=80=94 17:11, Karol Herbst wrote:
> The current hwmon code doesn't check if the returned value was actually an
> error.
>=20
> Since Kepler temperature sensors are able to report negative values.

I assume those negative values are not for error reporting, but more if you
buried your GPU in the snow somewhere in the Antarctic and still want a val=
id
temperature to be reported.

> Since Pascal (and maybe earlier) we have sensors with improved precision.
>=20
> Adjust the nvkm_get_temp method to be able to deal with those changes
> and let hwmon return an error properly.
>=20
> Signed-off-by: Karol Herbst <karolherbst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drm/nouveau/include/nvkm/subdev/therm.h |  2 +-
>  drm/nouveau/nouveau_hwmon.c             | 15 +++++++++------
>  drm/nouveau/nvkm/subdev/therm/base.c    | 19 ++++++++++++++-----
>  drm/nouveau/nvkm/subdev/therm/g84.c     | 11 ++++++-----
>  drm/nouveau/nvkm/subdev/therm/gp100.c   |  9 +++++----
>  drm/nouveau/nvkm/subdev/therm/nv40.c    |  9 +++------
>  drm/nouveau/nvkm/subdev/therm/nv50.c    |  9 +++------
>  drm/nouveau/nvkm/subdev/therm/priv.h    |  4 ++--
>  drm/nouveau/nvkm/subdev/therm/temp.c    | 16 ++++++++++++----
>  9 files changed, 55 insertions(+), 39 deletions(-)
>=20
> diff --git a/drm/nouveau/include/nvkm/subdev/therm.h b/drm/nouveau/includ=
e/nvkm/subdev/therm.h
> index 9841f076..8c84017f 100644
> --- a/drm/nouveau/include/nvkm/subdev/therm.h
> +++ b/drm/nouveau/include/nvkm/subdev/therm.h
> @@ -86,7 +86,7 @@ struct nvkm_therm {
>  	int (*attr_set)(struct nvkm_therm *, enum nvkm_therm_attr_type, int);
>  };
> =20
> -int nvkm_therm_temp_get(struct nvkm_therm *);
> +int nvkm_therm_temp_get(struct nvkm_therm *, int *);
>  int nvkm_therm_fan_sense(struct nvkm_therm *);
>  int nvkm_therm_cstate(struct nvkm_therm *, int, int);
> =20
> diff --git a/drm/nouveau/nouveau_hwmon.c b/drm/nouveau/nouveau_hwmon.c
> index 7c965648..f1914d9a 100644
> --- a/drm/nouveau/nouveau_hwmon.c
> +++ b/drm/nouveau/nouveau_hwmon.c
> @@ -326,8 +326,9 @@ nouveau_temp_is_visible(const void *data, u32 attr, i=
nt channel)
>  {
>  	struct nouveau_drm *drm =3D nouveau_drm((struct drm_device *)data);
>  	struct nvkm_therm *therm =3D nvxx_therm(&drm->client.device);
> +	int val;
> =20
> -	if (therm && therm->attr_get && nvkm_therm_temp_get(therm) < 0)
> +	if (therm && therm->attr_get && nvkm_therm_temp_get(therm, &val) < 0)
>  		return 0;
> =20
>  	switch (attr) {
> @@ -421,15 +422,16 @@ nouveau_temp_read(struct device *dev, u32 attr, int=
 channel, long *val)
>  	struct drm_device *drm_dev =3D dev_get_drvdata(dev);
>  	struct nouveau_drm *drm =3D nouveau_drm(drm_dev);
>  	struct nvkm_therm *therm =3D nvxx_therm(&drm->client.device);
> -	int ret;
> +	int ret =3D 0;
> +	int temp;
> =20
>  	if (!therm || !therm->attr_get)
>  		return -EOPNOTSUPP;
> =20
>  	switch (attr) {
>  	case hwmon_temp_input:
> -		ret =3D nvkm_therm_temp_get(therm);
> -		*val =3D ret < 0 ? ret : (ret * 1000);
> +		ret =3D nvkm_therm_temp_get(therm, &temp);
> +		*val =3D temp * 1000;
>  		break;
>  	case hwmon_temp_max:
>  		*val =3D therm->attr_get(therm, NVKM_THERM_ATTR_THRS_DOWN_CLK)
> @@ -459,7 +461,7 @@ nouveau_temp_read(struct device *dev, u32 attr, int c=
hannel, long *val)
>  		return -EOPNOTSUPP;
>  	}
> =20
> -	return 0;
> +	return ret;
>  }
> =20
>  static int
> @@ -713,6 +715,7 @@ nouveau_hwmon_init(struct drm_device *dev)
>  	struct device *hwmon_dev;
>  	int ret =3D 0;
>  	int i =3D 0;
> +	int val;
> =20
>  	hwmon =3D drm->hwmon =3D kzalloc(sizeof(*hwmon), GFP_KERNEL);
>  	if (!hwmon)
> @@ -720,7 +723,7 @@ nouveau_hwmon_init(struct drm_device *dev)
>  	hwmon->dev =3D dev;
> =20
>  	if (therm && therm->attr_get && therm->attr_set) {
> -		if (nvkm_therm_temp_get(therm) >=3D 0)
> +		if (nvkm_therm_temp_get(therm, &val) >=3D 0)
>  			special_groups[i++] =3D &temp1_auto_point_sensor_group;
>  		if (therm->fan_get && therm->fan_get(therm) >=3D 0)
>  			special_groups[i++] =3D &pwm_fan_sensor_group;
> diff --git a/drm/nouveau/nvkm/subdev/therm/base.c b/drm/nouveau/nvkm/subd=
ev/therm/base.c
> index f27fc6d0..8fa691fb 100644
> --- a/drm/nouveau/nvkm/subdev/therm/base.c
> +++ b/drm/nouveau/nvkm/subdev/therm/base.c
> @@ -24,22 +24,26 @@
>  #include "priv.h"
> =20
>  int
> -nvkm_therm_temp_get(struct nvkm_therm *therm)
> +nvkm_therm_temp_get(struct nvkm_therm *therm, int *val)
>  {
>  	if (therm->func->temp_get)
> -		return therm->func->temp_get(therm);
> +		return therm->func->temp_get(therm, val);
>  	return -ENODEV;
>  }
> =20
>  static int
>  nvkm_therm_update_trip(struct nvkm_therm *therm)
>  {
> +	int temp, ret;
>  	struct nvbios_therm_trip_point *trip =3D therm->fan->bios.trip,
>  				       *cur_trip =3D NULL,
>  				       *last_trip =3D therm->last_trip;
> -	u8  temp =3D therm->func->temp_get(therm);
>  	u16 duty, i;
> =20
> +	ret =3D therm->func->temp_get(therm, &temp);
> +	if (ret < 0)
> +		return ret;
> +
>  	/* look for the trip point corresponding to the current temperature */
>  	cur_trip =3D NULL;
>  	for (i =3D 0; i < therm->fan->bios.nr_fan_trip; i++) {
> @@ -67,9 +71,13 @@ static int
>  nvkm_therm_compute_linear_duty(struct nvkm_therm *therm, u8 linear_min_t=
emp,
>                                 u8 linear_max_temp)
>  {
> -	u8  temp =3D therm->func->temp_get(therm);
> +	int temp, ret;
>  	u16 duty;
> =20
> +	ret =3D therm->func->temp_get(therm, &temp);
> +	if (ret < 0)
> +		return ret;
> +
>  	/* handle the non-linear part first */
>  	if (temp < linear_min_temp)
>  		return therm->fan->bios.min_duty;
> @@ -182,6 +190,7 @@ nvkm_therm_fan_mode(struct nvkm_therm *therm, int mod=
e)
>  {
>  	struct nvkm_subdev *subdev =3D &therm->subdev;
>  	struct nvkm_device *device =3D subdev->device;
> +	int val;
>  	static const char *name[] =3D {
>  		"disabled",
>  		"manual",
> @@ -197,7 +206,7 @@ nvkm_therm_fan_mode(struct nvkm_therm *therm, int mod=
e)
>  	/* do not allow automatic fan management if the thermal sensor is
>  	 * not available */
>  	if (mode =3D=3D NVKM_THERM_CTRL_AUTO &&
> -	    therm->func->temp_get(therm) < 0)
> +	    therm->func->temp_get(therm, &val) < 0)
>  		return -EINVAL;
> =20
>  	if (therm->mode =3D=3D mode)
> diff --git a/drm/nouveau/nvkm/subdev/therm/g84.c b/drm/nouveau/nvkm/subde=
v/therm/g84.c
> index 96f8da40..3bb2d829 100644
> --- a/drm/nouveau/nvkm/subdev/therm/g84.c
> +++ b/drm/nouveau/nvkm/subdev/therm/g84.c
> @@ -27,14 +27,15 @@
>  #include <subdev/fuse.h>
> =20
>  int
> -g84_temp_get(struct nvkm_therm *therm)
> +g84_temp_get(struct nvkm_therm *therm, int *val)
>  {
>  	struct nvkm_device *device =3D therm->subdev.device;
> =20
> -	if (nvkm_fuse_read(device->fuse, 0x1a8) =3D=3D 1)
> -		return nvkm_rd32(device, 0x20400);
> -	else
> +	if (nvkm_fuse_read(device->fuse, 0x1a8) !=3D 1)
>  		return -ENODEV;
> +
> +	*val =3D nvkm_rd32(device, 0x20400);

You could allow passing NULL values for `val` for when you are not interest=
ed
by the results, as you did in some places further up.
I would probably check for NULL values for `val`, and for `therm` though it
seems to be an implicit rule that the caller should be the one doing the ch=
eck.

> +	return 0;
>  }
> =20
>  void
> @@ -115,7 +116,7 @@ g84_therm_threshold_hyst_emulation(struct nvkm_therm =
*therm,
>  	}
> =20
>  	/* fix the state (in case someone reprogrammed the alarms) */
> -	cur =3D therm->func->temp_get(therm);
> +	therm->func->temp_get(therm, &cur);

Should there be a check for the return value of the `temp_get()` function h=
ere,
and error out if an error code was returned? In any case, you are the behav=
iour
here, as if `temp_get()` previously returned an error code, the if-statement
would always be false, whereas now, it=E2=80=99s undecided as `cur` will no=
t even be
initialised in that case!

I am not sure whether it should be the caller of `temp_get()` or `temp_get(=
)`
itself which should initialise a default value for the `val` argument (prob=
ably
the latter).

>  	if (new_state =3D=3D NVKM_THERM_THRS_LOWER && cur > thrs->temp)
>  		new_state =3D NVKM_THERM_THRS_HIGHER;
>  	else if (new_state =3D=3D NVKM_THERM_THRS_HIGHER &&
> diff --git a/drm/nouveau/nvkm/subdev/therm/gp100.c b/drm/nouveau/nvkm/sub=
dev/therm/gp100.c
> index 9f0dea3f..d8206748 100644
> --- a/drm/nouveau/nvkm/subdev/therm/gp100.c
> +++ b/drm/nouveau/nvkm/subdev/therm/gp100.c
> @@ -24,7 +24,7 @@
>  #include "priv.h"
> =20
>  static int
> -gp100_temp_get(struct nvkm_therm *therm)
> +gp100_temp_get(struct nvkm_therm *therm, int *val)
>  {
>  	struct nvkm_device *device =3D therm->subdev.device;
>  	struct nvkm_subdev *subdev =3D &therm->subdev;
> @@ -36,9 +36,10 @@ gp100_temp_get(struct nvkm_therm *therm)
>  		nvkm_trace(subdev, "reading temperature from SHADOWed sensor\n");
> =20
>  	/* device valid */
> -	if (tsensor & 0x20000000)
> -		return (inttemp >> 8);
> -	else
> +	if (tsensor & 0x20000000) {
> +		*val =3D inttemp >> 8;
> +		return 0;
> +	} else
>  		return -ENODEV;
>  }
> =20
> diff --git a/drm/nouveau/nvkm/subdev/therm/nv40.c b/drm/nouveau/nvkm/subd=
ev/therm/nv40.c
> index 2c92ffb5..cfd5b215 100644
> --- a/drm/nouveau/nvkm/subdev/therm/nv40.c
> +++ b/drm/nouveau/nvkm/subdev/therm/nv40.c
> @@ -70,7 +70,7 @@ nv40_sensor_setup(struct nvkm_therm *therm)
>  }
> =20
>  static int
> -nv40_temp_get(struct nvkm_therm *therm)
> +nv40_temp_get(struct nvkm_therm *therm, int *val)
>  {
>  	struct nvkm_device *device =3D therm->subdev.device;
>  	struct nvbios_therm_sensor *sensor =3D &therm->bios_sensor;
> @@ -95,11 +95,8 @@ nv40_temp_get(struct nvkm_therm *therm)
>  	core_temp =3D core_temp + sensor->offset_num / sensor->offset_den;
>  	core_temp =3D core_temp + sensor->offset_constant - 8;
> =20
> -	/* reserve negative temperatures for errors */
> -	if (core_temp < 0)
> -		core_temp =3D 0;
> -
> -	return core_temp;
> +	*val =3D core_temp;
> +	return 0;
>  }
> =20
>  static int
> diff --git a/drm/nouveau/nvkm/subdev/therm/nv50.c b/drm/nouveau/nvkm/subd=
ev/therm/nv50.c
> index 9b57b433..62ec4063 100644
> --- a/drm/nouveau/nvkm/subdev/therm/nv50.c
> +++ b/drm/nouveau/nvkm/subdev/therm/nv50.c
> @@ -126,7 +126,7 @@ nv50_sensor_setup(struct nvkm_therm *therm)
>  }
> =20
>  static int
> -nv50_temp_get(struct nvkm_therm *therm)
> +nv50_temp_get(struct nvkm_therm *therm, int *val)
>  {
>  	struct nvkm_device *device =3D therm->subdev.device;
>  	struct nvbios_therm_sensor *sensor =3D &therm->bios_sensor;
> @@ -143,11 +143,8 @@ nv50_temp_get(struct nvkm_therm *therm)
>  	core_temp =3D core_temp + sensor->offset_num / sensor->offset_den;
>  	core_temp =3D core_temp + sensor->offset_constant - 8;
> =20
> -	/* reserve negative temperatures for errors */
> -	if (core_temp < 0)
> -		core_temp =3D 0;
> -
> -	return core_temp;
> +	*val =3D core_temp;
> +	return 0;
>  }
> =20
>  static void
> diff --git a/drm/nouveau/nvkm/subdev/therm/priv.h b/drm/nouveau/nvkm/subd=
ev/therm/priv.h
> index 1f46e371..b325ec5f 100644
> --- a/drm/nouveau/nvkm/subdev/therm/priv.h
> +++ b/drm/nouveau/nvkm/subdev/therm/priv.h
> @@ -91,7 +91,7 @@ struct nvkm_therm_func {
>  	int (*pwm_set)(struct nvkm_therm *, int line, u32, u32);
>  	int (*pwm_clock)(struct nvkm_therm *, int line);
> =20
> -	int (*temp_get)(struct nvkm_therm *);
> +	int (*temp_get)(struct nvkm_therm *, int *);
> =20
>  	int (*fan_sense)(struct nvkm_therm *);
> =20
> @@ -105,7 +105,7 @@ int  nv50_fan_pwm_get(struct nvkm_therm *, int, u32 *=
, u32 *);
>  int  nv50_fan_pwm_set(struct nvkm_therm *, int, u32, u32);
>  int  nv50_fan_pwm_clock(struct nvkm_therm *, int);
> =20
> -int  g84_temp_get(struct nvkm_therm *);
> +int  g84_temp_get(struct nvkm_therm *, int *);
>  void g84_sensor_setup(struct nvkm_therm *);
>  void g84_therm_fini(struct nvkm_therm *);
> =20
> diff --git a/drm/nouveau/nvkm/subdev/therm/temp.c b/drm/nouveau/nvkm/subd=
ev/therm/temp.c
> index ddb2b2c6..5ec2dfb3 100644
> --- a/drm/nouveau/nvkm/subdev/therm/temp.c
> +++ b/drm/nouveau/nvkm/subdev/therm/temp.c
> @@ -86,7 +86,10 @@ nvkm_therm_sensor_event(struct nvkm_therm *therm, enum=
 nvkm_therm_thrs thrs,
>  	static const char * const thresholds[] =3D {
>  		"fanboost", "downclock", "critical", "shutdown"
>  	};
> -	int temperature =3D therm->func->temp_get(therm);
> +	int temperature;
> +
> +	if (therm->func->temp_get(therm, &temperature) < 0)
> +		return;
> =20
>  	if (thrs < 0 || thrs > 3)
>  		return;
> @@ -140,7 +143,10 @@ nvkm_therm_threshold_hyst_polling(struct nvkm_therm =
*therm,
>  {
>  	enum nvkm_therm_thrs_direction direction;
>  	enum nvkm_therm_thrs_state prev_state, new_state;
> -	int temp =3D therm->func->temp_get(therm);
> +	int temp;
> +
> +	if (therm->func->temp_get(therm, &temp) < 0)
> +		return;
> =20
>  	prev_state =3D nvkm_therm_sensor_get_threshold_state(therm, thrs_name);
> =20
> @@ -166,6 +172,7 @@ alarm_timer_callback(struct nvkm_alarm *alarm)
>  	struct nvbios_therm_sensor *sensor =3D &therm->bios_sensor;
>  	struct nvkm_timer *tmr =3D therm->subdev.device->timer;
>  	unsigned long flags;
> +	int val;
> =20
>  	spin_lock_irqsave(&therm->sensor.alarm_program_lock, flags);
> =20
> @@ -185,7 +192,7 @@ alarm_timer_callback(struct nvkm_alarm *alarm)
>  	spin_unlock_irqrestore(&therm->sensor.alarm_program_lock, flags);
> =20
>  	/* schedule the next poll in one second */
> -	if (therm->func->temp_get(therm) >=3D 0)
> +	if (therm->func->temp_get(therm, &val) >=3D 0)
>  		nvkm_timer_alarm(tmr, 1000000000ULL, alarm);
>  }
> =20
> @@ -227,9 +234,10 @@ nvkm_therm_sensor_fini(struct nvkm_therm *therm, boo=
l suspend)
>  void
>  nvkm_therm_sensor_preinit(struct nvkm_therm *therm)
>  {
> +	int val;
>  	const char *sensor_avail =3D "yes";
> =20
> -	if (therm->func->temp_get(therm) < 0)
> +	if (therm->func->temp_get(therm, &val) < 0)
>  		sensor_avail =3D "no";
> =20
>  	nvkm_debug(&therm->subdev, "internal sensor: %s\n", sensor_avail);
> --=20
> 2.14.1
>=20
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau

--3t6h4rvg36twaznc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEYgBv5JnnDxeItcEHU3l4X80+KSQFAlnZ+t4ACgkQU3l4X80+
KSTSQQ/+IyiRTvwEoJOqr+avBP17ETH9wcnRiOuaScjhm9/2k4ki7dmXn723N++0
48o45qmQmQKjJH0QLgdCB+Jb8NWS+FqRlnU8IiGx3tGLvmLV/9vOdiUPIp8SWNLQ
doblOfpyF6sy0UzziNzHq4Lagha4yMRjSm+OtAbSYCfIZuTiBUfhoqe6XPDVOKCI
nVYCmltyuLySK6GQjU4XEwiTmvkAEBSQC8HYn4hGqJDDpfyDO7rMwcssRWU7Dju5
Ime190DMbV2ZaaePCfVMZEmY4qtshePGhNSkfFF6Tjq0l2IlZpcJJIxOdZ3fYkrJ
/U94HCNRpsg+Dz5tHqi2Sz/V1P0OrBiJziCd7/aBVXMAUD3zVDU+bLIVXaB58j6J
4ebNKJWFYF4RxjXi4ry2fjB3Z2q5pBbylvX7GacZMLyotOH3L2lV9Ib3uFTBfhJk
A5tg3Ztmye5C50lu/gLMTR968dsVc5Lyk92GAf+KQdYoqyDN9c8JZPA7OLrzMoy3
I2fuzqXI+RGL/v/CL90vkIrbkYY2EWpxQ9Lzb4Q22vawS0omipcNL7qrTo3k2Q1S
XhjDaz7NGOe7pOTz3dGlpuNTv90M26h6PGLedSlWS1qkKD0KRs7xN+rocqM9tQPl
9EBDFr/UjeedYQ8NYedg+w+W14PPd+Hk74PWlzpnJ8LZVHaj0gY=
=GrCm
-----END PGP SIGNATURE-----

--3t6h4rvg36twaznc--

--===============0340738843==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0340738843==--

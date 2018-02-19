From: Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org>
Subject: Re: [PATCH v2] bl: fix backlight regression
Date: Mon, 19 Feb 2018 17:28:07 +0100
Message-ID: <20180219162806.gtnvaawwm7n6njzr@pmoreau.org>
References: <20180219160945.10411-1-kherbst@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0586663504=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20180219160945.10411-1-kherbst-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Karol Herbst <kherbst-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0586663504==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="njdagqhjgapcbjk6"
Content-Disposition: inline


--njdagqhjgapcbjk6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

A few words about why this change is needed would be nice, as well as what
changed since the v1 (well, looking back to your original patch, absolutely
everything changed :-D).

On 2018-02-19 =E2=80=94 17:09, Karol Herbst wrote:
> fixes d9c0aadc5aa241df26ce8301d34a8418919fb5ae

The formatting does not follow the kernel guidelines, see
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Doc=
umentation/process/submitting-patches.rst?id=3D91ab883eb21325ad80f3473633f7=
94c78ac87f51#n183
Also, you might want to use the commit hash from Linus=E2=80=99 tree, rathe=
r than from
Ben=E2=80=99s out-of-tree module.

>=20
> Suggested-by: Ben Skeggs <skeggsb-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Karol Herbst <kherbst-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---
>  drm/nouveau/nouveau_backlight.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/drm/nouveau/nouveau_backlight.c b/drm/nouveau/nouveau_backli=
ght.c
> index 380f3402..55172655 100644
> --- a/drm/nouveau/nouveau_backlight.c
> +++ b/drm/nouveau/nouveau_backlight.c
> @@ -134,7 +134,7 @@ nv50_get_intensity(struct backlight_device *bd)
>  	struct nouveau_encoder *nv_encoder =3D bl_get_data(bd);
>  	struct nouveau_drm *drm =3D nouveau_drm(nv_encoder->base.base.dev);
>  	struct nvif_object *device =3D &drm->client.device.object;
> -	int or =3D nv_encoder->or;
> +	int or =3D ffs(nv_encoder->dcb->or) - 1;

Since you have that change in a few places, wouldn=E2=80=99t it make sense =
to have it
in an helper function, that given an nv_encoder object would give you back =
the
correct or value? The function wouldn=E2=80=99t be doing much, I agree, but=
 it would be
less error-prone to forgetting the -1 or using ffs in some cases.

Pierre

>  	u32 div =3D 1025;
>  	u32 val;
> =20
> @@ -149,7 +149,7 @@ nv50_set_intensity(struct backlight_device *bd)
>  	struct nouveau_encoder *nv_encoder =3D bl_get_data(bd);
>  	struct nouveau_drm *drm =3D nouveau_drm(nv_encoder->base.base.dev);
>  	struct nvif_object *device =3D &drm->client.device.object;
> -	int or =3D nv_encoder->or;
> +	int or =3D ffs(nv_encoder->dcb->or) - 1;
>  	u32 div =3D 1025;
>  	u32 val =3D (bd->props.brightness * div) / 100;
> =20
> @@ -170,7 +170,7 @@ nva3_get_intensity(struct backlight_device *bd)
>  	struct nouveau_encoder *nv_encoder =3D bl_get_data(bd);
>  	struct nouveau_drm *drm =3D nouveau_drm(nv_encoder->base.base.dev);
>  	struct nvif_object *device =3D &drm->client.device.object;
> -	int or =3D nv_encoder->or;
> +	int or =3D ffs(nv_encoder->dcb->or) - 1;
>  	u32 div, val;
> =20
>  	div  =3D nvif_rd32(device, NV50_PDISP_SOR_PWM_DIV(or));
> @@ -188,7 +188,7 @@ nva3_set_intensity(struct backlight_device *bd)
>  	struct nouveau_encoder *nv_encoder =3D bl_get_data(bd);
>  	struct nouveau_drm *drm =3D nouveau_drm(nv_encoder->base.base.dev);
>  	struct nvif_object *device =3D &drm->client.device.object;
> -	int or =3D nv_encoder->or;
> +	int or =3D ffs(nv_encoder->dcb->or) - 1;
>  	u32 div, val;
> =20
>  	div =3D nvif_rd32(device, NV50_PDISP_SOR_PWM_DIV(or));
> @@ -228,7 +228,7 @@ nv50_backlight_init(struct drm_connector *connector)
>  			return -ENODEV;
>  	}
> =20
> -	if (!nvif_rd32(device, NV50_PDISP_SOR_PWM_CTL(nv_encoder->or)))
> +	if (!nvif_rd32(device, NV50_PDISP_SOR_PWM_CTL(ffs(nv_encoder->dcb->or) =
- 1)))
>  		return 0;
> =20
>  	if (drm->client.device.info.chipset <=3D 0xa0 ||
> --=20
> 2.14.3
>=20
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau

--njdagqhjgapcbjk6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEuCp/qmebDh5BvKefO2dY27124hoFAlqK+xIACgkQO2dY2712
4hoaPA//Yh+7iupnxmIgwOoZTRLrWD0ZZqFi2vszgzhLbEG6vD0uhBhnfjKpCz+t
kt1XZGkvozlWDvrxa5ca/rdRhcDJaWP86COMBEWjlbyCaEmbZXq2ZPpblSxg86z4
1TlTASoBABhX1jdWSNjjU9zC1/6aEdbbbTHE5dWuO+tyzwVjdKWOGPRbU4tEiSxZ
wYq2y1AdoW1Pdxwkow9XHfNq15z2VojBFVUqDzgICUpilRPHO2MQfEG5WwfHg35D
ti29ZeCsACH9GuG+cUQe1dzN+/PCAADmkY59vd8SfWm2lA3ZwFPeYCBCh5JtyseB
w2J+us2f0hAEqWvT7o4jDVt47QZD31JLoTdMKdKa2gx0kuoEUfKYc/CeB9ZHYDkL
ib8Eu4fj57a1BnMca8Xr/wKIU5k7YrG+dI9sNnVlks3IULxIOaozm6wzM+LOUe0p
HSdsnXHQuBGKPBmEnHGDfvxoPA0Oxal0t7VzxjiXpyF3bIh5VZGdWMl4BdrTwcbA
+SBBm+7vnotRmdBtFalV2V/XC73Ro8l7H/+mnoybsug/X2DbFmPOiU93H2fIasXi
1UPGYSIUM5tbMumzpiYLKiadl0hnq4zHPBgsv2N6e8FKabACXBsCG1M5OyYhgR4L
+rckmbPkJIZkU8Kr1arASWK11R/Xoyn/uV5IBDCZJFpEQlf/1qM=
=1Agu
-----END PGP SIGNATURE-----

--njdagqhjgapcbjk6--

--===============0586663504==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0586663504==--

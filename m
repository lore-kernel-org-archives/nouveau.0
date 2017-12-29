From: Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau/hwmon: Uninitialized variables in
 sysfs
Date: Fri, 29 Dec 2017 22:56:32 +0100
Message-ID: <20171229215631.zrcmfrni7k644wpz@pmoreau.org>
References: <20170717081711.4mj76r6qf2de4em6@mwanda>
 <20170722121322.7jig7u3i22bde4uf@pmoreau.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1800082222=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20170722121322.7jig7u3i22bde4uf-WLoDKDh+7sdAfugRpC6u6w@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org


--===============1800082222==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xtlnfec2iqprdlpz"
Content-Disposition: inline


--xtlnfec2iqprdlpz
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Ping: this can still be an issue today as kstrtol() & co haven=E2=80=99t ch=
anged their
possible return value since the patch was written.

On 2017-07-22 =E2=80=94 14:13, Pierre Moreau wrote:
> Reviewed-by: Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org>
>=20
> On 2017-07-17 =E2=80=94 11:17, Dan Carpenter wrote:
> > kstrtol() and friends can return -EINVAL or -ERANGE.  We have to test
> > for both, otherwise the value is possibly uninitialized.  Also in some
> > of these files we accidentally return "count" on error instead of a
> > negative error code.
> >=20
> > Signed-off-by: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
> >=20
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_hwmon.c b/drivers/gpu/drm/=
nouveau/nouveau_hwmon.c
> > index 7c965648df80..5e75af91c446 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_hwmon.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_hwmon.c
> > @@ -68,9 +68,11 @@ nouveau_hwmon_set_temp1_auto_point1_temp(struct devi=
ce *d,
> >  	struct nouveau_drm *drm =3D nouveau_drm(dev);
> >  	struct nvkm_therm *therm =3D nvxx_therm(&drm->client.device);
> >  	long value;
> > +	int ret;
> > =20
> > -	if (kstrtol(buf, 10, &value) =3D=3D -EINVAL)
> > -		return count;
> > +	ret =3D kstrtol(buf, 10, &value);
> > +	if (ret)
> > +		return ret;
> > =20
> >  	therm->attr_set(therm, NVKM_THERM_ATTR_THRS_FAN_BOOST,
> >  			value / 1000);
> > @@ -101,9 +103,11 @@ nouveau_hwmon_set_temp1_auto_point1_temp_hyst(stru=
ct device *d,
> >  	struct nouveau_drm *drm =3D nouveau_drm(dev);
> >  	struct nvkm_therm *therm =3D nvxx_therm(&drm->client.device);
> >  	long value;
> > +	int ret;
> > =20
> > -	if (kstrtol(buf, 10, &value) =3D=3D -EINVAL)
> > -		return count;
> > +	ret =3D kstrtol(buf, 10, &value);
> > +	if (ret)
> > +		return ret;
> > =20
> >  	therm->attr_set(therm, NVKM_THERM_ATTR_THRS_FAN_BOOST_HYST,
> >  			value / 1000);
> > @@ -156,8 +160,9 @@ nouveau_hwmon_set_pwm1_min(struct device *d, struct=
 device_attribute *a,
> >  	long value;
> >  	int ret;
> > =20
> > -	if (kstrtol(buf, 10, &value) =3D=3D -EINVAL)
> > -		return -EINVAL;
> > +	ret =3D kstrtol(buf, 10, &value);
> > +	if (ret)
> > +		return ret;
> > =20
> >  	ret =3D therm->attr_set(therm, NVKM_THERM_ATTR_FAN_MIN_DUTY, value);
> >  	if (ret < 0)
> > @@ -179,8 +184,9 @@ nouveau_hwmon_set_pwm1_max(struct device *d, struct=
 device_attribute *a,
> >  	long value;
> >  	int ret;
> > =20
> > -	if (kstrtol(buf, 10, &value) =3D=3D -EINVAL)
> > -		return -EINVAL;
> > +	ret =3D kstrtol(buf, 10, &value);
> > +	if (ret)
> > +		return ret;
> > =20
> >  	ret =3D therm->attr_set(therm, NVKM_THERM_ATTR_FAN_MAX_DUTY, value);
> >  	if (ret < 0)
> > _______________________________________________
> > Nouveau mailing list
> > Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> > https://lists.freedesktop.org/mailman/listinfo/nouveau



> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau


--xtlnfec2iqprdlpz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEYgBv5JnnDxeItcEHU3l4X80+KSQFAlpGug8ACgkQU3l4X80+
KSSTtQ//Xl2itYd0bJDcq9POeG6cnvNDx+ACfJwk4ya21eJb0H8qraYgBc/2mCab
NvxsXmEXVJt0eouCYgNkTMLTTYuKjuDFY1cmICNuVBCuu90Esi4g0k6TFlGXIWNL
+gKcXNPnjb8ywCG69omGUGVyxw8l06Dny1KJQAPYJNRfd8+EuUDB5qco6lQQq+H/
ReeryvAN6KeC/8WTXv4Wj2uG0cbWtjafyc2zGrm30o+r96Lo/BoNfctbYQauX3Ce
Ghkn3BHBzYmXTJuIV2ae4E2x7T0GetEXRIgm08Mnci4rZJVJiH9hBa9qTlsPUXtj
HnE7BxxlUuGs9MICXPW4g7hUV0AzppPFqbnrpo90NbmdhAuw6jo5/r/FlvG1ahwG
6wcRwl9tYBjzILxO9qeDUF94z6OEdWxZGCMDnTprMYVPYSxI5AZKcY+lC807Al4B
Ux4LPAvKByBl2Z6QfXMHluV1gVNP0qDA7pVoZnpUfAzxBDROzsVdbM1y8BcZMcEt
3a/n1W5UENUbWZhiknHsDEibqIAUnsISxzhJ4noVxkaqmV75Eht57ads4JzcflQ+
IqVXfNC8Fimy5tyGhEiBCfr1RYVtVOXu20RjMRVvWxgMwpNSjjkNcDOY/kr+aCwH
A3bIlU83reQWz5yZ/42ihBZUEp/WSUVF3E708M2v64Yzub06NaU=
=ymkf
-----END PGP SIGNATURE-----

--xtlnfec2iqprdlpz--

--===============1800082222==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1800082222==--

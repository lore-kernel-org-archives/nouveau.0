From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] disp/gf119-: avoid creating non-existent heads
Date: Tue, 4 Jul 2017 08:02:15 +1000
Message-ID: <54829522-1ad0-641d-41ef-69402b047d2b@gmail.com>
References: <20170703170626.9330-1-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1069101325=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20170703170626.9330-1-imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1069101325==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="5RTfb6dNNQGcwGrisnW8CrgwxE7MGDtXI"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--5RTfb6dNNQGcwGrisnW8CrgwxE7MGDtXI
Content-Type: multipart/mixed; boundary="Tqo2XHwaAPcNXIHDd3rxk9VQrgR6LoViU";
 protected-headers="v1"
From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Message-ID: <54829522-1ad0-641d-41ef-69402b047d2b-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Nouveau] [PATCH] disp/gf119-: avoid creating non-existent heads
References: <20170703170626.9330-1-imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
In-Reply-To: <20170703170626.9330-1-imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>

--Tqo2XHwaAPcNXIHDd3rxk9VQrgR6LoViU
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 07/04/2017 03:06 AM, Ilia Mirkin wrote:
> We assume that each board has 4 heads for GF119+. However this is not
> necessarily true - in the case of a GP108 board, the register indicated=

> that there were only 2.
>=20
> Bugzilla: https://bugs.freedesktop.org/show_bug.cgi?id=3D101601
> Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
> ---
>=20
> I'm not extremely happy about the fact that we have to duplicate the he=
ad count
> in both the nv50_display logic for creating DRM-side CRTC's, as well as=
 the
> nvkm-side logic for creating heads. However I don't immediately see an =
easy way
> around it without creating a nvif ioctl to get the number of heads.
Yeah, I have WIP stuff from long ago that would make this nicer, but for
now it's fine to do what you've done here.

>=20
>  drm/nouveau/nv50_display.c               | 8 +++++---
>  drm/nouveau/nvkm/engine/disp/gf119.c     | 2 +-
>  drm/nouveau/nvkm/engine/disp/headgf119.c | 4 +++-
>  3 files changed, 9 insertions(+), 5 deletions(-)
>=20
> diff --git a/drm/nouveau/nv50_display.c b/drm/nouveau/nv50_display.c
> index e3132a2c..e2170efb 100644
> --- a/drm/nouveau/nv50_display.c
> +++ b/drm/nouveau/nv50_display.c
> @@ -4443,11 +4443,13 @@ nv50_display_create(struct drm_device *dev)
> =20
>  	/* create crtc objects to represent the hw heads */
>  	if (disp->disp->oclass >=3D GF110_DISP)
> -		crtcs =3D nvif_rd32(&device->object, 0x022448);
> +		crtcs =3D nvif_rd32(&device->object, 0x612004) & 0xf;
>  	else
> -		crtcs =3D 2;
> +		crtcs =3D 0x3;
> =20
> -	for (i =3D 0; i < crtcs; i++) {
> +	for (i =3D 0; i < fls(crtcs); i++) {
> +		if (!(crtcs & (1 << i)))
> +			continue;
>  		ret =3D nv50_head_create(dev, i);
>  		if (ret)
>  			goto out;
> diff --git a/drm/nouveau/nvkm/engine/disp/gf119.c b/drm/nouveau/nvkm/en=
gine/disp/gf119.c
> index d8765b57..415987e9 100644
> --- a/drm/nouveau/nvkm/engine/disp/gf119.c
> +++ b/drm/nouveau/nvkm/engine/disp/gf119.c
> @@ -168,7 +168,7 @@ int
>  gf119_disp_new_(const struct nv50_disp_func *func, struct nvkm_device =
*device,
>  		int index, struct nvkm_disp **pdisp)
>  {
> -	u32 heads =3D nvkm_rd32(device, 0x022448);
> +	u32 heads =3D fls(nvkm_rd32(device, 0x612004) & 0xf);
>  	return nv50_disp_new_(func, device, index, heads, pdisp);
I'd drop this change.  I suspect 0x022448 is still the "maximum head
count" register, and that 0x612004 is just a disable mask.

>  }
> =20
> diff --git a/drm/nouveau/nvkm/engine/disp/headgf119.c b/drm/nouveau/nvk=
m/engine/disp/headgf119.c
> index b3355275..8d44bdf6 100644
> --- a/drm/nouveau/nvkm/engine/disp/headgf119.c
> +++ b/drm/nouveau/nvkm/engine/disp/headgf119.c
> @@ -92,5 +92,7 @@ gf119_head =3D {
>  int
>  gf119_head_new(struct nvkm_disp *disp, int id)
>  {
> -	return nvkm_head_new_(&gf119_head, disp, id);
> +	if (nvkm_rd32(disp->engine.subdev.device, 0x612004) & 0xf & (1 << id)=
)
> +		return nvkm_head_new_(&gf119_head, disp, id);
> +	return 0;
>  }
>=20


--Tqo2XHwaAPcNXIHDd3rxk9VQrgR6LoViU--

--5RTfb6dNNQGcwGrisnW8CrgwxE7MGDtXI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEETp/uv2nr9kIVth0/dgucYlCSkfsFAllavugACgkQdgucYlCS
kfsVrhAA4HHG2IMfctEc23pNl1tetEZTbkoR2cRV3KgzmOFpZGvUcB19szzPw108
Mzb4Os5mQMSMDZKO2miWBtzTR0z/XblEf93uWYGjvsSR5PJMTMedbRR0ii2Wu/Ie
kY8clRkmEsumyf9jVAT6MbPRKV5oem/cKM89epQN2i0x7HczCcP1HTQmMuqIWjPr
tc8iLJvBERls4stB8kQi0noyNKzseqBLLo2hhLXaUYiyR3axVeCCJoE+njOWxI33
GJzLzjUJYNO52WI+xD1YmfrMpKYbXXMMzcNoBKKl1mwidlQ71pic17N0mVhdF3OI
hT0Gk/5G1Z/wjYerbnILx9y0qB6pSi0/Yas2FML5TLD0paYac90g40xQMRpncYPl
XfPdePFqI+UOM0ADW/kOA7gIyEL7/zKV9pePHdk7YHyIxIul5+1pVkQ+UsFW1REN
jYoN/UkYOJTX9ehhbyPD2GqZrr86log76xNI8BXh3e/qvGJFo38Bjk79YTg8I9nU
YjM2HPTkMOlPfzTJA0AZm41jSVc8baNFQ+P8pgPh4xDxBXF9etVDC3C8QJPlm7I5
2r+d3Od54WiAeeucQW+pTtkupmf5d0M5ZR6Uw4hOlU5oTaGNNIcDNOwAFPwoq3iw
ZuanX99Z+uiQ2H3c+ZNhpwOMqAD0BSy9dc2xrIIRyePSlfHO7r8=
=+KGo
-----END PGP SIGNATURE-----

--5RTfb6dNNQGcwGrisnW8CrgwxE7MGDtXI--

--===============1069101325==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1069101325==--

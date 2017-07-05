From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] secboot/acr352: reset PMU after secboot
Date: Wed, 5 Jul 2017 11:23:47 +1000
Message-ID: <85f35af5-8ecc-63be-cd26-6b1566d5b3b0@gmail.com>
References: <20170704173523.5308-1-karolherbst@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0309701790=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20170704173523.5308-1-karolherbst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
--===============0309701790==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="0AtjoU1aJQEOETIWvKbpt3ncAsTnnK1kx"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--0AtjoU1aJQEOETIWvKbpt3ncAsTnnK1kx
Content-Type: multipart/mixed; boundary="ttD2Xk2BMJJrmXC84ggHtatVliDdRGLWX";
 protected-headers="v1"
From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Message-ID: <85f35af5-8ecc-63be-cd26-6b1566d5b3b0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Nouveau] [PATCH] secboot/acr352: reset PMU after secboot
References: <20170704173523.5308-1-karolherbst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
In-Reply-To: <20170704173523.5308-1-karolherbst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

--ttD2Xk2BMJJrmXC84ggHtatVliDdRGLWX
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 07/05/2017 03:35 AM, Karol Herbst wrote:
> This is needed for using Nouveaus PMU image after performing secboot. T=
his will
> be helpfull for Maxwell2 reclocking on boards without externally contro=
lled
> fans like on most laptops or fanless boards.
I get the idea in principal, but have some concerns:

- Does this screw up re-running secboot during channel recovery (ie.
page fault on gr)?
- What about the running of the unload blob?

It makes me angry that we even have to think about doing stuff like this!=
 :P

Ben.

>=20
> Signed-off-by: Karol Herbst <karolherbst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drm/nouveau/nvkm/subdev/secboot/acr_r352.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>=20
> diff --git a/drm/nouveau/nvkm/subdev/secboot/acr_r352.c b/drm/nouveau/n=
vkm/subdev/secboot/acr_r352.c
> index a7213542..00095ef8 100644
> --- a/drm/nouveau/nvkm/subdev/secboot/acr_r352.c
> +++ b/drm/nouveau/nvkm/subdev/secboot/acr_r352.c
> @@ -924,6 +924,19 @@ acr_r352_bootstrap(struct acr_r352 *acr, struct nv=
km_secboot *sb)
>  		}
>  	}
> =20
> +	/* reset the PMU if needed */
> +	if (acr->base.boot_falcon =3D=3D NVKM_SECBOOT_FALCON_PMU &&
> +	    !nvkm_secboot_is_managed(sb, NVKM_SECBOOT_FALCON_PMU)) {
> +		struct nvkm_pmu *pmu =3D subdev->device->pmu;
> +		if (pmu) {
> +			ret =3D nvkm_subdev_init(&pmu->subdev);
> +			if (ret < 0) {
> +				nvkm_error(subdev, "Failed to reset PMU\n");
> +				return ret;
> +			}
> +		}
> +	}
> +
>  	return 0;
>  }
> =20
>=20


--ttD2Xk2BMJJrmXC84ggHtatVliDdRGLWX--

--0AtjoU1aJQEOETIWvKbpt3ncAsTnnK1kx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEETp/uv2nr9kIVth0/dgucYlCSkfsFAllcP6MACgkQdgucYlCS
kfuThQ//ZNNoRQoppxIY60zNUYwzWXdnSGRUt/zRp8yPpcOXx7hcE8IxZBZk8SBh
h4kdcFFkVVDSqneynhspIjNHIOdAoWhZxohSeGgAaebFkTuceS3Pv2puCzaEIRx3
RPAkZwD16Gz4aLnaangn/Ctl1Imk9J82MjMvCWBC7fXpeMQuhJv09DQcSoCU7mkx
QRZ2UJ4oVxhMSwElWjvBTSnaX+FQAmlOLWbR1bPRqMFAIBYyGpdRBkHkpm7wJRw8
BIrNnU58dvPArwlB8hQX2d7ALYe/x6wC4nC1KIUggLVpfkm19OoyyBepR6bMukXc
gnuo+PG/a+P4RyyE8CLW/YndqGN5BJ7iSpUf88hUkYVRO4qcBDkAlkMKw/Nw+RXX
JJIksT1Eo5ZcdavK5b9DOwknJQSu1i2WqM8xEBuPf/4/AAoofQJ1POp7PhGeiBQ8
hCYi6KQ/UTsv0mNM1xEbY9eYq7AjXX0nLcwDVfO/Itoi2/DGeOjiR1xM45daMoTb
nb5e0yoVBdHQxZ3+2dBJIPkTYNnMxDgT7PIe5gnffIU2D2mv5+pbRJq/hg0VZAtj
yfGIVVWMH3BlHhDd2pN4xbSM/lbzuOWgWHvCsn1Px5hwubU/QVjcjQevEsf5rd66
5xNj6AHLi5ettJeEu6+F+hG70nlsQwZfv+wSbRTHBlnVdUZhUTk=
=EgTw
-----END PGP SIGNATURE-----

--0AtjoU1aJQEOETIWvKbpt3ncAsTnnK1kx--

--===============0309701790==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0309701790==--

From: Pierre Moreau <contact@pmoreau.org>
Subject: Re: [PATCH] drm/nouveau/mmu: Remove unneeded semicolon
Date: Tue, 17 Dec 2019 18:28:22 +0100
Message-ID: <20191217172822.6ivdgdo7g7dorj2a@pmoreau.org>
References: <1576468096-63366-1-git-send-email-zhengbin13@huawei.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1410055713=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1576468096-63366-1-git-send-email-zhengbin13@huawei.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: zhengbin <zhengbin13@huawei.com>
Cc: airlied@linux.ie, nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, bskeggs@redhat.com
List-Id: nouveau.vger.kernel.org


--===============1410055713==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vgqfymq4dbr4mqye"
Content-Disposition: inline


--vgqfymq4dbr4mqye
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

With the comment further below addressed, this patch is
Reviewed-by: Pierre Moreau <dev@pmoreau.org>

On 2019-12-16 =E2=80=94 11:48, zhengbin wrote:
> Fixes coccicheck warning:
>=20
> drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c:583:2-3: Unneeded semicolon
> drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h:307:2-3: Unneeded semicolon
>=20
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: zhengbin <zhengbin13@huawei.com>
> ---
>  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c | 2 +-
>  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c b/drivers/gpu/=
drm/nouveau/nvkm/subdev/mmu/vmm.c
> index 41640e0..199f94e 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
> @@ -580,7 +580,7 @@ nvkm_vmm_iter(struct nvkm_vmm *vmm, const struct nvkm=
_vmm_page *page,
>  				it.pte[it.lvl]++;
>  			}
>  		}
> -	};
> +	}
>=20
>  	nvkm_vmm_flush(&it);
>  	return ~0ULL;
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h b/drivers/gpu/=
drm/nouveau/nvkm/subdev/mmu/vmm.h
> index 5e55ecb..321bfca 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h
> @@ -304,7 +304,7 @@ int tu102_vmm_new(struct nvkm_mmu *, bool, u64, u64, =
void *, u32,
>  		FILL(VMM, PT, PTEI, _ptes, MAP, _addr);                        \
>  		PTEI +=3D _ptes;                                                 \
>  		PTEN -=3D _ptes;                                                 \
> -	};                                                                     \
> +	}                                                                     \

You are missing one space after the closing curly bracket, to align the
backslash at the end of the line.

Thanks,
Pierre Moreau

>  	nvkm_done((PT)->memory);                                               \
>  } while(0)
>=20
> --
> 2.7.4
>=20
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

--vgqfymq4dbr4mqye
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEej50sMo3avjoHMecTsmfhA5fDzsFAl35EDUACgkQTsmfhA5f
DzuvgQ/8Ctn+W37Q9fWdH1uu0TjXwVACe9zx47KGz8B6af+Jy6eR91sHdjUVjVu3
cZOAgqiwQa8D9FT7/B0Ti2vWofsABbQ254RTRU1yzAn3B+4LMAMg7isGu8Fn3pyB
ZEW2moSGaG+pZBwdesWAl5VRRlGEy0VJ6vys78TooJ6z1ve/GchpFkRfqYYcuIF5
1UrTDbP4QbrijxLjOKh4x3s+jUevbu3oLQVyYv+tLDZ8Pns0OWS453MBJIVIsWg9
7eB4lpP/hXw7g0b4KlgZRIYx6I7+Xu3TvgffprAaldMvtmYurcF3zE3TEivThpPk
8KKk0L2r8xq/7mhVLKq4vBcnOXDTYd6qQodcHWWETpkJf45ixidG+qQSw7AbqaSs
o/h3Pe0W6h1KLjgTWACxlhNZsf+vb187dHi8aLQUKJJyEvABdH08yFbtHZDRKsRj
la4JAiE4sn9wzg4svgp+yZUWIi54jazEdGKTcBti9iT+lC+wh6zwtGWYFrhB8Gz8
eEBjFyepLdNXw8SA2G/rNQ47aIFBLKOaeFP/8BtQjtFfFCnRV3ziNvqNfT8+BZNu
TBtQCs+ior/nrh4EzGMWv39oP6RiJ2VZaaaRbUgyz0JOGKtlFx9+On3DPL/35ud/
ESP3t9TJAzbMet6NAj5D3h07um4NX/APavYnAMIr3S3H3WzTbAE=
=04OF
-----END PGP SIGNATURE-----

--vgqfymq4dbr4mqye--

--===============1410055713==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1410055713==--

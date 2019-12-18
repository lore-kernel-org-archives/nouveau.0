From: Pierre Moreau <dev@pmoreau.org>
Subject: Re: [PATCH v2] drm/nouveau/mmu: Remove unneeded semicolon
Date: Wed, 18 Dec 2019 10:40:01 +0100
Message-ID: <20191218094001.umqwylosqwdjb34k@pmoreau.org>
References: <1576632483-140210-1-git-send-email-zhengbin13@huawei.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1833366741=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1576632483-140210-1-git-send-email-zhengbin13@huawei.com>
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


--===============1833366741==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3hr33hrvabci5dvp"
Content-Disposition: inline


--3hr33hrvabci5dvp
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Pierre Moreau <dev@pmoreau.org>

On 2019-12-18 =E2=80=94 09:28, zhengbin wrote:
> Fixes coccicheck warning:
>=20
> drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c:583:2-3: Unneeded semicolon
> drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h:307:2-3: Unneeded semicolon
>=20
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: zhengbin <zhengbin13@huawei.com>
> ---
> v1->v2: add missing one space after the closing curly bracket
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
> +	}                                                                      \
>  	nvkm_done((PT)->memory);                                               \
>  } while(0)
>=20
> --
> 2.7.4
>=20

--3hr33hrvabci5dvp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEej50sMo3avjoHMecTsmfhA5fDzsFAl358+0ACgkQTsmfhA5f
DzvqcRAAy8qC6dBW9EmMPY2xRDSnuA9S6wmgNM4GTplv+bZ784EypOTut68sDdOg
hD52QwTc4h1B7gkslvZZz32LZp1+Fn9rf1Qo+n16xhleHpiXCSapC9R8TXy1Fg1p
dw6403Ob7WmUkmlUA8D5c+gzR5m4trLfMjWD0YGxZQxZ/AyDAuCA7X+gCy9deYaK
sPnwKfJovZ+7PKp+C8ieqR3wd6MeAjdfgiy6j+0dksJ5FFD3ulAI0Qa2/kQvPLk8
gbiVwPpznmEdEFdDTxmYTA5ARYb+x0o2BvAGzf+Z1UEG/ISGskeeArwaTKLdRMvE
mOWZY/8NTkwKwMMHYX162YKAyCl+b6RgussuOto7FyxGT5P2eWxWAPrs0GlTbVv1
JGvPtUNeBxQF37OeMi1yW0749gBpuPLrG7QwEvEHOataLGESK5K0CL/uHrV4kp9h
MZNbc0lyBC0j6qcFtNLPqV75iwgrURnzKIcYZSBkAj7CgVnuY2CMECtPfv5++Y7Z
UymBnN/mc69V3o4R4SXdxN6odrmliOQjQWsiUQbcFV6CKT0mGODiPKVlnmI/yk2A
O9CgSohUJLPhvbt93Ic/hwO+QufcKhMy6lVVkaTldGbKot/7qGycp/8UwKF+rYWy
BFhrCba7Kzr8WDD5i+n0VgwVYEc/Lg8QvTiMCUTlFZ0lRMcbh+Y=
=2Y8H
-----END PGP SIGNATURE-----

--3hr33hrvabci5dvp--

--===============1833366741==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1833366741==--

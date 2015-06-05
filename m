From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] drm/nouveau: Do not leak client objects
Date: Fri, 5 Jun 2015 13:35:26 +0200
Message-ID: <20150605113525.GF17776@ulmo.nvidia.com>
References: <1413453294-15787-1-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0640389963=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1413453294-15787-1-git-send-email-thierry.reding@gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Ben Skeggs <bskeggs@redhat.com>, nouveau@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org


--===============0640389963==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ULyIDA2m8JTe+TiX"
Content-Disposition: inline


--ULyIDA2m8JTe+TiX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 16, 2014 at 11:54:54AM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>=20
> The memory allocated for a nouveau_cli object in nouveau_cli_create() is
> never freed. Free the memory in nouveau_cli_destroy() to plug this leak.
>=20
> kmemleak recorded this after running a couple of nouveau test programs.
> Note that kmemleak points at drm_open_helper() because for some reason
> it thinks that skipping the first two stack frames is a good idea.
>=20
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_drm.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouv=
eau/nouveau_drm.c
> index 57238076049f..6dc2c915ba6e 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
> @@ -126,6 +126,7 @@ nouveau_cli_destroy(struct nouveau_cli *cli)
>  	nouveau_vm_ref(NULL, &nvkm_client(&cli->base)->vm, NULL);
>  	nvif_client_fini(&cli->base);
>  	usif_client_fini(cli);
> +	kfree(cli);
>  }
> =20
>  static void

Ben, any chance you could pick this up?

Thierry

--ULyIDA2m8JTe+TiX
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIbBAABCAAGBQJVcYl9AAoJEN0jrNd/PrOhctkP9jQu7YNyRlJrWhmQtED1J6JZ
g0Nl5E/zB5MibGiZXMwakAZc1KdV/b/3kVdDq+h1A2Hz60Dn/8N1iiIMmuyBjXTv
suLeIU3MGn4NP7w3CY85HSjJYd2BCOPVu1IfptTyG/ma21CuwuA9M6Gz3l66V+yU
hsNrLqSh/2XG/tBtcDbjQRvf1fWbQbwBy6y0rNN0qjWl795z/Og3wo/Fv+p94Cdk
qMHxtb5KwitTTuSsHkTtCaUY8/b1OUDUEorPbTdBc2ytJ+h7dEVgQJoIFhcebpw0
gXl24lL0rUgD5aBgI9ZQ3ZZB5k+g++JE2AUkHgOK3PLKxvxAlhtNQ0zhNmbUhXrQ
LskNP3i87J6sbkGM6PR7WHerjgh6Z94GIk7IBl7FdlcixkUkO9AVnQBqGg9+cVo7
DNxIS4rGwy9eNGuhYzshBNmfkyHUAivu8rQP4eSYHG+0BvK8yr1PQcVkdUKz4RaC
lrej2ohTqK89kxYrvxS9866USh/5/ry9FUECd3O42P+ZbBnOCqCdtwo/0uulbSep
teMKhTy4xIq2R4WPIn5sBeDoAM7DabyUM4/EeyI7Krphv22bSEna1BrotNFcgcej
vLzVZUa0u30bbcg315SgdQvhcmTsIaFQxmJL3u/Wl2OyQrRmfeTJVCsqnOyEU0gi
XfipWrmjB5Rv2otD0/k=
=cEr6
-----END PGP SIGNATURE-----

--ULyIDA2m8JTe+TiX--

--===============0640389963==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============0640389963==--

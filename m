From: Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org>
Subject: Re: [PATCH v2 2/2] nouveau/bl: Do not register interface
 if Apple GMUX detected
Date: Sun, 1 May 2016 14:35:25 +0200
Message-ID: <20160501123516.GA1324@Thessia>
References: <1460923062-10849-2-git-send-email-pierre.morrow@free.fr>
 <1462105927-4328-1-git-send-email-pierre.morrow@free.fr>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0668463622=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1462105927-4328-1-git-send-email-pierre.morrow-GANU6spQydw@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0668463622==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="v9Ux+11Zm5mwPlX6"
Content-Disposition: inline


--v9Ux+11Zm5mwPlX6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 02:32 PM - May 01 2016, Pierre Moreau wrote:
> The Apple GMUX is the one managing the backlight, so there is no need for
> Nouveau to register its own backlight interface.
>=20
> v2: Do not split information message on two lines as it prevents from gre=
pping
>     it, as pointed out by Hans de Goede

It should be "it, as pointed out by Lukas Wunner", sorry for the mistake=E2=
=80=A6 :-/

Pierre

>=20
> Signed-off-by: Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org>
> ---
>  drm/nouveau/nouveau_backlight.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/drm/nouveau/nouveau_backlight.c b/drm/nouveau/nouveau_backli=
ght.c
> index 41330e4..8429ceb 100644
> --- a/drm/nouveau/nouveau_backlight.c
> +++ b/drm/nouveau/nouveau_backlight.c
> @@ -30,6 +30,7 @@
>   * Register locations derived from NVClock by Roderick Colenbrander
>   */
> =20
> +#include <linux/apple-gmux.h>
>  #include <linux/backlight.h>
>  #include <linux/idr.h>
> =20
> @@ -257,6 +258,11 @@ nouveau_backlight_init(struct drm_device *dev)
>  	struct nvif_device *device =3D &drm->device;
>  	struct drm_connector *connector;
> =20
> +	if (apple_gmux_present()) {
> +		NV_INFO(drm, "Apple GMUX detected: not registering Nouveau backlight i=
nterface");
> +		return 0;
> +	}
> +
>  	INIT_LIST_HEAD(&drm->bl_connectors);
> =20
>  	list_for_each_entry(connector, &dev->mode_config.connector_list, head) {
> --=20
> 2.8.2
>=20
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau

--v9Ux+11Zm5mwPlX6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXJfgNAAoJEI7uMhYTPh3wuDEP/R6hNxuTs67Rkx/Z3UX+xvRd
z7OkTFyhA6alWJMlrq9C3mTZ8NAbY+Sy2UuHYFkEdCPLjEi7smxQgyhMr8BNw4nd
2Me+X7pEbrgqdce42Fbt0xGJeuWTm57sn3bzzApyB1044ZAEcXgnntu5vjV6+3mF
MGWqoJDvA3fRepRLICbPpWinIr0Z8wX4NxGAjv8dAudvJX+seB2tLlHLoz32djPk
znaxixsWy82PU1kOnkscIV+jNfw2VwSxsfSCHS/L/5X71imicu0QCqYfboWaO14m
kzrLhIqmv9ZR7GJaj0mSGHt0vmQOjgSzGvyj7dJ32Y/69FtNQpngYpnluH930AyP
Ki3i0wmAVwExz3tfmQ4gJFWVefPkNAe3xyhf28kppNzQp4S9f4qV/jBJaB1KP7gk
KjFULiZqCQ7DWa5dzppBJ5b1E1ZKngOmCXyTZzJUrijKhYkaTD+iEXCseQyQVH4u
rCszQgpxox98d+E0EePyZHlU1OlA/rjR6OgJgmHsepGu+mOINg5ypEVmLRbBVKrt
kX61wjGJTU6eLNzxikZLzCltlch1MZE20WObE3vfNHGmzX8+3g4TsuX6HSWCys+V
va+4dWgK6H3ag/7YUpxl4++lhdI3vKTH/ZAs+5ZbSR5kBEcwMKvuZLdlS9YhgLvo
ExcSahHqko/mNAzo49jW
=AphS
-----END PGP SIGNATURE-----

--v9Ux+11Zm5mwPlX6--

--===============0668463622==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0668463622==--

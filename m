From: Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau/bl: Fix oops on driver unbind
Date: Mon, 19 Feb 2018 10:38:04 +0100
Message-ID: <20180219093803.3bbevbvd574r7epx@pmoreau.org>
References: <5c682f35ac338efac66416b7670dc01f1ee02676.1518870434.git.lukas@wunner.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2046129442=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <5c682f35ac338efac66416b7670dc01f1ee02676.1518870434.git.lukas-JFq808J9C/izQB+pC5nmwQ@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Lukas Wunner <lukas-JFq808J9C/izQB+pC5nmwQ@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org


--===============2046129442==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sewcbhx4mjncs66m"
Content-Disposition: inline


--sewcbhx4mjncs66m
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

My bad; I did test suspend/resume, but not unbinding. Shouldn=E2=80=99t that
happen on shutdown as well, as the driver gets unloaded? I don=E2=80=99t re=
member
seeing that issue there though.

On 2018-02-17 =E2=80=94 13:40, Lukas Wunner wrote:
> Unbinding nouveau on a dual GPU MacBook Pro oopses because we iterate
> over the bl_connectors list in nouveau_backlight_exit() but skipped
> initializing it in nouveau_backlight_init().  Stacktrace for posterity:
>=20
>     BUG: unable to handle kernel NULL pointer dereference at 000000000000=
0010
>     IP: nouveau_backlight_exit+0x2b/0x70 [nouveau]
>     nouveau_display_destroy+0x29/0x80 [nouveau]
>     nouveau_drm_unload+0x65/0xe0 [nouveau]
>     drm_dev_unregister+0x3c/0xe0 [drm]
>     drm_put_dev+0x2e/0x60 [drm]
>     nouveau_drm_device_remove+0x47/0x70 [nouveau]
>     pci_device_remove+0x36/0xb0
>     device_release_driver_internal+0x157/0x220
>     driver_detach+0x39/0x70
>     bus_remove_driver+0x51/0xd0
>     pci_unregister_driver+0x2a/0xa0
>     nouveau_drm_exit+0x15/0xfb0 [nouveau]
>     SyS_delete_module+0x18c/0x290
>     system_call_fast_compare_end+0xc/0x6f
>=20
> Fixes: b53ac1ee12a3 ("drm/nouveau/bl: Do not register interface if Apple =
GMUX detected")
> Cc: stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org # v4.10+
> Cc: Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org>
> Signed-off-by: Lukas Wunner <lukas-JFq808J9C/izQB+pC5nmwQ@public.gmane.org>
> ---
> I reviewed the patch causing the oops but unfortunately missed this, sorr=
y!
>=20
>  drivers/gpu/drm/nouveau/nouveau_backlight.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nouveau_backlight.c b/drivers/gpu/dr=
m/nouveau/nouveau_backlight.c
> index 380f340204e8..f56f60f695e1 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_backlight.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_backlight.c
> @@ -268,13 +268,13 @@ nouveau_backlight_init(struct drm_device *dev)
>  	struct nvif_device *device =3D &drm->client.device;
>  	struct drm_connector *connector;
> =20
> +	INIT_LIST_HEAD(&drm->bl_connectors);
> +

We could instead have an early return in the exit function if
`apple_gmux_present()` or `drm->bl_connectors` is null, but your current fix
seems better.

Reviewed-by: Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org>

Thank you for the fix!
Pierre

>  	if (apple_gmux_present()) {
>  		NV_INFO(drm, "Apple GMUX detected: not registering Nouveau backlight i=
nterface\n");
>  		return 0;
>  	}
> =20
> -	INIT_LIST_HEAD(&drm->bl_connectors);
> -
>  	list_for_each_entry(connector, &dev->mode_config.connector_list, head) {
>  		if (connector->connector_type !=3D DRM_MODE_CONNECTOR_LVDS &&
>  		    connector->connector_type !=3D DRM_MODE_CONNECTOR_eDP)
> --=20
> 2.15.1
>=20

--sewcbhx4mjncs66m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEuCp/qmebDh5BvKefO2dY27124hoFAlqKmvQACgkQO2dY2712
4hpcCBAAksrSUS8oAe8sIJyWZ20rDIObM0t0Mz34j63Z6l/lOtIXiEwkPRUkKPJh
KGDs/lMkjtoaWM62gS8BD6vxZouwYMBr2cLWtwh6ALNmOdauwxOYJRhIv656k/WV
lad/9eX5H14Nv+K/1ng9ge9aKjWosRDRRTB1MqD0sj6UT2qiFvlTroW9/dlpPM9c
12mtqm5gWNGxwvkBAMzCJwXp1HzPu6jU+RhXQavqDcRbC6S0zunRHWZWBhd0RJdI
Ky+s53g9NacmDFRaooO1ToaQVyZcHd8xuCut/BMnQTO+58rjxhWsGTY+pgUHwHeN
AvJHZUjk3z54f7NZUOp0i3rMTX4PvTeT6W1xhRmXua8rsNIMSMwtsPCpHfFGyzWp
t89pBQ6vPjIKpTDpnJENYdmegQEG5DXKurxXIonPLyk47mr3mWg/slMXX1rckmzT
sbEcLJ2ptdNwrBfQTd0xoVeyhydo+VtsJKbzEXXhk+7C/+Gr5Yz5S3SUtF5ZykZ4
gjTdqPgx/Hmh4ONgWYk9yHXpUabhEfUb/e0pmyw9g3oXQlFkaXdz9qjDJUHo589e
HRrh57Cjs3kyY3dV7CL/x8cXaqodrU2o8pUBYbWWLHL0uYdKnZG5gwFX7iWm97Xf
IOoB8+7MXigbh1nM0G+aX9KO/rr2ND6LN5K9qeN5ANytUHGqwFM=
=FYva
-----END PGP SIGNATURE-----

--sewcbhx4mjncs66m--

--===============2046129442==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============2046129442==--

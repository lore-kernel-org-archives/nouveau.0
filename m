From: Paul Menzel <paulepanter@users.sourceforge.net>
Subject: Re: [PATCH] nouveau: fix acpi edid retrieval
Date: Thu, 08 Nov 2012 21:53:12 +0100
Message-ID: <1352407992.4254.4.camel@mattotaupa>
References: <509BDB9A.5020402@canonical.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1616200277=="
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <509BDB9A.5020402@canonical.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Maarten Lankhorst <maarten.lankhorst@canonical.com>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org


--===============1616200277==
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
	boundary="=-IzH5GgXts9uXO6EzczL8"


--=-IzH5GgXts9uXO6EzczL8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Maarten,


thanks for the patch.


Am Donnerstag, den 08.11.2012, 17:19 +0100 schrieb Maarten Lankhorst:
> Commit c0077061e7ea

Please paste the commit summary for people not having a Git tree at
hand.

> accidentally inverted the logic for nouveau_acpi_edid, causing it to
> only show a connector as connected when the edid could not be retrieved w=
ith acpi.
>=20
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@canonical.com>
> ---
> diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/dr=
m/nouveau/nouveau_connector.c
> index 9a6e2cb..d3595b2 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_connector.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
> @@ -355,7 +355,7 @@ nouveau_connector_detect_lvds(struct drm_connector *c=
onnector, bool force)
>  	 * valid - it's not (rh#613284)
>  	 */
>  	if (nv_encoder->dcb->lvdsconf.use_acpi_for_edid) {
> -		if (!(nv_connector->edid =3D nouveau_acpi_edid(dev, connector))) {
> +		if ((nv_connector->edid =3D nouveau_acpi_edid(dev, connector))) {

One pair of parentheses can go now?

>  			status =3D connector_status_connected;
>  			goto out;
>  		}

Acked-by: Paul Menzel <paulepanter@users.sourceforge.net>


Thanks,

Paul

--=-IzH5GgXts9uXO6EzczL8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEABECAAYFAlCcG7gACgkQPX1aK2wOHVjqegCcDrv+b8WGSziALRLev6lhx0P+
h3kAn0E25G/RZoodowvYkIlw+89En4o1
=pGpj
-----END PGP SIGNATURE-----

--=-IzH5GgXts9uXO6EzczL8--


--===============1616200277==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1616200277==--

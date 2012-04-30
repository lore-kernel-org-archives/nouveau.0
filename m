From: Francisco Jerez <currojerez@riseup.net>
Subject: Re: [Nouveau] [PATCH] nouveau/vieux: only advertise
	supported texture formats
Date: Mon, 30 Apr 2012 20:08:50 +0200
Message-ID: <87lildxfbh.fsf@riseup.net>
References: <1335806214-13903-1-git-send-email-dev@lynxeye.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1526751512=="
Return-path: <mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org>
In-Reply-To: <1335806214-13903-1-git-send-email-dev@lynxeye.de> (Lucas Stach's
	message of "Mon, 30 Apr 2012 19:16:54 +0200")
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/mesa-dev>
List-Post: <mailto:mesa-dev@lists.freedesktop.org>
List-Help: <mailto:mesa-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org
Errors-To: mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org
To: Lucas Stach <dev@lynxeye.de>
Cc: nouveau@lists.freedesktop.org, mesa-dev@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

--===============1526751512==
Content-Type: multipart/signed; boundary="==-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--==-=-=
Content-Type: multipart/mixed; boundary="=-=-="

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Lucas Stach <dev@lynxeye.de> writes:

> Fixes an assertion seen by users.
>
> Signed-off-by: Lucas Stach <dev@lynxeye.de>
> Tested-by: JohnDoe_71Rus on irc
> ---
>  src/mesa/drivers/dri/nouveau/nouveau_context.c |    9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/src/mesa/drivers/dri/nouveau/nouveau_context.c b/src/mesa/dr=
ivers/dri/nouveau/nouveau_context.c
> index 4845767..46c0d70 100644
> --- a/src/mesa/drivers/dri/nouveau/nouveau_context.c
> +++ b/src/mesa/drivers/dri/nouveau/nouveau_context.c
> @@ -117,6 +117,15 @@ nouveau_context_init(struct gl_context *ctx, struct =
nouveau_screen *screen,
>  	nouveau_span_functions_init(ctx);
>  	_mesa_allow_light_in_model(ctx, GL_FALSE);
>=20=20
> +	/* only advertise supported texture formats */
> +	memset(&ctx->TextureFormatSupported, 0,
> +	       sizeof(ctx->TextureFormatSupported));
> +	ctx->TextureFormatSupported[MESA_FORMAT_XRGB8888] =3D true;
> +	ctx->TextureFormatSupported[MESA_FORMAT_ARGB8888] =3D true;
> +	ctx->TextureFormatSupported[MESA_FORMAT_RGB565] =3D true;
> +	ctx->TextureFormatSupported[MESA_FORMAT_Z16] =3D true;
> +	ctx->TextureFormatSupported[MESA_FORMAT_Z24_S8] =3D true;
> +
Hi Lucas,

It's not obvious to me how this works.  AFAIK nouveau doesn't make use
of this array.  And even if it did, the texture formats you're listing
aren't the supported ones.

>  	/* Allocate a hardware channel. */
>  	ret =3D nouveau_object_new(&context_dev(ctx)->object, 0xbeef0000,
>  				 NOUVEAU_FIFO_CHANNEL_CLASS,

--=-=-=--

--==-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iF4EAREIAAYFAk+e1TcACgkQg5k4nX1Sv1vKOAD/f/2sWnhl8ujt3JOixera0QIX
wokSMu+ADXzM5FlbZdoA/3djnmZfxDotrTrVXQH3fcdVBUoHwE8qOzmupoO/VHIe
=cApL
-----END PGP SIGNATURE-----
--==-=-=--

--===============1526751512==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
mesa-dev mailing list
mesa-dev@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/mesa-dev

--===============1526751512==--

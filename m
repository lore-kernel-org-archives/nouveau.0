From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH] nouveau_vieux: add AllocTextureImageBuffer
	implementation
Date: Sun, 06 Oct 2013 13:31:28 -0700
Message-ID: <87vc1ata3j.fsf@riseup.net>
References: <1380875338-25572-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1037518229=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1380875338-25572-1-git-send-email-imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============1037518229==
Content-Type: multipart/signed; boundary="==-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--==-=-=
Content-Type: multipart/mixed; boundary="=-=-="

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> writes:

> This fixes issues where get_rt_format would see a 0 format because the
> nouveau_surface had not been properly initialized. Fixes crash on
> supertuxkart startup (which still fails due to out-of-vram issues).
>
> Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>


Thanks, pushed.

>  src/mesa/drivers/dri/nouveau/nouveau_texture.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/src/mesa/drivers/dri/nouveau/nouveau_texture.c b/src/mesa/dr=
ivers/dri/nouveau/nouveau_texture.c
> index da74e8f..8904389 100644
> --- a/src/mesa/drivers/dri/nouveau/nouveau_texture.c
> +++ b/src/mesa/drivers/dri/nouveau/nouveau_texture.c
> @@ -494,6 +494,14 @@ nouveau_compressed_teximage(struct gl_context *ctx, =
GLuint dims,
>  			 &ctx->Unpack, GL_TRUE);
>  }
>=20=20
> +static GLboolean
> +nouveau_teximage_alloc(struct gl_context *ctx, struct gl_texture_image *=
ti)
> +{
> +	nouveau_teximage(ctx, 3, ti, 0, 0, 0, NULL,
> +			 &ctx->DefaultPacking, GL_FALSE);
> +	return GL_TRUE;
> +}
> +
>  static void
>  nouveau_texsubimage(struct gl_context *ctx, GLint dims,
>  		    struct gl_texture_image *ti,
> @@ -634,6 +642,7 @@ nouveau_texture_functions_init(struct dd_function_tab=
le *functions)
>  	functions->DeleteTexture =3D nouveau_texture_free;
>  	functions->NewTextureImage =3D nouveau_teximage_new;
>  	functions->FreeTextureImageBuffer =3D nouveau_teximage_free;
> +	functions->AllocTextureImageBuffer =3D nouveau_teximage_alloc;
>  	functions->ChooseTextureFormat =3D nouveau_choose_tex_format;
>  	functions->TexImage =3D nouveau_teximage_123d;
>  	functions->TexSubImage =3D nouveau_texsubimage_123d;
> --=20
> 1.8.1.5

--=-=-=--

--==-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iF4EAREIAAYFAlJRyKAACgkQg5k4nX1Sv1u79QEAlF+nGq7QfkMsNwdXXC50D8jQ
PlGqF3ija8a6wG1ojewA/1aYx6Qe4Z2Qx6zbZQdmYdBFON2yppbGQJDfO6R76yLY
=nkcS
-----END PGP SIGNATURE-----
--==-=-=--

--===============1037518229==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1037518229==--

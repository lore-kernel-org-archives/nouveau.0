From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH v2] nouveau: add framebuffer validation
	callback
Date: Wed, 15 Jan 2014 11:02:49 +0100
Message-ID: <87y52hlfzq.fsf@riseup.net>
References: <1389747033-1645-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1385548299=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1389747033-1645-1-git-send-email-imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============1385548299==
Content-Type: multipart/signed; boundary="==-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--==-=-=
Content-Type: multipart/mixed; boundary="=-=-="

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> writes:

> Fixes assertions when trying to attach textures to fbs with formats not
> supported by the render engines.
>
> See https://bugs.freedesktop.org/show_bug.cgi?id=3D73459
>
> Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
> ---
>
> Francisco, thanks for the review. Is this more like what you had in mind?
> Interesting that nv10/nv20 support different-bitness color/depth -- that
> requirement came back for nv30/nv40.
>

Looks good to me,

Reviewed-by: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>

Thanks.

>  src/mesa/drivers/dri/nouveau/nouveau_context.c |  1 +
>  src/mesa/drivers/dri/nouveau/nouveau_fbo.c     | 52 ++++++++++++++++++++=
++++++
>  2 files changed, 53 insertions(+)
>
> diff --git a/src/mesa/drivers/dri/nouveau/nouveau_context.c b/src/mesa/dr=
ivers/dri/nouveau/nouveau_context.c
> index 181c9d0..ec474d4 100644
> --- a/src/mesa/drivers/dri/nouveau/nouveau_context.c
> +++ b/src/mesa/drivers/dri/nouveau/nouveau_context.c
> @@ -187,6 +187,7 @@ nouveau_context_init(struct gl_context *ctx, struct n=
ouveau_screen *screen,
>  	ctx->Extensions.EXT_framebuffer_blit =3D true;
>  	ctx->Extensions.EXT_texture_filter_anisotropic =3D true;
>  	ctx->Extensions.NV_texture_env_combine4 =3D true;
> +	ctx->Const.MaxColorAttachments =3D 1;
>=20=20
>  	return GL_TRUE;
>  }
> diff --git a/src/mesa/drivers/dri/nouveau/nouveau_fbo.c b/src/mesa/driver=
s/dri/nouveau/nouveau_fbo.c
> index 25543e4..427eb00 100644
> --- a/src/mesa/drivers/dri/nouveau/nouveau_fbo.c
> +++ b/src/mesa/drivers/dri/nouveau/nouveau_fbo.c
> @@ -268,6 +268,57 @@ nouveau_finish_render_texture(struct gl_context *ctx,
>  	texture_dirty(rb->TexImage->TexObject);
>  }
>=20=20
> +static int
> +validate_format_bpp(gl_format format)
> +{
> +	switch (format) {
> +	case MESA_FORMAT_XRGB8888:
> +	case MESA_FORMAT_ARGB8888:
> +	case MESA_FORMAT_Z24_S8:
> +		return 32;
> +	case MESA_FORMAT_RGB565:
> +	case MESA_FORMAT_Z16:
> +		return 16;
> +	default:
> +		return 0;
> +	}
> +}
> +
> +static void
> +nouveau_check_framebuffer_complete(struct gl_context *ctx,
> +				   struct gl_framebuffer *fb)
> +{
> +	const struct nouveau_driver *drv =3D context_drv(ctx);
> +	struct gl_renderbuffer_attachment *color =3D
> +		&fb->Attachment[BUFFER_COLOR0];
> +	struct gl_renderbuffer_attachment *depth =3D
> +		&fb->Attachment[BUFFER_DEPTH];
> +	int color_bpp =3D 0, zeta_bpp;
> +
> +	if (color->Type =3D=3D GL_TEXTURE) {
> +		color_bpp =3D validate_format_bpp(
> +				color->Renderbuffer->TexImage->TexFormat);
> +		if (!color_bpp)
> +			goto err;
> +	}
> +
> +	if (depth->Type =3D=3D GL_TEXTURE) {
> +		zeta_bpp =3D validate_format_bpp(
> +				depth->Renderbuffer->TexImage->TexFormat);
> +		if (!zeta_bpp)
> +			goto err;
> +		/* NV04/NV05 requires same bpp-ness for color/zeta */
> +		if (context_chipset(ctx) < 0x10 &&
> +		    color_bpp && color_bpp !=3D zeta_bpp)
> +			goto err;
> +	}
> +
> +	return;
> +err:
> +	fb->_Status =3D GL_FRAMEBUFFER_UNSUPPORTED_EXT;
> +	return;
> +}
> +
>  void
>  nouveau_fbo_functions_init(struct dd_function_table *functions)
>  {
> @@ -279,4 +330,5 @@ nouveau_fbo_functions_init(struct dd_function_table *=
functions)
>  	functions->FramebufferRenderbuffer =3D nouveau_framebuffer_renderbuffer;
>  	functions->RenderTexture =3D nouveau_render_texture;
>  	functions->FinishRenderTexture =3D nouveau_finish_render_texture;
> +	functions->ValidateFramebuffer =3D nouveau_check_framebuffer_complete;
>  }
> --=20
> 1.8.3.2

--=-=-=--

--==-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iF4EAREIAAYFAlLWXMkACgkQg5k4nX1Sv1tElwD9GV3OhWFNqX0YE6+OJnn95Fxc
mnraZXxjbAxXygfyeGEBAJN/YliJeY8ScAAV3cuH0BitkgsQS5SPtyF16be124pd
=9w5V
-----END PGP SIGNATURE-----
--==-=-=--

--===============1385548299==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1385548299==--

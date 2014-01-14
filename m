From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH] nouveau: add framebuffer validation callback
Date: Tue, 14 Jan 2014 11:42:39 +0100
Message-ID: <87ha96n8tc.fsf@riseup.net>
References: <1389381107-13955-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0348209717=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1389381107-13955-1-git-send-email-imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
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

--===============0348209717==
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

Hi Ilia,

>
> In a perfect world I'd have separate callbacks for depth and color, but g=
iven
> the list of supported values, I don't think this matters. Also I used
> st_validate_framebuffer as a template, but I don't know if there can actu=
ally
> be many attachments. Should MaxColorAttachments be set to 1? I think it's=
 set
> to 8 right now.
>
Yes, we should probably set that to one, and that will make the loop in
your nouveau_framebuffer_validate() code unnecessary.

> And there's also an odd nouveau_validate_framebuffer thing in
> nouveau_context.c, but I think that's related to actually
> rendering/invalidating the fb displayed to the screen.
>
That's called before any rendering happens to check if we need to renew
any of the render buffers, e.g. in case the window was resized or
SwapBuffers() was called.  It's rather unfortunate that the name of your
new function is just a permutation of the old one, how about
'nouveau_check_framebuffer_completeness'?

>  src/mesa/drivers/dri/nouveau/nouveau_driver.h |  1 +
>  src/mesa/drivers/dri/nouveau/nouveau_fbo.c    | 38 +++++++++++++++++++++=
++++++
>  src/mesa/drivers/dri/nouveau/nv04_context.c   | 14 ++++++++++
>  src/mesa/drivers/dri/nouveau/nv10_context.c   | 16 +++++++++++
>  src/mesa/drivers/dri/nouveau/nv20_context.c   | 16 +++++++++++
>  5 files changed, 85 insertions(+)
>
> diff --git a/src/mesa/drivers/dri/nouveau/nouveau_driver.h b/src/mesa/dri=
vers/dri/nouveau/nouveau_driver.h
> index e03b2c1..84953da 100644
> --- a/src/mesa/drivers/dri/nouveau/nouveau_driver.h
> +++ b/src/mesa/drivers/dri/nouveau/nouveau_driver.h
> @@ -60,6 +60,7 @@ struct nouveau_driver {
>  			     struct nouveau_surface *dst,
>  			     unsigned mask, unsigned value,
>  			     int dx, int dy, int w, int h);
> +	bool (*is_rt_format_supported)(gl_format format);
>=20=20
>  	nouveau_state_func *emit;
>  	int num_emit;
> diff --git a/src/mesa/drivers/dri/nouveau/nouveau_fbo.c b/src/mesa/driver=
s/dri/nouveau/nouveau_fbo.c
> index 25543e4..fba0d52 100644
> --- a/src/mesa/drivers/dri/nouveau/nouveau_fbo.c
> +++ b/src/mesa/drivers/dri/nouveau/nouveau_fbo.c
> @@ -268,6 +268,43 @@ nouveau_finish_render_texture(struct gl_context *ctx,
>  	texture_dirty(rb->TexImage->TexObject);
>  }
>=20=20
> +static void
> +nouveau_framebuffer_validate(struct gl_context *ctx,
> +			     struct gl_framebuffer *fb)
> +{
> +	const struct nouveau_driver *drv =3D context_drv(ctx);
> +	int i, count =3D 0;
> +
> +	for (i =3D 0; i < ctx->Const.MaxColorAttachments; i++) {
> +		struct gl_renderbuffer_attachment *rba =3D
> +			&fb->Attachment[BUFFER_COLOR0 + i];
> +		if (rba->Type =3D=3D GL_NONE)
> +			continue;
> +
> +		count++;
> +		if (rba->Type !=3D GL_TEXTURE)
> +			continue;
> +
> +		if (!drv->is_rt_format_supported(
> +				    rba->Renderbuffer->TexImage->TexFormat))
> +			goto err;
> +	}
> +	if (count > 1)
> +		goto err;
> +
> +	if (fb->Attachment[BUFFER_DEPTH].Type =3D=3D GL_TEXTURE) {
> +		struct gl_texture_image *ti =3D
> +			fb->Attachment[BUFFER_DEPTH].Renderbuffer->TexImage;
> +		if (!drv->is_rt_format_supported(ti->TexFormat))
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
> @@ -279,4 +316,5 @@ nouveau_fbo_functions_init(struct dd_function_table *=
functions)
>  	functions->FramebufferRenderbuffer =3D nouveau_framebuffer_renderbuffer;
>  	functions->RenderTexture =3D nouveau_render_texture;
>  	functions->FinishRenderTexture =3D nouveau_finish_render_texture;
> +	functions->ValidateFramebuffer =3D nouveau_framebuffer_validate;
>  }
> diff --git a/src/mesa/drivers/dri/nouveau/nv04_context.c b/src/mesa/drive=
rs/dri/nouveau/nv04_context.c
> index c198c03..665cadd 100644
> --- a/src/mesa/drivers/dri/nouveau/nv04_context.c
> +++ b/src/mesa/drivers/dri/nouveau/nv04_context.c
> @@ -199,11 +199,25 @@ fail:
>  	return NULL;
>  }
>=20=20
> +static bool
> +nv04_is_rt_format_supported(gl_format format)
> +{
> +	switch (format) {
> +	case MESA_FORMAT_XRGB8888:
> +	case MESA_FORMAT_ARGB8888:
> +	case MESA_FORMAT_RGB565:
> +		return true;
> +	default:
> +		return false;
> +	}
> +}
> +

You're missing the depth/stencil formats here.  nv04 is kind of annoying
because the depth and color buffers have to be of the same bpp, so if
the color buffer is 32bpp we should only accept MESA_FORMAT_Z24_S8, if
it's 16bpp MESA_FORMAT_Z16.  You probably want to implement that logic
in the top-level ValidateFramebuffer() hook instead of using a driver
call-back mechanism, because (aside from the bpp limitation) we're going
to expose the same set of formats on all generations.

Thanks.

>  const struct nouveau_driver nv04_driver =3D {
>  	.context_create =3D nv04_context_create,
>  	.context_destroy =3D nv04_context_destroy,
>  	.surface_copy =3D nv04_surface_copy,
>  	.surface_fill =3D nv04_surface_fill,
> +	.is_rt_format_supported =3D nv04_is_rt_format_supported,
>  	.emit =3D (nouveau_state_func[]) {
>  		nv04_defer_control,
>  		nouveau_emit_nothing,
> diff --git a/src/mesa/drivers/dri/nouveau/nv10_context.c b/src/mesa/drive=
rs/dri/nouveau/nv10_context.c
> index 1918f12..9c5cfcb 100644
> --- a/src/mesa/drivers/dri/nouveau/nv10_context.c
> +++ b/src/mesa/drivers/dri/nouveau/nv10_context.c
> @@ -492,11 +492,27 @@ fail:
>  	return NULL;
>  }
>=20=20
> +static bool
> +nv10_is_rt_format_supported(gl_format format)
> +{
> +	switch (format) {
> +	case MESA_FORMAT_XRGB8888:
> +	case MESA_FORMAT_ARGB8888:
> +	case MESA_FORMAT_RGB565:
> +	case MESA_FORMAT_Z16:
> +	case MESA_FORMAT_Z24_S8:
> +		return true;
> +	default:
> +		return false;
> +	}
> +}
> +
>  const struct nouveau_driver nv10_driver =3D {
>  	.context_create =3D nv10_context_create,
>  	.context_destroy =3D nv10_context_destroy,
>  	.surface_copy =3D nv04_surface_copy,
>  	.surface_fill =3D nv04_surface_fill,
> +       .is_rt_format_supported =3D nv10_is_rt_format_supported,
>  	.emit =3D (nouveau_state_func[]) {
>  		nv10_emit_alpha_func,
>  		nv10_emit_blend_color,
> diff --git a/src/mesa/drivers/dri/nouveau/nv20_context.c b/src/mesa/drive=
rs/dri/nouveau/nv20_context.c
> index 1d77132..e233025 100644
> --- a/src/mesa/drivers/dri/nouveau/nv20_context.c
> +++ b/src/mesa/drivers/dri/nouveau/nv20_context.c
> @@ -500,11 +500,27 @@ fail:
>  	return NULL;
>  }
>=20=20
> +static bool
> +nv20_is_rt_format_supported(gl_format format)
> +{
> +	switch (format) {
> +	case MESA_FORMAT_XRGB8888:
> +	case MESA_FORMAT_ARGB8888:
> +	case MESA_FORMAT_RGB565:
> +	case MESA_FORMAT_Z16:
> +	case MESA_FORMAT_Z24_S8:
> +		return true;
> +	default:
> +		return false;
> +	}
> +}
> +
>  const struct nouveau_driver nv20_driver =3D {
>  	.context_create =3D nv20_context_create,
>  	.context_destroy =3D nv20_context_destroy,
>  	.surface_copy =3D nv04_surface_copy,
>  	.surface_fill =3D nv04_surface_fill,
> +	.is_rt_format_supported =3D nv20_is_rt_format_supported,
>  	.emit =3D (nouveau_state_func[]) {
>  		nv10_emit_alpha_func,
>  		nv10_emit_blend_color,
> --=20
> 1.8.3.2

--=-=-=--

--==-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iF4EAREIAAYFAlLVFJ8ACgkQg5k4nX1Sv1sYWAD9G+PEFmof6fG6Ws0BDQ/2iUJj
Qphu/j1l+h21m60znYgA/291g0IS7oGPbBrVm+dNS3UFRLxZE8VAeWJ+dH2MPnMb
=ElPR
-----END PGP SIGNATURE-----
--==-=-=--

--===============0348209717==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0348209717==--

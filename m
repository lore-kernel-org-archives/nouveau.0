From: Francisco Jerez <currojerez@riseup.net>
Subject: Re: [PATCH 10/21] nouveau: Add support for
	ARB_sampler_object
Date: Tue, 12 Jun 2012 01:37:29 +0200
Message-ID: <87mx49ctdy.fsf@riseup.net>
References: <1339397983-31219-1-git-send-email-pauli.nieminen@linux.intel.com>
	<1339397983-31219-19-git-send-email-pauli.nieminen@linux.intel.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0383018201=="
Return-path: <mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org>
In-Reply-To: <1339397983-31219-19-git-send-email-pauli.nieminen@linux.intel.com>
	(Pauli Nieminen's message of "Mon, 11 Jun 2012 09:59:28 +0300")
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/mesa-dev>
List-Post: <mailto:mesa-dev@lists.freedesktop.org>
List-Help: <mailto:mesa-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org
Errors-To: mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org
To: Pauli Nieminen <pauli.nieminen@linux.intel.com>
Cc: mesa-dev@lists.freedesktop.org, nouveau@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

--===============0383018201==
Content-Type: multipart/signed; boundary="==-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--==-=-=
Content-Type: multipart/mixed; boundary="=-=-="

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Pauli Nieminen <pauli.nieminen@linux.intel.com> writes:

> ARB_sampler_object is very simple software only extension to support.
> I want to make it mandator extension for Mesa drivers to allow meta
> module to use it.
>
> This patch add support for the extension to nouveau. It is completely
> untested search and replace patch. I hope someone with old NV hardware
> could give a try that there is no regressions and ARB_sampler_object
> tests passes.
>

Hey,

I don't think this patch is enough to get ARB_sampler_objects working.
First you need some way to find out that the current sampler has changed
so the nvXX_emit_tex_obj() hooks are re-executed before rendering.

Ideally it would be done using some kind of driver hook that would be
called when a new sampler is bound (the implementation would be a
one-liner, see nouveau_tex_parameter() in nouveau_state.c).  Apparently
glBindSampler() already sets the _NEW_TEXTURE flag so I guess another
option could be to re-validate all the texture context for all texture
units anytime it's seen set, though I'm not sure that would be a good
idea.

> Signed-off-by: Pauli Nieminen <pauli.nieminen@linux.intel.com>
> CC: nouveau@lists.freedesktop.org
> ---
>  src/mesa/drivers/dri/nouveau/nv04_state_tex.c |   22 ++++++++++++-------=
---
>  src/mesa/drivers/dri/nouveau/nv10_state_tex.c |   23 +++++++++++++------=
----
>  src/mesa/drivers/dri/nouveau/nv20_state_tex.c |   25 ++++++++++++++-----=
------
>  3 files changed, 39 insertions(+), 31 deletions(-)
>
> diff --git a/src/mesa/drivers/dri/nouveau/nv04_state_tex.c b/src/mesa/dri=
vers/dri/nouveau/nv04_state_tex.c
> index 807e2f3..e4d695a 100644
> --- a/src/mesa/drivers/dri/nouveau/nv04_state_tex.c
> +++ b/src/mesa/drivers/dri/nouveau/nv04_state_tex.c
> @@ -32,6 +32,7 @@
>  #include "nv_object.xml.h"
>  #include "nv04_3d.xml.h"
>  #include "nv04_driver.h"
> +#include "main/samplerobj.h"
>=20=20
>  static uint32_t
>  get_tex_format(struct gl_texture_image *ti)
> @@ -67,6 +68,7 @@ nv04_emit_tex_obj(struct gl_context *ctx, int emit)
>  	if (ctx->Texture.Unit[i]._ReallyEnabled) {
>  		struct gl_texture_object *t =3D ctx->Texture.Unit[i]._Current;
>  		struct gl_texture_image *ti =3D t->Image[0][t->BaseLevel];
> +		const struct gl_sampler_object *sa =3D _mesa_get_samplerobj(ctx, i);
>  		int lod_max =3D 1, lod_bias =3D 0;
>=20=20
>  		if (!nouveau_texture_validate(ctx, t))
> @@ -74,26 +76,26 @@ nv04_emit_tex_obj(struct gl_context *ctx, int emit)
>=20=20
>  		s =3D &to_nouveau_texture(t)->surfaces[t->BaseLevel];
>=20=20
> -		if (t->Sampler.MinFilter !=3D GL_NEAREST &&
> -		    t->Sampler.MinFilter !=3D GL_LINEAR) {
> -			lod_max =3D CLAMP(MIN2(t->Sampler.MaxLod, t->_MaxLambda),
> +		if (sa->MinFilter !=3D GL_NEAREST &&
> +		    sa->MinFilter !=3D GL_LINEAR) {
> +			lod_max =3D CLAMP(MIN2(sa->MaxLod, t->_MaxLambda),
>  					0, 15) + 1;
>=20=20
>  			lod_bias =3D CLAMP(ctx->Texture.Unit[i].LodBias +
> -					 t->Sampler.LodBias, -16, 15) * 8;
> +					 sa->LodBias, -16, 15) * 8;
>  		}
>=20=20
> -		format |=3D nvgl_wrap_mode(t->Sampler.WrapT) << 28 |
> -			nvgl_wrap_mode(t->Sampler.WrapS) << 24 |
> +		format |=3D nvgl_wrap_mode(sa->WrapT) << 28 |
> +			nvgl_wrap_mode(sa->WrapS) << 24 |
>  			ti->HeightLog2 << 20 |
>  			ti->WidthLog2 << 16 |
>  			lod_max << 12 |
>  			get_tex_format(ti);
>=20=20
> -		filter |=3D log2i(t->Sampler.MaxAnisotropy) << 31 |
> -			nvgl_filter_mode(t->Sampler.MagFilter) << 28 |
> -			log2i(t->Sampler.MaxAnisotropy) << 27 |
> -			nvgl_filter_mode(t->Sampler.MinFilter) << 24 |
> +		filter |=3D log2i(sa->MaxAnisotropy) << 31 |
> +			nvgl_filter_mode(sa->MagFilter) << 28 |
> +			log2i(sa->MaxAnisotropy) << 27 |
> +			nvgl_filter_mode(sa->MinFilter) << 24 |
>  			(lod_bias & 0xff) << 16;
>=20=20
>  	} else {
> diff --git a/src/mesa/drivers/dri/nouveau/nv10_state_tex.c b/src/mesa/dri=
vers/dri/nouveau/nv10_state_tex.c
> index b467bb3..3b76d66 100644
> --- a/src/mesa/drivers/dri/nouveau/nv10_state_tex.c
> +++ b/src/mesa/drivers/dri/nouveau/nv10_state_tex.c
> @@ -31,6 +31,7 @@
>  #include "nv10_3d.xml.h"
>  #include "nouveau_util.h"
>  #include "nv10_driver.h"
> +#include "main/samplerobj.h"
>=20=20
>  void
>  nv10_emit_tex_gen(struct gl_context *ctx, int emit)
> @@ -159,6 +160,7 @@ nv10_emit_tex_obj(struct gl_context *ctx, int emit)
>  	struct gl_texture_object *t;
>  	struct nouveau_surface *s;
>  	struct gl_texture_image *ti;
> +	const struct gl_sampler_object *sa;
>  	uint32_t tx_format, tx_filter, tx_enable;
>=20=20
>  	PUSH_RESET(push, BUFCTX_TEX(i));
> @@ -172,22 +174,23 @@ nv10_emit_tex_obj(struct gl_context *ctx, int emit)
>  	t =3D ctx->Texture.Unit[i]._Current;
>  	s =3D &to_nouveau_texture(t)->surfaces[t->BaseLevel];
>  	ti =3D t->Image[0][t->BaseLevel];
> +	sa =3D _mesa_get_samplerobj(ctx, i);
>=20=20
>  	if (!nouveau_texture_validate(ctx, t))
>  		return;
>=20=20
>  	/* Recompute the texturing registers. */
> -	tx_format =3D nvgl_wrap_mode(t->Sampler.WrapT) << 28
> -		| nvgl_wrap_mode(t->Sampler.WrapS) << 24
> +	tx_format =3D nvgl_wrap_mode(sa->WrapT) << 28
> +		| nvgl_wrap_mode(sa->WrapS) << 24
>  		| ti->HeightLog2 << 20
>  		| ti->WidthLog2 << 16
>  		| 5 << 4 | 1 << 12;
>=20=20
> -	tx_filter =3D nvgl_filter_mode(t->Sampler.MagFilter) << 28
> -		| nvgl_filter_mode(t->Sampler.MinFilter) << 24;
> +	tx_filter =3D nvgl_filter_mode(sa->MagFilter) << 28
> +		| nvgl_filter_mode(sa->MinFilter) << 24;
>=20=20
>  	tx_enable =3D NV10_3D_TEX_ENABLE_ENABLE
> -		| log2i(t->Sampler.MaxAnisotropy) << 4;
> +		| log2i(sa->MaxAnisotropy) << 4;
>=20=20
>  	if (t->Target =3D=3D GL_TEXTURE_RECTANGLE) {
>  		BEGIN_NV04(push, NV10_3D(TEX_NPOT_PITCH(i)), 1);
> @@ -200,11 +203,11 @@ nv10_emit_tex_obj(struct gl_context *ctx, int emit)
>  		tx_format |=3D get_tex_format_pot(ti);
>  	}
>=20=20
> -	if (t->Sampler.MinFilter !=3D GL_NEAREST &&
> -	    t->Sampler.MinFilter !=3D GL_LINEAR) {
> -		int lod_min =3D t->Sampler.MinLod;
> -		int lod_max =3D MIN2(t->Sampler.MaxLod, t->_MaxLambda);
> -		int lod_bias =3D t->Sampler.LodBias
> +	if (sa->MinFilter !=3D GL_NEAREST &&
> +	    sa->MinFilter !=3D GL_LINEAR) {
> +		int lod_min =3D sa->MinLod;
> +		int lod_max =3D MIN2(sa->MaxLod, t->_MaxLambda);
> +		int lod_bias =3D sa->LodBias
>  			+ ctx->Texture.Unit[i].LodBias;
>=20=20
>  		lod_max =3D CLAMP(lod_max, 0, 15);
> diff --git a/src/mesa/drivers/dri/nouveau/nv20_state_tex.c b/src/mesa/dri=
vers/dri/nouveau/nv20_state_tex.c
> index d8bfdf2..ffbc2df 100644
> --- a/src/mesa/drivers/dri/nouveau/nv20_state_tex.c
> +++ b/src/mesa/drivers/dri/nouveau/nv20_state_tex.c
> @@ -31,6 +31,7 @@
>  #include "nv20_3d.xml.h"
>  #include "nouveau_util.h"
>  #include "nv20_driver.h"
> +#include "main/samplerobj.h"
>=20=20
>  void
>  nv20_emit_tex_gen(struct gl_context *ctx, int emit)
> @@ -163,6 +164,7 @@ nv20_emit_tex_obj(struct gl_context *ctx, int emit)
>  	struct gl_texture_object *t;
>  	struct nouveau_surface *s;
>  	struct gl_texture_image *ti;
> +	const struct gl_sampler_object *sa;
>  	uint32_t tx_format, tx_filter, tx_wrap, tx_enable;
>=20=20
>  	PUSH_RESET(push, BUFCTX_TEX(i));
> @@ -178,6 +180,7 @@ nv20_emit_tex_obj(struct gl_context *ctx, int emit)
>  	t =3D ctx->Texture.Unit[i]._Current;
>  	s =3D &to_nouveau_texture(t)->surfaces[t->BaseLevel];
>  	ti =3D t->Image[0][t->BaseLevel];
> +	sa =3D _mesa_get_samplerobj(ctx, i);
>=20=20
>  	if (!nouveau_texture_validate(ctx, t))
>  		return;
> @@ -190,16 +193,16 @@ nv20_emit_tex_obj(struct gl_context *ctx, int emit)
>  		| NV20_3D_TEX_FORMAT_NO_BORDER
>  		| 1 << 16;
>=20=20
> -	tx_wrap =3D nvgl_wrap_mode(t->Sampler.WrapR) << 16
> -		| nvgl_wrap_mode(t->Sampler.WrapT) << 8
> -		| nvgl_wrap_mode(t->Sampler.WrapS) << 0;
> +	tx_wrap =3D nvgl_wrap_mode(sa->WrapR) << 16
> +		| nvgl_wrap_mode(sa->WrapT) << 8
> +		| nvgl_wrap_mode(sa->WrapS) << 0;
>=20=20
> -	tx_filter =3D nvgl_filter_mode(t->Sampler.MagFilter) << 24
> -		| nvgl_filter_mode(t->Sampler.MinFilter) << 16
> +	tx_filter =3D nvgl_filter_mode(sa->MagFilter) << 24
> +		| nvgl_filter_mode(sa->MinFilter) << 16
>  		| 2 << 12;
>=20=20
>  	tx_enable =3D NV20_3D_TEX_ENABLE_ENABLE
> -		| log2i(t->Sampler.MaxAnisotropy) << 4;
> +		| log2i(sa->MaxAnisotropy) << 4;
>=20=20
>  	if (t->Target =3D=3D GL_TEXTURE_RECTANGLE) {
>  		BEGIN_NV04(push, NV20_3D(TEX_NPOT_PITCH(i)), 1);
> @@ -212,11 +215,11 @@ nv20_emit_tex_obj(struct gl_context *ctx, int emit)
>  		tx_format |=3D get_tex_format_pot(ti);
>  	}
>=20=20
> -	if (t->Sampler.MinFilter !=3D GL_NEAREST &&
> -	    t->Sampler.MinFilter !=3D GL_LINEAR) {
> -		int lod_min =3D t->Sampler.MinLod;
> -		int lod_max =3D MIN2(t->Sampler.MaxLod, t->_MaxLambda);
> -		int lod_bias =3D t->Sampler.LodBias
> +	if (sa->MinFilter !=3D GL_NEAREST &&
> +	    sa->MinFilter !=3D GL_LINEAR) {
> +		int lod_min =3D sa->MinLod;
> +		int lod_max =3D MIN2(sa->MaxLod, t->_MaxLambda);
> +		int lod_bias =3D sa->LodBias
>  			+ ctx->Texture.Unit[i].LodBias;
>=20=20
>  		lod_max =3D CLAMP(lod_max, 0, 15);

--=-=-=--

--==-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iF4EAREIAAYFAk/WgT0ACgkQg5k4nX1Sv1uIiAD/abtuKYArIwsXTdxv+a1YOzuk
AC6QukF06uOFIP4MvNcBAJ6wY8rC1VSkeow7Uu9ouimLSZLSI1l7rBW4SA/gxVug
=dQZ8
-----END PGP SIGNATURE-----
--==-=-=--

--===============0383018201==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
mesa-dev mailing list
mesa-dev@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/mesa-dev

--===============0383018201==--

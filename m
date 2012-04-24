From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: Re: [WIP PATCH] dri/nouveau: Add S3TC support for nv20.
Date: Tue, 24 Apr 2012 17:22:44 +0200
Message-ID: <87ty09upbv.fsf@riseup.net>
References: <4F7F0E8A.6020403@seznam.cz> <1335270921.13186.7.camel@nisroch>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1674592306=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1335270921.13186.7.camel@nisroch> (Ben Skeggs's message of "Tue,
	24 Apr 2012 22:35:21 +1000")
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Viktor =?utf-8?Q?Novotn=C3=BD?= <noviktor-9Vj9tDbzfuSlVyrhU4qvOw@public.gmane.org>
Cc: nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

--===============1674592306==
Content-Type: multipart/signed; boundary="==-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--==-=-=
Content-Type: multipart/mixed; boundary="=-=-="

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:

> On Fri, 2012-04-06 at 17:40 +0200, Viktor Novotn=C3=BD wrote:
>> ---
>> Hi,
> Hey Viktor!
>
> Thanks for the patch!
>
Hey,

>>=20
>> this is still WIP, but already passes piglit's s3tc-teximage, s3tc-texsu=
bimage and fbo-generatemipmap-formats(s3tc tests)
>> and even Wolfenstein:Enemy-Territory works on my nv25. It's based on Ben=
's newlib branch. I have few issues though:
>> 1) So far it needs libtxc_dxtn, but I might expose the s3tc extensions e=
ven without encoder using driconf option -
>>    Is that desirable?
>> 2) Looking at blob's dedma'd valgrind-mmt dumps it seems blob uses pitch=
 no smaller than 64 in miptree,
>>    but for me everything works as it is. Does it make any difference?
>> 2) I am not sure about computing the offsets in teximage_map - it works =
like this, but can somebody confirm it's ok?
>> 3) If somebody can give me some feedback on the style etc., please do.
>> 4) S3TC texture seem to be supported also on nv10, I have nv11 somewhere=
 so I might be able to add support to it too,

Yeah, it should be trivial to add support for it on nv10 now that you've
got the generic support code working.

> Curro, are you able to take a look over this and give Viktor some
> feedback?  You're probably best acquainted with the vieux code :)
>
> Ben.
>
>>    but I don't have nv04, then again, I think it might not support S3TC?

No, it doesn't.

>>=20
>> If I you think the patch is mostly OK, I will process your feedback, spl=
it generic and nv20 specific part and resend it.
>>=20
Yes, it's mostly fine aside from a few style issues.  See the comments
inline.

>> Regards
>> 	Viktor
>>=20
>>  src/mesa/drivers/dri/nouveau/nouveau_surface.c |   14 ++-
>>  src/mesa/drivers/dri/nouveau/nouveau_texture.c |  143 +++++++++++++++++=
+-----
>>  src/mesa/drivers/dri/nouveau/nouveau_util.h    |   19 +++
>>  src/mesa/drivers/dri/nouveau/nv04_surface.c    |   17 +++-
>>  src/mesa/drivers/dri/nouveau/nv20_context.c    |    4 +
>>  src/mesa/drivers/dri/nouveau/nv20_state_tex.c  |   10 ++
>>  6 files changed, 172 insertions(+), 35 deletions(-)
>>=20
>> diff --git a/src/mesa/drivers/dri/nouveau/nouveau_surface.c b/src/mesa/d=
rivers/dri/nouveau/nouveau_surface.c
>> index f252114..349000a 100644
>> --- a/src/mesa/drivers/dri/nouveau/nouveau_surface.c
>> +++ b/src/mesa/drivers/dri/nouveau/nouveau_surface.c
>> @@ -28,6 +28,8 @@
>>  #include "nouveau_context.h"
>>  #include "nouveau_util.h"
>>=20=20
>> +#include "main/formats.h"
>> +
>>  void
>>  nouveau_surface_alloc(struct gl_context *ctx, struct nouveau_surface *s,
>>  		      enum nouveau_surface_layout layout,
>> @@ -36,6 +38,8 @@ nouveau_surface_alloc(struct gl_context *ctx, struct n=
ouveau_surface *s,
>>  {
>>  	union nouveau_bo_config config =3D {};
>>  	int ret, cpp =3D _mesa_get_format_bytes(format);
>> +	int pitch =3D _mesa_format_row_stride(format, width);
>> +	unsigned size;
>>=20=20
>>  	nouveau_bo_ref(NULL, &s->bo);
>>=20=20
>> @@ -45,7 +49,7 @@ nouveau_surface_alloc(struct gl_context *ctx, struct n=
ouveau_surface *s,
>>  		.width =3D width,
>>  		.height =3D height,
>>  		.cpp =3D cpp,
>> -		.pitch =3D width * cpp,
>> +		.pitch =3D pitch,

No need for the additional local variables:
| .pitch =3D _mesa_format_row_stride(format, width),

>>  	};
>>=20=20
>>  	if (layout =3D=3D TILED) {
>> @@ -64,8 +68,12 @@ nouveau_surface_alloc(struct gl_context *ctx, struct =
nouveau_surface *s,
>>  		s->pitch =3D align(s->pitch, 64);
>>  	}
>>=20=20
>> -	ret =3D nouveau_bo_new(context_dev(ctx), flags, 0, s->pitch * height,
>> -			     &config, &s->bo);
>> +	if (_mesa_is_format_compressed(format))
>> +		size =3D s->pitch * nouveau_format_get_nblocksy(format, height);
>> +	else
>> +		size =3D s->pitch * height;
>> +
>> +	ret =3D nouveau_bo_new(context_dev(ctx), flags, 0, size, &config, &s->=
bo);

No need for the conditional here:

| ret =3D nouveau_bo_new(context_dev(ctx), flags, 0,
|                      s->pitch * get_format_blocksy(format, height),
|                      &config, &s->bo);"

>>  	assert(!ret);
>>  }
>>=20=20
>> diff --git a/src/mesa/drivers/dri/nouveau/nouveau_texture.c b/src/mesa/d=
rivers/dri/nouveau/nouveau_texture.c
>> index 643b890..52f0259 100644
>> --- a/src/mesa/drivers/dri/nouveau/nouveau_texture.c
>> +++ b/src/mesa/drivers/dri/nouveau/nouveau_texture.c
>> @@ -91,6 +91,7 @@ nouveau_teximage_map(struct gl_context *ctx, struct gl=
_texture_image *ti,
>>  	if (s->bo) {
>>  		if (!(access & GL_MAP_READ_BIT) &&
>>  		    nouveau_pushbuf_refd(context_push(ctx), s->bo)) {
>> +			unsigned size;
>>  			/*
>>  			 * Heuristic: use a bounce buffer to pipeline
>>  			 * teximage transfers.
>> @@ -104,7 +105,8 @@ nouveau_teximage_map(struct gl_context *ctx, struct =
gl_texture_image *ti,
>>  			nti->transfer.x =3D x;
>>  			nti->transfer.y =3D y;
>>=20=20
>> -			nti->base.Map =3D nouveau_get_scratch(ctx, st->pitch * h,
>> +			size =3D nouveau_format_get_nblocksx(st->format, h) * st->pitch;
>> +			nti->base.Map =3D nouveau_get_scratch(ctx, size,
>>  						       &st->bo, &st->offset);
>>=20=20
>>  		} else {
>> @@ -120,7 +122,10 @@ nouveau_teximage_map(struct gl_context *ctx, struct=
 gl_texture_image *ti,
>>  				assert(!ret);
>>  			}
>>=20=20
>> -			nti->base.Map =3D s->bo->map + y * s->pitch + x * s->cpp;
>> +			nti->base.Map =3D s->bo->map +
>> +				nouveau_format_get_nblocksy(s->format, y) * s->pitch +
>> +				nouveau_format_get_nblocksx(s->format, x) * s->cpp;
>> +
>>  		}
>>  	}
>>  }
>> @@ -166,6 +171,7 @@ nouveau_map_texture_image(struct gl_context *ctx,
>>  	if (s->bo) {
>>  		if (!(mode & GL_MAP_READ_BIT) &&
>>  		    nouveau_pushbuf_refd(context_push(ctx), s->bo)) {
>> +			unsigned size;
>>  			/*
>>  			 * Heuristic: use a bounce buffer to pipeline
>>  			 * teximage transfers.
>> @@ -179,8 +185,8 @@ nouveau_map_texture_image(struct gl_context *ctx,
>>  			nti->transfer.x =3D x;
>>  			nti->transfer.y =3D y;
>>=20=20
>> -			*map =3D nouveau_get_scratch(ctx, st->pitch * h,
>> -						   &st->bo, &st->offset);
>> +			size =3D nouveau_format_get_nblocksy(st->format, h) * st->pitch;
>> +			*map =3D nouveau_get_scratch(ctx, size, &st->bo, &st->offset);
>>  			*stride =3D st->pitch;
>>  		} else {
>>  			int ret, flags =3D 0;
>> @@ -195,11 +201,15 @@ nouveau_map_texture_image(struct gl_context *ctx,
>>  				assert(!ret);
>>  			}
>>=20=20
>> -			*map =3D s->bo->map + y * s->pitch + x * s->cpp;
>> +			*map =3D s->bo->map +
>> +				nouveau_format_get_nblocksy(s->format, y) * s->pitch +
>> +				nouveau_format_get_nblocksx(s->format, x) * s->cpp;
>>  			*stride =3D s->pitch;
>>  		}
>>  	} else {
>> -		*map =3D nti->base.Map + y * s->pitch + x * s->cpp;
>> +		*map =3D nti->base.Map +
>> +			nouveau_format_get_nblocksy(s->format, y) * s->pitch +
>> +			nouveau_format_get_nblocksx(s->format, x) * s->cpp;
>>  		*stride =3D s->pitch;
>>  	}
>>  }
>> @@ -291,7 +301,24 @@ nouveau_choose_tex_format(struct gl_context *ctx, G=
Lint internalFormat,
>>  	case GL_INTENSITY8:
>>  		return MESA_FORMAT_I8;
>>=20=20
>> +	case GL_RGB_S3TC:
>> +	case GL_RGB4_S3TC:
>> +	case GL_COMPRESSED_RGB_S3TC_DXT1_EXT:
>> +		return MESA_FORMAT_RGB_DXT1;
>> +
>> +	case GL_COMPRESSED_RGBA_S3TC_DXT1_EXT:
>> +		return MESA_FORMAT_RGBA_DXT1;
>> +
>> +	case GL_RGBA_S3TC:
>> +	case GL_RGBA4_S3TC:
>> +	case GL_COMPRESSED_RGBA_S3TC_DXT3_EXT:
>> +		return MESA_FORMAT_RGBA_DXT3;
>> +
>> +	case GL_COMPRESSED_RGBA_S3TC_DXT5_EXT:
>> +		return MESA_FORMAT_RGBA_DXT5;
>> +
>>  	default:
>> +		nouveau_error("unexpected internalFormat 0x%x\n", internalFormat);

We already have an assert, what's the point?

>>  		assert(0);
>>  	}
>>  }
>> @@ -358,7 +385,7 @@ relayout_texture(struct gl_context *ctx, struct gl_t=
exture_object *t)
>>  		struct nouveau_surface *ss =3D to_nouveau_texture(t)->surfaces;
>>  		struct nouveau_surface *s =3D &to_nouveau_teximage(base)->surface;
>>  		int i, ret, last =3D get_last_level(t);

You can set the layout here because it's always going to be the same for
all mipmap levels:

| enum nouveau_surface_layout layout =3D
|     (_mesa_is_format_compressed(s->format) ? LINEAR : SWIZZLED);

>> -		unsigned size, offset =3D 0,
>> +		unsigned size, pitch, layout, offset =3D 0,
>>  			width =3D s->width,
>>  			height =3D s->height;
>>=20=20
>> @@ -368,7 +395,16 @@ relayout_texture(struct gl_context *ctx, struct gl_=
texture_object *t)
>>=20=20
>>  		/* Relayout the mipmap tree. */
>>  		for (i =3D t->BaseLevel; i <=3D last; i++) {
>> -			size =3D width * height * s->cpp;
>> +
>> +			if (_mesa_is_format_compressed(s->format)) {
>> +				layout =3D LINEAR;
>> +				pitch =3D _mesa_format_row_stride(s->format, width);
>> +				size =3D nouveau_format_get_nblocksy(s->format, height) * pitch;
>> +			} else {
>> +				layout =3D SWIZZLED;
>> +				pitch =3D width * s->cpp;
>> +				size =3D height * pitch;
>> +			}

No need for the conditional here:

| pitch =3D _mesa_format_row_stride(s->format, width);
| size =3D get_format_blocksy(s->format, height) * pitch;

>>=20=20
>>  			/* Images larger than 16B have to be aligned. */
>>  			if (size > 16)
>> @@ -376,12 +412,12 @@ relayout_texture(struct gl_context *ctx, struct gl=
_texture_object *t)
>>=20=20
>>  			ss[i] =3D (struct nouveau_surface) {
>>  				.offset =3D offset,
>> -				.layout =3D SWIZZLED,
>> +				.layout =3D layout,
>>  				.format =3D s->format,
>>  				.width =3D width,
>>  				.height =3D height,
>>  				.cpp =3D s->cpp,
>> -				.pitch =3D width * s->cpp,
>> +				.pitch =3D pitch,
>>  			};
>>=20=20
>>  			offset +=3D size;
>> @@ -458,8 +494,10 @@ nouveau_teximage(struct gl_context *ctx, GLint dims,
>>  		 struct gl_texture_image *ti,
>>  		 GLint internalFormat,
>>  		 GLint width, GLint height, GLint depth, GLint border,
>> +		 GLsizei imageSize,
>>  		 GLenum format, GLenum type, const GLvoid *pixels,
>> -		 const struct gl_pixelstore_attrib *packing)
>> +		 const struct gl_pixelstore_attrib *packing,
>> +		 GLboolean compressed)
>>  {
>>  	struct gl_texture_object *t =3D ti->TexObject;
>>  	const GLuint level =3D ti->Level;
>> @@ -472,9 +510,16 @@ nouveau_teximage(struct gl_context *ctx, GLint dims,
>>  			      ti->TexFormat, width, height);
>>  	nti->base.RowStride =3D s->pitch / s->cpp;
>>=20=20
>> -	pixels =3D _mesa_validate_pbo_teximage(ctx, dims, width, height, depth,
>> -					     format, type, pixels, packing,
>> -					     "glTexImage");
>> +	if (compressed) {
>> +		pixels =3D _mesa_validate_pbo_compressed_teximage(ctx,
>> +			imageSize,
>> +			pixels, packing, "glCompressedTexImage");
>> +	} else {
>> +		pixels =3D _mesa_validate_pbo_teximage(ctx,
>> +			dims, width, height, depth, format, type,
>> +			pixels, packing, "glTexImage");
>> +	}
>> +

The rest of the code doesn't use braces in if blocks with only one
statement inside.

>>  	if (pixels) {
>>  		/* Store the pixel data. */
>>  		nouveau_teximage_map(ctx, ti, GL_MAP_WRITE_BIT,
>> @@ -516,8 +561,8 @@ nouveau_teximage_1d(struct gl_context *ctx,
>>  		    const struct gl_pixelstore_attrib *packing)
>>  {
>>  	nouveau_teximage(ctx, 1, ti, internalFormat,
>> -			 width, 1, 1, border, format, type, pixels,
>> -			 packing);
>> +			 width, 1, 1, border, 0, format, type, pixels,
>> +			 packing, GL_FALSE);
>>  }
>>=20=20
>>  static void
>> @@ -529,8 +574,8 @@ nouveau_teximage_2d(struct gl_context *ctx,
>>  		    const struct gl_pixelstore_attrib *packing)
>>  {
>>  	nouveau_teximage(ctx, 2, ti, internalFormat,
>> -			 width, height, 1, border, format, type, pixels,
>> -			 packing);
>> +			 width, height, 1, border, 0, format, type, pixels,
>> +			 packing, GL_FALSE);
>>  }
>>=20=20
>>  static void
>> @@ -542,8 +587,20 @@ nouveau_teximage_3d(struct gl_context *ctx,
>>  		    const struct gl_pixelstore_attrib *packing)
>>  {
>>  	nouveau_teximage(ctx, 3, ti, internalFormat,
>> -			 width, height, depth, border, format, type, pixels,
>> -			 packing);
>> +			 width, height, depth, border, 0, format, type, pixels,
>> +			 packing, GL_FALSE);
>> +}
>> +
>> +static void
>> +nouveau_compressed_teximage_2d(struct gl_context *ctx,
>> +		    struct gl_texture_image *ti,
>> +		    GLint internalFormat,
>> +		    GLint width, GLint height, GLint border,
>> +		    GLsizei imageSize, const GLvoid *data)
>> +{
>> +	nouveau_teximage(ctx, 2, ti, internalFormat,
>> +			 width, height, 1, border, imageSize, 0, 0, data,
>> +			 &ctx->Unpack, GL_TRUE);
>>  }
>>=20=20
>>  static void
>> @@ -551,21 +608,30 @@ nouveau_texsubimage(struct gl_context *ctx, GLint =
dims,
>>  		    struct gl_texture_image *ti,
>>  		    GLint xoffset, GLint yoffset, GLint zoffset,
>>  		    GLint width, GLint height, GLint depth,
>> +		    GLsizei imageSize,
>>  		    GLenum format, GLenum type, const void *pixels,
>> -		    const struct gl_pixelstore_attrib *packing)
>> +		    const struct gl_pixelstore_attrib *packing,
>> +		    GLboolean compressed)
>>  {
>>  	struct nouveau_surface *s =3D &to_nouveau_teximage(ti)->surface;
>>  	struct nouveau_teximage *nti =3D to_nouveau_teximage(ti);
>>  	int ret;
>>=20=20
>> -	pixels =3D _mesa_validate_pbo_teximage(ctx, dims, width, height, depth,
>> -					     format, type, pixels, packing,
>> -					     "glTexSubImage");
>> +	if (compressed) {
>> +		pixels =3D _mesa_validate_pbo_compressed_teximage(ctx,
>> +				imageSize,
>> +				pixels, packing, "glCompressedTexSubImage");
>> +	} else {
>> +		pixels =3D _mesa_validate_pbo_teximage(ctx,
>> +				dims, width, height, depth, format, type,
>> +				pixels, packing, "glTexSubImage");
>> +	}
>> +

Same comment as in nouveau_teximage().

>>  	if (pixels) {
>>  		nouveau_teximage_map(ctx, ti, GL_MAP_WRITE_BIT,
>>  				     xoffset, yoffset, width, height);
>>=20=20
>> -		ret =3D _mesa_texstore(ctx, 3, ti->_BaseFormat, ti->TexFormat,
>> +		ret =3D _mesa_texstore(ctx, dims, ti->_BaseFormat, ti->TexFormat,
>>                                       s->pitch,
>>  				     &nti->base.Map,
>>                                       width, height, depth,
>> @@ -591,8 +657,8 @@ nouveau_texsubimage_3d(struct gl_context *ctx,
>>  		       const struct gl_pixelstore_attrib *packing)
>>  {
>>  	nouveau_texsubimage(ctx, 3, ti, xoffset, yoffset, zoffset,
>> -			    width, height, depth, format, type, pixels,
>> -			    packing);
>> +			    width, height, depth, 0, format, type, pixels,
>> +			    packing, GL_FALSE);
>>  }
>>=20=20
>>  static void
>> @@ -604,8 +670,8 @@ nouveau_texsubimage_2d(struct gl_context *ctx,
>>  		       const struct gl_pixelstore_attrib *packing)
>>  {
>>  	nouveau_texsubimage(ctx, 2, ti, xoffset, yoffset, 0,
>> -			    width, height, 1, format, type, pixels,
>> -			    packing);
>> +			    width, height, 1, 0, format, type, pixels,
>> +			    packing, GL_FALSE);
>>  }
>>=20=20
>>  static void
>> @@ -616,8 +682,21 @@ nouveau_texsubimage_1d(struct gl_context *ctx,
>>  		       const struct gl_pixelstore_attrib *packing)
>>  {
>>  	nouveau_texsubimage(ctx, 1, ti, xoffset, 0, 0,
>> -			    width, 1, 1, format, type, pixels,
>> -			    packing);
>> +			    width, 1, 1, 0, format, type, pixels,
>> +			    packing, GL_FALSE);
>> +}
>> +
>> +static void
>> +nouveau_compressed_texsubimage_2d(struct gl_context *ctx,
>> +		       struct gl_texture_image *ti,
>> +		       GLint xoffset, GLint yoffset,
>> +		       GLsizei width, GLint height,
>> +		       GLenum format,
>> +		       GLint imageSize, const void *data)
>> +{
>> +	nouveau_texsubimage(ctx, 2, ti, xoffset, yoffset, 0,
>> +			  width, height, 1, imageSize, format, 0, data,
>> +			  &ctx->Unpack, GL_TRUE);
>>  }
>>=20=20
>>  static void
>> @@ -696,6 +775,8 @@ nouveau_texture_functions_init(struct dd_function_ta=
ble *functions)
>>  	functions->TexSubImage1D =3D nouveau_texsubimage_1d;
>>  	functions->TexSubImage2D =3D nouveau_texsubimage_2d;
>>  	functions->TexSubImage3D =3D nouveau_texsubimage_3d;
>> +	functions->CompressedTexImage2D =3D nouveau_compressed_teximage_2d;
>> +	functions->CompressedTexSubImage2D =3D nouveau_compressed_texsubimage_=
2d;
>>  	functions->BindTexture =3D nouveau_bind_texture;
>>  	functions->MapTextureImage =3D nouveau_map_texture_image;
>>  	functions->UnmapTextureImage =3D nouveau_unmap_texture_image;
>> diff --git a/src/mesa/drivers/dri/nouveau/nouveau_util.h b/src/mesa/driv=
ers/dri/nouveau/nouveau_util.h
>> index d4cc5c4..af2b175 100644
>> --- a/src/mesa/drivers/dri/nouveau/nouveau_util.h
>> +++ b/src/mesa/drivers/dri/nouveau/nouveau_util.h
>> @@ -207,4 +207,23 @@ get_texgen_coeff(struct gl_texgen *c)
>>  		return NULL;
>>  }
>>=20=20
>> +static inline unsigned
>> +nouveau_format_get_nblocksx(gl_format format,
>> +		       unsigned x)
>> +{
>> +	GLuint blockwidth;
>> +	GLuint blockheight;
>> +	_mesa_get_format_block_size(format, &blockwidth, &blockheight);
>> +	return (x + blockwidth - 1) / blockwidth;
>> +}
>> +
>> +static inline unsigned
>> +nouveau_format_get_nblocksy(gl_format format,
>> +		       unsigned y)
>> +{
>> +	GLuint blockwidth;
>> +	GLuint blockheight;
>> +	_mesa_get_format_block_size(format, &blockwidth, &blockheight);
>> +	return (y + blockheight - 1) / blockheight;
>> +}

For consistency with the other nouveau_util.h functions, use
"get_format_blocksx/y()" or something similar.

>>  #endif
>> diff --git a/src/mesa/drivers/dri/nouveau/nv04_surface.c b/src/mesa/driv=
ers/dri/nouveau/nv04_surface.c
>> index b2b260d..bc3cace 100644
>> --- a/src/mesa/drivers/dri/nouveau/nv04_surface.c
>> +++ b/src/mesa/drivers/dri/nouveau/nv04_surface.c
>> @@ -291,7 +291,7 @@ nv04_surface_copy_m2mf(struct gl_context *ctx,
>>  	while (h) {
>>  		int count =3D (h > 2047) ? 2047 : h;
>>=20=20
>> -		if (nouveau_pushbuf_space(push, 16, 4, 0) ||
>> +		if (nouveau_pushbuf_space(push, 18, 4, 0) ||
>>  		    nouveau_pushbuf_refn (push, refs, 2))
>>  			return;
>>=20=20
>> @@ -307,6 +307,10 @@ nv04_surface_copy_m2mf(struct gl_context *ctx,
>>  		PUSH_DATA (push, count);
>>  		PUSH_DATA (push, 0x0101);
>>  		PUSH_DATA (push, 0);
>> +		BEGIN_NV04(push, NV04_GRAPH(M2MF, NOP), 1);
>> +		PUSH_DATA (push, 0);
>> +		BEGIN_NV04(push, NV03_M2MF(OFFSET_OUT), 1);
>> +		PUSH_DATA (push, 0);

What's this for?

>>=20=20
>>  		src_offset +=3D src->pitch * count;
>>  		dst_offset +=3D dst->pitch * count;
>> @@ -400,6 +404,17 @@ nv04_surface_copy(struct gl_context *ctx,
>>  		  int dx, int dy, int sx, int sy,
>>  		  int w, int h)
>>  {
>> +	bool compressed =3D _mesa_is_format_compressed(src->format);
>> +
>> +	if (compressed) {

No need for the local variable:
|        if (_mesa_is_format_compressed(src->format)) {

>> +		sx =3D nouveau_format_get_nblocksx(src->format, sx);
>> +		sy =3D nouveau_format_get_nblocksy(src->format, sy);

>> +		dx =3D nouveau_format_get_nblocksx(dst->format, sx);
>> +		dy =3D nouveau_format_get_nblocksy(dst->format, sy);

This looks wrong.

>> +		w =3D nouveau_format_get_nblocksx(src->format, w);
>> +		h =3D nouveau_format_get_nblocksy(src->format, h);
>> +	}
>> +
>>  	/* Linear texture copy. */
>>  	if ((src->layout =3D=3D LINEAR && dst->layout =3D=3D LINEAR) ||
>>  	    dst->width <=3D 2 || dst->height <=3D 1) {
>> diff --git a/src/mesa/drivers/dri/nouveau/nv20_context.c b/src/mesa/driv=
ers/dri/nouveau/nv20_context.c
>> index c911717..5a36c87 100644
>> --- a/src/mesa/drivers/dri/nouveau/nv20_context.c
>> +++ b/src/mesa/drivers/dri/nouveau/nv20_context.c
>> @@ -460,6 +460,10 @@ nv20_context_create(struct nouveau_screen *screen, =
const struct gl_config *visua
>>  	ctx->Extensions.ARB_texture_env_dot3 =3D true;
>>  	ctx->Extensions.NV_fog_distance =3D true;
>>  	ctx->Extensions.NV_texture_rectangle =3D true;
>> +	if (ctx->Mesa_DXTn) {
>> +		ctx->Extensions.EXT_texture_compression_s3tc =3D true;
>> +		ctx->Extensions.S3_s3tc =3D true;
>> +	}
>>=20=20
>>  	/* GL constants. */
>>  	ctx->Const.MaxTextureCoordUnits =3D NV20_TEXTURE_UNITS;
>> diff --git a/src/mesa/drivers/dri/nouveau/nv20_state_tex.c b/src/mesa/dr=
ivers/dri/nouveau/nv20_state_tex.c
>> index 799510d..d8bfdf2 100644
>> --- a/src/mesa/drivers/dri/nouveau/nv20_state_tex.c
>> +++ b/src/mesa/drivers/dri/nouveau/nv20_state_tex.c
>> @@ -108,6 +108,16 @@ get_tex_format_pot(struct gl_texture_image *ti)
>>  	case MESA_FORMAT_L8:
>>  		return NV20_3D_TEX_FORMAT_FORMAT_L8;
>>=20=20
>> +	case MESA_FORMAT_RGB_DXT1:
>> +	case MESA_FORMAT_RGBA_DXT1:
>> +		return NV20_3D_TEX_FORMAT_FORMAT_DXT1;
>> +
>> +	case MESA_FORMAT_RGBA_DXT3:
>> +		return NV20_3D_TEX_FORMAT_FORMAT_DXT3;
>> +
>> +	case MESA_FORMAT_RGBA_DXT5:
>> +		return NV20_3D_TEX_FORMAT_FORMAT_DXT5;
>> +
>>  	default:
>>  		assert(0);
>>  	}

--=-=-=--

--==-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iF4EAREIAAYFAk+WxUkACgkQg5k4nX1Sv1tOAAD/UnZ7UWpTmwgqvnCrtu2YiaoU
6SYd/ghRX1C9wd4hn7oA/3+/880Pz5D5gjKaOQavULmYDEwCclmGfqccVnOwAw/g
=eoiu
-----END PGP SIGNATURE-----
--==-=-=--

--===============1674592306==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1674592306==--

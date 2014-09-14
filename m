From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH] nouveau: fix glCompressedTexImage
Date: Sun, 14 Sep 2014 10:37:53 +0300
Message-ID: <87oauitzxq.fsf@riseup.net>
References: <1410646604-29966-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1832604687=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1410646604-29966-1-git-send-email-imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============1832604687==
Content-Type: multipart/signed; boundary="==-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--==-=-=
Content-Type: multipart/mixed; boundary="=-=-="

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> writes:

> mesa_texstore expects pixel data, not compressed data. For compressed
> textures, we want to just copy the bits in without any conversion.
>

Any reason we cannot use _mesa_store_compressed_*image for this instead
of rolling our own?

> Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
> ---
>  src/mesa/drivers/dri/nouveau/nouveau_texture.c | 65 ++++++++++++++++++++=
------
>  1 file changed, 52 insertions(+), 13 deletions(-)
>
> diff --git a/src/mesa/drivers/dri/nouveau/nouveau_texture.c b/src/mesa/dr=
ivers/dri/nouveau/nouveau_texture.c
> index 4626cc3..dc5699c 100644
> --- a/src/mesa/drivers/dri/nouveau/nouveau_texture.c
> +++ b/src/mesa/drivers/dri/nouveau/nouveau_texture.c
> @@ -413,6 +413,31 @@ get_teximage_placement(struct gl_texture_image *ti)
>  }
>=20=20
>  static void
> +nouveau_compressed_copy(struct gl_context *ctx, GLint dims,
> +			struct gl_texture_image *ti,
> +			GLsizei width, GLsizei height, GLsizei depth,
> +			const GLvoid *src, GLvoid *dst, int row_stride)
> +{
> +	struct compressed_pixelstore store;
> +	int i;
> +
> +	_mesa_compute_compressed_pixelstore(dims, ti->TexFormat,
> +					    width, height, depth,
> +					    &ctx->Unpack, &store);
> +
> +	src +=3D store.SkipBytes;
> +
> +	assert(store.CopySlices =3D=3D 1);
> +
> +	/* copy rows of blocks */
> +	for (i =3D 0; i < store.CopyRowsPerSlice; i++) {
> +		memcpy(dst, src, store.CopyBytesPerRow);
> +		dst +=3D row_stride;
> +		src +=3D store.TotalBytesPerRow;
> +	}
> +}
> +
> +static void
>  nouveau_teximage(struct gl_context *ctx, GLint dims,
>  		 struct gl_texture_image *ti,
>  		 GLsizei imageSize,
> @@ -451,13 +476,19 @@ nouveau_teximage(struct gl_context *ctx, GLint dims,
>  					  GL_MAP_WRITE_BIT,
>  					  &map, &row_stride);
>=20=20
> -		ret =3D _mesa_texstore(ctx, dims, ti->_BaseFormat,
> -				     ti->TexFormat,
> -				     row_stride,
> -				     &map,
> -				     ti->Width, ti->Height, depth,
> -				     format, type, pixels, packing);
> -		assert(ret);
> +		if (compressed) {
> +			nouveau_compressed_copy(ctx, dims, ti,
> +						ti->Width, ti->Height, depth,
> +						pixels, map, row_stride);
> +		} else {
> +			ret =3D _mesa_texstore(ctx, dims, ti->_BaseFormat,
> +					     ti->TexFormat,
> +					     row_stride,
> +					     &map,
> +					     ti->Width, ti->Height, depth,
> +					     format, type, pixels, packing);
> +			assert(ret);
> +		}
>=20=20
>  		nouveau_unmap_texture_image(ctx, ti, 0);
>  		_mesa_unmap_teximage_pbo(ctx, packing);
> @@ -502,7 +533,8 @@ static GLboolean
>  nouveau_teximage_alloc(struct gl_context *ctx, struct gl_texture_image *=
ti)
>  {
>  	nouveau_teximage(ctx, 3, ti, 0, 0, 0, NULL,
> -			 &ctx->DefaultPacking, GL_FALSE);
> +			 &ctx->DefaultPacking,
> +			 _mesa_is_format_compressed(ti->TexFormat));
>  	return GL_TRUE;
>  }
>=20=20
> @@ -535,11 +567,18 @@ nouveau_texsubimage(struct gl_context *ctx, GLint d=
ims,
>  					  xoffset, yoffset, width, height,
>  					  GL_MAP_WRITE_BIT, &map, &row_stride);
>=20=20
> -		ret =3D _mesa_texstore(ctx, dims, ti->_BaseFormat, ti->TexFormat,
> -				     row_stride, &map,
> -                                     width, height, depth,
> -				     format, type, pixels, packing);
> -		assert(ret);
> +		if (compressed) {
> +			nouveau_compressed_copy(ctx, dims, ti,
> +						width, height, depth,
> +						pixels, map, row_stride);
> +		} else {
> +			ret =3D _mesa_texstore(ctx, dims, ti->_BaseFormat,
> +					     ti->TexFormat,
> +					     row_stride, &map,
> +					     width, height, depth,
> +					     format, type, pixels, packing);
> +			assert(ret);
> +		}
>=20=20
>  		nouveau_unmap_texture_image(ctx, ti, 0);
>  		_mesa_unmap_teximage_pbo(ctx, packing);
> --=20
> 1.8.5.5

--=-=-=--

--==-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EAREIAAYFAlQVRdEACgkQg5k4nX1Sv1tJdwD+N+DGRZlMXV5Mp4LZwKVDHOuS
nwyzgva0LmF1gQc0GSMBAILVpQsULSE2PciZMDSzJpQXVrmwzgJ7xtVAH27yi8y+
=86cE
-----END PGP SIGNATURE-----
--==-=-=--

--===============1832604687==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1832604687==--

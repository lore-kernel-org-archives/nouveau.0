From: =?UTF-8?B?VmlrdG9yIE5vdm90bsO9?= <noviktor-9Vj9tDbzfuSlVyrhU4qvOw@public.gmane.org>
Subject: [WIP PATCH] dri/nouveau: Add S3TC support for nv20.
Date: Fri, 06 Apr 2012 17:40:58 +0200
Message-ID: <4F7F0E8A.6020403@seznam.cz>
Reply-To: nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

---
Hi,

this is still WIP, but already passes piglit's s3tc-teximage, s3tc-texsubimage and fbo-generatemipmap-formats(s3tc tests)
and even Wolfenstein:Enemy-Territory works on my nv25. It's based on Ben's newlib branch. I have few issues though:
1) So far it needs libtxc_dxtn, but I might expose the s3tc extensions even without encoder using driconf option -
   Is that desirable?
2) Looking at blob's dedma'd valgrind-mmt dumps it seems blob uses pitch no smaller than 64 in miptree,
   but for me everything works as it is. Does it make any difference?
2) I am not sure about computing the offsets in teximage_map - it works like this, but can somebody confirm it's ok?
3) If somebody can give me some feedback on the style etc., please do.
4) S3TC texture seem to be supported also on nv10, I have nv11 somewhere so I might be able to add support to it too,
   but I don't have nv04, then again, I think it might not support S3TC?

If I you think the patch is mostly OK, I will process your feedback, split generic and nv20 specific part and resend it.

Regards
	Viktor

 src/mesa/drivers/dri/nouveau/nouveau_surface.c |   14 ++-
 src/mesa/drivers/dri/nouveau/nouveau_texture.c |  143 ++++++++++++++++++-----
 src/mesa/drivers/dri/nouveau/nouveau_util.h    |   19 +++
 src/mesa/drivers/dri/nouveau/nv04_surface.c    |   17 +++-
 src/mesa/drivers/dri/nouveau/nv20_context.c    |    4 +
 src/mesa/drivers/dri/nouveau/nv20_state_tex.c  |   10 ++
 6 files changed, 172 insertions(+), 35 deletions(-)

diff --git a/src/mesa/drivers/dri/nouveau/nouveau_surface.c b/src/mesa/drivers/dri/nouveau/nouveau_surface.c
index f252114..349000a 100644
--- a/src/mesa/drivers/dri/nouveau/nouveau_surface.c
+++ b/src/mesa/drivers/dri/nouveau/nouveau_surface.c
@@ -28,6 +28,8 @@
 #include "nouveau_context.h"
 #include "nouveau_util.h"
 
+#include "main/formats.h"
+
 void
 nouveau_surface_alloc(struct gl_context *ctx, struct nouveau_surface *s,
 		      enum nouveau_surface_layout layout,
@@ -36,6 +38,8 @@ nouveau_surface_alloc(struct gl_context *ctx, struct nouveau_surface *s,
 {
 	union nouveau_bo_config config = {};
 	int ret, cpp = _mesa_get_format_bytes(format);
+	int pitch = _mesa_format_row_stride(format, width);
+	unsigned size;
 
 	nouveau_bo_ref(NULL, &s->bo);
 
@@ -45,7 +49,7 @@ nouveau_surface_alloc(struct gl_context *ctx, struct nouveau_surface *s,
 		.width = width,
 		.height = height,
 		.cpp = cpp,
-		.pitch = width * cpp,
+		.pitch = pitch,
 	};
 
 	if (layout == TILED) {
@@ -64,8 +68,12 @@ nouveau_surface_alloc(struct gl_context *ctx, struct nouveau_surface *s,
 		s->pitch = align(s->pitch, 64);
 	}
 
-	ret = nouveau_bo_new(context_dev(ctx), flags, 0, s->pitch * height,
-			     &config, &s->bo);
+	if (_mesa_is_format_compressed(format))
+		size = s->pitch * nouveau_format_get_nblocksy(format, height);
+	else
+		size = s->pitch * height;
+
+	ret = nouveau_bo_new(context_dev(ctx), flags, 0, size, &config, &s->bo);
 	assert(!ret);
 }
 
diff --git a/src/mesa/drivers/dri/nouveau/nouveau_texture.c b/src/mesa/drivers/dri/nouveau/nouveau_texture.c
index 643b890..52f0259 100644
--- a/src/mesa/drivers/dri/nouveau/nouveau_texture.c
+++ b/src/mesa/drivers/dri/nouveau/nouveau_texture.c
@@ -91,6 +91,7 @@ nouveau_teximage_map(struct gl_context *ctx, struct gl_texture_image *ti,
 	if (s->bo) {
 		if (!(access & GL_MAP_READ_BIT) &&
 		    nouveau_pushbuf_refd(context_push(ctx), s->bo)) {
+			unsigned size;
 			/*
 			 * Heuristic: use a bounce buffer to pipeline
 			 * teximage transfers.
@@ -104,7 +105,8 @@ nouveau_teximage_map(struct gl_context *ctx, struct gl_texture_image *ti,
 			nti->transfer.x = x;
 			nti->transfer.y = y;
 
-			nti->base.Map = nouveau_get_scratch(ctx, st->pitch * h,
+			size = nouveau_format_get_nblocksx(st->format, h) * st->pitch;
+			nti->base.Map = nouveau_get_scratch(ctx, size,
 						       &st->bo, &st->offset);
 
 		} else {
@@ -120,7 +122,10 @@ nouveau_teximage_map(struct gl_context *ctx, struct gl_texture_image *ti,
 				assert(!ret);
 			}
 
-			nti->base.Map = s->bo->map + y * s->pitch + x * s->cpp;
+			nti->base.Map = s->bo->map +
+				nouveau_format_get_nblocksy(s->format, y) * s->pitch +
+				nouveau_format_get_nblocksx(s->format, x) * s->cpp;
+
 		}
 	}
 }
@@ -166,6 +171,7 @@ nouveau_map_texture_image(struct gl_context *ctx,
 	if (s->bo) {
 		if (!(mode & GL_MAP_READ_BIT) &&
 		    nouveau_pushbuf_refd(context_push(ctx), s->bo)) {
+			unsigned size;
 			/*
 			 * Heuristic: use a bounce buffer to pipeline
 			 * teximage transfers.
@@ -179,8 +185,8 @@ nouveau_map_texture_image(struct gl_context *ctx,
 			nti->transfer.x = x;
 			nti->transfer.y = y;
 
-			*map = nouveau_get_scratch(ctx, st->pitch * h,
-						   &st->bo, &st->offset);
+			size = nouveau_format_get_nblocksy(st->format, h) * st->pitch;
+			*map = nouveau_get_scratch(ctx, size, &st->bo, &st->offset);
 			*stride = st->pitch;
 		} else {
 			int ret, flags = 0;
@@ -195,11 +201,15 @@ nouveau_map_texture_image(struct gl_context *ctx,
 				assert(!ret);
 			}
 
-			*map = s->bo->map + y * s->pitch + x * s->cpp;
+			*map = s->bo->map +
+				nouveau_format_get_nblocksy(s->format, y) * s->pitch +
+				nouveau_format_get_nblocksx(s->format, x) * s->cpp;
 			*stride = s->pitch;
 		}
 	} else {
-		*map = nti->base.Map + y * s->pitch + x * s->cpp;
+		*map = nti->base.Map +
+			nouveau_format_get_nblocksy(s->format, y) * s->pitch +
+			nouveau_format_get_nblocksx(s->format, x) * s->cpp;
 		*stride = s->pitch;
 	}
 }
@@ -291,7 +301,24 @@ nouveau_choose_tex_format(struct gl_context *ctx, GLint internalFormat,
 	case GL_INTENSITY8:
 		return MESA_FORMAT_I8;
 
+	case GL_RGB_S3TC:
+	case GL_RGB4_S3TC:
+	case GL_COMPRESSED_RGB_S3TC_DXT1_EXT:
+		return MESA_FORMAT_RGB_DXT1;
+
+	case GL_COMPRESSED_RGBA_S3TC_DXT1_EXT:
+		return MESA_FORMAT_RGBA_DXT1;
+
+	case GL_RGBA_S3TC:
+	case GL_RGBA4_S3TC:
+	case GL_COMPRESSED_RGBA_S3TC_DXT3_EXT:
+		return MESA_FORMAT_RGBA_DXT3;
+
+	case GL_COMPRESSED_RGBA_S3TC_DXT5_EXT:
+		return MESA_FORMAT_RGBA_DXT5;
+
 	default:
+		nouveau_error("unexpected internalFormat 0x%x\n", internalFormat);
 		assert(0);
 	}
 }
@@ -358,7 +385,7 @@ relayout_texture(struct gl_context *ctx, struct gl_texture_object *t)
 		struct nouveau_surface *ss = to_nouveau_texture(t)->surfaces;
 		struct nouveau_surface *s = &to_nouveau_teximage(base)->surface;
 		int i, ret, last = get_last_level(t);
-		unsigned size, offset = 0,
+		unsigned size, pitch, layout, offset = 0,
 			width = s->width,
 			height = s->height;
 
@@ -368,7 +395,16 @@ relayout_texture(struct gl_context *ctx, struct gl_texture_object *t)
 
 		/* Relayout the mipmap tree. */
 		for (i = t->BaseLevel; i <= last; i++) {
-			size = width * height * s->cpp;
+
+			if (_mesa_is_format_compressed(s->format)) {
+				layout = LINEAR;
+				pitch = _mesa_format_row_stride(s->format, width);
+				size = nouveau_format_get_nblocksy(s->format, height) * pitch;
+			} else {
+				layout = SWIZZLED;
+				pitch = width * s->cpp;
+				size = height * pitch;
+			}
 
 			/* Images larger than 16B have to be aligned. */
 			if (size > 16)
@@ -376,12 +412,12 @@ relayout_texture(struct gl_context *ctx, struct gl_texture_object *t)
 
 			ss[i] = (struct nouveau_surface) {
 				.offset = offset,
-				.layout = SWIZZLED,
+				.layout = layout,
 				.format = s->format,
 				.width = width,
 				.height = height,
 				.cpp = s->cpp,
-				.pitch = width * s->cpp,
+				.pitch = pitch,
 			};
 
 			offset += size;
@@ -458,8 +494,10 @@ nouveau_teximage(struct gl_context *ctx, GLint dims,
 		 struct gl_texture_image *ti,
 		 GLint internalFormat,
 		 GLint width, GLint height, GLint depth, GLint border,
+		 GLsizei imageSize,
 		 GLenum format, GLenum type, const GLvoid *pixels,
-		 const struct gl_pixelstore_attrib *packing)
+		 const struct gl_pixelstore_attrib *packing,
+		 GLboolean compressed)
 {
 	struct gl_texture_object *t = ti->TexObject;
 	const GLuint level = ti->Level;
@@ -472,9 +510,16 @@ nouveau_teximage(struct gl_context *ctx, GLint dims,
 			      ti->TexFormat, width, height);
 	nti->base.RowStride = s->pitch / s->cpp;
 
-	pixels = _mesa_validate_pbo_teximage(ctx, dims, width, height, depth,
-					     format, type, pixels, packing,
-					     "glTexImage");
+	if (compressed) {
+		pixels = _mesa_validate_pbo_compressed_teximage(ctx,
+			imageSize,
+			pixels, packing, "glCompressedTexImage");
+	} else {
+		pixels = _mesa_validate_pbo_teximage(ctx,
+			dims, width, height, depth, format, type,
+			pixels, packing, "glTexImage");
+	}
+
 	if (pixels) {
 		/* Store the pixel data. */
 		nouveau_teximage_map(ctx, ti, GL_MAP_WRITE_BIT,
@@ -516,8 +561,8 @@ nouveau_teximage_1d(struct gl_context *ctx,
 		    const struct gl_pixelstore_attrib *packing)
 {
 	nouveau_teximage(ctx, 1, ti, internalFormat,
-			 width, 1, 1, border, format, type, pixels,
-			 packing);
+			 width, 1, 1, border, 0, format, type, pixels,
+			 packing, GL_FALSE);
 }
 
 static void
@@ -529,8 +574,8 @@ nouveau_teximage_2d(struct gl_context *ctx,
 		    const struct gl_pixelstore_attrib *packing)
 {
 	nouveau_teximage(ctx, 2, ti, internalFormat,
-			 width, height, 1, border, format, type, pixels,
-			 packing);
+			 width, height, 1, border, 0, format, type, pixels,
+			 packing, GL_FALSE);
 }
 
 static void
@@ -542,8 +587,20 @@ nouveau_teximage_3d(struct gl_context *ctx,
 		    const struct gl_pixelstore_attrib *packing)
 {
 	nouveau_teximage(ctx, 3, ti, internalFormat,
-			 width, height, depth, border, format, type, pixels,
-			 packing);
+			 width, height, depth, border, 0, format, type, pixels,
+			 packing, GL_FALSE);
+}
+
+static void
+nouveau_compressed_teximage_2d(struct gl_context *ctx,
+		    struct gl_texture_image *ti,
+		    GLint internalFormat,
+		    GLint width, GLint height, GLint border,
+		    GLsizei imageSize, const GLvoid *data)
+{
+	nouveau_teximage(ctx, 2, ti, internalFormat,
+			 width, height, 1, border, imageSize, 0, 0, data,
+			 &ctx->Unpack, GL_TRUE);
 }
 
 static void
@@ -551,21 +608,30 @@ nouveau_texsubimage(struct gl_context *ctx, GLint dims,
 		    struct gl_texture_image *ti,
 		    GLint xoffset, GLint yoffset, GLint zoffset,
 		    GLint width, GLint height, GLint depth,
+		    GLsizei imageSize,
 		    GLenum format, GLenum type, const void *pixels,
-		    const struct gl_pixelstore_attrib *packing)
+		    const struct gl_pixelstore_attrib *packing,
+		    GLboolean compressed)
 {
 	struct nouveau_surface *s = &to_nouveau_teximage(ti)->surface;
 	struct nouveau_teximage *nti = to_nouveau_teximage(ti);
 	int ret;
 
-	pixels = _mesa_validate_pbo_teximage(ctx, dims, width, height, depth,
-					     format, type, pixels, packing,
-					     "glTexSubImage");
+	if (compressed) {
+		pixels = _mesa_validate_pbo_compressed_teximage(ctx,
+				imageSize,
+				pixels, packing, "glCompressedTexSubImage");
+	} else {
+		pixels = _mesa_validate_pbo_teximage(ctx,
+				dims, width, height, depth, format, type,
+				pixels, packing, "glTexSubImage");
+	}
+
 	if (pixels) {
 		nouveau_teximage_map(ctx, ti, GL_MAP_WRITE_BIT,
 				     xoffset, yoffset, width, height);
 
-		ret = _mesa_texstore(ctx, 3, ti->_BaseFormat, ti->TexFormat,
+		ret = _mesa_texstore(ctx, dims, ti->_BaseFormat, ti->TexFormat,
                                      s->pitch,
 				     &nti->base.Map,
                                      width, height, depth,
@@ -591,8 +657,8 @@ nouveau_texsubimage_3d(struct gl_context *ctx,
 		       const struct gl_pixelstore_attrib *packing)
 {
 	nouveau_texsubimage(ctx, 3, ti, xoffset, yoffset, zoffset,
-			    width, height, depth, format, type, pixels,
-			    packing);
+			    width, height, depth, 0, format, type, pixels,
+			    packing, GL_FALSE);
 }
 
 static void
@@ -604,8 +670,8 @@ nouveau_texsubimage_2d(struct gl_context *ctx,
 		       const struct gl_pixelstore_attrib *packing)
 {
 	nouveau_texsubimage(ctx, 2, ti, xoffset, yoffset, 0,
-			    width, height, 1, format, type, pixels,
-			    packing);
+			    width, height, 1, 0, format, type, pixels,
+			    packing, GL_FALSE);
 }
 
 static void
@@ -616,8 +682,21 @@ nouveau_texsubimage_1d(struct gl_context *ctx,
 		       const struct gl_pixelstore_attrib *packing)
 {
 	nouveau_texsubimage(ctx, 1, ti, xoffset, 0, 0,
-			    width, 1, 1, format, type, pixels,
-			    packing);
+			    width, 1, 1, 0, format, type, pixels,
+			    packing, GL_FALSE);
+}
+
+static void
+nouveau_compressed_texsubimage_2d(struct gl_context *ctx,
+		       struct gl_texture_image *ti,
+		       GLint xoffset, GLint yoffset,
+		       GLsizei width, GLint height,
+		       GLenum format,
+		       GLint imageSize, const void *data)
+{
+	nouveau_texsubimage(ctx, 2, ti, xoffset, yoffset, 0,
+			  width, height, 1, imageSize, format, 0, data,
+			  &ctx->Unpack, GL_TRUE);
 }
 
 static void
@@ -696,6 +775,8 @@ nouveau_texture_functions_init(struct dd_function_table *functions)
 	functions->TexSubImage1D = nouveau_texsubimage_1d;
 	functions->TexSubImage2D = nouveau_texsubimage_2d;
 	functions->TexSubImage3D = nouveau_texsubimage_3d;
+	functions->CompressedTexImage2D = nouveau_compressed_teximage_2d;
+	functions->CompressedTexSubImage2D = nouveau_compressed_texsubimage_2d;
 	functions->BindTexture = nouveau_bind_texture;
 	functions->MapTextureImage = nouveau_map_texture_image;
 	functions->UnmapTextureImage = nouveau_unmap_texture_image;
diff --git a/src/mesa/drivers/dri/nouveau/nouveau_util.h b/src/mesa/drivers/dri/nouveau/nouveau_util.h
index d4cc5c4..af2b175 100644
--- a/src/mesa/drivers/dri/nouveau/nouveau_util.h
+++ b/src/mesa/drivers/dri/nouveau/nouveau_util.h
@@ -207,4 +207,23 @@ get_texgen_coeff(struct gl_texgen *c)
 		return NULL;
 }
 
+static inline unsigned
+nouveau_format_get_nblocksx(gl_format format,
+		       unsigned x)
+{
+	GLuint blockwidth;
+	GLuint blockheight;
+	_mesa_get_format_block_size(format, &blockwidth, &blockheight);
+	return (x + blockwidth - 1) / blockwidth;
+}
+
+static inline unsigned
+nouveau_format_get_nblocksy(gl_format format,
+		       unsigned y)
+{
+	GLuint blockwidth;
+	GLuint blockheight;
+	_mesa_get_format_block_size(format, &blockwidth, &blockheight);
+	return (y + blockheight - 1) / blockheight;
+}
 #endif
diff --git a/src/mesa/drivers/dri/nouveau/nv04_surface.c b/src/mesa/drivers/dri/nouveau/nv04_surface.c
index b2b260d..bc3cace 100644
--- a/src/mesa/drivers/dri/nouveau/nv04_surface.c
+++ b/src/mesa/drivers/dri/nouveau/nv04_surface.c
@@ -291,7 +291,7 @@ nv04_surface_copy_m2mf(struct gl_context *ctx,
 	while (h) {
 		int count = (h > 2047) ? 2047 : h;
 
-		if (nouveau_pushbuf_space(push, 16, 4, 0) ||
+		if (nouveau_pushbuf_space(push, 18, 4, 0) ||
 		    nouveau_pushbuf_refn (push, refs, 2))
 			return;
 
@@ -307,6 +307,10 @@ nv04_surface_copy_m2mf(struct gl_context *ctx,
 		PUSH_DATA (push, count);
 		PUSH_DATA (push, 0x0101);
 		PUSH_DATA (push, 0);
+		BEGIN_NV04(push, NV04_GRAPH(M2MF, NOP), 1);
+		PUSH_DATA (push, 0);
+		BEGIN_NV04(push, NV03_M2MF(OFFSET_OUT), 1);
+		PUSH_DATA (push, 0);
 
 		src_offset += src->pitch * count;
 		dst_offset += dst->pitch * count;
@@ -400,6 +404,17 @@ nv04_surface_copy(struct gl_context *ctx,
 		  int dx, int dy, int sx, int sy,
 		  int w, int h)
 {
+	bool compressed = _mesa_is_format_compressed(src->format);
+
+	if (compressed) {
+		sx = nouveau_format_get_nblocksx(src->format, sx);
+		sy = nouveau_format_get_nblocksy(src->format, sy);
+		dx = nouveau_format_get_nblocksx(dst->format, sx);
+		dy = nouveau_format_get_nblocksy(dst->format, sy);
+		w = nouveau_format_get_nblocksx(src->format, w);
+		h = nouveau_format_get_nblocksy(src->format, h);
+	}
+
 	/* Linear texture copy. */
 	if ((src->layout == LINEAR && dst->layout == LINEAR) ||
 	    dst->width <= 2 || dst->height <= 1) {
diff --git a/src/mesa/drivers/dri/nouveau/nv20_context.c b/src/mesa/drivers/dri/nouveau/nv20_context.c
index c911717..5a36c87 100644
--- a/src/mesa/drivers/dri/nouveau/nv20_context.c
+++ b/src/mesa/drivers/dri/nouveau/nv20_context.c
@@ -460,6 +460,10 @@ nv20_context_create(struct nouveau_screen *screen, const struct gl_config *visua
 	ctx->Extensions.ARB_texture_env_dot3 = true;
 	ctx->Extensions.NV_fog_distance = true;
 	ctx->Extensions.NV_texture_rectangle = true;
+	if (ctx->Mesa_DXTn) {
+		ctx->Extensions.EXT_texture_compression_s3tc = true;
+		ctx->Extensions.S3_s3tc = true;
+	}
 
 	/* GL constants. */
 	ctx->Const.MaxTextureCoordUnits = NV20_TEXTURE_UNITS;
diff --git a/src/mesa/drivers/dri/nouveau/nv20_state_tex.c b/src/mesa/drivers/dri/nouveau/nv20_state_tex.c
index 799510d..d8bfdf2 100644
--- a/src/mesa/drivers/dri/nouveau/nv20_state_tex.c
+++ b/src/mesa/drivers/dri/nouveau/nv20_state_tex.c
@@ -108,6 +108,16 @@ get_tex_format_pot(struct gl_texture_image *ti)
 	case MESA_FORMAT_L8:
 		return NV20_3D_TEX_FORMAT_FORMAT_L8;
 
+	case MESA_FORMAT_RGB_DXT1:
+	case MESA_FORMAT_RGBA_DXT1:
+		return NV20_3D_TEX_FORMAT_FORMAT_DXT1;
+
+	case MESA_FORMAT_RGBA_DXT3:
+		return NV20_3D_TEX_FORMAT_FORMAT_DXT3;
+
+	case MESA_FORMAT_RGBA_DXT5:
+		return NV20_3D_TEX_FORMAT_FORMAT_DXT5;
+
 	default:
 		assert(0);
 	}
-- 
1.7.8.5

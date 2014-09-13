From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH] nouveau: fix glCompressedTexImage
Date: Sat, 13 Sep 2014 18:16:44 -0400
Message-ID: <1410646604-29966-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

mesa_texstore expects pixel data, not compressed data. For compressed
textures, we want to just copy the bits in without any conversion.

Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
---
 src/mesa/drivers/dri/nouveau/nouveau_texture.c | 65 ++++++++++++++++++++------
 1 file changed, 52 insertions(+), 13 deletions(-)

diff --git a/src/mesa/drivers/dri/nouveau/nouveau_texture.c b/src/mesa/drivers/dri/nouveau/nouveau_texture.c
index 4626cc3..dc5699c 100644
--- a/src/mesa/drivers/dri/nouveau/nouveau_texture.c
+++ b/src/mesa/drivers/dri/nouveau/nouveau_texture.c
@@ -413,6 +413,31 @@ get_teximage_placement(struct gl_texture_image *ti)
 }
 
 static void
+nouveau_compressed_copy(struct gl_context *ctx, GLint dims,
+			struct gl_texture_image *ti,
+			GLsizei width, GLsizei height, GLsizei depth,
+			const GLvoid *src, GLvoid *dst, int row_stride)
+{
+	struct compressed_pixelstore store;
+	int i;
+
+	_mesa_compute_compressed_pixelstore(dims, ti->TexFormat,
+					    width, height, depth,
+					    &ctx->Unpack, &store);
+
+	src += store.SkipBytes;
+
+	assert(store.CopySlices == 1);
+
+	/* copy rows of blocks */
+	for (i = 0; i < store.CopyRowsPerSlice; i++) {
+		memcpy(dst, src, store.CopyBytesPerRow);
+		dst += row_stride;
+		src += store.TotalBytesPerRow;
+	}
+}
+
+static void
 nouveau_teximage(struct gl_context *ctx, GLint dims,
 		 struct gl_texture_image *ti,
 		 GLsizei imageSize,
@@ -451,13 +476,19 @@ nouveau_teximage(struct gl_context *ctx, GLint dims,
 					  GL_MAP_WRITE_BIT,
 					  &map, &row_stride);
 
-		ret = _mesa_texstore(ctx, dims, ti->_BaseFormat,
-				     ti->TexFormat,
-				     row_stride,
-				     &map,
-				     ti->Width, ti->Height, depth,
-				     format, type, pixels, packing);
-		assert(ret);
+		if (compressed) {
+			nouveau_compressed_copy(ctx, dims, ti,
+						ti->Width, ti->Height, depth,
+						pixels, map, row_stride);
+		} else {
+			ret = _mesa_texstore(ctx, dims, ti->_BaseFormat,
+					     ti->TexFormat,
+					     row_stride,
+					     &map,
+					     ti->Width, ti->Height, depth,
+					     format, type, pixels, packing);
+			assert(ret);
+		}
 
 		nouveau_unmap_texture_image(ctx, ti, 0);
 		_mesa_unmap_teximage_pbo(ctx, packing);
@@ -502,7 +533,8 @@ static GLboolean
 nouveau_teximage_alloc(struct gl_context *ctx, struct gl_texture_image *ti)
 {
 	nouveau_teximage(ctx, 3, ti, 0, 0, 0, NULL,
-			 &ctx->DefaultPacking, GL_FALSE);
+			 &ctx->DefaultPacking,
+			 _mesa_is_format_compressed(ti->TexFormat));
 	return GL_TRUE;
 }
 
@@ -535,11 +567,18 @@ nouveau_texsubimage(struct gl_context *ctx, GLint dims,
 					  xoffset, yoffset, width, height,
 					  GL_MAP_WRITE_BIT, &map, &row_stride);
 
-		ret = _mesa_texstore(ctx, dims, ti->_BaseFormat, ti->TexFormat,
-				     row_stride, &map,
-                                     width, height, depth,
-				     format, type, pixels, packing);
-		assert(ret);
+		if (compressed) {
+			nouveau_compressed_copy(ctx, dims, ti,
+						width, height, depth,
+						pixels, map, row_stride);
+		} else {
+			ret = _mesa_texstore(ctx, dims, ti->_BaseFormat,
+					     ti->TexFormat,
+					     row_stride, &map,
+					     width, height, depth,
+					     format, type, pixels, packing);
+			assert(ret);
+		}
 
 		nouveau_unmap_texture_image(ctx, ti, 0);
 		_mesa_unmap_teximage_pbo(ctx, packing);
-- 
1.8.5.5

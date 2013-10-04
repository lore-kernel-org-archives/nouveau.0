From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: [PATCH] nouveau_vieux: add AllocTextureImageBuffer
	implementation
Date: Fri,  4 Oct 2013 04:28:58 -0400
Message-ID: <1380875338-25572-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/mesa-dev>
List-Post: <mailto:mesa-dev@lists.freedesktop.org>
List-Help: <mailto:mesa-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org
Errors-To: mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org
To: Francisco Jerez <currojerez@riseup.net>
Cc: mesa-dev@lists.freedesktop.org, nouveau@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

This fixes issues where get_rt_format would see a 0 format because the
nouveau_surface had not been properly initialized. Fixes crash on
supertuxkart startup (which still fails due to out-of-vram issues).

Signed-off-by: Ilia Mirkin <imirkin@alum.mit.edu>
---
 src/mesa/drivers/dri/nouveau/nouveau_texture.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/src/mesa/drivers/dri/nouveau/nouveau_texture.c b/src/mesa/drivers/dri/nouveau/nouveau_texture.c
index da74e8f..8904389 100644
--- a/src/mesa/drivers/dri/nouveau/nouveau_texture.c
+++ b/src/mesa/drivers/dri/nouveau/nouveau_texture.c
@@ -494,6 +494,14 @@ nouveau_compressed_teximage(struct gl_context *ctx, GLuint dims,
 			 &ctx->Unpack, GL_TRUE);
 }
 
+static GLboolean
+nouveau_teximage_alloc(struct gl_context *ctx, struct gl_texture_image *ti)
+{
+	nouveau_teximage(ctx, 3, ti, 0, 0, 0, NULL,
+			 &ctx->DefaultPacking, GL_FALSE);
+	return GL_TRUE;
+}
+
 static void
 nouveau_texsubimage(struct gl_context *ctx, GLint dims,
 		    struct gl_texture_image *ti,
@@ -634,6 +642,7 @@ nouveau_texture_functions_init(struct dd_function_table *functions)
 	functions->DeleteTexture = nouveau_texture_free;
 	functions->NewTextureImage = nouveau_teximage_new;
 	functions->FreeTextureImageBuffer = nouveau_teximage_free;
+	functions->AllocTextureImageBuffer = nouveau_teximage_alloc;
 	functions->ChooseTextureFormat = nouveau_choose_tex_format;
 	functions->TexImage = nouveau_teximage_123d;
 	functions->TexSubImage = nouveau_texsubimage_123d;
-- 
1.8.1.5

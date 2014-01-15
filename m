From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: [PATCH v2] nouveau: add framebuffer validation callback
Date: Tue, 14 Jan 2014 19:50:33 -0500
Message-ID: <1389747033-1645-1-git-send-email-imirkin@alum.mit.edu>
References: <87ha96n8tc.fsf@riseup.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <mesa-dev-bounces@lists.freedesktop.org>
In-Reply-To: <87ha96n8tc.fsf@riseup.net>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/mesa-dev>
List-Post: <mailto:mesa-dev@lists.freedesktop.org>
List-Help: <mailto:mesa-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: mesa-dev-bounces@lists.freedesktop.org
Errors-To: mesa-dev-bounces@lists.freedesktop.org
To: Francisco Jerez <currojerez@riseup.net>
Cc: mesa-dev@lists.freedesktop.org, nouveau@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

Fixes assertions when trying to attach textures to fbs with formats not
supported by the render engines.

See https://bugs.freedesktop.org/show_bug.cgi?id=73459

Signed-off-by: Ilia Mirkin <imirkin@alum.mit.edu>
---

Francisco, thanks for the review. Is this more like what you had in mind?
Interesting that nv10/nv20 support different-bitness color/depth -- that
requirement came back for nv30/nv40.

 src/mesa/drivers/dri/nouveau/nouveau_context.c |  1 +
 src/mesa/drivers/dri/nouveau/nouveau_fbo.c     | 52 ++++++++++++++++++++++++++
 2 files changed, 53 insertions(+)

diff --git a/src/mesa/drivers/dri/nouveau/nouveau_context.c b/src/mesa/drivers/dri/nouveau/nouveau_context.c
index 181c9d0..ec474d4 100644
--- a/src/mesa/drivers/dri/nouveau/nouveau_context.c
+++ b/src/mesa/drivers/dri/nouveau/nouveau_context.c
@@ -187,6 +187,7 @@ nouveau_context_init(struct gl_context *ctx, struct nouveau_screen *screen,
 	ctx->Extensions.EXT_framebuffer_blit = true;
 	ctx->Extensions.EXT_texture_filter_anisotropic = true;
 	ctx->Extensions.NV_texture_env_combine4 = true;
+	ctx->Const.MaxColorAttachments = 1;
 
 	return GL_TRUE;
 }
diff --git a/src/mesa/drivers/dri/nouveau/nouveau_fbo.c b/src/mesa/drivers/dri/nouveau/nouveau_fbo.c
index 25543e4..427eb00 100644
--- a/src/mesa/drivers/dri/nouveau/nouveau_fbo.c
+++ b/src/mesa/drivers/dri/nouveau/nouveau_fbo.c
@@ -268,6 +268,57 @@ nouveau_finish_render_texture(struct gl_context *ctx,
 	texture_dirty(rb->TexImage->TexObject);
 }
 
+static int
+validate_format_bpp(gl_format format)
+{
+	switch (format) {
+	case MESA_FORMAT_XRGB8888:
+	case MESA_FORMAT_ARGB8888:
+	case MESA_FORMAT_Z24_S8:
+		return 32;
+	case MESA_FORMAT_RGB565:
+	case MESA_FORMAT_Z16:
+		return 16;
+	default:
+		return 0;
+	}
+}
+
+static void
+nouveau_check_framebuffer_complete(struct gl_context *ctx,
+				   struct gl_framebuffer *fb)
+{
+	const struct nouveau_driver *drv = context_drv(ctx);
+	struct gl_renderbuffer_attachment *color =
+		&fb->Attachment[BUFFER_COLOR0];
+	struct gl_renderbuffer_attachment *depth =
+		&fb->Attachment[BUFFER_DEPTH];
+	int color_bpp = 0, zeta_bpp;
+
+	if (color->Type == GL_TEXTURE) {
+		color_bpp = validate_format_bpp(
+				color->Renderbuffer->TexImage->TexFormat);
+		if (!color_bpp)
+			goto err;
+	}
+
+	if (depth->Type == GL_TEXTURE) {
+		zeta_bpp = validate_format_bpp(
+				depth->Renderbuffer->TexImage->TexFormat);
+		if (!zeta_bpp)
+			goto err;
+		/* NV04/NV05 requires same bpp-ness for color/zeta */
+		if (context_chipset(ctx) < 0x10 &&
+		    color_bpp && color_bpp != zeta_bpp)
+			goto err;
+	}
+
+	return;
+err:
+	fb->_Status = GL_FRAMEBUFFER_UNSUPPORTED_EXT;
+	return;
+}
+
 void
 nouveau_fbo_functions_init(struct dd_function_table *functions)
 {
@@ -279,4 +330,5 @@ nouveau_fbo_functions_init(struct dd_function_table *functions)
 	functions->FramebufferRenderbuffer = nouveau_framebuffer_renderbuffer;
 	functions->RenderTexture = nouveau_render_texture;
 	functions->FinishRenderTexture = nouveau_finish_render_texture;
+	functions->ValidateFramebuffer = nouveau_check_framebuffer_complete;
 }
-- 
1.8.3.2

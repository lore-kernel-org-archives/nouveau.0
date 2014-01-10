From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH] nouveau: add framebuffer validation callback
Date: Fri, 10 Jan 2014 14:11:47 -0500
Message-ID: <1389381107-13955-1-git-send-email-imirkin@alum.mit.edu>
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
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Cc: mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Fixes assertions when trying to attach textures to fbs with formats not
supported by the render engines.

See https://bugs.freedesktop.org/show_bug.cgi?id=73459

Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
---

In a perfect world I'd have separate callbacks for depth and color, but given
the list of supported values, I don't think this matters. Also I used
st_validate_framebuffer as a template, but I don't know if there can actually
be many attachments. Should MaxColorAttachments be set to 1? I think it's set
to 8 right now.

And there's also an odd nouveau_validate_framebuffer thing in
nouveau_context.c, but I think that's related to actually
rendering/invalidating the fb displayed to the screen.

 src/mesa/drivers/dri/nouveau/nouveau_driver.h |  1 +
 src/mesa/drivers/dri/nouveau/nouveau_fbo.c    | 38 +++++++++++++++++++++++++++
 src/mesa/drivers/dri/nouveau/nv04_context.c   | 14 ++++++++++
 src/mesa/drivers/dri/nouveau/nv10_context.c   | 16 +++++++++++
 src/mesa/drivers/dri/nouveau/nv20_context.c   | 16 +++++++++++
 5 files changed, 85 insertions(+)

diff --git a/src/mesa/drivers/dri/nouveau/nouveau_driver.h b/src/mesa/drivers/dri/nouveau/nouveau_driver.h
index e03b2c1..84953da 100644
--- a/src/mesa/drivers/dri/nouveau/nouveau_driver.h
+++ b/src/mesa/drivers/dri/nouveau/nouveau_driver.h
@@ -60,6 +60,7 @@ struct nouveau_driver {
 			     struct nouveau_surface *dst,
 			     unsigned mask, unsigned value,
 			     int dx, int dy, int w, int h);
+	bool (*is_rt_format_supported)(gl_format format);
 
 	nouveau_state_func *emit;
 	int num_emit;
diff --git a/src/mesa/drivers/dri/nouveau/nouveau_fbo.c b/src/mesa/drivers/dri/nouveau/nouveau_fbo.c
index 25543e4..fba0d52 100644
--- a/src/mesa/drivers/dri/nouveau/nouveau_fbo.c
+++ b/src/mesa/drivers/dri/nouveau/nouveau_fbo.c
@@ -268,6 +268,43 @@ nouveau_finish_render_texture(struct gl_context *ctx,
 	texture_dirty(rb->TexImage->TexObject);
 }
 
+static void
+nouveau_framebuffer_validate(struct gl_context *ctx,
+			     struct gl_framebuffer *fb)
+{
+	const struct nouveau_driver *drv = context_drv(ctx);
+	int i, count = 0;
+
+	for (i = 0; i < ctx->Const.MaxColorAttachments; i++) {
+		struct gl_renderbuffer_attachment *rba =
+			&fb->Attachment[BUFFER_COLOR0 + i];
+		if (rba->Type == GL_NONE)
+			continue;
+
+		count++;
+		if (rba->Type != GL_TEXTURE)
+			continue;
+
+		if (!drv->is_rt_format_supported(
+				    rba->Renderbuffer->TexImage->TexFormat))
+			goto err;
+	}
+	if (count > 1)
+		goto err;
+
+	if (fb->Attachment[BUFFER_DEPTH].Type == GL_TEXTURE) {
+		struct gl_texture_image *ti =
+			fb->Attachment[BUFFER_DEPTH].Renderbuffer->TexImage;
+		if (!drv->is_rt_format_supported(ti->TexFormat))
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
@@ -279,4 +316,5 @@ nouveau_fbo_functions_init(struct dd_function_table *functions)
 	functions->FramebufferRenderbuffer = nouveau_framebuffer_renderbuffer;
 	functions->RenderTexture = nouveau_render_texture;
 	functions->FinishRenderTexture = nouveau_finish_render_texture;
+	functions->ValidateFramebuffer = nouveau_framebuffer_validate;
 }
diff --git a/src/mesa/drivers/dri/nouveau/nv04_context.c b/src/mesa/drivers/dri/nouveau/nv04_context.c
index c198c03..665cadd 100644
--- a/src/mesa/drivers/dri/nouveau/nv04_context.c
+++ b/src/mesa/drivers/dri/nouveau/nv04_context.c
@@ -199,11 +199,25 @@ fail:
 	return NULL;
 }
 
+static bool
+nv04_is_rt_format_supported(gl_format format)
+{
+	switch (format) {
+	case MESA_FORMAT_XRGB8888:
+	case MESA_FORMAT_ARGB8888:
+	case MESA_FORMAT_RGB565:
+		return true;
+	default:
+		return false;
+	}
+}
+
 const struct nouveau_driver nv04_driver = {
 	.context_create = nv04_context_create,
 	.context_destroy = nv04_context_destroy,
 	.surface_copy = nv04_surface_copy,
 	.surface_fill = nv04_surface_fill,
+	.is_rt_format_supported = nv04_is_rt_format_supported,
 	.emit = (nouveau_state_func[]) {
 		nv04_defer_control,
 		nouveau_emit_nothing,
diff --git a/src/mesa/drivers/dri/nouveau/nv10_context.c b/src/mesa/drivers/dri/nouveau/nv10_context.c
index 1918f12..9c5cfcb 100644
--- a/src/mesa/drivers/dri/nouveau/nv10_context.c
+++ b/src/mesa/drivers/dri/nouveau/nv10_context.c
@@ -492,11 +492,27 @@ fail:
 	return NULL;
 }
 
+static bool
+nv10_is_rt_format_supported(gl_format format)
+{
+	switch (format) {
+	case MESA_FORMAT_XRGB8888:
+	case MESA_FORMAT_ARGB8888:
+	case MESA_FORMAT_RGB565:
+	case MESA_FORMAT_Z16:
+	case MESA_FORMAT_Z24_S8:
+		return true;
+	default:
+		return false;
+	}
+}
+
 const struct nouveau_driver nv10_driver = {
 	.context_create = nv10_context_create,
 	.context_destroy = nv10_context_destroy,
 	.surface_copy = nv04_surface_copy,
 	.surface_fill = nv04_surface_fill,
+       .is_rt_format_supported = nv10_is_rt_format_supported,
 	.emit = (nouveau_state_func[]) {
 		nv10_emit_alpha_func,
 		nv10_emit_blend_color,
diff --git a/src/mesa/drivers/dri/nouveau/nv20_context.c b/src/mesa/drivers/dri/nouveau/nv20_context.c
index 1d77132..e233025 100644
--- a/src/mesa/drivers/dri/nouveau/nv20_context.c
+++ b/src/mesa/drivers/dri/nouveau/nv20_context.c
@@ -500,11 +500,27 @@ fail:
 	return NULL;
 }
 
+static bool
+nv20_is_rt_format_supported(gl_format format)
+{
+	switch (format) {
+	case MESA_FORMAT_XRGB8888:
+	case MESA_FORMAT_ARGB8888:
+	case MESA_FORMAT_RGB565:
+	case MESA_FORMAT_Z16:
+	case MESA_FORMAT_Z24_S8:
+		return true;
+	default:
+		return false;
+	}
+}
+
 const struct nouveau_driver nv20_driver = {
 	.context_create = nv20_context_create,
 	.context_destroy = nv20_context_destroy,
 	.surface_copy = nv04_surface_copy,
 	.surface_fill = nv04_surface_fill,
+	.is_rt_format_supported = nv20_is_rt_format_supported,
 	.emit = (nouveau_state_func[]) {
 		nv10_emit_alpha_func,
 		nv10_emit_blend_color,
-- 
1.8.3.2

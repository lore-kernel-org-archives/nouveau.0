From: Pauli Nieminen <pauli.nieminen@linux.intel.com>
Subject: [PATCH 09/21] nouveau: Add support for ARB_sampler_object
Date: Mon, 11 Jun 2012 09:59:27 +0300
Message-ID: <1339397983-31219-18-git-send-email-pauli.nieminen@linux.intel.com>
References: <1339397983-31219-1-git-send-email-pauli.nieminen@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org>
In-Reply-To: <1339397983-31219-1-git-send-email-pauli.nieminen@linux.intel.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/mesa-dev>
List-Post: <mailto:mesa-dev@lists.freedesktop.org>
List-Help: <mailto:mesa-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org
Errors-To: mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org
To: mesa-dev@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

ARB_sampler_object is very simple software only extension to support.
I want to make it mandator extension for Mesa drivers to allow meta
module to use it.

This patch add support for the extension to nouveau. It is completely
untested search and replace patch. I hope someone with old NV hardware
could give a try that there is no regressions and ARB_sampler_object
tests passes.

Signed-off-by: Pauli Nieminen <pauli.nieminen@linux.intel.com>
CC: nouveau@lists.freedesktop.org
---
 src/mesa/drivers/dri/nouveau/nv04_state_tex.c |   22 ++++++++++++----------
 src/mesa/drivers/dri/nouveau/nv10_state_tex.c |   23 +++++++++++++----------
 src/mesa/drivers/dri/nouveau/nv20_state_tex.c |   25 ++++++++++++++-----------
 3 files changed, 39 insertions(+), 31 deletions(-)

diff --git a/src/mesa/drivers/dri/nouveau/nv04_state_tex.c b/src/mesa/drivers/dri/nouveau/nv04_state_tex.c
index 807e2f3..e4d695a 100644
--- a/src/mesa/drivers/dri/nouveau/nv04_state_tex.c
+++ b/src/mesa/drivers/dri/nouveau/nv04_state_tex.c
@@ -32,6 +32,7 @@
 #include "nv_object.xml.h"
 #include "nv04_3d.xml.h"
 #include "nv04_driver.h"
+#include "main/samplerobj.h"
 
 static uint32_t
 get_tex_format(struct gl_texture_image *ti)
@@ -67,6 +68,7 @@ nv04_emit_tex_obj(struct gl_context *ctx, int emit)
 	if (ctx->Texture.Unit[i]._ReallyEnabled) {
 		struct gl_texture_object *t = ctx->Texture.Unit[i]._Current;
 		struct gl_texture_image *ti = t->Image[0][t->BaseLevel];
+		const struct gl_sampler_object *sa = _mesa_get_samplerobj(ctx, i);
 		int lod_max = 1, lod_bias = 0;
 
 		if (!nouveau_texture_validate(ctx, t))
@@ -74,26 +76,26 @@ nv04_emit_tex_obj(struct gl_context *ctx, int emit)
 
 		s = &to_nouveau_texture(t)->surfaces[t->BaseLevel];
 
-		if (t->Sampler.MinFilter != GL_NEAREST &&
-		    t->Sampler.MinFilter != GL_LINEAR) {
-			lod_max = CLAMP(MIN2(t->Sampler.MaxLod, t->_MaxLambda),
+		if (sa->MinFilter != GL_NEAREST &&
+		    sa->MinFilter != GL_LINEAR) {
+			lod_max = CLAMP(MIN2(sa->MaxLod, t->_MaxLambda),
 					0, 15) + 1;
 
 			lod_bias = CLAMP(ctx->Texture.Unit[i].LodBias +
-					 t->Sampler.LodBias, -16, 15) * 8;
+					 sa->LodBias, -16, 15) * 8;
 		}
 
-		format |= nvgl_wrap_mode(t->Sampler.WrapT) << 28 |
-			nvgl_wrap_mode(t->Sampler.WrapS) << 24 |
+		format |= nvgl_wrap_mode(sa->WrapT) << 28 |
+			nvgl_wrap_mode(sa->WrapS) << 24 |
 			ti->HeightLog2 << 20 |
 			ti->WidthLog2 << 16 |
 			lod_max << 12 |
 			get_tex_format(ti);
 
-		filter |= log2i(t->Sampler.MaxAnisotropy) << 31 |
-			nvgl_filter_mode(t->Sampler.MagFilter) << 28 |
-			log2i(t->Sampler.MaxAnisotropy) << 27 |
-			nvgl_filter_mode(t->Sampler.MinFilter) << 24 |
+		filter |= log2i(sa->MaxAnisotropy) << 31 |
+			nvgl_filter_mode(sa->MagFilter) << 28 |
+			log2i(sa->MaxAnisotropy) << 27 |
+			nvgl_filter_mode(sa->MinFilter) << 24 |
 			(lod_bias & 0xff) << 16;
 
 	} else {
diff --git a/src/mesa/drivers/dri/nouveau/nv10_state_tex.c b/src/mesa/drivers/dri/nouveau/nv10_state_tex.c
index b467bb3..3b76d66 100644
--- a/src/mesa/drivers/dri/nouveau/nv10_state_tex.c
+++ b/src/mesa/drivers/dri/nouveau/nv10_state_tex.c
@@ -31,6 +31,7 @@
 #include "nv10_3d.xml.h"
 #include "nouveau_util.h"
 #include "nv10_driver.h"
+#include "main/samplerobj.h"
 
 void
 nv10_emit_tex_gen(struct gl_context *ctx, int emit)
@@ -159,6 +160,7 @@ nv10_emit_tex_obj(struct gl_context *ctx, int emit)
 	struct gl_texture_object *t;
 	struct nouveau_surface *s;
 	struct gl_texture_image *ti;
+	const struct gl_sampler_object *sa;
 	uint32_t tx_format, tx_filter, tx_enable;
 
 	PUSH_RESET(push, BUFCTX_TEX(i));
@@ -172,22 +174,23 @@ nv10_emit_tex_obj(struct gl_context *ctx, int emit)
 	t = ctx->Texture.Unit[i]._Current;
 	s = &to_nouveau_texture(t)->surfaces[t->BaseLevel];
 	ti = t->Image[0][t->BaseLevel];
+	sa = _mesa_get_samplerobj(ctx, i);
 
 	if (!nouveau_texture_validate(ctx, t))
 		return;
 
 	/* Recompute the texturing registers. */
-	tx_format = nvgl_wrap_mode(t->Sampler.WrapT) << 28
-		| nvgl_wrap_mode(t->Sampler.WrapS) << 24
+	tx_format = nvgl_wrap_mode(sa->WrapT) << 28
+		| nvgl_wrap_mode(sa->WrapS) << 24
 		| ti->HeightLog2 << 20
 		| ti->WidthLog2 << 16
 		| 5 << 4 | 1 << 12;
 
-	tx_filter = nvgl_filter_mode(t->Sampler.MagFilter) << 28
-		| nvgl_filter_mode(t->Sampler.MinFilter) << 24;
+	tx_filter = nvgl_filter_mode(sa->MagFilter) << 28
+		| nvgl_filter_mode(sa->MinFilter) << 24;
 
 	tx_enable = NV10_3D_TEX_ENABLE_ENABLE
-		| log2i(t->Sampler.MaxAnisotropy) << 4;
+		| log2i(sa->MaxAnisotropy) << 4;
 
 	if (t->Target == GL_TEXTURE_RECTANGLE) {
 		BEGIN_NV04(push, NV10_3D(TEX_NPOT_PITCH(i)), 1);
@@ -200,11 +203,11 @@ nv10_emit_tex_obj(struct gl_context *ctx, int emit)
 		tx_format |= get_tex_format_pot(ti);
 	}
 
-	if (t->Sampler.MinFilter != GL_NEAREST &&
-	    t->Sampler.MinFilter != GL_LINEAR) {
-		int lod_min = t->Sampler.MinLod;
-		int lod_max = MIN2(t->Sampler.MaxLod, t->_MaxLambda);
-		int lod_bias = t->Sampler.LodBias
+	if (sa->MinFilter != GL_NEAREST &&
+	    sa->MinFilter != GL_LINEAR) {
+		int lod_min = sa->MinLod;
+		int lod_max = MIN2(sa->MaxLod, t->_MaxLambda);
+		int lod_bias = sa->LodBias
 			+ ctx->Texture.Unit[i].LodBias;
 
 		lod_max = CLAMP(lod_max, 0, 15);
diff --git a/src/mesa/drivers/dri/nouveau/nv20_state_tex.c b/src/mesa/drivers/dri/nouveau/nv20_state_tex.c
index d8bfdf2..ffbc2df 100644
--- a/src/mesa/drivers/dri/nouveau/nv20_state_tex.c
+++ b/src/mesa/drivers/dri/nouveau/nv20_state_tex.c
@@ -31,6 +31,7 @@
 #include "nv20_3d.xml.h"
 #include "nouveau_util.h"
 #include "nv20_driver.h"
+#include "main/samplerobj.h"
 
 void
 nv20_emit_tex_gen(struct gl_context *ctx, int emit)
@@ -163,6 +164,7 @@ nv20_emit_tex_obj(struct gl_context *ctx, int emit)
 	struct gl_texture_object *t;
 	struct nouveau_surface *s;
 	struct gl_texture_image *ti;
+	const struct gl_sampler_object *sa;
 	uint32_t tx_format, tx_filter, tx_wrap, tx_enable;
 
 	PUSH_RESET(push, BUFCTX_TEX(i));
@@ -178,6 +180,7 @@ nv20_emit_tex_obj(struct gl_context *ctx, int emit)
 	t = ctx->Texture.Unit[i]._Current;
 	s = &to_nouveau_texture(t)->surfaces[t->BaseLevel];
 	ti = t->Image[0][t->BaseLevel];
+	sa = _mesa_get_samplerobj(ctx, i);
 
 	if (!nouveau_texture_validate(ctx, t))
 		return;
@@ -190,16 +193,16 @@ nv20_emit_tex_obj(struct gl_context *ctx, int emit)
 		| NV20_3D_TEX_FORMAT_NO_BORDER
 		| 1 << 16;
 
-	tx_wrap = nvgl_wrap_mode(t->Sampler.WrapR) << 16
-		| nvgl_wrap_mode(t->Sampler.WrapT) << 8
-		| nvgl_wrap_mode(t->Sampler.WrapS) << 0;
+	tx_wrap = nvgl_wrap_mode(sa->WrapR) << 16
+		| nvgl_wrap_mode(sa->WrapT) << 8
+		| nvgl_wrap_mode(sa->WrapS) << 0;
 
-	tx_filter = nvgl_filter_mode(t->Sampler.MagFilter) << 24
-		| nvgl_filter_mode(t->Sampler.MinFilter) << 16
+	tx_filter = nvgl_filter_mode(sa->MagFilter) << 24
+		| nvgl_filter_mode(sa->MinFilter) << 16
 		| 2 << 12;
 
 	tx_enable = NV20_3D_TEX_ENABLE_ENABLE
-		| log2i(t->Sampler.MaxAnisotropy) << 4;
+		| log2i(sa->MaxAnisotropy) << 4;
 
 	if (t->Target == GL_TEXTURE_RECTANGLE) {
 		BEGIN_NV04(push, NV20_3D(TEX_NPOT_PITCH(i)), 1);
@@ -212,11 +215,11 @@ nv20_emit_tex_obj(struct gl_context *ctx, int emit)
 		tx_format |= get_tex_format_pot(ti);
 	}
 
-	if (t->Sampler.MinFilter != GL_NEAREST &&
-	    t->Sampler.MinFilter != GL_LINEAR) {
-		int lod_min = t->Sampler.MinLod;
-		int lod_max = MIN2(t->Sampler.MaxLod, t->_MaxLambda);
-		int lod_bias = t->Sampler.LodBias
+	if (sa->MinFilter != GL_NEAREST &&
+	    sa->MinFilter != GL_LINEAR) {
+		int lod_min = sa->MinLod;
+		int lod_max = MIN2(sa->MaxLod, t->_MaxLambda);
+		int lod_bias = sa->LodBias
 			+ ctx->Texture.Unit[i].LodBias;
 
 		lod_max = CLAMP(lod_max, 0, 15);
-- 
1.7.9.5

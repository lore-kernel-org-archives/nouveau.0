From: randrianasulu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Subject: Fwd: Small demagic patch for nv04 plus two tables for
	discussion
Date: Wed, 15 Sep 2010 20:30:22 +0400
Message-ID: <201009152030.22860.randrianasulu@gmail.com>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_eSPkM8C/ROdfsae"
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
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--Boundary-00=_eSPkM8C/ROdfsae
Content-Type: text/plain;
  charset="windows-1251"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Sorry, demagic patch had typo, and it broke compilation here! Rebased and=20
fixed one attached


=2D---------  =CF=E5=F0=E5=F1=EB=E0=ED=ED=EE=E5 =F1=EE=EE=E1=F9=E5=ED=E8=E5=
  ----------

=D2=E5=EC=E0: Small demagic patch for nv04 plus two tables for discussion
=C4=E0=F2=E0: =D1=F0=E5=E4=E0 15 =F1=E5=ED=F2=FF=E1=F0=FF 2010
=CE=F2=EF=F0=E0=E2=E8=F2=E5=EB=FC: randrianasulu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
=CF=EE=EB=F3=F7=E0=F2=E5=EB=FC:  nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

Hello all!

Unfortunately, this patch creates too-long lines, but i really prefer symbo=
lic=20
names, when they defined everywhere else.

Studying  texture combiners, i  created two tables, they probably has some=
=20
errors, but I want to be pointed at errors before i even start to code, so=
=20
please comment on them:



sources:
[1] http://www.opengl.org/sdk/docs/man/xhtml/glTexEnv.xml
[2] http://www.gamecareerguide.com/features/19981009/multitexturing_01.htm
[3] IRC talk=20
[4]=20
http://people.freedesktop.org/~idr/2007Q4-VGP351/20071106%20-%20Texture%20m=
apping,
%20part%203.pdf


=2D------------------------------------------------------

--Boundary-00=_eSPkM8C/ROdfsae
Content-Type: text/x-diff;
  charset="iso 8859-1";
  name="0001-nv0x-demagic-nv04_state_raster.c-and-nv04_state_tex..patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="0001-nv0x-demagic-nv04_state_raster.c-and-nv04_state_tex..patch"

=46rom d253d21ac4097ddf9787ad7b4e099c1f40968758 Mon Sep 17 00:00:00 2001
=46rom: Andrew Randrianasulu <randrianasulu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Date: Wed, 15 Sep 2010 19:40:16 +0400
Subject: [PATCH] nv0x: demagic nv04_state_raster.c and nv04_state_tex.c
 Unfortunately, lines go over 80 char limit

=2D--
 src/mesa/drivers/dri/nouveau/nv04_state_raster.c |   30 +++++++++++-------=
=2D---
 src/mesa/drivers/dri/nouveau/nv04_state_tex.c    |   22 ++++++++--------
 2 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/src/mesa/drivers/dri/nouveau/nv04_state_raster.c b/src/mesa/dr=
ivers/dri/nouveau/nv04_state_raster.c
index c191571..d478ace 100644
=2D-- a/src/mesa/drivers/dri/nouveau/nv04_state_raster.c
+++ b/src/mesa/drivers/dri/nouveau/nv04_state_raster.c
@@ -176,13 +176,13 @@ nv04_emit_control(GLcontext *ctx, int emit)
 		if (ctx->Depth.Mask)
 			ctrl0 |=3D NV04_MULTITEX_TRIANGLE_CONTROL0_Z_WRITE;
=20
=2D		ctrl0 |=3D get_comparison_op(ctx->Depth.Func) << 16;
+		ctrl0 |=3D get_comparison_op(ctx->Depth.Func) << NV04_MULTITEX_TRIANGLE_=
CONTROL0_Z_FUNC_SHIFT;
=20
 		/* Alpha test. */
 		if (ctx->Color.AlphaEnabled)
 			ctrl0 |=3D NV04_MULTITEX_TRIANGLE_CONTROL0_ALPHA_ENABLE;
=20
=2D		ctrl0 |=3D get_comparison_op(ctx->Color.AlphaFunc) << 8 |
+		ctrl0 |=3D get_comparison_op(ctx->Color.AlphaFunc) << NV04_MULTITEX_TRIA=
NGLE_CONTROL0_ALPHA_FUNC_SHIFT |
 			FLOAT_TO_UBYTE(ctx->Color.AlphaRef);
=20
 		/* Stencil test. */
@@ -192,13 +192,13 @@ nv04_emit_control(GLcontext *ctx, int emit)
 		if (ctx->Stencil.Enabled)
 			ctrl1 |=3D NV04_MULTITEX_TRIANGLE_CONTROL1_STENCIL_ENABLE;
=20
=2D		ctrl1 |=3D get_comparison_op(ctx->Stencil.Function[0]) << 4 |
=2D			ctx->Stencil.Ref[0] << 8 |
=2D			ctx->Stencil.ValueMask[0] << 16 |
=2D			ctx->Stencil.WriteMask[0] << 24;
+		ctrl1 |=3D get_comparison_op(ctx->Stencil.Function[0]) << NV04_MULTITEX_=
TRIANGLE_CONTROL1_STENCIL_FUNC_SHIFT |
+			ctx->Stencil.Ref[0] << NV04_MULTITEX_TRIANGLE_CONTROL1_STENCIL_REF_SHIF=
T |
+			ctx->Stencil.ValueMask[0] << NV04_MULTITEX_TRIANGLE_CONTROL1_STENCIL_MA=
SK_READ_SHIFT |
+			ctx->Stencil.WriteMask[0] << NV04_MULTITEX_TRIANGLE_CONTROL1_STENCIL_MA=
SK_WRITE_SHIFT;
=20
=2D		ctrl2 |=3D get_stencil_op(ctx->Stencil.ZPassFunc[0]) << 8 |
=2D			get_stencil_op(ctx->Stencil.ZFailFunc[0]) << 4 |
+		ctrl2 |=3D get_stencil_op(ctx->Stencil.ZPassFunc[0]) << NV04_MULTITEX_TR=
IANGLE_CONTROL2_STENCIL_OP_ZPASS_SHIFT |
+			get_stencil_op(ctx->Stencil.ZFailFunc[0]) << NV04_MULTITEX_TRIANGLE_CON=
TROL2_STENCIL_OP_ZFAIL_SHIFT |
 			get_stencil_op(ctx->Stencil.FailFunc[0]);
=20
 		BEGIN_RING(chan, fahrenheit, NV04_MULTITEX_TRIANGLE_CONTROL0, 3);
@@ -209,7 +209,7 @@ nv04_emit_control(GLcontext *ctx, int emit)
 	} else {
 		int cull_mode =3D ctx->Polygon.CullFaceMode;
 		int front_face =3D ctx->Polygon.FrontFace;
=2D		uint32_t ctrl =3D 1 << 30 |
+		uint32_t ctrl =3D 1 << 30 /* Probably Z buffer format */ |
 			NV04_TEXTURED_TRIANGLE_CONTROL_ORIGIN;
=20
 		/* Dithering. */
@@ -232,13 +232,13 @@ nv04_emit_control(GLcontext *ctx, int emit)
 		if (ctx->Depth.Mask)
 			ctrl |=3D NV04_TEXTURED_TRIANGLE_CONTROL_Z_WRITE;
=20
=2D		ctrl |=3D get_comparison_op(ctx->Depth.Func) << 16;
+		ctrl |=3D get_comparison_op(ctx->Depth.Func) << NV04_TEXTURED_TRIANGLE_C=
ONTROL_Z_FUNC_SHIFT;
=20
 		/* Alpha test. */
 		if (ctx->Color.AlphaEnabled)
 			ctrl |=3D NV04_TEXTURED_TRIANGLE_CONTROL_ALPHA_ENABLE;
=20
=2D		ctrl |=3D get_comparison_op(ctx->Color.AlphaFunc) << 8 |
+		ctrl |=3D get_comparison_op(ctx->Color.AlphaFunc) << NV04_TEXTURED_TRIAN=
GLE_CONTROL_ALPHA_FUNC_SHIFT |
 			FLOAT_TO_UBYTE(ctx->Color.AlphaRef);
=20
 		BEGIN_RING(chan, fahrenheit, NV04_TEXTURED_TRIANGLE_CONTROL, 1);
@@ -263,8 +263,8 @@ nv04_emit_blend(GLcontext *ctx, int emit)
 			NV04_MULTITEX_TRIANGLE_BLEND_TEXTURE_PERSPECTIVE_ENABLE;
=20
 		/* Alpha blending. */
=2D		blend |=3D get_blend_func(ctx->Color.BlendDstRGB) << 28 |
=2D			get_blend_func(ctx->Color.BlendSrcRGB) << 24;
+		blend |=3D get_blend_func(ctx->Color.BlendDstRGB) << NV04_MULTITEX_TRIAN=
GLE_BLEND_DST_SHIFT |
+			get_blend_func(ctx->Color.BlendSrcRGB) << NV04_MULTITEX_TRIANGLE_BLEND_=
SRC_SHIFT;
=20
 		if (ctx->Color.BlendEnabled)
 			blend |=3D NV04_MULTITEX_TRIANGLE_BLEND_BLEND_ENABLE;
@@ -295,8 +295,8 @@ nv04_emit_blend(GLcontext *ctx, int emit)
 			NV04_TEXTURED_TRIANGLE_BLEND_TEXTURE_PERSPECTIVE_ENABLE;
=20
 		/* Alpha blending. */
=2D		blend |=3D get_blend_func(ctx->Color.BlendDstRGB) << 28 |
=2D			get_blend_func(ctx->Color.BlendSrcRGB) << 24;
+		blend |=3D get_blend_func(ctx->Color.BlendDstRGB) << NV04_TEXTURED_TRIAN=
GLE_BLEND_DST_SHIFT |
+			get_blend_func(ctx->Color.BlendSrcRGB) << NV04_TEXTURED_TRIANGLE_BLEND_=
SRC_SHIFT;
=20
 		if (ctx->Color.BlendEnabled)
 			blend |=3D NV04_TEXTURED_TRIANGLE_BLEND_BLEND_ENABLE;
diff --git a/src/mesa/drivers/dri/nouveau/nv04_state_tex.c b/src/mesa/drive=
rs/dri/nouveau/nv04_state_tex.c
index 6d8762b..80b70ee 100644
=2D-- a/src/mesa/drivers/dri/nouveau/nv04_state_tex.c
+++ b/src/mesa/drivers/dri/nouveau/nv04_state_tex.c
@@ -106,25 +106,25 @@ nv04_emit_tex_obj(GLcontext *ctx, int emit)
 					 t->LodBias, 0, 15);
 		}
=20
=2D		format |=3D get_wrap_mode(t->WrapT) << 28 |
=2D			get_wrap_mode(t->WrapS) << 24 |
=2D			ti->HeightLog2 << 20 |
=2D			ti->WidthLog2 << 16 |
=2D			lod_max << 12 |
+		format |=3D get_wrap_mode(t->WrapT) << NV04_MULTITEX_TRIANGLE_FORMAT_ADD=
RESSV_SHIFT |
+			get_wrap_mode(t->WrapS) << NV04_MULTITEX_TRIANGLE_FORMAT_ADDRESSU_SHIFT=
 |
+			ti->HeightLog2 << NV04_MULTITEX_TRIANGLE_FORMAT_BASE_SIZE_V_SHIFT |
+			ti->WidthLog2 << NV04_MULTITEX_TRIANGLE_FORMAT_BASE_SIZE_U_SHIFT |
+			lod_max << NV04_MULTITEX_TRIANGLE_FORMAT_MIPMAP_LEVELS_SHIFT |
 			get_tex_format(ti);
=20
=2D		filter |=3D log2i(t->MaxAnisotropy) << 31 |
=2D			nvgl_filter_mode(t->MagFilter) << 28 |
=2D			log2i(t->MaxAnisotropy) << 27 |
=2D			nvgl_filter_mode(t->MinFilter) << 24 |
=2D			lod_bias << 16;
+		filter |=3D log2i(t->MaxAnisotropy) << NV04_MULTITEX_TRIANGLE_FILTER_ANI=
SOTROPIC_MAGNIFY_ENABLE |
+			nvgl_filter_mode(t->MagFilter) << NV04_MULTITEX_TRIANGLE_FILTER_MAGNIFY=
_SHIFT |
+			log2i(t->MaxAnisotropy) << NV04_MULTITEX_TRIANGLE_FILTER_ANISOTROPIC_MI=
NIFY_ENABLE |
+			nvgl_filter_mode(t->MinFilter) << NV04_MULTITEX_TRIANGLE_FILTER_MINIFY_=
SHIFT |
+			lod_bias << NV04_MULTITEX_TRIANGLE_FILTER_MIPMAP_LODBIAS_SHIFT;
=20
 	} else {
 		s =3D &to_nv04_context(ctx)->dummy_texture;
=20
 		format |=3D NV04_TEXTURED_TRIANGLE_FORMAT_ADDRESSU_REPEAT |
 			NV04_TEXTURED_TRIANGLE_FORMAT_ADDRESSV_REPEAT |
=2D			1 << 12 |
+			1 << NV04_TEXTURED_TRIANGLE_FORMAT_MIPMAP_LEVELS_SHIFT |
 			NV04_TEXTURED_TRIANGLE_FORMAT_COLOR_A8R8G8B8;
=20
 		filter |=3D NV04_TEXTURED_TRIANGLE_FILTER_MINIFY_NEAREST |
=2D-=20
1.7.0.2


--Boundary-00=_eSPkM8C/ROdfsae
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--Boundary-00=_eSPkM8C/ROdfsae--

From: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
Subject: gallium: adjust to PIPE_FORMAT name changes
Date: Tue, 02 Mar 2010 18:52:07 +0100
Message-ID: <4B8D5047.2040802@student.tuwien.ac.at>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------020609080300010900000407"
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
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

This is a multi-part message in MIME format.
--------------020609080300010900000407
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Just checking, did I miss something ?

And in nv40_fragtex.c

_(Z24S8_UNORM   , Z24     ,   S1,   S1,   S1,  ONE, X, X, X, X, 0, 0, 0, 0),

has been wrong all along and is fixed now automatically, correct ?
(the Z is in the low 3 bytes, previous naming implied it would be in
the high bytes)

Thanks,
Christoph


--------------020609080300010900000407
Content-Type: text/plain;
 name="0001-nouveau-adjust-texture-and-nv50-RT-formats-to-names-.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-nouveau-adjust-texture-and-nv50-RT-formats-to-names-.pa";
 filename*1="tch"

From c0a9e6d906c8c6fc2cfa281f8553c1109f46f81a Mon Sep 17 00:00:00 2001
From: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
Date: Tue, 2 Mar 2010 18:43:11 +0100
Subject: [PATCH] nouveau: adjust texture and nv50 RT formats to names byteswap

Will keep a patch for middle endian format naming ready.
---
 src/gallium/drivers/nv30/nv30_fragtex.c        |   14 +++++-----
 src/gallium/drivers/nv40/nv40_fragtex.c        |   12 ++++----
 src/gallium/drivers/nv50/nv50_state_validate.c |   32 ++++++++++++------------
 src/gallium/drivers/nv50/nv50_tex.c            |   20 +++++++-------
 4 files changed, 39 insertions(+), 39 deletions(-)

diff --git a/src/gallium/drivers/nv30/nv30_fragtex.c b/src/gallium/drivers/nv30/nv30_fragtex.c
index 9f4a104..f7d98f3 100644
--- a/src/gallium/drivers/nv30/nv30_fragtex.c
+++ b/src/gallium/drivers/nv30/nv30_fragtex.c
@@ -23,17 +23,17 @@ struct nv30_texture_format {
 
 static struct nv30_texture_format
 nv30_texture_formats[] = {
-	_(X8R8G8B8_UNORM, A8R8G8B8,   S1,   S1,   S1,  ONE, X, Y, Z, W),
-	_(A8R8G8B8_UNORM, A8R8G8B8,   S1,   S1,   S1,   S1, X, Y, Z, W),
-	_(A1R5G5B5_UNORM, A1R5G5B5,   S1,   S1,   S1,   S1, X, Y, Z, W),
-	_(A4R4G4B4_UNORM, A4R4G4B4,   S1,   S1,   S1,   S1, X, Y, Z, W),
-	_(R5G6B5_UNORM  , R5G6B5  ,   S1,   S1,   S1,  ONE, X, Y, Z, W),
+	_(B8G8R8X8_UNORM, A8R8G8B8,   S1,   S1,   S1,  ONE, X, Y, Z, W),
+	_(B8G8R8A8_UNORM, A8R8G8B8,   S1,   S1,   S1,   S1, X, Y, Z, W),
+	_(B5G5R5A1_UNORM, A1R5G5B5,   S1,   S1,   S1,   S1, X, Y, Z, W),
+	_(B4G4R4A4_UNORM, A4R4G4B4,   S1,   S1,   S1,   S1, X, Y, Z, W),
+	_(B5G6R5_UNORM  , R5G6B5  ,   S1,   S1,   S1,  ONE, X, Y, Z, W),
 	_(L8_UNORM      , L8      ,   S1,   S1,   S1,  ONE, X, X, X, X),
 	_(A8_UNORM      , L8      , ZERO, ZERO, ZERO,   S1, X, X, X, X),
 	_(I8_UNORM      , L8      ,   S1,   S1,   S1,   S1, X, X, X, X),
-	_(A8L8_UNORM    , A8L8    ,   S1,   S1,   S1,   S1, X, X, X, Y),
+	_(L8A8_UNORM    , A8L8    ,   S1,   S1,   S1,   S1, X, X, X, Y),
 	_(Z16_UNORM     , R5G6B5  ,   S1,   S1,   S1,  ONE, X, X, X, X),
-	_(Z24S8_UNORM   , A8R8G8B8,   S1,   S1,   S1,  ONE, X, X, X, X),
+	_(S8Z24_UNORM   , A8R8G8B8,   S1,   S1,   S1,  ONE, X, X, X, X),
 	_(DXT1_RGB      , DXT1    ,   S1,   S1,   S1,  ONE, X, Y, Z, W),
 	_(DXT1_RGBA     , DXT1    ,   S1,   S1,   S1,   S1, X, Y, Z, W),
 	_(DXT3_RGBA     , DXT3    ,   S1,   S1,   S1,   S1, X, Y, Z, W),
diff --git a/src/gallium/drivers/nv40/nv40_fragtex.c b/src/gallium/drivers/nv40/nv40_fragtex.c
index 7a28d57..a04e776 100644
--- a/src/gallium/drivers/nv40/nv40_fragtex.c
+++ b/src/gallium/drivers/nv40/nv40_fragtex.c
@@ -25,16 +25,16 @@ struct nv40_texture_format {
 
 static struct nv40_texture_format
 nv40_texture_formats[] = {
-	_(X8R8G8B8_UNORM, A8R8G8B8,   S1,   S1,   S1,  ONE, X, Y, Z, W, 0, 0, 0, 0),
-	_(A8R8G8B8_UNORM, A8R8G8B8,   S1,   S1,   S1,   S1, X, Y, Z, W, 0, 0, 0, 0),
-	_(A1R5G5B5_UNORM, A1R5G5B5,   S1,   S1,   S1,   S1, X, Y, Z, W, 0, 0, 0, 0),
-	_(A4R4G4B4_UNORM, A4R4G4B4,   S1,   S1,   S1,   S1, X, Y, Z, W, 0, 0, 0, 0),
-	_(R5G6B5_UNORM  , R5G6B5  ,   S1,   S1,   S1,  ONE, X, Y, Z, W, 0, 0, 0, 0),
+	_(B8G8R8X8_UNORM, A8R8G8B8,   S1,   S1,   S1,  ONE, X, Y, Z, W, 0, 0, 0, 0),
+	_(B8G8R8A8_UNORM, A8R8G8B8,   S1,   S1,   S1,   S1, X, Y, Z, W, 0, 0, 0, 0),
+	_(B5G5R5A1_UNORM, A1R5G5B5,   S1,   S1,   S1,   S1, X, Y, Z, W, 0, 0, 0, 0),
+	_(B4G4R4A4_UNORM, A4R4G4B4,   S1,   S1,   S1,   S1, X, Y, Z, W, 0, 0, 0, 0),
+	_(B5G6R5_UNORM  , R5G6B5  ,   S1,   S1,   S1,  ONE, X, Y, Z, W, 0, 0, 0, 0),
 	_(L8_UNORM      , L8      ,   S1,   S1,   S1,  ONE, X, X, X, X, 0, 0, 0, 0),
 	_(A8_UNORM      , L8      , ZERO, ZERO, ZERO,   S1, X, X, X, X, 0, 0, 0, 0),
 	_(R16_SNORM     , A16     , ZERO, ZERO,   S1,  ONE, X, X, X, Y, 1, 1, 1, 1),
 	_(I8_UNORM      , L8      ,   S1,   S1,   S1,   S1, X, X, X, X, 0, 0, 0, 0),
-	_(A8L8_UNORM    , A8L8    ,   S1,   S1,   S1,   S1, X, X, X, Y, 0, 0, 0, 0),
+	_(L8A8_UNORM    , A8L8    ,   S1,   S1,   S1,   S1, X, X, X, Y, 0, 0, 0, 0),
 	_(Z16_UNORM     , Z16     ,   S1,   S1,   S1,  ONE, X, X, X, X, 0, 0, 0, 0),
 	_(Z24S8_UNORM   , Z24     ,   S1,   S1,   S1,  ONE, X, X, X, X, 0, 0, 0, 0),
 	_(DXT1_RGB      , DXT1    ,   S1,   S1,   S1,  ONE, X, Y, Z, W, 0, 0, 0, 0),
diff --git a/src/gallium/drivers/nv50/nv50_state_validate.c b/src/gallium/drivers/nv50/nv50_state_validate.c
index a91b310..ff7d4af 100644
--- a/src/gallium/drivers/nv50/nv50_state_validate.c
+++ b/src/gallium/drivers/nv50/nv50_state_validate.c
@@ -25,11 +25,11 @@
 #include "nv50_context.h"
 #include "nouveau/nouveau_stateobj.h"
 
-#define NV50_CBUF_FORMAT_CASE(n) \
-	case PIPE_FORMAT_##n: so_data(so, NV50TCL_RT_FORMAT_##n); break
+#define NV50_CBUF_FORMAT_CASE(p, n) \
+	case PIPE_FORMAT_##p: so_data(so, NV50TCL_RT_FORMAT_##n); break
 
-#define NV50_ZETA_FORMAT_CASE(n) \
-	case PIPE_FORMAT_##n: so_data(so, NV50TCL_ZETA_FORMAT_##n); break
+#define NV50_ZETA_FORMAT_CASE(p, n) \
+	case PIPE_FORMAT_##p: so_data(so, NV50TCL_ZETA_FORMAT_##n); break
 
 static void
 nv50_state_validate_fb(struct nv50_context *nv50)
@@ -71,14 +71,14 @@ nv50_state_validate_fb(struct nv50_context *nv50)
 		so_reloc (so, bo, fb->cbufs[i]->offset, NOUVEAU_BO_VRAM |
 			      NOUVEAU_BO_LOW | NOUVEAU_BO_RDWR, 0, 0);
 		switch (fb->cbufs[i]->format) {
-		NV50_CBUF_FORMAT_CASE(A8R8G8B8_UNORM);
-		NV50_CBUF_FORMAT_CASE(X8R8G8B8_UNORM);
-		NV50_CBUF_FORMAT_CASE(R5G6B5_UNORM);
-		NV50_CBUF_FORMAT_CASE(R16G16B16A16_SNORM);
-		NV50_CBUF_FORMAT_CASE(R16G16B16A16_UNORM);
-		NV50_CBUF_FORMAT_CASE(R32G32B32A32_FLOAT);
-		NV50_CBUF_FORMAT_CASE(R16G16_SNORM);
-		NV50_CBUF_FORMAT_CASE(R16G16_UNORM);
+		NV50_CBUF_FORMAT_CASE(B8G8R8A8_UNORM, A8R8G8B8_UNORM);
+		NV50_CBUF_FORMAT_CASE(B8G8R8X8_UNORM, X8R8G8B8_UNORM);
+		NV50_CBUF_FORMAT_CASE(B5G6R5_UNORM, R5G6B5_UNORM);
+		NV50_CBUF_FORMAT_CASE(R16G16B16A16_SNORM, R16G16B16A16_SNORM);
+		NV50_CBUF_FORMAT_CASE(R16G16B16A16_UNORM, R16G16B16A16_UNORM);
+		NV50_CBUF_FORMAT_CASE(R32G32B32A32_FLOAT, R32G32B32A32_FLOAT);
+		NV50_CBUF_FORMAT_CASE(R16G16_SNORM, R16G16_SNORM);
+		NV50_CBUF_FORMAT_CASE(R16G16_UNORM, R16G16_UNORM);
 		default:
 			NOUVEAU_ERR("AIIII unknown format %s\n",
 			            util_format_name(fb->cbufs[i]->format));
@@ -112,10 +112,10 @@ nv50_state_validate_fb(struct nv50_context *nv50)
 		so_reloc (so, bo, fb->zsbuf->offset, NOUVEAU_BO_VRAM |
 			      NOUVEAU_BO_LOW | NOUVEAU_BO_RDWR, 0, 0);
 		switch (fb->zsbuf->format) {
-		NV50_ZETA_FORMAT_CASE(S8Z24_UNORM);
-		NV50_ZETA_FORMAT_CASE(X8Z24_UNORM);
-		NV50_ZETA_FORMAT_CASE(Z24S8_UNORM);
-		NV50_ZETA_FORMAT_CASE(Z32_FLOAT);
+		NV50_ZETA_FORMAT_CASE(Z24S8_UNORM, S8Z24_UNORM);
+		NV50_ZETA_FORMAT_CASE(Z24X8_UNORM, X8Z24_UNORM);
+		NV50_ZETA_FORMAT_CASE(S8Z24_UNORM, Z24S8_UNORM);
+		NV50_ZETA_FORMAT_CASE(Z32_FLOAT, Z32_FLOAT);
 		default:
 			NOUVEAU_ERR("AIIII unknown format %s\n",
 			            util_format_name(fb->zsbuf->format));
diff --git a/src/gallium/drivers/nv50/nv50_tex.c b/src/gallium/drivers/nv50/nv50_tex.c
index 9f1a171..de0560e 100644
--- a/src/gallium/drivers/nv50/nv50_tex.c
+++ b/src/gallium/drivers/nv50/nv50_tex.c
@@ -49,28 +49,28 @@ struct nv50_texture_format {
 
 static const struct nv50_texture_format nv50_tex_format_list[] =
 {
-	_(A8R8G8B8_UNORM, UNORM, C2, C1, C0, C3,  8_8_8_8),
-	_(A8R8G8B8_SRGB,  UNORM, C2, C1, C0, C3,  8_8_8_8),
-	_(X8R8G8B8_UNORM, UNORM, C2, C1, C0, ONE, 8_8_8_8),
-	_(X8R8G8B8_SRGB,  UNORM, C2, C1, C0, ONE, 8_8_8_8),
-	_(A1R5G5B5_UNORM, UNORM, C2, C1, C0, C3,  1_5_5_5),
-	_(A4R4G4B4_UNORM, UNORM, C2, C1, C0, C3,  4_4_4_4),
+	_(B8G8R8A8_UNORM, UNORM, C2, C1, C0, C3,  8_8_8_8),
+	_(B8G8R8A8_SRGB,  UNORM, C2, C1, C0, C3,  8_8_8_8),
+	_(B8G8R8X8_UNORM, UNORM, C2, C1, C0, ONE, 8_8_8_8),
+	_(B8G8R8X8_SRGB,  UNORM, C2, C1, C0, ONE, 8_8_8_8),
+	_(B5G5R5A1_UNORM, UNORM, C2, C1, C0, C3,  1_5_5_5),
+	_(B4G4R4A4_UNORM, UNORM, C2, C1, C0, C3,  4_4_4_4),
 
-	_(R5G6B5_UNORM, UNORM, C2, C1, C0, ONE, 5_6_5),
+	_(B5G6R5_UNORM, UNORM, C2, C1, C0, ONE, 5_6_5),
 
 	_(L8_UNORM, UNORM, C0, C0, C0, ONE, 8),
 	_(A8_UNORM, UNORM, ZERO, ZERO, ZERO, C0, 8),
 	_(I8_UNORM, UNORM, C0, C0, C0, C0, 8),
 
-	_(A8L8_UNORM, UNORM, C0, C0, C0, C1, 8_8),
+	_(L8A8_UNORM, UNORM, C0, C0, C0, C1, 8_8),
 
 	_(DXT1_RGB, UNORM, C0, C1, C2, ONE, DXT1),
 	_(DXT1_RGBA, UNORM, C0, C1, C2, C3, DXT1),
 	_(DXT3_RGBA, UNORM, C0, C1, C2, C3, DXT3),
 	_(DXT5_RGBA, UNORM, C0, C1, C2, C3, DXT5),
 
-	_MIXED(Z24S8_UNORM, UINT, UNORM, UINT, UINT, C1, C1, C1, ONE, 24_8),
-	_MIXED(S8Z24_UNORM, UNORM, UINT, UINT, UINT, C0, C0, C0, ONE, 8_24),
+	_MIXED(S8Z24_UNORM, UINT, UNORM, UINT, UINT, C1, C1, C1, ONE, 24_8),
+	_MIXED(Z24S8_UNORM, UNORM, UINT, UINT, UINT, C0, C0, C0, ONE, 8_24),
 
 	_(R16G16B16A16_SNORM, UNORM, C0, C1, C2, C3, 16_16_16_16),
 	_(R16G16B16A16_UNORM, SNORM, C0, C1, C2, C3, 16_16_16_16),
-- 
1.6.4.4


--------------020609080300010900000407
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--------------020609080300010900000407--

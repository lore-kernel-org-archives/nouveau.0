From: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
Subject: nv50/gallium: fix the zeta formats
Date: Sat, 04 Jul 2009 13:26:31 +0200
Message-ID: <4A4F3C67.4080200@student.tuwien.ac.at>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------060003050608010903080400"
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
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
--------------060003050608010903080400
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit

A little patch that makes the nv50 mesa driver use the
correct GPU values for the matching depth formats.
There doesn't seem to be Z16, but I added Z32_FLOAT to
show the tile_flags the various formats need in the page
tables.

There'd also be Z32_FLOAT_S8_UNORM (0x19, tile flags 0xe000),
but that's not yet defined in the pipe formats header,
and I actually don't know if it's even possbible to define
that cleanly the way pipe_format is laid out.

Christoph

--------------060003050608010903080400
Content-Type: text/plain;
 name="0001-nv50-correct-zeta-formats.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="0001-nv50-correct-zeta-formats.patch"

From 855ce10f59b1d4623f509f2aa502dd4300cd54e3 Mon Sep 17 00:00:00 2001
From: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
Date: Sat, 4 Jul 2009 13:14:00 +0200
Subject: [PATCH] nv50: correct zeta formats

What was Z24S8 before is actually S8Z24, and what we had for Z16
is actually X8Z24. Now, we also have the REAL Z24S8 and I added
Z32_FLOAT as well; most of the formats need different tile_flags.
---
 src/gallium/drivers/nv50/nv50_miptree.c        |    9 +++++++--
 src/gallium/drivers/nv50/nv50_screen.c         |    5 +++--
 src/gallium/drivers/nv50/nv50_state_validate.c |   11 ++++++++---
 3 files changed, 18 insertions(+), 7 deletions(-)

diff --git a/src/gallium/drivers/nv50/nv50_miptree.c b/src/gallium/drivers/nv50/nv50_miptree.c
index 22465e0..c839279 100644
--- a/src/gallium/drivers/nv50/nv50_miptree.c
+++ b/src/gallium/drivers/nv50/nv50_miptree.c
@@ -42,9 +42,14 @@ nv50_miptree_create(struct pipe_screen *pscreen, const struct pipe_texture *tmp)
 	mt->base.screen = pscreen;
 
 	switch (pt->format) {
-	case PIPE_FORMAT_Z24X8_UNORM:
+	case PIPE_FORMAT_Z32_FLOAT:
+		tile_flags = 0x4800;
+		break;
 	case PIPE_FORMAT_Z24S8_UNORM:
-	case PIPE_FORMAT_Z16_UNORM:
+		tile_flags = 0x1800;
+		break;
+	case PIPE_FORMAT_X8Z24_UNORM:
+	case PIPE_FORMAT_S8Z24_UNORM:
 		tile_flags = 0x2800;
 		break;
 	default:
diff --git a/src/gallium/drivers/nv50/nv50_screen.c b/src/gallium/drivers/nv50/nv50_screen.c
index bdd449d..b4d6530 100644
--- a/src/gallium/drivers/nv50/nv50_screen.c
+++ b/src/gallium/drivers/nv50/nv50_screen.c
@@ -44,9 +44,10 @@ nv50_screen_is_format_supported(struct pipe_screen *pscreen,
 	} else
 	if (tex_usage & PIPE_TEXTURE_USAGE_DEPTH_STENCIL) {
 		switch (format) {
+		case PIPE_FORMAT_Z32_FLOAT:
 		case PIPE_FORMAT_Z24S8_UNORM:
-		case PIPE_FORMAT_Z24X8_UNORM:
-		case PIPE_FORMAT_Z16_UNORM:
+		case PIPE_FORMAT_X8Z24_UNORM:
+		case PIPE_FORMAT_S8Z24_UNORM:
 			return TRUE;
 		default:
 			break;
diff --git a/src/gallium/drivers/nv50/nv50_state_validate.c b/src/gallium/drivers/nv50/nv50_state_validate.c
index d313e9d..1edf741 100644
--- a/src/gallium/drivers/nv50/nv50_state_validate.c
+++ b/src/gallium/drivers/nv50/nv50_state_validate.c
@@ -92,13 +92,18 @@ nv50_state_validate_fb(struct nv50_context *nv50)
 		so_reloc (so, bo, fb->zsbuf->offset, NOUVEAU_BO_VRAM |
 			      NOUVEAU_BO_LOW | NOUVEAU_BO_RDWR, 0, 0);
 		switch (fb->zsbuf->format) {
+		case PIPE_FORMAT_Z32_FLOAT:
+			so_data(so, 0x0a);
+			break;
 		case PIPE_FORMAT_Z24S8_UNORM:
-		case PIPE_FORMAT_Z24X8_UNORM:
-			so_data(so, 0x16);
+			so_data(so, 0x14);
 			break;
-		case PIPE_FORMAT_Z16_UNORM:
+		case PIPE_FORMAT_X8Z24_UNORM:
 			so_data(so, 0x15);
 			break;
+		case PIPE_FORMAT_S8Z24_UNORM:
+			so_data(so, 0x16);
+			break;
 		default:
 			NOUVEAU_ERR("AIIII unknown format %s\n",
 				    pf_name(fb->zsbuf->format));
-- 
1.6.0.6


--------------060003050608010903080400
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--------------060003050608010903080400--

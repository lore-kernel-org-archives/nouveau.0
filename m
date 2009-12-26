From: Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
Subject: Fix swizzling for copies to rectangular textures
Date: Sat, 26 Dec 2009 07:35:17 +0100
Message-ID: <ff13bc9a0912252235x6b3917d1w26fbff6df6eaf96b@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
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

nVidia hardware seems to swizzle rectangular texture (with width !=
height) coordinates by swizzling the lower bits and then adding the
higher bits from the larger dimension.
However, nv04_swizzle_bits ignores width and height and just
interleaves everything.
This causes problems with rectangular POT textures with height or
width 2048 or 4096 (but not 2048x1024 where it works by chance) since
the driver swizzles them in 1024x1024 chunks and gets the start
position for the non-first chunks wrong.
The following patch seems to fix those problems.

diff --git a/src/gallium/drivers/nv04/nv04_surface_2d.c
b/src/gallium/drivers/nv04/nv04_surface_2d.c
index 12df7fd..40b538f 100644
--- a/src/gallium/drivers/nv04/nv04_surface_2d.c
+++ b/src/gallium/drivers/nv04/nv04_surface_2d.c
@@ -77,7 +77,7 @@ nv04_scaled_image_format(enum pipe_format format)
 }

 static INLINE unsigned
-nv04_swizzle_bits(unsigned x, unsigned y)
+nv04_swizzle_bits_square(unsigned x, unsigned y)
 {
 	unsigned u = (x & 0x001) << 0 |
 	             (x & 0x002) << 1 |
@@ -107,6 +107,15 @@ nv04_swizzle_bits(unsigned x, unsigned y)
 	return v | u;
 }

+/* rectangular swizzled textures are linear concatenations of
swizzled square tiles */
+static INLINE unsigned
+nv04_swizzle_bits(unsigned x, unsigned y, unsigned w, unsigned h)
+{
+	unsigned s = MIN2(w, h);
+	unsigned m = s - 1;
+	return (((x | y) & ~m) * s) | nv04_swizzle_bits_square(x & m, y & m);
+}
+
 static int
 nv04_surface_copy_swizzle(struct nv04_surface_2d *ctx,
 			  struct pipe_surface *dst, int dx, int dy,
@@ -159,10 +168,10 @@ nv04_surface_copy_swizzle(struct nv04_surface_2d *ctx,
 	    sub_w = MIN2(sub_w, w - x);

 	    /* Must be 64-byte aligned */
-	    assert(!((dst->offset + nv04_swizzle_bits(dx+x, dy+y) *
util_format_get_blocksize(dst->texture->format)) & 63));
+	    assert(!((dst->offset + nv04_swizzle_bits(dx+x, dy+y, w, h) *
util_format_get_blocksize(dst->texture->format)) & 63));

 	    BEGIN_RING(chan, swzsurf, NV04_SWIZZLED_SURFACE_OFFSET, 1);
-	    OUT_RELOCl(chan, dst_bo, dst->offset + nv04_swizzle_bits(dx+x,
dy+y) * util_format_get_blocksize(dst->texture->format),
+	    OUT_RELOCl(chan, dst_bo, dst->offset + nv04_swizzle_bits(dx+x,
dy+y, w, h) * util_format_get_blocksize(dst->texture->format),
                              NOUVEAU_BO_GART | NOUVEAU_BO_VRAM |
NOUVEAU_BO_WR);

 	    BEGIN_RING(chan, sifm, NV04_SCALED_IMAGE_FROM_MEMORY_COLOR_CONVERSION, 9);

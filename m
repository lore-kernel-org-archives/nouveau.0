From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/5] drm/nouveau: better alignment of bo sizes and
	use roundup instead of ALIGN
Date: Sat, 26 Dec 2009 22:43:04 +0100
Message-ID: <1261863788-8318-1-git-send-email-madman2003@gmail.com>
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

- Aligning to block size should ensure that the extra size is enough.
- Using roundup, because not all sizes are powers of two.

Signed-off-by: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_bo.c    |    8 ++++++--
 drivers/gpu/drm/nouveau/nouveau_fbcon.c |    4 ++--
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 98c46bd..fd767e7 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -73,6 +73,7 @@ nouveau_bo_fixup_align(struct drm_device *dev,
 		case 0x4800:
 		case 0x7a00:
 			if (dev_priv->chipset >= 0xA0) {
+				*size = roundup(*size, 28672);
 				/* This is based on high end cards with 448 bits
 				 * memory bus, could be different elsewhere.*/
 				*size += 6 * 28672;
@@ -80,9 +81,11 @@ nouveau_bo_fixup_align(struct drm_device *dev,
 				 * but we must also align to page size. */
 				*align = 2 * 8 * 28672;
 			} else if (dev_priv->chipset >= 0x90) {
+				*size = roundup(*size, 16384);
 				*size += 3 * 16384;
 				*align = 12 * 16834;
 			} else {
+				*size = roundup(*size, 8192);
 				*size += 3 * 8192;
 				/* 12 * 8192 is the actual alignment requirement
 				 * but we must also align to page size. */
@@ -110,10 +113,11 @@ nouveau_bo_fixup_align(struct drm_device *dev,
 		}
 	}
 
-	*size = ALIGN(*size, PAGE_SIZE);
+	/* ALIGN works only on powers of two. */
+	*size = roundup(*size, PAGE_SIZE);
 
 	if (dev_priv->card_type == NV_50) {
-		*size = ALIGN(*size, 65536);
+		*size = roundup(*size, 65536);
 		*align = max(65536, *align);
 	}
 }
diff --git a/drivers/gpu/drm/nouveau/nouveau_fbcon.c b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
index 84af25c..44cbbee 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fbcon.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
@@ -212,11 +212,11 @@ nouveau_fbcon_create(struct drm_device *dev, uint32_t fb_width,
 
 	mode_cmd.bpp = surface_bpp;
 	mode_cmd.pitch = mode_cmd.width * (mode_cmd.bpp >> 3);
-	mode_cmd.pitch = ALIGN(mode_cmd.pitch, 256);
+	mode_cmd.pitch = roundup(mode_cmd.pitch, 256);
 	mode_cmd.depth = surface_depth;
 
 	size = mode_cmd.pitch * mode_cmd.height;
-	size = ALIGN(size, PAGE_SIZE);
+	size = roundup(size, PAGE_SIZE);
 
 	ret = nouveau_gem_new(dev, dev_priv->channel, size, 0, TTM_PL_FLAG_VRAM,
 			      0, 0x0000, false, true, &nvbo);
-- 
1.6.6.rc4

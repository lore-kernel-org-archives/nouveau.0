From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 4/5] drm/nv50: make the blocksize depend on vram
	size
Date: Sat, 26 Dec 2009 22:43:07 +0100
Message-ID: <1261863788-8318-4-git-send-email-madman2003@gmail.com>
References: <1261863788-8318-1-git-send-email-madman2003@gmail.com>
	<1261863788-8318-2-git-send-email-madman2003@gmail.com>
	<1261863788-8318-3-git-send-email-madman2003@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1261863788-8318-3-git-send-email-madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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

- This should be better than what we have now.
- I'm less sure about the non power of two path.

Signed-off-by: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_bo.c |   36 +++++++++++++++++----------------
 1 files changed, 19 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 0a08ece..8143612 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -33,6 +33,8 @@
 #include "nouveau_drv.h"
 #include "nouveau_dma.h"
 
+#include <linux/log2.h>
+
 static void
 nouveau_bo_del_ttm(struct ttm_buffer_object *bo)
 {
@@ -67,29 +69,29 @@ nouveau_bo_fixup_align(struct drm_device *dev,
 	 * avoid corruption of other buffer objects.
 	 */
 	if (dev_priv->card_type == NV_50) {
+		uint32_t block_size = nouveau_mem_fb_amount(dev) >> 15;
+		int i = 1;
+
 		switch (tile_flags) {
 		case 0x1800:
 		case 0x2800:
 		case 0x4800:
 		case 0x7a00:
-			if (dev_priv->chipset >= 0xA0) {
-				*size = roundup(*size, 28672);
-				/* This is based on high end cards with 448 bits
-				 * memory bus, could be different elsewhere.*/
-				*size += 6 * 28672;
-				/* 8 * 28672 is the actual alignment requirement
-				 * but we must also align to page size. */
-				*align = 2 * 8 * 28672;
-			} else if (dev_priv->chipset >= 0x90) {
-				*size = roundup(*size, 16384);
-				*size += 3 * 16384;
-				*align = 12 * 16384;
+			*size = roundup(*size, block_size);
+			if (is_power_of_2(block_size)) {
+				*size += 3 * block_size;
+				for (i = 1; i < 10; i++) {
+					*align = 12 * i * block_size;
+					if (!(*align % 65536))
+						break;
+				}
 			} else {
-				*size = roundup(*size, 8192);
-				*size += 3 * 8192;
-				/* 12 * 8192 is the actual alignment requirement
-				 * but we must also align to page size. */
-				*align = 2 * 12 * 8192;
+				*size += 6 * block_size;
+				for (i = 1; i < 10; i++) {
+					*align = 8 * i * block_size;
+					if (!(*align % 65536))
+						break;
+				}
 			}
 			break;
 		default:
-- 
1.6.6.rc4

From: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
Subject: [PATCH] dri2: fix allocation of Z16 depth attachments
Date: Wed,  7 Dec 2011 19:23:57 +0100
Message-ID: <1323282237-7682-1-git-send-email-e0425955@student.tuwien.ac.at>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
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

---
 src/nouveau_dri2.c    |    4 +++-
 src/nv_accel_common.c |    4 ++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/src/nouveau_dri2.c b/src/nouveau_dri2.c
index d14443f..b99893f 100644
--- a/src/nouveau_dri2.c
+++ b/src/nouveau_dri2.c
@@ -46,6 +46,8 @@ nouveau_dri2_create_buffer(DrawablePtr pDraw, unsigned int attachment,
 
 		ppix->refcnt++;
 	} else {
+		/* 'format' is just depth */
+		unsigned int depth = NOUVEAU_ALIGN(format, 2);
 		unsigned int usage_hint = NOUVEAU_CREATE_PIXMAP_TILED;
 
 		if (attachment == DRI2BufferDepth ||
@@ -55,7 +57,7 @@ nouveau_dri2_create_buffer(DrawablePtr pDraw, unsigned int attachment,
 			usage_hint |= NOUVEAU_CREATE_PIXMAP_SCANOUT;
 
 		ppix = pScreen->CreatePixmap(pScreen, pDraw->width,
-					     pDraw->height, pDraw->depth,
+					     pDraw->height, depth,
 					     usage_hint);
 	}
 
diff --git a/src/nv_accel_common.c b/src/nv_accel_common.c
index 3219dbe..51cc66a 100644
--- a/src/nv_accel_common.c
+++ b/src/nv_accel_common.c
@@ -71,7 +71,7 @@ nouveau_allocate_surface(ScrnInfoPtr scrn, int width, int height, int bpp,
 				tile_mode = 0x00;
 
 			if (usage_hint & NOUVEAU_CREATE_PIXMAP_ZETA)
-				tile_flags = 0x1100; /* S8Z24 */
+				tile_flags = (bpp == 16) ? 0x0100 : 0x1100; /* Z16 : Z24S8 */
 			else
 				tile_flags = 0xfe00;
 
@@ -90,7 +90,7 @@ nouveau_allocate_surface(ScrnInfoPtr scrn, int width, int height, int bpp,
 				tile_mode = 0;
 
 			if (usage_hint & NOUVEAU_CREATE_PIXMAP_ZETA)
-				tile_flags = 0x22800;
+				tile_flags = (bpp == 16) ? 0x26c00 : 0x22800;
 			else if (usage_hint & NOUVEAU_CREATE_PIXMAP_SCANOUT)
 				tile_flags = (bpp == 16 ? 0x7000 : 0x7a00);
 			else
-- 
1.7.3.4

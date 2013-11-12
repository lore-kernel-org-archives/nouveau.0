From: maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org
Subject: [PATCH 6/7] drm/nouveau: more paranoia in
	nouveau_bo_fixup_align
Date: Tue, 12 Nov 2013 13:34:13 +0100
Message-ID: <1384259656-29483-6-git-send-email-maarten.lankhorst@canonical.com>
References: <1384259656-29483-1-git-send-email-maarten.lankhorst@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1384259656-29483-1-git-send-email-maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

From: Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>

Make sure that buffers are always aligned.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_bo.c | 40 +++++++++++++++++++-----------------
 1 file changed, 21 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index bb3734d..635a192 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -160,24 +160,20 @@ nouveau_bo_fixup_align(struct nouveau_bo *nvbo, u32 flags,
 	struct nouveau_drm *drm = nouveau_bdev(nvbo->bo.bdev);
 	struct nouveau_device *device = nv_device(drm->device);
 
-	if (device->card_type < NV_50) {
-		if (nvbo->tile_mode) {
-			if (device->chipset >= 0x40) {
-				*align = 65536;
-				*size = roundup(*size, 64 * nvbo->tile_mode);
-
-			} else if (device->chipset >= 0x30) {
-				*align = 32768;
-				*size = roundup(*size, 64 * nvbo->tile_mode);
-
-			} else if (device->chipset >= 0x20) {
-				*align = 16384;
-				*size = roundup(*size, 64 * nvbo->tile_mode);
-
-			} else if (device->chipset >= 0x10) {
-				*align = 16384;
-				*size = roundup(*size, 32 * nvbo->tile_mode);
-			}
+	if (device->chipset >= 0x10 && device->card_type < NV_50 &&
+	    nvbo->tile_mode) {
+		if (device->chipset >= 0x40) {
+			*align = 65536;
+			*size = roundup(*size, 64 * nvbo->tile_mode);
+		} else if (device->chipset >= 0x30) {
+			*align = 32768;
+			*size = roundup(*size, 64 * nvbo->tile_mode);
+		} else if (device->chipset >= 0x20) {
+			*align = 16384;
+			*size = roundup(*size, 64 * nvbo->tile_mode);
+		} else {
+			*align = 16384;
+			*size = roundup(*size, 32 * nvbo->tile_mode);
 		}
 	} else {
 		*size = roundup(*size, (1 << nvbo->page_shift));
@@ -228,8 +224,14 @@ nouveau_bo_new(struct drm_device *dev, int size, int align,
 		if (!(flags & TTM_PL_FLAG_TT) && size > 256 * 1024)
 			nvbo->page_shift = drm->client.base.vm->vmm->lpg_shift;
 	}
-
 	nouveau_bo_fixup_align(nvbo, flags, &align, &size);
+	if (size <= 0) {
+		nv_warn(drm, "invalid size %x after setting alignment %x\n",
+			size, align);
+		kfree(nvbo);
+		return -EINVAL;
+	}
+
 	nvbo->bo.mem.num_pages = size >> PAGE_SHIFT;
 	nouveau_bo_placement_set(nvbo, flags, 0);
 
-- 
1.8.4

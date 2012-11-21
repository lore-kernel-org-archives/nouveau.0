From: Maarten Lankhorst <maarten.lankhorst@canonical.com>
Subject: [PATCH] drm/nouveau: use the correct fence implementation for nv50
Date: Wed, 21 Nov 2012 13:21:12 +0100
Message-ID: <50ACC738.3060505@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: nouveau@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

Only compile time tested, noticed nv50_fence_create was never used,
so fix this. This will probably fix vblank on nv50 cards.

Hopefully this is still in time for 3.7 final release.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@canonical.com>

---
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 0910125..8503b2e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -129,7 +129,8 @@ nouveau_accel_init(struct nouveau_drm *drm)
 
 	/* initialise synchronisation routines */
 	if      (device->card_type < NV_10) ret = nv04_fence_create(drm);
-	else if (device->chipset   <  0x84) ret = nv10_fence_create(drm);
+	else if (device->card_type < NV_50) ret = nv10_fence_create(drm);
+	else if (device->chipset   <  0x84) ret = nv50_fence_create(drm);
 	else if (device->card_type < NV_C0) ret = nv84_fence_create(drm);
 	else                                ret = nvc0_fence_create(drm);
 	if (ret) {

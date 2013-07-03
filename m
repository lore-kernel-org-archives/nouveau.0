From: Maarten Lankhorst <maarten.lankhorst@canonical.com>
Subject: [PATCH] drm/nouveau: bump fence timeout to 150 seconds
Date: Wed, 03 Jul 2013 12:07:10 +0200
Message-ID: <51D3F7CE.9090009@canonical.com>
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
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

Fixes parallel piglit runs on fermi with boot clock speeds.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@canonical.com>
---
diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
index 1e753b0..460dd00 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -144,7 +144,7 @@ nouveau_fence_emit(struct nouveau_fence *fence, struct nouveau_channel *chan)
 	int ret;
 
 	fence->channel  = chan;
-	fence->timeout  = jiffies + (3 * DRM_HZ);
+	fence->timeout  = jiffies + (150 * DRM_HZ);
 	fence->sequence = ++fctx->sequence;
 
 	ret = fctx->emit(fence);

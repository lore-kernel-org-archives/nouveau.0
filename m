From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: [PATCH 5/8] drm/nouveau: access fbcon notifier via bo
	accessors
Date: Mon, 17 Aug 2009 16:42:41 +0300
Message-ID: <1250516564-14193-6-git-send-email-pq@iki.fi>
References: <1250516564-14193-1-git-send-email-pq@iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1250516564-14193-1-git-send-email-pq-X3B1VOXEql0@public.gmane.org>
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

Notifier can live in system memory or VRAM, hence they must be accessed
using the bo wrapper functions.

Remove the redundant member nouveau_channel::m2mf_ntfy_map.

Signed-off-by: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_dma.c   |    2 --
 drivers/gpu/drm/nouveau/nouveau_drv.h   |    1 -
 drivers/gpu/drm/nouveau/nouveau_fbcon.c |    5 +++--
 3 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_dma.c b/drivers/gpu/drm/nouveau/nouveau_dma.c
index 0025c3d..b1f3a71 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dma.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dma.c
@@ -62,8 +62,6 @@ nouveau_dma_init(struct nouveau_channel *chan)
 		ret = nouveau_bo_map(chan->notifier_bo);
 		if (ret)
 			return ret;
-		chan->m2mf_ntfy_map  = chan->notifier_bo->kmap.virtual;
-		chan->m2mf_ntfy_map += chan->m2mf_ntfy;
 	}
 
 	/* Initialise DMA vars */
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index 8516fda..556b0fa 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -203,7 +203,6 @@ struct nouveau_channel
 
 	/* GPU object info for stuff used in-kernel (mm_enabled) */
 	uint32_t m2mf_ntfy;
-	volatile uint32_t *m2mf_ntfy_map;
 	uint32_t vram_handle;
 	uint32_t gart_handle;
 	bool accel_done;
diff --git a/drivers/gpu/drm/nouveau/nouveau_fbcon.c b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
index 645b087..6a21a70 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fbcon.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
@@ -71,12 +71,13 @@ nouveau_fbcon_sync(struct fb_info *info)
 	OUT_RING  (chan, 0);
 	BEGIN_RING(chan, 0, 0x0100, 1);
 	OUT_RING  (chan, 0);
-	chan->m2mf_ntfy_map[3] = 0xffffffff;
+	nouveau_bo_wr32(chan->notifier_bo, chan->m2mf_ntfy + 3, 0xffffffff);
 	FIRE_RING (chan);
 
 	ret = -EBUSY;
 	for (i = 0; i < 100000; i++) {
-		if (chan->m2mf_ntfy_map[3] == 0) {
+		if (nouveau_bo_rd32(chan->notifier_bo, chan->m2mf_ntfy + 3)
+									== 0) {
 			ret = 0;
 			break;
 		}
-- 
1.6.3.3

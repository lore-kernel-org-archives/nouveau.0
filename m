From: Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
Subject: [PATCH] drm/nouveau: dehexify nv50_fifo.c (v2)
Date: Sat, 30 Jan 2010 16:44:42 +0100
Message-ID: <1264866282-5788-1-git-send-email-luca@luca-barbieri.com>
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
To: bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Merged the two patches and added signoff.

Signed-off-by: Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nv50_fifo.c |   84 +++++++++++++++++-----------------
 1 files changed, 42 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nv50_fifo.c b/drivers/gpu/drm/nouveau/nv50_fifo.c
index 32b244b..550cabe 100644
--- a/drivers/gpu/drm/nouveau/nv50_fifo.c
+++ b/drivers/gpu/drm/nouveau/nv50_fifo.c
@@ -58,7 +58,7 @@ nv50_fifo_init_thingo(struct drm_device *dev)
 
 	nv_wr32(dev, 0x32f4, cur->instance >> 12);
 	nv_wr32(dev, 0x32ec, nr);
-	nv_wr32(dev, 0x2500, 0x101);
+	nv_wr32(dev, NV03_PFIFO_CACHES, 0x101);
 }
 
 static int
@@ -146,7 +146,7 @@ nv50_fifo_init_regs__nv(struct drm_device *dev)
 {
 	NV_DEBUG(dev, "\n");
 
-	nv_wr32(dev, 0x250c, 0x6f3cfc34);
+	nv_wr32(dev, NV04_PFIFO_SIZE, 0x6f3cfc34);
 }
 
 static void
@@ -154,12 +154,12 @@ nv50_fifo_init_regs(struct drm_device *dev)
 {
 	NV_DEBUG(dev, "\n");
 
-	nv_wr32(dev, 0x2500, 0);
-	nv_wr32(dev, 0x3250, 0);
-	nv_wr32(dev, 0x3220, 0);
-	nv_wr32(dev, 0x3204, 0);
-	nv_wr32(dev, 0x3210, 0);
-	nv_wr32(dev, 0x3270, 0);
+	nv_wr32(dev, NV03_PFIFO_CACHES, 0);
+	nv_wr32(dev, NV04_PFIFO_CACHE1_PULL0, 0);
+	nv_wr32(dev, NV04_PFIFO_CACHE1_DMA_PUSH, 0);
+	nv_wr32(dev, NV03_PFIFO_CACHE1_PUSH1, 0);
+	nv_wr32(dev, NV03_PFIFO_CACHE1_PUT, 0);
+	nv_wr32(dev, NV03_PFIFO_CACHE1_GET, 0);
 
 	/* Enable dummy channels setup by nv50_instmem.c */
 	nv50_fifo_channel_enable(dev, 0, true);
@@ -345,9 +345,9 @@ nv50_fifo_load_context(struct nouveau_channel *chan)
 
 	nv_wr32(dev, 0x3330, nv_ro32(dev, ramfc, 0x00/4));
 	nv_wr32(dev, 0x3334, nv_ro32(dev, ramfc, 0x04/4));
-	nv_wr32(dev, 0x3240, nv_ro32(dev, ramfc, 0x08/4));
+	nv_wr32(dev, NV04_PFIFO_CACHE1_DMA_PUT, nv_ro32(dev, ramfc, 0x08/4));
 	nv_wr32(dev, 0x3320, nv_ro32(dev, ramfc, 0x0c/4));
-	nv_wr32(dev, 0x3244, nv_ro32(dev, ramfc, 0x10/4));
+	nv_wr32(dev, NV04_PFIFO_CACHE1_DMA_GET, nv_ro32(dev, ramfc, 0x10/4));
 	nv_wr32(dev, 0x3328, nv_ro32(dev, ramfc, 0x14/4));
 	nv_wr32(dev, 0x3368, nv_ro32(dev, ramfc, 0x18/4));
 	nv_wr32(dev, 0x336c, nv_ro32(dev, ramfc, 0x1c/4));
@@ -355,27 +355,27 @@ nv50_fifo_load_context(struct nouveau_channel *chan)
 	nv_wr32(dev, 0x3374, nv_ro32(dev, ramfc, 0x24/4));
 	nv_wr32(dev, 0x3378, nv_ro32(dev, ramfc, 0x28/4));
 	nv_wr32(dev, 0x337c, nv_ro32(dev, ramfc, 0x2c/4));
-	nv_wr32(dev, 0x3228, nv_ro32(dev, ramfc, 0x30/4));
+	nv_wr32(dev, NV04_PFIFO_CACHE1_DMA_STATE, nv_ro32(dev, ramfc, 0x30/4));
 	nv_wr32(dev, 0x3364, nv_ro32(dev, ramfc, 0x34/4));
-	nv_wr32(dev, 0x32a0, nv_ro32(dev, ramfc, 0x38/4));
-	nv_wr32(dev, 0x3224, nv_ro32(dev, ramfc, 0x3c/4));
-	nv_wr32(dev, 0x324c, nv_ro32(dev, ramfc, 0x40/4));
-	nv_wr32(dev, 0x2044, nv_ro32(dev, ramfc, 0x44/4));
-	nv_wr32(dev, 0x322c, nv_ro32(dev, ramfc, 0x48/4));
+	nv_wr32(dev, NV04_PFIFO_CACHE1_DMA_DCOUNT, nv_ro32(dev, ramfc, 0x38/4));
+	nv_wr32(dev, NV04_PFIFO_CACHE1_DMA_FETCH, nv_ro32(dev, ramfc, 0x3c/4));
+	nv_wr32(dev, NV10_PFIFO_CACHE1_DMA_SUBROUTINE, nv_ro32(dev, ramfc, 0x40/4));
+	nv_wr32(dev, NV04_PFIFO_DMA_TIMESLICE, nv_ro32(dev, ramfc, 0x44/4));
+	nv_wr32(dev, NV04_PFIFO_CACHE1_DMA_INSTANCE, nv_ro32(dev, ramfc, 0x48/4));
 	nv_wr32(dev, 0x3234, nv_ro32(dev, ramfc, 0x4c/4));
 	nv_wr32(dev, 0x3340, nv_ro32(dev, ramfc, 0x50/4));
 	nv_wr32(dev, 0x3344, nv_ro32(dev, ramfc, 0x54/4));
-	nv_wr32(dev, 0x3280, nv_ro32(dev, ramfc, 0x58/4));
-	nv_wr32(dev, 0x3254, nv_ro32(dev, ramfc, 0x5c/4));
-	nv_wr32(dev, 0x3260, nv_ro32(dev, ramfc, 0x60/4));
-	nv_wr32(dev, 0x3264, nv_ro32(dev, ramfc, 0x64/4));
-	nv_wr32(dev, 0x3268, nv_ro32(dev, ramfc, 0x68/4));
-	nv_wr32(dev, 0x326c, nv_ro32(dev, ramfc, 0x6c/4));
-	nv_wr32(dev, 0x32e4, nv_ro32(dev, ramfc, 0x70/4));
-	nv_wr32(dev, 0x3248, nv_ro32(dev, ramfc, 0x74/4));
+	nv_wr32(dev, NV04_PFIFO_CACHE1_ENGINE, nv_ro32(dev, ramfc, 0x58/4));
+	nv_wr32(dev, NV04_PFIFO_CACHE1_PULL1, nv_ro32(dev, ramfc, 0x5c/4));
+	nv_wr32(dev, NV10_PFIFO_CACHE1_ACQUIRE_TIMEOUT, nv_ro32(dev, ramfc, 0x60/4));
+	nv_wr32(dev, NV10_PFIFO_CACHE1_ACQUIRE_TIMESTAMP, nv_ro32(dev, ramfc, 0x64/4));
+	nv_wr32(dev, NV10_PFIFO_CACHE1_ACQUIRE_VALUE, nv_ro32(dev, ramfc, 0x68/4));
+	nv_wr32(dev, NV10_PFIFO_CACHE1_SEMAPHORE, nv_ro32(dev, ramfc, 0x6c/4));
+	nv_wr32(dev, NV40_PFIFO_UNK32E4, nv_ro32(dev, ramfc, 0x70/4));
+	nv_wr32(dev, NV10_PFIFO_CACHE1_REF_CNT, nv_ro32(dev, ramfc, 0x74/4));
 	nv_wr32(dev, 0x2088, nv_ro32(dev, ramfc, 0x78/4));
 	nv_wr32(dev, 0x2058, nv_ro32(dev, ramfc, 0x7c/4));
-	nv_wr32(dev, 0x2210, nv_ro32(dev, ramfc, 0x80/4));
+	nv_wr32(dev, NV03_PFIFO_RAMHT, nv_ro32(dev, ramfc, 0x80/4));
 
 	cnt = nv_ro32(dev, ramfc, 0x84/4);
 	for (ptr = 0; ptr < cnt; ptr++) {
@@ -430,9 +430,9 @@ nv50_fifo_unload_context(struct drm_device *dev)
 
 	nv_wo32(dev, ramfc, 0x00/4, nv_rd32(dev, 0x3330));
 	nv_wo32(dev, ramfc, 0x04/4, nv_rd32(dev, 0x3334));
-	nv_wo32(dev, ramfc, 0x08/4, nv_rd32(dev, 0x3240));
+	nv_wo32(dev, ramfc, 0x08/4, nv_rd32(dev, NV04_PFIFO_CACHE1_DMA_PUT));
 	nv_wo32(dev, ramfc, 0x0c/4, nv_rd32(dev, 0x3320));
-	nv_wo32(dev, ramfc, 0x10/4, nv_rd32(dev, 0x3244));
+	nv_wo32(dev, ramfc, 0x10/4, nv_rd32(dev, NV04_PFIFO_CACHE1_DMA_GET));
 	nv_wo32(dev, ramfc, 0x14/4, nv_rd32(dev, 0x3328));
 	nv_wo32(dev, ramfc, 0x18/4, nv_rd32(dev, 0x3368));
 	nv_wo32(dev, ramfc, 0x1c/4, nv_rd32(dev, 0x336c));
@@ -440,27 +440,27 @@ nv50_fifo_unload_context(struct drm_device *dev)
 	nv_wo32(dev, ramfc, 0x24/4, nv_rd32(dev, 0x3374));
 	nv_wo32(dev, ramfc, 0x28/4, nv_rd32(dev, 0x3378));
 	nv_wo32(dev, ramfc, 0x2c/4, nv_rd32(dev, 0x337c));
-	nv_wo32(dev, ramfc, 0x30/4, nv_rd32(dev, 0x3228));
+	nv_wo32(dev, ramfc, 0x30/4, nv_rd32(dev, NV04_PFIFO_CACHE1_DMA_STATE));
 	nv_wo32(dev, ramfc, 0x34/4, nv_rd32(dev, 0x3364));
-	nv_wo32(dev, ramfc, 0x38/4, nv_rd32(dev, 0x32a0));
-	nv_wo32(dev, ramfc, 0x3c/4, nv_rd32(dev, 0x3224));
-	nv_wo32(dev, ramfc, 0x40/4, nv_rd32(dev, 0x324c));
-	nv_wo32(dev, ramfc, 0x44/4, nv_rd32(dev, 0x2044));
-	nv_wo32(dev, ramfc, 0x48/4, nv_rd32(dev, 0x322c));
+	nv_wo32(dev, ramfc, 0x38/4, nv_rd32(dev, NV04_PFIFO_CACHE1_DMA_DCOUNT));
+	nv_wo32(dev, ramfc, 0x3c/4, nv_rd32(dev, NV04_PFIFO_CACHE1_DMA_FETCH));
+	nv_wo32(dev, ramfc, 0x40/4, nv_rd32(dev, NV10_PFIFO_CACHE1_DMA_SUBROUTINE));
+	nv_wo32(dev, ramfc, 0x44/4, nv_rd32(dev, NV04_PFIFO_DMA_TIMESLICE));
+	nv_wo32(dev, ramfc, 0x48/4, nv_rd32(dev, NV04_PFIFO_CACHE1_DMA_INSTANCE));
 	nv_wo32(dev, ramfc, 0x4c/4, nv_rd32(dev, 0x3234));
 	nv_wo32(dev, ramfc, 0x50/4, nv_rd32(dev, 0x3340));
 	nv_wo32(dev, ramfc, 0x54/4, nv_rd32(dev, 0x3344));
-	nv_wo32(dev, ramfc, 0x58/4, nv_rd32(dev, 0x3280));
-	nv_wo32(dev, ramfc, 0x5c/4, nv_rd32(dev, 0x3254));
-	nv_wo32(dev, ramfc, 0x60/4, nv_rd32(dev, 0x3260));
-	nv_wo32(dev, ramfc, 0x64/4, nv_rd32(dev, 0x3264));
-	nv_wo32(dev, ramfc, 0x68/4, nv_rd32(dev, 0x3268));
-	nv_wo32(dev, ramfc, 0x6c/4, nv_rd32(dev, 0x326c));
-	nv_wo32(dev, ramfc, 0x70/4, nv_rd32(dev, 0x32e4));
-	nv_wo32(dev, ramfc, 0x74/4, nv_rd32(dev, 0x3248));
+	nv_wo32(dev, ramfc, 0x58/4, nv_rd32(dev, NV04_PFIFO_CACHE1_ENGINE));
+	nv_wo32(dev, ramfc, 0x5c/4, nv_rd32(dev, NV04_PFIFO_CACHE1_PULL1));
+	nv_wo32(dev, ramfc, 0x60/4, nv_rd32(dev, NV10_PFIFO_CACHE1_ACQUIRE_TIMEOUT));
+	nv_wo32(dev, ramfc, 0x64/4, nv_rd32(dev, NV10_PFIFO_CACHE1_ACQUIRE_TIMESTAMP));
+	nv_wo32(dev, ramfc, 0x68/4, nv_rd32(dev, NV10_PFIFO_CACHE1_ACQUIRE_VALUE));
+	nv_wo32(dev, ramfc, 0x6c/4, nv_rd32(dev, NV10_PFIFO_CACHE1_SEMAPHORE));
+	nv_wo32(dev, ramfc, 0x70/4, nv_rd32(dev, NV40_PFIFO_UNK32E4));
+	nv_wo32(dev, ramfc, 0x74/4, nv_rd32(dev, NV10_PFIFO_CACHE1_REF_CNT));
 	nv_wo32(dev, ramfc, 0x78/4, nv_rd32(dev, 0x2088));
 	nv_wo32(dev, ramfc, 0x7c/4, nv_rd32(dev, 0x2058));
-	nv_wo32(dev, ramfc, 0x80/4, nv_rd32(dev, 0x2210));
+	nv_wo32(dev, ramfc, 0x80/4, nv_rd32(dev, NV03_PFIFO_RAMHT));
 
 	put = (nv_rd32(dev, NV03_PFIFO_CACHE1_PUT) & 0x7ff) >> 2;
 	get = (nv_rd32(dev, NV03_PFIFO_CACHE1_GET) & 0x7ff) >> 2;
-- 
1.6.6.1.476.g01ddb

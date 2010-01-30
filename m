From: Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
Subject: [PATCH] drm/nouveau: dehexify nv50_fifo.c some more
Date: Sat, 30 Jan 2010 16:07:11 +0100
Message-ID: <1264864031-10038-1-git-send-email-luca@luca-barbieri.com>
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

Missed those due to uppercase hex in nouveau_reg.h
---
 drivers/gpu/drm/nouveau/nv50_fifo.c |   16 ++++++++--------
 1 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nv50_fifo.c b/drivers/gpu/drm/nouveau/nv50_fifo.c
index f0cba1e..550cabe 100644
--- a/drivers/gpu/drm/nouveau/nv50_fifo.c
+++ b/drivers/gpu/drm/nouveau/nv50_fifo.c
@@ -357,9 +357,9 @@ nv50_fifo_load_context(struct nouveau_channel *chan)
 	nv_wr32(dev, 0x337c, nv_ro32(dev, ramfc, 0x2c/4));
 	nv_wr32(dev, NV04_PFIFO_CACHE1_DMA_STATE, nv_ro32(dev, ramfc, 0x30/4));
 	nv_wr32(dev, 0x3364, nv_ro32(dev, ramfc, 0x34/4));
-	nv_wr32(dev, 0x32a0, nv_ro32(dev, ramfc, 0x38/4));
+	nv_wr32(dev, NV04_PFIFO_CACHE1_DMA_DCOUNT, nv_ro32(dev, ramfc, 0x38/4));
 	nv_wr32(dev, NV04_PFIFO_CACHE1_DMA_FETCH, nv_ro32(dev, ramfc, 0x3c/4));
-	nv_wr32(dev, 0x324c, nv_ro32(dev, ramfc, 0x40/4));
+	nv_wr32(dev, NV10_PFIFO_CACHE1_DMA_SUBROUTINE, nv_ro32(dev, ramfc, 0x40/4));
 	nv_wr32(dev, NV04_PFIFO_DMA_TIMESLICE, nv_ro32(dev, ramfc, 0x44/4));
 	nv_wr32(dev, NV04_PFIFO_CACHE1_DMA_INSTANCE, nv_ro32(dev, ramfc, 0x48/4));
 	nv_wr32(dev, 0x3234, nv_ro32(dev, ramfc, 0x4c/4));
@@ -370,8 +370,8 @@ nv50_fifo_load_context(struct nouveau_channel *chan)
 	nv_wr32(dev, NV10_PFIFO_CACHE1_ACQUIRE_TIMEOUT, nv_ro32(dev, ramfc, 0x60/4));
 	nv_wr32(dev, NV10_PFIFO_CACHE1_ACQUIRE_TIMESTAMP, nv_ro32(dev, ramfc, 0x64/4));
 	nv_wr32(dev, NV10_PFIFO_CACHE1_ACQUIRE_VALUE, nv_ro32(dev, ramfc, 0x68/4));
-	nv_wr32(dev, 0x326c, nv_ro32(dev, ramfc, 0x6c/4));
-	nv_wr32(dev, 0x32e4, nv_ro32(dev, ramfc, 0x70/4));
+	nv_wr32(dev, NV10_PFIFO_CACHE1_SEMAPHORE, nv_ro32(dev, ramfc, 0x6c/4));
+	nv_wr32(dev, NV40_PFIFO_UNK32E4, nv_ro32(dev, ramfc, 0x70/4));
 	nv_wr32(dev, NV10_PFIFO_CACHE1_REF_CNT, nv_ro32(dev, ramfc, 0x74/4));
 	nv_wr32(dev, 0x2088, nv_ro32(dev, ramfc, 0x78/4));
 	nv_wr32(dev, 0x2058, nv_ro32(dev, ramfc, 0x7c/4));
@@ -442,9 +442,9 @@ nv50_fifo_unload_context(struct drm_device *dev)
 	nv_wo32(dev, ramfc, 0x2c/4, nv_rd32(dev, 0x337c));
 	nv_wo32(dev, ramfc, 0x30/4, nv_rd32(dev, NV04_PFIFO_CACHE1_DMA_STATE));
 	nv_wo32(dev, ramfc, 0x34/4, nv_rd32(dev, 0x3364));
-	nv_wo32(dev, ramfc, 0x38/4, nv_rd32(dev, 0x32a0));
+	nv_wo32(dev, ramfc, 0x38/4, nv_rd32(dev, NV04_PFIFO_CACHE1_DMA_DCOUNT));
 	nv_wo32(dev, ramfc, 0x3c/4, nv_rd32(dev, NV04_PFIFO_CACHE1_DMA_FETCH));
-	nv_wo32(dev, ramfc, 0x40/4, nv_rd32(dev, 0x324c));
+	nv_wo32(dev, ramfc, 0x40/4, nv_rd32(dev, NV10_PFIFO_CACHE1_DMA_SUBROUTINE));
 	nv_wo32(dev, ramfc, 0x44/4, nv_rd32(dev, NV04_PFIFO_DMA_TIMESLICE));
 	nv_wo32(dev, ramfc, 0x48/4, nv_rd32(dev, NV04_PFIFO_CACHE1_DMA_INSTANCE));
 	nv_wo32(dev, ramfc, 0x4c/4, nv_rd32(dev, 0x3234));
@@ -455,8 +455,8 @@ nv50_fifo_unload_context(struct drm_device *dev)
 	nv_wo32(dev, ramfc, 0x60/4, nv_rd32(dev, NV10_PFIFO_CACHE1_ACQUIRE_TIMEOUT));
 	nv_wo32(dev, ramfc, 0x64/4, nv_rd32(dev, NV10_PFIFO_CACHE1_ACQUIRE_TIMESTAMP));
 	nv_wo32(dev, ramfc, 0x68/4, nv_rd32(dev, NV10_PFIFO_CACHE1_ACQUIRE_VALUE));
-	nv_wo32(dev, ramfc, 0x6c/4, nv_rd32(dev, 0x326c));
-	nv_wo32(dev, ramfc, 0x70/4, nv_rd32(dev, 0x32e4));
+	nv_wo32(dev, ramfc, 0x6c/4, nv_rd32(dev, NV10_PFIFO_CACHE1_SEMAPHORE));
+	nv_wo32(dev, ramfc, 0x70/4, nv_rd32(dev, NV40_PFIFO_UNK32E4));
 	nv_wo32(dev, ramfc, 0x74/4, nv_rd32(dev, NV10_PFIFO_CACHE1_REF_CNT));
 	nv_wo32(dev, ramfc, 0x78/4, nv_rd32(dev, 0x2088));
 	nv_wo32(dev, ramfc, 0x7c/4, nv_rd32(dev, 0x2058));
-- 
1.6.6.1.476.g01ddb

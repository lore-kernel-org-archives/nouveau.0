From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: [PATCH] drm/nouveau: Add cache_flush/pull fifo engine
	functions.
Date: Mon, 14 Dec 2009 04:06:38 +0100
Message-ID: <1260759998-29612-1-git-send-email-currojerez@riseup.net>
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

Signed-off-by: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_drv.h   |    4 +++
 drivers/gpu/drm/nouveau/nouveau_state.c |   10 +++++++++
 drivers/gpu/drm/nouveau/nv04_fifo.c     |   34 +++++++++++++++++++++++++++++++
 3 files changed, 48 insertions(+), 0 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index 6e12a3d..de239d9 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -305,6 +305,8 @@ struct nouveau_fifo_engine {
 	void (*disable)(struct drm_device *);
 	void (*enable)(struct drm_device *);
 	bool (*reassign)(struct drm_device *, bool enable);
+	bool (*cache_flush)(struct drm_device *dev);
+	bool (*cache_pull)(struct drm_device *dev, bool enable);
 
 	int  (*channel_id)(struct drm_device *);
 
@@ -920,6 +922,8 @@ extern int  nv04_fifo_init(struct drm_device *);
 extern void nv04_fifo_disable(struct drm_device *);
 extern void nv04_fifo_enable(struct drm_device *);
 extern bool nv04_fifo_reassign(struct drm_device *, bool);
+extern bool nv04_fifo_cache_flush(struct drm_device *);
+extern bool nv04_fifo_cache_pull(struct drm_device *, bool);
 extern int  nv04_fifo_channel_id(struct drm_device *);
 extern int  nv04_fifo_create_context(struct nouveau_channel *);
 extern void nv04_fifo_destroy_context(struct nouveau_channel *);
diff --git a/drivers/gpu/drm/nouveau/nouveau_state.c b/drivers/gpu/drm/nouveau/nouveau_state.c
index 4342867..c2daf8c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_state.c
+++ b/drivers/gpu/drm/nouveau/nouveau_state.c
@@ -76,6 +76,8 @@ static int nouveau_init_engine_ptrs(struct drm_device *dev)
 		engine->fifo.disable		= nv04_fifo_disable;
 		engine->fifo.enable		= nv04_fifo_enable;
 		engine->fifo.reassign		= nv04_fifo_reassign;
+		engine->fifo.cache_flush	= nv04_fifo_cache_flush;
+		engine->fifo.cache_pull		= nv04_fifo_cache_pull;
 		engine->fifo.channel_id		= nv04_fifo_channel_id;
 		engine->fifo.create_context	= nv04_fifo_create_context;
 		engine->fifo.destroy_context	= nv04_fifo_destroy_context;
@@ -117,6 +119,8 @@ static int nouveau_init_engine_ptrs(struct drm_device *dev)
 		engine->fifo.disable		= nv04_fifo_disable;
 		engine->fifo.enable		= nv04_fifo_enable;
 		engine->fifo.reassign		= nv04_fifo_reassign;
+		engine->fifo.cache_flush	= nv04_fifo_cache_flush;
+		engine->fifo.cache_pull		= nv04_fifo_cache_pull;
 		engine->fifo.channel_id		= nv10_fifo_channel_id;
 		engine->fifo.create_context	= nv10_fifo_create_context;
 		engine->fifo.destroy_context	= nv10_fifo_destroy_context;
@@ -158,6 +162,8 @@ static int nouveau_init_engine_ptrs(struct drm_device *dev)
 		engine->fifo.disable		= nv04_fifo_disable;
 		engine->fifo.enable		= nv04_fifo_enable;
 		engine->fifo.reassign		= nv04_fifo_reassign;
+		engine->fifo.cache_flush	= nv04_fifo_cache_flush;
+		engine->fifo.cache_pull		= nv04_fifo_cache_pull;
 		engine->fifo.channel_id		= nv10_fifo_channel_id;
 		engine->fifo.create_context	= nv10_fifo_create_context;
 		engine->fifo.destroy_context	= nv10_fifo_destroy_context;
@@ -199,6 +205,8 @@ static int nouveau_init_engine_ptrs(struct drm_device *dev)
 		engine->fifo.disable		= nv04_fifo_disable;
 		engine->fifo.enable		= nv04_fifo_enable;
 		engine->fifo.reassign		= nv04_fifo_reassign;
+		engine->fifo.cache_flush	= nv04_fifo_cache_flush;
+		engine->fifo.cache_pull		= nv04_fifo_cache_pull;
 		engine->fifo.channel_id		= nv10_fifo_channel_id;
 		engine->fifo.create_context	= nv10_fifo_create_context;
 		engine->fifo.destroy_context	= nv10_fifo_destroy_context;
@@ -241,6 +249,8 @@ static int nouveau_init_engine_ptrs(struct drm_device *dev)
 		engine->fifo.disable		= nv04_fifo_disable;
 		engine->fifo.enable		= nv04_fifo_enable;
 		engine->fifo.reassign		= nv04_fifo_reassign;
+		engine->fifo.cache_flush	= nv04_fifo_cache_flush;
+		engine->fifo.cache_pull		= nv04_fifo_cache_pull;
 		engine->fifo.channel_id		= nv10_fifo_channel_id;
 		engine->fifo.create_context	= nv40_fifo_create_context;
 		engine->fifo.destroy_context	= nv40_fifo_destroy_context;
diff --git a/drivers/gpu/drm/nouveau/nv04_fifo.c b/drivers/gpu/drm/nouveau/nv04_fifo.c
index 0c3cd53..f31347b 100644
--- a/drivers/gpu/drm/nouveau/nv04_fifo.c
+++ b/drivers/gpu/drm/nouveau/nv04_fifo.c
@@ -71,6 +71,40 @@ nv04_fifo_reassign(struct drm_device *dev, bool enable)
 	return (reassign == 1);
 }
 
+bool
+nv04_fifo_cache_flush(struct drm_device *dev)
+{
+	struct drm_nouveau_private *dev_priv = dev->dev_private;
+	struct nouveau_timer_engine *ptimer = &dev_priv->engine.timer;
+	uint64_t start = ptimer->read(dev);
+
+	do {
+		if (nv_rd32(dev, NV03_PFIFO_CACHE1_GET) ==
+		    nv_rd32(dev, NV03_PFIFO_CACHE1_PUT))
+			return true;
+
+	} while (ptimer->read(dev) - start < 100000000);
+
+	NV_ERROR(dev, "Timeout flushing the PFIFO cache.\n");
+
+	return false;
+}
+
+bool
+nv04_fifo_cache_pull(struct drm_device *dev, bool enable)
+{
+	uint32_t pull = nv_rd32(dev, NV04_PFIFO_CACHE1_PULL0);
+
+	if (enable) {
+		nv_wr32(dev, NV04_PFIFO_CACHE1_PULL0, pull | 1);
+	} else {
+		nv_wr32(dev, NV04_PFIFO_CACHE1_PULL0, pull & ~1);
+		nv_wr32(dev, NV04_PFIFO_CACHE1_HASH, 0);
+	}
+
+	return !!(pull & 1);
+}
+
 int
 nv04_fifo_channel_id(struct drm_device *dev)
 {
-- 
1.6.4.4

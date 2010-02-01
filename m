From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 3/4] drm/nv50: avoid unloading pgraph context when
	ctxprog is running
Date: Mon,  1 Feb 2010 19:34:34 +0100
Message-ID: <1265049275-7680-3-git-send-email-madman2003@gmail.com>
References: <1265049275-7680-1-git-send-email-madman2003@gmail.com>
	<1265049275-7680-2-git-send-email-madman2003@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1265049275-7680-2-git-send-email-madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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

- We need to disable pgraph fifo access before checking the current channel,
otherwise we could still hit a running ctxprog.
- The writes to 0x400500 are already handled by pgraph->fifo_access and are
therefore redundant, moreover pgraph fifo access should not be reenabled before
current context is set as invalid. So remove them altogether.

Signed-off-by: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_channel.c |    7 +++----
 drivers/gpu/drm/nouveau/nv50_graph.c      |   10 +++++++---
 2 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_channel.c b/drivers/gpu/drm/nouveau/nouveau_channel.c
index 343d718..2281f99 100644
--- a/drivers/gpu/drm/nouveau/nouveau_channel.c
+++ b/drivers/gpu/drm/nouveau/nouveau_channel.c
@@ -278,12 +278,11 @@ nouveau_channel_free(struct nouveau_channel *chan)
 	/* Ensure the channel is no longer active on the GPU */
 	pfifo->reassign(dev, false);
 
-	if (pgraph->channel(dev) == chan) {
-		pgraph->fifo_access(dev, false);
+	pgraph->fifo_access(dev, false);
+	if (pgraph->channel(dev) == chan)
 		pgraph->unload_context(dev);
-		pgraph->fifo_access(dev, true);
-	}
 	pgraph->destroy_context(chan);
+	pgraph->fifo_access(dev, true);
 
 	if (pfifo->channel_id(dev) == chan->id) {
 		pfifo->disable(dev);
diff --git a/drivers/gpu/drm/nouveau/nv50_graph.c b/drivers/gpu/drm/nouveau/nv50_graph.c
index 20319e5..6d50480 100644
--- a/drivers/gpu/drm/nouveau/nv50_graph.c
+++ b/drivers/gpu/drm/nouveau/nv50_graph.c
@@ -165,6 +165,12 @@ nv50_graph_channel(struct drm_device *dev)
 	uint32_t inst;
 	int i;
 
+	/* Be sure we're not in the middle of a context switch or bad things
+	 * will happen, such as unloading the wrong pgraph context.
+	 */
+	if (!nv_wait(0x400300, 0x00000001, 0x00000000))
+		NV_ERROR(dev, "Ctxprog is still running\n");
+
 	inst = nv_rd32(dev, NV50_PGRAPH_CTXCTL_CUR);
 	if (!(inst & NV50_PGRAPH_CTXCTL_CUR_LOADED))
 		return NULL;
@@ -275,7 +281,7 @@ nv50_graph_load_context(struct nouveau_channel *chan)
 int
 nv50_graph_unload_context(struct drm_device *dev)
 {
-	uint32_t inst, fifo = nv_rd32(dev, 0x400500);
+	uint32_t inst;
 
 	inst  = nv_rd32(dev, NV50_PGRAPH_CTXCTL_CUR);
 	if (!(inst & NV50_PGRAPH_CTXCTL_CUR_LOADED))
@@ -283,12 +289,10 @@ nv50_graph_unload_context(struct drm_device *dev)
 	inst &= NV50_PGRAPH_CTXCTL_CUR_INSTANCE;
 
 	nouveau_wait_for_idle(dev);
-	nv_wr32(dev, 0x400500, fifo & ~1);
 	nv_wr32(dev, 0x400784, inst);
 	nv_wr32(dev, 0x400824, nv_rd32(dev, 0x400824) | 0x20);
 	nv_wr32(dev, 0x400304, nv_rd32(dev, 0x400304) | 0x01);
 	nouveau_wait_for_idle(dev);
-	nv_wr32(dev, 0x400500, fifo);
 
 	nv_wr32(dev, NV50_PGRAPH_CTXCTL_CUR, inst);
 	return 0;
-- 
1.6.6.1

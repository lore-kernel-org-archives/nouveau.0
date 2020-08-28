From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 5/6] drm/nouveau: Support DMA fence arrays
Date: Fri, 28 Aug 2020 12:40:15 +0200
Message-ID: <20200828104016.1672195-6-thierry.reding@gmail.com>
References: <20200828104016.1672195-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20200828104016.1672195-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

A DMA fence can be composed of multiple fences in an array. Support this
in the Nouveau driver by iteratively synchronizing to each DMA fence in
the array.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_fence.c | 31 ++++++++++++++++++++++---
 1 file changed, 28 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
index 8530c2684832..c0849e09279c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -24,6 +24,7 @@
  *
  */
 
+#include <linux/dma-fence-array.h>
 #include <linux/ktime.h>
 #include <linux/hrtimer.h>
 #include <linux/sched/signal.h>
@@ -338,9 +339,9 @@ nouveau_fence_wait(struct nouveau_fence *fence, bool lazy, bool intr)
 		return 0;
 }
 
-int
-nouveau_fence_sync(struct dma_fence *fence, struct nouveau_channel *chan,
-		   bool intr)
+static int
+__nouveau_fence_sync(struct dma_fence *fence, struct nouveau_channel *chan,
+		     bool intr)
 {
 	struct nouveau_fence_chan *fctx = chan->fence;
 	struct nouveau_channel *prev = NULL;
@@ -363,6 +364,30 @@ nouveau_fence_sync(struct dma_fence *fence, struct nouveau_channel *chan,
 	return ret;
 }
 
+int
+nouveau_fence_sync(struct dma_fence *fence, struct nouveau_channel *chan,
+		   bool intr)
+{
+	int ret = 0;
+
+	if (dma_fence_is_array(fence)) {
+		struct dma_fence_array *array = to_dma_fence_array(fence);
+		unsigned int i;
+
+		for (i = 0; i < array->num_fences; i++) {
+			struct dma_fence *f = array->fences[i];
+
+			ret = __nouveau_fence_sync(f, chan, intr);
+			if (ret < 0)
+				break;
+		}
+	} else {
+		ret = __nouveau_fence_sync(fence, chan, intr);
+	}
+
+	return ret;
+}
+
 struct nouveau_fence *
 nouveau_fence_ref(struct nouveau_fence *fence)
 {
-- 
2.28.0

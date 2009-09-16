From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: [PATCH] drm/nouveau: Fix a race condition in
	nouveau_fence_emit.
Date: Wed, 16 Sep 2009 14:36:49 +0200
Message-ID: <1253104609-24162-1-git-send-email-currojerez@riseup.net>
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

On early cards relying on synthetic methods for fence signalling
(nv0x) the IRQ was sometimes raised before the fence had been appended
to the pending list. In that case it remained unsignalled and it
caused trouble (bug 23593).

Signed-off-by: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_fence.c |    9 +++++----
 1 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
index 32b4bb9..ad98e9b 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -137,14 +137,15 @@ nouveau_fence_emit(struct nouveau_fence *fence)
 
 	fence->sequence = ++chan->fence.sequence;
 
-	BEGIN_RING(chan, NvSubM2MF, USE_REFCNT ? 0x0050 : 0x0150, 1);
-	OUT_RING  (chan, fence->sequence);
-	FIRE_RING (chan);
-
 	kref_get(&fence->refcount);
 	spin_lock_irqsave(&chan->fence.lock, flags);
 	list_add_tail(&fence->entry, &chan->fence.pending);
 	spin_unlock_irqrestore(&chan->fence.lock, flags);
+
+	BEGIN_RING(chan, NvSubM2MF, USE_REFCNT ? 0x0050 : 0x0150, 1);
+	OUT_RING  (chan, fence->sequence);
+	FIRE_RING (chan);
+
 	return 0;
 }
 
-- 
1.6.3.3

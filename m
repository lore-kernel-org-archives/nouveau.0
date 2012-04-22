From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/5] drm/nouveau: base fence timeout on time of
	emission
Date: Mon, 23 Apr 2012 00:18:29 +0200
Message-ID: <1335133112-8008-2-git-send-email-marcin.slusarz@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Wait loop can be interrupted by signal, so if signals are raised
periodically (e.g. SIGALRM) this loop may never finish. Use
emission time as a base for fence timeout.

Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_fence.c |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
index a22b9ad..59f92e9 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -44,6 +44,7 @@ struct nouveau_fence {
 
 	uint32_t sequence;
 	bool signalled;
+	unsigned long emitted_at;
 
 	void (*work)(void *priv, bool signalled);
 	void *priv;
@@ -172,6 +173,7 @@ nouveau_fence_emit(struct nouveau_fence *fence)
 	}
 	OUT_RING (chan, fence->sequence);
 	FIRE_RING(chan);
+	fence->emitted_at = jiffies;
 
 	return 0;
 }
@@ -230,7 +232,8 @@ __nouveau_fence_signalled(void *sync_obj, void *sync_arg)
 int
 __nouveau_fence_wait(void *sync_obj, void *sync_arg, bool lazy, bool intr)
 {
-	unsigned long timeout = jiffies + (3 * DRM_HZ);
+	struct nouveau_fence *fence = nouveau_fence(sync_obj);
+	unsigned long timeout = fence->emitted_at + 3 * DRM_HZ;
 	unsigned long sleep_time = NSEC_PER_MSEC / 1000;
 	ktime_t t;
 	int ret = 0;
-- 
1.7.8.5

From: Marcin Slusarz <marcin.slusarz@gmail.com>
Subject: [PATCH v2 1/4] drm/nouveau: base fence timeout on time of emission
Date: Wed, 25 Apr 2012 23:20:33 +0200
Message-ID: <1335388836-13127-1-git-send-email-marcin.slusarz@gmail.com>
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
To: nouveau@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>
Cc: dri-devel@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

Wait loop can be interrupted by signal, so if signals are raised
periodically (e.g. SIGALRM) this loop may never finish. Use
emission time as a base for fence timeout.

Signed-off-by: Marcin Slusarz <marcin.slusarz@gmail.com>
---
 drivers/gpu/drm/nouveau/nouveau_fence.c |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
index a22b9ad..41ee17d 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -44,6 +44,7 @@ struct nouveau_fence {
 
 	uint32_t sequence;
 	bool signalled;
+	unsigned long timeout;
 
 	void (*work)(void *priv, bool signalled);
 	void *priv;
@@ -172,6 +173,7 @@ nouveau_fence_emit(struct nouveau_fence *fence)
 	}
 	OUT_RING (chan, fence->sequence);
 	FIRE_RING(chan);
+	fence->timeout = jiffies + 3 * DRM_HZ;
 
 	return 0;
 }
@@ -230,7 +232,8 @@ __nouveau_fence_signalled(void *sync_obj, void *sync_arg)
 int
 __nouveau_fence_wait(void *sync_obj, void *sync_arg, bool lazy, bool intr)
 {
-	unsigned long timeout = jiffies + (3 * DRM_HZ);
+	struct nouveau_fence *fence = nouveau_fence(sync_obj);
+	unsigned long timeout = fence->timeout;
 	unsigned long sleep_time = NSEC_PER_MSEC / 1000;
 	ktime_t t;
 	int ret = 0;
-- 
1.7.8.5

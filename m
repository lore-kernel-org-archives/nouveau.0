From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] drm/nouveau: fix __nouveau_fence_wait performance
	regression
Date: Sun, 13 Feb 2011 21:38:04 +0100
Message-ID: <20110213203804.GA5395@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Combination of locking and interchannel synchronization changes
uncovered poor behaviour of nouveau_fence_wait, which on HZ=100
configuration could waste up to 10 ms per call.
Depending on application, it lead to 10-30% FPS regression.
To fix it, shorten thread sleep time to 0.1 ms and ensure
spinning happens for at least one *full* tick.

Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_fence.c |   10 ++++++++--
 1 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
index 221b846..75ba5e2 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -27,6 +27,9 @@
 #include "drmP.h"
 #include "drm.h"
 
+#include <linux/ktime.h>
+#include <linux/hrtimer.h>
+
 #include "nouveau_drv.h"
 #include "nouveau_ramht.h"
 #include "nouveau_dma.h"
@@ -230,9 +233,12 @@ int
 __nouveau_fence_wait(void *sync_obj, void *sync_arg, bool lazy, bool intr)
 {
 	unsigned long timeout = jiffies + (3 * DRM_HZ);
-	unsigned long sleep_time = jiffies + 1;
+	unsigned long sleep_time = jiffies + 2;
+	ktime_t t;
 	int ret = 0;
 
+	t = ktime_set(0, NSEC_PER_MSEC / 10);
+
 	while (1) {
 		if (__nouveau_fence_signalled(sync_obj, sync_arg))
 			break;
@@ -245,7 +251,7 @@ __nouveau_fence_wait(void *sync_obj, void *sync_arg, bool lazy, bool intr)
 		__set_current_state(intr ? TASK_INTERRUPTIBLE
 			: TASK_UNINTERRUPTIBLE);
 		if (lazy && time_after_eq(jiffies, sleep_time))
-			schedule_timeout(1);
+			schedule_hrtimeout(&t, HRTIMER_MODE_REL);
 
 		if (intr && signal_pending(current)) {
 			ret = -ERESTARTSYS;
-- 
1.7.4.rc3

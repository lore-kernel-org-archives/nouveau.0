From: Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Subject: [PATCH 01/19] fence: add debugging lines to
 fence_is_signaled for the callback
Date: Thu, 31 Jul 2014 17:32:45 +0200
Message-ID: <20140731153245.15061.63023.stgit@patser>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: airlied-cv59FeDIM0c@public.gmane.org
Cc: thellstrom-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, alexander.deucher-5C7GfCeVMHo@public.gmane.org, christian.koenig-5C7GfCeVMHo@public.gmane.org
List-Id: nouveau.vger.kernel.org

fence_is_signaled callback should support being run in
atomic context, but not in irq context.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
---
 include/linux/fence.h |   23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/include/linux/fence.h b/include/linux/fence.h
index d174585b874b..c1a4519ba2f5 100644
--- a/include/linux/fence.h
+++ b/include/linux/fence.h
@@ -143,6 +143,7 @@ struct fence_cb {
  * the second time will be a noop since it was already signaled.
  *
  * Notes on signaled:
+ * Called with interrupts enabled, and never from interrupt context.
  * May set fence->status if returning true.
  *
  * Notes on wait:
@@ -268,15 +269,29 @@ fence_is_signaled_locked(struct fence *fence)
 static inline bool
 fence_is_signaled(struct fence *fence)
 {
+	bool ret;
+
 	if (test_bit(FENCE_FLAG_SIGNALED_BIT, &fence->flags))
 		return true;
 
-	if (fence->ops->signaled && fence->ops->signaled(fence)) {
+	if (!fence->ops->signaled)
+		return false;
+
+	if (config_enabled(CONFIG_PROVE_LOCKING))
+		WARN_ON(in_interrupt() || irqs_disabled());
+
+	if (config_enabled(CONFIG_DEBUG_ATOMIC_SLEEP))
+		preempt_disable();
+
+	ret = fence->ops->signaled(fence);
+
+	if (config_enabled(CONFIG_DEBUG_ATOMIC_SLEEP))
+		preempt_enable();
+
+	if (ret)
 		fence_signal(fence);
-		return true;
-	}
 
-	return false;
+	return ret;
 }
 
 /**

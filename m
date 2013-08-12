From: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
Subject: [PATCH 3/5] drm/nouveau/timer: restore the time on resume
Date: Sun, 11 Aug 2013 22:48:50 -0400
Message-ID: <1376275732-2878-4-git-send-email-martin.peres@free.fr>
References: <1376275732-2878-1-git-send-email-martin.peres@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1376275732-2878-1-git-send-email-martin.peres-GANU6spQydw@public.gmane.org>
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
Cc: Martin Peres <martin.peres-BktLLJ5BOkI@public.gmane.org>
List-Id: nouveau.vger.kernel.org

From: Martin Peres <martin.peres-BktLLJ5BOkI@public.gmane.org>

This can be useful if some parts of Nouveau try to calculate the time between
two events. Without this patch, the time difference would be negative in the
case where the computer is suspended/resumed between two events.
This patch should fix fan speed probing when done while suspending/resuming.

Solve this by saving the current time before suspending and by restoring it
on resume.

Signed-off-by: Martin Peres <martin.peres-BktLLJ5BOkI@public.gmane.org>
Tested-by: Martin Peres <martin.peres-BktLLJ5BOkI@public.gmane.org>
---
 drivers/gpu/drm/nouveau/core/subdev/timer/nv04.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/core/subdev/timer/nv04.c b/drivers/gpu/drm/nouveau/core/subdev/timer/nv04.c
index 9469b82..8c72da6 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/timer/nv04.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/timer/nv04.c
@@ -36,6 +36,7 @@ struct nv04_timer_priv {
 	struct nouveau_timer base;
 	struct list_head alarms;
 	spinlock_t lock;
+	u64 suspend_time;
 };
 
 static u64
@@ -146,6 +147,7 @@ nv04_timer_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 	priv->base.base.intr = nv04_timer_intr;
 	priv->base.read = nv04_timer_read;
 	priv->base.alarm = nv04_timer_alarm;
+	priv->suspend_time = 0;
 
 	INIT_LIST_HEAD(&priv->alarms);
 	spin_lock_init(&priv->lock);
@@ -164,7 +166,7 @@ nv04_timer_init(struct nouveau_object *object)
 {
 	struct nouveau_device *device = nv_device(object);
 	struct nv04_timer_priv *priv = (void *)object;
-	u32 m = 1, f, n, d;
+	u32 m = 1, f, n, d, lo, hi;
 	int ret;
 
 	ret = nouveau_timer_init(&priv->base);
@@ -220,17 +222,26 @@ nv04_timer_init(struct nouveau_object *object)
 		n >>= 1;
 		d >>= 1;
 	}
+	
+	/* restore the time before suspend */
+	lo = priv->suspend_time;
+	hi = (priv->suspend_time >> 32);
 
 	nv_debug(priv, "input frequency : %dHz\n", f);
 	nv_debug(priv, "input multiplier: %d\n", m);
 	nv_debug(priv, "numerator       : 0x%08x\n", n);
 	nv_debug(priv, "denominator     : 0x%08x\n", d);
 	nv_debug(priv, "timer frequency : %dHz\n", (f * m) * d / n);
+	nv_debug(priv, "time low        : 0x%08x\n", lo);
+	nv_debug(priv, "time high       : 0x%08x\n", hi);
 
 	nv_wr32(priv, NV04_PTIMER_NUMERATOR, n);
 	nv_wr32(priv, NV04_PTIMER_DENOMINATOR, d);
 	nv_wr32(priv, NV04_PTIMER_INTR_0, 0xffffffff);
 	nv_wr32(priv, NV04_PTIMER_INTR_EN_0, 0x00000000);
+	nv_wr32(priv, NV04_PTIMER_TIME_1, hi);
+	nv_wr32(priv, NV04_PTIMER_TIME_0, lo);
+
 	return 0;
 }
 
@@ -238,6 +249,8 @@ static int
 nv04_timer_fini(struct nouveau_object *object, bool suspend)
 {
 	struct nv04_timer_priv *priv = (void *)object;
+	if (suspend)
+		priv->suspend_time = nv04_timer_read(&priv->base);
 	nv_wr32(priv, NV04_PTIMER_INTR_EN_0, 0x00000000);
 	return nouveau_timer_fini(&priv->base, suspend);
 }
-- 
1.8.3.4

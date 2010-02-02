From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 6/6] drm/nouveau: give pgraph a chance to idle
	before spinlock
Date: Tue,  2 Feb 2010 22:36:05 +0100
Message-ID: <1265146565-6048-6-git-send-email-madman2003@gmail.com>
References: <1265146565-6048-1-git-send-email-madman2003@gmail.com>
	<1265146565-6048-2-git-send-email-madman2003@gmail.com>
	<1265146565-6048-3-git-send-email-madman2003@gmail.com>
	<1265146565-6048-4-git-send-email-madman2003@gmail.com>
	<1265146565-6048-5-git-send-email-madman2003@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1265146565-6048-5-git-send-email-madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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

- Under some rare conditions i've managed to get pgraph errors after the
  channel is closed, which has very undesirable effects.
- This is the only reason i can think off.

Signed-off-by: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_channel.c |   13 ++++++++++---
 1 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_channel.c b/drivers/gpu/drm/nouveau/nouveau_channel.c
index 86399f6..d25ed61 100644
--- a/drivers/gpu/drm/nouveau/nouveau_channel.c
+++ b/drivers/gpu/drm/nouveau/nouveau_channel.c
@@ -280,11 +280,18 @@ nouveau_channel_free(struct nouveau_channel *chan)
 	 */
 	nouveau_fence_fini(chan);
 
-	spin_lock_irqsave(&dev_priv->engine.lock, flags);
-
-	/* Ensure the channel is no longer active on the GPU */
+	/* This will prevent pfifo from switching channels. */
 	pfifo->reassign(dev, false);
 
+	/* We want to give pgraph a chance to idle and get rid of all potential
+	 * errors. We need to do this before the lock, otherwise the irq handler
+	 * is unable to process them.
+	 */
+	if (pgraph->channel(dev) == chan)
+		nouveau_wait_for_idle(dev);
+
+	spin_lock_irqsave(&dev_priv->engine.lock, flags);
+
 	pgraph->fifo_access(dev, false);
 	if (pgraph->channel(dev) == chan)
 		pgraph->unload_context(dev);
-- 
1.6.6.1

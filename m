From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 3/6] drm/nv50: delete ramfc object after disabling
	fifo, not before
Date: Tue,  2 Feb 2010 22:36:02 +0100
Message-ID: <1265146565-6048-3-git-send-email-madman2003@gmail.com>
References: <1265146565-6048-1-git-send-email-madman2003@gmail.com>
	<1265146565-6048-2-git-send-email-madman2003@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1265146565-6048-2-git-send-email-madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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

- ramfc is zero'ed upon destruction, so it's safer to do things in the right
order.

Signed-off-by: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nv50_fifo.c |    9 ++++++---
 1 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nv50_fifo.c b/drivers/gpu/drm/nouveau/nv50_fifo.c
index 32b244b..204a79f 100644
--- a/drivers/gpu/drm/nouveau/nv50_fifo.c
+++ b/drivers/gpu/drm/nouveau/nv50_fifo.c
@@ -317,17 +317,20 @@ void
 nv50_fifo_destroy_context(struct nouveau_channel *chan)
 {
 	struct drm_device *dev = chan->dev;
+	struct nouveau_gpuobj_ref *ramfc = chan->ramfc;
 
 	NV_DEBUG(dev, "ch%d\n", chan->id);
 
-	nouveau_gpuobj_ref_del(dev, &chan->ramfc);
-	nouveau_gpuobj_ref_del(dev, &chan->cache);
-
+	/* This will ensure the channel is seen as disabled. */
+	chan->ramfc = NULL;
 	nv50_fifo_channel_disable(dev, chan->id, false);
 
 	/* Dummy channel, also used on ch 127 */
 	if (chan->id == 0)
 		nv50_fifo_channel_disable(dev, 127, false);
+
+	nouveau_gpuobj_ref_del(dev, &ramfc);
+	nouveau_gpuobj_ref_del(dev, &chan->cache);
 }
 
 int
-- 
1.6.6.1

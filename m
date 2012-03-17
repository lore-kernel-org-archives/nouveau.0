From: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
Subject: [PATCH] drm/nv40/mpeg: fix context handling for nv40-nv43
Date: Sat, 17 Mar 2012 13:46:48 +0100
Message-ID: <1331988408-7208-1-git-send-email-e0425955@student.tuwien.ac.at>
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
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Contexts in instance memory were not added to PMPEG until nv44.
---
 drivers/gpu/drm/nouveau/nv31_mpeg.c |   14 +++++++-------
 1 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nv31_mpeg.c b/drivers/gpu/drm/nouveau/nv31_mpeg.c
index 6f06a07..bd90d51 100644
--- a/drivers/gpu/drm/nouveau/nv31_mpeg.c
+++ b/drivers/gpu/drm/nouveau/nv31_mpeg.c
@@ -53,7 +53,7 @@ nv31_mpeg_context_del(struct nouveau_channel *chan, int engine)
 }
 
 static int
-nv40_mpeg_context_new(struct nouveau_channel *chan, int engine)
+nv44_mpeg_context_new(struct nouveau_channel *chan, int engine)
 {
 	struct drm_device *dev = chan->dev;
 	struct drm_nouveau_private *dev_priv = dev->dev_private;
@@ -83,7 +83,7 @@ nv40_mpeg_context_new(struct nouveau_channel *chan, int engine)
 }
 
 static void
-nv40_mpeg_context_del(struct nouveau_channel *chan, int engine)
+nv44_mpeg_context_del(struct nouveau_channel *chan, int engine)
 {
 	struct drm_nouveau_private *dev_priv = chan->dev->dev_private;
 	struct nouveau_gpuobj *ctx = chan->engctx[engine];
@@ -213,8 +213,8 @@ nv31_mpeg_isr_chid(struct drm_device *dev, u32 inst)
 	unsigned long flags;
 	int i;
 
-	/* hardcode drm channel id on nv3x, so swmthd lookup works */
-	if (dev_priv->card_type < NV_40)
+	/* hardcode drm channel id on < nv44, so swmthd lookup works */
+	if (dev_priv->chipset < 0x44)
 		return 0;
 
 	spin_lock_irqsave(&dev_priv->channels.lock, flags);
@@ -312,12 +312,12 @@ nv31_mpeg_create(struct drm_device *dev)
 	pmpeg->base.destroy = nv31_mpeg_destroy;
 	pmpeg->base.init = nv31_mpeg_init;
 	pmpeg->base.fini = nv31_mpeg_fini;
-	if (dev_priv->card_type < NV_40) {
+	if (dev_priv->chipset < 0x44) {
 		pmpeg->base.context_new = nv31_mpeg_context_new;
 		pmpeg->base.context_del = nv31_mpeg_context_del;
 	} else {
-		pmpeg->base.context_new = nv40_mpeg_context_new;
-		pmpeg->base.context_del = nv40_mpeg_context_del;
+		pmpeg->base.context_new = nv44_mpeg_context_new;
+		pmpeg->base.context_del = nv44_mpeg_context_del;
 	}
 	pmpeg->base.object_new = nv31_mpeg_object_new;
 
-- 
1.7.3.4

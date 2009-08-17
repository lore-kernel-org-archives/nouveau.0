From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: [PATCH 4/8] drm/nv50: proper notifier_bo access in
	nv50_display_vblank_crtc_handler()
Date: Mon, 17 Aug 2009 16:42:40 +0300
Message-ID: <1250516564-14193-5-git-send-email-pq@iki.fi>
References: <1250516564-14193-1-git-send-email-pq@iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1250516564-14193-1-git-send-email-pq-X3B1VOXEql0@public.gmane.org>
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

Signed-off-by: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nv50_display.c |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nv50_display.c b/drivers/gpu/drm/nouveau/nv50_display.c
index 49225c8..234133d 100644
--- a/drivers/gpu/drm/nouveau/nv50_display.c
+++ b/drivers/gpu/drm/nouveau/nv50_display.c
@@ -640,14 +640,12 @@ nv50_display_vblank_crtc_handler(struct drm_device *dev, int crtc)
 	struct drm_nouveau_private *dev_priv = dev->dev_private;
 	struct nouveau_channel *chan;
 	struct list_head *entry, *tmp;
-	uint32_t *sem;
 
 	list_for_each_safe(entry, tmp, &dev_priv->vbl_waiting) {
 		chan = list_entry(entry, struct nouveau_channel, nvsw.vbl_wait);
 
-		sem = chan->notifier_bo->kmap.virtual;
-		sem[chan->nvsw.vblsem_offset] = chan->nvsw.vblsem_rval;
-
+		nouveau_bo_wr32(chan->notifier_bo, chan->nvsw.vblsem_offset,
+						chan->nvsw.vblsem_rval);
 		list_del(&chan->nvsw.vbl_wait);
 	}
 }
-- 
1.6.3.3

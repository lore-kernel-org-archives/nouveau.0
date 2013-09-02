From: Maarten Lankhorst <maarten.lankhorst@canonical.com>
Subject: [PATCH] drm/nv84-: write fence value on exit,
	and restore value on init.
Date: Mon,  2 Sep 2013 16:31:02 +0200
Message-ID: <1378132262-19453-1-git-send-email-maarten.lankhorst@canonical.com>
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
To: nouveau@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

This increases the chance slightly that recovery from lockup can happen
succesfully.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@canonical.com>
---
 drivers/gpu/drm/nouveau/nv84_fence.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nv84_fence.c b/drivers/gpu/drm/nouveau/nv84_fence.c
index 2cf0ade..daf4b18 100644
--- a/drivers/gpu/drm/nouveau/nv84_fence.c
+++ b/drivers/gpu/drm/nouveau/nv84_fence.c
@@ -122,8 +122,11 @@ nv84_fence_context_del(struct nouveau_channel *chan)
 	struct drm_device *dev = chan->drm->dev;
 	struct nv84_fence_priv *priv = chan->drm->fence;
 	struct nv84_fence_chan *fctx = chan->fence;
+	struct nouveau_fifo_chan *fifo = (void *)chan->object;
 	int i;
 
+	nouveau_bo_wr32(priv->bo, fifo->chid * 16/4, fctx->base.sequence);
+
 	for (i = 0; i < dev->mode_config.num_crtc; i++) {
 		struct nouveau_bo *bo = nv50_display_crtc_sema(dev, i);
 		nouveau_bo_vma_del(bo, &fctx->dispc_vma[i]);
@@ -168,7 +171,7 @@ nv84_fence_context_new(struct nouveau_channel *chan)
 		ret = nouveau_bo_vma_add(bo, client->vm, &fctx->dispc_vma[i]);
 	}
 
-	nouveau_bo_wr32(priv->bo, fifo->chid * 16/4, 0x00000000);
+	fctx->base.sequence = nouveau_bo_rd32(priv->bo, fifo->chid * 16/4);
 
 	if (ret)
 		nv84_fence_context_del(chan);
-- 
1.8.3.4

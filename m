From: Maarten Lankhorst <m.b.lankhorst@gmail.com>
Subject: [PATCH] drm/nouveau: fix suspend bug in nvc0 fence implementation
Date: Tue, 19 Feb 2013 10:20:55 +0000
Message-ID: <CAMuW1wcx8BEkase+S_+bmZp6b+CFunrmAd6PDNaZONFYLfpG-g@mail.gmail.com>
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
To: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

Everywhere else the constant is multiplied by 16/4, so it looks like
nvc0_fence_suspend/resume is buggy here.

Signed-off-by: Maarten Lankhorst <m.b.lankhorst@gmail.com>
Cc: stable@vger.kernel.org [3.7+]

---

diff --git a/drivers/gpu/drm/nouveau/nvc0_fence.c
b/drivers/gpu/drm/nouveau/nvc0_fence.c
index 85a0e78..4f46d8b 100644
--- a/drivers/gpu/drm/nouveau/nvc0_fence.c
+++ b/drivers/gpu/drm/nouveau/nvc0_fence.c
@@ -161,11 +161,12 @@ nvc0_fence_suspend(struct nouveau_drm *drm)
 	struct nouveau_fifo *pfifo = nouveau_fifo(drm->device);
 	struct nvc0_fence_priv *priv = drm->fence;
 	int i;
+	u32 chan = pfifo->max + 1;

-	priv->suspend = vmalloc((pfifo->max + 1) * sizeof(u32));
+	priv->suspend = vmalloc(chan * sizeof(u32));
 	if (priv->suspend) {
-		for (i = 0; i <= pfifo->max; i++)
-			priv->suspend[i] = nouveau_bo_rd32(priv->bo, i);
+		for (i = 0; i < chan; i++)
+			priv->suspend[i] = nouveau_bo_rd32(priv->bo, i * 16/4);
 	}

 	return priv->suspend != NULL;
@@ -177,10 +178,11 @@ nvc0_fence_resume(struct nouveau_drm *drm)
 	struct nouveau_fifo *pfifo = nouveau_fifo(drm->device);
 	struct nvc0_fence_priv *priv = drm->fence;
 	int i;
+	u32 chan = pfifo->max + 1;

 	if (priv->suspend) {
-		for (i = 0; i <= pfifo->max; i++)
-			nouveau_bo_wr32(priv->bo, i, priv->suspend[i]);
+		for (i = 0; i < chan; i++)
+			nouveau_bo_wr32(priv->bo, i * 16/4, priv->suspend[i]);
 		vfree(priv->suspend);
 		priv->suspend = NULL;
 	}

From: Maarten Lankhorst <maarten.lankhorst@canonical.com>
Subject: [PATCH] drm/nv84+: fix fence context seqno's
Date: Mon, 22 Sep 2014 11:08:48 +0200
Message-ID: <541FE720.50504@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Ben Skeggs <bskeggs@redhat.com>
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Ted Percival <ted@tedp.id.au>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

This fixes a regression introduced by "drm/nouveau: rework to new fence interface"
(commit 29ba89b2371d466).

The fence sequence should not be reset after creation, the old value is used instead.
On destruction the final value is written, to prevent another source of accidental
wraparound in case of a channel being destroyed after a hang, and unblocking any other
channel that may wait on the about-to-be-deleted channel to signal.

I'm nothing if not optimistic about any hope of recovery from that. ;-)

Reported-by: Ted Percival <ted@tedp.id.au>
Signed-off-by: Maarten Lankhorst <maarten.lankhorst@canonical.com>
---
diff --git a/drivers/gpu/drm/nouveau/nv84_fence.c b/drivers/gpu/drm/nouveau/nv84_fence.c
index 7b372a68aa4e..4138db4d8291 100644
--- a/drivers/gpu/drm/nouveau/nv84_fence.c
+++ b/drivers/gpu/drm/nouveau/nv84_fence.c
@@ -120,6 +120,7 @@ nv84_fence_context_del(struct nouveau_channel *chan)
 		nouveau_bo_vma_del(bo, &fctx->dispc_vma[i]);
 	}
 
+	nouveau_bo_wr32(priv->bo, chan->chid * 16 / 4, fctx->base.sequence);
 	nouveau_bo_vma_del(priv->bo, &fctx->vma_gart);
 	nouveau_bo_vma_del(priv->bo, &fctx->vma);
 	nouveau_fence_context_del(&fctx->base);
@@ -159,8 +160,6 @@ nv84_fence_context_new(struct nouveau_channel *chan)
 		ret = nouveau_bo_vma_add(bo, cli->vm, &fctx->dispc_vma[i]);
 	}
 
-	nouveau_bo_wr32(priv->bo, chan->chid * 16/4, 0x00000000);
-
 	if (ret)
 		nv84_fence_context_del(chan);
 	return ret;

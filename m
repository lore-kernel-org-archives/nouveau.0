From: Marcin Slusarz <marcin.slusarz@gmail.com>
Subject: [PATCH] nv50/nvc0: make transfers aware of
	PIPE_TRANSFER_MAP_DIRECTLY
Date: Mon, 9 May 2011 00:39:00 +0200
Message-ID: <20110508223900.GF10163@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org>
Content-Disposition: inline
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/mesa-dev>
List-Post: <mailto:mesa-dev@lists.freedesktop.org>
List-Help: <mailto:mesa-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org
Errors-To: mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org
To: nouveau@lists.freedesktop.org
Cc: mesa-dev@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

If state tracker asked us to map resource directly and we can't
do it (because of tiling), return NULL instead of doing full transfer
- state tracker should handle it and fallback to some other method
or repeat transfer without PIPE_TRANSFER_MAP_DIRECTLY.

It greatly improves performance of xorg state tracker on nv50+,
because fallback (DFS/UTS) is much faster than full transfer.
---
 src/gallium/drivers/nv50/nv50_transfer.c |   31 +++++++++++++++++++---------
 src/gallium/drivers/nvc0/nvc0_transfer.c |   32 ++++++++++++++++++++---------
 2 files changed, 43 insertions(+), 20 deletions(-)

diff --git a/src/gallium/drivers/nv50/nv50_transfer.c b/src/gallium/drivers/nv50/nv50_transfer.c
index 7486977..13ac372 100644
--- a/src/gallium/drivers/nv50/nv50_transfer.c
+++ b/src/gallium/drivers/nv50/nv50_transfer.c
@@ -209,6 +209,10 @@ nv50_miptree_transfer_new(struct pipe_context *pctx,
    uint32_t w, h, d, z, layer;
    int ret;
 
+   if ((usage & PIPE_TRANSFER_MAP_DIRECTLY) &&
+         nouveau_bo_tile_layout(mt->base.bo))
+      return NULL;
+
    if (mt->layout_3d) {
       z = box->z;
       d = u_minify(res->depth0, level);
@@ -252,6 +256,11 @@ nv50_miptree_transfer_new(struct pipe_context *pctx,
    tx->rect[0].pitch = lvl->pitch;
    tx->rect[0].domain = NOUVEAU_BO_VRAM;
 
+   if (usage & PIPE_TRANSFER_MAP_DIRECTLY) {
+      tx->rect[1] = tx->rect[0];
+      return &tx->base;
+   }
+
    size = tx->base.layer_stride;
 
    ret = nouveau_bo_new(dev, NOUVEAU_BO_GART | NOUVEAU_BO_MAP, 0,
@@ -296,19 +305,21 @@ nv50_miptree_transfer_del(struct pipe_context *pctx,
    struct nv50_miptree *mt = nv50_miptree(tx->base.resource);
    unsigned i;
 
-   if (tx->base.usage & PIPE_TRANSFER_WRITE) {
-      for (i = 0; i < tx->base.box.depth; ++i) {
-         nv50_m2mf_transfer_rect(pscreen, &tx->rect[0], &tx->rect[1],
-                                 tx->nblocksx, tx->nblocksy);
-         if (mt->layout_3d)
-            tx->rect[0].z++;
-         else
-            tx->rect[0].base += mt->layer_stride;
-         tx->rect[1].base += tx->nblocksy * tx->base.stride;
+   if (!(tx->base.usage & PIPE_TRANSFER_MAP_DIRECTLY)) {
+      if (tx->base.usage & PIPE_TRANSFER_WRITE) {
+         for (i = 0; i < tx->base.box.depth; ++i) {
+            nv50_m2mf_transfer_rect(pscreen, &tx->rect[0], &tx->rect[1],
+                                    tx->nblocksx, tx->nblocksy);
+            if (mt->layout_3d)
+               tx->rect[0].z++;
+            else
+               tx->rect[0].base += mt->layer_stride;
+            tx->rect[1].base += tx->nblocksy * tx->base.stride;
+         }
       }
+      nouveau_bo_ref(NULL, &tx->rect[1].bo);
    }
 
-   nouveau_bo_ref(NULL, &tx->rect[1].bo);
    pipe_resource_reference(&transfer->resource, NULL);
 
    FREE(tx);
diff --git a/src/gallium/drivers/nvc0/nvc0_transfer.c b/src/gallium/drivers/nvc0/nvc0_transfer.c
index 7bbfe05..6a2721c 100644
--- a/src/gallium/drivers/nvc0/nvc0_transfer.c
+++ b/src/gallium/drivers/nvc0/nvc0_transfer.c
@@ -246,6 +246,10 @@ nvc0_miptree_transfer_new(struct pipe_context *pctx,
    uint32_t w, h, d, z, layer;
    int ret;
 
+   if ((usage & PIPE_TRANSFER_MAP_DIRECTLY) &&
+         nouveau_bo_tile_layout(mt->base.bo))
+      return NULL;
+
    tx = CALLOC_STRUCT(nvc0_transfer);
    if (!tx)
       return NULL;
@@ -290,6 +294,11 @@ nvc0_miptree_transfer_new(struct pipe_context *pctx,
    tx->rect[0].pitch = lvl->pitch;
    tx->rect[0].domain = NOUVEAU_BO_VRAM;
 
+   if (usage & PIPE_TRANSFER_MAP_DIRECTLY) {
+      tx->rect[1] = tx->rect[0];
+      return &tx->base;
+   }
+
    size = tx->base.layer_stride;
 
    ret = nouveau_bo_new(dev, NOUVEAU_BO_GART | NOUVEAU_BO_MAP, 0,
@@ -334,19 +343,22 @@ nvc0_miptree_transfer_del(struct pipe_context *pctx,
    struct nvc0_miptree *mt = nvc0_miptree(tx->base.resource);
    unsigned i;
 
-   if (tx->base.usage & PIPE_TRANSFER_WRITE) {
-      for (i = 0; i < tx->nlayers; ++i) {
-         nvc0_m2mf_transfer_rect(pscreen, &tx->rect[0], &tx->rect[1],
-                                 tx->nblocksx, tx->nblocksy);
-         if (mt->layout_3d)
-            tx->rect[0].z++;
-         else
-            tx->rect[0].base += mt->layer_stride;
-         tx->rect[1].base += tx->nblocksy * tx->base.stride;
+   if (!(tx->base.usage & PIPE_TRANSFER_MAP_DIRECTLY)) {
+      if (tx->base.usage & PIPE_TRANSFER_WRITE) {
+         for (i = 0; i < tx->nlayers; ++i) {
+            nvc0_m2mf_transfer_rect(pscreen, &tx->rect[0], &tx->rect[1],
+                                    tx->nblocksx, tx->nblocksy);
+            if (mt->layout_3d)
+               tx->rect[0].z++;
+            else
+               tx->rect[0].base += mt->layer_stride;
+            tx->rect[1].base += tx->nblocksy * tx->base.stride;
+         }
       }
+
+      nouveau_bo_ref(NULL, &tx->rect[1].bo);
    }
 
-   nouveau_bo_ref(NULL, &tx->rect[1].bo);
    pipe_resource_reference(&transfer->resource, NULL);
 
    FREE(tx);
-- 
1.7.4.1

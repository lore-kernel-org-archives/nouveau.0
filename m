From: Geliang Tang <geliangtang@gmail.com>
Subject: [PATCH] drm/nouveau/dma: use rb_entry()
Date: Tue, 20 Dec 2016 22:02:11 +0800
Message-ID: <5a188bc5a22daa80cf7a43dc75003b31f9e3abcd.1482203355.git.geliangtang@gmail.com>
References: <ddabc96c798df194791134d8e070d728e2a7b59f.1482203698.git.geliangtang@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <ddabc96c798df194791134d8e070d728e2a7b59f.1482203698.git.geliangtang@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>
Cc: Geliang Tang <geliangtang@gmail.com>, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

To make the code clearer, use rb_entry() instead of container_of() to
deal with rbtree.

Signed-off-by: Geliang Tang <geliangtang@gmail.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/dma/base.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/dma/base.c b/drivers/gpu/drm/nouveau/nvkm/engine/dma/base.c
index f11ebdd..4655d17 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/dma/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/dma/base.c
@@ -34,7 +34,7 @@ nvkm_dma_search(struct nvkm_dma *dma, struct nvkm_client *client, u64 object)
 	struct rb_node *node = client->dmaroot.rb_node;
 	while (node) {
 		struct nvkm_dmaobj *dmaobj =
-			container_of(node, typeof(*dmaobj), rb);
+			rb_entry(node, typeof(*dmaobj), rb);
 		if (object < dmaobj->handle)
 			node = node->rb_left;
 		else
@@ -67,7 +67,7 @@ nvkm_dma_oclass_new(struct nvkm_device *device,
 	dmaobj->handle = oclass->object;
 
 	while (*ptr) {
-		struct nvkm_dmaobj *obj = container_of(*ptr, typeof(*obj), rb);
+		struct nvkm_dmaobj *obj = rb_entry(*ptr, typeof(*obj), rb);
 		parent = *ptr;
 		if (dmaobj->handle < obj->handle)
 			ptr = &parent->rb_left;
-- 
2.9.3

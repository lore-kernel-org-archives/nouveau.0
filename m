From: Maarten Lankhorst <maarten.lankhorst@canonical.com>
Subject: [PATCH] drm/nv50-: make dma-objects read-only where appropriate
Date: Mon,  2 Sep 2013 16:31:23 +0200
Message-ID: <1378132283-19536-1-git-send-email-maarten.lankhorst@canonical.com>
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

I don't see why the display engine would need write access to the entirety of
vram, when read-only access is enough.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@canonical.com>
---
 drivers/gpu/drm/nouveau/nv50_display.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nv50_display.c b/drivers/gpu/drm/nouveau/nv50_display.c
index aab72f5..eac6b2a 100644
--- a/drivers/gpu/drm/nouveau/nv50_display.c
+++ b/drivers/gpu/drm/nouveau/nv50_display.c
@@ -159,7 +159,7 @@ nv50_dmac_create_fbdma(struct nouveau_object *core, u32 parent)
 				     NV_DMA_IN_MEMORY_CLASS,
 				     &(struct nv_dma_class) {
 					.flags = NV_DMA_TARGET_VRAM |
-						 NV_DMA_ACCESS_RDWR,
+						 NV_DMA_ACCESS_RD,
 					.start = 0,
 					.limit = pfb->ram->size - 1,
 					.conf0 = NV50_DMA_CONF0_ENABLE |
@@ -172,7 +172,7 @@ nv50_dmac_create_fbdma(struct nouveau_object *core, u32 parent)
 				 NV_DMA_IN_MEMORY_CLASS,
 				 &(struct nv_dma_class) {
 					.flags = NV_DMA_TARGET_VRAM |
-						 NV_DMA_ACCESS_RDWR,
+						 NV_DMA_ACCESS_RD,
 					.start = 0,
 					.limit = pfb->ram->size - 1,
 					.conf0 = NV50_DMA_CONF0_ENABLE | 0x70 |
@@ -185,7 +185,7 @@ nv50_dmac_create_fbdma(struct nouveau_object *core, u32 parent)
 				 NV_DMA_IN_MEMORY_CLASS,
 				 &(struct nv_dma_class) {
 					.flags = NV_DMA_TARGET_VRAM |
-						 NV_DMA_ACCESS_RDWR,
+						 NV_DMA_ACCESS_RD,
 					.start = 0,
 					.limit = pfb->ram->size - 1,
 					.conf0 = NV50_DMA_CONF0_ENABLE | 0x7a |
@@ -204,7 +204,7 @@ nvc0_dmac_create_fbdma(struct nouveau_object *core, u32 parent)
 				     NV_DMA_IN_MEMORY_CLASS,
 				     &(struct nv_dma_class) {
 					.flags = NV_DMA_TARGET_VRAM |
-						 NV_DMA_ACCESS_RDWR,
+						 NV_DMA_ACCESS_RD,
 					.start = 0,
 					.limit = pfb->ram->size - 1,
 					.conf0 = NVC0_DMA_CONF0_ENABLE,
@@ -216,7 +216,7 @@ nvc0_dmac_create_fbdma(struct nouveau_object *core, u32 parent)
 				 NV_DMA_IN_MEMORY_CLASS,
 				 &(struct nv_dma_class) {
 					.flags = NV_DMA_TARGET_VRAM |
-						 NV_DMA_ACCESS_RDWR,
+						 NV_DMA_ACCESS_RD,
 					.start = 0,
 					.limit = pfb->ram->size - 1,
 					.conf0 = NVC0_DMA_CONF0_ENABLE | 0xfe,
@@ -228,7 +228,7 @@ nvc0_dmac_create_fbdma(struct nouveau_object *core, u32 parent)
 				 NV_DMA_IN_MEMORY_CLASS,
 				 &(struct nv_dma_class) {
 					.flags = NV_DMA_TARGET_VRAM |
-						 NV_DMA_ACCESS_RDWR,
+						 NV_DMA_ACCESS_RD,
 					.start = 0,
 					.limit = pfb->ram->size - 1,
 					.conf0 = NVC0_DMA_CONF0_ENABLE | 0xfe,
@@ -246,7 +246,7 @@ nvd0_dmac_create_fbdma(struct nouveau_object *core, u32 parent)
 				     NV_DMA_IN_MEMORY_CLASS,
 				     &(struct nv_dma_class) {
 					.flags = NV_DMA_TARGET_VRAM |
-						 NV_DMA_ACCESS_RDWR,
+						 NV_DMA_ACCESS_RD,
 					.start = 0,
 					.limit = pfb->ram->size - 1,
 					.conf0 = NVD0_DMA_CONF0_ENABLE |
@@ -259,7 +259,7 @@ nvd0_dmac_create_fbdma(struct nouveau_object *core, u32 parent)
 				 NV_DMA_IN_MEMORY_CLASS,
 				 &(struct nv_dma_class) {
 					.flags = NV_DMA_TARGET_VRAM |
-						 NV_DMA_ACCESS_RDWR,
+						 NV_DMA_ACCESS_RD,
 					.start = 0,
 					.limit = pfb->ram->size - 1,
 					.conf0 = NVD0_DMA_CONF0_ENABLE | 0xfe |
@@ -316,7 +316,7 @@ nv50_dmac_create(struct nouveau_object *core, u32 bclass, u8 head,
 				 NV_DMA_IN_MEMORY_CLASS,
 				 &(struct nv_dma_class) {
 					.flags = NV_DMA_TARGET_VRAM |
-						 NV_DMA_ACCESS_RDWR,
+						 NV_DMA_ACCESS_RD,
 					.start = 0,
 					.limit = pfb->ram->size - 1,
 				 }, sizeof(struct nv_dma_class), &object);
-- 
1.8.3.4

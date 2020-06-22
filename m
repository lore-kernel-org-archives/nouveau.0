From: Lyude Paul <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [RFC v5 09/10] drm/nouveau/kms/nv50-: Move hard-coded
 object handles into header
Date: Mon, 22 Jun 2020 16:07:29 -0400
Message-ID: <20200622200730.120716-10-lyude@redhat.com>
References: <20200622200730.120716-1-lyude@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20200622200730.120716-1-lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Pankaj Bharadiya <pankaj.laxminarayan.bharadiya-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Takashi Iwai <tiwai-l3A5Bk7waGM@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>, Sean Paul <sean-p7yTbzM4H96eqtR555YLDQ@public.gmane.org>, =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>
List-Id: nouveau.vger.kernel.org

While most of the functionality on Nvidia GPUs doesn't require using an
explicit handle instead of the main VRAM handle + offset, there are a
couple of places that do require explicit handles, such as CRC
functionality. Since this means we're about to add another
nouveau-chosen handle, let's just go ahead and move any hard-coded
handles into a single header. This is just to keep things slightly
organized, and to make it a little bit easier if we need to add more
handles in the future.

This patch should contain no functional changes.

Changes since v3:
* Correct SPDX license identifier (checkpatch)

Signed-off-by: Lyude Paul <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c    |  7 +++++--
 drivers/gpu/drm/nouveau/dispnv50/handles.h | 15 +++++++++++++++
 drivers/gpu/drm/nouveau/dispnv50/wndw.c    |  3 ++-
 3 files changed, 22 insertions(+), 3 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/dispnv50/handles.h

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 090882794f7d6..bf7ba1e1c0f74 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -26,6 +26,7 @@
 #include "core.h"
 #include "head.h"
 #include "wndw.h"
+#include "handles.h"
 
 #include <linux/dma-mapping.h>
 #include <linux/hdmi.h>
@@ -154,7 +155,8 @@ nv50_dmac_create(struct nvif_device *device, struct nvif_object *disp,
 	if (!syncbuf)
 		return 0;
 
-	ret = nvif_object_init(&dmac->base.user, 0xf0000000, NV_DMA_IN_MEMORY,
+	ret = nvif_object_init(&dmac->base.user, NV50_DISP_HANDLE_SYNCBUF,
+			       NV_DMA_IN_MEMORY,
 			       &(struct nv_dma_v0) {
 					.target = NV_DMA_V0_TARGET_VRAM,
 					.access = NV_DMA_V0_ACCESS_RDWR,
@@ -165,7 +167,8 @@ nv50_dmac_create(struct nvif_device *device, struct nvif_object *disp,
 	if (ret)
 		return ret;
 
-	ret = nvif_object_init(&dmac->base.user, 0xf0000001, NV_DMA_IN_MEMORY,
+	ret = nvif_object_init(&dmac->base.user, NV50_DISP_HANDLE_VRAM,
+			       NV_DMA_IN_MEMORY,
 			       &(struct nv_dma_v0) {
 					.target = NV_DMA_V0_TARGET_VRAM,
 					.access = NV_DMA_V0_ACCESS_RDWR,
diff --git a/drivers/gpu/drm/nouveau/dispnv50/handles.h b/drivers/gpu/drm/nouveau/dispnv50/handles.h
new file mode 100644
index 0000000000000..d1beeb9a444db
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/dispnv50/handles.h
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: MIT
+#ifndef __NV50_KMS_HANDLES_H__
+#define __NV50_KMS_HANDLES_H__
+
+/*
+ * Various hard-coded object handles that nouveau uses. These are made-up by
+ * nouveau developers, not Nvidia. The only significance of the handles chosen
+ * is that they must all be unique.
+ */
+#define NV50_DISP_HANDLE_SYNCBUF                                        0xf0000000
+#define NV50_DISP_HANDLE_VRAM                                           0xf0000001
+
+#define NV50_DISP_HANDLE_WNDW_CTX(kind)                        (0xfb000000 | kind)
+
+#endif /* !__NV50_KMS_HANDLES_H__ */
diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.c b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
index cfee61f14aa49..9d963ecdd34e8 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
@@ -21,6 +21,7 @@
  */
 #include "wndw.h"
 #include "wimm.h"
+#include "handles.h"
 
 #include <nvif/class.h>
 #include <nvif/cl0002.h>
@@ -59,7 +60,7 @@ nv50_wndw_ctxdma_new(struct nv50_wndw *wndw, struct drm_framebuffer *fb)
 	int ret;
 
 	nouveau_framebuffer_get_layout(fb, &unused, &kind);
-	handle = 0xfb000000 | kind;
+	handle = NV50_DISP_HANDLE_WNDW_CTX(kind);
 
 	list_for_each_entry(ctxdma, &wndw->ctxdma.list, head) {
 		if (ctxdma->object.handle == handle)
-- 
2.26.2

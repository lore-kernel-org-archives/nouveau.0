From: Lyude Paul <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 3/3] drm/nouveau/kms/nve4-nv138: Fix > 64x64
 cursors
Date: Mon, 18 Jan 2021 20:54:14 -0500
Message-ID: <20210119015415.2511028-3-lyude@redhat.com>
References: <20210119015415.2511028-1-lyude@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20210119015415.2511028-1-lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Simon Ser <contact-sV0wSBM+kKVWj0EZb7rXcA@public.gmane.org>, "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
List-Id: nouveau.vger.kernel.org

While we do handle the additional cursor sizes introduced in NVE4, it looks
like we accidentally broke this when converting over to use Nvidia's
display headers. Since we now use NVVAL in dispnv50/head907d.c in order to
format the value for the cursor layout and NVD9 only had one byte reserved
vs. the 2 bytes reserved in later generations, we end up accidentally
stripping the second bit in the cursor layout format parameter - causing us
to set the wrong cursor size.

This fixes that by adding our own curs_set hook for 917d which uses the
NV917D headers.

Cc: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
Cc: Jeremy Cline <jcline-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Simon Ser <contact-sV0wSBM+kKVWj0EZb7rXcA@public.gmane.org>
Cc: <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org> # v5.9+
Signed-off-by: Lyude Paul <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Fixes: ed0b86a90bf9 ("drm/nouveau/kms/nv50-: use NVIDIA's headers for core head_curs_set()")
---
 drivers/gpu/drm/nouveau/dispnv50/head917d.c   | 28 ++++++++++++++++++-
 .../drm/nouveau/include/nvhw/class/cl917d.h   |  4 +++
 2 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/head917d.c b/drivers/gpu/drm/nouveau/dispnv50/head917d.c
index a5d827403660..ea9f8667305e 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/head917d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/head917d.c
@@ -22,6 +22,7 @@
 #include "head.h"
 #include "core.h"
 
+#include "nvif/push.h"
 #include <nvif/push507c.h>
 
 #include <nvhw/class/cl917d.h>
@@ -73,6 +74,31 @@ head917d_base(struct nv50_head *head, struct nv50_head_atom *asyh)
 	return 0;
 }
 
+static int
+head917d_curs_set(struct nv50_head *head, struct nv50_head_atom *asyh)
+{
+	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	const int i = head->base.index;
+	int ret;
+
+	ret = PUSH_WAIT(push, 5);
+	if (ret)
+		return ret;
+
+	PUSH_MTHD(push, NV917D, HEAD_SET_CONTROL_CURSOR(i),
+		  NVDEF(NV917D, HEAD_SET_CONTROL_CURSOR, ENABLE, ENABLE) |
+		  NVVAL(NV917D, HEAD_SET_CONTROL_CURSOR, FORMAT, asyh->curs.format) |
+		  NVVAL(NV917D, HEAD_SET_CONTROL_CURSOR, SIZE, asyh->curs.layout) |
+		  NVVAL(NV917D, HEAD_SET_CONTROL_CURSOR, HOT_SPOT_X, 0) |
+		  NVVAL(NV917D, HEAD_SET_CONTROL_CURSOR, HOT_SPOT_Y, 0) |
+		  NVDEF(NV917D, HEAD_SET_CONTROL_CURSOR, COMPOSITION, ALPHA_BLEND),
+
+				HEAD_SET_OFFSET_CURSOR(i), asyh->curs.offset >> 8);
+
+	PUSH_MTHD(push, NV917D, HEAD_SET_CONTEXT_DMA_CURSOR(i), asyh->curs.handle);
+	return 0;
+}
+
 int
 head917d_curs_layout(struct nv50_head *head, struct nv50_wndw_atom *asyw,
 		     struct nv50_head_atom *asyh)
@@ -101,7 +127,7 @@ head917d = {
 	.core_clr = head907d_core_clr,
 	.curs_layout = head917d_curs_layout,
 	.curs_format = head507d_curs_format,
-	.curs_set = head907d_curs_set,
+	.curs_set = head917d_curs_set,
 	.curs_clr = head907d_curs_clr,
 	.base = head917d_base,
 	.ovly = head907d_ovly,
diff --git a/drivers/gpu/drm/nouveau/include/nvhw/class/cl917d.h b/drivers/gpu/drm/nouveau/include/nvhw/class/cl917d.h
index 2a2612d6e1e0..fb223723a38a 100644
--- a/drivers/gpu/drm/nouveau/include/nvhw/class/cl917d.h
+++ b/drivers/gpu/drm/nouveau/include/nvhw/class/cl917d.h
@@ -66,6 +66,10 @@
 #define NV917D_HEAD_SET_CONTROL_CURSOR_COMPOSITION_ALPHA_BLEND                  (0x00000000)
 #define NV917D_HEAD_SET_CONTROL_CURSOR_COMPOSITION_PREMULT_ALPHA_BLEND          (0x00000001)
 #define NV917D_HEAD_SET_CONTROL_CURSOR_COMPOSITION_XOR                          (0x00000002)
+#define NV917D_HEAD_SET_OFFSET_CURSOR(a)                                        (0x00000484 + (a)*0x00000300)
+#define NV917D_HEAD_SET_OFFSET_CURSOR_ORIGIN                                    31:0
+#define NV917D_HEAD_SET_CONTEXT_DMA_CURSOR(a)                                   (0x0000048C + (a)*0x00000300)
+#define NV917D_HEAD_SET_CONTEXT_DMA_CURSOR_HANDLE                               31:0
 #define NV917D_HEAD_SET_DITHER_CONTROL(a)                                       (0x000004A0 + (a)*0x00000300)
 #define NV917D_HEAD_SET_DITHER_CONTROL_ENABLE                                   0:0
 #define NV917D_HEAD_SET_DITHER_CONTROL_ENABLE_DISABLE                           (0x00000000)
-- 
2.29.2

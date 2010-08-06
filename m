From: Jimmy Rentz <jb17bsome-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/4] drm: nv vpe
Date: Thu, 5 Aug 2010 22:40:52 -0400
Message-ID: <20100805224052.7923cf7f@amd64linuxmsi.rentzhouse.lan>
References: <20100805223618.1cdcbb08@amd64linuxmsi.rentzhouse.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20100805223618.1cdcbb08-bEIzoA7YQWm4miubQJdzGGS2/mPcPMSI/gJWpUujD0o@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Jimmy Rentz <jb17bsome-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

This patch includes all the relevant nv vpe drm support.
This patch applies against the latest drm.

The drm portion has a couple of classes that interface with the kernel
vpe layer:
* nouveau_vpe_channel class - Manages the drm vpe channel.
This includes open the vpe channel in the kernel, setting up the
pushbuf and each output surface. Right now I force the pushbuffer to be
allocated/managed from user-mode. This is performance reaons.  However,
the kernel can always decline this.
* nouveau_vpe_pushbuf class - Manages the pushbuf.
This includes starting/ending cmd sequences, writing the cmds to the
pushbuf and firing.

Signed-off-by: Jimmy Rentz <jb17bsome-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>


diff --git a/include/drm/nouveau_drm.h b/include/drm/nouveau_drm.h
index a6a9f4a..c597c0a 100644
--- a/include/drm/nouveau_drm.h
+++ b/include/drm/nouveau_drm.h
@@ -79,6 +79,7 @@ struct drm_nouveau_gpuobj_free {
 #define NOUVEAU_GETPARAM_CHIPSET_ID      11
 #define NOUVEAU_GETPARAM_VM_VRAM_BASE    12
 #define NOUVEAU_GETPARAM_GRAPH_UNITS     13
+#define NOUVEAU_GETPARAM_PTIMER_TIME     14
 struct drm_nouveau_getparam {
 	uint64_t param;
 	uint64_t value;
@@ -183,6 +184,52 @@ enum nouveau_bus_type {
 struct drm_nouveau_sarea {
 };
 
+/* VPE Supports mpeg2 only.*/
+struct drm_nouveau_vd_vpe_channel_alloc {
+	uint32_t width;
+	uint32_t height;
+	/* Used for user pushbuf access.
+	 * mmio access is not allowed so you still need to fire as normal.*/
+	uint32_t pushbuf_handle;
+};
+
+struct drm_nouveau_vd_vpe_channel_free {
+};
+
+#define NOUVEAU_VD_VPE_PUSHBUF_FIRE_FLAG_END_SEQUENCE   0x00000001
+#define NOUVEAU_VD_VPE_PUSHBUF_FIRE_FLAG_UPDATE_DMA_POS 0x00000002
+/* structure for surface.*/
+struct drm_nouveau_vd_vpe_surface {
+	uint32_t luma_handle;
+	uint32_t chroma_handle;
+	uint32_t surface_index;
+};
+
+/* This flag lets you turn off firing for a specific batch.
+ * This is needed in some cases to avoid locking up the decoder.*/
+#define NOUVEAU_VD_VPE_PUSHBUF_FIRE_BATCH_DO_NOT_FIRE  0x10000000
+struct drm_nouveau_vd_vpe_pushbuf_fire {
+	/* [in] */
+	uint32_t nr_dwords;
+	uint64_t dwords;
+	uint32_t nr_batches;
+	uint64_t batches;
+	/* Surface[0] is always the target.*/
+	uint32_t nr_surfaces;
+	uint64_t surfaces;
+	uint32_t flags;
+	/* Needed when writing to the hw pushbuf from user space.
+	 * This also will perform a fire.*/
+	uint32_t dma_cur;
+	/* [out] */
+	uint32_t dma_free;
+};
+
+struct drm_nouveau_vd_vpe_surface_query {
+	uint32_t surface_index;
+	uint32_t is_busy;
+};
+
 #define DRM_NOUVEAU_GETPARAM           0x00
 #define DRM_NOUVEAU_SETPARAM           0x01
 #define DRM_NOUVEAU_CHANNEL_ALLOC      0x02
@@ -195,5 +242,9 @@ struct drm_nouveau_sarea {
 #define DRM_NOUVEAU_GEM_CPU_PREP       0x42
 #define DRM_NOUVEAU_GEM_CPU_FINI       0x43
 #define DRM_NOUVEAU_GEM_INFO           0x44
+#define DRM_NOUVEAU_VD_VPE_CHANNEL_ALLOC  0x49
+#define DRM_NOUVEAU_VD_VPE_CHANNEL_FREE   0x50
+#define DRM_NOUVEAU_VD_VPE_PUSHBUF_FIRE   0x51
+#define DRM_NOUVEAU_VD_VPE_SURFACE_QUERY  0x52
 
 #endif /* __NOUVEAU_DRM_H__ */
diff --git a/nouveau/Makefile.am b/nouveau/Makefile.am
index de3f4df..5c148f1 100644
--- a/nouveau/Makefile.am
+++ b/nouveau/Makefile.am
@@ -19,7 +19,9 @@ libdrm_nouveau_la_SOURCES = \
 			    nouveau_bo.c \
 			    nouveau_resource.c \
 			    nouveau_private.h \
-			    nouveau_reloc.c
+			    nouveau_reloc.c \
+			    nouveau_vpe_channel.c \
+			    nouveau_vpe_pushbuf.c
 
 libdrm_nouveaucommonincludedir = ${includedir}/nouveau
 libdrm_nouveaucommoninclude_HEADERS = \
@@ -30,7 +32,10 @@ libdrm_nouveaucommoninclude_HEADERS = \
 				nouveau_pushbuf.h \
 				nouveau_bo.h \
 				nouveau_resource.h \
-				nouveau_reloc.h
+				nouveau_reloc.h \
+				nouveau_vpe_channel.h \
+				nouveau_vpe_pushbuf.h \
+				nouveau_vpe_hw.h
 
 
 libdrm_nouveauincludedir = ${includedir}/libdrm
diff --git a/nouveau/nouveau_vpe_channel.c b/nouveau/nouveau_vpe_channel.c
new file mode 100644
index 0000000..22092ae
--- /dev/null
+++ b/nouveau/nouveau_vpe_channel.c
@@ -0,0 +1,301 @@
+/*
+ * Copyright (C) 2010 Jimmy Rentz
+ * All Rights Reserved.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining
+ * a copy of this software and associated documentation files (the
+ * "Software"), to deal in the Software without restriction, including
+ * without limitation the rights to use, copy, modify, merge, publish,
+ * distribute, sublicense, and/or sell copies of the Software, and to
+ * permit persons to whom the Software is furnished to do so, subject to
+ * the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the
+ * next paragraph) shall be included in all copies or substantial
+ * portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
+ * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
+ * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
+ * IN NO EVENT SHALL THE COPYRIGHT OWNER(S) AND/OR ITS SUPPLIERS BE
+ * LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
+ * OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
+ * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
+ *
+ */
+
+#include <stdint.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <errno.h>
+
+#include "nouveau_drmif.h"
+#include <nouveau_drm.h>
+#include "nouveau_bo.h"
+#include "nouveau_vpe_hw.h"
+#include "nouveau_vpe_channel.h"
+#include "nouveau_vpe_pushbuf.h"
+
+static int
+nouveau_vpe_channel_hw_alloc(struct nouveau_device *dev,
+					uint32_t *width, uint32_t *height,
+					uint32_t *hw_pushbuf_handle)
+{
+	struct drm_nouveau_vd_vpe_channel_alloc vpe_channel_alloc;
+	struct nouveau_device_priv *nvdev = nouveau_device(dev);
+	int ret;
+
+	vpe_channel_alloc.width = *width;
+	vpe_channel_alloc.height = *height;
+
+	ret = drmCommandWriteRead(nvdev->fd, DRM_NOUVEAU_VD_VPE_CHANNEL_ALLOC,
+					&vpe_channel_alloc, sizeof(vpe_channel_alloc));
+	if (ret) {
+		fprintf(stderr, "vpe - could not initialize channel. error %d.\n", ret);
+		return ret;
+	}
+
+	*width = vpe_channel_alloc.width;
+	*height = vpe_channel_alloc.height;
+	*hw_pushbuf_handle = vpe_channel_alloc.pushbuf_handle;
+
+	return 0;
+}
+
+static void
+nouveau_vpe_channel_hw_free(struct nouveau_device *dev)
+{
+	struct drm_nouveau_vd_vpe_channel_free vpe_channel_free;
+	struct nouveau_device_priv *nvdev = nouveau_device(dev);
+
+	drmCommandWriteRead(nvdev->fd, DRM_NOUVEAU_VD_VPE_CHANNEL_FREE,
+						&vpe_channel_free, sizeof(vpe_channel_free));
+}
+
+int
+nouveau_vpe_channel_alloc(struct nouveau_device *dev, uint32_t width,
+					uint32_t height, struct nouveau_vpe_channel **vpe_channel)
+{
+	int ret;
+	struct nouveau_vpe_channel *chan = NULL;
+	struct nouveau_vpe_pushbuf *pushbuf = NULL;
+	struct nouveau_vpe_surface *surfaces = NULL;
+
+	if (!dev)
+		return -EINVAL;
+
+	chan = calloc(1, sizeof(*chan));
+
+	if (!chan) {
+		ret = -ENOMEM;
+		goto out_err;
+	}
+
+	pushbuf = calloc(1, sizeof(*pushbuf));
+
+	if (!pushbuf) {
+		ret = -ENOMEM;
+		goto out_err;
+	}
+
+	/* For Past, Target, Future.*/
+	pushbuf->nr_surfaces = 3;
+	pushbuf->surfaces = calloc(pushbuf->nr_surfaces, sizeof(*surfaces));
+
+	if (!pushbuf->surfaces) {
+		ret = -ENOMEM;
+		goto out_err;
+	}
+
+	pushbuf->mb_buffer = calloc(NV_VPE_MAX_MB, sizeof(uint32_t));
+	if (!pushbuf->mb_buffer) {
+		ret = -ENOMEM;
+		goto out_err;
+	}
+
+	chan->nr_surfaces = NV_VPE_MAX_SURFACES;
+	surfaces = calloc(chan->nr_surfaces, sizeof(*surfaces));
+
+	if (!surfaces) {
+		ret = -ENOMEM;
+		goto out_err;
+	}
+
+	chan->width = width;
+	chan->height = height;
+
+	ret = nouveau_vpe_channel_hw_alloc(dev, &chan->width, &chan->height,
+							&pushbuf->hw_handle);
+	if (ret)
+		goto out_err;
+
+	pushbuf->use_hw_pushbuf = 1;
+
+	if (pushbuf->use_hw_pushbuf && pushbuf->hw_handle) {
+		ret = nouveau_bo_wrap(dev, pushbuf->hw_handle, &pushbuf->hw_bo);
+		if (ret)
+			goto out_err;
+
+		ret = nouveau_bo_map(pushbuf->hw_bo, NOUVEAU_BO_RDWR);
+		if (ret)
+			goto out_err;
+
+		pushbuf->buf = (uint32_t*)pushbuf->hw_bo->map;
+		pushbuf->buf_max = pushbuf->hw_bo->size >> 2;
+		pushbuf->max = pushbuf->buf_max;
+	}
+	else {
+		pushbuf->use_hw_pushbuf = 0;
+		pushbuf->buf_max = NV_VPE_USER_PUSHBUFFER_SIZE >> 2;
+
+		pushbuf->buf = calloc(pushbuf->buf_max, sizeof(*pushbuf->buf));
+
+		if (!pushbuf->buf) {
+			ret = -ENOMEM;
+			goto out_err;
+		}
+	}
+
+	chan->pushbuf = pushbuf;
+	chan->surfaces = surfaces;
+	chan->device = dev;
+
+	*vpe_channel = chan;
+
+out_err:
+	if (ret) {
+		if (surfaces)
+			free(surfaces);
+
+		if (pushbuf) {
+			if (pushbuf->surfaces)
+				free(pushbuf->surfaces);
+			if (pushbuf->use_hw_pushbuf) {
+				if (pushbuf->hw_bo)
+					nouveau_bo_ref(NULL, &pushbuf->hw_bo);
+			}
+			else {
+				if (pushbuf->buf)
+					free(pushbuf->buf);
+			}
+
+			if (pushbuf->mb_buffer)
+				free(pushbuf->mb_buffer);
+
+			free(pushbuf);
+		}
+		if (chan)
+			free(chan);
+	}
+
+	return ret;
+}
+
+void
+nouveau_vpe_channel_free(struct nouveau_vpe_channel **vpe_channel)
+{
+	struct nouveau_vpe_channel *chan;
+
+	if (!vpe_channel || !*vpe_channel)
+		return;
+
+	chan = *vpe_channel;
+
+	nouveau_vpe_channel_hw_free(chan->device);
+
+	if (chan->surfaces)
+		free(chan->surfaces);
+	if (chan->pushbuf) {
+		if (chan->pushbuf->surfaces)
+			free(chan->pushbuf->surfaces);
+		if (chan->pushbuf->use_hw_pushbuf) {
+			if (chan->pushbuf->hw_bo) {
+				nouveau_bo_unmap(chan->pushbuf->hw_bo);
+				nouveau_bo_ref(NULL, &chan->pushbuf->hw_bo);
+			}
+		}
+		else {
+			if (chan->pushbuf->buf)
+				free(chan->pushbuf->buf);
+		}
+		if (chan->pushbuf->mb_buffer)
+			free(chan->pushbuf->mb_buffer);
+		free(chan->pushbuf);
+	}
+
+	free(chan);
+	*vpe_channel = NULL;
+}
+
+static int
+nouveau_vpe_surface_hw_query(struct nouveau_device *dev,
+					uint32_t surface_index, uint32_t *is_busy)
+{
+	struct drm_nouveau_vd_vpe_surface_query query;
+	struct nouveau_device_priv *nvdev = nouveau_device(dev);
+	int ret;
+
+	query.surface_index = surface_index;
+	do {
+		ret = drmCommandWriteRead(nvdev->fd, DRM_NOUVEAU_VD_VPE_SURFACE_QUERY,
+								&query, sizeof(query));
+	} while (ret == -EAGAIN);
+	if (!ret)
+		*is_busy = query.is_busy;
+	else
+		fprintf(stderr, "vpe - could not query status for surface %d. error %d.\n",
+			surface_index, ret);
+
+	return ret;
+}
+
+int
+nouveau_vpe_surface_alloc(struct nouveau_vpe_channel *vpe_channel,
+					uint32_t luma_handle, uint32_t chroma_handle,
+					uint32_t *surface_index)
+{
+	int i;
+
+	if (!vpe_channel || !vpe_channel->surfaces || !luma_handle ||
+		!chroma_handle)
+		return -EINVAL;
+
+	for (i = 0; i < (int)vpe_channel->nr_surfaces; i++) {
+		if (!vpe_channel->surfaces[i].used) {
+			vpe_channel->surfaces[i].luma_handle = luma_handle;
+			vpe_channel->surfaces[i].chroma_handle = chroma_handle;
+			vpe_channel->surfaces[i].used = 1;
+			*surface_index = i;
+			return 0;
+		}
+	}
+
+	fprintf(stderr, "vpe - all %d surfaces are in use.\n", vpe_channel->nr_surfaces);
+
+	return -EINVAL;
+}
+
+void
+nouveau_vpe_surface_free(struct nouveau_vpe_channel *vpe_channel,
+					uint32_t surface_index)
+{
+	if (!vpe_channel)
+		return;
+
+	if (surface_index >= vpe_channel->nr_surfaces)
+		return;
+
+	vpe_channel->surfaces[surface_index].used = 0;
+}
+
+int
+nouveau_vpe_surface_query(struct nouveau_vpe_channel *vpe_channel,
+				uint32_t surface_index, uint32_t *is_busy)
+{
+	if (!vpe_channel || !is_busy)
+		return -EINVAL;
+
+	return nouveau_vpe_surface_hw_query(vpe_channel->device, surface_index,
+								is_busy);
+}
diff --git a/nouveau/nouveau_vpe_channel.h b/nouveau/nouveau_vpe_channel.h
new file mode 100644
index 0000000..a4d4a71
--- /dev/null
+++ b/nouveau/nouveau_vpe_channel.h
@@ -0,0 +1,72 @@
+/*
+ * Copyright (C) 2010 Jimmy Rentz
+ * All Rights Reserved.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining
+ * a copy of this software and associated documentation files (the
+ * "Software"), to deal in the Software without restriction, including
+ * without limitation the rights to use, copy, modify, merge, publish,
+ * distribute, sublicense, and/or sell copies of the Software, and to
+ * permit persons to whom the Software is furnished to do so, subject to
+ * the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the
+ * next paragraph) shall be included in all copies or substantial
+ * portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
+ * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
+ * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
+ * IN NO EVENT SHALL THE COPYRIGHT OWNER(S) AND/OR ITS SUPPLIERS BE
+ * LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
+ * OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
+ * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
+ *
+ */
+
+#ifndef __NOUVEAU_VPE_CHANNEL_H__
+#define __NOUVEAU_VPE_CHANNEL_H__
+
+/*#define NV_VPE_USER_HW_PUSHBUFFER*/
+#define NV_VPE_USER_PUSHBUFFER_SIZE  128 * 1024
+
+struct nouveau_vpe_surface {
+	uint32_t luma_handle;
+	uint32_t chroma_handle;
+	char kernel_referenced;
+	char used;
+};
+
+struct nouveau_vpe_channel {
+	struct nouveau_device *device;
+
+	uint32_t width;
+	uint32_t height;
+
+	struct nouveau_vpe_pushbuf *pushbuf;
+
+	uint32_t nr_surfaces;
+	struct nouveau_vpe_surface *surfaces;
+};
+
+int
+nouveau_vpe_channel_alloc(struct nouveau_device *, uint32_t width,
+					uint32_t height, struct nouveau_vpe_channel **);
+
+void
+nouveau_vpe_channel_free(struct nouveau_vpe_channel **);
+
+int
+nouveau_vpe_surface_alloc(struct nouveau_vpe_channel *,
+					uint32_t luma_handle, uint32_t chroma_handle,
+					uint32_t *surface_index);
+
+void
+nouveau_vpe_surface_free(struct nouveau_vpe_channel *,
+					uint32_t surface_index);
+
+int
+nouveau_vpe_surface_query(struct nouveau_vpe_channel *,
+				uint32_t surface_index, uint32_t *is_busy);
+
+#endif
diff --git a/nouveau/nouveau_vpe_hw.h b/nouveau/nouveau_vpe_hw.h
new file mode 100644
index 0000000..8e3dfb9
--- /dev/null
+++ b/nouveau/nouveau_vpe_hw.h
@@ -0,0 +1,153 @@
+/*
+ * Copyright (C) 2010 Jimmy Rentz
+ * All Rights Reserved.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining
+ * a copy of this software and associated documentation files (the
+ * "Software"), to deal in the Software without restriction, including
+ * without limitation the rights to use, copy, modify, merge, publish,
+ * distribute, sublicense, and/or sell copies of the Software, and to
+ * permit persons to whom the Software is furnished to do so, subject to
+ * the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the
+ * next paragraph) shall be included in all copies or substantial
+ * portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
+ * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
+ * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
+ * IN NO EVENT SHALL THE COPYRIGHT OWNER(S) AND/OR ITS SUPPLIERS BE
+ * LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
+ * OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
+ * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
+ *
+ */
+
+#ifndef __NOUVEAU_VPE_HW_H__
+#define __NOUVEAU_VPE_HW_H__
+
+/* VPE is the video decoder engine that is found in nv30, nv40 and some
+ * older hardware (geforce 4 and higher I believe).
+ * It contains an mpeg2 decoder with the following properties:
+ * (-) Decodes at the idct level.  However, I believe older cards only
+ * support mc level.
+ * (-) 32x64 to 2032x2032 profiles.
+ * (-) 4:2:0 chroma sampling.
+ * (-) Only one set of registers so only one user unless some type of
+ * context/channel switching is added.*/
+
+#define NV_VPE_MAX_CHANNELS		1
+#define NV_VPE_MAX_SURFACES		8
+#define NV_VPE_MIN_WIDTH		32
+#define NV_VPE_MIN_HEIGHT		64
+#define NV_VPE_MAX_WIDTH		2032
+#define NV_VPE_MAX_HEIGHT		2032
+#define NV_VPE_PUSHBUFFER_SIZE		(1 * 1024 * 1024)
+#define NV_VPE_CMD_ALIGNMENT		16
+
+#define NV_VPE_MAX_MB_BATCH		16
+#define NV_VPE_MAX_MB_HEADER		20
+#define NV_VPE_MAX_MB_DCT		(33 * 6)
+#define NV_VPE_MAX_MB		(NV_VPE_MAX_MB_HEADER + NV_VPE_MAX_MB_DCT)
+
+#define NV_VPE_CMD_TYPE_SHIFT	28
+
+/* All cmd info.*/
+#define NV_VPE_CMD_NOP 0x1
+
+#define NV_VPE_CMD_INIT_SURFACE 0x2
+    #define NV_VPE_CMD_INIT_SURFACE_LUMA(index) ((index * 2) << 24)
+    #define NV_VPE_CMD_INIT_SURFACE_CHROMA(index) (((index * 2) + 1) << 24)
+    #define NV_VPE_CMD_INIT_SURFACE_OFFSET_DIV(offset) (offset >> 5)
+
+#define NV_VPE_CMD_INIT_CHANNEL 0x3
+    /* ( (width round to 112) / 32 */
+    #define NV_VPE_CMD_INIT_CHANNEL_SURFACE_GROUP_INFO 0x1
+    #define NV_VPE_CMD_INIT_CHANNEL_ACCEL 0x2
+    /* (0x1 to turn on idct operations). */
+	#define NV_VPE_CMD_INIT_CHANNEL_ACCEL_IDCT 0x1
+
+#define NV_VPE_CMD_DCT_SEPARATOR 0x6
+#define NV_VPE_CMD_END_SEQUENCE 0x7
+    #define NV_VPE_CMD_SEQUENCE 0x1
+
+/* DCT Blocks */
+#define NV_VPE_CMD_DCT_CHROMA_HEADER	0x8
+#define NV_VPE_CMD_DCT_LUMA_HEADER	0x9
+    /* The block pattern is used for chroma and luma blocks */
+    #define NV_VPE_CMD_DCT_BLOCK_PATTERN(p)	((p) << 24)
+    /* Not sure what this is for. This is always set in the dct block header */
+    #define NV_VPE_CMD_DCT_BLOCK_UNKNOWN	0x10000
+    /* Target surface index. Is 0 based. */
+    #define NV_VPE_CMD_DCT_BLOCK_TARGET_SURFACE(s)	(s << 20)
+    /* If picture element is frame */
+    #define NV_VPE_CMD_PICT_FRAME	0x80000
+    /* If field based encoding and a luma block */
+    #define NV_VPE_CMD_PICT_FRAME_FIELD	0x800000
+    /* If picture element or field encoding is bottom field */
+    #define NV_VD_VPE_CMD_BOTTOM_FIELD	0x20000
+    /* If macroblock x coordinate is even */
+    #define NV_VD_VPE_CMD_EVEN_X_COORD	0x8000
+
+/* Used to terminate a set of dct data blocks.*/
+#define NV_VPE_DCT_BLOCK_TERMINATOR	0x1
+
+/* Used to designate dct data blocks that are all zero.*/
+#define NV_VPE_DCT_BLOCK_NULL	(0x80040000 | NV_VPE_DCT_BLOCK_TERMINATOR)
+
+/* Coordinates of dct */
+#define NV_VPE_CMD_DCT_COORDINATE	0xA
+    #define NV_VPE_DCT_POINTS_LUMA(x, y, p) (((y * 16 * p) << 12) | (x * 16))
+    #define NV_VPE_DCT_POINTS_CHROMA(x, y, p) (((y * 8 * p) << 12) | (x * 16))
+
+/* Motion Vectors */
+#define NV_VPE_CMD_LUMA_MOTION_VECTOR_HEADER	0xD
+#define NV_VPE_CMD_CHROMA_MOTION_VECTOR_HEADER	0xC
+#define NV_VPE_CMD_MOTION_VECTOR		0xE
+
+    /* Motion Vector Header */
+
+    /* Set if 2 motion vectors exist for this header.
+     * Otherwise, it is cleared and only 1 exists.*/
+    #define NV_VPE_CMD_MC_MV_COUNT_2	(0x1 << 16)
+
+    /* [Field Picture or Field Motion Only]
+     * motion_vertical_field_select is set here.
+    * This means that the bottom field is selected for the given vertical
+    * vector. However, dual-prime blocks do not follow this rule.
+    * It is treated speciallly for them.*/
+    #define NV_VPE_CMD_BOTTOM_FIELD_VERTICAL_MOTION_SELECT_FIRST (0x1 << 17)
+
+    /* [Frame Picture and Frame Motion Type only] */
+    #define NV_VPE_CMD_FRAME_PICT_FRAME_MOTION (0x1 << 19)
+
+    /* MC prediction surface index. Is 0 based. */
+    #define NV_VPE_CMD_PREDICTION_SURFACE(s) (s << 20)
+
+    /* Set if this is a second motion vector. Otherwise, the first one is
+     * assumed.*/
+    #define NV_VPE_CMD_MOTION_VECTOR_TYPE_SECOND (0x1 << 23)
+
+    /* [Frame Picture and Frame Motion Type OR Field Picture only]*/
+    #define NV_VPE_CMD_FRAME_FRAME_PICT_OR_FIELD (0x1 << 24)
+
+    /* If Vertical Motion Vector is odd then set. This is before any
+     * operations are done. */
+    #define NV_VPE_CMD_ODD_VERTICAL_MOTION_VECTOR (0x1 << 25)
+
+    /* If Horizontal Motion Vector is odd then set. This is before any
+     * operations are done. */
+    #define NV_VPE_CMD_ODD_HORIZONTAL_MOTION_VECTOR (0x1 << 26)
+
+    /* If set then the motion vectors are backward.  Otherwise,
+     * they are forward.*/
+    #define NV_VPE_CMD_MOTION_VECTOR_BACKWARD (0x1 << 27)
+
+    /* Motion Vectors. This is the equation used for each motion vector.
+    * d is only used as a second vector displacement in a couple of cases.
+    */
+    #define NV_VPE_MOTION_VECTOR_VERTICAL(y, c, v, q, d) (((y * c) + (v / q) + d) << 12)
+    #define NV_VPE_MOTION_VECTOR_HORIZONTAL(x, c, v, q, d) ((x * c) + (v / q) + d)
+
+#endif
diff --git a/nouveau/nouveau_vpe_pushbuf.c b/nouveau/nouveau_vpe_pushbuf.c
new file mode 100644
index 0000000..aeba8fb
--- /dev/null
+++ b/nouveau/nouveau_vpe_pushbuf.c
@@ -0,0 +1,429 @@
+/*
+ * Copyright (C) 2010 Jimmy Rentz
+ * All Rights Reserved.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining
+ * a copy of this software and associated documentation files (the
+ * "Software"), to deal in the Software without restriction, including
+ * without limitation the rights to use, copy, modify, merge, publish,
+ * distribute, sublicense, and/or sell copies of the Software, and to
+ * permit persons to whom the Software is furnished to do so, subject to
+ * the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the
+ * next paragraph) shall be included in all copies or substantial
+ * portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
+ * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
+ * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
+ * IN NO EVENT SHALL THE COPYRIGHT OWNER(S) AND/OR ITS SUPPLIERS BE
+ * LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
+ * OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
+ * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
+ *
+ */
+
+#include <stdint.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <errno.h>
+#include <unistd.h>
+
+#include "nouveau_drmif.h"
+#include <nouveau_drm.h>
+#include "nouveau_vpe_hw.h"
+#include "nouveau_vpe_channel.h"
+#include "nouveau_vpe_pushbuf.h"
+
+static char
+nouveau_vpe_pushbuf_reference_surface(struct nouveau_vpe_channel *vpe_channel,
+                            int surface_index)
+{
+	int index = vpe_channel->pushbuf->nr_surfaces++;
+	vpe_channel->pushbuf->surfaces[index].surface_index = surface_index;
+	vpe_channel->pushbuf->surfaces[index].luma_handle =
+				vpe_channel->surfaces[surface_index].luma_handle;
+	vpe_channel->pushbuf->surfaces[index].chroma_handle =
+				vpe_channel->surfaces[surface_index].chroma_handle;
+
+	return !vpe_channel->surfaces[surface_index].kernel_referenced;
+}
+
+static int
+nouveau_vpe_pushbuf_hw_start(struct nouveau_vpe_channel *vpe_channel,
+						int target_surface_index, int past_surface_index,
+						int future_surface_index)
+{
+	struct drm_nouveau_vd_vpe_pushbuf_fire vpe_pushbuf;
+	struct nouveau_device_priv *nvdev = nouveau_device(vpe_channel->device);
+	int ret;
+	char do_kernel_surface_reference;
+	unsigned int i;
+
+	vpe_channel->pushbuf->nr_surfaces = 0;
+
+	do_kernel_surface_reference |= nouveau_vpe_pushbuf_reference_surface(vpe_channel, target_surface_index);
+
+	if (past_surface_index >= 0)
+		do_kernel_surface_reference |= nouveau_vpe_pushbuf_reference_surface(vpe_channel, past_surface_index);
+	if (future_surface_index >= 0)
+		do_kernel_surface_reference |= nouveau_vpe_pushbuf_reference_surface(vpe_channel, future_surface_index);
+
+	if (!do_kernel_surface_reference) {
+		vpe_channel->pushbuf->last_batch_put = 0;
+		vpe_channel->pushbuf->nr_batches = 0;
+		vpe_channel->pushbuf->is_near_end = 0;
+		return 0;
+	}
+
+	memset(&vpe_pushbuf, 0, sizeof(vpe_pushbuf));
+	vpe_pushbuf.nr_surfaces = vpe_channel->pushbuf->nr_surfaces;
+	vpe_pushbuf.surfaces = (uint64_t)vpe_channel->pushbuf->surfaces;
+
+	do {
+		ret = drmCommandWriteRead(nvdev->fd, DRM_NOUVEAU_VD_VPE_PUSHBUF_FIRE,
+								&vpe_pushbuf, sizeof(vpe_pushbuf));
+	} while (ret == -EAGAIN);
+	if (!ret) {
+		if (vpe_channel->pushbuf->use_hw_pushbuf) {
+			vpe_channel->pushbuf->cur = vpe_pushbuf.dma_cur;
+			vpe_channel->pushbuf->free = vpe_pushbuf.dma_free;
+		}
+		else {
+			vpe_channel->pushbuf->cur = 0;
+			if (vpe_pushbuf.dma_free > vpe_channel->pushbuf->buf_max)
+				vpe_channel->pushbuf->max = vpe_channel->pushbuf->buf_max;
+			else
+				/* hw pushbuf is almost empty so only use that much.*/
+				vpe_channel->pushbuf->max = vpe_pushbuf.dma_free;
+			vpe_channel->pushbuf->free = vpe_channel->pushbuf->max;
+		}
+		for (i = 0; i < vpe_channel->pushbuf->nr_surfaces; i++)
+			vpe_channel->surfaces[vpe_channel->pushbuf->surfaces[i].surface_index].kernel_referenced = 1;
+	}
+	else {
+		fprintf(stderr, "vpe - could not start pushbuf sequence. error %d.\n", ret);
+		vpe_channel->pushbuf->max = 0;
+		return ret;
+	}
+
+	vpe_channel->pushbuf->last_batch_put = 0;
+	vpe_channel->pushbuf->nr_batches = 0;
+	vpe_channel->pushbuf->is_near_end = 0;
+
+	return 0;
+}
+
+static int
+nouveau_vpe_pushbuf_hw_fire(struct nouveau_vpe_channel *vpe_channel,
+						char end_sequence)
+{
+	struct drm_nouveau_vd_vpe_pushbuf_fire vpe_pushbuf;
+	struct nouveau_device_priv *nvdev = nouveau_device(vpe_channel->device);
+	int ret;
+
+	if (!vpe_channel->pushbuf->use_hw_pushbuf) {
+		vpe_pushbuf.nr_dwords = vpe_channel->pushbuf->cur;
+		vpe_pushbuf.dwords = (uint64_t)vpe_channel->pushbuf->buf;
+		vpe_pushbuf.nr_batches = vpe_channel->pushbuf->nr_batches;
+		vpe_pushbuf.batches = (uint64_t)vpe_channel->pushbuf->batches;
+	}
+	else {
+		vpe_pushbuf.nr_dwords = 0;
+		vpe_pushbuf.dwords = 0;
+		vpe_pushbuf.nr_batches = 0;
+		vpe_pushbuf.batches = 0;
+	}
+
+	if (!end_sequence) {
+		vpe_pushbuf.nr_surfaces = 0;
+		vpe_pushbuf.flags = 0;
+	}
+	else {
+		vpe_pushbuf.flags = NOUVEAU_VD_VPE_PUSHBUF_FIRE_FLAG_END_SEQUENCE;
+		/* Target surface (0) is the only one that needs to be referenced.
+		 * That surface will get updated with the hw sequence for
+		 * later queries.*/
+		vpe_pushbuf.nr_surfaces = 1;
+		vpe_pushbuf.surfaces = (uint64_t)&vpe_channel->pushbuf->surfaces[0];
+	}
+
+	if (vpe_channel->pushbuf->use_hw_pushbuf) {
+		vpe_pushbuf.dma_free = vpe_channel->pushbuf->free;
+		vpe_pushbuf.dma_cur = vpe_channel->pushbuf->cur;
+		vpe_pushbuf.flags |= NOUVEAU_VD_VPE_PUSHBUF_FIRE_FLAG_UPDATE_DMA_POS;
+	}
+
+	do {
+		ret = drmCommandWriteRead(nvdev->fd, DRM_NOUVEAU_VD_VPE_PUSHBUF_FIRE,
+								&vpe_pushbuf, sizeof(vpe_pushbuf));
+	} while (ret == -EAGAIN);
+	if (!ret) {
+		if (vpe_channel->pushbuf->use_hw_pushbuf) {
+			vpe_channel->pushbuf->cur = vpe_pushbuf.dma_cur;
+			vpe_channel->pushbuf->free = vpe_pushbuf.dma_free;
+		}
+		else {
+			vpe_channel->pushbuf->cur = 0;
+			if (vpe_pushbuf.dma_free > vpe_channel->pushbuf->buf_max)
+				vpe_channel->pushbuf->max = vpe_channel->pushbuf->buf_max;
+			else
+				/* hw pushbuf is almost empty so only use that much.*/
+				vpe_channel->pushbuf->max = vpe_pushbuf.dma_free;
+			vpe_channel->pushbuf->free = vpe_channel->pushbuf->max;
+		}
+	}
+	else {
+		fprintf(stderr, "vpe - could not fire pushbuf (%d). error %d.\n",  end_sequence, ret);
+		vpe_channel->pushbuf->max = 0;
+		return ret;
+	}
+
+	vpe_channel->pushbuf->last_batch_put = 0;
+	vpe_channel->pushbuf->nr_batches = 0;
+	vpe_channel->pushbuf->is_near_end = 0;
+
+	return 0;
+}
+
+static int
+nouveau_vpe_pushbuf_end_batch(struct nouveau_vpe_channel *vpe_channel,
+							char do_flush)
+{
+	uint32_t size;
+
+	if (vpe_channel->pushbuf->use_hw_pushbuf)
+		return nouveau_vpe_pushbuf_hw_fire(vpe_channel, 0);
+
+	size = vpe_channel->pushbuf->cur - vpe_channel->pushbuf->last_batch_put;
+
+	if (!size)
+		return 0;
+
+	vpe_channel->pushbuf->batches = realloc(vpe_channel->pushbuf->batches,
+						(++vpe_channel->pushbuf->nr_batches) << 2);
+	if (!vpe_channel->pushbuf->batches)
+		return -ENOMEM;
+
+	if (!do_flush)
+		size |= NOUVEAU_VD_VPE_PUSHBUF_FIRE_BATCH_DO_NOT_FIRE;
+	vpe_channel->pushbuf->batches[vpe_channel->pushbuf->nr_batches - 1] = size;
+	vpe_channel->pushbuf->last_batch_put = vpe_channel->pushbuf->cur;
+
+	return 0;
+}
+
+static void
+nouveau_vpe_pushbuf_direct_write(struct nouveau_vpe_channel *vpe_channel,
+						uint32_t val)
+{
+	if (vpe_channel->pushbuf->use_hw_pushbuf) {
+		vpe_channel->pushbuf->buf[vpe_channel->pushbuf->cur++] = val;
+		vpe_channel->pushbuf->free--;
+
+		if (vpe_channel->pushbuf->cur == vpe_channel->pushbuf->max) {
+			vpe_channel->pushbuf->cur = 0;
+			vpe_channel->pushbuf->free = vpe_channel->pushbuf->buf_max;
+		}
+	}
+	else {
+		if (vpe_channel->pushbuf->cur < vpe_channel->pushbuf->max) {
+			vpe_channel->pushbuf->buf[vpe_channel->pushbuf->cur++] = val;
+			vpe_channel->pushbuf->free--;
+		}
+	}
+}
+
+static int
+nouveau_vpe_pushbuf_reset_to_start(struct nouveau_vpe_channel *vpe_channel)
+{
+	int nop_count;
+	int i;
+	int ret;
+
+	if (vpe_channel->pushbuf->max <= vpe_channel->pushbuf->buf_max) {
+		/* We are at the end of the hw pushbuf..
+		 * So, write nops and flush to hw.
+		 */
+		nop_count = vpe_channel->pushbuf->max - vpe_channel->pushbuf->cur;
+		for (i = 0; i < nop_count; i++)
+			nouveau_vpe_pushbuf_direct_write(vpe_channel,
+							NV_VPE_CMD_NOP << NV_VPE_CMD_TYPE_SHIFT);
+	}
+
+	ret = nouveau_vpe_pushbuf_end_batch(vpe_channel, 0);
+
+	if (!ret)
+		ret = nouveau_vpe_pushbuf_hw_fire(vpe_channel, 0);
+
+	if (!ret && (vpe_channel->pushbuf->max < NV_VPE_MAX_MB)) {
+		/* No space left after fire so try again.
+		 * This condition should be very rare since the kernel
+		 * will reset automatically.*/
+		ret = nouveau_vpe_pushbuf_reset_to_start(vpe_channel);
+	}
+
+	return ret;
+}
+
+int
+nouveau_vpe_pushbuf_start(struct nouveau_vpe_channel *vpe_channel,
+				unsigned int first_mb, unsigned int end_mb,
+				int target_surface_index, int past_surface_index,
+				int future_surface_index)
+{
+	int ret;
+
+	if (!vpe_channel || !vpe_channel->pushbuf || !vpe_channel->pushbuf->surfaces)
+		return -EINVAL;
+
+	ret = nouveau_vpe_pushbuf_hw_start(vpe_channel, target_surface_index,
+	                               past_surface_index, future_surface_index);
+	if (ret)
+		return ret;
+
+	/* The hardware can decode up to 16 macroblocks at a time.
+	 * So, split up macroblocks into groups of 16...ending on 16 if possible.*/
+	vpe_channel->pushbuf->next_batch_mb = (end_mb - first_mb) % NV_VPE_MAX_MB_BATCH;
+	if (!vpe_channel->pushbuf->next_batch_mb)
+		vpe_channel->pushbuf->next_batch_mb = NV_VPE_MAX_MB_BATCH;
+
+	vpe_channel->pushbuf->cur_mb = 0;
+
+	return ret;
+}
+
+int
+nouveau_vpe_pushbuf_fire(struct nouveau_vpe_channel *vpe_channel,
+					char end_sequence)
+{
+	if (!vpe_channel || !vpe_channel->pushbuf || !vpe_channel->pushbuf->buf
+		|| !vpe_channel->pushbuf->surfaces || (!vpe_channel->pushbuf->use_hw_pushbuf && !vpe_channel->pushbuf->batches))
+		return -EINVAL;
+
+	return nouveau_vpe_pushbuf_hw_fire(vpe_channel, end_sequence);
+}
+
+static void
+nouveau_vpe_pushbuf_write_batch(struct nouveau_vpe_channel *vpe_channel)
+{
+	uint32_t len = vpe_channel->pushbuf->nr_mb_buffer;
+
+	if (vpe_channel->pushbuf->use_hw_pushbuf) {
+		if (len <= vpe_channel->pushbuf->free) {
+			memcpy(&vpe_channel->pushbuf->buf[vpe_channel->pushbuf->cur],
+				vpe_channel->pushbuf->mb_buffer,
+				len * sizeof(uint32_t));
+			vpe_channel->pushbuf->cur += len;
+			vpe_channel->pushbuf->free -= len;
+
+			if (vpe_channel->pushbuf->cur == vpe_channel->pushbuf->max) {
+				vpe_channel->pushbuf->cur = 0;
+				vpe_channel->pushbuf->free = vpe_channel->pushbuf->buf_max;
+			}
+		}
+	}
+	else {
+		if ( (vpe_channel->pushbuf->cur + len) < vpe_channel->pushbuf->max) {
+			memcpy(&vpe_channel->pushbuf->buf[vpe_channel->pushbuf->cur],
+				vpe_channel->pushbuf->mb_buffer,
+				len * sizeof(uint32_t));
+
+			vpe_channel->pushbuf->cur += len;
+			vpe_channel->pushbuf->free -= len;
+		}
+	}
+}
+
+void
+nouveau_vpe_pushbuf_write(struct nouveau_vpe_channel *vpe_channel,
+						uint32_t val)
+{
+	if (!vpe_channel || !vpe_channel->pushbuf || (vpe_channel->pushbuf->nr_mb_buffer >= NV_VPE_MAX_MB) )
+ 		return;
+
+	vpe_channel->pushbuf->mb_buffer[vpe_channel->pushbuf->nr_mb_buffer++] = val;
+}
+
+void
+nouveau_vpe_pushbuf_last_or(struct nouveau_vpe_channel *vpe_channel,
+						uint32_t val)
+{
+	if (!vpe_channel || !vpe_channel->pushbuf || !vpe_channel->pushbuf->nr_mb_buffer)
+		return;
+
+	vpe_channel->pushbuf->mb_buffer[vpe_channel->pushbuf->nr_mb_buffer - 1] |= val;
+}
+
+int
+nouveau_vpe_pushbuf_start_mb(struct nouveau_vpe_channel *vpe_channel)
+{
+	int ret;
+
+	if (!vpe_channel || !vpe_channel->pushbuf)
+		return -EINVAL;
+
+	if (vpe_channel->pushbuf->free > NV_VPE_MAX_MB) {
+		ret = 0;
+	}
+	else {
+		return nouveau_vpe_pushbuf_reset_to_start(vpe_channel);
+		/*
+		 * This causes alignment problems in the kernel and will lockup
+		 * the decoder. The idea here is to put as much of a mb in the
+		 * pushbuffer.  This maximizes the usage of the hw fifo.
+		 * However, this seems to make the vpe decoder get behind more
+		 * often and eventually lockup.  Yes, adding more delays in the
+		 * kernel help but it slows it down too much.
+		 * So, for now disable this.*/
+		/*
+		if (vpe_channel->pushbuf->max == vpe_channel->pushbuf->buf_max)
+			ret = nouveau_vpe_pushbuf_reset_to_start(vpe_channel);
+		else {
+			if (vpe_channel->pushbuf->free >= NV_VPE_MAX_MB_HEADER) {
+				vpe_channel->pushbuf->is_near_end = 1;
+				ret = 0;
+			}
+			else {
+				ret = nouveau_vpe_pushbuf_reset_to_start(vpe_channel);
+			}
+		}
+		**/
+	}
+
+	return ret;
+}
+
+int
+nouveau_vpe_pushbuf_start_mb_db(struct nouveau_vpe_channel *vpe_channel)
+{
+	if (!vpe_channel || !vpe_channel->pushbuf)
+		return -EINVAL;
+
+	if (!vpe_channel->pushbuf->is_near_end)
+		return 0;
+	else
+		return nouveau_vpe_pushbuf_reset_to_start(vpe_channel);
+}
+
+int
+nouveau_vpe_pushbuf_end_mb(struct nouveau_vpe_channel *vpe_channel)
+{
+	if (!vpe_channel || !vpe_channel->pushbuf)
+		return -EINVAL;
+
+	if (vpe_channel->pushbuf->nr_mb_buffer) {
+		nouveau_vpe_pushbuf_write_batch(vpe_channel);
+		vpe_channel->pushbuf->nr_mb_buffer = 0;
+	}
+
+	++vpe_channel->pushbuf->cur_mb;
+	if (vpe_channel->pushbuf->cur_mb == vpe_channel->pushbuf->next_batch_mb) {
+		nouveau_vpe_pushbuf_end_batch(vpe_channel, 1);
+		vpe_channel->pushbuf->next_batch_mb += NV_VPE_MAX_MB_BATCH;
+	}
+
+	return 0;
+}
diff --git a/nouveau/nouveau_vpe_pushbuf.h b/nouveau/nouveau_vpe_pushbuf.h
new file mode 100644
index 0000000..0112952
--- /dev/null
+++ b/nouveau/nouveau_vpe_pushbuf.h
@@ -0,0 +1,89 @@
+/*
+ * Copyright (C) 2010 Jimmy Rentz
+ * All Rights Reserved.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining
+ * a copy of this software and associated documentation files (the
+ * "Software"), to deal in the Software without restriction, including
+ * without limitation the rights to use, copy, modify, merge, publish,
+ * distribute, sublicense, and/or sell copies of the Software, and to
+ * permit persons to whom the Software is furnished to do so, subject to
+ * the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the
+ * next paragraph) shall be included in all copies or substantial
+ * portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
+ * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
+ * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
+ * IN NO EVENT SHALL THE COPYRIGHT OWNER(S) AND/OR ITS SUPPLIERS BE
+ * LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
+ * OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
+ * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
+ *
+ */
+
+#ifndef __NOUVEAU_VPE_PUSHBUF_H__
+#define __NOUVEAU_VPE_PUSHBUF_H__
+
+struct nouveau_vpe_pushbuf {
+	uint32_t *buf;
+	uint32_t buf_max;
+	uint32_t max;
+	uint32_t cur;
+	uint32_t free;
+	char is_near_end;
+
+	char use_hw_pushbuf;
+	uint32_t hw_handle;
+	struct nouveau_bo *hw_bo;
+
+	/* mb cmds are sent in batches.
+	 * This is necessary to avoid hw lockups or corruption.*/
+	uint32_t cur_mb;
+	uint32_t next_batch_mb;
+	uint32_t nr_batches;
+	uint32_t *batches;
+	/* Used only for flushing mb batches.*/
+	uint32_t last_batch_put;
+
+	uint32_t nr_mb_buffer;
+	uint32_t *mb_buffer;
+
+	/* Set prior to rendering.
+	 * It is used so that any surfaces are automatically pinned
+	 * by the hw.*/
+	uint32_t nr_surfaces;
+	struct drm_nouveau_vd_vpe_surface *surfaces;
+};
+
+
+int
+nouveau_vpe_pushbuf_start(struct nouveau_vpe_channel *,
+				unsigned int first_mb, unsigned int end_mb,
+				int target_surface_index, int past_surface_index,
+				int future_surface_index);
+
+int
+nouveau_vpe_pushbuf_fire(struct nouveau_vpe_channel *,
+					char end_sequence);
+
+void
+nouveau_vpe_pushbuf_write(struct nouveau_vpe_channel *,
+						uint32_t val);
+
+void
+nouveau_vpe_pushbuf_last_or(struct nouveau_vpe_channel *,
+						uint32_t val);
+
+int
+nouveau_vpe_pushbuf_start_mb(struct nouveau_vpe_channel *);
+
+int
+nouveau_vpe_pushbuf_start_mb_db(struct nouveau_vpe_channel *);
+
+int
+nouveau_vpe_pushbuf_end_mb(struct nouveau_vpe_channel *);
+
+#endif

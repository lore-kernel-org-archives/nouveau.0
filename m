From: Lyude Paul <lyude@redhat.com>
Subject: [RFC v3 10/11] drm/nouveau/kms/nv50-: Move hard-coded object handles into header
Date: Fri, 17 Apr 2020 15:40:57 -0400
Message-ID: <20200417194145.36350-11-lyude@redhat.com>
References: <20200417194145.36350-1-lyude@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200417194145.36350-1-lyude@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: Daniel Vetter <daniel@ffwll.ch>, Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Sean Paul <seanpaul@chromium.org>, Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>, Alex Deucher <alexander.deucher@amd.com>, Takashi Iwai <tiwai@suse.de>, Ilia Mirkin <imirkin@alum.mit.edu>, =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, Sam Ravnborg <sam@ravnborg.org>, Gerd Hoffmann <kraxel@redhat.com>, linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org
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

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c    |  7 +++++--
 drivers/gpu/drm/nouveau/dispnv50/handles.h | 15 +++++++++++++++
 drivers/gpu/drm/nouveau/dispnv50/wndw.c    |  3 ++-
 3 files changed, 22 insertions(+), 3 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/dispnv50/handles.h

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/no=
uveau/dispnv50/disp.c
index 5d5661967d50..568029825f62 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -26,6 +26,7 @@
 #include "core.h"
 #include "head.h"
 #include "wndw.h"
+#include "handles.h"
=20
 #include <linux/dma-mapping.h>
 #include <linux/hdmi.h>
@@ -154,7 +155,8 @@ nv50_dmac_create(struct nvif_device *device, struct n=
vif_object *disp,
 	if (!syncbuf)
 		return 0;
=20
-	ret =3D nvif_object_init(&dmac->base.user, 0xf0000000, NV_DMA_IN_MEMORY=
,
+	ret =3D nvif_object_init(&dmac->base.user, NV50_DISP_HANDLE_SYNCBUF,
+			       NV_DMA_IN_MEMORY,
 			       &(struct nv_dma_v0) {
 					.target =3D NV_DMA_V0_TARGET_VRAM,
 					.access =3D NV_DMA_V0_ACCESS_RDWR,
@@ -165,7 +167,8 @@ nv50_dmac_create(struct nvif_device *device, struct n=
vif_object *disp,
 	if (ret)
 		return ret;
=20
-	ret =3D nvif_object_init(&dmac->base.user, 0xf0000001, NV_DMA_IN_MEMORY=
,
+	ret =3D nvif_object_init(&dmac->base.user, NV50_DISP_HANDLE_VRAM,
+			       NV_DMA_IN_MEMORY,
 			       &(struct nv_dma_v0) {
 					.target =3D NV_DMA_V0_TARGET_VRAM,
 					.access =3D NV_DMA_V0_ACCESS_RDWR,
diff --git a/drivers/gpu/drm/nouveau/dispnv50/handles.h b/drivers/gpu/drm=
/nouveau/dispnv50/handles.h
new file mode 100644
index 000000000000..e3a62c7a0d08
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/dispnv50/handles.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: MIT */
+#ifndef __NV50_KMS_HANDLES_H__
+#define __NV50_KMS_HANDLES_H__
+
+/*
+ * Various hard-coded object handles that nouveau uses. These are made-u=
p by
+ * nouveau developers, not Nvidia. The only significance of the handles =
chosen
+ * is that they must all be unique.
+ */
+#define NV50_DISP_HANDLE_SYNCBUF                                        =
0xf0000000
+#define NV50_DISP_HANDLE_VRAM                                           =
0xf0000001
+
+#define NV50_DISP_HANDLE_WNDW_CTX(kind)                        (0xfb0000=
00 | kind)
+
+#endif /* !__NV50_KMS_HANDLES_H__ */
diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.c b/drivers/gpu/drm/no=
uveau/dispnv50/wndw.c
index 39cca8eaa066..cb67a715bd69 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
@@ -21,6 +21,7 @@
  */
 #include "wndw.h"
 #include "wimm.h"
+#include "handles.h"
=20
 #include <nvif/class.h>
 #include <nvif/cl0002.h>
@@ -44,7 +45,7 @@ nv50_wndw_ctxdma_new(struct nv50_wndw *wndw, struct nou=
veau_framebuffer *fb)
 	struct nouveau_drm *drm =3D nouveau_drm(fb->base.dev);
 	struct nv50_wndw_ctxdma *ctxdma;
 	const u8    kind =3D fb->nvbo->kind;
-	const u32 handle =3D 0xfb000000 | kind;
+	const u32 handle =3D NV50_DISP_HANDLE_WNDW_CTX(kind);
 	struct {
 		struct nv_dma_v0 base;
 		union {
--=20
2.25.1

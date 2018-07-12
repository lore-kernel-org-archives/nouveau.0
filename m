From: Lyude Paul <lyude@redhat.com>
Subject: [PATCH 1/2] drm/nouveau: Expose nv50 MST structures in disp.h
Date: Thu, 12 Jul 2018 13:10:46 -0400
Message-ID: <20180712171056.26359-2-lyude@redhat.com>
References: <20180712171056.26359-1-lyude@redhat.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180712171056.26359-1-lyude@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: nouveau@lists.freedesktop.org
Cc: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, Archit Taneja <architt@codeaurora.org>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

We're about to need this so that we can hook up dp_mst_info into debugfs
so we can walk the encoder list and find each mst mgr.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c | 34 ------------------------
 drivers/gpu/drm/nouveau/dispnv50/disp.h | 35 +++++++++++++++++++++++++
 2 files changed, 35 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index d9da69c83ae7..f76fe5f260a4 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -568,40 +568,6 @@ nv50_hdmi_enable(struct drm_encoder *encoder, struct drm_display_mode *mode)
 /******************************************************************************
  * MST
  *****************************************************************************/
-#define nv50_mstm(p) container_of((p), struct nv50_mstm, mgr)
-#define nv50_mstc(p) container_of((p), struct nv50_mstc, connector)
-#define nv50_msto(p) container_of((p), struct nv50_msto, encoder)
-
-struct nv50_mstm {
-	struct nouveau_encoder *outp;
-
-	struct drm_dp_mst_topology_mgr mgr;
-	struct nv50_msto *msto[4];
-
-	bool modified;
-	bool disabled;
-	int links;
-};
-
-struct nv50_mstc {
-	struct nv50_mstm *mstm;
-	struct drm_dp_mst_port *port;
-	struct drm_connector connector;
-
-	struct drm_display_mode *native;
-	struct edid *edid;
-
-	int pbn;
-};
-
-struct nv50_msto {
-	struct drm_encoder encoder;
-
-	struct nv50_head *head;
-	struct nv50_mstc *mstc;
-	bool disabled;
-};
-
 static struct drm_dp_payload *
 nv50_msto_payload(struct nv50_msto *msto)
 {
diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.h b/drivers/gpu/drm/nouveau/dispnv50/disp.h
index e48c5eb35b49..5ba7093f3c74 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.h
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.h
@@ -3,6 +3,7 @@
 #include <nvif/mem.h>
 
 #include "nouveau_display.h"
+#include "nouveau_encoder.h"
 
 struct nv50_disp {
 	struct nvif_disp *disp;
@@ -65,6 +66,40 @@ struct nv50_dmac {
 	struct mutex lock;
 };
 
+#define nv50_mstm(p) container_of((p), struct nv50_mstm, mgr)
+#define nv50_mstc(p) container_of((p), struct nv50_mstc, connector)
+#define nv50_msto(p) container_of((p), struct nv50_msto, encoder)
+
+struct nv50_mstm {
+	struct nouveau_encoder *outp;
+
+	struct drm_dp_mst_topology_mgr mgr;
+	struct nv50_msto *msto[4];
+
+	bool modified;
+	bool disabled;
+	int links;
+};
+
+struct nv50_mstc {
+	struct nv50_mstm *mstm;
+	struct drm_dp_mst_port *port;
+	struct drm_connector connector;
+
+	struct drm_display_mode *native;
+	struct edid *edid;
+
+	int pbn;
+};
+
+struct nv50_msto {
+	struct drm_encoder encoder;
+
+	struct nv50_head *head;
+	struct nv50_mstc *mstc;
+	bool disabled;
+};
+
 int nv50_dmac_create(struct nvif_device *device, struct nvif_object *disp,
 		     const s32 *oclass, u8 head, void *data, u32 size,
 		     u64 syncbuf, struct nv50_dmac *dmac);
-- 
2.17.1

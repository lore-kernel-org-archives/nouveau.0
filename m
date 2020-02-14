From: Lyude Paul <lyude@redhat.com>
Subject: [PATCH v2 2/5] drm/nouveau/kms/nv50-: Probe SOR caps for DP interlacing support
Date: Fri, 14 Feb 2020 17:58:53 -0500
Message-ID: <20200214225910.695210-3-lyude@redhat.com>
References: <20200214225910.695210-1-lyude@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200214225910.695210-1-lyude@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: nouveau@lists.freedesktop.org
Cc: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Sean Paul <seanpaul@chromium.org>, Manasi Navare <manasi.d.navare@intel.com>, Alex Deucher <alexander.deucher@amd.com>, Takashi Iwai <tiwai@suse.de>, =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

Right now, we make the mistake of allowing interlacing on all
connectors. Nvidia hardware does not always support interlacing with DP
though, so we need to make sure that we don't allow interlaced modes to
be set in such situations as otherwise we'll end up accidentally hanging
the display HW.

This fixes some hangs with Turing, which would be caused by attempting
to set an interlaced mode on hardware that doesn't support it. This
patch likely fixes other hardware hanging in the same way as well.

Changes since v1:
* Actually probe caps correctly this time, both on EVO and NVDisplay.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv50/core.h     |  3 +++
 drivers/gpu/drm/nouveau/dispnv50/core507d.c | 15 ++++++++++++
 drivers/gpu/drm/nouveau/dispnv50/core827d.c |  1 +
 drivers/gpu/drm/nouveau/dispnv50/core907d.c |  1 +
 drivers/gpu/drm/nouveau/dispnv50/core917d.c |  1 +
 drivers/gpu/drm/nouveau/dispnv50/corec37d.c | 26 +++++++++++++++++++++
 drivers/gpu/drm/nouveau/dispnv50/corec57d.c |  1 +
 drivers/gpu/drm/nouveau/dispnv50/disp.c     | 21 ++++++++++++++++-
 drivers/gpu/drm/nouveau/dispnv50/disp.h     |  1 +
 drivers/gpu/drm/nouveau/nouveau_connector.c | 10 +++++++-
 drivers/gpu/drm/nouveau/nouveau_encoder.h   |  4 ++++
 11 files changed, 82 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/core.h b/drivers/gpu/drm/no=
uveau/dispnv50/core.h
index ff94f3f6f264..9a1f610e4c81 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/core.h
+++ b/drivers/gpu/drm/nouveau/dispnv50/core.h
@@ -15,6 +15,7 @@ void nv50_core_del(struct nv50_core **);
 struct nv50_core_func {
 	void (*init)(struct nv50_core *);
 	void (*ntfy_init)(struct nouveau_bo *, u32 offset);
+	int (*caps_init)(struct nouveau_drm *, struct nv50_disp *);
 	int (*ntfy_wait_done)(struct nouveau_bo *, u32 offset,
 			      struct nvif_device *);
 	void (*update)(struct nv50_core *, u32 *interlock, bool ntfy);
@@ -35,6 +36,7 @@ int core507d_new_(const struct nv50_core_func *, struct=
 nouveau_drm *, s32,
 		  struct nv50_core **);
 void core507d_init(struct nv50_core *);
 void core507d_ntfy_init(struct nouveau_bo *, u32);
+int core507d_caps_init(struct nouveau_drm *, struct nv50_disp *);
 int core507d_ntfy_wait_done(struct nouveau_bo *, u32, struct nvif_device=
 *);
 void core507d_update(struct nv50_core *, u32 *, bool);
=20
@@ -51,6 +53,7 @@ extern const struct nv50_outp_func sor907d;
 int core917d_new(struct nouveau_drm *, s32, struct nv50_core **);
=20
 int corec37d_new(struct nouveau_drm *, s32, struct nv50_core **);
+int corec37d_caps_init(struct nouveau_drm *, struct nv50_disp *);
 int corec37d_ntfy_wait_done(struct nouveau_bo *, u32, struct nvif_device=
 *);
 void corec37d_update(struct nv50_core *, u32 *, bool);
 void corec37d_wndw_owner(struct nv50_core *);
diff --git a/drivers/gpu/drm/nouveau/dispnv50/core507d.c b/drivers/gpu/dr=
m/nouveau/dispnv50/core507d.c
index e7fcfa6e6467..cd45dc09d457 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/core507d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/core507d.c
@@ -61,6 +61,20 @@ core507d_ntfy_init(struct nouveau_bo *bo, u32 offset)
 	nouveau_bo_wr32(bo, offset / 4, 0x00000000);
 }
=20
+int
+core507d_caps_init(struct nouveau_drm *drm, struct nv50_disp *disp)
+{
+	u32 *push =3D evo_wait(&disp->core->chan, 2);
+
+	if (push) {
+		evo_mthd(push, 0x008c, 1);
+		evo_data(push, 0x0);
+		evo_kick(push, &disp->core->chan);
+	}
+
+	return 0;
+}
+
 void
 core507d_init(struct nv50_core *core)
 {
@@ -76,6 +90,7 @@ static const struct nv50_core_func
 core507d =3D {
 	.init =3D core507d_init,
 	.ntfy_init =3D core507d_ntfy_init,
+	.caps_init =3D core507d_caps_init,
 	.ntfy_wait_done =3D core507d_ntfy_wait_done,
 	.update =3D core507d_update,
 	.head =3D &head507d,
diff --git a/drivers/gpu/drm/nouveau/dispnv50/core827d.c b/drivers/gpu/dr=
m/nouveau/dispnv50/core827d.c
index 6123a068f836..2e0c1c536afe 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/core827d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/core827d.c
@@ -26,6 +26,7 @@ static const struct nv50_core_func
 core827d =3D {
 	.init =3D core507d_init,
 	.ntfy_init =3D core507d_ntfy_init,
+	.caps_init =3D core507d_caps_init,
 	.ntfy_wait_done =3D core507d_ntfy_wait_done,
 	.update =3D core507d_update,
 	.head =3D &head827d,
diff --git a/drivers/gpu/drm/nouveau/dispnv50/core907d.c b/drivers/gpu/dr=
m/nouveau/dispnv50/core907d.c
index ef822f813435..271629832629 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/core907d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/core907d.c
@@ -26,6 +26,7 @@ static const struct nv50_core_func
 core907d =3D {
 	.init =3D core507d_init,
 	.ntfy_init =3D core507d_ntfy_init,
+	.caps_init =3D core507d_caps_init,
 	.ntfy_wait_done =3D core507d_ntfy_wait_done,
 	.update =3D core507d_update,
 	.head =3D &head907d,
diff --git a/drivers/gpu/drm/nouveau/dispnv50/core917d.c b/drivers/gpu/dr=
m/nouveau/dispnv50/core917d.c
index 392338df5bfd..5cc072d4c30f 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/core917d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/core917d.c
@@ -26,6 +26,7 @@ static const struct nv50_core_func
 core917d =3D {
 	.init =3D core507d_init,
 	.ntfy_init =3D core507d_ntfy_init,
+	.caps_init =3D core507d_caps_init,
 	.ntfy_wait_done =3D core507d_ntfy_wait_done,
 	.update =3D core507d_update,
 	.head =3D &head917d,
diff --git a/drivers/gpu/drm/nouveau/dispnv50/corec37d.c b/drivers/gpu/dr=
m/nouveau/dispnv50/corec37d.c
index 3b36dc8d36b2..81f96097aff8 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/corec37d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/corec37d.c
@@ -22,6 +22,7 @@
 #include "core.h"
 #include "head.h"
=20
+#include <nvif/class.h>
 #include <nouveau_bo.h>
=20
 void
@@ -85,6 +86,30 @@ corec37d_ntfy_init(struct nouveau_bo *bo, u32 offset)
 	nouveau_bo_wr32(bo, offset / 4 + 3, 0x00000000);
 }
=20
+int corec37d_caps_init(struct nouveau_drm *drm, struct nv50_disp *disp)
+{
+	int ret;
+
+	ret =3D nvif_object_init(&disp->disp->object, 0, GV100_DISP_CAPS,
+			       NULL, 0, &disp->caps);
+	if (ret) {
+		NV_ERROR(drm,
+			 "Failed to init notifier caps region: %d\n",
+			 ret);
+		return ret;
+	}
+
+	ret =3D nvif_object_map(&disp->caps, NULL, 0);
+	if (ret) {
+		NV_ERROR(drm,
+			 "Failed to map notifier caps region: %d\n",
+			 ret);
+		return ret;
+	}
+
+	return 0;
+}
+
 static void
 corec37d_init(struct nv50_core *core)
 {
@@ -109,6 +134,7 @@ static const struct nv50_core_func
 corec37d =3D {
 	.init =3D corec37d_init,
 	.ntfy_init =3D corec37d_ntfy_init,
+	.caps_init =3D corec37d_caps_init,
 	.ntfy_wait_done =3D corec37d_ntfy_wait_done,
 	.update =3D corec37d_update,
 	.wndw.owner =3D corec37d_wndw_owner,
diff --git a/drivers/gpu/drm/nouveau/dispnv50/corec57d.c b/drivers/gpu/dr=
m/nouveau/dispnv50/corec57d.c
index 147adcd60937..10ba9e9e4ae6 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/corec57d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/corec57d.c
@@ -46,6 +46,7 @@ static const struct nv50_core_func
 corec57d =3D {
 	.init =3D corec57d_init,
 	.ntfy_init =3D corec37d_ntfy_init,
+	.caps_init =3D corec37d_caps_init,
 	.ntfy_wait_done =3D corec37d_ntfy_wait_done,
 	.update =3D corec37d_update,
 	.wndw.owner =3D corec37d_wndw_owner,
diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/no=
uveau/dispnv50/disp.c
index ba07b0154d2b..cab92de3da90 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -1684,6 +1684,9 @@ nv50_sor_create(struct drm_connector *connector, st=
ruct dcb_output *dcbe)
 	struct nvkm_i2c *i2c =3D nvxx_i2c(&drm->client.device);
 	struct nouveau_encoder *nv_encoder;
 	struct drm_encoder *encoder;
+	struct nv50_disp *disp =3D nv50_disp(connector->dev);
+	u32 caps =3D 0;
+	const int or =3D ffs(dcbe->or) - 1;
 	int type, ret;
=20
 	switch (dcbe->type) {
@@ -1710,10 +1713,19 @@ nv50_sor_create(struct drm_connector *connector, =
struct dcb_output *dcbe)
=20
 	drm_connector_attach_encoder(connector, encoder);
=20
+	/* Probe SOR caps */
+	if (disp->disp->object.oclass >=3D GV100_DISP)
+		caps =3D nvif_rd32(&disp->caps, 0x000144 + (or * 8));
+	else
+		caps =3D nouveau_bo_rd32(disp->sync, 0x000014 + (or * 2));
+
+	if (caps)
+		nv_encoder->caps.dp_interlace =3D !!(caps & 0x04000000);
+
 	if (dcbe->type =3D=3D DCB_OUTPUT_DP) {
-		struct nv50_disp *disp =3D nv50_disp(encoder->dev);
 		struct nvkm_i2c_aux *aux =3D
 			nvkm_i2c_aux_find(i2c, dcbe->i2c_index);
+
 		if (aux) {
 			if (disp->disp->object.oclass < GF110_DISP) {
 				/* HW has no support for address-only
@@ -2422,6 +2434,8 @@ nv50_display_destroy(struct drm_device *dev)
=20
 	nv50_audio_component_fini(nouveau_drm(dev));
=20
+	nvif_object_unmap(&disp->caps);
+	nvif_object_fini(&disp->caps);
 	nv50_core_del(&disp->core);
=20
 	nouveau_bo_unmap(disp->sync);
@@ -2483,6 +2497,11 @@ nv50_display_create(struct drm_device *dev)
 		goto out;
=20
 	disp->core->func->init(disp->core);
+	if (disp->core->func->caps_init) {
+		ret =3D disp->core->func->caps_init(drm, disp);
+		if (ret)
+			goto out;
+	}
=20
 	/* create crtc objects to represent the hw heads */
 	if (disp->disp->object.oclass >=3D GV100_DISP)
diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.h b/drivers/gpu/drm/no=
uveau/dispnv50/disp.h
index d54fe00ac3a3..89c3b38c32a5 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.h
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.h
@@ -9,6 +9,7 @@ struct nv50_msto;
 struct nv50_disp {
 	struct nvif_disp *disp;
 	struct nv50_core *core;
+	struct nvif_object caps;
=20
 #define NV50_DISP_SYNC(c, o)                                ((c) * 0x040=
 + (o))
 #define NV50_DISP_CORE_NTFY                       NV50_DISP_SYNC(0      =
, 0x00)
diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/dr=
m/nouveau/nouveau_connector.c
index 9a9a7f5003d3..43bcbb6d73c4 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -509,7 +509,11 @@ nouveau_connector_set_encoder(struct drm_connector *=
connector,
 	nv_connector->detected_encoder =3D nv_encoder;
=20
 	if (drm->client.device.info.family >=3D NV_DEVICE_INFO_V0_TESLA) {
-		connector->interlace_allowed =3D true;
+		if (nv_encoder->dcb->type =3D=3D DCB_OUTPUT_DP)
+			connector->interlace_allowed =3D
+				nv_encoder->caps.dp_interlace;
+		else
+			connector->interlace_allowed =3D true;
 		connector->doublescan_allowed =3D true;
 	} else
 	if (nv_encoder->dcb->type =3D=3D DCB_OUTPUT_LVDS ||
@@ -1060,6 +1064,10 @@ nouveau_connector_mode_valid(struct drm_connector =
*connector,
 	case DCB_OUTPUT_TV:
 		return get_slave_funcs(encoder)->mode_valid(encoder, mode);
 	case DCB_OUTPUT_DP:
+		if (mode->flags & DRM_MODE_FLAG_INTERLACE &&
+		    !nv_encoder->dp.caps.interlace)
+			return MODE_NO_INTERLACE;
+
 		max_clock  =3D nv_encoder->dp.link_nr;
 		max_clock *=3D nv_encoder->dp.link_bw;
 		clock =3D clock * (connector->display_info.bpc * 3) / 10;
diff --git a/drivers/gpu/drm/nouveau/nouveau_encoder.h b/drivers/gpu/drm/=
nouveau/nouveau_encoder.h
index 3517f920bf89..3217f587eceb 100644
--- a/drivers/gpu/drm/nouveau/nouveau_encoder.h
+++ b/drivers/gpu/drm/nouveau/nouveau_encoder.h
@@ -66,6 +66,10 @@ struct nouveau_encoder {
 		} dp;
 	};
=20
+	struct {
+		bool dp_interlace : 1;
+	} caps;
+
 	void (*enc_save)(struct drm_encoder *encoder);
 	void (*enc_restore)(struct drm_encoder *encoder);
 	void (*update)(struct nouveau_encoder *, u8 head,
--=20
2.24.1

From: Lyude Paul <lyude@redhat.com>
Subject: [PATCH v2 1/5] drm/nouveau/kms/nv50-: Initialize core channel in nouveau_display_create()
Date: Fri, 14 Feb 2020 17:58:52 -0500
Message-ID: <20200214225910.695210-2-lyude@redhat.com>
References: <20200214225910.695210-1-lyude@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200214225910.695210-1-lyude@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: nouveau@lists.freedesktop.org
Cc: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Sean Paul <seanpaul@chromium.org>, Alex Deucher <alexander.deucher@amd.com>, Mikita Lipski <mikita.lipski@amd.com>, Takashi Iwai <tiwai@suse.de>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

We'll need the core channel initialized and ready by the time that we
start creating modesetting objects, so that we can call the
NV507D_GET_CAPABILITIES method to make the hardware expose it's
modesetting capabilities for later probing.

So, when loading the driver prepare the core channel from within
nouveau_display_create(). Everywhere else, we initialize the core
channel during resume.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/no=
uveau/dispnv50/disp.c
index a3dc2ba19fb2..ba07b0154d2b 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -2394,7 +2394,8 @@ nv50_display_init(struct drm_device *dev, bool resu=
me, bool runtime)
 	struct drm_encoder *encoder;
 	struct drm_plane *plane;
=20
-	core->func->init(core);
+	if (resume || runtime)
+		core->func->init(core);
=20
 	list_for_each_entry(encoder, &dev->mode_config.encoder_list, head) {
 		if (encoder->encoder_type !=3D DRM_MODE_ENCODER_DPMST) {
@@ -2481,6 +2482,8 @@ nv50_display_create(struct drm_device *dev)
 	if (ret)
 		goto out;
=20
+	disp->core->func->init(disp->core);
+
 	/* create crtc objects to represent the hw heads */
 	if (disp->disp->object.oclass >=3D GV100_DISP)
 		crtcs =3D nvif_rd32(&device->object, 0x610060) & 0xff;
--=20
2.24.1

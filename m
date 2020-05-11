From: Lyude Paul <lyude@redhat.com>
Subject: [PATCH v3 1/5] drm/nouveau/kms/nv50-: Initialize core channel in nouveau_display_create()
Date: Mon, 11 May 2020 18:41:23 -0400
Message-ID: <20200511224148.598468-2-lyude@redhat.com>
References: <20200511224148.598468-1-lyude@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200511224148.598468-1-lyude@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: nouveau@lists.freedesktop.org
Cc: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>, Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>, Sean Paul <seanpaul@chromium.org>, Takashi Iwai <tiwai@suse.de>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 6be9df1820c5..05b458b16e3f 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -2369,7 +2369,8 @@ nv50_display_init(struct drm_device *dev, bool resume, bool runtime)
 	struct drm_encoder *encoder;
 	struct drm_plane *plane;
 
-	core->func->init(core);
+	if (resume || runtime)
+		core->func->init(core);
 
 	list_for_each_entry(encoder, &dev->mode_config.encoder_list, head) {
 		if (encoder->encoder_type != DRM_MODE_ENCODER_DPMST) {
@@ -2456,6 +2457,8 @@ nv50_display_create(struct drm_device *dev)
 	if (ret)
 		goto out;
 
+	disp->core->func->init(disp->core);
+
 	/* create crtc objects to represent the hw heads */
 	if (disp->disp->object.oclass >= GV100_DISP)
 		crtcs = nvif_rd32(&device->object, 0x610060) & 0xff;
-- 
2.26.2

From: Lyude Paul <lyude@redhat.com>
Subject: [PATCH] drm/nouveau: Remove nouveau_bios_connector_entry()
Date: Tue, 17 Mar 2020 19:59:45 -0400
Message-ID: <20200317235946.204443-1-lyude@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: nouveau@lists.freedesktop.org
Cc: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

This function doesn't exist

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_bios.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bios.h b/drivers/gpu/drm/nou=
veau/nouveau_bios.h
index 18eb061ccafb..5495f004a297 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bios.h
+++ b/drivers/gpu/drm/nouveau/nouveau_bios.h
@@ -163,8 +163,6 @@ u8 *olddcb_conn(struct drm_device *, u8 idx);
 int nouveau_bios_init(struct drm_device *);
 void nouveau_bios_takedown(struct drm_device *dev);
 int nouveau_run_vbios_init(struct drm_device *);
-struct dcb_connector_table_entry *
-nouveau_bios_connector_entry(struct drm_device *, int index);
 bool nouveau_bios_fp_mode(struct drm_device *, struct drm_display_mode *=
);
 uint8_t *nouveau_bios_embedded_edid(struct drm_device *);
 int nouveau_bios_parse_lvds_table(struct drm_device *, int pxclk,
--=20
2.24.1

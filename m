From: Lyude Paul <lyude@redhat.com>
Subject: [PATCH RESEND v3 4/6] drm/nouveau: s/nouveau_backlight_exit/nouveau_backlight_fini/
Date: Wed, 29 Aug 2018 18:28:30 -0400
Message-ID: <20180829222834.15590-5-lyude@redhat.com>
References: <20180829222834.15590-1-lyude@redhat.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180829222834.15590-1-lyude@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: nouveau@lists.freedesktop.org
Cc: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

More consistent with the rest of the codebase, no functional changes
here.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Karol Herbst <kherbst@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_backlight.c | 2 +-
 drivers/gpu/drm/nouveau/nouveau_connector.c | 2 +-
 drivers/gpu/drm/nouveau/nouveau_connector.h | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_backlight.c b/drivers/gpu/drm/nouveau/nouveau_backlight.c
index 5d0694680f59..f4400a6408b4 100644
--- a/drivers/gpu/drm/nouveau/nouveau_backlight.c
+++ b/drivers/gpu/drm/nouveau/nouveau_backlight.c
@@ -309,7 +309,7 @@ nouveau_backlight_init(struct drm_connector *connector)
 }
 
 void
-nouveau_backlight_exit(struct drm_connector *connector)
+nouveau_backlight_fini(struct drm_connector *connector)
 {
 	struct nouveau_connector *nv_conn = nouveau_connector(connector);
 	struct nouveau_backlight *bl = nv_conn->backlight;
diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
index 767e892de9c4..3b288be9c3f7 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -911,7 +911,7 @@ nouveau_connector_late_register(struct drm_connector *connector)
 static void
 nouveau_connector_early_unregister(struct drm_connector *connector)
 {
-	nouveau_backlight_exit(connector);
+	nouveau_backlight_fini(connector);
 }
 
 static int
diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.h b/drivers/gpu/drm/nouveau/nouveau_connector.h
index 5465ae82fb9f..76e79717e451 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.h
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.h
@@ -190,7 +190,7 @@ struct drm_display_mode *nouveau_conn_native_mode(struct drm_connector *);
 
 #ifdef CONFIG_DRM_NOUVEAU_BACKLIGHT
 extern int nouveau_backlight_init(struct drm_connector *);
-extern void nouveau_backlight_exit(struct drm_connector *);
+extern void nouveau_backlight_fini(struct drm_connector *);
 extern void nouveau_backlight_ctor(void);
 extern void nouveau_backlight_dtor(void);
 #else
@@ -201,7 +201,7 @@ nouveau_backlight_init(struct drm_connector *connector)
 }
 
 static inline void
-nouveau_backlight_exit(struct drm_connector *connector) {
+nouveau_backlight_fini(struct drm_connector *connector) {
 }
 
 static inline void
-- 
2.17.1

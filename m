From: Lee Jones <lee.jones@linaro.org>
Subject: [PATCH 25/30] drm/nouveau/nouveau_display: Remove set but unused variable 'width'
Date: Wed, 13 Jan 2021 08:07:47 +0000
Message-ID: <20210113080752.1003793-26-lee.jones@linaro.org>
References: <20210113080752.1003793-1-lee.jones@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20210113080752.1003793-1-lee.jones@linaro.org>
To: lee.jones@linaro.org
Cc: linux-kernel@vger.kernel.org, Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/nouveau/nouveau_display.c: In function ‘nouveau_framebuffer_new’:
 drivers/gpu/drm/nouveau/nouveau_display.c:309:15: warning: variable ‘width’ set but not used [-Wunused-but-set-variable]

Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/nouveau/nouveau_display.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
index bceb48a2dfca6..b76bba4ca0856 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.c
+++ b/drivers/gpu/drm/nouveau/nouveau_display.c
@@ -306,7 +306,7 @@ nouveau_framebuffer_new(struct drm_device *dev,
 	struct nouveau_bo *nvbo = nouveau_gem_object(gem);
 	struct drm_framebuffer *fb;
 	const struct drm_format_info *info;
-	unsigned int width, height, i;
+	unsigned int height, i;
 	uint32_t tile_mode;
 	uint8_t kind;
 	int ret;
@@ -346,9 +346,9 @@ nouveau_framebuffer_new(struct drm_device *dev,
 	info = drm_get_format_info(dev, mode_cmd);
 
 	for (i = 0; i < info->num_planes; i++) {
-		width = drm_format_info_plane_width(info,
-						    mode_cmd->width,
-						    i);
+		drm_format_info_plane_width(info,
+					    mode_cmd->width,
+					    i);
 		height = drm_format_info_plane_height(info,
 						      mode_cmd->height,
 						      i);
-- 
2.25.1

From: Lyude Paul <lyude@redhat.com>
Subject: [PATCH 1/5] drm/nouveau: Check backlight IDs are >= 0, not > 0
Date: Wed, 22 Aug 2018 21:21:46 -0400
Message-ID: <20180823012151.20099-2-lyude@redhat.com>
References: <20180823012151.20099-1-lyude@redhat.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180823012151.20099-1-lyude@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: nouveau@lists.freedesktop.org
Cc: stable@vger.kernel.org, Jeffery Miller <jmiller@neverware.com>, Karol Herbst <kherbst@redhat.com>, Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

Remember, ida IDs start at 0, not 1!

Signed-off-by: Lyude Paul <lyude@redhat.com>
Cc: stable@vger.kernel.org
Cc: Jeffery Miller <jmiller@neverware.com>
Cc: Karol Herbst <kherbst@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_backlight.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_backlight.c b/drivers/gpu/drm/nouveau/nouveau_backlight.c
index 408b955e5c39..6dd72bc32897 100644
--- a/drivers/gpu/drm/nouveau/nouveau_backlight.c
+++ b/drivers/gpu/drm/nouveau/nouveau_backlight.c
@@ -116,7 +116,7 @@ nv40_backlight_init(struct drm_connector *connector)
 				       &nv40_bl_ops, &props);
 
 	if (IS_ERR(bd)) {
-		if (bl_connector.id > 0)
+		if (bl_connector.id >= 0)
 			ida_simple_remove(&bl_ida, bl_connector.id);
 		return PTR_ERR(bd);
 	}
@@ -249,7 +249,7 @@ nv50_backlight_init(struct drm_connector *connector)
 				       nv_encoder, ops, &props);
 
 	if (IS_ERR(bd)) {
-		if (bl_connector.id > 0)
+		if (bl_connector.id >= 0)
 			ida_simple_remove(&bl_ida, bl_connector.id);
 		return PTR_ERR(bd);
 	}
-- 
2.17.1

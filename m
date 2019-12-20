From: Sasha Levin <sashal-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH AUTOSEL 4.14 10/19] drm/nouveau: Move the
 declaration of struct nouveau_conn_atom up a bit
Date: Fri, 20 Dec 2019 09:37:31 -0500
Message-ID: <20191220143741.10220-10-sashal@kernel.org>
References: <20191220143741.10220-1-sashal@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20191220143741.10220-1-sashal-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Sasha Levin <sashal-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

[ Upstream commit 37a68eab4cd92b507c9e8afd760fdc18e4fecac6 ]

Place the declaration of struct nouveau_conn_atom above that of
struct nouveau_connector. This commit makes no changes to the moved
block what so ever, it just moves it up a bit.

This is a preparation patch to fix some issues with connector handling
on pre nv50 displays (which do not use atomic modesetting).

Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Reviewed-by: Lyude Paul <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Sasha Levin <sashal-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_connector.h | 110 ++++++++++----------
 1 file changed, 55 insertions(+), 55 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.h b/drivers/gpu/drm/nouveau/nouveau_connector.h
index dc7454e7f19aa..b46e99f7641ed 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.h
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.h
@@ -29,6 +29,7 @@
 
 #include <nvif/notify.h>
 
+#include <drm/drm_crtc.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_encoder.h>
 #include <drm/drm_dp_helper.h>
@@ -37,6 +38,60 @@
 
 struct nvkm_i2c_port;
 
+#define nouveau_conn_atom(p)                                                   \
+	container_of((p), struct nouveau_conn_atom, state)
+
+struct nouveau_conn_atom {
+	struct drm_connector_state state;
+
+	struct {
+		/* The enum values specifically defined here match nv50/gf119
+		 * hw values, and the code relies on this.
+		 */
+		enum {
+			DITHERING_MODE_OFF = 0x00,
+			DITHERING_MODE_ON = 0x01,
+			DITHERING_MODE_DYNAMIC2X2 = 0x10 | DITHERING_MODE_ON,
+			DITHERING_MODE_STATIC2X2 = 0x18 | DITHERING_MODE_ON,
+			DITHERING_MODE_TEMPORAL = 0x20 | DITHERING_MODE_ON,
+			DITHERING_MODE_AUTO
+		} mode;
+		enum {
+			DITHERING_DEPTH_6BPC = 0x00,
+			DITHERING_DEPTH_8BPC = 0x02,
+			DITHERING_DEPTH_AUTO
+		} depth;
+	} dither;
+
+	struct {
+		int mode;	/* DRM_MODE_SCALE_* */
+		struct {
+			enum {
+				UNDERSCAN_OFF,
+				UNDERSCAN_ON,
+				UNDERSCAN_AUTO,
+			} mode;
+			u32 hborder;
+			u32 vborder;
+		} underscan;
+		bool full;
+	} scaler;
+
+	struct {
+		int color_vibrance;
+		int vibrant_hue;
+	} procamp;
+
+	union {
+		struct {
+			bool dither:1;
+			bool scaler:1;
+			bool procamp:1;
+		};
+		u8 mask;
+	} set;
+};
+
 struct nouveau_connector {
 	struct drm_connector base;
 	enum dcb_connector_type type;
@@ -111,61 +166,6 @@ extern int nouveau_ignorelid;
 extern int nouveau_duallink;
 extern int nouveau_hdmimhz;
 
-#include <drm/drm_crtc.h>
-#define nouveau_conn_atom(p)                                                   \
-	container_of((p), struct nouveau_conn_atom, state)
-
-struct nouveau_conn_atom {
-	struct drm_connector_state state;
-
-	struct {
-		/* The enum values specifically defined here match nv50/gf119
-		 * hw values, and the code relies on this.
-		 */
-		enum {
-			DITHERING_MODE_OFF = 0x00,
-			DITHERING_MODE_ON = 0x01,
-			DITHERING_MODE_DYNAMIC2X2 = 0x10 | DITHERING_MODE_ON,
-			DITHERING_MODE_STATIC2X2 = 0x18 | DITHERING_MODE_ON,
-			DITHERING_MODE_TEMPORAL = 0x20 | DITHERING_MODE_ON,
-			DITHERING_MODE_AUTO
-		} mode;
-		enum {
-			DITHERING_DEPTH_6BPC = 0x00,
-			DITHERING_DEPTH_8BPC = 0x02,
-			DITHERING_DEPTH_AUTO
-		} depth;
-	} dither;
-
-	struct {
-		int mode;	/* DRM_MODE_SCALE_* */
-		struct {
-			enum {
-				UNDERSCAN_OFF,
-				UNDERSCAN_ON,
-				UNDERSCAN_AUTO,
-			} mode;
-			u32 hborder;
-			u32 vborder;
-		} underscan;
-		bool full;
-	} scaler;
-
-	struct {
-		int color_vibrance;
-		int vibrant_hue;
-	} procamp;
-
-	union {
-		struct {
-			bool dither:1;
-			bool scaler:1;
-			bool procamp:1;
-		};
-		u8 mask;
-	} set;
-};
-
 void nouveau_conn_attach_properties(struct drm_connector *);
 void nouveau_conn_reset(struct drm_connector *);
 struct drm_connector_state *
-- 
2.20.1

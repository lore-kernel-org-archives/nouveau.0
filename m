From: Baoyou Xie <baoyou.xie@linaro.org>
Subject: [PATCH v2 1/2] drm/nouveau: add missing header dependencies
Date: Mon, 24 Oct 2016 11:09:02 +0800
Message-ID: <1477278543-16533-1-git-send-email-baoyou.xie@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: bskeggs@redhat.com, airlied@linux.ie, acourbot@nvidia.com, imirkin@alum.mit.edu, Julia.Lawall@lip6.fr, martin.peres@free.fr, rspliet@eclipso.eu, nouveau@karolherbst.de
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, arnd@arndb.de, baoyou.xie@linaro.org, xie.baoyou@zte.com.cn, han.fei@zte.com.cn, tang.qiang007@zte.com.cn
List-Id: nouveau.vger.kernel.org

We get a few warnings when building kernel with W=1:
drivers/gpu/drm/nouveau/nvkm/core/firmware.c:34:1: warning: no previous prototype for 'nvkm_firmware_get' [-Wmissing-prototypes]
drivers/gpu/drm/nouveau/nvkm/core/firmware.c:58:1: warning: no previous prototype for 'nvkm_firmware_put' [-Wmissing-prototypes]
drivers/gpu/drm/nouveau/nvkm/subdev/fb/sddr3.c:69:1: warning: no previous prototype for 'nvkm_sddr3_calc' [-Wmissing-prototypes]
drivers/gpu/drm/nouveau/nvkm/subdev/fb/sddr2.c:60:1: warning: no previous prototype for 'nvkm_sddr2_calc' [-Wmissing-prototypes]
....

In fact, these functions are declared in
drivers/gpu/drm/nouveau/include/nvkm/core/firmware.h
drivers/gpu/drm/nouveau/nvkm/subdev/fb/ram.h
drivers/gpu/drm/nouveau/nvkm/subdev/volt/priv.h
drivers/gpu/drm/nouveau/nvkm/engine/gr/nv50.h
drivers/gpu/drm/nouveau/dispnv04/disp.h.
So this patch adds missing header dependencies.

Signed-off-by: Baoyou Xie <baoyou.xie@linaro.org>
---
 drivers/gpu/drm/nouveau/dispnv04/overlay.c       | 2 +-
 drivers/gpu/drm/nouveau/nvkm/core/firmware.c     | 1 +
 drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxnv50.c | 1 +
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/sddr2.c   | 1 +
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/sddr3.c   | 1 +
 drivers/gpu/drm/nouveau/nvkm/subdev/volt/gpio.c  | 1 +
 6 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv04/overlay.c b/drivers/gpu/drm/nouveau/dispnv04/overlay.c
index ec444ea..a79514d 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/overlay.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/overlay.c
@@ -33,7 +33,7 @@
 #include "nouveau_connector.h"
 #include "nouveau_display.h"
 #include "nvreg.h"
-
+#include "disp.h"
 
 struct nouveau_plane {
 	struct drm_plane base;
diff --git a/drivers/gpu/drm/nouveau/nvkm/core/firmware.c b/drivers/gpu/drm/nouveau/nvkm/core/firmware.c
index 34ecd4a..058ff46 100644
--- a/drivers/gpu/drm/nouveau/nvkm/core/firmware.c
+++ b/drivers/gpu/drm/nouveau/nvkm/core/firmware.c
@@ -20,6 +20,7 @@
  * DEALINGS IN THE SOFTWARE.
  */
 #include <core/device.h>
+#include <core/firmware.h>
 
 /**
  * nvkm_firmware_get - load firmware from the official nvidia/chip/ directory
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxnv50.c b/drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxnv50.c
index 1e13278..c8bb919 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxnv50.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxnv50.c
@@ -106,6 +106,7 @@
 #define CP_SEEK_2      0x00c800ff
 
 #include "ctxnv40.h"
+#include "nv50.h"
 
 #include <subdev/fb.h>
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/sddr2.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/sddr2.c
index b9f1ffd..4dcd874 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/sddr2.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/sddr2.c
@@ -23,6 +23,7 @@
  *          Ben Skeggs
  */
 #include "priv.h"
+#include "ram.h"
 
 struct ramxlat {
 	int id;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/sddr3.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/sddr3.c
index 2690033..eca8a44 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/sddr3.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/sddr3.c
@@ -23,6 +23,7 @@
  * 	    Roy Spliet <rspliet@eclipso.eu>
  */
 #include "priv.h"
+#include "ram.h"
 
 struct ramxlat {
 	int id;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/volt/gpio.c b/drivers/gpu/drm/nouveau/nvkm/subdev/volt/gpio.c
index d2bac1d..443c031 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/volt/gpio.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/volt/gpio.c
@@ -25,6 +25,7 @@
 #include <subdev/bios.h>
 #include <subdev/bios/gpio.h>
 #include <subdev/gpio.h>
+#include "priv.h"
 
 static const u8 tags[] = {
 	DCB_GPIO_VID0, DCB_GPIO_VID1, DCB_GPIO_VID2, DCB_GPIO_VID3,
-- 
2.7.4

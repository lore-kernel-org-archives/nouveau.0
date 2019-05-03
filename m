From: jagdsh.linux@gmail.com
Subject: [PATCH] gpu/drm: Remove duplicate headers
Date: Fri,  3 May 2019 23:28:13 +0530
Message-ID: <1556906293-128921-1-git-send-email-jagdsh.linux@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robdclark@gmail.com, sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch, bskeggs@redhat.com, hierry.reding@gmail.com, jcrouse@codeaurora.org, jsanka@codeaurora.org, skolluku@codeaurora.org, paul.burton@mips.com, jrdr.linux@gmail.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org, Jagadeesh Pagadala <jagdsh.linux@gmail.com>
List-Id: nouveau.vger.kernel.org

From: Jagadeesh Pagadala <jagdsh.linux@gmail.com>

Remove duplicate headers which are included twice.

Signed-off-by: Jagadeesh Pagadala <jagdsh.linux@gmail.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c             | 1 -
 drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv04.c        | 2 --
 drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c | 1 -
 3 files changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
index 018df2c..45a5bc6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
@@ -15,7 +15,6 @@
 #include "dpu_hwio.h"
 #include "dpu_hw_lm.h"
 #include "dpu_hw_mdss.h"
-#include "dpu_kms.h"
 
 #define LM_OP_MODE                        0x00
 #define LM_OUT_SIZE                       0x04
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv04.c b/drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv04.c
index c80b967..2b44ba5 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv04.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv04.c
@@ -26,8 +26,6 @@
 
 #include <subdev/gpio.h>
 
-#include <subdev/gpio.h>
-
 static void
 nv04_bus_intr(struct nvkm_bus *bus)
 {
diff --git a/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c b/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
index 2c9c972..cacf2e0 100644
--- a/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
+++ b/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
@@ -53,7 +53,6 @@
 #include <linux/of_graph.h>
 #include <linux/pm.h>
 
-#include <drm/drm_panel.h>
 #include <drm/drmP.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_mipi_dsi.h>
-- 
1.8.3.1

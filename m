From: Baole Ni <baolex.ni@intel.com>
Subject: [PATCH 0205/1285] Replace numeric parameter like 0444 with macro
Date: Tue,  2 Aug 2016 18:49:31 +0800
Message-ID: <20160802104931.27420-1-baolex.ni@intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: bskeggs@redhat.com, airlied@linux.ie, kyungmin.park@samsung.com, kgene@kernel.org, k.kozlowski@samsung.com, dougthompson@xmission.com, bp@alien8.de
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, chuansheng.liu@intel.com, baolex.ni@intel.com, ville.syrjala@linux.intel.com
List-Id: nouveau.vger.kernel.org

I find that the developers often just specified the numeric value
when calling a macro which is defined with a parameter for access permission.
As we know, these numeric value for access permission have had the corresponding macro,
and that using macro can improve the robustness and readability of the code,
thus, I suggest replacing the numeric parameter with the macro.

Signed-off-by: Chuansheng Liu <chuansheng.liu@intel.com>
Signed-off-by: Baole Ni <baolex.ni@intel.com>
---
 drivers/gpu/drm/nouveau/nouveau_drm.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 11f8dd9..0a13c9a 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -63,24 +63,24 @@
 
 MODULE_PARM_DESC(config, "option string to pass to driver core");
 static char *nouveau_config;
-module_param_named(config, nouveau_config, charp, 0400);
+module_param_named(config, nouveau_config, charp, S_IRUSR);
 
 MODULE_PARM_DESC(debug, "debug string to pass to driver core");
 static char *nouveau_debug;
-module_param_named(debug, nouveau_debug, charp, 0400);
+module_param_named(debug, nouveau_debug, charp, S_IRUSR);
 
 MODULE_PARM_DESC(noaccel, "disable kernel/abi16 acceleration");
 static int nouveau_noaccel = 0;
-module_param_named(noaccel, nouveau_noaccel, int, 0400);
+module_param_named(noaccel, nouveau_noaccel, int, S_IRUSR);
 
 MODULE_PARM_DESC(modeset, "enable driver (default: auto, "
 		          "0 = disabled, 1 = enabled, 2 = headless)");
 int nouveau_modeset = -1;
-module_param_named(modeset, nouveau_modeset, int, 0400);
+module_param_named(modeset, nouveau_modeset, int, S_IRUSR);
 
 MODULE_PARM_DESC(runpm, "disable (0), force enable (1), optimus only default (-1)");
 int nouveau_runtime_pm = -1;
-module_param_named(runpm, nouveau_runtime_pm, int, 0400);
+module_param_named(runpm, nouveau_runtime_pm, int, S_IRUSR);
 
 static struct drm_driver driver_stub;
 static struct drm_driver driver_pci;
-- 
2.9.2

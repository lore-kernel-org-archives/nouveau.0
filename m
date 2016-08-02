From: Baole Ni <baolex.ni@intel.com>
Subject: [PATCH 0204/1285] Replace numeric parameter like 0444 with macro
Date: Tue,  2 Aug 2016 18:49:27 +0800
Message-ID: <20160802104927.27354-1-baolex.ni@intel.com>
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
 drivers/gpu/drm/nouveau/nouveau_connector.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
index c108408..689ee9e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -49,19 +49,19 @@
 
 MODULE_PARM_DESC(tv_disable, "Disable TV-out detection");
 int nouveau_tv_disable = 0;
-module_param_named(tv_disable, nouveau_tv_disable, int, 0400);
+module_param_named(tv_disable, nouveau_tv_disable, int, S_IRUSR);
 
 MODULE_PARM_DESC(ignorelid, "Ignore ACPI lid status");
 int nouveau_ignorelid = 0;
-module_param_named(ignorelid, nouveau_ignorelid, int, 0400);
+module_param_named(ignorelid, nouveau_ignorelid, int, S_IRUSR);
 
 MODULE_PARM_DESC(duallink, "Allow dual-link TMDS (default: enabled)");
 int nouveau_duallink = 1;
-module_param_named(duallink, nouveau_duallink, int, 0400);
+module_param_named(duallink, nouveau_duallink, int, S_IRUSR);
 
 MODULE_PARM_DESC(hdmimhz, "Force a maximum HDMI pixel clock (in MHz)");
 int nouveau_hdmimhz = 0;
-module_param_named(hdmimhz, nouveau_hdmimhz, int, 0400);
+module_param_named(hdmimhz, nouveau_hdmimhz, int, S_IRUSR);
 
 struct nouveau_encoder *
 find_encoder(struct drm_connector *connector, int type)
-- 
2.9.2

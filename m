From: Baole Ni <baolex.ni@intel.com>
Subject: [PATCH 0202/1285] Replace numeric parameter like 0444 with macro
Date: Tue,  2 Aug 2016 18:49:18 +0800
Message-ID: <20160802104918.27222-1-baolex.ni@intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: bskeggs@redhat.com, airlied@linux.ie, kyungmin.park@samsung.com, kgene@kernel.org, k.kozlowski@samsung.com, dougthompson@xmission.com, bp@alien8.de
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, daniel.vetter@ffwll.ch, treding@nvidia.com, ville.syrjala@linux.intel.com, chuansheng.liu@intel.com, baolex.ni@intel.com
List-Id: nouveau.vger.kernel.org

I find that the developers often just specified the numeric value
when calling a macro which is defined with a parameter for access permission.
As we know, these numeric value for access permission have had the corresponding macro,
and that using macro can improve the robustness and readability of the code,
thus, I suggest replacing the numeric parameter with the macro.

Signed-off-by: Chuansheng Liu <chuansheng.liu@intel.com>
Signed-off-by: Baole Ni <baolex.ni@intel.com>
---
 drivers/gpu/drm/nouveau/dispnv04/tvnv17.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c b/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
index a665b78..42ed6f7 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
@@ -40,7 +40,7 @@ MODULE_PARM_DESC(tv_norm, "Default TV norm.\n"
 		 "\t\tDefault: PAL\n"
 		 "\t\t*NOTE* Ignored for cards with external TV encoders.");
 static char *nouveau_tv_norm;
-module_param_named(tv_norm, nouveau_tv_norm, charp, 0400);
+module_param_named(tv_norm, nouveau_tv_norm, charp, S_IRUSR);
 
 static uint32_t nv42_tv_sample_load(struct drm_encoder *encoder)
 {
-- 
2.9.2

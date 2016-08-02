From: Baole Ni <baolex.ni@intel.com>
Subject: [PATCH 0203/1285] Replace numeric parameter like 0444 with macro
Date: Tue,  2 Aug 2016 18:49:22 +0800
Message-ID: <20160802104922.27288-1-baolex.ni@intel.com>
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
 drivers/gpu/drm/nouveau/nouveau_chan.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.c b/drivers/gpu/drm/nouveau/nouveau_chan.c
index b1d2527..6036456 100644
--- a/drivers/gpu/drm/nouveau/nouveau_chan.c
+++ b/drivers/gpu/drm/nouveau/nouveau_chan.c
@@ -43,7 +43,7 @@
 
 MODULE_PARM_DESC(vram_pushbuf, "Create DMA push buffers in VRAM");
 int nouveau_vram_pushbuf;
-module_param_named(vram_pushbuf, nouveau_vram_pushbuf, int, 0400);
+module_param_named(vram_pushbuf, nouveau_vram_pushbuf, int, S_IRUSR);
 
 int
 nouveau_channel_idle(struct nouveau_channel *chan)
-- 
2.9.2

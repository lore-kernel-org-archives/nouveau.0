From: Tian Tao <tiantao6@hisilicon.com>
Subject: [PATCH] drm/nouveau/fb/gp102-: use flexible-array member instead of zero-length array
Date: Mon, 23 Nov 2020 16:35:15 +0800
Message-ID: <1606120515-45702-1-git-send-email-tiantao6@hisilicon.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
To: bskeggs@redhat.com, airlied@linux.ie, daniel@ffwll.ch, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

fixed the coccicheck:
drivers/gpu/drm/nouveau/include/nvfw/hs.h:26:5-9: WARNING use
flexible-array member instead.

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
 drivers/gpu/drm/nouveau/include/nvfw/hs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvfw/hs.h b/drivers/gpu/drm/nouveau/include/nvfw/hs.h
index 64d0d32..b53bbc4 100644
--- a/drivers/gpu/drm/nouveau/include/nvfw/hs.h
+++ b/drivers/gpu/drm/nouveau/include/nvfw/hs.h
@@ -23,7 +23,7 @@ struct nvfw_hs_load_header {
 	u32 data_dma_base;
 	u32 data_size;
 	u32 num_apps;
-	u32 apps[0];
+	u32 apps[];
 };
 
 const struct nvfw_hs_load_header *
-- 
2.7.4

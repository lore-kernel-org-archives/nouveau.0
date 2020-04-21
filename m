From: Zou Wei <zou_wei@huawei.com>
Subject: [PATCH -next] drm/nouveau/acr: Use kmemdup instead of kmalloc and memcpy
Date: Tue, 21 Apr 2020 20:37:31 +0800
Message-ID: <1587472651-105308-1-git-send-email-zou_wei@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: bskeggs@redhat.com, airlied@linux.ie, daniel@ffwll.ch, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Zou Wei <zou_wei@huawei.com>
List-Id: nouveau.vger.kernel.org

Fixes coccicheck warning:

drivers/gpu/drm/nouveau/nvkm/subdev/acr/hsfw.c:103:23-30: WARNING opportunity for kmemdup
drivers/gpu/drm/nouveau/nvkm/subdev/acr/hsfw.c:113:22-29: WARNING opportunity for kmemdup

Fixes: 22dcda45a3d1 ("drm/nouveau/acr: implement new subdev to replace "secure boot"")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Zou Wei <zou_wei@huawei.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/acr/hsfw.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/hsfw.c b/drivers/gpu/drm/nouveau/nvkm/subdev/acr/hsfw.c
index aecce2d..667fa01 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/hsfw.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/acr/hsfw.c
@@ -100,25 +100,21 @@ nvkm_acr_hsfw_load_image(struct nvkm_acr *acr, const char *name, int ver,
 	hsfw->data_size = lhdr->data_size;
 
 	hsfw->sig.prod.size = fwhdr->sig_prod_size;
-	hsfw->sig.prod.data = kmalloc(hsfw->sig.prod.size, GFP_KERNEL);
+	hsfw->sig.prod.data = kmemdup(fw->data + fwhdr->sig_prod_offset + sig,
+				      hsfw->sig.prod.size, GFP_KERNEL);
 	if (!hsfw->sig.prod.data) {
 		ret = -ENOMEM;
 		goto done;
 	}
 
-	memcpy(hsfw->sig.prod.data, fw->data + fwhdr->sig_prod_offset + sig,
-	       hsfw->sig.prod.size);
-
 	hsfw->sig.dbg.size = fwhdr->sig_dbg_size;
-	hsfw->sig.dbg.data = kmalloc(hsfw->sig.dbg.size, GFP_KERNEL);
+	hsfw->sig.dbg.data = kmemdup(fw->data + fwhdr->sig_dbg_offset + sig,
+				     hsfw->sig.dbg.size, GFP_KERNEL);
 	if (!hsfw->sig.dbg.data) {
 		ret = -ENOMEM;
 		goto done;
 	}
 
-	memcpy(hsfw->sig.dbg.data, fw->data + fwhdr->sig_dbg_offset + sig,
-	       hsfw->sig.dbg.size);
-
 	hsfw->sig.patch_loc = loc;
 done:
 	nvkm_firmware_put(fw);
-- 
2.6.2

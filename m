From: Markus Mayer <mmayer@broadcom.com>
Subject: [PATCH 2/6] drm/nouveau/core: make use of new strtolower() function
Date: Thu, 30 Jun 2016 16:50:08 -0700
Message-ID: <1467330612-26242-3-git-send-email-mmayer@broadcom.com>
References: <1467330612-26242-1-git-send-email-mmayer@broadcom.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1467330612-26242-1-git-send-email-mmayer@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Alexandre Courbot <acourbot@nvidia.com>
Cc: Markus Mayer <mmayer@broadcom.com>, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

Call strtolower() rather than walking the string explicitly to convert
it to lowercase.

Signed-off-by: Markus Mayer <mmayer@broadcom.com>
---
 drivers/gpu/drm/nouveau/nvkm/core/firmware.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/core/firmware.c b/drivers/gpu/drm/nouveau/nvkm/core/firmware.c
index 34ecd4a..c50594c 100644
--- a/drivers/gpu/drm/nouveau/nvkm/core/firmware.c
+++ b/drivers/gpu/drm/nouveau/nvkm/core/firmware.c
@@ -36,16 +36,11 @@ nvkm_firmware_get(struct nvkm_device *device, const char *fwname,
 {
 	char f[64];
 	char cname[16];
-	int i;
 
 	/* Convert device name to lowercase */
 	strncpy(cname, device->chip->name, sizeof(cname));
 	cname[sizeof(cname) - 1] = '\0';
-	i = strlen(cname);
-	while (i) {
-		--i;
-		cname[i] = tolower(cname[i]);
-	}
+	strtolower(cname);
 
 	snprintf(f, sizeof(f), "nvidia/%s/%s.bin", cname, fwname);
 	return request_firmware(fw, f, device->dev);
-- 
2.7.4

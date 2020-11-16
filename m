From: Lee Jones <lee.jones@linaro.org>
Subject: [PATCH 21/42] drm/nouveau/nvkm/core/firmware: Fix formatting, provide missing param description
Date: Mon, 16 Nov 2020 17:40:51 +0000
Message-ID: <20201116174112.1833368-22-lee.jones@linaro.org>
References: <20201116174112.1833368-1-lee.jones@linaro.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20201116174112.1833368-1-lee.jones@linaro.org>
To: lee.jones@linaro.org
Cc: linux-kernel@vger.kernel.org, Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

... and demote non-conformant kernel-doc header.

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/nouveau/nvkm/core/firmware.c:71: warning: Function parameter or member 'subdev' not described in 'nvkm_firmware_get'
 drivers/gpu/drm/nouveau/nvkm/core/firmware.c:71: warning: Function parameter or member 'fwname' not described in 'nvkm_firmware_get'
 drivers/gpu/drm/nouveau/nvkm/core/firmware.c:71: warning: Function parameter or member 'ver' not described in 'nvkm_firmware_get'
 drivers/gpu/drm/nouveau/nvkm/core/firmware.c:71: warning: Function parameter or member 'fw' not described in 'nvkm_firmware_get'
 drivers/gpu/drm/nouveau/nvkm/core/firmware.c:106: warning: Function parameter or member 'fw' not described in 'nvkm_firmware_put'

Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/nouveau/nvkm/core/firmware.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/core/firmware.c b/drivers/gpu/drm/nouveau/nvkm/core/firmware.c
index 8b25367917ca0..ca1f8463cff51 100644
--- a/drivers/gpu/drm/nouveau/nvkm/core/firmware.c
+++ b/drivers/gpu/drm/nouveau/nvkm/core/firmware.c
@@ -58,9 +58,10 @@ nvkm_firmware_load_blob(const struct nvkm_subdev *subdev, const char *base,
 
 /**
  * nvkm_firmware_get - load firmware from the official nvidia/chip/ directory
- * @subdev	subdevice that will use that firmware
- * @fwname	name of firmware file to load
- * @fw		firmware structure to load to
+ * @subdev:	subdevice that will use that firmware
+ * @fwname:	name of firmware file to load
+ * @ver:	firmware version to load
+ * @fw:		firmware structure to load to
  *
  * Use this function to load firmware files in the form nvidia/chip/fwname.bin.
  * Firmware files released by NVIDIA will always follow this format.
@@ -98,7 +99,7 @@ nvkm_firmware_get(const struct nvkm_subdev *subdev, const char *fwname, int ver,
 	return -ENOENT;
 }
 
-/**
+/*
  * nvkm_firmware_put - release firmware loaded with nvkm_firmware_get
  */
 void
-- 
2.25.1

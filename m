From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: [PATCH] pci/msi: disable MSI on big-endian platforms by default
Date: Thu, 10 Aug 2017 12:13:40 -0400
Message-ID: <20170810161340.17928-1-imirkin@alum.mit.edu>
Return-path: <stable-owner@vger.kernel.org>
Sender: stable-owner@vger.kernel.org
To: nouveau@lists.freedesktop.org
Cc: Ilia Mirkin <imirkin@alum.mit.edu>, stable@vger.kernel.org
List-Id: nouveau.vger.kernel.org

It appears that MSI does not work on either G5 PPC nor on a E5500-based
platform, where other hardware is reported to work fine with MSI.

Both tests were conducted with NV4x hardware, so perhaps other (or even
this) hardware can be made to work. It's still possible to force-enable
with config=NvMSI=1 on load.

Signed-off-by: Ilia Mirkin <imirkin@alum.mit.edu>
Cc: stable@vger.kernel.org
---
 drm/nouveau/nvkm/subdev/pci/base.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drm/nouveau/nvkm/subdev/pci/base.c b/drm/nouveau/nvkm/subdev/pci/base.c
index eb9b2781..a4cb8249 100644
--- a/drm/nouveau/nvkm/subdev/pci/base.c
+++ b/drm/nouveau/nvkm/subdev/pci/base.c
@@ -192,6 +192,10 @@ nvkm_pci_new_(const struct nvkm_pci_func *func, struct nvkm_device *device,
 		}
 	}
 
+#ifdef __BIG_ENDIAN
+	pci->msi = false;
+#endif
+
 	pci->msi = nvkm_boolopt(device->cfgopt, "NvMSI", pci->msi);
 	if (pci->msi && func->msi_rearm) {
 		pci->msi = pci_enable_msi(pci->pdev) == 0;
-- 
2.13.0

From: Lee Jones <lee.jones@linaro.org>
Subject: [PATCH 27/29] drm/nouveau/nouveau_bios: Remove unused variable 'pdev' from 'nouveau_bios_init()'
Date: Fri, 15 Jan 2021 18:15:59 +0000
Message-ID: <20210115181601.3432599-28-lee.jones@linaro.org>
References: <20210115181601.3432599-1-lee.jones@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20210115181601.3432599-1-lee.jones@linaro.org>
To: lee.jones@linaro.org
Cc: linux-kernel@vger.kernel.org, Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/nouveau/nouveau_bios.c: In function ‘nouveau_bios_init’:
 drivers/gpu/drm/nouveau/nouveau_bios.c:2086:18: warning: variable ‘pdev’ set but not used [-Wunused-but-set-variable]

Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/nouveau/nouveau_bios.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bios.c b/drivers/gpu/drm/nouveau/nouveau_bios.c
index 7cc683b8dc7a6..e8c445eb11004 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bios.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bios.c
@@ -2083,13 +2083,11 @@ nouveau_bios_init(struct drm_device *dev)
 {
 	struct nouveau_drm *drm = nouveau_drm(dev);
 	struct nvbios *bios = &drm->vbios;
-	struct pci_dev *pdev;
 	int ret;
 
 	/* only relevant for PCI devices */
 	if (!dev_is_pci(dev->dev))
 		return 0;
-	pdev = to_pci_dev(dev->dev);
 
 	if (!NVInitVBIOS(dev))
 		return -ENODEV;
-- 
2.25.1

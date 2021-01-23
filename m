From: Ye Bin <yebin10@huawei.com>
Subject: [PATCH] =?UTF-8?q?drm/nouveau:=20remove=20set=20but=20not=20used?= =?UTF-8?q?=20variable=20=E2=80=98pdev=E2=80=99=20in=20nouveau=5Fbios=5Fin?= =?UTF-8?q?it?=
Date: Sat, 23 Jan 2021 09:30:14 +0800
Message-ID: <20210123013014.3815870-1-yebin10@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
To: bskeggs@redhat.com, airlied@linux.ie, daniel@ffwll.ch, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Ye Bin <yebin10@huawei.com>, Hulk Robot <hulkci@huawei.com>
List-Id: nouveau.vger.kernel.org

Fix follow warning:
drivers/gpu/drm/nouveau/nouveau_bios.c:2086:18: warning: variable ‘pdev’ set but not used [-Wunused-but-set-variable]
  struct pci_dev *pdev;
                  ^~~~

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Ye Bin <yebin10@huawei.com>
---
 drivers/gpu/drm/nouveau/nouveau_bios.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bios.c b/drivers/gpu/drm/nouveau/nouveau_bios.c
index 7cc683b8dc7a..e8c445eb1100 100644
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
2.25.4

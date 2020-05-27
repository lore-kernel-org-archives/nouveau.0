From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] nouveau: add fbdev dependency
Date: Wed, 27 May 2020 15:42:23 +0200
Message-ID: <20200527134254.854672-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Cc: Arnd Bergmann <arnd@arndb.de>, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

Calling directly into the fbdev stack only works when the
fbdev layer is built into the kernel as well, or both are
loadable modules:

drivers/gpu/drm/nouveau/nouveau_drm.o: in function `nouveau_drm_probe':
nouveau_drm.c:(.text+0x1f90): undefined reference to `remove_conflicting_pci_framebuffers'

The change seems to have been intentional, so add an explicit
dependency here but allow it to still be compiled if FBDEV
is completely disabled.

Fixes: 2dd4d163cd9c ("drm/nouveau: remove open-coded version of remove_conflicting_pci_framebuffers()")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/nouveau/Kconfig       | 1 +
 drivers/gpu/drm/nouveau/nouveau_drm.c | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/Kconfig b/drivers/gpu/drm/nouveau/Kconfig
index 980ed09bd7f6..8c640f003358 100644
--- a/drivers/gpu/drm/nouveau/Kconfig
+++ b/drivers/gpu/drm/nouveau/Kconfig
@@ -18,6 +18,7 @@ config DRM_NOUVEAU
 	select THERMAL if ACPI && X86
 	select ACPI_VIDEO if ACPI && X86
 	select SND_HDA_COMPONENT if SND_HDA_CORE
+	depends on FBDEV || !FBDEV
 	help
 	  Choose this option for open-source NVIDIA support.
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index eb10c80ed853..e8560444ab57 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -697,7 +697,8 @@ static int nouveau_drm_probe(struct pci_dev *pdev,
 	nvkm_device_del(&device);
 
 	/* Remove conflicting drivers (vesafb, efifb etc). */
-	ret = remove_conflicting_pci_framebuffers(pdev, "nouveaufb");
+	if (IS_ENABLED(CONFIG_FBDEV))
+		ret = remove_conflicting_pci_framebuffers(pdev, "nouveaufb");
 	if (ret)
 		return ret;
 
-- 
2.26.2

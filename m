From: Stratos Psomadakis <psomas-CiBbMcFdDxlMo1R+fwTmgw@public.gmane.org>
Subject: [PATCH] drm/nouveau: Fix build error in nouveau_acpi.c
Date: Wed, 22 Jun 2011 16:25:47 +0300
Message-ID: <1308749147-4502-1-git-send-email-psomas@ece.ntua.gr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Stratos Psomadakis <psomas-Hpc4xzY4zrDSDkk6z29a7FAUjnlXr6A1@public.gmane.org>
List-Id: nouveau.vger.kernel.org

From: Stratos Psomadakis <psomas-Hpc4xzY4zrDSDkk6z29a7FAUjnlXr6A1@public.gmane.org>

Fix compilation failure when CONFIG_ACPI=y, but CONFIG_ACPI_VIDEO is not
selected by Kconfig (ie CONFIG_ACPI_VIDEO=m|n)

When CONFIG_ACPI_VIDEO != y, nouveau_acpi_edid will fail to build, due to the
call to the 'acpi_video_get_edid' function.

Signed-off-by: Stratos Psomadakis <psomas-Hpc4xzY4zrDSDkk6z29a7FAUjnlXr6A1@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_drv.h |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index 9c56331..23c6540 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -973,8 +973,12 @@ void nouveau_register_dsm_handler(void);
 void nouveau_unregister_dsm_handler(void);
 int nouveau_acpi_get_bios_chunk(uint8_t *bios, int offset, int len);
 bool nouveau_acpi_rom_supported(struct pci_dev *pdev);
+#if defined(CONFIG_ACPI_VIDEO)
 int nouveau_acpi_edid(struct drm_device *, struct drm_connector *);
 #else
+static inline int nouveau_acpi_edid(struct drm_device *dev, struct drm_connector *connector) { return -EINVAL; }
+#endif
+#else
 static inline void nouveau_register_dsm_handler(void) {}
 static inline void nouveau_unregister_dsm_handler(void) {}
 static inline bool nouveau_acpi_rom_supported(struct pci_dev *pdev) { return false; }
-- 
1.7.5.4

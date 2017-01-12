From: Lyude <lyude@redhat.com>
Subject: [PATCH v2 1/2] drm/nouveau: Don't enabling polling twice on runtime resume
Date: Wed, 11 Jan 2017 21:25:23 -0500
Message-ID: <20170112022525.29217-1-lyude@redhat.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: nouveau@lists.freedesktop.org
Cc: Lyude <lyude@redhat.com>, Hans de Goede <hdegoede@redhat.com>, Kilian Singer <kilian.singer@quantumtechnology.info>, Lukas Wunner <lukas@wunner.de>, David Airlie <airlied@redhat.com>, Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

As it turns out, on cards that actually have CRTCs on them we're already
calling drm_kms_helper_poll_enable(drm_dev) from
nouveau_display_resume() before we call it in
nouveau_pmops_runtime_resume(). This leads us to accidentally trying to
enable polling twice, which results in a potential deadlock between the
RPM locks and drm_dev->mode_config.mutex if we end up trying to enable
polling the second time while output_poll_execute is running and holding
the mode_config lock. As such, make sure we only enable polling in
nouveau_pmops_runtime_resume() if we need to.

This fixes hangs observed on the ThinkPad W541

Signed-off-by: Lyude <lyude@redhat.com>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Kilian Singer <kilian.singer@quantumtechnology.info>
Cc: Lukas Wunner <lukas@wunner.de>
Cc: David Airlie <airlied@redhat.com>
---
Changes since v1:
 - Rebase to work with master

 drivers/gpu/drm/nouveau/nouveau_display.c | 3 ++-
 drivers/gpu/drm/nouveau/nouveau_drm.c     | 5 ++++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
index cef08da..6a15776 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.c
+++ b/drivers/gpu/drm/nouveau/nouveau_display.c
@@ -411,7 +411,8 @@ nouveau_display_init(struct drm_device *dev)
 		return ret;
 
 	/* enable polling for external displays */
-	drm_kms_helper_poll_enable(dev);
+	if (!dev->mode_config.poll_enabled)
+		drm_kms_helper_poll_enable(dev);
 
 	/* enable hotplug interrupts */
 	list_for_each_entry(connector, &dev->mode_config.connector_list, head) {
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 59348fc..bc85a45 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -773,7 +773,10 @@ nouveau_pmops_runtime_resume(struct device *dev)
 	pci_set_master(pdev);
 
 	ret = nouveau_do_resume(drm_dev, true);
-	drm_kms_helper_poll_enable(drm_dev);
+
+	if (!drm_dev->mode_config.poll_enabled)
+		drm_kms_helper_poll_enable(drm_dev);
+
 	/* do magic */
 	nvif_mask(&device->object, 0x088488, (1 << 25), (1 << 25));
 	vga_switcheroo_set_dynamic_switch(pdev, VGA_SWITCHEROO_ON);
-- 
2.9.3

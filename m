From: Lyude Paul <lyude@redhat.com>
Subject: [PATCH 1/2] drm/nouveau: Print debug message on ACPI probe event
Date: Mon, 30 Jul 2018 20:58:34 -0400
Message-ID: <20180731005835.21032-1-lyude@redhat.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: nouveau@lists.freedesktop.org
Cc: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_display.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
index ec7861457b84..b2a93e3fa67b 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.c
+++ b/drivers/gpu/drm/nouveau/nouveau_display.c
@@ -387,6 +387,7 @@ nouveau_display_acpi_ntfy(struct notifier_block *nb, unsigned long val,
 			 * connector hotplug on a runtime suspended GPU,
 			 * schedule hpd_work to check.
 			 */
+			NV_DEBUG(drm, "ACPI requested connector probe\n");
 			schedule_work(&drm->hpd_work);
 
 			/* acpi-video should not generate keypresses for this */
-- 
2.17.1

From: Lyude Paul <lyude@redhat.com>
Subject: [PATCH 7/9] drm/nouveau/kms: Invert conditionals in nouveau_display_acpi_ntfy()
Date: Wed, 29 Jul 2020 17:37:01 -0400
Message-ID: <20200729213703.119137-8-lyude@redhat.com>
References: <20200729213703.119137-1-lyude@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200729213703.119137-1-lyude@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: nouveau@lists.freedesktop.org
Cc: stable@vger.kernel.org, Ben Skeggs <bskeggs@redhat.com>, dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, open list <linux-kernel@vger.kernel.org>
List-Id: nouveau.vger.kernel.org

No functional changes here, just a drive-by cleanup.

Signed-off-by: Lyude Paul <lyude@redhat.com>
[cc'd to stable since the next fix needs this patch to apply]
Fixes: 79e765ad665d ("drm/nouveau/drm/nouveau: Prevent handling ACPI HPD events too early")
Cc: stable@vger.kernel.org
Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v4.19+
---
 drivers/gpu/drm/nouveau/nouveau_display.c | 50 +++++++++++------------
 1 file changed, 24 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
index cdc5a2200f95e..96c9e7f550537 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.c
+++ b/drivers/gpu/drm/nouveau/nouveau_display.c
@@ -457,34 +457,32 @@ nouveau_display_acpi_ntfy(struct notifier_block *nb, unsigned long val,
 	struct acpi_bus_event *info = data;
 	int ret;
 
-	if (!strcmp(info->device_class, ACPI_VIDEO_CLASS)) {
-		if (info->type == ACPI_VIDEO_NOTIFY_PROBE) {
-			ret = pm_runtime_get(drm->dev->dev);
-			if (ret == 1 || ret == -EACCES) {
-				/* If the GPU is already awake, or in a state
-				 * where we can't wake it up, it can handle
-				 * it's own hotplug events.
-				 */
-				pm_runtime_put_autosuspend(drm->dev->dev);
-			} else if (ret == 0) {
-				/* This may be the only indication we receive
-				 * of a connector hotplug on a runtime
-				 * suspended GPU, schedule hpd_work to check.
-				 */
-				NV_DEBUG(drm, "ACPI requested connector reprobe\n");
-				schedule_work(&drm->hpd_work);
-				pm_runtime_put_noidle(drm->dev->dev);
-			} else {
-				NV_WARN(drm, "Dropped ACPI reprobe event due to RPM error: %d\n",
-					ret);
-			}
-
-			/* acpi-video should not generate keypresses for this */
-			return NOTIFY_BAD;
-		}
+	if (strcmp(info->device_class, ACPI_VIDEO_CLASS) ||
+	    info->type != ACPI_VIDEO_NOTIFY_PROBE)
+		return NOTIFY_DONE;
+
+	ret = pm_runtime_get(drm->dev->dev);
+	if (ret == 1 || ret == -EACCES) {
+		/* If the GPU is already awake, or in a state
+		 * where we can't wake it up, it can handle
+		 * it's own hotplug events.
+		 */
+		pm_runtime_put_autosuspend(drm->dev->dev);
+	} else if (ret == 0) {
+		/* This may be the only indication we receive
+		 * of a connector hotplug on a runtime
+		 * suspended GPU, schedule hpd_work to check.
+		 */
+		NV_DEBUG(drm, "ACPI requested connector reprobe\n");
+		schedule_work(&drm->hpd_work);
+		pm_runtime_put_noidle(drm->dev->dev);
+	} else {
+		NV_WARN(drm, "Dropped ACPI reprobe event due to RPM error: %d\n",
+			ret);
 	}
 
-	return NOTIFY_DONE;
+	/* acpi-video should not generate keypresses for this */
+	return NOTIFY_BAD;
 }
 #endif
 
-- 
2.26.2

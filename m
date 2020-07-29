From: Lyude Paul <lyude@redhat.com>
Subject: [PATCH 9/9] drm/nouveau/kms: Handle -EINPROGRESS in nouveau_display_acpi_ntfy()
Date: Wed, 29 Jul 2020 17:37:03 -0400
Message-ID: <20200729213703.119137-10-lyude@redhat.com>
References: <20200729213703.119137-1-lyude@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200729213703.119137-1-lyude@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: nouveau@lists.freedesktop.org
Cc: stable@vger.kernel.org, Karol Herbst <kherbst@redhat.com>, Ben Skeggs <bskeggs@redhat.com>, dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, open list <linux-kernel@vger.kernel.org>
List-Id: nouveau.vger.kernel.org

This isn't an error, this just means there's multiple asynchronous
resume requests going at the same time. Treat it like a success.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Fixes: 79e765ad665d ("drm/nouveau/drm/nouveau: Prevent handling ACPI HPD events too early")
Cc: stable@vger.kernel.org
Cc: Karol Herbst <kherbst@redhat.com>
Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v4.19+
---
 drivers/gpu/drm/nouveau/nouveau_display.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
index ad63d4f052deb..691bb8d37759e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.c
+++ b/drivers/gpu/drm/nouveau/nouveau_display.c
@@ -462,10 +462,10 @@ nouveau_display_acpi_ntfy(struct notifier_block *nb, unsigned long val,
 		return NOTIFY_DONE;
 
 	ret = pm_runtime_get(drm->dev->dev);
-	if (ret == 1 || ret == -EACCES) {
-		/* If the GPU is already awake, or in a state
-		 * where we can't wake it up, it can handle
-		 * it's own hotplug events.
+	if (ret == 1 || ret == -EACCES || ret == -EINPROGRESS) {
+		/* If the GPU is already awake, is waking up, or is in a state
+		 * where we can't wake it up, it can handle its own hotplug
+		 * events.
 		 */
 		pm_runtime_put_autosuspend(drm->dev->dev);
 	} else if (ret == 0) {
-- 
2.26.2

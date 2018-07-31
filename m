From: Lyude Paul <lyude@redhat.com>
Subject: [PATCH v3 8/8] drm/nouveau: Call pm_runtime_get_noresume() from hpd handlers
Date: Mon, 30 Jul 2018 20:39:53 -0400
Message-ID: <20180731003954.19962-9-lyude@redhat.com>
References: <20180731003954.19962-1-lyude@redhat.com>
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20180731003954.19962-1-lyude@redhat.com>
Sender: stable-owner@vger.kernel.org
To: nouveau@lists.freedesktop.org
Cc: stable@vger.kernel.org, Lukas Wunner <lukas@wunner.de>, Karol Herbst <karolherbst@gmail.com>, Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

We can't and don't need to try resuming the device from our hotplug
handlers, but hotplug events are generally something we'd like to keep
the device awake for whenever possible. So, grab a PM ref safely in our
hotplug handlers using pm_runtime_get_noresume() and mark the device as
busy once we're finished.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Cc: stable@vger.kernel.org
Cc: Lukas Wunner <lukas@wunner.de>
Cc: Karol Herbst <karolherbst@gmail.com>
---
 drivers/gpu/drm/nouveau/nouveau_connector.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
index 8409c3f2c3a1..5a8e8c1ad647 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -1152,6 +1152,11 @@ nouveau_connector_hotplug(struct nvif_notify *notify)
 	const char *name = connector->name;
 	struct nouveau_encoder *nv_encoder;
 
+	/* Resuming the device here isn't possible; but the suspend PM ops
+	 * will wait for us to finish our work before disabling us so this
+	 * should be enough
+	 */
+	pm_runtime_get_noresume(drm->dev->dev);
 	nv_connector->hpd_task = current;
 
 	if (rep->mask & NVIF_NOTIFY_CONN_V0_IRQ) {
@@ -1171,6 +1176,9 @@ nouveau_connector_hotplug(struct nvif_notify *notify)
 	}
 
 	nv_connector->hpd_task = NULL;
+
+	pm_runtime_mark_last_busy(drm->dev->dev);
+	pm_runtime_put_autosuspend(drm->dev->dev);
 	return NVIF_NOTIFY_KEEP;
 }
 
-- 
2.17.1

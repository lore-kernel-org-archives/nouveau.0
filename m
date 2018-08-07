From: Lyude Paul <lyude@redhat.com>
Subject: [PATCH v5 11/13] drm/nouveau: Respond to HPDs by probing one conn at a time
Date: Tue,  7 Aug 2018 16:39:08 -0400
Message-ID: <20180807203914.2192-12-lyude@redhat.com>
References: <20180807203914.2192-1-lyude@redhat.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180807203914.2192-1-lyude@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: nouveau@lists.freedesktop.org
Cc: stable@vger.kernel.org, Lukas Wunner <lukas@wunner.de>, Karol Herbst <karolherbst@gmail.com>, Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

There isn't actually any reason we need to call drm_hpd_irq_event() from
our hotplug handler, as we already know which connector the hotplug
event was fired for. We're also going to need to avoid probing all
connectors needlessly from hotplug handlers anyway so that we can track
when nouveau_connector_detect() is being called from the context of it's
connector's hotplug handler in order to fix the next deadlocking issue.

This is (slightly) faster anyway!

Signed-off-by: Lyude Paul <lyude@redhat.com>
Cc: stable@vger.kernel.org
Cc: Lukas Wunner <lukas@wunner.de>
Cc: Karol Herbst <karolherbst@gmail.com>
---
 drivers/gpu/drm/nouveau/nouveau_connector.c | 28 ++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
index 010d6db14cba..9714e09f17db 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -1114,6 +1114,32 @@ nouveau_connector_funcs_lvds = {
 	.atomic_get_property = nouveau_conn_atomic_get_property,
 };
 
+static void
+nouveau_connector_hotplug_probe(struct nouveau_connector *nv_conn)
+{
+	struct drm_modeset_acquire_ctx ctx;
+	struct drm_connector *conn = &nv_conn->base;
+	enum drm_connector_status old_status;
+	struct drm_device *dev = conn->dev;
+	bool changed;
+
+	mutex_lock(&dev->mode_config.mutex);
+
+	drm_modeset_acquire_init(&ctx, 0);
+	drm_modeset_lock(&dev->mode_config.connection_mutex, &ctx);
+
+	old_status = conn->status;
+	conn->status = drm_helper_probe_detect(conn, &ctx, true);
+	changed = old_status != conn->status;
+
+	drm_modeset_drop_locks(&ctx);
+	drm_modeset_acquire_fini(&ctx);
+	mutex_unlock(&dev->mode_config.mutex);
+
+	if (changed)
+		drm_kms_helper_hotplug_event(dev);
+}
+
 static int
 nouveau_connector_hotplug(struct nvif_notify *notify)
 {
@@ -1138,7 +1164,7 @@ nouveau_connector_hotplug(struct nvif_notify *notify)
 				nv50_mstm_remove(nv_encoder->dp.mstm);
 		}
 
-		drm_helper_hpd_irq_event(connector->dev);
+		nouveau_connector_hotplug_probe(nv_connector);
 	}
 
 	return NVIF_NOTIFY_KEEP;
-- 
2.17.1

From: Lyude Paul <lyude@redhat.com>
Subject: [PATCH] drm/nouveau: Grab runtime PM ref in nv50_mstc_detect()
Date: Fri, 14 Sep 2018 16:44:03 -0400
Message-ID: <20180914204407.1214-1-lyude@redhat.com>
Return-path: <stable-owner@vger.kernel.org>
Sender: stable-owner@vger.kernel.org
To: nouveau@lists.freedesktop.org
Cc: stable@vger.kernel.org, Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>, =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, Sean Paul <seanpaul@chromium.org>, Ilia Mirkin <imirkin@alum.mit.edu>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

While we currently grab a runtime PM ref in nouveau's normal connector
detection code, we apparently don't do this for MST. This means if we're
in a scenario where the GPU is suspended and userspace attempts to do a
connector probe on an MSTC connector, the probe will fail entirely due
to the DP aux channel and GPU not being woken up:

[  316.633489] nouveau 0000:01:00.0: i2c: aux 000a: begin idle timeout ffffffff
[  316.635713] nouveau 0000:01:00.0: i2c: aux 000a: begin idle timeout ffffffff
[  316.637785] nouveau 0000:01:00.0: i2c: aux 000a: begin idle timeout ffffffff
...

So, grab a runtime PM ref here.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Cc: stable@vger.kernel.org
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index c94b7f42d62d..9da0bdfe1e1c 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -938,9 +938,22 @@ static enum drm_connector_status
 nv50_mstc_detect(struct drm_connector *connector, bool force)
 {
 	struct nv50_mstc *mstc = nv50_mstc(connector);
+	enum drm_connector_status conn_status;
+	int ret;
+
 	if (!mstc->port)
 		return connector_status_disconnected;
-	return drm_dp_mst_detect_port(connector, mstc->port->mgr, mstc->port);
+
+	ret = pm_runtime_get_sync(connector->dev->dev);
+	if (ret < 0 && ret != -EACCES)
+		return connector_status_disconnected;
+
+	conn_status = drm_dp_mst_detect_port(connector, mstc->port->mgr,
+					     mstc->port);
+
+	pm_runtime_mark_last_busy(connector->dev->dev);
+	pm_runtime_put_autosuspend(connector->dev->dev);
+	return conn_status;
 }
 
 static void
-- 
2.17.1

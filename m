From: Lyude Paul <lyude@redhat.com>
Subject: [PATCH v4 5/8] drm/nouveau: Use pm_runtime_get_noresume() in connector_detect()
Date: Wed,  1 Aug 2018 17:14:55 -0400
Message-ID: <20180801211459.7731-6-lyude@redhat.com>
References: <20180801211459.7731-1-lyude@redhat.com>
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20180801211459.7731-1-lyude@redhat.com>
Sender: stable-owner@vger.kernel.org
To: nouveau@lists.freedesktop.org
Cc: stable@vger.kernel.org, Lukas Wunner <lukas@wunner.de>, Karol Herbst <karolherbst@gmail.com>, Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

It's true we can't resume the device from poll workers in
nouveau_connector_detect(). We can however, prevent the autosuspend
timer from elapsing immediately if it hasn't already without risking any
sort of deadlock with the runtime suspend/resume operations. So do that
instead of entirely avoiding grabbing a power reference.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Cc: stable@vger.kernel.org
Cc: Lukas Wunner <lukas@wunner.de>
Cc: Karol Herbst <karolherbst@gmail.com>
---
 drivers/gpu/drm/nouveau/nouveau_connector.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
index 2a45b4c2ceb0..010d6db14cba 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -572,12 +572,16 @@ nouveau_connector_detect(struct drm_connector *connector, bool force)
 		nv_connector->edid = NULL;
 	}
 
-	/* Outputs are only polled while runtime active, so acquiring a
-	 * runtime PM ref here is unnecessary (and would deadlock upon
-	 * runtime suspend because it waits for polling to finish).
+	/* Outputs are only polled while runtime active, so resuming the
+	 * device here is unnecessary (and would deadlock upon runtime suspend
+	 * because it waits for polling to finish). We do however, want to
+	 * prevent the autosuspend timer from elapsing during this operation
+	 * if possible.
 	 */
-	if (!drm_kms_helper_is_poll_worker()) {
-		ret = pm_runtime_get_sync(connector->dev->dev);
+	if (drm_kms_helper_is_poll_worker()) {
+		pm_runtime_get_noresume(dev->dev);
+	} else {
+		ret = pm_runtime_get_sync(dev->dev);
 		if (ret < 0 && ret != -EACCES)
 			return conn_status;
 	}
@@ -655,10 +659,8 @@ nouveau_connector_detect(struct drm_connector *connector, bool force)
 
  out:
 
-	if (!drm_kms_helper_is_poll_worker()) {
-		pm_runtime_mark_last_busy(connector->dev->dev);
-		pm_runtime_put_autosuspend(connector->dev->dev);
-	}
+	pm_runtime_mark_last_busy(dev->dev);
+	pm_runtime_put_autosuspend(dev->dev);
 
 	return conn_status;
 }
-- 
2.17.1

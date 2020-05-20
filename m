From: Dinghao Liu <dinghao.liu@zju.edu.cn>
Subject: [PATCH] drm/nouveau/dispnv50: fix runtime pm imbalance on error
Date: Wed, 20 May 2020 18:47:48 +0800
Message-ID: <20200520104750.21335-1-dinghao.liu@zju.edu.cn>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dinghao.liu@zju.edu.cn, kjlu@umn.edu
Cc: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Lyude Paul <lyude@redhat.com>, Sean Paul <seanpaul@chromium.org>, Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>, Alex Deucher <alexander.deucher@amd.com>, Takashi Iwai <tiwai@suse.de>, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

pm_runtime_get_sync() increments the runtime PM usage counter even
the call returns an error code. Thus a pairing decrement is needed
on the error handling path to keep the counter balanced.

Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 6be9df1820c5..e670756664ff 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -1123,8 +1123,10 @@ nv50_mstc_detect(struct drm_connector *connector,
 		return connector_status_disconnected;
 
 	ret = pm_runtime_get_sync(connector->dev->dev);
-	if (ret < 0 && ret != -EACCES)
+	if (ret < 0 && ret != -EACCES) {
+		pm_runtime_put_autosuspend(connector->dev->dev);
 		return connector_status_disconnected;
+	}
 
 	ret = drm_dp_mst_detect_port(connector, ctx, mstc->port->mgr,
 				     mstc->port);
-- 
2.17.1

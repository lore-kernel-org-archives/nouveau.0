From: Lyude Paul <lyude@redhat.com>
Subject: [PATCH 4/6] drm/nouveau: Stop reading port->mgr in nv50_mstc_detect()
Date: Fri, 16 Nov 2018 19:21:18 -0500
Message-ID: <20181117002120.28703-5-lyude@redhat.com>
References: <20181117002120.28703-1-lyude@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20181117002120.28703-1-lyude@redhat.com>
Sender: stable-owner@vger.kernel.org
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org
Cc: Lyude Paul <lyude@redhat.com>, stable@vger.kernel.org
List-Id: nouveau.vger.kernel.org

Same as the previous commit, but for nv50_mstc_detect() this time.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Cc: stable@vger.kernel.org
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 66c40b56a0cb..a08dd827e892 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -930,7 +930,7 @@ nv50_mstc_detect(struct drm_connector *connector, bool force)
 	if (ret < 0 && ret != -EACCES)
 		return connector_status_disconnected;
 
-	conn_status = drm_dp_mst_detect_port(connector, mstc->port->mgr,
+	conn_status = drm_dp_mst_detect_port(connector, &mstc->mstm->mgr,
 					     mstc->port);
 
 	pm_runtime_mark_last_busy(connector->dev->dev);
-- 
2.19.1

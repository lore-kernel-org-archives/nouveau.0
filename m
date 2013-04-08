From: Maarten Lankhorst <maarten.lankhorst@canonical.com>
Subject: [PATCH] drm/nouveau: idle all channels before suspending
Date: Mon, 08 Apr 2013 14:04:01 +0200
Message-ID: <5162B231.2060900@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: nouveau@lists.freedesktop.org
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

Seems to make suspend slightly more reliable on my system.

Cc: stable@vger.kernel.org [3.7+]
Signed-off-by: Maarten Lankhorst <maarten.lankhorst@canonical.com>
---
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index b6bdc9f..5032c31 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -464,6 +464,23 @@ nouveau_do_suspend(struct drm_device *dev)
 	NV_INFO(drm, "evicting buffers...\n");
 	ttm_bo_evict_mm(&drm->ttm.bdev, TTM_PL_VRAM);
 
+	list_for_each_entry(cli, &drm->clients, head) {
+		struct nouveau_abi16 *abi16 = cli->abi16;
+		struct nouveau_abi16_chan *chan;
+
+		if (!abi16)
+			continue;
+
+		list_for_each_entry(chan, &abi16->channels, head)
+			nouveau_channel_idle(chan->chan);
+	}
+
+	if (drm->channel)
+		nouveau_channel_idle(drm->channel);
+
+	if (drm->cechan)
+		nouveau_channel_idle(drm->cechan);
+
 	if (drm->fence && nouveau_fence(drm)->suspend) {
 		if (!nouveau_fence(drm)->suspend(drm))
 			return -ENOMEM;

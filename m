From: Lyude Paul <lyude@redhat.com>
Subject: [PATCH v6 1/5] drm/nouveau: Fix bogus drm_kms_helper_poll_enable() placement
Date: Mon, 13 Aug 2018 15:06:59 -0400
Message-ID: <20180813190706.24172-2-lyude@redhat.com>
References: <20180813190706.24172-1-lyude@redhat.com>
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20180813190706.24172-1-lyude@redhat.com>
Sender: stable-owner@vger.kernel.org
To: nouveau@lists.freedesktop.org
Cc: Lukas Wunner <lukas@wunner.de>, Peter Ujfalusi <peter.ujfalusi@ti.com>, stable@vger.kernel.org, Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

Turns out this part is my fault for not noticing when reviewing
9a2eba337cace ("drm/nouveau: Fix drm poll_helper handling"). Currently
we call drm_kms_helper_poll_enable() from nouveau_display_hpd_work().
This makes basically no sense however, because that means we're calling
drm_kms_helper_poll_enable() every time we schedule the hotplug
detection work. This is also against the advice mentioned in
drm_kms_helper_poll_enable()'s documentation:

 Note that calls to enable and disable polling must be strictly ordered,
 which is automatically the case when they're only call from
 suspend/resume callbacks.

Of course, hotplugs can't really be ordered. They could even happen
immediately after we called drm_kms_helper_poll_disable() in
nouveau_display_fini(), which can lead to all sorts of issues.

Additionally; enabling polling /after/ we call
drm_helper_hpd_irq_event() could also mean that we'd miss a hotplug
event anyway, since drm_helper_hpd_irq_event() wouldn't bother trying to
probe connectors so long as polling is disabled.

So; simply move this back into nouveau_display_init() again. The race
condition that both of these patches attempted to work around has
already been fixed properly in

  d61a5c106351 ("drm/nouveau: Fix deadlock on runtime suspend")

Fixes: 9a2eba337cace ("drm/nouveau: Fix drm poll_helper handling")
Signed-off-by: Lyude Paul <lyude@redhat.com>
Cc: Lukas Wunner <lukas@wunner.de>
Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: stable@vger.kernel.org
---
 drivers/gpu/drm/nouveau/nouveau_display.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
index ec7861457b84..1d36ab5d4796 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.c
+++ b/drivers/gpu/drm/nouveau/nouveau_display.c
@@ -355,8 +355,6 @@ nouveau_display_hpd_work(struct work_struct *work)
 	pm_runtime_get_sync(drm->dev->dev);
 
 	drm_helper_hpd_irq_event(drm->dev);
-	/* enable polling for external displays */
-	drm_kms_helper_poll_enable(drm->dev);
 
 	pm_runtime_mark_last_busy(drm->dev->dev);
 	pm_runtime_put_sync(drm->dev->dev);
@@ -411,6 +409,11 @@ nouveau_display_init(struct drm_device *dev)
 	if (ret)
 		return ret;
 
+	/* enable connector detection and polling for connectors without HPD
+	 * support
+	 */
+	drm_kms_helper_poll_enable(dev);
+
 	/* enable hotplug interrupts */
 	drm_connector_list_iter_begin(dev, &conn_iter);
 	nouveau_for_each_non_mst_connector_iter(connector, &conn_iter) {
-- 
2.17.1

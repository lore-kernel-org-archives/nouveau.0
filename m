From: Maarten Lankhorst <maarten.lankhorst@canonical.com>
Subject: [PATCH 2/2] drm/nouveau: require cli->mutex in RING_SPACE
Date: Tue, 14 Jan 2014 16:52:35 +0100
Message-ID: <52D55D43.4070805@canonical.com>
References: <52D55C6A.80804@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <52D55C6A.80804@canonical.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
To: Ben Skeggs <bskeggs@redhat.com>
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

There are some cases where it's fine to not hold the cli->mutex, but in those cases we
are the only caller and we should really be able to acquire cli->mutex without blocking.

This patch will prevent future occurrences where commands are sent to a channel without
proper locking.

Signed-off-by: Maarten Lankhorst<maarten.lankhorst@canonical.com>
---
diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c b/drivers/gpu/drm/nouveau/nouveau_abi16.c
index 900fae01793e..20959e445d05 100644
--- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
+++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
@@ -153,10 +153,12 @@ nouveau_abi16_fini(struct nouveau_abi16 *abi16)
  	struct nouveau_cli *cli = (void *)abi16->client;
  	struct nouveau_abi16_chan *chan, *temp;
  
+	mutex_lock(&cli->mutex);
  	/* cleanup channels */
  	list_for_each_entry_safe(chan, temp, &abi16->channels, head) {
  		nouveau_abi16_chan_fini(abi16, chan);
  	}
+	mutex_unlock(&cli->mutex);
  
  	/* destroy the device object */
  	nouveau_object_del(abi16->client, NVDRM_CLIENT, NVDRM_DEVICE);
diff --git a/drivers/gpu/drm/nouveau/nouveau_dma.h b/drivers/gpu/drm/nouveau/nouveau_dma.h
index 984004d66a6d..82465bd0b59b 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dma.h
+++ b/drivers/gpu/drm/nouveau/nouveau_dma.h
@@ -107,6 +107,7 @@ RING_SPACE(struct nouveau_channel *chan, int size)
  {
  	int ret;
  
+	lockdep_assert_held(&chan->cli->mutex);
  	ret = nouveau_dma_wait(chan, 1, size);
  	if (ret)
  		return ret;
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index f7a6568cfa6a..a60c404d59e4 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -476,7 +476,9 @@ nouveau_drm_load(struct drm_device *dev, unsigned long flags)
  
  	nouveau_sysfs_init(dev);
  	nouveau_hwmon_init(dev);
+	mutex_lock(&drm->client.mutex);
  	nouveau_accel_init(drm);
+	mutex_unlock(&drm->client.mutex);
  	nouveau_fbcon_init(dev);
  
  	if (nouveau_runtime_pm != 0) {
@@ -562,17 +564,17 @@ nouveau_do_suspend(struct drm_device *dev)
  	ttm_bo_evict_mm(&drm->ttm.bdev, TTM_PL_VRAM);
  
  	NV_INFO(drm, "waiting for kernel channels to go idle...\n");
-	if (drm->cechan) {
+	ret = 0;
+	mutex_lock(&drm->client.mutex);
+	if (drm->cechan)
  		ret = nouveau_channel_idle(drm->cechan);
-		if (ret)
-			return ret;
-	}
  
-	if (drm->channel) {
+	if (drm->channel && !ret)
  		ret = nouveau_channel_idle(drm->channel);
-		if (ret)
-			return ret;
-	}
+	mutex_unlock(&drm->client.mutex);
+	if (ret)
+		return ret;
+
  
  	NV_INFO(drm, "suspending client object trees...\n");
  	if (drm->fence && nouveau_fence(drm)->suspend) {
diff --git a/drivers/gpu/drm/nouveau/nouveau_fbcon.c b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
index 7903e0ed3c75..aec87e1d3855 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fbcon.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
@@ -357,7 +357,7 @@ nouveau_fbcon_create(struct drm_fb_helper *helper,
  
  	mutex_unlock(&dev->struct_mutex);
  
-	if (chan) {
+	if (chan && !WARN_ON(!mutex_trylock(&drm->client.mutex))) {
  		ret = -ENODEV;
  		if (device->card_type < NV_50)
  			ret = nv04_fbcon_accel_init(info);
@@ -366,6 +366,7 @@ nouveau_fbcon_create(struct drm_fb_helper *helper,
  			ret = nv50_fbcon_accel_init(info);
  		else
  			ret = nvc0_fbcon_accel_init(info);
+		mutex_unlock(&drm->client.mutex);
  
  		if (ret == 0)
  			info->fbops = &nouveau_fbcon_ops;

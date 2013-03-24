From: Maarten Lankhorst <maarten.lankhorst@canonical.com>
Subject: [PATCH] drm/nouveau: fix handling empty channel list in ioctl's
Date: Sun, 24 Mar 2013 15:36:38 +0100
Message-ID: <514F0F76.5090709@canonical.com>
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

If there are no channels, chan would never end up being NULL,
and so the null pointer check would fail.

Solve this by initializing chan to NULL, and iterating over temp instead.

Fixes oops when running intel-gpu-tools/tests/kms_flip, which attempts to
do some intel ioctl's on a nouveau device.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@canonical.com>
Cc: stable@vger.kernel.org [3.7+]

---
diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c b/drivers/gpu/drm/nouveau/nouveau_abi16.c
index 3b6dc88..5eb3e0d 100644
--- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
+++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
@@ -391,7 +391,7 @@ nouveau_abi16_ioctl_notifierobj_alloc(ABI16_IOCTL_ARGS)
 	struct nouveau_drm *drm = nouveau_drm(dev);
 	struct nouveau_device *device = nv_device(drm->device);
 	struct nouveau_abi16 *abi16 = nouveau_abi16_get(file_priv, dev);
-	struct nouveau_abi16_chan *chan, *temp;
+	struct nouveau_abi16_chan *chan = NULL, *temp;
 	struct nouveau_abi16_ntfy *ntfy;
 	struct nouveau_object *object;
 	struct nv_dma_class args = {};
@@ -404,10 +404,11 @@ nouveau_abi16_ioctl_notifierobj_alloc(ABI16_IOCTL_ARGS)
 	if (unlikely(nv_device(abi16->device)->card_type >= NV_C0))
 		return nouveau_abi16_put(abi16, -EINVAL);
 
-	list_for_each_entry_safe(chan, temp, &abi16->channels, head) {
-		if (chan->chan->handle == (NVDRM_CHAN | info->channel))
+	list_for_each_entry(temp, &abi16->channels, head) {
+		if (temp->chan->handle == (NVDRM_CHAN | info->channel)) {
+			chan = temp;
 			break;
-		chan = NULL;
+		}
 	}
 
 	if (!chan)
@@ -459,17 +460,18 @@ nouveau_abi16_ioctl_gpuobj_free(ABI16_IOCTL_ARGS)
 {
 	struct drm_nouveau_gpuobj_free *fini = data;
 	struct nouveau_abi16 *abi16 = nouveau_abi16_get(file_priv, dev);
-	struct nouveau_abi16_chan *chan, *temp;
+	struct nouveau_abi16_chan *chan = NULL, *temp;
 	struct nouveau_abi16_ntfy *ntfy;
 	int ret;
 
 	if (unlikely(!abi16))
 		return -ENOMEM;
 
-	list_for_each_entry_safe(chan, temp, &abi16->channels, head) {
-		if (chan->chan->handle == (NVDRM_CHAN | fini->channel))
+	list_for_each_entry(temp, &abi16->channels, head) {
+		if (temp->chan->handle == (NVDRM_CHAN | fini->channel)) {
+			chan = temp;
 			break;
-		chan = NULL;
+		}
 	}
 
 	if (!chan)

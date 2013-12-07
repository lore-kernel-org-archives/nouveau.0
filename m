From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: [PATCH] drm/nouveau/falcon: use vmalloc to create firwmare copies
Date: Sat,  7 Dec 2013 11:42:19 -0500
Message-ID: <1386434539-29188-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
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
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

Some firmware images may be large (64K), so using kmalloc memory is
inappropriate for them. Use vmalloc instead, to avoid high-order
allocation failures.

Signed-off-by: Ilia Mirkin <imirkin@alum.mit.edu>
Cc: stable@vger.kernel.org
---

Couldn't get video decoding started on a long-running system due to high-order
allocation failures. This seems like a fine use-case for vmalloc.

 drivers/gpu/drm/nouveau/core/engine/falcon.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/core/engine/falcon.c b/drivers/gpu/drm/nouveau/core/engine/falcon.c
index e03fc8e..5e077e4 100644
--- a/drivers/gpu/drm/nouveau/core/engine/falcon.c
+++ b/drivers/gpu/drm/nouveau/core/engine/falcon.c
@@ -56,6 +56,16 @@ _nouveau_falcon_wr32(struct nouveau_object *object, u64 addr, u32 data)
 	nv_wr32(falcon, falcon->addr + addr, data);
 }
 
+static void *
+vmemdup(const void *src, size_t len)
+{
+	void *p = vmalloc(len);
+
+	if (p)
+		memcpy(p, src, len);
+	return p;
+}
+
 int
 _nouveau_falcon_init(struct nouveau_object *object)
 {
@@ -111,7 +121,7 @@ _nouveau_falcon_init(struct nouveau_object *object)
 
 		ret = request_firmware(&fw, name, &device->pdev->dev);
 		if (ret == 0) {
-			falcon->code.data = kmemdup(fw->data, fw->size, GFP_KERNEL);
+			falcon->code.data = vmemdup(fw->data, fw->size);
 			falcon->code.size = fw->size;
 			falcon->data.data = NULL;
 			falcon->data.size = 0;
@@ -134,7 +144,7 @@ _nouveau_falcon_init(struct nouveau_object *object)
 			return ret;
 		}
 
-		falcon->data.data = kmemdup(fw->data, fw->size, GFP_KERNEL);
+		falcon->data.data = vmemdup(fw->data, fw->size);
 		falcon->data.size = fw->size;
 		release_firmware(fw);
 		if (!falcon->data.data)
@@ -149,7 +159,7 @@ _nouveau_falcon_init(struct nouveau_object *object)
 			return ret;
 		}
 
-		falcon->code.data = kmemdup(fw->data, fw->size, GFP_KERNEL);
+		falcon->code.data = vmemdup(fw->data, fw->size);
 		falcon->code.size = fw->size;
 		release_firmware(fw);
 		if (!falcon->code.data)
@@ -235,8 +245,8 @@ _nouveau_falcon_fini(struct nouveau_object *object, bool suspend)
 	if (!suspend) {
 		nouveau_gpuobj_ref(NULL, &falcon->core);
 		if (falcon->external) {
-			kfree(falcon->data.data);
-			kfree(falcon->code.data);
+			vfree(falcon->data.data);
+			vfree(falcon->code.data);
 			falcon->code.data = NULL;
 		}
 	}
-- 
1.8.3.2

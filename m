From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: [PATCH v2] drm/nouveau: use nv_debug for NV_DEBUG,
	make DRM a separate subflag
Date: Thu, 13 Feb 2014 21:35:14 -0500
Message-ID: <1392345314-29394-1-git-send-email-imirkin@alum.mit.edu>
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
To: Ben Skeggs <bskeggs@redhat.com>, nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

It's really confusing for NV_DEBUG's printing to be controlled via
drm.debug while everything else is controlled via nouveau.debug. These
messages can be turned on with nouveau.debug=DRM=debug.

Signed-off-by: Ilia Mirkin <imirkin@alum.mit.edu>
---

Updated version that makes the top-level DRM client have a separate debug flag
from everything else, since it presents debug info that's interesting for a
very different set of use-cases.

 drivers/gpu/drm/nouveau/nouveau_drm.c | 2 ++
 drivers/gpu/drm/nouveau/nouveau_drm.h | 5 +----
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 1c7c8a7..9c9ce4d 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -33,6 +33,7 @@
 #include <core/client.h>
 #include <core/gpuobj.h>
 #include <core/class.h>
+#include <core/option.h>
 
 #include <engine/device.h>
 #include <engine/disp.h>
@@ -335,6 +336,7 @@ nouveau_drm_load(struct drm_device *dev, unsigned long flags)
 
 	dev->dev_private = drm;
 	drm->dev = dev;
+	nouveau_client(drm)->debug = nouveau_dbgopt(nouveau_debug, "DRM");
 
 	INIT_LIST_HEAD(&drm->clients);
 	spin_lock_init(&drm->tile.lock);
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.h b/drivers/gpu/drm/nouveau/nouveau_drm.h
index 23ca7a5..7efbafa 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.h
@@ -161,10 +161,7 @@ int nouveau_pmops_resume(struct device *);
 #define NV_ERROR(cli, fmt, args...) nv_error((cli), fmt, ##args)
 #define NV_WARN(cli, fmt, args...) nv_warn((cli), fmt, ##args)
 #define NV_INFO(cli, fmt, args...) nv_info((cli), fmt, ##args)
-#define NV_DEBUG(cli, fmt, args...) do {                                       \
-	if (drm_debug & DRM_UT_DRIVER)                                         \
-		nv_info((cli), fmt, ##args);                                   \
-} while (0)
+#define NV_DEBUG(cli, fmt, args...) nv_debug((cli), fmt, ##args)
 
 extern int nouveau_modeset;
 
-- 
1.8.3.2

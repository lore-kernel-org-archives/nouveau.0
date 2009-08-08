From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: [PATCH 1/7] drm/nouveau: sparse cleanups for undeclared
	vs. static
Date: Sat,  8 Aug 2009 10:38:56 +0300
Message-ID: <1249717142-6302-1-git-send-email-pq@iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Module parameters declarations moved to nouveau_drv.h.
Ioctl table declarations moved to nouveau_drv.h.
nouveau_ioc32.c: include nouveau_drv.h for nouveau_compat_ioctl().

Signed-off-by: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_bios.c      |    3 ---
 drivers/gpu/drm/nouveau/nouveau_connector.c |    2 --
 drivers/gpu/drm/nouveau/nouveau_drv.c       |    3 ---
 drivers/gpu/drm/nouveau/nouveau_drv.h       |    9 +++++++++
 drivers/gpu/drm/nouveau/nouveau_fbcon.c     |    2 --
 drivers/gpu/drm/nouveau/nouveau_ioc32.c     |    2 +-
 drivers/gpu/drm/nouveau/nouveau_mem.c       |    2 --
 7 files changed, 10 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bios.c b/drivers/gpu/drm/nouveau/nouveau_bios.c
index d61e717..d3f052a 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bios.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bios.c
@@ -3249,9 +3249,6 @@ int nouveau_bios_parse_lvds_table(struct drm_device *dev, int pxclk, bool *dl, b
 	return 0;
 }
 
-extern int nouveau_uscript_lvds;
-extern int nouveau_uscript_tmds;
-
 int
 nouveau_bios_run_display_table(struct drm_device *dev, struct dcb_entry *dcbent,
 			       int pxclk)
diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
index 5015f75..c89bef7 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -34,8 +34,6 @@
 #include "nouveau_connector.h"
 #include "nouveau_hw.h"
 
-extern int nouveau_duallink;
-
 static struct nouveau_encoder *
 nouveau_connector_encoder_get(struct drm_connector *connector, int type)
 {
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.c b/drivers/gpu/drm/nouveau/nouveau_drv.c
index c9b169f..bdee0dc 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.c
@@ -277,9 +277,6 @@ nouveau_pci_resume(struct pci_dev *pdev)
 	return 0;
 }
 
-extern struct drm_ioctl_desc nouveau_ioctls[];
-extern int nouveau_max_ioctl;
-
 static struct drm_driver driver = {
 	.driver_features =
 		DRIVER_USE_AGP | DRIVER_PCI_DMA | DRIVER_SG |
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index 25510b3..fa89b14 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -606,6 +606,13 @@ nouveau_bo_ref(struct nouveau_bo *ref, struct nouveau_bo **pnvbo)
 	(ch) = nv->fifos[(id)];                                  \
 } while(0)
 
+/* nouveau_drv.c */
+extern int nouveau_noagp;
+extern int nouveau_duallink;
+extern int nouveau_uscript_lvds;
+extern int nouveau_uscript_tmds;
+extern int nouveau_fbpercrtc;
+
 /* nouveau_state.c */
 extern void nouveau_preclose(struct drm_device *dev, struct drm_file *);
 extern int  nouveau_load(struct drm_device *, unsigned long flags);
@@ -658,6 +665,8 @@ extern int  nouveau_ioctl_notifier_free(struct drm_device *, void *data,
 					struct drm_file *);
 
 /* nouveau_fifo.c */
+extern struct drm_ioctl_desc nouveau_ioctls[];
+extern int nouveau_max_ioctl;
 extern int  nouveau_fifo_init(struct drm_device *);
 extern int  nouveau_fifo_ctx_size(struct drm_device *);
 extern void nouveau_fifo_cleanup(struct drm_device *, struct drm_file *);
diff --git a/drivers/gpu/drm/nouveau/nouveau_fbcon.c b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
index 601eabe..bc229cb 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fbcon.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
@@ -47,8 +47,6 @@
 #include "nouveau_fbcon.h"
 #include "nouveau_dma.h"
 
-extern int nouveau_fbpercrtc;
-
 static int
 nouveau_fbcon_sync(struct fb_info *info)
 {
diff --git a/drivers/gpu/drm/nouveau/nouveau_ioc32.c b/drivers/gpu/drm/nouveau/nouveau_ioc32.c
index f55ae7a..a2c30f4 100644
--- a/drivers/gpu/drm/nouveau/nouveau_ioc32.c
+++ b/drivers/gpu/drm/nouveau/nouveau_ioc32.c
@@ -36,7 +36,7 @@
 #include "drmP.h"
 #include "drm.h"
 
-#include "nouveau_drm.h"
+#include "nouveau_drv.h"
 
 /**
  * Called whenever a 32-bit process running under a 64-bit kernel
diff --git a/drivers/gpu/drm/nouveau/nouveau_mem.c b/drivers/gpu/drm/nouveau/nouveau_mem.c
index ff473c5..01160fe 100644
--- a/drivers/gpu/drm/nouveau/nouveau_mem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_mem.c
@@ -35,8 +35,6 @@
 #include "drm_sarea.h"
 #include "nouveau_drv.h"
 
-extern int nouveau_noagp;
-
 static struct mem_block *
 split_block(struct mem_block *p, uint64_t start, uint64_t size,
 	    struct drm_file *file_priv)
-- 
1.6.3.3

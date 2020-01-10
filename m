From: Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>
Subject: [PATCH 13/23] drm/gma500: Convert to CRTC VBLANK
 callbacks
Date: Fri, 10 Jan 2020 10:21:17 +0100
Message-ID: <20200110092127.27847-14-tzimmermann@suse.de>
References: <20200110092127.27847-1-tzimmermann@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20200110092127.27847-1-tzimmermann-l3A5Bk7waGM@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Freedreno" <freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: airlied-cv59FeDIM0c@public.gmane.org, daniel-/w4YWyX8dFk@public.gmane.org, alexander.deucher-5C7GfCeVMHo@public.gmane.org, christian.koenig-5C7GfCeVMHo@public.gmane.org, David1.Zhou-5C7GfCeVMHo@public.gmane.org, maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, patrik.r.jakobsson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sean-p7yTbzM4H96eqtR555YLDQ@public.gmane.org, benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, vincent.abriou-qxv4g6HH51o@public.gmane.org, yannick.fertre-qxv4g6HH51o@public.gmane.org, philippe.cornu-qxv4g6HH51o@public.gmane.org, mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alexandre.torgue-qxv4g6HH51o@public.gmane.org, eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org, rodrigosiqueiramelo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, hamohammed.sa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-graphics-maintainer-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org, thellstrom-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org, bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, harry.wentland-5C7GfCeVMHo@public.gmane.org, sunpeng.li-5C7GfCeVMHo@public.gmane.org, jani.nikula-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, joonas.lahtinen-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, rodrigo.vivi-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org
Cc: linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

VBLANK callbacks in struct drm_driver are deprecated in favor of
their equivalents in struct drm_crtc_funcs. Convert gma500 over.

Signed-off-by: Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>
---
 drivers/gpu/drm/gma500/cdv_intel_display.c |  3 +++
 drivers/gpu/drm/gma500/psb_drv.c           |  4 ----
 drivers/gpu/drm/gma500/psb_drv.h           |  6 +++---
 drivers/gpu/drm/gma500/psb_intel_display.c |  3 +++
 drivers/gpu/drm/gma500/psb_irq.c           | 12 +++++++++---
 drivers/gpu/drm/gma500/psb_irq.h           |  7 ++++---
 6 files changed, 22 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/gma500/cdv_intel_display.c b/drivers/gpu/drm/gma500/cdv_intel_display.c
index 1ed854f498b7..686385a66167 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_display.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_display.c
@@ -977,6 +977,9 @@ const struct drm_crtc_funcs cdv_intel_crtc_funcs = {
 	.set_config = gma_crtc_set_config,
 	.destroy = gma_crtc_destroy,
 	.page_flip = gma_crtc_page_flip,
+	.enable_vblank = psb_enable_vblank,
+	.disable_vblank = psb_disable_vblank,
+	.get_vblank_counter = psb_get_vblank_counter,
 };
 
 const struct gma_clock_funcs cdv_clock_funcs = {
diff --git a/drivers/gpu/drm/gma500/psb_drv.c b/drivers/gpu/drm/gma500/psb_drv.c
index 52591416f8fe..36cb292fdebe 100644
--- a/drivers/gpu/drm/gma500/psb_drv.c
+++ b/drivers/gpu/drm/gma500/psb_drv.c
@@ -363,7 +363,6 @@ static int psb_driver_load(struct drm_device *dev, unsigned long flags)
 	drm_irq_install(dev, dev->pdev->irq);
 
 	dev->max_vblank_count = 0xffffff; /* only 24 bits of frame count */
-	dev->driver->get_vblank_counter = psb_get_vblank_counter;
 
 	psb_modeset_init(dev);
 	psb_fbdev_init(dev);
@@ -507,9 +506,6 @@ static struct drm_driver driver = {
 	.irq_postinstall = psb_irq_postinstall,
 	.irq_uninstall = psb_irq_uninstall,
 	.irq_handler = psb_irq_handler,
-	.enable_vblank = psb_enable_vblank,
-	.disable_vblank = psb_disable_vblank,
-	.get_vblank_counter = psb_get_vblank_counter,
 
 	.gem_free_object = psb_gem_free_object,
 	.gem_vm_ops = &psb_gem_vm_ops,
diff --git a/drivers/gpu/drm/gma500/psb_drv.h b/drivers/gpu/drm/gma500/psb_drv.h
index 3d4ef3071d45..956926341316 100644
--- a/drivers/gpu/drm/gma500/psb_drv.h
+++ b/drivers/gpu/drm/gma500/psb_drv.h
@@ -681,15 +681,15 @@ extern void psb_irq_turn_off_dpst(struct drm_device *dev);
 extern void psb_irq_uninstall_islands(struct drm_device *dev, int hw_islands);
 extern int psb_vblank_wait2(struct drm_device *dev, unsigned int *sequence);
 extern int psb_vblank_wait(struct drm_device *dev, unsigned int *sequence);
-extern int psb_enable_vblank(struct drm_device *dev, unsigned int pipe);
-extern void psb_disable_vblank(struct drm_device *dev, unsigned int pipe);
+extern int psb_enable_vblank(struct drm_crtc *crtc);
+extern void psb_disable_vblank(struct drm_crtc *crtc);
 void
 psb_enable_pipestat(struct drm_psb_private *dev_priv, int pipe, u32 mask);
 
 void
 psb_disable_pipestat(struct drm_psb_private *dev_priv, int pipe, u32 mask);
 
-extern u32 psb_get_vblank_counter(struct drm_device *dev, unsigned int pipe);
+extern u32 psb_get_vblank_counter(struct drm_crtc *crtc);
 
 /* framebuffer.c */
 extern int psbfb_probed(struct drm_device *dev);
diff --git a/drivers/gpu/drm/gma500/psb_intel_display.c b/drivers/gpu/drm/gma500/psb_intel_display.c
index fed3b563e62e..531c5485be17 100644
--- a/drivers/gpu/drm/gma500/psb_intel_display.c
+++ b/drivers/gpu/drm/gma500/psb_intel_display.c
@@ -433,6 +433,9 @@ const struct drm_crtc_funcs psb_intel_crtc_funcs = {
 	.set_config = gma_crtc_set_config,
 	.destroy = gma_crtc_destroy,
 	.page_flip = gma_crtc_page_flip,
+	.enable_vblank = psb_enable_vblank,
+	.disable_vblank = psb_disable_vblank,
+	.get_vblank_counter = psb_get_vblank_counter,
 };
 
 const struct gma_clock_funcs psb_clock_funcs = {
diff --git a/drivers/gpu/drm/gma500/psb_irq.c b/drivers/gpu/drm/gma500/psb_irq.c
index 40a37e400b02..7ec031d28dc0 100644
--- a/drivers/gpu/drm/gma500/psb_irq.c
+++ b/drivers/gpu/drm/gma500/psb_irq.c
@@ -507,8 +507,10 @@ int psb_irq_disable_dpst(struct drm_device *dev)
 /*
  * It is used to enable VBLANK interrupt
  */
-int psb_enable_vblank(struct drm_device *dev, unsigned int pipe)
+int psb_enable_vblank(struct drm_crtc *crtc)
 {
+	struct drm_device *dev = crtc->dev;
+	unsigned int pipe = crtc->index;
 	struct drm_psb_private *dev_priv = dev->dev_private;
 	unsigned long irqflags;
 	uint32_t reg_val = 0;
@@ -546,8 +548,10 @@ int psb_enable_vblank(struct drm_device *dev, unsigned int pipe)
 /*
  * It is used to disable VBLANK interrupt
  */
-void psb_disable_vblank(struct drm_device *dev, unsigned int pipe)
+void psb_disable_vblank(struct drm_crtc *crtc)
 {
+	struct drm_device *dev = crtc->dev;
+	unsigned int pipe = crtc->index;
 	struct drm_psb_private *dev_priv = dev->dev_private;
 	unsigned long irqflags;
 
@@ -619,8 +623,10 @@ void mdfld_disable_te(struct drm_device *dev, int pipe)
 /* Called from drm generic code, passed a 'crtc', which
  * we use as a pipe index
  */
-u32 psb_get_vblank_counter(struct drm_device *dev, unsigned int pipe)
+u32 psb_get_vblank_counter(struct drm_crtc *crtc)
 {
+	struct drm_device *dev = crtc->dev;
+	unsigned int pipe = crtc->index;
 	uint32_t high_frame = PIPEAFRAMEHIGH;
 	uint32_t low_frame = PIPEAFRAMEPIXEL;
 	uint32_t pipeconf_reg = PIPEACONF;
diff --git a/drivers/gpu/drm/gma500/psb_irq.h b/drivers/gpu/drm/gma500/psb_irq.h
index 58fd502e3b9d..4f73998848d1 100644
--- a/drivers/gpu/drm/gma500/psb_irq.h
+++ b/drivers/gpu/drm/gma500/psb_irq.h
@@ -12,6 +12,7 @@
 #ifndef _PSB_IRQ_H_
 #define _PSB_IRQ_H_
 
+struct drm_crtc;
 struct drm_device;
 
 bool sysirq_init(struct drm_device *dev);
@@ -26,9 +27,9 @@ int psb_irq_enable_dpst(struct drm_device *dev);
 int psb_irq_disable_dpst(struct drm_device *dev);
 void psb_irq_turn_on_dpst(struct drm_device *dev);
 void psb_irq_turn_off_dpst(struct drm_device *dev);
-int  psb_enable_vblank(struct drm_device *dev, unsigned int pipe);
-void psb_disable_vblank(struct drm_device *dev, unsigned int pipe);
-u32  psb_get_vblank_counter(struct drm_device *dev, unsigned int pipe);
+int  psb_enable_vblank(struct drm_crtc *crtc);
+void psb_disable_vblank(struct drm_crtc *crtc);
+u32  psb_get_vblank_counter(struct drm_crtc *crtc);
 
 int mdfld_enable_te(struct drm_device *dev, int pipe);
 void mdfld_disable_te(struct drm_device *dev, int pipe);
-- 
2.24.1

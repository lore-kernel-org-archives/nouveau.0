From: Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Subject: [RFC PATCH] drm/nv50-nvd0: implement precise vblank
 timing support on nv50/nvc0.
Date: Mon, 12 Aug 2013 14:40:09 +0200
Message-ID: <5208D7A9.6010103@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Cc: Mario Kleiner <mario.kleiner-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Not as thoroughly tested as I would like. Newer nvd0 and kepler are unsupported,
as I don't know the registers yet.

Information of the scanout position is based on Lucas Stach's original patch,
with a teak to read vline twice, to prevent a race of hline with vline.

Cc: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Cc: Mario Kleiner <mario.kleiner-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org>
Signed-off-by: Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
---
diff --git a/drivers/gpu/drm/nouveau/core/engine/disp/nv50.c b/drivers/gpu/drm/nouveau/core/engine/disp/nv50.c
index c168ae3..96268b7 100644
--- a/drivers/gpu/drm/nouveau/core/engine/disp/nv50.c
+++ b/drivers/gpu/drm/nouveau/core/engine/disp/nv50.c
@@ -1285,6 +1285,57 @@ nv50_disp_intr(struct nouveau_subdev *subdev)
 	}
 }
 
+u32 nv50_disp_get_vblank_count(struct nouveau_disp *disp, int head)
+{
+	if (head < 0 || head >= 2)
+		return 0;
+
+	return nv_rd32(disp, 0x616340 + head * 0x800) >> 16;
+}
+
+int nv50_disp_get_scanoutpos(struct nouveau_disp *disp, int head, int *vpos, int *hpos)
+{
+	u32 reg, vbias, hbias, vbl_start, vbl_end, hline, vline;
+
+	if (head < 0 || head >= 2)
+		return -1;
+
+	reg = nv_rd32(disp, 0x610ae8 + head * 4);
+	vbias = reg >> 16;
+	hbias = reg & 0xffff;
+
+	vbl_start = nv_rd32(disp, 0x610af0 + head * 4) >> 16;
+	vbl_end = nv_rd32(disp, 0x610af8 + head * 4) >> 16;
+
+	reg = nv_rd32(disp, 0x616340 + head * 0x800) & 0xffff;
+	while (1) {
+		hline = nv_rd32(disp, 0x616344 + head * 0x800) & 0xffff;
+
+		vline = nv_rd32(disp, 0x616340 + head * 0x800) & 0xffff;
+		if (vline == reg)
+			break;
+
+		reg = vline;
+	}
+
+	if((vline >= vbl_start) || (vline < vbias)) {
+		/* we are in vblank so do a neg countdown */
+		vline -= vbias;
+		hline -= hbias;
+
+		if (vline > 0)
+			vline -= vbl_end;
+	} else {
+		/* apply corrective offset */
+		vline -= vbias;
+		hline -= hbias;
+	}
+
+	*vpos = vline;
+	*hpos = hline;
+	return 0;
+}
+
 static int
 nv50_disp_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 	       struct nouveau_oclass *oclass, void *data, u32 size,
@@ -1302,6 +1353,9 @@ nv50_disp_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 	nv_engine(priv)->sclass = nv50_disp_base_oclass;
 	nv_engine(priv)->cclass = &nv50_disp_cclass;
 	nv_subdev(priv)->intr = nv50_disp_intr;
+	priv->base.max_vblank_count = 0xffff;
+	priv->base.get_vblank_count = nv50_disp_get_vblank_count;
+	priv->base.get_scanoutpos = nv50_disp_get_scanoutpos;
 	INIT_WORK(&priv->supervisor, nv50_disp_intr_supervisor);
 	priv->sclass = nv50_disp_sclass;
 	priv->head.nr = 2;
diff --git a/drivers/gpu/drm/nouveau/core/engine/disp/nv50.h b/drivers/gpu/drm/nouveau/core/engine/disp/nv50.h
index 1ae6ceb..e3900ce 100644
--- a/drivers/gpu/drm/nouveau/core/engine/disp/nv50.h
+++ b/drivers/gpu/drm/nouveau/core/engine/disp/nv50.h
@@ -144,4 +144,7 @@ extern struct nouveau_oclass nvd0_disp_cclass;
 void nvd0_disp_intr_supervisor(struct work_struct *);
 void nvd0_disp_intr(struct nouveau_subdev *);
 
+u32 nv50_disp_get_vblank_count(struct nouveau_disp *disp, int head);
+int nv50_disp_get_scanoutpos(struct nouveau_disp *disp, int head, int *vpos, int *hpos);
+
 #endif
diff --git a/drivers/gpu/drm/nouveau/core/engine/disp/nv84.c b/drivers/gpu/drm/nouveau/core/engine/disp/nv84.c
index d8c74c0..df357cf 100644
--- a/drivers/gpu/drm/nouveau/core/engine/disp/nv84.c
+++ b/drivers/gpu/drm/nouveau/core/engine/disp/nv84.c
@@ -75,6 +75,9 @@ nv84_disp_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 	nv_engine(priv)->sclass = nv84_disp_base_oclass;
 	nv_engine(priv)->cclass = &nv50_disp_cclass;
 	nv_subdev(priv)->intr = nv50_disp_intr;
+	priv->base.max_vblank_count = 0xffff;
+	priv->base.get_vblank_count = nv50_disp_get_vblank_count;
+	priv->base.get_scanoutpos = nv50_disp_get_scanoutpos;
 	INIT_WORK(&priv->supervisor, nv50_disp_intr_supervisor);
 	priv->sclass = nv84_disp_sclass;
 	priv->head.nr = 2;
diff --git a/drivers/gpu/drm/nouveau/core/engine/disp/nv94.c b/drivers/gpu/drm/nouveau/core/engine/disp/nv94.c
index a66f949..38eafdf 100644
--- a/drivers/gpu/drm/nouveau/core/engine/disp/nv94.c
+++ b/drivers/gpu/drm/nouveau/core/engine/disp/nv94.c
@@ -75,6 +75,9 @@ nv94_disp_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 	nv_engine(priv)->sclass = nv94_disp_base_oclass;
 	nv_engine(priv)->cclass = &nv50_disp_cclass;
 	nv_subdev(priv)->intr = nv50_disp_intr;
+	priv->base.max_vblank_count = 0xffff;
+	priv->base.get_vblank_count = nv50_disp_get_vblank_count;
+	priv->base.get_scanoutpos = nv50_disp_get_scanoutpos;
 	INIT_WORK(&priv->supervisor, nv50_disp_intr_supervisor);
 	priv->sclass = nv94_disp_sclass;
 	priv->head.nr = 2;
diff --git a/drivers/gpu/drm/nouveau/core/engine/disp/nva0.c b/drivers/gpu/drm/nouveau/core/engine/disp/nva0.c
index 6cf8eef..4f02b8d 100644
--- a/drivers/gpu/drm/nouveau/core/engine/disp/nva0.c
+++ b/drivers/gpu/drm/nouveau/core/engine/disp/nva0.c
@@ -62,6 +62,9 @@ nva0_disp_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 	nv_engine(priv)->sclass = nva0_disp_base_oclass;
 	nv_engine(priv)->cclass = &nv50_disp_cclass;
 	nv_subdev(priv)->intr = nv50_disp_intr;
+	priv->base.max_vblank_count = 0xffff;
+	priv->base.get_vblank_count = nv50_disp_get_vblank_count;
+	priv->base.get_scanoutpos = nv50_disp_get_scanoutpos;
 	INIT_WORK(&priv->supervisor, nv50_disp_intr_supervisor);
 	priv->sclass = nva0_disp_sclass;
 	priv->head.nr = 2;
diff --git a/drivers/gpu/drm/nouveau/core/engine/disp/nva3.c b/drivers/gpu/drm/nouveau/core/engine/disp/nva3.c
index b754131..186f22e 100644
--- a/drivers/gpu/drm/nouveau/core/engine/disp/nva3.c
+++ b/drivers/gpu/drm/nouveau/core/engine/disp/nva3.c
@@ -77,6 +77,9 @@ nva3_disp_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 	nv_engine(priv)->cclass = &nv50_disp_cclass;
 	nv_subdev(priv)->intr = nv50_disp_intr;
 	INIT_WORK(&priv->supervisor, nv50_disp_intr_supervisor);
+	priv->base.max_vblank_count = 0xffff;
+	priv->base.get_vblank_count = nv50_disp_get_vblank_count;
+	priv->base.get_scanoutpos = nv50_disp_get_scanoutpos;
 	priv->sclass = nva3_disp_sclass;
 	priv->head.nr = 2;
 	priv->dac.nr = 3;
diff --git a/drivers/gpu/drm/nouveau/core/include/engine/disp.h b/drivers/gpu/drm/nouveau/core/include/engine/disp.h
index 4b21fab..8ba03db 100644
--- a/drivers/gpu/drm/nouveau/core/include/engine/disp.h
+++ b/drivers/gpu/drm/nouveau/core/include/engine/disp.h
@@ -9,6 +9,9 @@
 struct nouveau_disp {
 	struct nouveau_engine base;
 	struct nouveau_event *vblank;
+	u32 (*get_vblank_count)(struct nouveau_disp *disp, int head);
+	int (*get_scanoutpos)(struct nouveau_disp *disp, int head, int *vpos, int *hpos);
+	u32 max_vblank_count;
 };
 
 static inline struct nouveau_disp *
diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
index 2573604..edd8d07 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.c
+++ b/drivers/gpu/drm/nouveau/nouveau_display.c
@@ -579,7 +579,7 @@ nouveau_crtc_page_flip(struct drm_crtc *crtc, struct drm_framebuffer *fb,
 
 	/* Emit a page flip */
 	if (nv_device(drm->device)->card_type >= NV_50) {
-		ret = nv50_display_flip_next(crtc, fb, chan, 0);
+		ret = nv50_display_flip_next(crtc, fb, chan, 1);
 		if (ret)
 			goto fail_unreserve;
 	}
@@ -634,7 +634,7 @@ nouveau_finish_page_flip(struct nouveau_channel *chan,
 
 	s = list_first_entry(&fctx->flip, struct nouveau_page_flip_state, head);
 	if (s->event)
-		drm_send_vblank_event(dev, -1, s->event);
+		drm_send_vblank_event(dev, s->crtc, s->event);
 
 	list_del(&s->head);
 	if (ps)
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index bd301f4..9a73aa2 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -104,6 +104,62 @@ nouveau_drm_vblank_disable(struct drm_device *dev, int head)
 		nouveau_event_disable_locked(pdisp->vblank, head, 1);
 }
 
+static u32
+nouveau_drm_vblank_count(struct drm_device *dev, int head)
+{
+	struct nouveau_drm *drm = nouveau_drm(dev);
+	struct nouveau_disp *pdisp = nouveau_disp(drm->device);
+
+	if (!pdisp->get_vblank_count)
+		return drm_vblank_count(dev, head);
+	return pdisp->get_vblank_count(pdisp, head);
+}
+
+static int
+nouveau_drm_get_scanoutpos(struct drm_device *dev, int head, int *vpos, int *hpos)
+{
+	struct nouveau_drm *drm = nouveau_drm(dev);
+	struct nouveau_disp *pdisp = nouveau_disp(drm->device);
+	int ret = DRM_SCANOUTPOS_VALID | DRM_SCANOUTPOS_ACCURATE;
+
+	if (pdisp->get_scanoutpos(pdisp, head, vpos, hpos))
+		return 0;
+
+	if (*vpos < 0)
+		ret |= DRM_SCANOUTPOS_INVBL;
+	return ret;
+}
+
+static int
+nouveau_drm_get_vblank_timestamp(struct drm_device *dev, int crtc,
+				 int *max_error,
+				 struct timeval *vblank_time,
+				 unsigned flags)
+{
+	struct nouveau_drm *drm = nouveau_drm(dev);
+	struct nouveau_disp *pdisp = nouveau_disp(drm->device);
+	struct drm_crtc *drmcrtc;
+
+	if (!pdisp->get_scanoutpos)
+		return -EOPNOTSUPP;
+
+	list_for_each_entry(drmcrtc, &dev->mode_config.crtc_list, head) {
+		struct nouveau_crtc *nv_crtc = nouveau_crtc(drmcrtc);
+
+		if (nv_crtc->index != crtc)
+			continue;
+
+		/* Helper routine in DRM core does all the work: */
+		return drm_calc_vbltimestamp_from_scanoutpos(dev, crtc,
+							     max_error,
+							     vblank_time,
+							     flags,
+							     drmcrtc);
+	}
+	return -EINVAL;
+}
+
+
 static u64
 nouveau_name(struct pci_dev *pdev)
 {
@@ -701,7 +757,9 @@ driver = {
 	.debugfs_cleanup = nouveau_debugfs_takedown,
 #endif
 
-	.get_vblank_counter = drm_vblank_count,
+	.get_vblank_counter = nouveau_drm_vblank_count,
+	.get_scanout_position = nouveau_drm_get_scanoutpos,
+	.get_vblank_timestamp = nouveau_drm_get_vblank_timestamp,
 	.enable_vblank = nouveau_drm_vblank_enable,
 	.disable_vblank = nouveau_drm_vblank_disable,
 
diff --git a/drivers/gpu/drm/nouveau/nv50_display.c b/drivers/gpu/drm/nouveau/nv50_display.c
index 738d7a2..df8e24a 100644
--- a/drivers/gpu/drm/nouveau/nv50_display.c
+++ b/drivers/gpu/drm/nouveau/nv50_display.c
@@ -41,6 +41,7 @@
 #include <core/class.h>
 #include <engine/disp.h>
 
+#include <engine/disp.h>
 #include <subdev/timer.h>
 #include <subdev/bar.h>
 #include <subdev/fb.h>
@@ -1030,12 +1031,14 @@ nv50_crtc_commit(struct drm_crtc *crtc)
 
 	nv50_crtc_cursor_show_hide(nv_crtc, nv_crtc->cursor.visible, true);
 	nv50_display_flip_next(crtc, crtc->fb, NULL, 1);
+	drm_vblank_post_modeset(crtc->dev, nv_crtc->index);
 }
 
 static bool
 nv50_crtc_mode_fixup(struct drm_crtc *crtc, const struct drm_display_mode *mode,
 		     struct drm_display_mode *adjusted_mode)
 {
+	drm_mode_set_crtcinfo(adjusted_mode, 0);
 	return true;
 }
 
@@ -1091,9 +1094,12 @@ nv50_crtc_mode_set(struct drm_crtc *crtc, struct drm_display_mode *umode,
 		vactive = (vactive * 2) + 1;
 	}
 
+	drm_vblank_pre_modeset(crtc->dev, nv_crtc->index);
 	ret = nv50_crtc_swap_fbs(crtc, old_fb);
-	if (ret)
+	if (ret) {
+		drm_vblank_post_modeset(crtc->dev, nv_crtc->index);
 		return ret;
+	}
 
 	push = evo_wait(mast, 64);
 	if (push) {
@@ -2229,9 +2235,18 @@ nv50_display_create(struct drm_device *dev)
 	struct dcb_table *dcb = &drm->vbios.dcb;
 	struct drm_connector *connector, *tmp;
 	struct nv50_disp *disp;
+	struct nouveau_disp *dev_disp;
 	struct dcb_output *dcbe;
 	int crtcs, ret, i;
 
+	dev_disp = nouveau_disp(device);
+	if (!dev_disp) {
+		NV_ERROR(drm, "Cannot enable display engine without display support\n");
+		return -ENODEV;
+	}
+	if (dev_disp->max_vblank_count)
+		dev->max_vblank_count = dev_disp->max_vblank_count;
+
 	disp = kzalloc(sizeof(*disp), GFP_KERNEL);
 	if (!disp)
 		return -ENOMEM;

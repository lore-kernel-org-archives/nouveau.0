From: Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Subject: [PATCH 3/3] nouveau: add vblank methods on newer cards
Date: Fri, 27 Jul 2012 14:24:57 +0200
Message-ID: <50128899.8030701@canonical.com>
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
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Allow the software channel to be created now, since methods
for vblanking have been implemented.

The instmem flush seems to be needed on fermi to prevent a
race, but I enabled it on earlier cards too since they seem
to be susceptible to the same race.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>

---
 drivers/gpu/drm/nouveau/nouveau_abi16.c   |    9 ----
 drivers/gpu/drm/nouveau/nouveau_display.c |    8 +++-
 drivers/gpu/drm/nouveau/nouveau_drv.h     |    1 
 drivers/gpu/drm/nouveau/nv50_display.c    |   25 ++++++++----
 drivers/gpu/drm/nouveau/nv50_software.c   |    2 -
 drivers/gpu/drm/nouveau/nvc0_software.c   |   63 +++++++++++++++++++++++++++++
 drivers/gpu/drm/nouveau/nvd0_display.c    |    5 ++
 7 files changed, 95 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c b/drivers/gpu/drm/nouveau/nouveau_abi16.c
index ff23d88..e3a3a0b 100644
--- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
+++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
@@ -173,15 +173,8 @@ nouveau_abi16_ioctl_grobj_alloc(ABI16_IOCTL_ARGS)
 		return -EINVAL;
 
 	/* compatibility with userspace that assumes 506e for all chipsets */
-	if (init->class == 0x506e) {
+	if (init->class == 0x506e)
 		init->class = nouveau_software_class(dev);
-		if (init->class == 0x906e)
-			return 0;
-	} else
-	if (init->class == 0x906e) {
-		NV_ERROR(dev, "906e not supported yet\n");
-		return -EINVAL;
-	}
 
 	chan = nouveau_channel_get(file_priv, init->channel);
 	if (IS_ERR(chan))
diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
index 69688ef..fa0cf14 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.c
+++ b/drivers/gpu/drm/nouveau/nouveau_display.c
@@ -364,7 +364,9 @@ nouveau_vblank_enable(struct drm_device *dev, int crtc)
 {
 	struct drm_nouveau_private *dev_priv = dev->dev_private;
 
-	if (dev_priv->card_type >= NV_50)
+	if (dev_priv->card_type >= NV_D0)
+		nv_mask(dev, 0x6100c0 + (crtc * 0x800), 0x5, 0x5);
+	else if (dev_priv->card_type >= NV_50)
 		nv_mask(dev, NV50_PDISPLAY_INTR_EN_1, 0,
 			NV50_PDISPLAY_INTR_EN_1_VBLANK_CRTC_(crtc));
 	else
@@ -379,7 +381,9 @@ nouveau_vblank_disable(struct drm_device *dev, int crtc)
 {
 	struct drm_nouveau_private *dev_priv = dev->dev_private;
 
-	if (dev_priv->card_type >= NV_50)
+	if (dev_priv->card_type >= NV_D0)
+		nv_mask(dev, 0x6100c0 + (crtc * 0x800), 0x5, 0);
+	else if (dev_priv->card_type >= NV_50)
 		nv_mask(dev, NV50_PDISPLAY_INTR_EN_1,
 			NV50_PDISPLAY_INTR_EN_1_VBLANK_CRTC_(crtc), 0);
 	else
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index fbf5fbf..ab1bf0d 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -1374,6 +1374,7 @@ int nouveau_crtc_page_flip(struct drm_crtc *crtc, struct drm_framebuffer *fb,
 			   struct drm_pending_vblank_event *event);
 int nouveau_finish_page_flip(struct nouveau_channel *,
 			     struct nouveau_page_flip_state *);
+void nv50_display_vblank_crtc_handler(struct drm_device *dev, int crtc);
 int nouveau_display_dumb_create(struct drm_file *, struct drm_device *,
 				struct drm_mode_create_dumb *args);
 int nouveau_display_dumb_map_offset(struct drm_file *, struct drm_device *,
diff --git a/drivers/gpu/drm/nouveau/nv50_display.c b/drivers/gpu/drm/nouveau/nv50_display.c
index b244d99..ec0ad95 100644
--- a/drivers/gpu/drm/nouveau/nv50_display.c
+++ b/drivers/gpu/drm/nouveau/nv50_display.c
@@ -643,7 +643,7 @@ nv50_display_script_select(struct drm_device *dev, struct dcb_entry *dcb,
 	return script;
 }
 
-static void
+void
 nv50_display_vblank_crtc_handler(struct drm_device *dev, int crtc)
 {
 	struct drm_nouveau_private *dev_priv = dev->dev_private;
@@ -655,18 +655,29 @@ nv50_display_vblank_crtc_handler(struct drm_device *dev, int crtc)
 			continue;
 
 		spin_lock(&psw->peephole_lock);
-		nv_wr32(dev, 0x001704, pch->vblank.channel);
-		nv_wr32(dev, 0x001710, 0x80000000 | pch->vblank.ctxdma);
-		if (dev_priv->chipset == 0x50) {
-			nv_wr32(dev, 0x001570, pch->vblank.offset);
-			nv_wr32(dev, 0x001574, pch->vblank.value);
+		if (dev_priv->chipset < 0xc0) {
+			nv_wr32(dev, 0x001704, pch->vblank.channel);
+			nv_wr32(dev, 0x001710, 0x80000000 | pch->vblank.ctxdma);
+			dev_priv->engine.instmem.flush(dev);
+
+			if (dev_priv->chipset == 0x50) {
+				nv_wr32(dev, 0x001570, pch->vblank.offset);
+				nv_wr32(dev, 0x001574, pch->vblank.value);
+			} else {
+				nv_wr32(dev, 0x060010, pch->vblank.offset);
+				nv_wr32(dev, 0x060014, pch->vblank.value);
+			}
 		} else {
+			nv_wr32(dev, 0x001718, 0x80000000 | pch->vblank.channel);
+			dev_priv->engine.instmem.flush(dev);
+
+			nv_wr32(dev, 0x06000c, pch->vblank.ctxdma);
 			nv_wr32(dev, 0x060010, pch->vblank.offset);
 			nv_wr32(dev, 0x060014, pch->vblank.value);
 		}
 		spin_unlock(&psw->peephole_lock);
 
-		list_del(&pch->vblank.list);
+		list_del_init(&pch->vblank.list);
 		drm_vblank_put(dev, crtc);
 	}
 
diff --git a/drivers/gpu/drm/nouveau/nv50_software.c b/drivers/gpu/drm/nouveau/nv50_software.c
index df554d9..1f3ef11 100644
--- a/drivers/gpu/drm/nouveau/nv50_software.c
+++ b/drivers/gpu/drm/nouveau/nv50_software.c
@@ -75,7 +75,7 @@ mthd_vblsem_release(struct nouveau_channel *chan, u32 class, u32 mthd, u32 data)
 	struct nv50_software_chan *pch = chan->engctx[NVOBJ_ENGINE_SW];
 	struct drm_device *dev = chan->dev;
 
-	if (data > 1)
+	if (data > 1 || !list_empty(&pch->base.vblank.list))
 		return -EINVAL;
 
 	drm_vblank_get(dev, data);
diff --git a/drivers/gpu/drm/nouveau/nvc0_software.c b/drivers/gpu/drm/nouveau/nvc0_software.c
index 4fd14cf..5bd381c 100644
--- a/drivers/gpu/drm/nouveau/nvc0_software.c
+++ b/drivers/gpu/drm/nouveau/nvc0_software.c
@@ -48,6 +48,63 @@ nvc0_software_crtc(struct nouveau_channel *chan, int crtc)
 	return pch->dispc_vma[crtc].offset;
 }
 
+static int
+nvc0_swmthd_vblsem_offset_high(struct nouveau_channel *chan,
+			u32 class, u32 mthd, u32 data)
+{
+	struct nvc0_software_chan *pch = chan->engctx[NVOBJ_ENGINE_SW];
+
+	pch->base.vblank.ctxdma = data;
+	return 0;
+}
+
+static int
+nvc0_swmthd_vblsem_offset_low(struct nouveau_channel *chan,
+			u32 class, u32 mthd, u32 data)
+{
+	struct nvc0_software_chan *pch = chan->engctx[NVOBJ_ENGINE_SW];
+
+	pch->base.vblank.offset = data;
+	return 0;
+}
+
+static int
+nvc0_swmthd_vblsem_release_val(struct nouveau_channel *chan,
+			     u32 class, u32 mthd, u32 data)
+{
+	struct nvc0_software_chan *pch = chan->engctx[NVOBJ_ENGINE_SW];
+
+	pch->base.vblank.value = data;
+	return 0;
+}
+
+static int
+nvc0_swmthd_vblsem_release(struct nouveau_channel *chan,
+			   u32 class, u32 mthd, u32 data)
+{
+	struct nvc0_software_priv *psw = nv_engine(chan->dev, NVOBJ_ENGINE_SW);
+	struct nvc0_software_chan *pch = chan->engctx[NVOBJ_ENGINE_SW];
+	struct drm_device *dev = chan->dev;
+
+	if (data >= dev->mode_config.num_crtc ||
+	    !list_empty(&pch->base.vblank.list))
+		return -EINVAL;
+
+	drm_vblank_get(dev, data);
+
+	pch->base.vblank.head = data;
+	list_add(&pch->base.vblank.list, &psw->base.vblank);
+	return 0;
+}
+
+static int
+nvc0_swmthd_page_flip(struct nouveau_channel *chan,
+		      u32 class, u32 mthd, u32 data)
+{
+	nouveau_finish_page_flip(chan, NULL);
+	return 0;
+}
+
 bool
 nvc0_software_method(struct drm_device *dev, u32 chid, u32 class, u32 mthd, u32 data)
 {
@@ -116,6 +173,7 @@ nvc0_software_context_new(struct nouveau_channel *chan, int engine)
 		return -ENOMEM;
 
 	nouveau_software_context_new(&pch->base);
+	pch->base.vblank.channel = chan->ramin->vinst >> 12;
 	chan->engctx[engine] = pch;
 
 	/* map display semaphore buffers into channel's vm */
@@ -205,5 +263,10 @@ nvc0_software_create(struct drm_device *dev)
 
 	NVOBJ_ENGINE_ADD(dev, SW, &psw->base.base);
 	NVOBJ_CLASS(dev, 0x906e, SW);
+	NVOBJ_MTHD (dev, 0x906e, 0x0200, nvc0_swmthd_vblsem_offset_high);
+	NVOBJ_MTHD (dev, 0x906e, 0x0204, nvc0_swmthd_vblsem_offset_low);
+	NVOBJ_MTHD (dev, 0x906e, 0x0208, nvc0_swmthd_vblsem_release_val);
+	NVOBJ_MTHD (dev, 0x906e, 0x020c, nvc0_swmthd_vblsem_release);
+	NVOBJ_MTHD (dev, 0x906e, 0x0210, nvc0_swmthd_page_flip);
 	return 0;
 }
diff --git a/drivers/gpu/drm/nouveau/nvd0_display.c b/drivers/gpu/drm/nouveau/nvd0_display.c
index dac525b..2985a5a 100644
--- a/drivers/gpu/drm/nouveau/nvd0_display.c
+++ b/drivers/gpu/drm/nouveau/nvd0_display.c
@@ -1836,6 +1836,11 @@ nvd0_display_intr(struct drm_device *dev)
 			u32 stat = nv_rd32(dev, 0x6100bc + (i * 0x800));
 			nv_wr32(dev, 0x6100bc + (i * 0x800), stat);
 			intr &= ~mask;
+			nv50_display_vblank_crtc_handler(dev, i);
+
+			/* This read seems to be required for vblank to work
+			 * correctly a second time on nvd9 */
+			nv_rd32(dev, 0x6100c0 + (i * 0x800));
 		}
 	}

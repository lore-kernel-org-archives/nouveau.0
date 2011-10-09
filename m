From: Maxim Levitsky <maximlevitsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 10/10] nv50: WIP: initial import of power save
	magic.
Date: Sun,  9 Oct 2011 22:58:40 +0200
Message-ID: <1318193920-27461-11-git-send-email-maximlevitsky@gmail.com>
References: <1318193920-27461-1-git-send-email-maximlevitsky@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1318193920-27461-1-git-send-email-maximlevitsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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

NOT-signed-off-by: Maxim Levitsky <maximlevitsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nv50_dac.c     |   47 +++++++++++++++++++++++++++-----
 drivers/gpu/drm/nouveau/nv50_display.c |    2 +-
 drivers/gpu/drm/nouveau/nv50_fb.c      |    9 ++++++
 drivers/gpu/drm/nouveau/nv50_mc.c      |   11 +++++++
 4 files changed, 61 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nv50_dac.c b/drivers/gpu/drm/nouveau/nv50_dac.c
index 808f3ec..8b5a40d 100644
--- a/drivers/gpu/drm/nouveau/nv50_dac.c
+++ b/drivers/gpu/drm/nouveau/nv50_dac.c
@@ -70,10 +70,12 @@ nv50_dac_detect(struct drm_encoder *encoder, struct drm_connector *connector)
 	struct drm_device *dev = encoder->dev;
 	struct drm_nouveau_private *dev_priv = dev->dev_private;
 	enum drm_connector_status status = connector_status_disconnected;
-	uint32_t dpms_state, load_pattern, load_state;
+	uint32_t dpms_state, load_pattern, load_state, clk;
 	int or = nv_encoder->or;
 
-	nv_wr32(dev, NV50_PDISPLAY_DAC_CLK_CTRL1(or), 0x00000001);
+	clk = nv_rd32(dev, NV50_PDISPLAY_DAC_CLK_CTRL1(or));
+	nv_wr32(dev, NV50_PDISPLAY_DAC_CLK_CTRL1(or), 0x01);
+
 	dpms_state = nv_rd32(dev, NV50_PDISPLAY_DAC_DPMS_CTRL(or));
 
 	nv_wr32(dev, NV50_PDISPLAY_DAC_DPMS_CTRL(or),
@@ -115,6 +117,8 @@ nv50_dac_detect(struct drm_encoder *encoder, struct drm_connector *connector)
 	else
 		NV_DEBUG_KMS(dev, "Load was not detected on output with or %d\n", or);
 
+	nv_wr32(dev, NV50_PDISPLAY_DAC_CLK_CTRL1(or), clk);
+
 	return status;
 }
 
@@ -123,7 +127,7 @@ nv50_dac_dpms(struct drm_encoder *encoder, int mode)
 {
 	struct drm_device *dev = encoder->dev;
 	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
-	uint32_t val;
+	uint32_t val, clk;
 	int or = nv_encoder->or;
 
 	NV_DEBUG_KMS(dev, "or %d mode %d\n", or, mode);
@@ -138,9 +142,13 @@ nv50_dac_dpms(struct drm_encoder *encoder, int mode)
 	}
 
 	val = nv_rd32(dev, NV50_PDISPLAY_DAC_DPMS_CTRL(or)) & ~0x7F;
+	clk = nv_rd32(dev, NV50_PDISPLAY_DAC_CLK_CTRL1(or));
 
-	if (mode != DRM_MODE_DPMS_ON)
+	if (mode != DRM_MODE_DPMS_ON) {
 		val |= NV50_PDISPLAY_DAC_DPMS_CTRL_BLANKED;
+		clk |= 0x02;
+	} else
+		clk &= ~0x02;
 
 	switch (mode) {
 	case DRM_MODE_DPMS_STANDBY:
@@ -160,6 +168,9 @@ nv50_dac_dpms(struct drm_encoder *encoder, int mode)
 
 	nv_wr32(dev, NV50_PDISPLAY_DAC_DPMS_CTRL(or), val |
 		NV50_PDISPLAY_DAC_DPMS_CTRL_PENDING);
+
+	nv_wr32(dev, NV50_PDISPLAY_DAC_CLK_CTRL1(or), clk);
+
 }
 
 static void
@@ -297,6 +308,29 @@ nv50_dac_create(struct drm_connector *connector, struct dcb_entry *entry)
 {
 	struct nouveau_encoder *nv_encoder;
 	struct drm_encoder *encoder;
+	int type, or;
+
+	switch (entry->type) {
+	case OUTPUT_ANALOG:
+		type = DRM_MODE_ENCODER_DAC;
+		break;
+	case OUTPUT_TV:
+		type = DRM_MODE_ENCODER_TVDAC;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	or = ffs(entry->or) - 1;
+
+	if (type == DRM_MODE_ENCODER_DAC)
+		nv_wr32(connector->dev, NV50_PDISPLAY_DAC_CLK_CTRL1(or), 0x00000003);
+	else
+		nv_wr32(connector->dev, NV50_PDISPLAY_DAC_CLK_CTRL1(or), 0x80000002);
+
+	/* FIXME: add support for TV-out */
+	if (type != DRM_MODE_ENCODER_DAC)
+		return -EINVAL;
 
 	nv_encoder = kzalloc(sizeof(*nv_encoder), GFP_KERNEL);
 	if (!nv_encoder)
@@ -304,10 +338,9 @@ nv50_dac_create(struct drm_connector *connector, struct dcb_entry *entry)
 	encoder = to_drm_encoder(nv_encoder);
 
 	nv_encoder->dcb = entry;
-	nv_encoder->or = ffs(entry->or) - 1;
+	nv_encoder->or = or;
 
-	drm_encoder_init(connector->dev, encoder, &nv50_dac_encoder_funcs,
-			 DRM_MODE_ENCODER_DAC);
+	drm_encoder_init(connector->dev, encoder, &nv50_dac_encoder_funcs, type);
 	drm_encoder_helper_add(encoder, &nv50_dac_helper_funcs);
 
 	encoder->possible_crtcs = entry->heads;
diff --git a/drivers/gpu/drm/nouveau/nv50_display.c b/drivers/gpu/drm/nouveau/nv50_display.c
index d23ca00..d9dac41 100644
--- a/drivers/gpu/drm/nouveau/nv50_display.c
+++ b/drivers/gpu/drm/nouveau/nv50_display.c
@@ -112,7 +112,6 @@ nv50_display_init(struct drm_device *dev)
 	for (i = 0; i < 3; i++) {
 		nv_wr32(dev, NV50_PDISPLAY_DAC_DPMS_CTRL(i), 0x00550000 |
 			NV50_PDISPLAY_DAC_DPMS_CTRL_PENDING);
-		nv_wr32(dev, NV50_PDISPLAY_DAC_CLK_CTRL1(i), 0x00000001);
 	}
 
 	/* The precise purpose is unknown, i suspect it has something to do
@@ -321,6 +320,7 @@ int nv50_display_create(struct drm_device *dev)
 			nv50_sor_create(connector, entry);
 			break;
 		case OUTPUT_ANALOG:
+		case OUTPUT_TV:
 			nv50_dac_create(connector, entry);
 			break;
 		default:
diff --git a/drivers/gpu/drm/nouveau/nv50_fb.c b/drivers/gpu/drm/nouveau/nv50_fb.c
index bdd2afe..fe49500 100644
--- a/drivers/gpu/drm/nouveau/nv50_fb.c
+++ b/drivers/gpu/drm/nouveau/nv50_fb.c
@@ -86,6 +86,15 @@ nv50_fb_init(struct drm_device *dev)
 	 */
 	nv_wr32(dev, 0x100c08, priv->r100c08 >> 8);
 
+	/* Power usage magic */
+	nv_wr32(dev, 0x100000, 0x0000c042);
+	nv_wr32(dev, 0x100004, 0x0000c042);
+	nv_wr32(dev, 0x100008, 0x0000c042);
+	nv_wr32(dev, 0x100b78, 0x0000c042);
+	nv_wr32(dev, 0x100c0c, 0x0000c042);
+	nv_wr32(dev, 0x100d04, 0x0000c042);
+	nv_wr32(dev, 0x100e0c, 0x0000c042);
+
 	/* This is needed to get meaningful information from 100c90
 	 * on traps. No idea what these values mean exactly. */
 	switch (dev_priv->chipset) {
diff --git a/drivers/gpu/drm/nouveau/nv50_mc.c b/drivers/gpu/drm/nouveau/nv50_mc.c
index e0a9c3f..76367568 100644
--- a/drivers/gpu/drm/nouveau/nv50_mc.c
+++ b/drivers/gpu/drm/nouveau/nv50_mc.c
@@ -32,6 +32,17 @@ int
 nv50_mc_init(struct drm_device *dev)
 {
 	nv_wr32(dev, NV03_PMC_ENABLE, 0xFFFFFFFF);
+
+	/* PPCI+0x150 - some PCIE powersave bit*/
+	nv_mask(dev, 0x088150, 0x00000100, 0x00000000);
+
+	/* PBUS.DEBUG_6 - enable PGRAPH automatic clock gating*/
+	nv_mask(dev, 0x001098, 0x00000020, 0x00000020);
+	nv_mask(dev, 0x001588, 0x00000003, 0x00000001);
+
+	/* PCONTROL+0x40 - disable VP2 clock */
+	nv_mask(dev, 0x00c040, 0x00000F00, 0x00000200);
+
 	return 0;
 }
 
-- 
1.7.4.1

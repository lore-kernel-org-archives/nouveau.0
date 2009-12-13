From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] drm/nouveau: use drm debug levels
Date: Sun, 13 Dec 2009 16:56:23 +0100
Message-ID: <1260719783-3049-1-git-send-email-madman2003@gmail.com>
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

- Use driver level (0x2) for NV_DEBUG instead of all levels
- Create a NV_DEBUG_KMS for KMS level (04) and use them in modesetting code
- Remove a few odd NV_TRACE calls and replace with NV_DEBUG_KMS

Signed-off-by: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_bios.c      |   12 +++++-----
 drivers/gpu/drm/nouveau/nouveau_connector.c |    8 +++---
 drivers/gpu/drm/nouveau/nouveau_dp.c        |   28 +++++++++++++-------------
 drivers/gpu/drm/nouveau/nouveau_drv.h       |   14 +++++++++++-
 drivers/gpu/drm/nouveau/nouveau_fbcon.c     |    2 +-
 drivers/gpu/drm/nouveau/nv04_crtc.c         |   10 ++++----
 drivers/gpu/drm/nouveau/nv04_dac.c          |    8 ++----
 drivers/gpu/drm/nouveau/nv04_dfp.c          |    8 ++++--
 drivers/gpu/drm/nouveau/nv04_display.c      |    4 +-
 drivers/gpu/drm/nouveau/nv17_tv.c           |    4 +-
 drivers/gpu/drm/nouveau/nv50_crtc.c         |   22 ++++++++++----------
 drivers/gpu/drm/nouveau/nv50_cursor.c       |    8 +++---
 drivers/gpu/drm/nouveau/nv50_dac.c          |   20 +++++++++---------
 drivers/gpu/drm/nouveau/nv50_display.c      |   20 +++++++++---------
 drivers/gpu/drm/nouveau/nv50_sor.c          |   16 +++++++-------
 15 files changed, 97 insertions(+), 87 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bios.c b/drivers/gpu/drm/nouveau/nouveau_bios.c
index 5eec5ed..62fadbb 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bios.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bios.c
@@ -3854,7 +3854,7 @@ nouveau_bios_run_display_table(struct drm_device *dev, struct dcb_entry *dcbent,
 	 * script tables is a pointer to the script to execute.
 	 */
 
-	NV_DEBUG(dev, "Searching for output entry for %d %d %d\n",
+	NV_DEBUG_KMS(dev, "Searching for output entry for %d %d %d\n",
 			dcbent->type, dcbent->location, dcbent->or);
 	otable = bios_output_config_match(dev, dcbent, table[1] +
 					  bios->display.script_table_ptr,
@@ -3884,7 +3884,7 @@ nouveau_bios_run_display_table(struct drm_device *dev, struct dcb_entry *dcbent,
 	if (pxclk == 0) {
 		script = ROM16(otable[6]);
 		if (!script) {
-			NV_DEBUG(dev, "output script 0 not found\n");
+			NV_DEBUG_KMS(dev, "output script 0 not found\n");
 			return 1;
 		}
 
@@ -3894,7 +3894,7 @@ nouveau_bios_run_display_table(struct drm_device *dev, struct dcb_entry *dcbent,
 	if (pxclk == -1) {
 		script = ROM16(otable[8]);
 		if (!script) {
-			NV_DEBUG(dev, "output script 1 not found\n");
+			NV_DEBUG_KMS(dev, "output script 1 not found\n");
 			return 1;
 		}
 
@@ -3907,7 +3907,7 @@ nouveau_bios_run_display_table(struct drm_device *dev, struct dcb_entry *dcbent,
 		else
 			script = 0;
 		if (!script) {
-			NV_DEBUG(dev, "output script 2 not found\n");
+			NV_DEBUG_KMS(dev, "output script 2 not found\n");
 			return 1;
 		}
 
@@ -3931,7 +3931,7 @@ nouveau_bios_run_display_table(struct drm_device *dev, struct dcb_entry *dcbent,
 		if (script)
 			script = clkcmptable(bios, script, -pxclk);
 		if (!script) {
-			NV_DEBUG(dev, "clock script 1 not found\n");
+			NV_DEBUG_KMS(dev, "clock script 1 not found\n");
 			return 1;
 		}
 
@@ -5234,7 +5234,7 @@ parse_dcb_connector_table(struct nvbios *bios)
 	int i;
 
 	if (!bios->bdcb.connector_table_ptr) {
-		NV_DEBUG(dev, "No DCB connector table present\n");
+		NV_DEBUG_KMS(dev, "No DCB connector table present\n");
 		return;
 	}
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
index 032cf09..5a10deb 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -86,7 +86,7 @@ nouveau_connector_destroy(struct drm_connector *drm_connector)
 	struct nouveau_connector *connector = nouveau_connector(drm_connector);
 	struct drm_device *dev = connector->base.dev;
 
-	NV_DEBUG(dev, "\n");
+	NV_DEBUG_KMS(dev, "\n");
 
 	if (!connector)
 		return;
@@ -420,7 +420,7 @@ nouveau_connector_native_mode(struct nouveau_connector *connector)
 	/* Use preferred mode if there is one.. */
 	list_for_each_entry(mode, &connector->base.probed_modes, head) {
 		if (mode->type & DRM_MODE_TYPE_PREFERRED) {
-			NV_DEBUG(dev, "native mode from preferred\n");
+			NV_DEBUG_KMS(dev, "native mode from preferred\n");
 			return drm_mode_duplicate(dev, mode);
 		}
 	}
@@ -445,7 +445,7 @@ nouveau_connector_native_mode(struct nouveau_connector *connector)
 		largest = mode;
 	}
 
-	NV_DEBUG(dev, "native mode from largest: %dx%d@%d\n",
+	NV_DEBUG_KMS(dev, "native mode from largest: %dx%d@%d\n",
 		      high_w, high_h, high_v);
 	return largest ? drm_mode_duplicate(dev, largest) : NULL;
 }
@@ -725,7 +725,7 @@ nouveau_connector_create(struct drm_device *dev, int index, int type)
 	struct drm_encoder *encoder;
 	int ret;
 
-	NV_DEBUG(dev, "\n");
+	NV_DEBUG_KMS(dev, "\n");
 
 	nv_connector = kzalloc(sizeof(*nv_connector), GFP_KERNEL);
 	if (!nv_connector)
diff --git a/drivers/gpu/drm/nouveau/nouveau_dp.c b/drivers/gpu/drm/nouveau/nouveau_dp.c
index de61f46..9e2926c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dp.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dp.c
@@ -187,7 +187,7 @@ nouveau_dp_link_train_adjust(struct drm_encoder *encoder, uint8_t *config)
 	if (ret)
 		return false;
 
-	NV_DEBUG(dev, "\t\tadjust 0x%02x 0x%02x\n", request[0], request[1]);
+	NV_DEBUG_KMS(dev, "\t\tadjust 0x%02x 0x%02x\n", request[0], request[1]);
 
 	/* Keep all lanes at the same level.. */
 	for (i = 0; i < nv_encoder->dp.link_nr; i++) {
@@ -228,7 +228,7 @@ nouveau_dp_link_train_commit(struct drm_encoder *encoder, uint8_t *config)
 	int or = nv_encoder->or, link = !(nv_encoder->dcb->sorconf.link & 1);
 	int dpe_headerlen, ret, i;
 
-	NV_DEBUG(dev, "\t\tconfig 0x%02x 0x%02x 0x%02x 0x%02x\n",
+	NV_DEBUG_KMS(dev, "\t\tconfig 0x%02x 0x%02x 0x%02x 0x%02x\n",
 		 config[0], config[1], config[2], config[3]);
 
 	dpe = nouveau_bios_dp_table(dev, nv_encoder->dcb, &dpe_headerlen);
@@ -276,12 +276,12 @@ nouveau_dp_link_train(struct drm_encoder *encoder)
 	bool cr_done, cr_max_vs, eq_done;
 	int ret = 0, i, tries, voltage;
 
-	NV_DEBUG(dev, "link training!!\n");
+	NV_DEBUG_KMS(dev, "link training!!\n");
 train:
 	cr_done = eq_done = false;
 
 	/* set link configuration */
-	NV_DEBUG(dev, "\tbegin train: bw %d, lanes %d\n",
+	NV_DEBUG_KMS(dev, "\tbegin train: bw %d, lanes %d\n",
 		 nv_encoder->dp.link_bw, nv_encoder->dp.link_nr);
 
 	ret = nouveau_dp_link_bw_set(encoder, nv_encoder->dp.link_bw);
@@ -297,7 +297,7 @@ train:
 		return false;
 
 	/* clock recovery */
-	NV_DEBUG(dev, "\tbegin cr\n");
+	NV_DEBUG_KMS(dev, "\tbegin cr\n");
 	ret = nouveau_dp_link_train_set(encoder, DP_TRAINING_PATTERN_1);
 	if (ret)
 		goto stop;
@@ -314,7 +314,7 @@ train:
 		ret = auxch_rd(encoder, DP_LANE0_1_STATUS, status, 2);
 		if (ret)
 			break;
-		NV_DEBUG(dev, "\t\tstatus: 0x%02x 0x%02x\n",
+		NV_DEBUG_KMS(dev, "\t\tstatus: 0x%02x 0x%02x\n",
 			 status[0], status[1]);
 
 		cr_done = true;
@@ -346,7 +346,7 @@ train:
 		goto stop;
 
 	/* channel equalisation */
-	NV_DEBUG(dev, "\tbegin eq\n");
+	NV_DEBUG_KMS(dev, "\tbegin eq\n");
 	ret = nouveau_dp_link_train_set(encoder, DP_TRAINING_PATTERN_2);
 	if (ret)
 		goto stop;
@@ -357,7 +357,7 @@ train:
 		ret = auxch_rd(encoder, DP_LANE0_1_STATUS, status, 3);
 		if (ret)
 			break;
-		NV_DEBUG(dev, "\t\tstatus: 0x%02x 0x%02x\n",
+		NV_DEBUG_KMS(dev, "\t\tstatus: 0x%02x 0x%02x\n",
 			 status[0], status[1]);
 
 		eq_done = true;
@@ -395,9 +395,9 @@ stop:
 
 	/* retry at a lower setting, if possible */
 	if (!ret && !(eq_done && cr_done)) {
-		NV_DEBUG(dev, "\twe failed\n");
+		NV_DEBUG_KMS(dev, "\twe failed\n");
 		if (nv_encoder->dp.link_bw != DP_LINK_BW_1_62) {
-			NV_DEBUG(dev, "retry link training at low rate\n");
+			NV_DEBUG_KMS(dev, "retry link training at low rate\n");
 			nv_encoder->dp.link_bw = DP_LINK_BW_1_62;
 			goto train;
 		}
@@ -418,7 +418,7 @@ nouveau_dp_detect(struct drm_encoder *encoder)
 	if (ret)
 		return false;
 
-	NV_DEBUG(dev, "encoder: link_bw %d, link_nr %d\n"
+	NV_DEBUG_KMS(dev, "encoder: link_bw %d, link_nr %d\n"
 		      "display: link_bw %d, link_nr %d version 0x%02x\n",
 		 nv_encoder->dcb->dpconf.link_bw,
 		 nv_encoder->dcb->dpconf.link_nr,
@@ -446,7 +446,7 @@ nouveau_dp_auxch(struct nouveau_i2c_chan *auxch, int cmd, int addr,
 	uint32_t tmp, ctrl, stat = 0, data32[4] = {};
 	int ret = 0, i, index = auxch->rd;
 
-	NV_DEBUG(dev, "ch %d cmd %d addr 0x%x len %d\n", index, cmd, addr, data_nr);
+	NV_DEBUG_KMS(dev, "ch %d cmd %d addr 0x%x len %d\n", index, cmd, addr, data_nr);
 
 	tmp = nv_rd32(dev, NV50_AUXCH_CTRL(auxch->rd));
 	nv_wr32(dev, NV50_AUXCH_CTRL(auxch->rd), tmp | 0x00100000);
@@ -472,7 +472,7 @@ nouveau_dp_auxch(struct nouveau_i2c_chan *auxch, int cmd, int addr,
 	if (!(cmd & 1)) {
 		memcpy(data32, data, data_nr);
 		for (i = 0; i < 4; i++) {
-			NV_DEBUG(dev, "wr %d: 0x%08x\n", i, data32[i]);
+			NV_DEBUG_KMS(dev, "wr %d: 0x%08x\n", i, data32[i]);
 			nv_wr32(dev, NV50_AUXCH_DATA_OUT(index, i), data32[i]);
 		}
 	}
@@ -504,7 +504,7 @@ nouveau_dp_auxch(struct nouveau_i2c_chan *auxch, int cmd, int addr,
 	if (cmd & 1) {
 		for (i = 0; i < 4; i++) {
 			data32[i] = nv_rd32(dev, NV50_AUXCH_DATA_IN(index, i));
-			NV_DEBUG(dev, "rd %d: 0x%08x\n", i, data32[i]);
+			NV_DEBUG_KMS(dev, "rd %d: 0x%08x\n", i, data32[i]);
 		}
 		memcpy(data, data32, data_nr);
 	}
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index 88b4c7b..bc6ffa5 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -1207,14 +1207,24 @@ static inline void nv_wo32(struct drm_device *dev, struct nouveau_gpuobj *obj,
 					pci_name(d->pdev), ##arg)
 #ifndef NV_DEBUG_NOTRACE
 #define NV_DEBUG(d, fmt, arg...) do {                                          \
-	if (drm_debug) {                                                       \
+	if (drm_debug & DRM_UT_DRIVER) {                                       \
+		NV_PRINTK(KERN_DEBUG, d, "%s:%d - " fmt, __func__,             \
+			  __LINE__, ##arg);                                    \
+	}                                                                      \
+} while (0)
+#define NV_DEBUG_KMS(d, fmt, arg...) do {                                      \
+	if (drm_debug & DRM_UT_KMS) {                                          \
 		NV_PRINTK(KERN_DEBUG, d, "%s:%d - " fmt, __func__,             \
 			  __LINE__, ##arg);                                    \
 	}                                                                      \
 } while (0)
 #else
 #define NV_DEBUG(d, fmt, arg...) do {                                          \
-	if (drm_debug)                                                         \
+	if (drm_debug & DRM_UT_DRIVER)                                         \
+		NV_PRINTK(KERN_DEBUG, d, fmt, ##arg);                          \
+} while (0)
+#define NV_DEBUG_KMS(d, fmt, arg...) do {                                      \
+	if (drm_debug & DRM_UT_KMS)                                            \
 		NV_PRINTK(KERN_DEBUG, d, fmt, ##arg);                          \
 } while (0)
 #endif
diff --git a/drivers/gpu/drm/nouveau/nouveau_fbcon.c b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
index 36e8c5e..489d492 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fbcon.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
@@ -347,7 +347,7 @@ out:
 int
 nouveau_fbcon_probe(struct drm_device *dev)
 {
-	NV_DEBUG(dev, "\n");
+	NV_DEBUG_KMS(dev, "\n");
 
 	return drm_fb_helper_single_fb_probe(dev, 32, nouveau_fbcon_create);
 }
diff --git a/drivers/gpu/drm/nouveau/nv04_crtc.c b/drivers/gpu/drm/nouveau/nv04_crtc.c
index b913636..d2f143e 100644
--- a/drivers/gpu/drm/nouveau/nv04_crtc.c
+++ b/drivers/gpu/drm/nouveau/nv04_crtc.c
@@ -143,10 +143,10 @@ static void nv_crtc_calc_state_ext(struct drm_crtc *crtc, struct drm_display_mod
 	state->pllsel |= nv_crtc->index ? PLLSEL_VPLL2_MASK : PLLSEL_VPLL1_MASK;
 
 	if (pv->NM2)
-		NV_TRACE(dev, "vpll: n1 %d n2 %d m1 %d m2 %d log2p %d\n",
+		NV_DEBUG_KMS(dev, "vpll: n1 %d n2 %d m1 %d m2 %d log2p %d\n",
 			 pv->N1, pv->N2, pv->M1, pv->M2, pv->log2P);
 	else
-		NV_TRACE(dev, "vpll: n %d m %d log2p %d\n",
+		NV_DEBUG_KMS(dev, "vpll: n %d m %d log2p %d\n",
 			 pv->N1, pv->M1, pv->log2P);
 
 	nv_crtc->cursor.set_offset(nv_crtc, nv_crtc->cursor.offset);
@@ -160,7 +160,7 @@ nv_crtc_dpms(struct drm_crtc *crtc, int mode)
 	unsigned char seq1 = 0, crtc17 = 0;
 	unsigned char crtc1A;
 
-	NV_TRACE(dev, "Setting dpms mode %d on CRTC %d\n", mode,
+	NV_DEBUG_KMS(dev, "Setting dpms mode %d on CRTC %d\n", mode,
 							nv_crtc->index);
 
 	if (nv_crtc->last_dpms == mode) /* Don't do unnecesary mode changes. */
@@ -603,7 +603,7 @@ nv_crtc_mode_set(struct drm_crtc *crtc, struct drm_display_mode *mode,
 	struct nouveau_crtc *nv_crtc = nouveau_crtc(crtc);
 	struct drm_nouveau_private *dev_priv = dev->dev_private;
 
-	NV_DEBUG(dev, "CTRC mode on CRTC %d:\n", nv_crtc->index);
+	NV_DEBUG_KMS(dev, "CTRC mode on CRTC %d:\n", nv_crtc->index);
 	drm_mode_debug_printmodeline(adjusted_mode);
 
 	/* unlock must come after turning off FP_TG_CONTROL in output_prepare */
@@ -703,7 +703,7 @@ static void nv_crtc_destroy(struct drm_crtc *crtc)
 {
 	struct nouveau_crtc *nv_crtc = nouveau_crtc(crtc);
 
-	NV_DEBUG(crtc->dev, "\n");
+	NV_DEBUG_KMS(crtc->dev, "\n");
 
 	if (!nv_crtc)
 		return;
diff --git a/drivers/gpu/drm/nouveau/nv04_dac.c b/drivers/gpu/drm/nouveau/nv04_dac.c
index a5fa517..e6b690e 100644
--- a/drivers/gpu/drm/nouveau/nv04_dac.c
+++ b/drivers/gpu/drm/nouveau/nv04_dac.c
@@ -205,7 +205,7 @@ out:
 	NVWriteVgaSeq(dev, 0, NV_VIO_SR_CLOCK_INDEX, saved_seq1);
 
 	if (blue == 0x18) {
-		NV_TRACE(dev, "Load detected on head A\n");
+		NV_DEBUG_KMS(dev, "Load detected on head A\n");
 		return connector_status_connected;
 	}
 
@@ -350,13 +350,11 @@ static void nv04_dac_mode_set(struct drm_encoder *encoder,
 			      struct drm_display_mode *mode,
 			      struct drm_display_mode *adjusted_mode)
 {
-	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
 	struct drm_device *dev = encoder->dev;
 	struct drm_nouveau_private *dev_priv = dev->dev_private;
 	int head = nouveau_crtc(encoder->crtc)->index;
 
-	NV_TRACE(dev, "%s called for encoder %d\n", __func__,
-		      nv_encoder->dcb->index);
+	NV_DEBUG_KMS(dev, "Output mode on CRTC %d:\n", head);
 
 	if (nv_gf4_disp_arch(dev)) {
 		struct drm_encoder *rebind;
@@ -466,7 +464,7 @@ static void nv04_dac_destroy(struct drm_encoder *encoder)
 {
 	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
 
-	NV_DEBUG(encoder->dev, "\n");
+	NV_DEBUG_KMS(encoder->dev, "\n");
 
 	drm_encoder_cleanup(encoder);
 	kfree(nv_encoder);
diff --git a/drivers/gpu/drm/nouveau/nv04_dfp.c b/drivers/gpu/drm/nouveau/nv04_dfp.c
index e5b3333..483f875 100644
--- a/drivers/gpu/drm/nouveau/nv04_dfp.c
+++ b/drivers/gpu/drm/nouveau/nv04_dfp.c
@@ -261,7 +261,7 @@ static void nv04_dfp_mode_set(struct drm_encoder *encoder,
 	struct drm_display_mode *output_mode = &nv_encoder->mode;
 	uint32_t mode_ratio, panel_ratio;
 
-	NV_DEBUG(dev, "Output mode on CRTC %d:\n", nv_crtc->index);
+	NV_DEBUG_KMS(dev, "Output mode on CRTC %d:\n", nv_crtc->index);
 	drm_mode_debug_printmodeline(output_mode);
 
 	/* Initialize the FP registers in this CRTC. */
@@ -413,7 +413,9 @@ static void nv04_dfp_commit(struct drm_encoder *encoder)
 	struct dcb_entry *dcbe = nv_encoder->dcb;
 	int head = nouveau_crtc(encoder->crtc)->index;
 
-	NV_TRACE(dev, "%s called for encoder %d\n", __func__, nv_encoder->dcb->index);
+	NV_INFO(dev, "Output %s is running on CRTC %d using output %c\n",
+		drm_get_connector_name(&nouveau_encoder_connector_get(nv_encoder)->base),
+		nv_crtc->index, '@' + ffs(nv_encoder->dcb->or));
 
 	if (dcbe->type == OUTPUT_TMDS)
 		run_tmds_table(dev, dcbe, head, nv_encoder->mode.clock);
@@ -550,7 +552,7 @@ static void nv04_dfp_destroy(struct drm_encoder *encoder)
 {
 	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
 
-	NV_DEBUG(encoder->dev, "\n");
+	NV_DEBUG_KMS(encoder->dev, "\n");
 
 	drm_encoder_cleanup(encoder);
 	kfree(nv_encoder);
diff --git a/drivers/gpu/drm/nouveau/nv04_display.c b/drivers/gpu/drm/nouveau/nv04_display.c
index b47c757..2c561bd 100644
--- a/drivers/gpu/drm/nouveau/nv04_display.c
+++ b/drivers/gpu/drm/nouveau/nv04_display.c
@@ -99,7 +99,7 @@ nv04_display_create(struct drm_device *dev)
 	uint16_t connector[16] = { 0 };
 	int i, ret;
 
-	NV_DEBUG(dev, "\n");
+	NV_DEBUG_KMS(dev, "\n");
 
 	if (nv_two_heads(dev))
 		nv04_display_store_initial_head_owner(dev);
@@ -223,7 +223,7 @@ nv04_display_destroy(struct drm_device *dev)
 	struct drm_encoder *encoder;
 	struct drm_crtc *crtc;
 
-	NV_DEBUG(dev, "\n");
+	NV_DEBUG_KMS(dev, "\n");
 
 	/* Turn every CRTC off. */
 	list_for_each_entry(crtc, &dev->mode_config.crtc_list, head) {
diff --git a/drivers/gpu/drm/nouveau/nv17_tv.c b/drivers/gpu/drm/nouveau/nv17_tv.c
index 46cfd9c..7c4d7c0 100644
--- a/drivers/gpu/drm/nouveau/nv17_tv.c
+++ b/drivers/gpu/drm/nouveau/nv17_tv.c
@@ -219,7 +219,7 @@ static void  nv17_tv_dpms(struct drm_encoder *encoder, int mode)
 		return;
 	nouveau_encoder(encoder)->last_dpms = mode;
 
-	NV_TRACE(dev, "Setting dpms mode %d on TV encoder (output %d)\n",
+	NV_DEBUG_KMS(dev, "Setting dpms mode %d on TV encoder (output %d)\n",
 		 mode, nouveau_encoder(encoder)->dcb->index);
 
 	regs->ptv_200 &= ~1;
@@ -619,7 +619,7 @@ static void nv17_tv_destroy(struct drm_encoder *encoder)
 {
 	struct nv17_tv_encoder *tv_enc = to_tv_enc(encoder);
 
-	NV_DEBUG(encoder->dev, "\n");
+	NV_DEBUG_KMS(encoder->dev, "\n");
 
 	drm_encoder_cleanup(encoder);
 	kfree(tv_enc);
diff --git a/drivers/gpu/drm/nouveau/nv50_crtc.c b/drivers/gpu/drm/nouveau/nv50_crtc.c
index f8e28a1..118d328 100644
--- a/drivers/gpu/drm/nouveau/nv50_crtc.c
+++ b/drivers/gpu/drm/nouveau/nv50_crtc.c
@@ -45,7 +45,7 @@ nv50_crtc_lut_load(struct drm_crtc *crtc)
 	void __iomem *lut = nvbo_kmap_obj_iovirtual(nv_crtc->lut.nvbo);
 	int i;
 
-	NV_DEBUG(crtc->dev, "\n");
+	NV_DEBUG_KMS(crtc->dev, "\n");
 
 	for (i = 0; i < 256; i++) {
 		writew(nv_crtc->lut.r[i] >> 2, lut + 8*i + 0);
@@ -68,8 +68,8 @@ nv50_crtc_blank(struct nouveau_crtc *nv_crtc, bool blanked)
 	struct nouveau_channel *evo = dev_priv->evo;
 	int index = nv_crtc->index, ret;
 
-	NV_DEBUG(dev, "index %d\n", nv_crtc->index);
-	NV_DEBUG(dev, "%s\n", blanked ? "blanked" : "unblanked");
+	NV_DEBUG_KMS(dev, "index %d\n", nv_crtc->index);
+	NV_DEBUG_KMS(dev, "%s\n", blanked ? "blanked" : "unblanked");
 
 	if (blanked) {
 		nv_crtc->cursor.hide(nv_crtc, false);
@@ -139,7 +139,7 @@ nv50_crtc_set_dither(struct nouveau_crtc *nv_crtc, bool on, bool update)
 	struct nouveau_channel *evo = dev_priv->evo;
 	int ret;
 
-	NV_DEBUG(dev, "\n");
+	NV_DEBUG_KMS(dev, "\n");
 
 	ret = RING_SPACE(evo, 2 + (update ? 2 : 0));
 	if (ret) {
@@ -193,7 +193,7 @@ nv50_crtc_set_scale(struct nouveau_crtc *nv_crtc, int scaling_mode, bool update)
 	uint32_t outX, outY, horiz, vert;
 	int ret;
 
-	NV_DEBUG(dev, "\n");
+	NV_DEBUG_KMS(dev, "\n");
 
 	switch (scaling_mode) {
 	case DRM_MODE_SCALE_NONE:
@@ -301,7 +301,7 @@ nv50_crtc_destroy(struct drm_crtc *crtc)
 	struct drm_device *dev = crtc->dev;
 	struct nouveau_crtc *nv_crtc = nouveau_crtc(crtc);
 
-	NV_DEBUG(dev, "\n");
+	NV_DEBUG_KMS(dev, "\n");
 
 	if (!crtc)
 		return;
@@ -433,7 +433,7 @@ nv50_crtc_prepare(struct drm_crtc *crtc)
 	struct drm_device *dev = crtc->dev;
 	struct drm_encoder *encoder;
 
-	NV_DEBUG(dev, "index %d\n", nv_crtc->index);
+	NV_DEBUG_KMS(dev, "index %d\n", nv_crtc->index);
 
 	/* Disconnect all unused encoders. */
 	list_for_each_entry(encoder, &dev->mode_config.encoder_list, head) {
@@ -458,7 +458,7 @@ nv50_crtc_commit(struct drm_crtc *crtc)
 	struct nouveau_crtc *nv_crtc = nouveau_crtc(crtc);
 	int ret;
 
-	NV_DEBUG(dev, "index %d\n", nv_crtc->index);
+	NV_DEBUG_KMS(dev, "index %d\n", nv_crtc->index);
 
 	nv50_crtc_blank(nv_crtc, false);
 
@@ -497,7 +497,7 @@ nv50_crtc_do_mode_set_base(struct drm_crtc *crtc, int x, int y,
 	struct nouveau_framebuffer *fb = nouveau_framebuffer(drm_fb);
 	int ret, format;
 
-	NV_DEBUG(dev, "index %d\n", nv_crtc->index);
+	NV_DEBUG_KMS(dev, "index %d\n", nv_crtc->index);
 
 	switch (drm_fb->depth) {
 	case  8:
@@ -612,7 +612,7 @@ nv50_crtc_mode_set(struct drm_crtc *crtc, struct drm_display_mode *mode,
 
 	*nv_crtc->mode = *adjusted_mode;
 
-	NV_DEBUG(dev, "index %d\n", nv_crtc->index);
+	NV_DEBUG_KMS(dev, "index %d\n", nv_crtc->index);
 
 	hsync_dur = adjusted_mode->hsync_end - adjusted_mode->hsync_start;
 	vsync_dur = adjusted_mode->vsync_end - adjusted_mode->vsync_start;
@@ -706,7 +706,7 @@ nv50_crtc_create(struct drm_device *dev, int index)
 	struct nouveau_crtc *nv_crtc = NULL;
 	int ret, i;
 
-	NV_DEBUG(dev, "\n");
+	NV_DEBUG_KMS(dev, "\n");
 
 	nv_crtc = kzalloc(sizeof(*nv_crtc), GFP_KERNEL);
 	if (!nv_crtc)
diff --git a/drivers/gpu/drm/nouveau/nv50_cursor.c b/drivers/gpu/drm/nouveau/nv50_cursor.c
index e2e79a8..753e723 100644
--- a/drivers/gpu/drm/nouveau/nv50_cursor.c
+++ b/drivers/gpu/drm/nouveau/nv50_cursor.c
@@ -41,7 +41,7 @@ nv50_cursor_show(struct nouveau_crtc *nv_crtc, bool update)
 	struct drm_device *dev = nv_crtc->base.dev;
 	int ret;
 
-	NV_DEBUG(dev, "\n");
+	NV_DEBUG_KMS(dev, "\n");
 
 	if (update && nv_crtc->cursor.visible)
 		return;
@@ -76,7 +76,7 @@ nv50_cursor_hide(struct nouveau_crtc *nv_crtc, bool update)
 	struct drm_device *dev = nv_crtc->base.dev;
 	int ret;
 
-	NV_DEBUG(dev, "\n");
+	NV_DEBUG_KMS(dev, "\n");
 
 	if (update && !nv_crtc->cursor.visible)
 		return;
@@ -116,7 +116,7 @@ nv50_cursor_set_pos(struct nouveau_crtc *nv_crtc, int x, int y)
 static void
 nv50_cursor_set_offset(struct nouveau_crtc *nv_crtc, uint32_t offset)
 {
-	NV_DEBUG(nv_crtc->base.dev, "\n");
+	NV_DEBUG_KMS(nv_crtc->base.dev, "\n");
 	if (offset == nv_crtc->cursor.offset)
 		return;
 
@@ -143,7 +143,7 @@ nv50_cursor_fini(struct nouveau_crtc *nv_crtc)
 	struct drm_device *dev = nv_crtc->base.dev;
 	int idx = nv_crtc->index;
 
-	NV_DEBUG(dev, "\n");
+	NV_DEBUG_KMS(dev, "\n");
 
 	nv_wr32(dev, NV50_PDISPLAY_CURSOR_CURSOR_CTRL2(idx), 0);
 	if (!nv_wait(NV50_PDISPLAY_CURSOR_CURSOR_CTRL2(idx),
diff --git a/drivers/gpu/drm/nouveau/nv50_dac.c b/drivers/gpu/drm/nouveau/nv50_dac.c
index fb5838e..f08f042 100644
--- a/drivers/gpu/drm/nouveau/nv50_dac.c
+++ b/drivers/gpu/drm/nouveau/nv50_dac.c
@@ -44,7 +44,7 @@ nv50_dac_disconnect(struct nouveau_encoder *nv_encoder)
 	struct nouveau_channel *evo = dev_priv->evo;
 	int ret;
 
-	NV_DEBUG(dev, "Disconnecting DAC %d\n", nv_encoder->or);
+	NV_DEBUG_KMS(dev, "Disconnecting DAC %d\n", nv_encoder->or);
 
 	ret = RING_SPACE(evo, 2);
 	if (ret) {
@@ -81,11 +81,11 @@ nv50_dac_detect(struct drm_encoder *encoder, struct drm_connector *connector)
 	/* Use bios provided value if possible. */
 	if (dev_priv->vbios->dactestval) {
 		load_pattern = dev_priv->vbios->dactestval;
-		NV_DEBUG(dev, "Using bios provided load_pattern of %d\n",
+		NV_DEBUG_KMS(dev, "Using bios provided load_pattern of %d\n",
 			  load_pattern);
 	} else {
 		load_pattern = 340;
-		NV_DEBUG(dev, "Using default load_pattern of %d\n",
+		NV_DEBUG_KMS(dev, "Using default load_pattern of %d\n",
 			 load_pattern);
 	}
 
@@ -103,9 +103,9 @@ nv50_dac_detect(struct drm_encoder *encoder, struct drm_connector *connector)
 		status = connector_status_connected;
 
 	if (status == connector_status_connected)
-		NV_DEBUG(dev, "Load was detected on output with or %d\n", or);
+		NV_DEBUG_KMS(dev, "Load was detected on output with or %d\n", or);
 	else
-		NV_DEBUG(dev, "Load was not detected on output with or %d\n", or);
+		NV_DEBUG_KMS(dev, "Load was not detected on output with or %d\n", or);
 
 	return status;
 }
@@ -118,7 +118,7 @@ nv50_dac_dpms(struct drm_encoder *encoder, int mode)
 	uint32_t val;
 	int or = nv_encoder->or;
 
-	NV_DEBUG(dev, "or %d mode %d\n", or, mode);
+	NV_DEBUG_KMS(dev, "or %d mode %d\n", or, mode);
 
 	/* wait for it to be done */
 	if (!nv_wait(NV50_PDISPLAY_DAC_DPMS_CTRL(or),
@@ -173,7 +173,7 @@ nv50_dac_mode_fixup(struct drm_encoder *encoder, struct drm_display_mode *mode,
 	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
 	struct nouveau_connector *connector;
 
-	NV_DEBUG(encoder->dev, "or %d\n", nv_encoder->or);
+	NV_DEBUG_KMS(encoder->dev, "or %d\n", nv_encoder->or);
 
 	connector = nouveau_encoder_connector_get(nv_encoder);
 	if (!connector) {
@@ -213,7 +213,7 @@ nv50_dac_mode_set(struct drm_encoder *encoder, struct drm_display_mode *mode,
 	uint32_t mode_ctl = 0, mode_ctl2 = 0;
 	int ret;
 
-	NV_DEBUG(dev, "or %d\n", nv_encoder->or);
+	NV_DEBUG_KMS(dev, "or %d\n", nv_encoder->or);
 
 	nv50_dac_dpms(encoder, DRM_MODE_DPMS_ON);
 
@@ -264,7 +264,7 @@ nv50_dac_destroy(struct drm_encoder *encoder)
 	if (!encoder)
 		return;
 
-	NV_DEBUG(encoder->dev, "\n");
+	NV_DEBUG_KMS(encoder->dev, "\n");
 
 	drm_encoder_cleanup(encoder);
 	kfree(nv_encoder);
@@ -280,7 +280,7 @@ nv50_dac_create(struct drm_device *dev, struct dcb_entry *entry)
 	struct nouveau_encoder *nv_encoder;
 	struct drm_encoder *encoder;
 
-	NV_DEBUG(dev, "\n");
+	NV_DEBUG_KMS(dev, "\n");
 	NV_INFO(dev, "Detected a DAC output\n");
 
 	nv_encoder = kzalloc(sizeof(*nv_encoder), GFP_KERNEL);
diff --git a/drivers/gpu/drm/nouveau/nv50_display.c b/drivers/gpu/drm/nouveau/nv50_display.c
index 12c5ee6..a9263d9 100644
--- a/drivers/gpu/drm/nouveau/nv50_display.c
+++ b/drivers/gpu/drm/nouveau/nv50_display.c
@@ -188,7 +188,7 @@ nv50_display_init(struct drm_device *dev)
 	uint64_t start;
 	int ret, i;
 
-	NV_DEBUG(dev, "\n");
+	NV_DEBUG_KMS(dev, "\n");
 
 	nv_wr32(dev, 0x00610184, nv_rd32(dev, 0x00614004));
 	/*
@@ -232,7 +232,7 @@ nv50_display_init(struct drm_device *dev)
 	nv_wr32(dev, NV50_PDISPLAY_UNK_380, 0);
 	/* RAM is clamped to 256 MiB. */
 	ram_amount = nouveau_mem_fb_amount(dev);
-	NV_DEBUG(dev, "ram_amount %d\n", ram_amount);
+	NV_DEBUG_KMS(dev, "ram_amount %d\n", ram_amount);
 	if (ram_amount > 256*1024*1024)
 		ram_amount = 256*1024*1024;
 	nv_wr32(dev, NV50_PDISPLAY_RAM_AMOUNT, ram_amount - 1);
@@ -398,7 +398,7 @@ static int nv50_display_disable(struct drm_device *dev)
 	struct drm_crtc *drm_crtc;
 	int ret, i;
 
-	NV_DEBUG(dev, "\n");
+	NV_DEBUG_KMS(dev, "\n");
 
 	list_for_each_entry(drm_crtc, &dev->mode_config.crtc_list, head) {
 		struct nouveau_crtc *crtc = nouveau_crtc(drm_crtc);
@@ -469,7 +469,7 @@ int nv50_display_create(struct drm_device *dev)
 	uint32_t connector[16] = {};
 	int ret, i;
 
-	NV_DEBUG(dev, "\n");
+	NV_DEBUG_KMS(dev, "\n");
 
 	/* init basic kernel modesetting */
 	drm_mode_config_init(dev);
@@ -573,7 +573,7 @@ int nv50_display_destroy(struct drm_device *dev)
 {
 	struct drm_nouveau_private *dev_priv = dev->dev_private;
 
-	NV_DEBUG(dev, "\n");
+	NV_DEBUG_KMS(dev, "\n");
 
 	drm_mode_config_cleanup(dev);
 
@@ -617,7 +617,7 @@ nv50_display_irq_head(struct drm_device *dev, int *phead,
 	 * CRTC separately, and submission will be blocked by the GPU
 	 * until we handle each in turn.
 	 */
-	NV_DEBUG(dev, "0x610030: 0x%08x\n", unk30);
+	NV_DEBUG_KMS(dev, "0x610030: 0x%08x\n", unk30);
 	head = ffs((unk30 >> 9) & 3) - 1;
 	if (head < 0)
 		return -EINVAL;
@@ -661,7 +661,7 @@ nv50_display_irq_head(struct drm_device *dev, int *phead,
 		or = i;
 	}
 
-	NV_DEBUG(dev, "type %d, or %d\n", type, or);
+	NV_DEBUG_KMS(dev, "type %d, or %d\n", type, or);
 	if (type == OUTPUT_ANY) {
 		NV_ERROR(dev, "unknown encoder!!\n");
 		return -1;
@@ -811,7 +811,7 @@ nv50_display_unk20_handler(struct drm_device *dev)
 	pclk = nv_rd32(dev, NV50_PDISPLAY_CRTC_P(head, CLOCK)) & 0x3fffff;
 	script = nv50_display_script_select(dev, dcbent, pclk);
 
-	NV_DEBUG(dev, "head %d pxclk: %dKHz\n", head, pclk);
+	NV_DEBUG_KMS(dev, "head %d pxclk: %dKHz\n", head, pclk);
 
 	if (dcbent->type != OUTPUT_DP)
 		nouveau_bios_run_display_table(dev, dcbent, 0, -2);
@@ -870,7 +870,7 @@ nv50_display_irq_handler_bh(struct work_struct *work)
 		uint32_t intr0 = nv_rd32(dev, NV50_PDISPLAY_INTR_0);
 		uint32_t intr1 = nv_rd32(dev, NV50_PDISPLAY_INTR_1);
 
-		NV_DEBUG(dev, "PDISPLAY_INTR_BH 0x%08x 0x%08x\n", intr0, intr1);
+		NV_DEBUG_KMS(dev, "PDISPLAY_INTR_BH 0x%08x 0x%08x\n", intr0, intr1);
 
 		if (intr1 & NV50_PDISPLAY_INTR_1_CLK_UNK10)
 			nv50_display_unk10_handler(dev);
@@ -974,7 +974,7 @@ nv50_display_irq_handler(struct drm_device *dev)
 		uint32_t intr1 = nv_rd32(dev, NV50_PDISPLAY_INTR_1);
 		uint32_t clock;
 
-		NV_DEBUG(dev, "PDISPLAY_INTR 0x%08x 0x%08x\n", intr0, intr1);
+		NV_DEBUG_KMS(dev, "PDISPLAY_INTR 0x%08x 0x%08x\n", intr0, intr1);
 
 		if (!intr0 && !(intr1 & ~delayed))
 			break;
diff --git a/drivers/gpu/drm/nouveau/nv50_sor.c b/drivers/gpu/drm/nouveau/nv50_sor.c
index 8c28046..e395c16 100644
--- a/drivers/gpu/drm/nouveau/nv50_sor.c
+++ b/drivers/gpu/drm/nouveau/nv50_sor.c
@@ -44,7 +44,7 @@ nv50_sor_disconnect(struct nouveau_encoder *nv_encoder)
 	struct nouveau_channel *evo = dev_priv->evo;
 	int ret;
 
-	NV_DEBUG(dev, "Disconnecting SOR %d\n", nv_encoder->or);
+	NV_DEBUG_KMS(dev, "Disconnecting SOR %d\n", nv_encoder->or);
 
 	ret = RING_SPACE(evo, 2);
 	if (ret) {
@@ -70,7 +70,7 @@ nv50_sor_dp_link_train(struct drm_encoder *encoder)
 	}
 
 	if (dpe->script0) {
-		NV_DEBUG(dev, "SOR-%d: running DP script 0\n", nv_encoder->or);
+		NV_DEBUG_KMS(dev, "SOR-%d: running DP script 0\n", nv_encoder->or);
 		nouveau_bios_run_init_table(dev, le16_to_cpu(dpe->script0),
 					    nv_encoder->dcb);
 	}
@@ -79,7 +79,7 @@ nv50_sor_dp_link_train(struct drm_encoder *encoder)
 		NV_ERROR(dev, "SOR-%d: link training failed\n", nv_encoder->or);
 
 	if (dpe->script1) {
-		NV_DEBUG(dev, "SOR-%d: running DP script 1\n", nv_encoder->or);
+		NV_DEBUG_KMS(dev, "SOR-%d: running DP script 1\n", nv_encoder->or);
 		nouveau_bios_run_init_table(dev, le16_to_cpu(dpe->script1),
 					    nv_encoder->dcb);
 	}
@@ -93,7 +93,7 @@ nv50_sor_dpms(struct drm_encoder *encoder, int mode)
 	uint32_t val;
 	int or = nv_encoder->or;
 
-	NV_DEBUG(dev, "or %d mode %d\n", or, mode);
+	NV_DEBUG_KMS(dev, "or %d mode %d\n", or, mode);
 
 	/* wait for it to be done */
 	if (!nv_wait(NV50_PDISPLAY_SOR_DPMS_CTRL(or),
@@ -142,7 +142,7 @@ nv50_sor_mode_fixup(struct drm_encoder *encoder, struct drm_display_mode *mode,
 	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
 	struct nouveau_connector *connector;
 
-	NV_DEBUG(encoder->dev, "or %d\n", nv_encoder->or);
+	NV_DEBUG_KMS(encoder->dev, "or %d\n", nv_encoder->or);
 
 	connector = nouveau_encoder_connector_get(nv_encoder);
 	if (!connector) {
@@ -182,7 +182,7 @@ nv50_sor_mode_set(struct drm_encoder *encoder, struct drm_display_mode *mode,
 	uint32_t mode_ctl = 0;
 	int ret;
 
-	NV_DEBUG(dev, "or %d\n", nv_encoder->or);
+	NV_DEBUG_KMS(dev, "or %d\n", nv_encoder->or);
 
 	nv50_sor_dpms(encoder, DRM_MODE_DPMS_ON);
 
@@ -246,7 +246,7 @@ nv50_sor_destroy(struct drm_encoder *encoder)
 	if (!encoder)
 		return;
 
-	NV_DEBUG(encoder->dev, "\n");
+	NV_DEBUG_KMS(encoder->dev, "\n");
 
 	drm_encoder_cleanup(encoder);
 
@@ -265,7 +265,7 @@ nv50_sor_create(struct drm_device *dev, struct dcb_entry *entry)
 	bool dum;
 	int type;
 
-	NV_DEBUG(dev, "\n");
+	NV_DEBUG_KMS(dev, "\n");
 
 	switch (entry->type) {
 	case OUTPUT_TMDS:
-- 
1.6.5.4

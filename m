From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: [PATCH 1/4] drm/nouveau: add reg_debug module parameter
Date: Sun,  6 Sep 2009 21:16:00 +0300
Message-ID: <1252260963-5163-1-git-send-email-pq@iki.fi>
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

The various register access wrappers in nouveau_hw.h are so noisy when
drm.debug > 0, that some of them can overflow the kernel message buffer.

Add nouveau.ko parameter 'reg_debug', a bitmask that enables each of the
wrapper debug messages individually. By default, nothing is printed.

Signed-off-by: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_drv.c |    6 ++++
 drivers/gpu/drm/nouveau/nouveau_drv.h |   20 +++++++++++++++
 drivers/gpu/drm/nouveau/nouveau_hw.h  |   42 +++++++++++++++++---------------
 3 files changed, 48 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.c b/drivers/gpu/drm/nouveau/nouveau_drv.c
index e9f9abd..d17b16c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.c
@@ -66,6 +66,12 @@ MODULE_PARM_DESC(tv_norm, "Default TV norm.\n"
 char *nouveau_tv_norm = NULL;
 module_param_named(tv_norm, nouveau_tv_norm, charp, 0400);
 
+MODULE_PARM_DESC(reg_debug, "Reg debug bitmask: 0x1 mc, 0x2 video, 0x4 fb, 0x8 extdev,\n"
+		"\t\t0x10 misc regs, 0x20 crtc, 0x40 ramdac, 0x80 vgacrtc,\n"
+		"\t\t0x100 rmvio, 0x200 vgaattr.\n");
+int nouveau_reg_debug;
+module_param_named(reg_debug, nouveau_reg_debug, int, 0600);
+
 int nouveau_fbpercrtc = 0;
 #if 0
 module_param_named(fbpercrtc, nouveau_fbpercrtc, int, 0400);
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index 4a1efa1..aed773e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -620,6 +620,7 @@ extern int nouveau_uscript_tmds;
 extern int nouveau_vram_pushbuf;
 extern int nouveau_fbpercrtc;
 extern char *nouveau_tv_norm;
+extern int nouveau_reg_debug;
 
 /* nouveau_state.c */
 extern void nouveau_preclose(struct drm_device *dev, struct drm_file *);
@@ -1111,6 +1112,25 @@ static inline void nv_wo32(struct drm_device *dev, struct nouveau_gpuobj *obj,
 #define NV_TRACE(d, fmt, arg...) NV_PRINTK(KERN_INFO, d, fmt, ##arg)
 #define NV_WARN(d, fmt, arg...) NV_PRINTK(KERN_WARNING, d, fmt, ##arg)
 
+/* nouveau_reg_debug bitmask */
+enum {
+	NOUVEAU_REG_DEBUG_MC             = 0x1,
+	NOUVEAU_REG_DEBUG_VIDEO          = 0x2,
+	NOUVEAU_REG_DEBUG_FB             = 0x4,
+	NOUVEAU_REG_DEBUG_EXTDEV         = 0x8,
+	NOUVEAU_REG_DEBUG_REG            = 0x10,
+	NOUVEAU_REG_DEBUG_CRTC           = 0x20,
+	NOUVEAU_REG_DEBUG_RAMDAC         = 0x40,
+	NOUVEAU_REG_DEBUG_VGACRTC        = 0x80,
+	NOUVEAU_REG_DEBUG_RMVIO          = 0x100,
+	NOUVEAU_REG_DEBUG_VGAATTR        = 0x200,
+};
+
+#define NV_REG_DEBUG(type, dev, fmt, arg...) do { \
+	if (nouveau_reg_debug & NOUVEAU_REG_DEBUG_##type) \
+		NV_PRINTK(KERN_DEBUG, dev, "%s: " fmt, __func__, ##arg); \
+} while (0)
+
 static inline enum nouveau_card_type
 nv_arch(struct drm_device *dev)
 {
diff --git a/drivers/gpu/drm/nouveau/nouveau_hw.h b/drivers/gpu/drm/nouveau/nouveau_hw.h
index 129345e..a1880c4 100644
--- a/drivers/gpu/drm/nouveau/nouveau_hw.h
+++ b/drivers/gpu/drm/nouveau/nouveau_hw.h
@@ -59,14 +59,14 @@ static inline uint32_t
 nvReadMC(struct drm_device *dev, uint32_t reg)
 {
 	uint32_t val = nv_rd32(dev, reg);
-	NV_DEBUG(dev, "nvReadMC: reg %08x val %08x\n", reg, val);
+	NV_REG_DEBUG(MC, dev, "reg %08x val %08x\n", reg, val);
 	return val;
 }
 
 static inline void
 nvWriteMC(struct drm_device *dev, uint32_t reg, uint32_t val)
 {
-	NV_DEBUG(dev, "nvWriteMC: reg %08x val %08x\n", reg, val);
+	NV_REG_DEBUG(MC, dev, "reg %08x val %08x\n", reg, val);
 	nv_wr32(dev, reg, val);
 }
 
@@ -74,14 +74,14 @@ static inline uint32_t
 nvReadVIDEO(struct drm_device *dev, uint32_t reg)
 {
 	uint32_t val = nv_rd32(dev, reg);
-	NV_DEBUG(dev, "nvReadVIDEO: reg %08x val %08x\n", reg, val);
+	NV_REG_DEBUG(VIDEO, dev, "reg %08x val %08x\n", reg, val);
 	return val;
 }
 
 static inline void
 nvWriteVIDEO(struct drm_device *dev, uint32_t reg, uint32_t val)
 {
-	NV_DEBUG(dev, "nvWriteVIDEO: reg %08x val %08x\n", reg, val);
+	NV_REG_DEBUG(VIDEO, dev, "reg %08x val %08x\n", reg, val);
 	nv_wr32(dev, reg, val);
 }
 
@@ -89,14 +89,14 @@ static inline uint32_t
 nvReadFB(struct drm_device *dev, uint32_t reg)
 {
 	uint32_t val = nv_rd32(dev, reg);
-	NV_DEBUG(dev, "nvReadFB: reg %08x val %08x\n", reg, val);
+	NV_REG_DEBUG(FB, dev, "reg %08x val %08x\n", reg, val);
 	return val;
 }
 
 static inline void
 nvWriteFB(struct drm_device *dev, uint32_t reg, uint32_t val)
 {
-	NV_DEBUG(dev, "nvWriteFB: reg %08x val %08x\n", reg, val);
+	NV_REG_DEBUG(FB, dev, "reg %08x val %08x\n", reg, val);
 	nv_wr32(dev, reg, val);
 }
 
@@ -104,27 +104,27 @@ static inline uint32_t
 nvReadEXTDEV(struct drm_device *dev, uint32_t reg)
 {
 	uint32_t val = nv_rd32(dev, reg);
-	NV_DEBUG(dev, "nvReadEXTDEV: reg %08x val %08x\n", reg, val);
+	NV_REG_DEBUG(EXTDEV, dev, "reg %08x val %08x\n", reg, val);
 	return val;
 }
 
 static inline void
 nvWriteEXTDEV(struct drm_device *dev, uint32_t reg, uint32_t val)
 {
-	NV_DEBUG(dev, "nvWriteEXTDEV: reg %08x val %08x\n", reg, val);
+	NV_REG_DEBUG(EXTDEV, dev, "reg %08x val %08x\n", reg, val);
 	nv_wr32(dev, reg, val);
 }
 
 static inline uint32_t NVRead(struct drm_device *dev, uint32_t reg)
 {
-	NV_DEBUG(dev, "NVRead: reg %08x val %08x\n", reg,
+	NV_REG_DEBUG(REG, dev, "reg %08x val %08x\n", reg,
 					(uint32_t)nv_rd32(dev, reg));
 	return nv_rd32(dev, reg);
 }
 
 static inline void NVWrite(struct drm_device *dev, uint32_t reg, uint32_t val)
 {
-	NV_DEBUG(dev, "NVWrite: reg %08x val %08x\n", reg, val);
+	NV_REG_DEBUG(REG, dev, "reg %08x val %08x\n", reg, val);
 	nv_wr32(dev, reg, val);
 }
 
@@ -132,7 +132,7 @@ static inline uint32_t NVReadCRTC(struct drm_device *dev, int head, uint32_t reg
 {
 	if (head)
 		reg += NV_PCRTC0_SIZE;
-	NV_DEBUG(dev, "NVReadCRTC: head %d reg %08x val %08x\n", head, reg,
+	NV_REG_DEBUG(CRTC, dev, "head %d reg %08x val %08x\n", head, reg,
 							nv_rd32(dev, reg));
 	return nv_rd32(dev, reg);
 }
@@ -141,7 +141,7 @@ static inline void NVWriteCRTC(struct drm_device *dev, int head, uint32_t reg, u
 {
 	if (head)
 		reg += NV_PCRTC0_SIZE;
-	NV_DEBUG(dev, "NVWriteCRTC: head %d reg %08x val %08x\n", head, reg, val);
+	NV_REG_DEBUG(CRTC, dev, "head %d reg %08x val %08x\n", head, reg, val);
 	nv_wr32(dev, reg, val);
 }
 
@@ -149,7 +149,7 @@ static inline uint32_t NVReadRAMDAC(struct drm_device *dev, int head, uint32_t r
 {
 	if (head)
 		reg += NV_PRAMDAC0_SIZE;
-	NV_DEBUG(dev, "NVReadRamdac: head %d reg %08x val %08x\n", head, reg,
+	NV_REG_DEBUG(RAMDAC, dev, "head %d reg %08x val %08x\n", head, reg,
 							nv_rd32(dev, reg));
 	return nv_rd32(dev, reg);
 }
@@ -159,7 +159,7 @@ NVWriteRAMDAC(struct drm_device *dev, int head, uint32_t reg, uint32_t val)
 {
 	if (head)
 		reg += NV_PRAMDAC0_SIZE;
-	NV_DEBUG(dev, "NVWriteRamdac: head %d reg %08x val %08x\n", head, reg, val);
+	NV_REG_DEBUG(RAMDAC, dev, "head %d reg %08x val %08x\n", head, reg, val);
 	nv_wr32(dev, reg, val);
 }
 
@@ -184,7 +184,8 @@ nv_write_tmds(struct drm_device *dev, int or, int dl, uint8_t address, uint8_t d
 static inline void
 NVWriteVgaCrtc(struct drm_device *dev, int head, uint8_t index, uint8_t value)
 {
-	NV_DEBUG(dev, "NVWriteVgaCrtc: head %d index 0x%02x data 0x%02x\n", head, index, value);
+	NV_REG_DEBUG(VGACRTC, dev, "head %d index 0x%02x data 0x%02x\n",
+							head, index, value);
 	nv_wr08(dev, NV_PRMCIO_CRX__COLOR + head * NV_PRMCIO_SIZE, index);
 	nv_wr08(dev, NV_PRMCIO_CR__COLOR + head * NV_PRMCIO_SIZE, value);
 }
@@ -192,7 +193,7 @@ NVWriteVgaCrtc(struct drm_device *dev, int head, uint8_t index, uint8_t value)
 static inline uint8_t NVReadVgaCrtc(struct drm_device *dev, int head, uint8_t index)
 {
 	nv_wr08(dev, NV_PRMCIO_CRX__COLOR + head * NV_PRMCIO_SIZE, index);
-	NV_DEBUG(dev, "NVReadVgaCrtc: head %d index 0x%02x data 0x%02x\n",
+	NV_REG_DEBUG(VGACRTC, dev, "head %d index 0x%02x data 0x%02x\n",
 		head, index,
 		nv_rd08(dev, NV_PRMCIO_CR__COLOR + head * NV_PRMCIO_SIZE));
 	return nv_rd08(dev, NV_PRMCIO_CR__COLOR + head * NV_PRMCIO_SIZE);
@@ -232,7 +233,7 @@ static inline uint8_t NVReadPRMVIO(struct drm_device *dev, int head, uint32_t re
 	if (head && nv_arch(dev) == NV_40)
 		reg += NV_PRMVIO_SIZE;
 
-	NV_DEBUG(dev, "NVReadPRMVIO: head %d reg %08x val %02x\n", head, reg,
+	NV_REG_DEBUG(RMVIO, dev, "head %d reg %08x val %02x\n", head, reg,
 							nv_rd08(dev, reg));
 	return nv_rd08(dev, reg);
 }
@@ -245,7 +246,8 @@ NVWritePRMVIO(struct drm_device *dev, int head, uint32_t reg, uint8_t value)
 	if (head && nv_arch(dev) == NV_40)
 		reg += NV_PRMVIO_SIZE;
 
-	NV_DEBUG(dev, "NVWritePRMVIO: head %d reg %08x val %02x\n", head, reg, value);
+	NV_REG_DEBUG(RMVIO, dev, "head %d reg %08x val %02x\n",
+						head, reg, value);
 	nv_wr08(dev, reg, value);
 }
 
@@ -269,7 +271,7 @@ static inline void NVWriteVgaAttr(struct drm_device *dev, int head, uint8_t inde
 		index |= 0x20;
 
 	nv_rd08(dev, NV_PRMCIO_INP0__COLOR + head * NV_PRMCIO_SIZE);
-	NV_DEBUG(dev, "NVWriteVgaAttr: head %d index 0x%02x data 0x%02x\n",
+	NV_REG_DEBUG(VGAATTR, dev, "head %d index 0x%02x data 0x%02x\n",
 							head, index, value);
 	nv_wr08(dev, NV_PRMCIO_ARX + head * NV_PRMCIO_SIZE, index);
 	nv_wr08(dev, NV_PRMCIO_AR__WRITE + head * NV_PRMCIO_SIZE, value);
@@ -284,7 +286,7 @@ static inline uint8_t NVReadVgaAttr(struct drm_device *dev, int head, uint8_t in
 
 	nv_rd08(dev, NV_PRMCIO_INP0__COLOR + head * NV_PRMCIO_SIZE);
 	nv_wr08(dev, NV_PRMCIO_ARX + head * NV_PRMCIO_SIZE, index);
-	NV_DEBUG(dev, "NVReadVgaAttr: head %d index 0x%02x data 0x%02x\n",
+	NV_REG_DEBUG(VGAATTR, dev, "head %d index 0x%02x data 0x%02x\n",
 		head, index,
 		nv_rd08(dev, NV_PRMCIO_AR__READ + head * NV_PRMCIO_SIZE));
 	return nv_rd08(dev, NV_PRMCIO_AR__READ + head * NV_PRMCIO_SIZE);
-- 
1.6.3.3

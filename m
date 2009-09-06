From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: [PATCH 2/4] drm/nouveau: fix double reg read if drm.debug
Date: Sun,  6 Sep 2009 21:16:01 +0300
Message-ID: <1252260963-5163-2-git-send-email-pq@iki.fi>
References: <1252260963-5163-1-git-send-email-pq@iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1252260963-5163-1-git-send-email-pq-X3B1VOXEql0@public.gmane.org>
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

Several register read wrappers in nouveau_hw.h did the MMIO read twice,
but only if debugging was enabled. Fix these to first read the register,
then debug-print the value, instead of reading it once for debug and
once for real.

Also, fix some style issues with long lines around the fixes.

Signed-off-by: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_hw.h |   86 ++++++++++++++++++++--------------
 1 files changed, 51 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_hw.h b/drivers/gpu/drm/nouveau/nouveau_hw.h
index a1880c4..a27e0d0 100644
--- a/drivers/gpu/drm/nouveau/nouveau_hw.h
+++ b/drivers/gpu/drm/nouveau/nouveau_hw.h
@@ -117,9 +117,9 @@ nvWriteEXTDEV(struct drm_device *dev, uint32_t reg, uint32_t val)
 
 static inline uint32_t NVRead(struct drm_device *dev, uint32_t reg)
 {
-	NV_REG_DEBUG(REG, dev, "reg %08x val %08x\n", reg,
-					(uint32_t)nv_rd32(dev, reg));
-	return nv_rd32(dev, reg);
+	uint32_t val = nv_rd32(dev, reg);
+	NV_REG_DEBUG(REG, dev, "reg %08x val %08x\n", reg, val);
+	return val;
 }
 
 static inline void NVWrite(struct drm_device *dev, uint32_t reg, uint32_t val)
@@ -128,16 +128,19 @@ static inline void NVWrite(struct drm_device *dev, uint32_t reg, uint32_t val)
 	nv_wr32(dev, reg, val);
 }
 
-static inline uint32_t NVReadCRTC(struct drm_device *dev, int head, uint32_t reg)
+static inline uint32_t NVReadCRTC(struct drm_device *dev,
+					int head, uint32_t reg)
 {
+	uint32_t val;
 	if (head)
 		reg += NV_PCRTC0_SIZE;
-	NV_REG_DEBUG(CRTC, dev, "head %d reg %08x val %08x\n", head, reg,
-							nv_rd32(dev, reg));
-	return nv_rd32(dev, reg);
+	val = nv_rd32(dev, reg);
+	NV_REG_DEBUG(CRTC, dev, "head %d reg %08x val %08x\n", head, reg, val);
+	return val;
 }
 
-static inline void NVWriteCRTC(struct drm_device *dev, int head, uint32_t reg, uint32_t val)
+static inline void NVWriteCRTC(struct drm_device *dev,
+					int head, uint32_t reg, uint32_t val)
 {
 	if (head)
 		reg += NV_PCRTC0_SIZE;
@@ -145,25 +148,30 @@ static inline void NVWriteCRTC(struct drm_device *dev, int head, uint32_t reg, u
 	nv_wr32(dev, reg, val);
 }
 
-static inline uint32_t NVReadRAMDAC(struct drm_device *dev, int head, uint32_t reg)
+static inline uint32_t NVReadRAMDAC(struct drm_device *dev,
+					int head, uint32_t reg)
 {
+	uint32_t val;
 	if (head)
 		reg += NV_PRAMDAC0_SIZE;
-	NV_REG_DEBUG(RAMDAC, dev, "head %d reg %08x val %08x\n", head, reg,
-							nv_rd32(dev, reg));
-	return nv_rd32(dev, reg);
+	val = nv_rd32(dev, reg);
+	NV_REG_DEBUG(RAMDAC, dev, "head %d reg %08x val %08x\n",
+							head, reg, val);
+	return val;
 }
 
-static inline void
-NVWriteRAMDAC(struct drm_device *dev, int head, uint32_t reg, uint32_t val)
+static inline void NVWriteRAMDAC(struct drm_device *dev,
+					int head, uint32_t reg, uint32_t val)
 {
 	if (head)
 		reg += NV_PRAMDAC0_SIZE;
-	NV_REG_DEBUG(RAMDAC, dev, "head %d reg %08x val %08x\n", head, reg, val);
+	NV_REG_DEBUG(RAMDAC, dev, "head %d reg %08x val %08x\n",
+							head, reg, val);
 	nv_wr32(dev, reg, val);
 }
 
-static inline uint8_t nv_read_tmds(struct drm_device *dev, int or, int dl, uint8_t address)
+static inline uint8_t nv_read_tmds(struct drm_device *dev,
+					int or, int dl, uint8_t address)
 {
 	int ramdac = (or & OUTPUT_C) >> 2;
 
@@ -172,8 +180,9 @@ static inline uint8_t nv_read_tmds(struct drm_device *dev, int or, int dl, uint8
 	return NVReadRAMDAC(dev, ramdac, NV_PRAMDAC_FP_TMDS_DATA + dl * 8);
 }
 
-static inline void
-nv_write_tmds(struct drm_device *dev, int or, int dl, uint8_t address, uint8_t data)
+static inline void nv_write_tmds(struct drm_device *dev,
+					int or, int dl, uint8_t address,
+					uint8_t data)
 {
 	int ramdac = (or & OUTPUT_C) >> 2;
 
@@ -181,8 +190,8 @@ nv_write_tmds(struct drm_device *dev, int or, int dl, uint8_t address, uint8_t d
 	NVWriteRAMDAC(dev, ramdac, NV_PRAMDAC_FP_TMDS_CONTROL + dl * 8, address);
 }
 
-static inline void
-NVWriteVgaCrtc(struct drm_device *dev, int head, uint8_t index, uint8_t value)
+static inline void NVWriteVgaCrtc(struct drm_device *dev,
+					int head, uint8_t index, uint8_t value)
 {
 	NV_REG_DEBUG(VGACRTC, dev, "head %d index 0x%02x data 0x%02x\n",
 							head, index, value);
@@ -190,13 +199,15 @@ NVWriteVgaCrtc(struct drm_device *dev, int head, uint8_t index, uint8_t value)
 	nv_wr08(dev, NV_PRMCIO_CR__COLOR + head * NV_PRMCIO_SIZE, value);
 }
 
-static inline uint8_t NVReadVgaCrtc(struct drm_device *dev, int head, uint8_t index)
+static inline uint8_t NVReadVgaCrtc(struct drm_device *dev,
+					int head, uint8_t index)
 {
+	uint8_t val;
 	nv_wr08(dev, NV_PRMCIO_CRX__COLOR + head * NV_PRMCIO_SIZE, index);
+	val = nv_rd08(dev, NV_PRMCIO_CR__COLOR + head * NV_PRMCIO_SIZE);
 	NV_REG_DEBUG(VGACRTC, dev, "head %d index 0x%02x data 0x%02x\n",
-		head, index,
-		nv_rd08(dev, NV_PRMCIO_CR__COLOR + head * NV_PRMCIO_SIZE));
-	return nv_rd08(dev, NV_PRMCIO_CR__COLOR + head * NV_PRMCIO_SIZE);
+							head, index, val);
+	return val;
 }
 
 /* CR57 and CR58 are a fun pair of regs. CR57 provides an index (0-0xf) for CR58
@@ -226,20 +237,22 @@ static inline uint8_t NVReadVgaCrtc5758(struct drm_device *dev, int head, uint8_
 	return NVReadVgaCrtc(dev, head, NV_CIO_CRE_58);
 }
 
-static inline uint8_t NVReadPRMVIO(struct drm_device *dev, int head, uint32_t reg)
+static inline uint8_t NVReadPRMVIO(struct drm_device *dev,
+					int head, uint32_t reg)
 {
+	uint8_t val;
 	/* Only NV4x have two pvio ranges; other twoHeads cards MUST call
 	 * NVSetOwner for the relevant head to be programmed */
 	if (head && nv_arch(dev) == NV_40)
 		reg += NV_PRMVIO_SIZE;
 
-	NV_REG_DEBUG(RMVIO, dev, "head %d reg %08x val %02x\n", head, reg,
-							nv_rd08(dev, reg));
-	return nv_rd08(dev, reg);
+	val = nv_rd08(dev, reg);
+	NV_REG_DEBUG(RMVIO, dev, "head %d reg %08x val %02x\n", head, reg, val);
+	return val;
 }
 
-static inline void
-NVWritePRMVIO(struct drm_device *dev, int head, uint32_t reg, uint8_t value)
+static inline void NVWritePRMVIO(struct drm_device *dev,
+					int head, uint32_t reg, uint8_t value)
 {
 	/* Only NV4x have two pvio ranges; other twoHeads cards MUST call
 	 * NVSetOwner for the relevant head to be programmed */
@@ -263,7 +276,8 @@ static inline bool NVGetEnablePalette(struct drm_device *dev, int head)
 	return !(nv_rd08(dev, NV_PRMCIO_ARX + head * NV_PRMCIO_SIZE) & 0x20);
 }
 
-static inline void NVWriteVgaAttr(struct drm_device *dev, int head, uint8_t index, uint8_t value)
+static inline void NVWriteVgaAttr(struct drm_device *dev,
+					int head, uint8_t index, uint8_t value)
 {
 	if (NVGetEnablePalette(dev, head))
 		index &= ~0x20;
@@ -277,8 +291,10 @@ static inline void NVWriteVgaAttr(struct drm_device *dev, int head, uint8_t inde
 	nv_wr08(dev, NV_PRMCIO_AR__WRITE + head * NV_PRMCIO_SIZE, value);
 }
 
-static inline uint8_t NVReadVgaAttr(struct drm_device *dev, int head, uint8_t index)
+static inline uint8_t NVReadVgaAttr(struct drm_device *dev,
+					int head, uint8_t index)
 {
+	uint8_t val;
 	if (NVGetEnablePalette(dev, head))
 		index &= ~0x20;
 	else
@@ -286,10 +302,10 @@ static inline uint8_t NVReadVgaAttr(struct drm_device *dev, int head, uint8_t in
 
 	nv_rd08(dev, NV_PRMCIO_INP0__COLOR + head * NV_PRMCIO_SIZE);
 	nv_wr08(dev, NV_PRMCIO_ARX + head * NV_PRMCIO_SIZE, index);
+	val = nv_rd08(dev, NV_PRMCIO_AR__READ + head * NV_PRMCIO_SIZE);
 	NV_REG_DEBUG(VGAATTR, dev, "head %d index 0x%02x data 0x%02x\n",
-		head, index,
-		nv_rd08(dev, NV_PRMCIO_AR__READ + head * NV_PRMCIO_SIZE));
-	return nv_rd08(dev, NV_PRMCIO_AR__READ + head * NV_PRMCIO_SIZE);
+							head, index, val);
+	return val;
 }
 
 static inline void NVVgaSeqReset(struct drm_device *dev, int head, bool start)
-- 
1.6.3.3

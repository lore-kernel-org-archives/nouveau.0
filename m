From: =?utf-8?q?Marcin=20Ko=C5=9Bcielnicki?= <koriakin-mP9o5jsk0RY@public.gmane.org>
Subject: [PATCH 2/2] drm/nouveau: Kill global state in BIOS script
	interpreter
Date: Tue, 15 Dec 2009 00:37:31 +0000
Message-ID: <1260837451-2060-2-git-send-email-koriakin@0x04.net>
References: <1260837451-2060-1-git-send-email-koriakin@0x04.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1260837451-2060-1-git-send-email-koriakin-mP9o5jsk0RY@public.gmane.org>
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

---
 drivers/gpu/drm/nouveau/nouveau_bios.c |  562 ++++++++++++++++----------------
 drivers/gpu/drm/nouveau/nouveau_bios.h |    1 +
 2 files changed, 276 insertions(+), 287 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bios.c b/drivers/gpu/drm/nouveau/nouveau_bios.c
index 04ac564..49aa83b 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bios.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bios.c
@@ -256,10 +256,7 @@ static bool NVShadowVBIOS(struct drm_device *dev, uint8_t *data)
 struct init_tbl_entry {
 	char *name;
 	uint8_t id;
-	int length;
-	int length_offset;
-	int length_multiplier;
-	bool (*handler)(struct nvbios *, uint16_t, struct init_exec *);
+	int (*handler)(struct nvbios *, uint16_t, struct init_exec *);
 };
 
 struct bit_entry {
@@ -815,7 +812,7 @@ static uint32_t get_tmds_index_reg(struct drm_device *dev, uint8_t mlv)
 	}
 }
 
-static bool
+static int
 init_io_restrict_prog(struct nvbios *bios, uint16_t offset,
 		      struct init_exec *iexec)
 {
@@ -847,9 +844,10 @@ init_io_restrict_prog(struct nvbios *bios, uint16_t offset,
 	uint32_t reg = ROM32(bios->data[offset + 7]);
 	uint8_t config;
 	uint32_t configval;
+	int len = 11 + count * 4;
 
 	if (!iexec->execute)
-		return true;
+		return len;
 
 	BIOSLOG(bios, "0x%04X: Port: 0x%04X, Index: 0x%02X, Mask: 0x%02X, "
 		      "Shift: 0x%02X, Count: 0x%02X, Reg: 0x%08X\n",
@@ -860,7 +858,7 @@ init_io_restrict_prog(struct nvbios *bios, uint16_t offset,
 		NV_ERROR(bios->dev,
 			 "0x%04X: Config 0x%02X exceeds maximal bound 0x%02X\n",
 			 offset, config, count);
-		return false;
+		return 0;
 	}
 
 	configval = ROM32(bios->data[offset + 11 + config * 4]);
@@ -869,10 +867,10 @@ init_io_restrict_prog(struct nvbios *bios, uint16_t offset,
 
 	bios_wr32(bios, reg, configval);
 
-	return true;
+	return len;
 }
 
-static bool
+static int
 init_repeat(struct nvbios *bios, uint16_t offset, struct init_exec *iexec)
 {
 	/*
@@ -907,10 +905,10 @@ init_repeat(struct nvbios *bios, uint16_t offset, struct init_exec *iexec)
 
 	iexec->repeat = false;
 
-	return true;
+	return 2;
 }
 
-static bool
+static int
 init_io_restrict_pll(struct nvbios *bios, uint16_t offset,
 		     struct init_exec *iexec)
 {
@@ -946,9 +944,10 @@ init_io_restrict_pll(struct nvbios *bios, uint16_t offset,
 	uint32_t reg = ROM32(bios->data[offset + 8]);
 	uint8_t config;
 	uint16_t freq;
+	int len = 12 + count * 2;
 
 	if (!iexec->execute)
-		return true;
+		return len;
 
 	BIOSLOG(bios, "0x%04X: Port: 0x%04X, Index: 0x%02X, Mask: 0x%02X, "
 		      "Shift: 0x%02X, IO Flag Condition: 0x%02X, "
@@ -961,7 +960,7 @@ init_io_restrict_pll(struct nvbios *bios, uint16_t offset,
 		NV_ERROR(bios->dev,
 			 "0x%04X: Config 0x%02X exceeds maximal bound 0x%02X\n",
 			 offset, config, count);
-		return false;
+		return 0;
 	}
 
 	freq = ROM16(bios->data[offset + 12 + config * 2]);
@@ -981,10 +980,10 @@ init_io_restrict_pll(struct nvbios *bios, uint16_t offset,
 
 	setPLL(bios, reg, freq * 10);
 
-	return true;
+	return len;
 }
 
-static bool
+static int
 init_end_repeat(struct nvbios *bios, uint16_t offset, struct init_exec *iexec)
 {
 	/*
@@ -1002,12 +1001,12 @@ init_end_repeat(struct nvbios *bios, uint16_t offset, struct init_exec *iexec)
 	 * we're not in repeat mode
 	 */
 	if (iexec->repeat)
-		return false;
+		return 0;
 
-	return true;
+	return 1;
 }
 
-static bool
+static int
 init_copy(struct nvbios *bios, uint16_t offset, struct init_exec *iexec)
 {
 	/*
@@ -1036,7 +1035,7 @@ init_copy(struct nvbios *bios, uint16_t offset, struct init_exec *iexec)
 	uint8_t crtcdata;
 
 	if (!iexec->execute)
-		return true;
+		return 11;
 
 	BIOSLOG(bios, "0x%04X: Reg: 0x%08X, Shift: 0x%02X, SrcMask: 0x%02X, "
 		      "Port: 0x%04X, Index: 0x%02X, Mask: 0x%02X\n",
@@ -1055,10 +1054,10 @@ init_copy(struct nvbios *bios, uint16_t offset, struct init_exec *iexec)
 	crtcdata |= (uint8_t)data;
 	bios_idxprt_wr(bios, crtcport, crtcindex, crtcdata);
 
-	return true;
+	return 11;
 }
 
-static bool
+static int
 init_not(struct nvbios *bios, uint16_t offset, struct init_exec *iexec)
 {
 	/*
@@ -1074,10 +1073,10 @@ init_not(struct nvbios *bios, uint16_t offset, struct init_exec *iexec)
 		BIOSLOG(bios, "0x%04X: ------ Executing following commands ------\n", offset);
 
 	iexec->execute = !iexec->execute;
-	return true;
+	return 1;
 }
 
-static bool
+static int
 init_io_flag_condition(struct nvbios *bios, uint16_t offset,
 		       struct init_exec *iexec)
 {
@@ -1095,7 +1094,7 @@ init_io_flag_condition(struct nvbios *bios, uint16_t offset,
 	uint8_t cond = bios->data[offset + 1];
 
 	if (!iexec->execute)
-		return true;
+		return 2;
 
 	if (io_flag_condition_met(bios, offset, cond))
 		BIOSLOG(bios, "0x%04X: Condition fulfilled -- continuing to execute\n", offset);
@@ -1104,10 +1103,10 @@ init_io_flag_condition(struct nvbios *bios, uint16_t offset,
 		iexec->execute = false;
 	}
 
-	return true;
+	return 2;
 }
 
-static bool
+static int
 init_idx_addr_latched(struct nvbios *bios, uint16_t offset,
 		      struct init_exec *iexec)
 {
@@ -1135,11 +1134,12 @@ init_idx_addr_latched(struct nvbios *bios, uint16_t offset,
 	uint32_t mask = ROM32(bios->data[offset + 9]);
 	uint32_t data = ROM32(bios->data[offset + 13]);
 	uint8_t count = bios->data[offset + 17];
+	int len = 18 + count * 2;
 	uint32_t value;
 	int i;
 
 	if (!iexec->execute)
-		return true;
+		return len;
 
 	BIOSLOG(bios, "0x%04X: ControlReg: 0x%08X, DataReg: 0x%08X, "
 		      "Mask: 0x%08X, Data: 0x%08X, Count: 0x%02X\n",
@@ -1159,10 +1159,10 @@ init_idx_addr_latched(struct nvbios *bios, uint16_t offset,
 		bios_wr32(bios, controlreg, value);
 	}
 
-	return true;
+	return len;
 }
 
-static bool
+static int
 init_io_restrict_pll2(struct nvbios *bios, uint16_t offset,
 		      struct init_exec *iexec)
 {
@@ -1191,25 +1191,26 @@ init_io_restrict_pll2(struct nvbios *bios, uint16_t offset,
 	uint8_t shift = bios->data[offset + 5];
 	uint8_t count = bios->data[offset + 6];
 	uint32_t reg = ROM32(bios->data[offset + 7]);
+	int len = 11 + count * 4;
 	uint8_t config;
 	uint32_t freq;
 
 	if (!iexec->execute)
-		return true;
+		return len;
 
 	BIOSLOG(bios, "0x%04X: Port: 0x%04X, Index: 0x%02X, Mask: 0x%02X, "
 		      "Shift: 0x%02X, Count: 0x%02X, Reg: 0x%08X\n",
 		offset, crtcport, crtcindex, mask, shift, count, reg);
 
 	if (!reg)
-		return true;
+		return len;
 
 	config = (bios_idxprt_rd(bios, crtcport, crtcindex) & mask) >> shift;
 	if (config > count) {
 		NV_ERROR(bios->dev,
 			 "0x%04X: Config 0x%02X exceeds maximal bound 0x%02X\n",
 			 offset, config, count);
-		return false;
+		return 0;
 	}
 
 	freq = ROM32(bios->data[offset + 11 + config * 4]);
@@ -1219,10 +1220,10 @@ init_io_restrict_pll2(struct nvbios *bios, uint16_t offset,
 
 	setPLL(bios, reg, freq);
 
-	return true;
+	return len;
 }
 
-static bool
+static int
 init_pll2(struct nvbios *bios, uint16_t offset, struct init_exec *iexec)
 {
 	/*
@@ -1239,16 +1240,16 @@ init_pll2(struct nvbios *bios, uint16_t offset, struct init_exec *iexec)
 	uint32_t freq = ROM32(bios->data[offset + 5]);
 
 	if (!iexec->execute)
-		return true;
+		return 9;
 
 	BIOSLOG(bios, "0x%04X: Reg: 0x%04X, Freq: %dkHz\n",
 		offset, reg, freq);
 
 	setPLL(bios, reg, freq);
-	return true;
+	return 9;
 }
 
-static bool
+static int
 init_i2c_byte(struct nvbios *bios, uint16_t offset, struct init_exec *iexec)
 {
 	/*
@@ -1272,12 +1273,13 @@ init_i2c_byte(struct nvbios *bios, uint16_t offset, struct init_exec *iexec)
 	uint8_t i2c_index = bios->data[offset + 1];
 	uint8_t i2c_address = bios->data[offset + 2];
 	uint8_t count = bios->data[offset + 3];
+	int len = 4 + count * 3;
 	struct nouveau_i2c_chan *chan;
 	struct i2c_msg msg;
 	int i;
 
 	if (!iexec->execute)
-		return true;
+		return len;
 
 	BIOSLOG(bios, "0x%04X: DCBI2CIndex: 0x%02X, I2CAddress: 0x%02X, "
 		      "Count: 0x%02X\n",
@@ -1285,7 +1287,7 @@ init_i2c_byte(struct nvbios *bios, uint16_t offset, struct init_exec *iexec)
 
 	chan = init_i2c_device_find(bios->dev, i2c_index);
 	if (!chan)
-		return false;
+		return 0;
 
 	for (i = 0; i < count; i++) {
 		uint8_t i2c_reg = bios->data[offset + 4 + i * 3];
@@ -1298,7 +1300,7 @@ init_i2c_byte(struct nvbios *bios, uint16_t offset, struct init_exec *iexec)
 		msg.len = 1;
 		msg.buf = &value;
 		if (i2c_transfer(&chan->adapter, &msg, 1) != 1)
-			return false;
+			return 0;
 
 		BIOSLOG(bios, "0x%04X: I2CReg: 0x%02X, Value: 0x%02X, "
 			      "Mask: 0x%02X, Data: 0x%02X\n",
@@ -1312,14 +1314,14 @@ init_i2c_byte(struct nvbios *bios, uint16_t offset, struct init_exec *iexec)
 			msg.len = 1;
 			msg.buf = &value;
 			if (i2c_transfer(&chan->adapter, &msg, 1) != 1)
-				return false;
+				return 0;
 		}
 	}
 
-	return true;
+	return len;
 }
 
-static bool
+static int
 init_zm_i2c_byte(struct nvbios *bios, uint16_t offset, struct init_exec *iexec)
 {
 	/*
@@ -1341,12 +1343,13 @@ init_zm_i2c_byte(struct nvbios *bios, uint16_t offset, struct init_exec *iexec)
 	uint8_t i2c_index = bios->data[offset + 1];
 	uint8_t i2c_address = bios->data[offset + 2];
 	uint8_t count = bios->data[offset + 3];
+	int len = 4 + count * 2;
 	struct nouveau_i2c_chan *chan;
 	struct i2c_msg msg;
 	int i;
 
 	if (!iexec->execute)
-		return true;
+		return len;
 
 	BIOSLOG(bios, "0x%04X: DCBI2CIndex: 0x%02X, I2CAddress: 0x%02X, "
 		      "Count: 0x%02X\n",
@@ -1354,7 +1357,7 @@ init_zm_i2c_byte(struct nvbios *bios, uint16_t offset, struct init_exec *iexec)
 
 	chan = init_i2c_device_find(bios->dev, i2c_index);
 	if (!chan)
-		return false;
+		return 0;
 
 	for (i = 0; i < count; i++) {
 		uint8_t i2c_reg = bios->data[offset + 4 + i * 2];
@@ -1369,14 +1372,14 @@ init_zm_i2c_byte(struct nvbios *bios, uint16_t offset, struct init_exec *iexec)
 			msg.len = 1;
 			msg.buf = &data;
 			if (i2c_transfer(&chan->adapter, &msg, 1) != 1)
-				return false;
+				return 0;
 		}
 	}
 
-	return true;
+	return len;
 }
 
-static bool
+static int
 init_zm_i2c(struct nvbios *bios, uint16_t offset, struct init_exec *iexec)
 {
 	/*
@@ -1396,13 +1399,14 @@ init_zm_i2c(struct nvbios *bios, uint16_t offset, struct init_exec *iexec)
 	uint8_t i2c_index = bios->data[offset + 1];
 	uint8_t i2c_address = bios->data[offset + 2];
 	uint8_t count = bios->data[offset + 3];
+	int len = 4 + count;
 	struct nouveau_i2c_chan *chan;
 	struct i2c_msg msg;
 	uint8_t data[256];
 	int i;
 
 	if (!iexec->execute)
-		return true;
+		return len;
 
 	BIOSLOG(bios, "0x%04X: DCBI2CIndex: 0x%02X, I2CAddress: 0x%02X, "
 		      "Count: 0x%02X\n",
@@ -1410,7 +1414,7 @@ init_zm_i2c(struct nvbios *bios, uint16_t offset, struct init_exec *iexec)
 
 	chan = init_i2c_device_find(bios->dev, i2c_index);
 	if (!chan)
-		return false;
+		return 0;
 
 	for (i = 0; i < count; i++) {
 		data[i] = bios->data[offset + 4 + i];
@@ -1424,13 +1428,13 @@ init_zm_i2c(struct nvbios *bios, uint16_t offset, struct init_exec *iexec)
 		msg.len = count;
 		msg.buf = data;
 		if (i2c_transfer(&chan->adapter, &msg, 1) != 1)
-			return false;
+			return 0;
 	}
 
-	return true;
+	return len;
 }
 
-static bool
+static int
 init_tmds(struct nvbios *bios, uint16_t offset, struct init_exec *iexec)
 {
 	/*
@@ -1455,7 +1459,7 @@ init_tmds(struct nvbios *bios, uint16_t offset, struct init_exec *iexec)
 	uint32_t reg, value;
 
 	if (!iexec->execute)
-		return true;
+		return 5;
 
 	BIOSLOG(bios, "0x%04X: MagicLookupValue: 0x%02X, TMDSAddr: 0x%02X, "
 		      "Mask: 0x%02X, Data: 0x%02X\n",
@@ -1463,7 +1467,7 @@ init_tmds(struct nvbios *bios, uint16_t offset, struct init_exec *iexec)
 
 	reg = get_tmds_index_reg(bios->dev, mlv);
 	if (!reg)
-		return false;
+		return 0;
 
 	bios_wr32(bios, reg,
 		  tmdsaddr | NV_PRAMDAC_FP_TMDS_CONTROL_WRITE_DISABLE);
@@ -1471,10 +1475,10 @@ init_tmds(struct nvbios *bios, uint16_t offset, struct init_exec *iexec)
 	bios_wr32(bios, reg + 4, value);
 	bios_wr32(bios, reg, tmdsaddr);
 
-	return true;
+	return 5;
 }
 
-static bool
+static int
 init_zm_tmds_group(struct nvbios *bios, uint16_t offset,
 		   struct init_exec *iexec)
 {
@@ -1495,18 +1499,19 @@ init_zm_tmds_group(struct nvbios *bios, uint16_t offset,
 
 	uint8_t mlv = bios->data[offset + 1];
 	uint8_t count = bios->data[offset + 2];
+	int len = 3 + count * 2;
 	uint32_t reg;
 	int i;
 
 	if (!iexec->execute)
-		return true;
+		return len;
 
 	BIOSLOG(bios, "0x%04X: MagicLookupValue: 0x%02X, Count: 0x%02X\n",
 		offset, mlv, count);
 
 	reg = get_tmds_index_reg(bios->dev, mlv);
 	if (!reg)
-		return false;
+		return 0;
 
 	for (i = 0; i < count; i++) {
 		uint8_t tmdsaddr = bios->data[offset + 3 + i * 2];
@@ -1516,10 +1521,10 @@ init_zm_tmds_group(struct nvbios *bios, uint16_t offset,
 		bios_wr32(bios, reg, tmdsaddr);
 	}
 
-	return true;
+	return len;
 }
 
-static bool
+static int
 init_cr_idx_adr_latch(struct nvbios *bios, uint16_t offset,
 		      struct init_exec *iexec)
 {
@@ -1542,11 +1547,12 @@ init_cr_idx_adr_latch(struct nvbios *bios, uint16_t offset,
 	uint8_t crtcindex2 = bios->data[offset + 2];
 	uint8_t baseaddr = bios->data[offset + 3];
 	uint8_t count = bios->data[offset + 4];
+	int len = 5 + count;
 	uint8_t oldaddr, data;
 	int i;
 
 	if (!iexec->execute)
-		return true;
+		return len;
 
 	BIOSLOG(bios, "0x%04X: Index1: 0x%02X, Index2: 0x%02X, "
 		      "BaseAddr: 0x%02X, Count: 0x%02X\n",
@@ -1563,10 +1569,10 @@ init_cr_idx_adr_latch(struct nvbios *bios, uint16_t offset,
 
 	bios_idxprt_wr(bios, NV_CIO_CRX__COLOR, crtcindex1, oldaddr);
 
-	return true;
+	return len;
 }
 
-static bool
+static int
 init_cr(struct nvbios *bios, uint16_t offset, struct init_exec *iexec)
 {
 	/*
@@ -1587,7 +1593,7 @@ init_cr(struct nvbios *bios, uint16_t offset, struct init_exec *iexec)
 	uint8_t value;
 
 	if (!iexec->execute)
-		return true;
+		return 4;
 
 	BIOSLOG(bios, "0x%04X: Index: 0x%02X, Mask: 0x%02X, Data: 0x%02X\n",
 		offset, crtcindex, mask, data);
@@ -1596,10 +1602,10 @@ init_cr(struct nvbios *bios, uint16_t offset, struct init_exec *iexec)
 	value |= data;
 	bios_idxprt_wr(bios, NV_CIO_CRX__COLOR, crtcindex, value);
 
-	return true;
+	return 4;
 }
 
-static bool
+static int
 init_zm_cr(struct nvbios *bios, uint16_t offset, struct init_exec *iexec)
 {
 	/*
@@ -1616,14 +1622,14 @@ init_zm_cr(struct nvbios *bios, uint16_t offset, struct init_exec *iexec)
 	uint8_t data = bios->data[offset + 2];
 
 	if (!iexec->execute)
-		return true;
+		return 3;
 
 	bios_idxprt_wr(bios, NV_CIO_CRX__COLOR, crtcindex, data);
 
-	return true;
+	return 3;
 }
 
-static bool
+static int
 init_zm_cr_group(struct nvbios *bios, uint16_t offset, struct init_exec *iexec)
 {
 	/*
@@ -1640,18 +1646,19 @@ init_zm_cr_group(struct nvbios *bios, uint16_t offset, struct init_exec *iexec)
 	 */
 
 	uint8_t count = bios->data[offset + 1];
+	int len = 2 + count * 2;
 	int i;
 
 	if (!iexec->execute)
-		return true;
+		return len;
 
 	for (i = 0; i < count; i++)
 		init_zm_cr(bios, offset + 2 + 2 * i - 1, iexec);
 
-	return true;
+	return len;
 }
 
-static bool
+static int
 init_condition_time(struct nvbios *bios, uint16_t offset,
 		    struct init_exec *iexec)
 {
@@ -1675,7 +1682,7 @@ init_condition_time(struct nvbios *bios, uint16_t offset,
 	unsigned cnt;
 
 	if (!iexec->execute)
-		return true;
+		return 3;
 
 	if (retries > 100)
 		retries = 100;
@@ -1706,10 +1713,10 @@ init_condition_time(struct nvbios *bios, uint16_t offset,
 		iexec->execute = false;
 	}
 
-	return true;
+	return 3;
 }
 
-static bool
+static int
 init_zm_reg_sequence(struct nvbios *bios, uint16_t offset,
 		     struct init_exec *iexec)
 {
@@ -1729,10 +1736,11 @@ init_zm_reg_sequence(struct nvbios *bios, uint16_t offset,
 
 	uint32_t basereg = ROM32(bios->data[offset + 1]);
 	uint32_t count = bios->data[offset + 5];
+	int len = 6 + count * 4;
 	int i;
 
 	if (!iexec->execute)
-		return true;
+		return len;
 
 	BIOSLOG(bios, "0x%04X: BaseReg: 0x%08X, Count: 0x%02X\n",
 		offset, basereg, count);
@@ -1744,10 +1752,10 @@ init_zm_reg_sequence(struct nvbios *bios, uint16_t offset,
 		bios_wr32(bios, reg, data);
 	}
 
-	return true;
+	return len;
 }
 
-static bool
+static int
 init_sub_direct(struct nvbios *bios, uint16_t offset, struct init_exec *iexec)
 {
 	/*
@@ -1763,7 +1771,7 @@ init_sub_direct(struct nvbios *bios, uint16_t offset, struct init_exec *iexec)
 	uint16_t sub_offset = ROM16(bios->data[offset + 1]);
 
 	if (!iexec->execute)
-		return true;
+		return 3;
 
 	BIOSLOG(bios, "0x%04X: Executing subroutine at 0x%04X\n",
 		offset, sub_offset);
@@ -1772,10 +1780,10 @@ init_sub_direct(struct nvbios *bios, uint16_t offset, struct init_exec *iexec)
 
 	BIOSLOG(bios, "0x%04X: End of 0x%04X subroutine\n", offset, sub_offset);
 
-	return true;
+	return 3;
 }
 
-static bool
+static int
 init_copy_nv_reg(struct nvbios *bios, uint16_t offset, struct init_exec *iexec)
 {
 	/*
@@ -1803,7 +1811,7 @@ init_copy_nv_reg(struct nvbios *bios, uint16_t offset, struct init_exec *iexec)
 	uint32_t srcvalue, dstvalue;
 
 	if (!iexec->execute)
-		return true;
+		return 22;
 
 	BIOSLOG(bios, "0x%04X: SrcReg: 0x%08X, Shift: 0x%02X, SrcMask: 0x%08X, "
 		      "Xor: 0x%08X, DstReg: 0x%08X, DstMask: 0x%08X\n",
@@ -1822,10 +1830,10 @@ init_copy_nv_reg(struct nvbios *bios, uint16_t offset, struct init_exec *iexec)
 
 	bios_wr32(bios, dstreg, dstvalue | srcvalue);
 
-	return true;
+	return 22;
 }
 
-static bool
+static int
 init_zm_index_io(struct nvbios *bios, uint16_t offset, struct init_exec *iexec)
 {
 	/*
@@ -1843,14 +1851,14 @@ init_zm_index_io(struct nvbios *bios, uint16_t offset, struct init_exec *iexec)
 	uint8_t data = bios->data[offset + 4];
 
 	if (!iexec->execute)
-		return true;
+		return 5;
 
 	bios_idxprt_wr(bios, crtcport, crtcindex, data);
 
-	return true;
+	return 5;
 }
 
-static bool
+static int
 init_compute_mem(struct nvbios *bios, uint16_t offset, struct init_exec *iexec)
 {
 	/*
@@ -1899,7 +1907,7 @@ init_compute_mem(struct nvbios *bios, uint16_t offset, struct init_exec *iexec)
 	struct drm_nouveau_private *dev_priv = bios->dev->dev_private;
 
 	if (dev_priv->card_type >= NV_50)
-		return true;
+		return 1;
 
 	/*
 	 * On every card I've seen, this step gets done for us earlier in
@@ -1917,10 +1925,10 @@ init_compute_mem(struct nvbios *bios, uint16_t offset, struct init_exec *iexec)
 	/* write back the saved configuration value */
 	bios_wr32(bios, NV_PFB_CFG0, bios->state.saved_nv_pfb_cfg0);
 
-	return true;
+	return 1;
 }
 
-static bool
+static int
 init_reset(struct nvbios *bios, uint16_t offset, struct init_exec *iexec)
 {
 	/*
@@ -1954,10 +1962,10 @@ init_reset(struct nvbios *bios, uint16_t offset, struct init_exec *iexec)
 	pci_nv_20 &= ~NV_PBUS_PCI_NV_20_ROM_SHADOW_ENABLED;	/* 0xfffffffe */
 	bios_wr32(bios, NV_PBUS_PCI_NV_20, pci_nv_20);
 
-	return true;
+	return 13;
 }
 
-static bool
+static int
 init_configure_mem(struct nvbios *bios, uint16_t offset,
 		   struct init_exec *iexec)
 {
@@ -1978,7 +1986,7 @@ init_configure_mem(struct nvbios *bios, uint16_t offset,
 	uint32_t reg, data;
 
 	if (bios->major_version > 2)
-		return false;
+		return 0;
 
 	bios_idxprt_wr(bios, NV_VIO_SRX, NV_VIO_SR_CLOCK_INDEX, bios_idxprt_rd(
 		       bios, NV_VIO_SRX, NV_VIO_SR_CLOCK_INDEX) | 0x20);
@@ -2010,10 +2018,10 @@ init_configure_mem(struct nvbios *bios, uint16_t offset,
 		bios_wr32(bios, reg, data);
 	}
 
-	return true;
+	return 1;
 }
 
-static bool
+static int
 init_configure_clk(struct nvbios *bios, uint16_t offset,
 		   struct init_exec *iexec)
 {
@@ -2033,7 +2041,7 @@ init_configure_clk(struct nvbios *bios, uint16_t offset,
 	int clock;
 
 	if (bios->major_version > 2)
-		return false;
+		return 0;
 
 	clock = ROM16(bios->data[meminitoffs + 4]) * 10;
 	setPLL(bios, NV_PRAMDAC_NVPLL_COEFF, clock);
@@ -2043,10 +2051,10 @@ init_configure_clk(struct nvbios *bios, uint16_t offset,
 		clock *= 2;
 	setPLL(bios, NV_PRAMDAC_MPLL_COEFF, clock);
 
-	return true;
+	return 1;
 }
 
-static bool
+static int
 init_configure_preinit(struct nvbios *bios, uint16_t offset,
 		       struct init_exec *iexec)
 {
@@ -2066,15 +2074,15 @@ init_configure_preinit(struct nvbios *bios, uint16_t offset,
 	uint8_t cr3c = ((straps << 2) & 0xf0) | (straps & (1 << 6));
 
 	if (bios->major_version > 2)
-		return false;
+		return 0;
 
 	bios_idxprt_wr(bios, NV_CIO_CRX__COLOR,
 			     NV_CIO_CRE_SCRATCH4__INDEX, cr3c);
 
-	return true;
+	return 1;
 }
 
-static bool
+static int
 init_io(struct nvbios *bios, uint16_t offset, struct init_exec *iexec)
 {
 	/*
@@ -2094,7 +2102,7 @@ init_io(struct nvbios *bios, uint16_t offset, struct init_exec *iexec)
 	uint8_t data = bios->data[offset + 4];
 
 	if (!iexec->execute)
-		return true;
+		return 5;
 
 	BIOSLOG(bios, "0x%04X: Port: 0x%04X, Mask: 0x%02X, Data: 0x%02X\n",
 		offset, crtcport, mask, data);
@@ -2153,15 +2161,15 @@ init_io(struct nvbios *bios, uint16_t offset, struct init_exec *iexec)
 		for (i = 0; i < 2; i++)
 			bios_wr32(bios, 0x614108 + (i*0x800), bios_rd32(
 				  bios, 0x614108 + (i*0x800)) & 0x0fffffff);
-		return true;
+		return 5;
 	}
 
 	bios_port_wr(bios, crtcport, (bios_port_rd(bios, crtcport) & mask) |
 									data);
-	return true;
+	return 5;
 }
 
-static bool
+static int
 init_sub(struct nvbios *bios, uint16_t offset, struct init_exec *iexec)
 {
 	/*
@@ -2176,7 +2184,7 @@ init_sub(struct nvbios *bios, uint16_t offset, struct init_exec *iexec)
 	uint8_t sub = bios->data[offset + 1];
 
 	if (!iexec->execute)
-		return true;
+		return 2;
 
 	BIOSLOG(bios, "0x%04X: Calling script %d\n", offset, sub);
 
@@ -2186,10 +2194,10 @@ init_sub(struct nvbios *bios, uint16_t offset, struct init_exec *iexec)
 
 	BIOSLOG(bios, "0x%04X: End of script %d\n", offset, sub);
 
-	return true;
+	return 2;
 }
 
-static bool
+static int
 init_ram_condition(struct nvbios *bios, uint16_t offset,
 		   struct init_exec *iexec)
 {
@@ -2210,7 +2218,7 @@ init_ram_condition(struct nvbios *bios, uint16_t offset,
 	uint8_t data;
 
 	if (!iexec->execute)
-		return true;
+		return 3;
 
 	data = bios_rd32(bios, NV_PFB_BOOT_0) & mask;
 
@@ -2224,10 +2232,10 @@ init_ram_condition(struct nvbios *bios, uint16_t offset,
 		iexec->execute = false;
 	}
 
-	return true;
+	return 3;
 }
 
-static bool
+static int
 init_nv_reg(struct nvbios *bios, uint16_t offset, struct init_exec *iexec)
 {
 	/*
@@ -2246,17 +2254,17 @@ init_nv_reg(struct nvbios *bios, uint16_t offset, struct init_exec *iexec)
 	uint32_t data = ROM32(bios->data[offset + 9]);
 
 	if (!iexec->execute)
-		return true;
+		return 13;
 
 	BIOSLOG(bios, "0x%04X: Reg: 0x%08X, Mask: 0x%08X, Data: 0x%08X\n",
 		offset, reg, mask, data);
 
 	bios_wr32(bios, reg, (bios_rd32(bios, reg) & mask) | data);
 
-	return true;
+	return 13;
 }
 
-static bool
+static int
 init_macro(struct nvbios *bios, uint16_t offset, struct init_exec *iexec)
 {
 	/*
@@ -2280,7 +2288,7 @@ init_macro(struct nvbios *bios, uint16_t offset, struct init_exec *iexec)
 	int i;
 
 	if (!iexec->execute)
-		return true;
+		return 2;
 
 	BIOSLOG(bios, "0x%04X: Macro: 0x%02X, MacroTableIndex: 0x%02X, "
 		      "Count: 0x%02X\n",
@@ -2295,10 +2303,10 @@ init_macro(struct nvbios *bios, uint16_t offset, struct init_exec *iexec)
 		bios_wr32(bios, reg, data);
 	}
 
-	return true;
+	return 2;
 }
 
-static bool
+static int
 init_done(struct nvbios *bios, uint16_t offset, struct init_exec *iexec)
 {
 	/*
@@ -2310,10 +2318,10 @@ init_done(struct nvbios *bios, uint16_t offset, struct init_exec *iexec)
 	 */
 
 	/* mild retval abuse to stop parsing this table */
-	return false;
+	return 0;
 }
 
-static bool
+static int
 init_resume(struct nvbios *bios, uint16_t offset, struct init_exec *iexec)
 {
 	/*
@@ -2325,15 +2333,15 @@ init_resume(struct nvbios *bios, uint16_t offset, struct init_exec *iexec)
 	 */
 
 	if (iexec->execute)
-		return true;
+		return 1;
 
 	iexec->execute = true;
 	BIOSLOG(bios, "0x%04X: ---- Executing following commands ----\n", offset);
 
-	return true;
+	return 1;
 }
 
-static bool
+static int
 init_time(struct nvbios *bios, uint16_t offset, struct init_exec *iexec)
 {
 	/*
@@ -2348,7 +2356,7 @@ init_time(struct nvbios *bios, uint16_t offset, struct init_exec *iexec)
 	unsigned time = ROM16(bios->data[offset + 1]);
 
 	if (!iexec->execute)
-		return true;
+		return 3;
 
 	BIOSLOG(bios, "0x%04X: Sleeping for 0x%04X microseconds\n",
 		offset, time);
@@ -2358,10 +2366,10 @@ init_time(struct nvbios *bios, uint16_t offset, struct init_exec *iexec)
 	else
 		msleep((time + 900) / 1000);
 
-	return true;
+	return 3;
 }
 
-static bool
+static int
 init_condition(struct nvbios *bios, uint16_t offset, struct init_exec *iexec)
 {
 	/*
@@ -2378,7 +2386,7 @@ init_condition(struct nvbios *bios, uint16_t offset, struct init_exec *iexec)
 	uint8_t cond = bios->data[offset + 1];
 
 	if (!iexec->execute)
-		return true;
+		return 2;
 
 	BIOSLOG(bios, "0x%04X: Condition: 0x%02X\n", offset, cond);
 
@@ -2389,10 +2397,10 @@ init_condition(struct nvbios *bios, uint16_t offset, struct init_exec *iexec)
 		iexec->execute = false;
 	}
 
-	return true;
+	return 2;
 }
 
-static bool
+static int
 init_io_condition(struct nvbios *bios, uint16_t offset, struct init_exec *iexec)
 {
 	/*
@@ -2409,7 +2417,7 @@ init_io_condition(struct nvbios *bios, uint16_t offset, struct init_exec *iexec)
 	uint8_t cond = bios->data[offset + 1];
 
 	if (!iexec->execute)
-		return true;
+		return 2;
 
 	BIOSLOG(bios, "0x%04X: IO condition: 0x%02X\n", offset, cond);
 
@@ -2420,10 +2428,10 @@ init_io_condition(struct nvbios *bios, uint16_t offset, struct init_exec *iexec)
 		iexec->execute = false;
 	}
 
-	return true;
+	return 2;
 }
 
-static bool
+static int
 init_index_io(struct nvbios *bios, uint16_t offset, struct init_exec *iexec)
 {
 	/*
@@ -2446,7 +2454,7 @@ init_index_io(struct nvbios *bios, uint16_t offset, struct init_exec *iexec)
 	uint8_t value;
 
 	if (!iexec->execute)
-		return true;
+		return 6;
 
 	BIOSLOG(bios, "0x%04X: Port: 0x%04X, Index: 0x%02X, Mask: 0x%02X, "
 		      "Data: 0x%02X\n",
@@ -2455,10 +2463,10 @@ init_index_io(struct nvbios *bios, uint16_t offset, struct init_exec *iexec)
 	value = (bios_idxprt_rd(bios, crtcport, crtcindex) & mask) | data;
 	bios_idxprt_wr(bios, crtcport, crtcindex, value);
 
-	return true;
+	return 6;
 }
 
-static bool
+static int
 init_pll(struct nvbios *bios, uint16_t offset, struct init_exec *iexec)
 {
 	/*
@@ -2476,16 +2484,16 @@ init_pll(struct nvbios *bios, uint16_t offset, struct init_exec *iexec)
 	uint16_t freq = ROM16(bios->data[offset + 5]);
 
 	if (!iexec->execute)
-		return true;
+		return 7;
 
 	BIOSLOG(bios, "0x%04X: Reg: 0x%08X, Freq: %d0kHz\n", offset, reg, freq);
 
 	setPLL(bios, reg, freq * 10);
 
-	return true;
+	return 7;
 }
 
-static bool
+static int
 init_zm_reg(struct nvbios *bios, uint16_t offset, struct init_exec *iexec)
 {
 	/*
@@ -2502,17 +2510,17 @@ init_zm_reg(struct nvbios *bios, uint16_t offset, struct init_exec *iexec)
 	uint32_t value = ROM32(bios->data[offset + 5]);
 
 	if (!iexec->execute)
-		return true;
+		return 9;
 
 	if (reg == 0x000200)
 		value |= 1;
 
 	bios_wr32(bios, reg, value);
 
-	return true;
+	return 9;
 }
 
-static bool
+static int
 init_ram_restrict_pll(struct nvbios *bios, uint16_t offset,
 		      struct init_exec *iexec)
 {
@@ -2538,14 +2546,15 @@ init_ram_restrict_pll(struct nvbios *bios, uint16_t offset,
 	uint8_t type = bios->data[offset + 1];
 	uint32_t freq = ROM32(bios->data[offset + 2 + (index * 4)]);
 	uint8_t *pll_limits = &bios->data[bios->pll_limit_tbl_ptr], *entry;
+	int len = 2 + bios->ram_restrict_group_count * 4;
 	int i;
 
 	if (!iexec->execute)
-		return true;
+		return len;
 
 	if (!bios->pll_limit_tbl_ptr || (pll_limits[0] & 0xf0) != 0x30) {
 		NV_ERROR(dev, "PLL limits table not version 3.x\n");
-		return true; /* deliberate, allow default clocks to remain */
+		return len; /* deliberate, allow default clocks to remain */
 	}
 
 	entry = pll_limits + pll_limits[1];
@@ -2558,15 +2567,15 @@ init_ram_restrict_pll(struct nvbios *bios, uint16_t offset,
 				offset, type, reg, freq);
 
 			setPLL(bios, reg, freq);
-			return true;
+			return len;
 		}
 	}
 
 	NV_ERROR(dev, "PLL type 0x%02x not found in PLL limits table", type);
-	return true;
+	return len;
 }
 
-static bool
+static int
 init_8c(struct nvbios *bios, uint16_t offset, struct init_exec *iexec)
 {
 	/*
@@ -2576,10 +2585,10 @@ init_8c(struct nvbios *bios, uint16_t offset, struct init_exec *iexec)
 	 *
 	 */
 
-	return true;
+	return 1;
 }
 
-static bool
+static int
 init_8d(struct nvbios *bios, uint16_t offset, struct init_exec *iexec)
 {
 	/*
@@ -2589,10 +2598,10 @@ init_8d(struct nvbios *bios, uint16_t offset, struct init_exec *iexec)
 	 *
 	 */
 
-	return true;
+	return 1;
 }
 
-static bool
+static int
 init_gpio(struct nvbios *bios, uint16_t offset, struct init_exec *iexec)
 {
 	/*
@@ -2610,14 +2619,17 @@ init_gpio(struct nvbios *bios, uint16_t offset, struct init_exec *iexec)
 	const uint8_t *gpio_entry;
 	int i;
 
+	if (!iexec->execute)
+		return 1;
+
 	if (bios->bdcb.version != 0x40) {
 		NV_ERROR(bios->dev, "DCB table not version 4.0\n");
-		return false;
+		return 0;
 	}
 
 	if (!bios->bdcb.gpio_table_ptr) {
 		NV_WARN(bios->dev, "Invalid pointer to INIT_8E table\n");
-		return false;
+		return 0;
 	}
 
 	gpio_entry = gpio_table + gpio_table[1];
@@ -2655,13 +2667,10 @@ init_gpio(struct nvbios *bios, uint16_t offset, struct init_exec *iexec)
 		bios_wr32(bios, r, v);
 	}
 
-	return true;
+	return 1;
 }
 
-/* hack to avoid moving the itbl_entry array before this function */
-int init_ram_restrict_zm_reg_group_blocklen;
-
-static bool
+static int
 init_ram_restrict_zm_reg_group(struct nvbios *bios, uint16_t offset,
 			       struct init_exec *iexec)
 {
@@ -2687,21 +2696,21 @@ init_ram_restrict_zm_reg_group(struct nvbios *bios, uint16_t offset,
 	uint8_t regincrement = bios->data[offset + 5];
 	uint8_t count = bios->data[offset + 6];
 	uint32_t strap_ramcfg, data;
-	uint16_t blocklen;
+	/* previously set by 'M' BIT table */
+	uint16_t blocklen = bios->ram_restrict_group_count * 4;
+	int len = 7 + count * blocklen;
 	uint8_t index;
 	int i;
 
-	/* previously set by 'M' BIT table */
-	blocklen = init_ram_restrict_zm_reg_group_blocklen;
 
 	if (!iexec->execute)
-		return true;
+		return len;
 
 	if (!blocklen) {
 		NV_ERROR(bios->dev,
 			 "0x%04X: Zero block length - has the M table "
 			 "been parsed?\n", offset);
-		return false;
+		return 0;
 	}
 
 	strap_ramcfg = (bios_rd32(bios, NV_PEXTDEV_BOOT_0) >> 2) & 0xf;
@@ -2719,10 +2728,10 @@ init_ram_restrict_zm_reg_group(struct nvbios *bios, uint16_t offset,
 		reg += regincrement;
 	}
 
-	return true;
+	return len;
 }
 
-static bool
+static int
 init_copy_zm_reg(struct nvbios *bios, uint16_t offset, struct init_exec *iexec)
 {
 	/*
@@ -2739,14 +2748,14 @@ init_copy_zm_reg(struct nvbios *bios, uint16_t offset, struct init_exec *iexec)
 	uint32_t dstreg = ROM32(bios->data[offset + 5]);
 
 	if (!iexec->execute)
-		return true;
+		return 9;
 
 	bios_wr32(bios, dstreg, bios_rd32(bios, srcreg));
 
-	return true;
+	return 9;
 }
 
-static bool
+static int
 init_zm_reg_group_addr_latched(struct nvbios *bios, uint16_t offset,
 			       struct init_exec *iexec)
 {
@@ -2764,20 +2773,21 @@ init_zm_reg_group_addr_latched(struct nvbios *bios, uint16_t offset,
 
 	uint32_t reg = ROM32(bios->data[offset + 1]);
 	uint8_t count = bios->data[offset + 5];
+	int len = 6 + count * 4;
 	int i;
 
 	if (!iexec->execute)
-		return true;
+		return len;
 
 	for (i = 0; i < count; i++) {
 		uint32_t data = ROM32(bios->data[offset + 6 + 4 * i]);
 		bios_wr32(bios, reg, data);
 	}
 
-	return true;
+	return len;
 }
 
-static bool
+static int
 init_reserved(struct nvbios *bios, uint16_t offset, struct init_exec *iexec)
 {
 	/*
@@ -2788,10 +2798,10 @@ init_reserved(struct nvbios *bios, uint16_t offset, struct init_exec *iexec)
 	 * Seemingly does nothing
 	 */
 
-	return true;
+	return 1;
 }
 
-static bool
+static int
 init_96(struct nvbios *bios, uint16_t offset, struct init_exec *iexec)
 {
 	/*
@@ -2824,13 +2834,13 @@ init_96(struct nvbios *bios, uint16_t offset, struct init_exec *iexec)
 	val <<= bios->data[offset + 16];
 
 	if (!iexec->execute)
-		return true;
+		return 17;
 
 	bios_wr32(bios, reg, (bios_rd32(bios, reg) & mask) | val);
-	return true;
+	return 17;
 }
 
-static bool
+static int
 init_97(struct nvbios *bios, uint16_t offset, struct init_exec *iexec)
 {
 	/*
@@ -2854,13 +2864,13 @@ init_97(struct nvbios *bios, uint16_t offset, struct init_exec *iexec)
 	val = (val & mask) | ((val + add) & ~mask);
 
 	if (!iexec->execute)
-		return true;
+		return 13;
 
 	bios_wr32(bios, reg, val);
-	return true;
+	return 13;
 }
 
-static bool
+static int
 init_auxch(struct nvbios *bios, uint16_t offset, struct init_exec *iexec)
 {
 	/*
@@ -2878,32 +2888,33 @@ init_auxch(struct nvbios *bios, uint16_t offset, struct init_exec *iexec)
 	struct drm_device *dev = bios->dev;
 	struct nouveau_i2c_chan *auxch;
 	uint32_t addr = ROM32(bios->data[offset + 1]);
-	uint8_t len = bios->data[offset + 5];
+	uint8_t count = bios->data[offset + 5];
+	int len = 6 + count * 2;
 	int ret, i;
 
 	if (!bios->display.output) {
 		NV_ERROR(dev, "INIT_AUXCH: no active output\n");
-		return false;
+		return 0;
 	}
 
 	auxch = init_i2c_device_find(dev, bios->display.output->i2c_index);
 	if (!auxch) {
 		NV_ERROR(dev, "INIT_AUXCH: couldn't get auxch %d\n",
 			 bios->display.output->i2c_index);
-		return false;
+		return 0;
 	}
 
 	if (!iexec->execute)
-		return true;
+		return len;
 
 	offset += 6;
-	for (i = 0; i < len; i++, offset += 2) {
+	for (i = 0; i < count; i++, offset += 2) {
 		uint8_t data;
 
 		ret = nouveau_dp_auxch(auxch, 9, addr, &data, 1);
 		if (ret) {
 			NV_ERROR(dev, "INIT_AUXCH: rd auxch fail %d\n", ret);
-			return false;
+			return 0;
 		}
 
 		data &= bios->data[offset + 0];
@@ -2912,14 +2923,14 @@ init_auxch(struct nvbios *bios, uint16_t offset, struct init_exec *iexec)
 		ret = nouveau_dp_auxch(auxch, 8, addr, &data, 1);
 		if (ret) {
 			NV_ERROR(dev, "INIT_AUXCH: wr auxch fail %d\n", ret);
-			return false;
+			return 0;
 		}
 	}
 
-	return true;
+	return len;
 }
 
-static bool
+static int
 init_zm_auxch(struct nvbios *bios, uint16_t offset, struct init_exec *iexec)
 {
 	/*
@@ -2936,106 +2947,99 @@ init_zm_auxch(struct nvbios *bios, uint16_t offset, struct init_exec *iexec)
 	struct drm_device *dev = bios->dev;
 	struct nouveau_i2c_chan *auxch;
 	uint32_t addr = ROM32(bios->data[offset + 1]);
-	uint8_t len = bios->data[offset + 5];
+	uint8_t count = bios->data[offset + 5];
+	int len = 6 + count;
 	int ret, i;
 
 	if (!bios->display.output) {
 		NV_ERROR(dev, "INIT_ZM_AUXCH: no active output\n");
-		return false;
+		return 0;
 	}
 
 	auxch = init_i2c_device_find(dev, bios->display.output->i2c_index);
 	if (!auxch) {
 		NV_ERROR(dev, "INIT_ZM_AUXCH: couldn't get auxch %d\n",
 			 bios->display.output->i2c_index);
-		return false;
+		return 0;
 	}
 
 	if (!iexec->execute)
-		return true;
+		return len;
 
 	offset += 6;
-	for (i = 0; i < len; i++, offset++) {
+	for (i = 0; i < count; i++, offset++) {
 		ret = nouveau_dp_auxch(auxch, 8, addr, &bios->data[offset], 1);
 		if (ret) {
 			NV_ERROR(dev, "INIT_ZM_AUXCH: wr auxch fail %d\n", ret);
-			return false;
+			return 0;
 		}
 	}
 
-	return true;
+	return len;
 }
 
 static struct init_tbl_entry itbl_entry[] = {
 	/* command name                       , id  , length  , offset  , mult    , command handler                 */
 	/* INIT_PROG (0x31, 15, 10, 4) removed due to no example of use */
-	{ "INIT_IO_RESTRICT_PROG"             , 0x32, 11      , 6       , 4       , init_io_restrict_prog           },
-	{ "INIT_REPEAT"                       , 0x33, 2       , 0       , 0       , init_repeat                     },
-	{ "INIT_IO_RESTRICT_PLL"              , 0x34, 12      , 7       , 2       , init_io_restrict_pll            },
-	{ "INIT_END_REPEAT"                   , 0x36, 1       , 0       , 0       , init_end_repeat                 },
-	{ "INIT_COPY"                         , 0x37, 11      , 0       , 0       , init_copy                       },
-	{ "INIT_NOT"                          , 0x38, 1       , 0       , 0       , init_not                        },
-	{ "INIT_IO_FLAG_CONDITION"            , 0x39, 2       , 0       , 0       , init_io_flag_condition          },
-	{ "INIT_INDEX_ADDRESS_LATCHED"        , 0x49, 18      , 17      , 2       , init_idx_addr_latched           },
-	{ "INIT_IO_RESTRICT_PLL2"             , 0x4A, 11      , 6       , 4       , init_io_restrict_pll2           },
-	{ "INIT_PLL2"                         , 0x4B, 9       , 0       , 0       , init_pll2                       },
-	{ "INIT_I2C_BYTE"                     , 0x4C, 4       , 3       , 3       , init_i2c_byte                   },
-	{ "INIT_ZM_I2C_BYTE"                  , 0x4D, 4       , 3       , 2       , init_zm_i2c_byte                },
-	{ "INIT_ZM_I2C"                       , 0x4E, 4       , 3       , 1       , init_zm_i2c                     },
-	{ "INIT_TMDS"                         , 0x4F, 5       , 0       , 0       , init_tmds                       },
-	{ "INIT_ZM_TMDS_GROUP"                , 0x50, 3       , 2       , 2       , init_zm_tmds_group              },
-	{ "INIT_CR_INDEX_ADDRESS_LATCHED"     , 0x51, 5       , 4       , 1       , init_cr_idx_adr_latch           },
-	{ "INIT_CR"                           , 0x52, 4       , 0       , 0       , init_cr                         },
-	{ "INIT_ZM_CR"                        , 0x53, 3       , 0       , 0       , init_zm_cr                      },
-	{ "INIT_ZM_CR_GROUP"                  , 0x54, 2       , 1       , 2       , init_zm_cr_group                },
-	{ "INIT_CONDITION_TIME"               , 0x56, 3       , 0       , 0       , init_condition_time             },
-	{ "INIT_ZM_REG_SEQUENCE"              , 0x58, 6       , 5       , 4       , init_zm_reg_sequence            },
+	{ "INIT_IO_RESTRICT_PROG"             , 0x32, init_io_restrict_prog           },
+	{ "INIT_REPEAT"                       , 0x33, init_repeat                     },
+	{ "INIT_IO_RESTRICT_PLL"              , 0x34, init_io_restrict_pll            },
+	{ "INIT_END_REPEAT"                   , 0x36, init_end_repeat                 },
+	{ "INIT_COPY"                         , 0x37, init_copy                       },
+	{ "INIT_NOT"                          , 0x38, init_not                        },
+	{ "INIT_IO_FLAG_CONDITION"            , 0x39, init_io_flag_condition          },
+	{ "INIT_INDEX_ADDRESS_LATCHED"        , 0x49, init_idx_addr_latched           },
+	{ "INIT_IO_RESTRICT_PLL2"             , 0x4A, init_io_restrict_pll2           },
+	{ "INIT_PLL2"                         , 0x4B, init_pll2                       },
+	{ "INIT_I2C_BYTE"                     , 0x4C, init_i2c_byte                   },
+	{ "INIT_ZM_I2C_BYTE"                  , 0x4D, init_zm_i2c_byte                },
+	{ "INIT_ZM_I2C"                       , 0x4E, init_zm_i2c                     },
+	{ "INIT_TMDS"                         , 0x4F, init_tmds                       },
+	{ "INIT_ZM_TMDS_GROUP"                , 0x50, init_zm_tmds_group              },
+	{ "INIT_CR_INDEX_ADDRESS_LATCHED"     , 0x51, init_cr_idx_adr_latch           },
+	{ "INIT_CR"                           , 0x52, init_cr                         },
+	{ "INIT_ZM_CR"                        , 0x53, init_zm_cr                      },
+	{ "INIT_ZM_CR_GROUP"                  , 0x54, init_zm_cr_group                },
+	{ "INIT_CONDITION_TIME"               , 0x56, init_condition_time             },
+	{ "INIT_ZM_REG_SEQUENCE"              , 0x58, init_zm_reg_sequence            },
 	/* INIT_INDIRECT_REG (0x5A, 7, 0, 0) removed due to no example of use */
-	{ "INIT_SUB_DIRECT"                   , 0x5B, 3       , 0       , 0       , init_sub_direct                 },
-	{ "INIT_COPY_NV_REG"                  , 0x5F, 22      , 0       , 0       , init_copy_nv_reg                },
-	{ "INIT_ZM_INDEX_IO"                  , 0x62, 5       , 0       , 0       , init_zm_index_io                },
-	{ "INIT_COMPUTE_MEM"                  , 0x63, 1       , 0       , 0       , init_compute_mem                },
-	{ "INIT_RESET"                        , 0x65, 13      , 0       , 0       , init_reset                      },
-	{ "INIT_CONFIGURE_MEM"                , 0x66, 1       , 0       , 0       , init_configure_mem              },
-	{ "INIT_CONFIGURE_CLK"                , 0x67, 1       , 0       , 0       , init_configure_clk              },
-	{ "INIT_CONFIGURE_PREINIT"            , 0x68, 1       , 0       , 0       , init_configure_preinit          },
-	{ "INIT_IO"                           , 0x69, 5       , 0       , 0       , init_io                         },
-	{ "INIT_SUB"                          , 0x6B, 2       , 0       , 0       , init_sub                        },
-	{ "INIT_RAM_CONDITION"                , 0x6D, 3       , 0       , 0       , init_ram_condition              },
-	{ "INIT_NV_REG"                       , 0x6E, 13      , 0       , 0       , init_nv_reg                     },
-	{ "INIT_MACRO"                        , 0x6F, 2       , 0       , 0       , init_macro                      },
-	{ "INIT_DONE"                         , 0x71, 1       , 0       , 0       , init_done                       },
-	{ "INIT_RESUME"                       , 0x72, 1       , 0       , 0       , init_resume                     },
+	{ "INIT_SUB_DIRECT"                   , 0x5B, init_sub_direct                 },
+	{ "INIT_COPY_NV_REG"                  , 0x5F, init_copy_nv_reg                },
+	{ "INIT_ZM_INDEX_IO"                  , 0x62, init_zm_index_io                },
+	{ "INIT_COMPUTE_MEM"                  , 0x63, init_compute_mem                },
+	{ "INIT_RESET"                        , 0x65, init_reset                      },
+	{ "INIT_CONFIGURE_MEM"                , 0x66, init_configure_mem              },
+	{ "INIT_CONFIGURE_CLK"                , 0x67, init_configure_clk              },
+	{ "INIT_CONFIGURE_PREINIT"            , 0x68, init_configure_preinit          },
+	{ "INIT_IO"                           , 0x69, init_io                         },
+	{ "INIT_SUB"                          , 0x6B, init_sub                        },
+	{ "INIT_RAM_CONDITION"                , 0x6D, init_ram_condition              },
+	{ "INIT_NV_REG"                       , 0x6E, init_nv_reg                     },
+	{ "INIT_MACRO"                        , 0x6F, init_macro                      },
+	{ "INIT_DONE"                         , 0x71, init_done                       },
+	{ "INIT_RESUME"                       , 0x72, init_resume                     },
 	/* INIT_RAM_CONDITION2 (0x73, 9, 0, 0) removed due to no example of use */
-	{ "INIT_TIME"                         , 0x74, 3       , 0       , 0       , init_time                       },
-	{ "INIT_CONDITION"                    , 0x75, 2       , 0       , 0       , init_condition                  },
-	{ "INIT_IO_CONDITION"                 , 0x76, 2       , 0       , 0       , init_io_condition               },
-	{ "INIT_INDEX_IO"                     , 0x78, 6       , 0       , 0       , init_index_io                   },
-	{ "INIT_PLL"                          , 0x79, 7       , 0       , 0       , init_pll                        },
-	{ "INIT_ZM_REG"                       , 0x7A, 9       , 0       , 0       , init_zm_reg                     },
-	/* INIT_RAM_RESTRICT_PLL's length is adjusted by the BIT M table */
-	{ "INIT_RAM_RESTRICT_PLL"             , 0x87, 2       , 0       , 0       , init_ram_restrict_pll           },
-	{ "INIT_8C"                           , 0x8C, 1       , 0       , 0       , init_8c                         },
-	{ "INIT_8D"                           , 0x8D, 1       , 0       , 0       , init_8d                         },
-	{ "INIT_GPIO"                         , 0x8E, 1       , 0       , 0       , init_gpio                       },
-	/* INIT_RAM_RESTRICT_ZM_REG_GROUP's mult is loaded by M table in BIT */
-	{ "INIT_RAM_RESTRICT_ZM_REG_GROUP"    , 0x8F, 7       , 6       , 0       , init_ram_restrict_zm_reg_group  },
-	{ "INIT_COPY_ZM_REG"                  , 0x90, 9       , 0       , 0       , init_copy_zm_reg                },
-	{ "INIT_ZM_REG_GROUP_ADDRESS_LATCHED" , 0x91, 6       , 5       , 4       , init_zm_reg_group_addr_latched  },
-	{ "INIT_RESERVED"                     , 0x92, 1       , 0       , 0       , init_reserved                   },
-	{ "INIT_96"                           , 0x96, 17      , 0       , 0       , init_96                         },
-	{ "INIT_97"                           , 0x97, 13      , 0       , 0       , init_97                         },
-	{ "INIT_AUXCH"                        , 0x98, 6       , 5       , 2       , init_auxch                      },
-	{ "INIT_ZM_AUXCH"                     , 0x99, 6       , 5       , 1       , init_zm_auxch                   },
-	{ NULL                                , 0   , 0       , 0       , 0       , NULL                            }
+	{ "INIT_TIME"                         , 0x74, init_time                       },
+	{ "INIT_CONDITION"                    , 0x75, init_condition                  },
+	{ "INIT_IO_CONDITION"                 , 0x76, init_io_condition               },
+	{ "INIT_INDEX_IO"                     , 0x78, init_index_io                   },
+	{ "INIT_PLL"                          , 0x79, init_pll                        },
+	{ "INIT_ZM_REG"                       , 0x7A, init_zm_reg                     },
+	{ "INIT_RAM_RESTRICT_PLL"             , 0x87, init_ram_restrict_pll           },
+	{ "INIT_8C"                           , 0x8C, init_8c                         },
+	{ "INIT_8D"                           , 0x8D, init_8d                         },
+	{ "INIT_GPIO"                         , 0x8E, init_gpio                       },
+	{ "INIT_RAM_RESTRICT_ZM_REG_GROUP"    , 0x8F, init_ram_restrict_zm_reg_group  },
+	{ "INIT_COPY_ZM_REG"                  , 0x90, init_copy_zm_reg                },
+	{ "INIT_ZM_REG_GROUP_ADDRESS_LATCHED" , 0x91, init_zm_reg_group_addr_latched  },
+	{ "INIT_RESERVED"                     , 0x92, init_reserved                   },
+	{ "INIT_96"                           , 0x96, init_96                         },
+	{ "INIT_97"                           , 0x97, init_97                         },
+	{ "INIT_AUXCH"                        , 0x98, init_auxch                      },
+	{ "INIT_ZM_AUXCH"                     , 0x99, init_zm_auxch                   },
+	{ NULL                                , 0   , NULL                            }
 };
 
-static unsigned int get_init_table_entry_length(struct nvbios *bios, unsigned int offset, int i)
-{
-	/* Calculates the length of a given init table entry. */
-	return itbl_entry[i].length + bios->data[offset + itbl_entry[i].length_offset]*itbl_entry[i].length_multiplier;
-}
-
 #define MAX_TABLE_OPS 1000
 
 static int
@@ -3051,7 +3055,7 @@ parse_init_table(struct nvbios *bios, unsigned int offset,
 	 * is changed back to EXECUTE.
 	 */
 
-	int count = 0, i;
+	int count = 0, i, res;
 	uint8_t id;
 
 	/*
@@ -3071,22 +3075,21 @@ parse_init_table(struct nvbios *bios, unsigned int offset,
 				offset, itbl_entry[i].id, itbl_entry[i].name);
 
 			/* execute eventual command handler */
-			if (itbl_entry[i].handler)
-				if (!(*itbl_entry[i].handler)(bios, offset, iexec))
-					break;
+			res = (*itbl_entry[i].handler)(bios, offset, iexec);
+			if (!res)
+				break;
+			/*
+			 * Add the offset of the current command including all data
+			 * of that command. The offset will then be pointing on the
+			 * next op code.
+			 */
+			offset += res;
 		} else {
 			NV_ERROR(bios->dev,
 				 "0x%04X: Init table command not found: "
 				 "0x%02X\n", offset, id);
 			return -ENOENT;
 		}
-
-		/*
-		 * Add the offset of the current command including all data
-		 * of that command. The offset will then be pointing on the
-		 * next op code.
-		 */
-		offset += get_init_table_entry_length(bios, offset, i);
 	}
 
 	if (offset >= bios->length)
@@ -4601,10 +4604,6 @@ parse_bit_M_tbl_entry(struct drm_device *dev, struct nvbios *bios,
 	 * stuff that we don't use - their use currently unknown
 	 */
 
-	uint16_t rr_strap_xlat;
-	uint8_t rr_group_count;
-	int i;
-
 	/*
 	 * Older bios versions don't have a sufficiently long table for
 	 * what we want
@@ -4613,24 +4612,13 @@ parse_bit_M_tbl_entry(struct drm_device *dev, struct nvbios *bios,
 		return 0;
 
 	if (bitentry->id[1] < 2) {
-		rr_group_count = bios->data[bitentry->offset + 2];
-		rr_strap_xlat = ROM16(bios->data[bitentry->offset + 3]);
+		bios->ram_restrict_group_count = bios->data[bitentry->offset + 2];
+		bios->ram_restrict_tbl_ptr = ROM16(bios->data[bitentry->offset + 3]);
 	} else {
-		rr_group_count = bios->data[bitentry->offset + 0];
-		rr_strap_xlat = ROM16(bios->data[bitentry->offset + 1]);
+		bios->ram_restrict_group_count = bios->data[bitentry->offset + 0];
+		bios->ram_restrict_tbl_ptr = ROM16(bios->data[bitentry->offset + 1]);
 	}
 
-	/* adjust length of INIT_87 */
-	for (i = 0; itbl_entry[i].name && (itbl_entry[i].id != 0x87); i++);
-	itbl_entry[i].length += rr_group_count * 4;
-
-	/* set up multiplier for INIT_RAM_RESTRICT_ZM_REG_GROUP */
-	for (; itbl_entry[i].name && (itbl_entry[i].id != 0x8f); i++);
-	itbl_entry[i].length_multiplier = rr_group_count * 4;
-
-	init_ram_restrict_zm_reg_group_blocklen = itbl_entry[i].length_multiplier;
-	bios->ram_restrict_tbl_ptr = rr_strap_xlat;
-
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_bios.h b/drivers/gpu/drm/nouveau/nouveau_bios.h
index 1d5f10b..058e98c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bios.h
+++ b/drivers/gpu/drm/nouveau/nouveau_bios.h
@@ -227,6 +227,7 @@ struct nvbios {
 
 	uint16_t pll_limit_tbl_ptr;
 	uint16_t ram_restrict_tbl_ptr;
+	uint8_t ram_restrict_group_count;
 
 	uint16_t some_script_ptr; /* BIT I + 14 */
 	uint16_t init96_tbl_ptr; /* BIT I + 16 */
-- 
1.6.5.6

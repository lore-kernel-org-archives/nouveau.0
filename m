From: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
Subject: [PATCH 01/10] bios/fan: add support for maxwell's fan
	management table v2
Date: Sun, 17 Aug 2014 17:33:06 +0200
Message-ID: <1408289594-28587-1-git-send-email-martin.peres@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Re-use the therm-exported fan structure with only two minor modifications:
- pwm_freq: u16 -> u32;
- add fan_type (toggle or PWM)

v2:
- Do not memset the table to 0 as it erases the pre-set default values

Signed-off-by: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
---
 drm/Kbuild                         |  1 +
 drm/core/include/subdev/bios/fan.h |  1 +
 drm/core/subdev/bios/fan.c         |  1 +
 nvkm/include/subdev/bios/fan.h     |  8 ++++
 nvkm/include/subdev/bios/therm.h   | 10 +++-
 nvkm/subdev/bios/Makefile.am       |  3 +-
 nvkm/subdev/bios/fan.c             | 93 ++++++++++++++++++++++++++++++++++++++
 7 files changed, 115 insertions(+), 2 deletions(-)
 create mode 120000 drm/core/include/subdev/bios/fan.h
 create mode 120000 drm/core/subdev/bios/fan.c
 create mode 100644 nvkm/include/subdev/bios/fan.h
 create mode 100644 nvkm/subdev/bios/fan.c

diff --git a/drm/Kbuild b/drm/Kbuild
index f5d7f7c..75aa5e3 100644
--- a/drm/Kbuild
+++ b/drm/Kbuild
@@ -52,6 +52,7 @@ nouveau-y += core/subdev/bios/vmap.o
 nouveau-y += core/subdev/bios/volt.o
 nouveau-y += core/subdev/bios/xpio.o
 nouveau-y += core/subdev/bios/P0260.o
+nouveau-y += core/subdev/bios/fan.o
 nouveau-y += core/subdev/bus/hwsq.o
 nouveau-y += core/subdev/bus/nv04.o
 nouveau-y += core/subdev/bus/nv31.o
diff --git a/drm/core/include/subdev/bios/fan.h b/drm/core/include/subdev/bios/fan.h
new file mode 120000
index 0000000..b56c338
--- /dev/null
+++ b/drm/core/include/subdev/bios/fan.h
@@ -0,0 +1 @@
+../../../../../nvkm/include/subdev/bios/fan.h
\ No newline at end of file
diff --git a/drm/core/subdev/bios/fan.c b/drm/core/subdev/bios/fan.c
new file mode 120000
index 0000000..fe14fa4
--- /dev/null
+++ b/drm/core/subdev/bios/fan.c
@@ -0,0 +1 @@
+../../../../nvkm/subdev/bios/fan.c
\ No newline at end of file
diff --git a/nvkm/include/subdev/bios/fan.h b/nvkm/include/subdev/bios/fan.h
new file mode 100644
index 0000000..119d087
--- /dev/null
+++ b/nvkm/include/subdev/bios/fan.h
@@ -0,0 +1,8 @@
+#ifndef __NVBIOS_FAN_H__
+#define __NVBIOS_FAN_H__
+
+#include <subdev/bios/therm.h>
+
+u16 nvbios_fan_parse(struct nouveau_bios *bios, struct nvbios_therm_fan *fan);
+
+#endif
diff --git a/nvkm/include/subdev/bios/therm.h b/nvkm/include/subdev/bios/therm.h
index 8dc5051..295d093 100644
--- a/nvkm/include/subdev/bios/therm.h
+++ b/nvkm/include/subdev/bios/therm.h
@@ -23,6 +23,12 @@ struct nvbios_therm_sensor {
 	struct nvbios_therm_threshold thrs_shutdown;
 };
 
+enum nvbios_therm_fan_type {
+	NVBIOS_THERM_FAN_UNK = 0,
+	NVBIOS_THERM_FAN_TOGGLE = 1,
+	NVBIOS_THERM_FAN_PWM = 2,
+};
+
 /* no vbios have more than 6 */
 #define NOUVEAU_TEMP_FAN_TRIP_MAX 10
 struct nouveau_therm_trip_point {
@@ -38,7 +44,9 @@ enum nvbios_therm_fan_mode {
 };
 
 struct nvbios_therm_fan {
-	u16 pwm_freq;
+	enum nvbios_therm_fan_type type;
+
+	u32 pwm_freq;
 
 	u8 min_duty;
 	u8 max_duty;
diff --git a/nvkm/subdev/bios/Makefile.am b/nvkm/subdev/bios/Makefile.am
index 120b941..3ad1daf 100644
--- a/nvkm/subdev/bios/Makefile.am
+++ b/nvkm/subdev/bios/Makefile.am
@@ -22,6 +22,7 @@ libbios_la_SOURCES = base.c \
 		     vmap.c \
 		     volt.c \
 		     xpio.c \
-		     P0260.c
+		     P0260.c \
+		     fan.c
 
 include $(srcdir)/../Makefile.subdev
diff --git a/nvkm/subdev/bios/fan.c b/nvkm/subdev/bios/fan.c
new file mode 100644
index 0000000..e419892
--- /dev/null
+++ b/nvkm/subdev/bios/fan.c
@@ -0,0 +1,93 @@
+/*
+ * Copyright 2014 Martin Peres
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * Authors: Martin Peres
+ */
+
+#include <subdev/bios.h>
+#include <subdev/bios/bit.h>
+#include <subdev/bios/fan.h>
+
+u16
+nvbios_fan_table(struct nouveau_bios *bios, u8 *ver, u8 *hdr, u8 *cnt, u8 *len)
+{
+	struct bit_entry bit_P;
+	u16 fan = 0x0000;
+
+	if (!bit_entry(bios, 'P', &bit_P)) {
+		if (bit_P.version == 2 && bit_P.length >= 0x5a)
+			fan = nv_ro16(bios, bit_P.offset + 0x58);
+
+		if (fan) {
+			*ver = nv_ro08(bios, fan + 0);
+			switch (*ver) {
+			case 0x10:
+				*hdr = nv_ro08(bios, fan + 1);
+				*len = nv_ro08(bios, fan + 2);
+				*cnt = nv_ro08(bios, fan + 3);
+				return fan;
+			default:
+				break;
+			}
+		}
+	}
+
+	return 0x0000;
+}
+
+u16
+nvbios_fan_entry(struct nouveau_bios *bios, int idx, u8 *ver, u8 *hdr,
+		 u8 *cnt, u8 *len)
+{
+	u16 data = nvbios_fan_table(bios, ver, hdr, cnt, len);
+	if (data && idx < *cnt)
+		return data + *hdr + (idx * (*len));
+	return 0x0000;
+}
+
+u16
+nvbios_fan_parse(struct nouveau_bios *bios, struct nvbios_therm_fan *fan)
+{
+	u8 ver, hdr, cnt, len;
+
+	u16 data = nvbios_fan_entry(bios, 0, &ver, &hdr, &cnt, &len);
+	if (data) {
+		u8 type = nv_ro08(bios, data + 0x00);
+		switch (type) {
+		case 0:
+			fan->type = NVBIOS_THERM_FAN_TOGGLE;
+			break;
+		case 1:
+		case 2:
+			/* TODO: Understand the difference between the two! */
+			fan->type = NVBIOS_THERM_FAN_PWM;
+			break;
+		default:
+			fan->type = NVBIOS_THERM_FAN_UNK;
+		}
+
+		fan->min_duty = nv_ro08(bios, data + 0x02);
+		fan->max_duty = nv_ro08(bios, data + 0x03);
+
+		fan->pwm_freq = nv_ro32(bios, data + 0x0b) & 0xffffff;
+	}
+	return data;
+}
-- 
2.0.0

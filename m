From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] gpio: rename g92 class to g94
Date: Mon,  8 Sep 2014 20:27:57 +0100
Message-ID: <1410204477-29577-1-git-send-email-emil.l.velikov@gmail.com>
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
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: nouveau.vger.kernel.org

nv92 hardware has only 16 interrupt lines, while nv94 and later
has 32. Accessing 0xe0c{0,4} registers on nv92 can lead to incorrect
PDISP setup. This is a regression introduced with

commit 9d0f5ec9ee0fd5dc5fc1cc2cf559286431e406e3
Author: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Date:   Mon May 12 15:22:42 2014 +1000

    gpio: split g92 class from nv50

Reported-by: estece on #nouveau
Cc: stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org # 3.16+
Signed-off-by: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 nvkm/engine/device/nv50.c    | 22 ++++++-------
 nvkm/engine/device/nvc0.c    | 14 ++++-----
 nvkm/subdev/gpio/Makefile.am |  2 +-
 nvkm/subdev/gpio/nv92.c      | 74 --------------------------------------------
 nvkm/subdev/gpio/nv94.c      | 74 ++++++++++++++++++++++++++++++++++++++++++++
 nvkm/subdev/gpio/nvd0.c      |  4 +--
 nvkm/subdev/gpio/priv.h      |  4 +--
 7 files changed, 97 insertions(+), 97 deletions(-)
 delete mode 100644 nvkm/subdev/gpio/nv92.c
 create mode 100644 nvkm/subdev/gpio/nv94.c

diff --git a/nvkm/engine/device/nv50.c b/nvkm/engine/device/nv50.c
index ca265fe..96f568d 100644
--- a/nvkm/engine/device/nv50.c
+++ b/nvkm/engine/device/nv50.c
@@ -145,7 +145,7 @@ nv50_identify(struct nouveau_device *device)
 	case 0x92:
 		device->cname = "G92";
 		device->oclass[NVDEV_SUBDEV_VBIOS  ] = &nouveau_bios_oclass;
-		device->oclass[NVDEV_SUBDEV_GPIO   ] =  nv92_gpio_oclass;
+		device->oclass[NVDEV_SUBDEV_GPIO   ] =  nv50_gpio_oclass;
 		device->oclass[NVDEV_SUBDEV_I2C    ] =  nv50_i2c_oclass;
 		device->oclass[NVDEV_SUBDEV_FUSE   ] =  &g80_fuse_oclass;
 		device->oclass[NVDEV_SUBDEV_CLOCK  ] =  nv84_clock_oclass;
@@ -174,7 +174,7 @@ nv50_identify(struct nouveau_device *device)
 	case 0x94:
 		device->cname = "G94";
 		device->oclass[NVDEV_SUBDEV_VBIOS  ] = &nouveau_bios_oclass;
-		device->oclass[NVDEV_SUBDEV_GPIO   ] =  nv92_gpio_oclass;
+		device->oclass[NVDEV_SUBDEV_GPIO   ] =  nv94_gpio_oclass;
 		device->oclass[NVDEV_SUBDEV_I2C    ] =  nv94_i2c_oclass;
 		device->oclass[NVDEV_SUBDEV_FUSE   ] =  &g80_fuse_oclass;
 		device->oclass[NVDEV_SUBDEV_CLOCK  ] =  nv84_clock_oclass;
@@ -203,7 +203,7 @@ nv50_identify(struct nouveau_device *device)
 	case 0x96:
 		device->cname = "G96";
 		device->oclass[NVDEV_SUBDEV_VBIOS  ] = &nouveau_bios_oclass;
-		device->oclass[NVDEV_SUBDEV_GPIO   ] =  nv92_gpio_oclass;
+		device->oclass[NVDEV_SUBDEV_GPIO   ] =  nv94_gpio_oclass;
 		device->oclass[NVDEV_SUBDEV_I2C    ] =  nv94_i2c_oclass;
 		device->oclass[NVDEV_SUBDEV_FUSE   ] =  &g80_fuse_oclass;
 		device->oclass[NVDEV_SUBDEV_CLOCK  ] =  nv84_clock_oclass;
@@ -232,7 +232,7 @@ nv50_identify(struct nouveau_device *device)
 	case 0x98:
 		device->cname = "G98";
 		device->oclass[NVDEV_SUBDEV_VBIOS  ] = &nouveau_bios_oclass;
-		device->oclass[NVDEV_SUBDEV_GPIO   ] =  nv92_gpio_oclass;
+		device->oclass[NVDEV_SUBDEV_GPIO   ] =  nv94_gpio_oclass;
 		device->oclass[NVDEV_SUBDEV_I2C    ] =  nv94_i2c_oclass;
 		device->oclass[NVDEV_SUBDEV_FUSE   ] =  &g80_fuse_oclass;
 		device->oclass[NVDEV_SUBDEV_CLOCK  ] =  nv84_clock_oclass;
@@ -261,7 +261,7 @@ nv50_identify(struct nouveau_device *device)
 	case 0xa0:
 		device->cname = "G200";
 		device->oclass[NVDEV_SUBDEV_VBIOS  ] = &nouveau_bios_oclass;
-		device->oclass[NVDEV_SUBDEV_GPIO   ] =  nv92_gpio_oclass;
+		device->oclass[NVDEV_SUBDEV_GPIO   ] =  nv94_gpio_oclass;
 		device->oclass[NVDEV_SUBDEV_I2C    ] =  nv50_i2c_oclass;
 		device->oclass[NVDEV_SUBDEV_FUSE   ] =  &g80_fuse_oclass;
 		device->oclass[NVDEV_SUBDEV_CLOCK  ] =  nv84_clock_oclass;
@@ -290,7 +290,7 @@ nv50_identify(struct nouveau_device *device)
 	case 0xaa:
 		device->cname = "MCP77/MCP78";
 		device->oclass[NVDEV_SUBDEV_VBIOS  ] = &nouveau_bios_oclass;
-		device->oclass[NVDEV_SUBDEV_GPIO   ] =  nv92_gpio_oclass;
+		device->oclass[NVDEV_SUBDEV_GPIO   ] =  nv94_gpio_oclass;
 		device->oclass[NVDEV_SUBDEV_I2C    ] =  nv94_i2c_oclass;
 		device->oclass[NVDEV_SUBDEV_FUSE   ] =  &g80_fuse_oclass;
 		device->oclass[NVDEV_SUBDEV_CLOCK  ] =  nvaa_clock_oclass;
@@ -319,7 +319,7 @@ nv50_identify(struct nouveau_device *device)
 	case 0xac:
 		device->cname = "MCP79/MCP7A";
 		device->oclass[NVDEV_SUBDEV_VBIOS  ] = &nouveau_bios_oclass;
-		device->oclass[NVDEV_SUBDEV_GPIO   ] =  nv92_gpio_oclass;
+		device->oclass[NVDEV_SUBDEV_GPIO   ] =  nv94_gpio_oclass;
 		device->oclass[NVDEV_SUBDEV_I2C    ] =  nv94_i2c_oclass;
 		device->oclass[NVDEV_SUBDEV_FUSE   ] =  &g80_fuse_oclass;
 		device->oclass[NVDEV_SUBDEV_CLOCK  ] =  nvaa_clock_oclass;
@@ -348,7 +348,7 @@ nv50_identify(struct nouveau_device *device)
 	case 0xa3:
 		device->cname = "GT215";
 		device->oclass[NVDEV_SUBDEV_VBIOS  ] = &nouveau_bios_oclass;
-		device->oclass[NVDEV_SUBDEV_GPIO   ] =  nv92_gpio_oclass;
+		device->oclass[NVDEV_SUBDEV_GPIO   ] =  nv94_gpio_oclass;
 		device->oclass[NVDEV_SUBDEV_I2C    ] =  nv94_i2c_oclass;
 		device->oclass[NVDEV_SUBDEV_FUSE   ] =  &g80_fuse_oclass;
 		device->oclass[NVDEV_SUBDEV_CLOCK  ] = &nva3_clock_oclass;
@@ -379,7 +379,7 @@ nv50_identify(struct nouveau_device *device)
 	case 0xa5:
 		device->cname = "GT216";
 		device->oclass[NVDEV_SUBDEV_VBIOS  ] = &nouveau_bios_oclass;
-		device->oclass[NVDEV_SUBDEV_GPIO   ] =  nv92_gpio_oclass;
+		device->oclass[NVDEV_SUBDEV_GPIO   ] =  nv94_gpio_oclass;
 		device->oclass[NVDEV_SUBDEV_I2C    ] =  nv94_i2c_oclass;
 		device->oclass[NVDEV_SUBDEV_FUSE   ] =  &g80_fuse_oclass;
 		device->oclass[NVDEV_SUBDEV_CLOCK  ] = &nva3_clock_oclass;
@@ -409,7 +409,7 @@ nv50_identify(struct nouveau_device *device)
 	case 0xa8:
 		device->cname = "GT218";
 		device->oclass[NVDEV_SUBDEV_VBIOS  ] = &nouveau_bios_oclass;
-		device->oclass[NVDEV_SUBDEV_GPIO   ] =  nv92_gpio_oclass;
+		device->oclass[NVDEV_SUBDEV_GPIO   ] =  nv94_gpio_oclass;
 		device->oclass[NVDEV_SUBDEV_I2C    ] =  nv94_i2c_oclass;
 		device->oclass[NVDEV_SUBDEV_FUSE   ] =  &g80_fuse_oclass;
 		device->oclass[NVDEV_SUBDEV_CLOCK  ] = &nva3_clock_oclass;
@@ -439,7 +439,7 @@ nv50_identify(struct nouveau_device *device)
 	case 0xaf:
 		device->cname = "MCP89";
 		device->oclass[NVDEV_SUBDEV_VBIOS  ] = &nouveau_bios_oclass;
-		device->oclass[NVDEV_SUBDEV_GPIO   ] =  nv92_gpio_oclass;
+		device->oclass[NVDEV_SUBDEV_GPIO   ] =  nv94_gpio_oclass;
 		device->oclass[NVDEV_SUBDEV_I2C    ] =  nv94_i2c_oclass;
 		device->oclass[NVDEV_SUBDEV_FUSE   ] =  &g80_fuse_oclass;
 		device->oclass[NVDEV_SUBDEV_CLOCK  ] = &nva3_clock_oclass;
diff --git a/nvkm/engine/device/nvc0.c b/nvkm/engine/device/nvc0.c
index 89b9fd4..cd05677 100644
--- a/nvkm/engine/device/nvc0.c
+++ b/nvkm/engine/device/nvc0.c
@@ -61,7 +61,7 @@ nvc0_identify(struct nouveau_device *device)
 	case 0xc0:
 		device->cname = "GF100";
 		device->oclass[NVDEV_SUBDEV_VBIOS  ] = &nouveau_bios_oclass;
-		device->oclass[NVDEV_SUBDEV_GPIO   ] =  nv92_gpio_oclass;
+		device->oclass[NVDEV_SUBDEV_GPIO   ] =  nv94_gpio_oclass;
 		device->oclass[NVDEV_SUBDEV_I2C    ] =  nv94_i2c_oclass;
 		device->oclass[NVDEV_SUBDEV_FUSE   ] = &gf100_fuse_oclass;
 		device->oclass[NVDEV_SUBDEV_CLOCK  ] = &nvc0_clock_oclass;
@@ -94,7 +94,7 @@ nvc0_identify(struct nouveau_device *device)
 	case 0xc4:
 		device->cname = "GF104";
 		device->oclass[NVDEV_SUBDEV_VBIOS  ] = &nouveau_bios_oclass;
-		device->oclass[NVDEV_SUBDEV_GPIO   ] =  nv92_gpio_oclass;
+		device->oclass[NVDEV_SUBDEV_GPIO   ] =  nv94_gpio_oclass;
 		device->oclass[NVDEV_SUBDEV_I2C    ] =  nv94_i2c_oclass;
 		device->oclass[NVDEV_SUBDEV_FUSE   ] = &gf100_fuse_oclass;
 		device->oclass[NVDEV_SUBDEV_CLOCK  ] = &nvc0_clock_oclass;
@@ -127,7 +127,7 @@ nvc0_identify(struct nouveau_device *device)
 	case 0xc3:
 		device->cname = "GF106";
 		device->oclass[NVDEV_SUBDEV_VBIOS  ] = &nouveau_bios_oclass;
-		device->oclass[NVDEV_SUBDEV_GPIO   ] =  nv92_gpio_oclass;
+		device->oclass[NVDEV_SUBDEV_GPIO   ] =  nv94_gpio_oclass;
 		device->oclass[NVDEV_SUBDEV_I2C    ] =  nv94_i2c_oclass;
 		device->oclass[NVDEV_SUBDEV_FUSE   ] = &gf100_fuse_oclass;
 		device->oclass[NVDEV_SUBDEV_CLOCK  ] = &nvc0_clock_oclass;
@@ -159,7 +159,7 @@ nvc0_identify(struct nouveau_device *device)
 	case 0xce:
 		device->cname = "GF114";
 		device->oclass[NVDEV_SUBDEV_VBIOS  ] = &nouveau_bios_oclass;
-		device->oclass[NVDEV_SUBDEV_GPIO   ] =  nv92_gpio_oclass;
+		device->oclass[NVDEV_SUBDEV_GPIO   ] =  nv94_gpio_oclass;
 		device->oclass[NVDEV_SUBDEV_I2C    ] =  nv94_i2c_oclass;
 		device->oclass[NVDEV_SUBDEV_FUSE   ] = &gf100_fuse_oclass;
 		device->oclass[NVDEV_SUBDEV_CLOCK  ] = &nvc0_clock_oclass;
@@ -192,7 +192,7 @@ nvc0_identify(struct nouveau_device *device)
 	case 0xcf:
 		device->cname = "GF116";
 		device->oclass[NVDEV_SUBDEV_VBIOS  ] = &nouveau_bios_oclass;
-		device->oclass[NVDEV_SUBDEV_GPIO   ] =  nv92_gpio_oclass;
+		device->oclass[NVDEV_SUBDEV_GPIO   ] =  nv94_gpio_oclass;
 		device->oclass[NVDEV_SUBDEV_I2C    ] =  nv94_i2c_oclass;
 		device->oclass[NVDEV_SUBDEV_FUSE   ] = &gf100_fuse_oclass;
 		device->oclass[NVDEV_SUBDEV_CLOCK  ] = &nvc0_clock_oclass;
@@ -225,7 +225,7 @@ nvc0_identify(struct nouveau_device *device)
 	case 0xc1:
 		device->cname = "GF108";
 		device->oclass[NVDEV_SUBDEV_VBIOS  ] = &nouveau_bios_oclass;
-		device->oclass[NVDEV_SUBDEV_GPIO   ] =  nv92_gpio_oclass;
+		device->oclass[NVDEV_SUBDEV_GPIO   ] =  nv94_gpio_oclass;
 		device->oclass[NVDEV_SUBDEV_I2C    ] =  nv94_i2c_oclass;
 		device->oclass[NVDEV_SUBDEV_FUSE   ] = &gf100_fuse_oclass;
 		device->oclass[NVDEV_SUBDEV_CLOCK  ] = &nvc0_clock_oclass;
@@ -257,7 +257,7 @@ nvc0_identify(struct nouveau_device *device)
 	case 0xc8:
 		device->cname = "GF110";
 		device->oclass[NVDEV_SUBDEV_VBIOS  ] = &nouveau_bios_oclass;
-		device->oclass[NVDEV_SUBDEV_GPIO   ] =  nv92_gpio_oclass;
+		device->oclass[NVDEV_SUBDEV_GPIO   ] =  nv94_gpio_oclass;
 		device->oclass[NVDEV_SUBDEV_I2C    ] =  nv94_i2c_oclass;
 		device->oclass[NVDEV_SUBDEV_FUSE   ] = &gf100_fuse_oclass;
 		device->oclass[NVDEV_SUBDEV_CLOCK  ] = &nvc0_clock_oclass;
diff --git a/nvkm/subdev/gpio/Makefile.am b/nvkm/subdev/gpio/Makefile.am
index aaafdab..012eb06 100644
--- a/nvkm/subdev/gpio/Makefile.am
+++ b/nvkm/subdev/gpio/Makefile.am
@@ -3,7 +3,7 @@ noinst_LTLIBRARIES = libgpio.la
 libgpio_la_SOURCES = base.c \
 		     nv10.c \
 		     nv50.c \
-		     nv92.c \
+		     nv94.c \
 		     nvd0.c \
 		     nve0.c
 
diff --git a/nvkm/subdev/gpio/nv92.c b/nvkm/subdev/gpio/nv92.c
deleted file mode 100644
index 252083d..0000000
--- a/nvkm/subdev/gpio/nv92.c
+++ /dev/null
@@ -1,74 +0,0 @@
-/*
- * Copyright 2012 Red Hat Inc.
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
- * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
- * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
- * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- * OTHER DEALINGS IN THE SOFTWARE.
- *
- * Authors: Ben Skeggs
- */
-
-#include "priv.h"
-
-void
-nv92_gpio_intr_stat(struct nouveau_gpio *gpio, u32 *hi, u32 *lo)
-{
-	u32 intr0 = nv_rd32(gpio, 0x00e054);
-	u32 intr1 = nv_rd32(gpio, 0x00e074);
-	u32 stat0 = nv_rd32(gpio, 0x00e050) & intr0;
-	u32 stat1 = nv_rd32(gpio, 0x00e070) & intr1;
-	*lo = (stat1 & 0xffff0000) | (stat0 >> 16);
-	*hi = (stat1 << 16) | (stat0 & 0x0000ffff);
-	nv_wr32(gpio, 0x00e054, intr0);
-	nv_wr32(gpio, 0x00e074, intr1);
-}
-
-void
-nv92_gpio_intr_mask(struct nouveau_gpio *gpio, u32 type, u32 mask, u32 data)
-{
-	u32 inte0 = nv_rd32(gpio, 0x00e050);
-	u32 inte1 = nv_rd32(gpio, 0x00e070);
-	if (type & NVKM_GPIO_LO)
-		inte0 = (inte0 & ~(mask << 16)) | (data << 16);
-	if (type & NVKM_GPIO_HI)
-		inte0 = (inte0 & ~(mask & 0xffff)) | (data & 0xffff);
-	mask >>= 16;
-	data >>= 16;
-	if (type & NVKM_GPIO_LO)
-		inte1 = (inte1 & ~(mask << 16)) | (data << 16);
-	if (type & NVKM_GPIO_HI)
-		inte1 = (inte1 & ~mask) | data;
-	nv_wr32(gpio, 0x00e050, inte0);
-	nv_wr32(gpio, 0x00e070, inte1);
-}
-
-struct nouveau_oclass *
-nv92_gpio_oclass = &(struct nouveau_gpio_impl) {
-	.base.handle = NV_SUBDEV(GPIO, 0x92),
-	.base.ofuncs = &(struct nouveau_ofuncs) {
-		.ctor = _nouveau_gpio_ctor,
-		.dtor = _nouveau_gpio_dtor,
-		.init = _nouveau_gpio_init,
-		.fini = _nouveau_gpio_fini,
-	},
-	.lines = 32,
-	.intr_stat = nv92_gpio_intr_stat,
-	.intr_mask = nv92_gpio_intr_mask,
-	.drive = nv50_gpio_drive,
-	.sense = nv50_gpio_sense,
-	.reset = nv50_gpio_reset,
-}.base;
diff --git a/nvkm/subdev/gpio/nv94.c b/nvkm/subdev/gpio/nv94.c
new file mode 100644
index 0000000..cae404c
--- /dev/null
+++ b/nvkm/subdev/gpio/nv94.c
@@ -0,0 +1,74 @@
+/*
+ * Copyright 2012 Red Hat Inc.
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
+ * Authors: Ben Skeggs
+ */
+
+#include "priv.h"
+
+void
+nv94_gpio_intr_stat(struct nouveau_gpio *gpio, u32 *hi, u32 *lo)
+{
+	u32 intr0 = nv_rd32(gpio, 0x00e054);
+	u32 intr1 = nv_rd32(gpio, 0x00e074);
+	u32 stat0 = nv_rd32(gpio, 0x00e050) & intr0;
+	u32 stat1 = nv_rd32(gpio, 0x00e070) & intr1;
+	*lo = (stat1 & 0xffff0000) | (stat0 >> 16);
+	*hi = (stat1 << 16) | (stat0 & 0x0000ffff);
+	nv_wr32(gpio, 0x00e054, intr0);
+	nv_wr32(gpio, 0x00e074, intr1);
+}
+
+void
+nv94_gpio_intr_mask(struct nouveau_gpio *gpio, u32 type, u32 mask, u32 data)
+{
+	u32 inte0 = nv_rd32(gpio, 0x00e050);
+	u32 inte1 = nv_rd32(gpio, 0x00e070);
+	if (type & NVKM_GPIO_LO)
+		inte0 = (inte0 & ~(mask << 16)) | (data << 16);
+	if (type & NVKM_GPIO_HI)
+		inte0 = (inte0 & ~(mask & 0xffff)) | (data & 0xffff);
+	mask >>= 16;
+	data >>= 16;
+	if (type & NVKM_GPIO_LO)
+		inte1 = (inte1 & ~(mask << 16)) | (data << 16);
+	if (type & NVKM_GPIO_HI)
+		inte1 = (inte1 & ~mask) | data;
+	nv_wr32(gpio, 0x00e050, inte0);
+	nv_wr32(gpio, 0x00e070, inte1);
+}
+
+struct nouveau_oclass *
+nv94_gpio_oclass = &(struct nouveau_gpio_impl) {
+	.base.handle = NV_SUBDEV(GPIO, 0x94),
+	.base.ofuncs = &(struct nouveau_ofuncs) {
+		.ctor = _nouveau_gpio_ctor,
+		.dtor = _nouveau_gpio_dtor,
+		.init = _nouveau_gpio_init,
+		.fini = _nouveau_gpio_fini,
+	},
+	.lines = 32,
+	.intr_stat = nv94_gpio_intr_stat,
+	.intr_mask = nv94_gpio_intr_mask,
+	.drive = nv50_gpio_drive,
+	.sense = nv50_gpio_sense,
+	.reset = nv50_gpio_reset,
+}.base;
diff --git a/nvkm/subdev/gpio/nvd0.c b/nvkm/subdev/gpio/nvd0.c
index a4682b0..480d6d2 100644
--- a/nvkm/subdev/gpio/nvd0.c
+++ b/nvkm/subdev/gpio/nvd0.c
@@ -77,8 +77,8 @@ nvd0_gpio_oclass = &(struct nouveau_gpio_impl) {
 		.fini = _nouveau_gpio_fini,
 	},
 	.lines = 32,
-	.intr_stat = nv92_gpio_intr_stat,
-	.intr_mask = nv92_gpio_intr_mask,
+	.intr_stat = nv94_gpio_intr_stat,
+	.intr_mask = nv94_gpio_intr_mask,
 	.drive = nvd0_gpio_drive,
 	.sense = nvd0_gpio_sense,
 	.reset = nvd0_gpio_reset,
diff --git a/nvkm/subdev/gpio/priv.h b/nvkm/subdev/gpio/priv.h
index e1724df..bff98b8 100644
--- a/nvkm/subdev/gpio/priv.h
+++ b/nvkm/subdev/gpio/priv.h
@@ -56,8 +56,8 @@ void nv50_gpio_reset(struct nouveau_gpio *, u8);
 int  nv50_gpio_drive(struct nouveau_gpio *, int, int, int);
 int  nv50_gpio_sense(struct nouveau_gpio *, int);
 
-void nv92_gpio_intr_stat(struct nouveau_gpio *, u32 *, u32 *);
-void nv92_gpio_intr_mask(struct nouveau_gpio *, u32, u32, u32);
+void nv94_gpio_intr_stat(struct nouveau_gpio *, u32 *, u32 *);
+void nv94_gpio_intr_mask(struct nouveau_gpio *, u32, u32, u32);
 
 void nvd0_gpio_reset(struct nouveau_gpio *, u8);
 int  nvd0_gpio_drive(struct nouveau_gpio *, int, int, int);
-- 
2.0.2

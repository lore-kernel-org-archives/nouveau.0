From: Roy Spliet <rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org>
Subject: [PATCH] fb/sddr2: Generate MR values
Date: Fri,  5 Sep 2014 02:41:46 +0200
Message-ID: <1409877706-5298-2-git-send-email-rspliet@eclipso.eu>
References: <1409877706-5298-1-git-send-email-rspliet@eclipso.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1409877706-5298-1-git-send-email-rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Nouveau Mailinglist <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Cc: Roy Spliet <rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org>
List-Id: nouveau.vger.kernel.org

V2: Always disable DLL reset

Signed-off-by: Roy Spliet <rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org>
---
 drivers/gpu/drm/nouveau/Makefile               |  1 +
 drivers/gpu/drm/nouveau/core/subdev/fb/priv.h  |  1 +
 drivers/gpu/drm/nouveau/core/subdev/fb/sddr2.c | 96 ++++++++++++++++++++++++++
 3 files changed, 98 insertions(+)
 create mode 100644 drivers/gpu/drm/nouveau/core/subdev/fb/sddr2.c

diff --git a/drivers/gpu/drm/nouveau/Makefile b/drivers/gpu/drm/nouveau/Makefile
index 8b307e1..8228e05 100644
--- a/drivers/gpu/drm/nouveau/Makefile
+++ b/drivers/gpu/drm/nouveau/Makefile
@@ -120,6 +120,7 @@ nouveau-y += core/subdev/fb/ramnvc0.o
 nouveau-y += core/subdev/fb/ramnve0.o
 nouveau-y += core/subdev/fb/ramgk20a.o
 nouveau-y += core/subdev/fb/ramgm107.o
+nouveau-y += core/subdev/fb/sddr2.o
 nouveau-y += core/subdev/fb/sddr3.o
 nouveau-y += core/subdev/fb/gddr5.o
 nouveau-y += core/subdev/gpio/base.o
diff --git a/drivers/gpu/drm/nouveau/core/subdev/fb/priv.h b/drivers/gpu/drm/nouveau/core/subdev/fb/priv.h
index 82273f8..60322e9 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/fb/priv.h
+++ b/drivers/gpu/drm/nouveau/core/subdev/fb/priv.h
@@ -35,6 +35,7 @@ extern struct nouveau_oclass nve0_ram_oclass;
 extern struct nouveau_oclass gk20a_ram_oclass;
 extern struct nouveau_oclass gm107_ram_oclass;
 
+int nouveau_sddr2_calc(struct nouveau_ram *ram);
 int nouveau_sddr3_calc(struct nouveau_ram *ram);
 int nouveau_gddr5_calc(struct nouveau_ram *ram, bool nuts);
 
diff --git a/drivers/gpu/drm/nouveau/core/subdev/fb/sddr2.c b/drivers/gpu/drm/nouveau/core/subdev/fb/sddr2.c
new file mode 100644
index 0000000..b5b0432
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/core/subdev/fb/sddr2.c
@@ -0,0 +1,96 @@
+/*
+ * Copyright 2014 Roy Spliet
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
+ * Authors: Roy Spliet <rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org>
+ *          Ben Skeggs
+ */
+
+#include <subdev/bios.h>
+#include "priv.h"
+
+struct ramxlat {
+	int id;
+	u8 enc;
+};
+
+static inline int
+ramxlat(const struct ramxlat *xlat, int id)
+{
+	while (xlat->id >= 0) {
+		if (xlat->id == id)
+			return xlat->enc;
+		xlat++;
+	}
+	return -EINVAL;
+}
+
+static const struct ramxlat
+ramddr2_cl[] = {
+	{ 2, 2 }, { 3, 3 }, { 4, 4 }, { 5, 5 }, { 6, 6 },
+	/* The following are available in some, but not all DDR2 docs */
+	{ 7, 7 },
+	{ -1 }
+};
+
+static const struct ramxlat
+ramddr2_wr[] = {
+	{ 2, 1 }, { 3, 2 }, { 4, 3 }, { 5, 4 }, { 6, 5 },
+	/* The following are available in some, but not all DDR2 docs */
+	{ 7, 6 },
+	{ -1 }
+};
+
+int
+nouveau_sddr2_calc(struct nouveau_ram *ram)
+{
+	struct nouveau_bios *bios = nouveau_bios(ram);
+	int CL, WR, DLL = 0, ODT = 0;
+
+	switch (!!ram->timing.data * ram->timing.version) {
+	case 0x10:
+		CL  =   nv_ro08(bios, ram->timing.data + 0x02);
+		WR  =   nv_ro08(bios, ram->timing.data + 0x00);
+		DLL = !(nv_ro08(bios, ram->ramcfg.data + 0x02) & 0x40);
+		ODT =   nv_ro08(bios, ram->timing.data + 0x0e) & 0x03;
+		break;
+	case 0x20:
+		CL  =  nv_ro08(bios, ram->timing.data + 0x04) & 0x1f;
+		WR  =  nv_ro08(bios, ram->timing.data + 0x0a) & 0x7f;
+		break;
+	default:
+		return -ENOSYS;
+	}
+
+	CL  = ramxlat(ramddr2_cl, CL);
+	WR  = ramxlat(ramddr2_wr, WR);
+	if (CL < 0 || WR < 0)
+		return -EINVAL;
+
+	ram->mr[0] &= ~0xf70;
+	ram->mr[0] |= (WR & 0x07) << 9;
+	ram->mr[0] |= (CL & 0x07) << 4;
+
+	ram->mr[1] &= ~0x045;
+	ram->mr[1] |= (ODT & 0x1) << 2;
+	ram->mr[1] |= (ODT & 0x2) << 5;
+	ram->mr[1] |= !DLL;
+	return 0;
+}
-- 
1.9.3

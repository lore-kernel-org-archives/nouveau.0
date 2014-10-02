From: Roy Spliet <rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org>
Subject: [PATCH 2/9] fb/gddr3: Generate MR values
Date: Thu,  2 Oct 2014 18:01:51 +0200
Message-ID: <1412265718-1215-3-git-send-email-rspliet@eclipso.eu>
References: <1412011639-3210-1-git-send-email-rspliet@eclipso.eu>
 <1412265718-1215-1-git-send-email-rspliet@eclipso.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1412265718-1215-1-git-send-email-rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org>
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

Signed-off-by: Roy Spliet <rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org>
---
 drivers/gpu/drm/nouveau/Makefile               |   1 +
 drivers/gpu/drm/nouveau/core/subdev/fb/gddr3.c | 117 +++++++++++++++++++++++++
 drivers/gpu/drm/nouveau/core/subdev/fb/priv.h  |   1 +
 3 files changed, 119 insertions(+)
 create mode 100644 drivers/gpu/drm/nouveau/core/subdev/fb/gddr3.c

diff --git a/drivers/gpu/drm/nouveau/Makefile b/drivers/gpu/drm/nouveau/Makefile
index 12c24c8..d5f5aa9 100644
--- a/drivers/gpu/drm/nouveau/Makefile
+++ b/drivers/gpu/drm/nouveau/Makefile
@@ -129,6 +129,7 @@ nouveau-y += core/subdev/fb/ramgk20a.o
 nouveau-y += core/subdev/fb/ramgm107.o
 nouveau-y += core/subdev/fb/sddr2.o
 nouveau-y += core/subdev/fb/sddr3.o
+nouveau-y += core/subdev/fb/gddr3.o
 nouveau-y += core/subdev/fb/gddr5.o
 nouveau-y += core/subdev/fuse/base.o
 nouveau-y += core/subdev/fuse/g80.o
diff --git a/drivers/gpu/drm/nouveau/core/subdev/fb/gddr3.c b/drivers/gpu/drm/nouveau/core/subdev/fb/gddr3.c
new file mode 100644
index 0000000..d85a25d
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/core/subdev/fb/gddr3.c
@@ -0,0 +1,117 @@
+/*
+ * Copyright 2013 Red Hat Inc.
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
+ * Authors: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
+ * 	    Roy Spliet <rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org>
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
+ramgddr3_cl_lo[] = {
+	{ 7, 7 }, { 8, 0 }, { 9, 1 }, { 10, 2 }, { 11, 3 },
+	/* the below are mentioned in some, but not all, gddr3 docs */
+	{ 12, 4 }, { 13, 5 }, { 14, 6 },
+	/* XXX: Per Samsung docs, are these used? They overlap with Qimonda */
+	/* { 4, 4 }, { 5, 5 }, { 6, 6 }, { 12, 8 }, { 13, 9 }, { 14, 10 },
+	 * { 15, 11 }, */
+	{ -1 }
+};
+
+static const struct ramxlat
+ramgddr3_cl_hi[] = {
+	{ 10, 2 }, { 11, 3 }, { 12, 4 }, { 13, 5 }, { 14, 6 }, { 15, 7 },
+	{ 16, 0 }, { 17, 1 },
+	{ -1 }
+};
+
+static const struct ramxlat
+ramgddr3_wr_lo[] = {
+	{ 5, 2 }, { 7, 4 }, { 8, 5 }, { 9, 6 }, { 10, 7 },
+	{ 11, 0 },
+	/* the below are mentioned in some, but not all, gddr3 docs */
+	{ 4, 1 }, { 6, 3 }, { 12, 1 }, { 13 , 2 },
+	{ -1 }
+};
+
+int
+nouveau_gddr3_calc(struct nouveau_ram *ram)
+{
+	int CL, WR, CWL, DLL = 0, ODT = 0, hi;
+
+	switch (ram->next->bios.timing_ver) {
+	case 0x10:
+		CWL = ram->next->bios.timing_10_CWL;
+		CL  = ram->next->bios.timing_10_CL;
+		WR  = ram->next->bios.timing_10_WR;
+		DLL = !ram->next->bios.ramcfg_10_DLLoff;
+		ODT = ram->next->bios.timing_10_ODT;
+		break;
+	case 0x20:
+		CWL = (ram->next->bios.timing[1] & 0x00000f80) >> 7;
+		CL  = (ram->next->bios.timing[1] & 0x0000001f) >> 0;
+		WR  = (ram->next->bios.timing[2] & 0x007f0000) >> 16;
+		/* XXX: Get these values from the VBIOS instead */
+		DLL = !(ram->mr[1] & 0x1);
+		ODT =  (ram->mr[1] & 0x004) >> 2 |
+		       (ram->mr[1] & 0x040) >> 5 |
+		       (ram->mr[1] & 0x200) >> 7;
+		break;
+	default:
+		return -ENOSYS;
+	}
+
+	hi = ram->mr[2] & 0x1;
+	CL  = ramxlat(hi ? ramgddr3_cl_hi : ramgddr3_cl_lo, CL);
+	WR  = ramxlat(ramgddr3_wr_lo, WR);
+	if (CL < 0 || CWL < 1 || CWL > 7 || WR < 0)
+		return -EINVAL;
+
+	ram->mr[0] &= ~0xf74;
+	ram->mr[0] |= (CWL & 0x07) << 9;
+	ram->mr[0] |= (CL & 0x07) << 4;
+	ram->mr[0] |= (CL & 0x08) >> 1;
+
+	ram->mr[1] &= ~0x3fc;
+	ram->mr[1] |= (ODT & 0x03) << 2;
+	ram->mr[1] |= (ODT & 0x03) << 8;
+	ram->mr[1] |= (WR  & 0x03) << 4;
+	ram->mr[1] |= (WR  & 0x04) << 5;
+	ram->mr[1] |= !DLL << 6;
+	return 0;
+}
diff --git a/drivers/gpu/drm/nouveau/core/subdev/fb/priv.h b/drivers/gpu/drm/nouveau/core/subdev/fb/priv.h
index 60322e9..283863f 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/fb/priv.h
+++ b/drivers/gpu/drm/nouveau/core/subdev/fb/priv.h
@@ -37,6 +37,7 @@ extern struct nouveau_oclass gm107_ram_oclass;
 
 int nouveau_sddr2_calc(struct nouveau_ram *ram);
 int nouveau_sddr3_calc(struct nouveau_ram *ram);
+int nouveau_gddr3_calc(struct nouveau_ram *ram);
 int nouveau_gddr5_calc(struct nouveau_ram *ram, bool nuts);
 
 #define nouveau_fb_create(p,e,c,d)                                             \
-- 
1.9.3

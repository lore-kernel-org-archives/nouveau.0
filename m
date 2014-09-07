From: Vincent Pelletier <plr.vincent-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: drm/nve0/disp: Fix HDMI InfoFrame initialisation.
Date: Sun,  7 Sep 2014 09:56:06 +0200
Message-ID: <6493e82e60a29258b7ffa5816ae8e163198624ae.1410076566.git.plr.vincent@gmail.com>
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

Prior to this change, some screen models would display a 2px-large purple line
along left screen border, likely to complain about invalid InfoFrame content.
The following bug report seems to trigger this issue:
  https://bugs.freedesktop.org/show_bug.cgi?id=75203
Running mmiotrace on a GTX 650 (GK107) produces the following trace, regardless
of which output is used (HDMI-1, DVI-D-1, DVI-D-2), to initialise InfoFrame
with blob version 340.32 and processed with envytools' demmio:

  [0] 277.971715 MMIO32 R 0x690400 0x00000200 0x690400 => 0x200
  [0] 277.971743 MMIO32 R 0x690400 0x00000200 0x690400 => 0x200
  [0] 277.971770 MMIO32 W 0x690400 0x00000201 0x690400 <= 0x201
  [0] 277.971798 MMIO32 R 0x690408 0x00000000 0x690408 => 0
  [0] 277.971824 MMIO32 W 0x690408 0x000d0282 0x690408 <= 0xd0282
  [0] 277.971852 MMIO32 R 0x69040c 0x00000000 0x69040c => 0
  [0] 277.971879 MMIO32 W 0x69040c 0x881800cf 0x69040c <= 0x881800cf
  [0] 277.971906 MMIO32 R 0x690410 0x00000000 0x690410 => 0
  [0] 277.971933 MMIO32 W 0x690410 0x00000000 0x690410 <= 0
  [0] 277.971960 MMIO32 R 0x690414 0x00000000 0x690414 => 0
  [0] 277.971987 MMIO32 W 0x690414 0x00000000 0x690414 <= 0
  [0] 277.972015 MMIO32 R 0x690418 0x00000000 0x690418 => 0
  [0] 277.972041 MMIO32 W 0x690418 0x00000000 0x690418 <= 0
  [0] 277.972069 MMIO32 R 0x690400 0x00000201 0x690400 => 0x201
  [0] 277.972096 MMIO32 W 0x690400 0x00000201 0x690400 <= 0x201
[...]
  [0] 277.972893 MMIO32 R 0x6904c0 0x00000000 0x6904c0 => 0
  [0] 277.972920 MMIO32 R 0x6904c0 0x00000000 0x6904c0 => 0
  [0] 277.972947 MMIO32 W 0x6904c0 0x00000001 0x6904c0 <= 0x1
  [0] 277.972975 MMIO32 R 0x6904cc 0x00000001 0x6904cc => 0x1
  [0] 277.973001 MMIO32 W 0x6904cc 0x00000010 0x6904cc <= 0x10
  [0] 277.973029 MMIO32 R 0x6904c0 0x00000001 0x6904c0 => 0x1
  [0] 277.973055 MMIO32 W 0x6904c0 0x00000001 0x6904c0 <= 0x1
  [0] 277.973084 MMIO32 R 0x616f98 0x01020038 PDISPLAY+0x6f98 => 0x1020038
  [0] 277.973112 MMIO32 W 0x690480 0x82000000 0x690480 <= 0x82000000
  [0] 277.973139 MMIO32 W 0x616f98 0x41020038 PDISPLAY+0x6f98 <= 0x41020038

This changes reproduces this trace, with the following exceptions:
- 0x881800cf becomes 0x000000cf, as this value is already used in similar
  functions and it does work
- write to 0x690480 is done before reading from PDISPLAY+0x6f98

This change was tested on a LG Flatron L246WH screen with 1600x1200 (native)
and 800x600 resolutions with scaling disabled on all 3 HDMI-capable outputs
(HDMI-1, DVI-D-1, DVI-D-2) available.
Audio output was tested on HDMI-1 output.
---
 drivers/gpu/drm/nouveau/Makefile                   |  1 +
 .../gpu/drm/nouveau/core/engine/disp/hdminve0.c    | 91 ++++++++++++++++++++++
 drivers/gpu/drm/nouveau/core/engine/disp/nv50.h    |  1 +
 drivers/gpu/drm/nouveau/core/engine/disp/nve0.c    |  2 +-
 4 files changed, 94 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/nouveau/core/engine/disp/hdminve0.c

diff --git a/drivers/gpu/drm/nouveau/Makefile b/drivers/gpu/drm/nouveau/Makefile
index 8b307e1..5a6f31c 100644
--- a/drivers/gpu/drm/nouveau/Makefile
+++ b/drivers/gpu/drm/nouveau/Makefile
@@ -243,6 +243,7 @@ nouveau-y += core/engine/disp/hdanvd0.o
 nouveau-y += core/engine/disp/hdminv84.o
 nouveau-y += core/engine/disp/hdminva3.o
 nouveau-y += core/engine/disp/hdminvd0.o
+nouveau-y += core/engine/disp/hdminve0.o
 nouveau-y += core/engine/disp/piornv50.o
 nouveau-y += core/engine/disp/sornv50.o
 nouveau-y += core/engine/disp/sornv94.o
diff --git a/drivers/gpu/drm/nouveau/core/engine/disp/hdminve0.c b/drivers/gpu/drm/nouveau/core/engine/disp/hdminve0.c
new file mode 100644
index 0000000..4291ff8
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/core/engine/disp/hdminve0.c
@@ -0,0 +1,91 @@
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
+#include <core/os.h>
+#include <core/class.h>
+
+#include "nv50.h"
+
+/*
+[0] 277.971715 MMIO32 R 0x690400 0x00000200 0x690400 => 0x200
+[0] 277.971743 MMIO32 R 0x690400 0x00000200 0x690400 => 0x200
+[0] 277.971770 MMIO32 W 0x690400 0x00000201 0x690400 <= 0x201
+[0] 277.971798 MMIO32 R 0x690408 0x00000000 0x690408 => 0
+[0] 277.971824 MMIO32 W 0x690408 0x000d0282 0x690408 <= 0xd0282
+[0] 277.971852 MMIO32 R 0x69040c 0x00000000 0x69040c => 0
+[0] 277.971879 MMIO32 W 0x69040c 0x881800cf 0x69040c <= 0x881800cf
+[0] 277.971906 MMIO32 R 0x690410 0x00000000 0x690410 => 0
+[0] 277.971933 MMIO32 W 0x690410 0x00000000 0x690410 <= 0
+[0] 277.971960 MMIO32 R 0x690414 0x00000000 0x690414 => 0
+[0] 277.971987 MMIO32 W 0x690414 0x00000000 0x690414 <= 0
+[0] 277.972015 MMIO32 R 0x690418 0x00000000 0x690418 => 0
+[0] 277.972041 MMIO32 W 0x690418 0x00000000 0x690418 <= 0
+[0] 277.972069 MMIO32 R 0x690400 0x00000201 0x690400 => 0x201
+[0] 277.972096 MMIO32 W 0x690400 0x00000201 0x690400 <= 0x201
+
+[0] 277.972893 MMIO32 R 0x6904c0 0x00000000 0x6904c0 => 0
+[0] 277.972920 MMIO32 R 0x6904c0 0x00000000 0x6904c0 => 0
+[0] 277.972947 MMIO32 W 0x6904c0 0x00000001 0x6904c0 <= 0x1
+[0] 277.972975 MMIO32 R 0x6904cc 0x00000001 0x6904cc => 0x1
+[0] 277.973001 MMIO32 W 0x6904cc 0x00000010 0x6904cc <= 0x10
+[0] 277.973029 MMIO32 R 0x6904c0 0x00000001 0x6904c0 => 0x1
+[0] 277.973055 MMIO32 W 0x6904c0 0x00000001 0x6904c0 <= 0x1
+[0] 277.973084 MMIO32 R 0x616f98 0x01020038 PDISPLAY+0x6f98 => 0x1020038
+[0] 277.973112 MMIO32 W 0x690480 0x82000000 0x690480 <= 0x82000000
+[0] 277.973139 MMIO32 W 0x616f98 0x41020038 PDISPLAY+0x6f98 <= 0x41020038
+*/
+
+int
+nve0_hdmi_ctrl(struct nv50_disp_priv *priv, int head, int or, u32 data)
+{
+	/*if (!(data & NV84_DISP_SOR_HDMI_PWR_STATE_ON)) {
+		nv_mask(priv, 0x616f98 + hoff, 0x40000000, 0x00000000);
+		nv_mask(priv, 0x6167a4 + hoff, 0x00000001, 0x00000000);
+		nv_mask(priv, 0x616714 + hoff, 0x00000001, 0x00000000);
+		return 0;
+	}*/
+
+	/* AVI InfoFrame */
+	nv_mask(priv, 0x690400, 0x00000001, 0x00000001);
+	nv_wr32(priv, 0x690408, 0x000d0282);
+//	nv_wr32(priv, 0x69040c, 0x881800cf);
+	nv_wr32(priv, 0x69040c, 0x000000cf);
+	nv_wr32(priv, 0x690410, 0x00000000);
+	nv_wr32(priv, 0x690414, 0x00000000);
+	nv_wr32(priv, 0x690418, 0x00000000);
+	nv_mask(priv, 0x690400, 0x00000001, 0x00000001);
+
+	/* ??? InfoFrame? */
+	nv_mask(priv, 0x6904c0, 0x00000001, 0x00000001);
+	nv_wr32(priv, 0x6904cc, 0x00000010);
+	nv_mask(priv, 0x6904c0, 0x00000001, 0x00000001);
+
+	/* ??? */
+	nv_wr32(priv, 0x690480, 0x82000000);
+
+	/* HDMI_CTRL */
+	nv_mask(priv, 0x616f98, 0x401f007f, data);
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/nouveau/core/engine/disp/nv50.h b/drivers/gpu/drm/nouveau/core/engine/disp/nv50.h
index 1a88647..11b3cbe 100644
--- a/drivers/gpu/drm/nouveau/core/engine/disp/nv50.h
+++ b/drivers/gpu/drm/nouveau/core/engine/disp/nv50.h
@@ -71,6 +71,7 @@ int nvd0_hda_eld(struct nv50_disp_priv *, int, u8 *, u32);
 int nv84_hdmi_ctrl(struct nv50_disp_priv *, int, int, u32);
 int nva3_hdmi_ctrl(struct nv50_disp_priv *, int, int, u32);
 int nvd0_hdmi_ctrl(struct nv50_disp_priv *, int, int, u32);
+int nve0_hdmi_ctrl(struct nv50_disp_priv *, int, int, u32);
 
 int nv50_sor_mthd(struct nouveau_object *, u32, void *, u32);
 int nv50_sor_power(struct nv50_disp_priv *, int, u32);
diff --git a/drivers/gpu/drm/nouveau/core/engine/disp/nve0.c b/drivers/gpu/drm/nouveau/core/engine/disp/nve0.c
index 11328e3..1179909 100644
--- a/drivers/gpu/drm/nouveau/core/engine/disp/nve0.c
+++ b/drivers/gpu/drm/nouveau/core/engine/disp/nve0.c
@@ -245,7 +245,7 @@ nve0_disp_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
 	priv->dac.sense = nv50_dac_sense;
 	priv->sor.power = nv50_sor_power;
 	priv->sor.hda_eld = nvd0_hda_eld;
-	priv->sor.hdmi = nvd0_hdmi_ctrl;
+	priv->sor.hdmi = nve0_hdmi_ctrl;
 	return 0;
 }
 
-- 
2.1.0

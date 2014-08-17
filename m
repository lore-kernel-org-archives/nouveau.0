From: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
Subject: [PATCH 03/10] gm107/therm: add PWM fan support v2
Date: Sun, 17 Aug 2014 17:33:08 +0200
Message-ID: <1408289594-28587-3-git-send-email-martin.peres@free.fr>
References: <1408289594-28587-1-git-send-email-martin.peres@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1408289594-28587-1-git-send-email-martin.peres-GANU6spQydw@public.gmane.org>
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

v2: change the copyright ownership from "Nouveau Community" to myself, as per
Illia's recommendation.

Signed-off-by: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
---
 drm/Kbuild                    |  1 +
 drm/core/subdev/therm/gm107.c |  1 +
 nvkm/engine/device/gm100.c    |  4 +-
 nvkm/include/subdev/therm.h   |  1 +
 nvkm/subdev/therm/Makefile.am |  3 +-
 nvkm/subdev/therm/fan.c       |  9 ++++-
 nvkm/subdev/therm/gm107.c     | 93 +++++++++++++++++++++++++++++++++++++++++++
 nvkm/subdev/therm/nvd0.c      |  2 +-
 nvkm/subdev/therm/priv.h      |  2 +
 9 files changed, 109 insertions(+), 7 deletions(-)
 create mode 120000 drm/core/subdev/therm/gm107.c
 create mode 100644 nvkm/subdev/therm/gm107.c

diff --git a/drm/Kbuild b/drm/Kbuild
index 75aa5e3..c663181 100644
--- a/drm/Kbuild
+++ b/drm/Kbuild
@@ -191,6 +191,7 @@ nouveau-y += core/subdev/therm/nv50.o
 nouveau-y += core/subdev/therm/nv84.o
 nouveau-y += core/subdev/therm/nva3.o
 nouveau-y += core/subdev/therm/nvd0.o
+nouveau-y += core/subdev/therm/gm107.o
 nouveau-y += core/subdev/timer/base.o
 nouveau-y += core/subdev/timer/nv04.o
 nouveau-y += core/subdev/timer/gk20a.o
diff --git a/drm/core/subdev/therm/gm107.c b/drm/core/subdev/therm/gm107.c
new file mode 120000
index 0000000..aafc986
--- /dev/null
+++ b/drm/core/subdev/therm/gm107.c
@@ -0,0 +1 @@
+../../../../nvkm/subdev/therm/gm107.c
\ No newline at end of file
diff --git a/nvkm/engine/device/gm100.c b/nvkm/engine/device/gm100.c
index 377ec0b..136dd98 100644
--- a/nvkm/engine/device/gm100.c
+++ b/nvkm/engine/device/gm100.c
@@ -63,9 +63,7 @@ gm100_identify(struct nouveau_device *device)
 		device->oclass[NVDEV_SUBDEV_GPIO   ] =  nve0_gpio_oclass;
 		device->oclass[NVDEV_SUBDEV_I2C    ] =  nvd0_i2c_oclass;
 		device->oclass[NVDEV_SUBDEV_CLOCK  ] = &nve0_clock_oclass;
-#if 0
-		device->oclass[NVDEV_SUBDEV_THERM  ] = &nvd0_therm_oclass;
-#endif
+		device->oclass[NVDEV_SUBDEV_THERM  ] = &gm107_therm_oclass;
 		device->oclass[NVDEV_SUBDEV_MXM    ] = &nv50_mxm_oclass;
 		device->oclass[NVDEV_SUBDEV_DEVINIT] =  gm107_devinit_oclass;
 		device->oclass[NVDEV_SUBDEV_MC     ] =  gk20a_mc_oclass;
diff --git a/nvkm/include/subdev/therm.h b/nvkm/include/subdev/therm.h
index d4a6817..a437597 100644
--- a/nvkm/include/subdev/therm.h
+++ b/nvkm/include/subdev/therm.h
@@ -78,5 +78,6 @@ extern struct nouveau_oclass nv50_therm_oclass;
 extern struct nouveau_oclass nv84_therm_oclass;
 extern struct nouveau_oclass nva3_therm_oclass;
 extern struct nouveau_oclass nvd0_therm_oclass;
+extern struct nouveau_oclass gm107_therm_oclass;
 
 #endif
diff --git a/nvkm/subdev/therm/Makefile.am b/nvkm/subdev/therm/Makefile.am
index 460e4a0..b4f6da6 100644
--- a/nvkm/subdev/therm/Makefile.am
+++ b/nvkm/subdev/therm/Makefile.am
@@ -11,6 +11,7 @@ libtherm_la_SOURCES = base.c \
 		      nv50.c \
 		      nv84.c \
 		      nva3.c \
-		      nvd0.c
+		      nvd0.c \
+		      gm107.c
 
 include $(srcdir)/../Makefile.subdev
diff --git a/nvkm/subdev/therm/fan.c b/nvkm/subdev/therm/fan.c
index 016990a..402c9be 100644
--- a/nvkm/subdev/therm/fan.c
+++ b/nvkm/subdev/therm/fan.c
@@ -31,6 +31,8 @@
 #include <subdev/gpio.h>
 #include <subdev/timer.h>
 
+#include <subdev/bios/fan.h>
+
 static int
 nouveau_fan_update(struct nouveau_fan *fan, bool immediate, int target)
 {
@@ -275,8 +277,11 @@ nouveau_therm_fan_ctor(struct nouveau_therm *therm)
 	/* other random init... */
 	nouveau_therm_fan_set_defaults(therm);
 	nvbios_perf_fan_parse(bios, &priv->fan->perf);
-	if (nvbios_therm_fan_parse(bios, &priv->fan->bios))
-		nv_error(therm, "parsing the thermal table failed\n");
+	if (nvbios_fan_parse(bios, &priv->fan->bios)) {
+		nv_debug(therm, "parsing the fan table failed\n");
+		if (nvbios_therm_fan_parse(bios, &priv->fan->bios))
+			nv_error(therm, "parsing both fan tables failed\n");
+	}
 	nouveau_therm_fan_safety_checks(therm);
 	return 0;
 }
diff --git a/nvkm/subdev/therm/gm107.c b/nvkm/subdev/therm/gm107.c
new file mode 100644
index 0000000..2c58733
--- /dev/null
+++ b/nvkm/subdev/therm/gm107.c
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
+ * Authors: Martin Peres, Ben Skeggs
+ */
+
+#include "priv.h"
+
+struct gm107_therm_priv {
+	struct nouveau_therm_priv base;
+};
+
+static int
+gm107_fan_pwm_ctrl(struct nouveau_therm *therm, int line, bool enable)
+{
+	/* nothing to do, it seems hardwired */
+	return 0;
+}
+
+static int
+gm107_fan_pwm_get(struct nouveau_therm *therm, int line, u32 *divs, u32 *duty)
+{
+	*divs = nv_rd32(therm, 0x10eb20) & 0x1fff;
+	*duty = nv_rd32(therm, 0x10eb24) & 0x1fff;
+	return 0;
+}
+
+static int
+gm107_fan_pwm_set(struct nouveau_therm *therm, int line, u32 divs, u32 duty)
+{
+	nv_mask(therm, 0x10eb10, 0x1fff, divs); /* keep the high bits */
+	nv_wr32(therm, 0x10eb14, duty | 0x80000000);
+	return 0;
+}
+
+static int
+gm107_fan_pwm_clock(struct nouveau_therm *therm, int line)
+{
+	return nv_device(therm)->crystal * 1000;
+}
+
+static int
+gm107_therm_ctor(struct nouveau_object *parent,
+		struct nouveau_object *engine,
+		struct nouveau_oclass *oclass, void *data, u32 size,
+		struct nouveau_object **pobject)
+{
+	struct gm107_therm_priv *priv;
+	int ret;
+
+	ret = nouveau_therm_create(parent, engine, oclass, &priv);
+	*pobject = nv_object(priv);
+	if (ret)
+		return ret;
+
+	priv->base.base.pwm_ctrl = gm107_fan_pwm_ctrl;
+	priv->base.base.pwm_get = gm107_fan_pwm_get;
+	priv->base.base.pwm_set = gm107_fan_pwm_set;
+	priv->base.base.pwm_clock = gm107_fan_pwm_clock;
+	priv->base.base.temp_get = nv84_temp_get;
+	priv->base.base.fan_sense = nva3_therm_fan_sense;
+	priv->base.sensor.program_alarms = nouveau_therm_program_alarms_polling;
+	return nouveau_therm_preinit(&priv->base.base);
+}
+
+struct nouveau_oclass
+gm107_therm_oclass = {
+	.handle = NV_SUBDEV(THERM, 0x117),
+	.ofuncs = &(struct nouveau_ofuncs) {
+		.ctor = gm107_therm_ctor,
+		.dtor = _nouveau_therm_dtor,
+		.init = nvd0_therm_init,
+		.fini = nv84_therm_fini,
+	},
+};
diff --git a/nvkm/subdev/therm/nvd0.c b/nvkm/subdev/therm/nvd0.c
index bbf117b..04bb84f 100644
--- a/nvkm/subdev/therm/nvd0.c
+++ b/nvkm/subdev/therm/nvd0.c
@@ -114,7 +114,7 @@ nvd0_fan_pwm_clock(struct nouveau_therm *therm, int line)
 		return nv_device(therm)->crystal * 1000 / 10;
 }
 
-static int
+int
 nvd0_therm_init(struct nouveau_object *object)
 {
 	struct nvd0_therm_priv *priv = (void *)object;
diff --git a/nvkm/subdev/therm/priv.h b/nvkm/subdev/therm/priv.h
index 916fca5..4262d1d 100644
--- a/nvkm/subdev/therm/priv.h
+++ b/nvkm/subdev/therm/priv.h
@@ -149,6 +149,8 @@ int nv84_therm_fini(struct nouveau_object *object, bool suspend);
 
 int nva3_therm_fan_sense(struct nouveau_therm *);
 
+int nvd0_therm_init(struct nouveau_object *object);
+
 int nouveau_fanpwm_create(struct nouveau_therm *, struct dcb_gpio_func *);
 int nouveau_fantog_create(struct nouveau_therm *, struct dcb_gpio_func *);
 int nouveau_fannil_create(struct nouveau_therm *);
-- 
2.0.0

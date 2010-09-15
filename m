From: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
Subject: [RFC] Initial power management vbios parsing,
 voltage & clock setting to nouveau.
Date: Wed, 15 Sep 2010 11:57:22 +0200
Message-ID: <4C909882.2080702@free.fr>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------090608000307020004070702"
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

This is a multi-part message in MIME format.
--------------090608000307020004070702
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

  Hi folks,

I've been messing with PM management for a few days and I've accumulated 
an interesting volume of code.

I am now interested in comments on the overall architecture. For 
example, in this patch, I implement a proposition on how to split 
nouveau_bios.c I would really like you to comment. I have also 
introduced nouveau_pm.[hc] along with vbios/vbios_pm.[ch].

Another thing I would be interested in is the vbios parsing testing.
At the moment, it should work from nv40 to at least nv96 but it has 
really been tested only on an nv86 and an nv96. I'm expecting a lot of 
bug report.

Power mode setting is _not recommended for anything other than dev 
testing_.
There is still work to be done:
- Clock & voltage: It needs testing.
- Memory timings: It is being REed by RSpliet (please help him, he 
should be able to provide directions).
- Fan control: I have no information on this.

Despite these lacks, you should be able to safely try to downclock your 
card though. That's good news for laptop users, isn't it?

Please acknowledge that this work is almost entirely based on others's 
RE work and documentation work. Xexaxo's work has been impressive. 
RSpliet is also to be thanked as he is working on getting memory timing 
support. Darktama has also done some nice RE, we'll see how to merge his 
work. My work here has just been to implement the docs.

On a side note, I would like to say I will be out for 5 days to the XDS 
2010.
So, if you have questions I should discuss with some devs there, feel 
free to ask.

Best regards,

Martin Peres (aka mupuf), an happy new nouveau dev

---- How to help for the vbios parsing ?----
Thanks for wanting to help :)

First, grab the patch I've joined to this mail. It should cleanly apply 
on nouveau's master branch.
Compile, Install & Reboot.

$ cat /sys/class/drm/card0/device/pm_status
and compare the values to
# nvclock -i

If it differs, please follow the instructions here:
http://nouveau.freedesktop.org/wiki/PowerManagementDumps
If it works, then, you may want to try changing the clocks.

---- How to test clock/voltage setting ?----
Do not attempt anything if the vbios parsing is wrong, really.
If it did work as intended, you can continue.

** Warning ** Do not try to upclock your card, nothing good will happen.
                       While playing with clocks, always check the 
current temperature

First, kill X (for safety reasons).
Then look for the wanted mode by doing:
$ cat /sys/class/drm/card0/device/pm_mode

It should give you a result like:
--- PM Modes ---
  0: core 169 MHz/shader 338 MHz/memory 100 MHz/1150 mV
*1: core 275 MHz/shader 550 MHz/memory 301 MHz/1150 mV
  2: core 400 MHz/shader 800 MHz/memory 600 MHz/1200 mV

The * means it is the currently used mode (it may also not be detected).

In this example, you should only stay between mode 0 and 1.
To set the wanted PM mode, please do so:
# echo 0 > /sys/class/drm/card0/device/pm_mode
The command above will change the mode to the first mode.

There is another file for voltage control at 
/sys/class/drm/card0/device/pm_voltage that works the exact same way as 
pm_mode.

The other sysfs entries (temperature related) should be useless to you 
as they are just here for future work).

You're done, have fun.


--------------090608000307020004070702
Content-Type: text/x-patch;
 name="0001-Add-initial-power-management-vbios-parsing-voltage-c.patch"
Content-Disposition: attachment;
 filename*0="0001-Add-initial-power-management-vbios-parsing-voltage-c.pa";
 filename*1="tch"
Content-Transfer-Encoding: quoted-printable

From 38aba214268ecd0263b2a49af0698d84f6a364e6 Mon Sep 17 00:00:00 2001
From: Martin Peres <martin.peres-Iz16wY1oaNPLSKGbIzaifA@public.gmane.org>
Date: Wed, 15 Sep 2010 12:59:00 +0200
Subject: [PATCH] Add initial power management vbios parsing, voltage & cl=
ock setting to nouveau.
 It is not intented to be used by end-users (if it should be used at all)=
,
 this commit is meant for devs to check the actual work and comment on it=
.

So, you may wondering what I'm asking you. I simply ask you to check the =
code
and see if you could improve this design.
Also, you can try:
$ cat /sys/class/drm/card0/device/pm_status
and comparing it to "# nvclock -i".
If it doesn't match, please provide us with power management dumps & kern=
el logs:
http://nouveau.freedesktop.org/wiki/PowerManagementDumps
If it does match, report your success story also :)

Known issues: As no memory timing parsing/get/set is implemented yet (RSP=
liet
has been working on it but it is not complete yet), your card will likely=
 hang
if you upclock the memory. Lowering the clocks should work fine though:
echo 0 > /sys/class/drm/card0/device/pm_mode

WARNING: Use at your own risks. Please stop your machine after having fun=
 with
this and reboot it after a minute in order to flush everything in the car=
d.
Keep in mind how experimental it is ;)

Ack: Most of this work is based on xexaxo's documentation work and useful
advices.
---
 drivers/gpu/drm/nouveau/Makefile         |    2 +-
 drivers/gpu/drm/nouveau/nouveau_bios.c   |   67 +++-
 drivers/gpu/drm/nouveau/nouveau_bios.h   |   41 ++
 drivers/gpu/drm/nouveau/nouveau_biosP.h  |   44 ++
 drivers/gpu/drm/nouveau/nouveau_drv.h    |    2 +
 drivers/gpu/drm/nouveau/nouveau_pm.c     |  677 ++++++++++++++++++++++++=
++++++
 drivers/gpu/drm/nouveau/nouveau_pm.h     |    9 +
 drivers/gpu/drm/nouveau/nouveau_state.c  |    9 +
 drivers/gpu/drm/nouveau/vbios/vbios_pm.c |  358 ++++++++++++++++
 drivers/gpu/drm/nouveau/vbios/vbios_pm.h |   34 ++
 10 files changed, 1224 insertions(+), 19 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/nouveau_biosP.h
 create mode 100644 drivers/gpu/drm/nouveau/nouveau_pm.c
 create mode 100644 drivers/gpu/drm/nouveau/nouveau_pm.h
 create mode 100644 drivers/gpu/drm/nouveau/vbios/vbios_pm.c
 create mode 100644 drivers/gpu/drm/nouveau/vbios/vbios_pm.h

diff --git a/drivers/gpu/drm/nouveau/Makefile b/drivers/gpu/drm/nouveau/M=
akefile
index d6cfbf2..ec4b9f4 100644
--- a/drivers/gpu/drm/nouveau/Makefile
+++ b/drivers/gpu/drm/nouveau/Makefile
@@ -23,7 +23,7 @@ nouveau-y :=3D nouveau_drv.o nouveau_state.o nouveau_ch=
annel.o nouveau_mem.o \
              nv04_dac.o nv04_dfp.o nv04_tv.o nv17_tv.o nv17_tv_modes.o \
              nv04_crtc.o nv04_display.o nv04_cursor.o nv04_fbcon.o \
              nv10_gpio.o nv50_gpio.o \
-	     nv50_calc.o
+	     nv50_calc.o nouveau_pm.o vbios/vbios_pm.o
=20
 nouveau-$(CONFIG_DRM_NOUVEAU_DEBUG) +=3D nouveau_debugfs.o
 nouveau-$(CONFIG_COMPAT) +=3D nouveau_ioc32.o
diff --git a/drivers/gpu/drm/nouveau/nouveau_bios.c b/drivers/gpu/drm/nou=
veau/nouveau_bios.c
index ce3d98f..8aa3c4e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bios.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bios.c
@@ -30,21 +30,8 @@
=20
 #include <linux/io-mapping.h>
=20
-/* these defines are made up */
-#define NV_CIO_CRE_44_HEADA 0x0
-#define NV_CIO_CRE_44_HEADB 0x3
-#define FEATURE_MOBILE 0x10	/* also FEATURE_QUADRO for BMP */
-#define LEGACY_I2C_CRT 0x80
-#define LEGACY_I2C_PANEL 0x81
-#define LEGACY_I2C_TV 0x82
-
-#define EDID1_LEN 128
-
-#define BIOSLOG(sip, fmt, arg...) NV_DEBUG(sip->dev, fmt, ##arg)
-#define LOG_OLD_VALUE(x)
-
-#define ROM16(x) le16_to_cpu(*(uint16_t *)&(x))
-#define ROM32(x) le32_to_cpu(*(uint32_t *)&(x))
+#include "vbios/vbios_pm.h"
+#include "nouveau_biosP.h"
=20
 struct init_exec {
 	bool execute;
@@ -669,8 +656,8 @@ nv50_pll_set(struct drm_device *dev, uint32_t reg, ui=
nt32_t clk)
 	return 0;
 }
=20
-static int
-setPLL(struct nvbios *bios, uint32_t reg, uint32_t clk)
+int
+setPLL(struct nvbios *bios, uint32_t reg, uint32_t clk) /* used to be st=
atic */
 {
 	struct drm_device *dev =3D bios->dev;
 	struct drm_nouveau_private *dev_priv =3D dev->dev_private;
@@ -5396,6 +5383,40 @@ parse_bit_displayport_tbl_entry(struct drm_device =
*dev, struct nvbios *bios,
 	return 0;
 }
=20
+static int
+parse_bit_pmtable_tbl_entry(struct drm_device *dev, struct nvbios *bios,
+				struct bit_entry *bitentry)
+{
+	NV_INFO(dev, "Bios version=3D0x%x BIT P version is %i\n",
+			bios->major_version, bitentry->id[1]);
+
+	/* Set the default values */
+	bios->pm.pm_modes_tbl_ptr =3D 0;
+	bios->pm.voltage_tbl_ptr =3D 0;
+	bios->pm.temperature_tbl_ptr =3D 0;
+
+	if (!bitentry->offset) {
+		NV_ERROR(dev, "Invalid pointer to the PM table. PM disabled.\n");
+		return -EINVAL;
+	}
+
+	/* Get the pointers to the tables */
+	if (bitentry->id[1]=3D=3D1) {
+		bios->pm.pm_modes_tbl_ptr =3D ROM16(bios->data[bitentry->offset+0]);
+		bios->pm.temperature_tbl_ptr =3D ROM16(bios->data[bitentry->offset+12]=
);
+		bios->pm.voltage_tbl_ptr =3D ROM16(bios->data[bitentry->offset+16]);
+	} else if (bitentry->id[1]=3D=3D2) {
+		bios->pm.pm_modes_tbl_ptr =3D ROM16(bios->data[bitentry->offset+0]);
+		bios->pm.voltage_tbl_ptr =3D ROM16(bios->data[bitentry->offset+12]);
+		bios->pm.temperature_tbl_ptr =3D ROM16(bios->data[bitentry->offset+16]=
);
+	} else {
+		NV_ERROR(dev, "BIT-P entry version 0x%x is not supported. PM disabled.=
\n",
+				 bitentry->id[1]);
+	}
+
+	return 0;
+}
+
 struct bit_table {
 	const char id;
 	int (* const parse_fn)(struct drm_device *, struct nvbios *, struct bit=
_entry *);
@@ -5457,7 +5478,7 @@ parse_bit_structure(struct nvbios *bios, const uint=
16_t bitoffset)
 	parse_bit_table(bios, bitoffset, &BIT_TABLE('T', tmds));
 	parse_bit_table(bios, bitoffset, &BIT_TABLE('U', U));
 	parse_bit_table(bios, bitoffset, &BIT_TABLE('d', displayport));
-
+	parse_bit_table(bios, bitoffset, &BIT_TABLE('P', pmtable));
 	return 0;
 }
=20
@@ -5503,6 +5524,10 @@ static int parse_bmp_structure(struct drm_device *=
dev, struct nvbios *bios, unsi
 	 *
 	 * offset + 142: PLL limits table pointer
 	 *
+	 * offset + 148: pm-modes table pointer
+	 *
+	 * offset + 152: voltage table pointer
+	 *
 	 * offset + 156: minimum pixel clock for LVDS dual link
 	 */
=20
@@ -5659,6 +5684,12 @@ static int parse_bmp_structure(struct drm_device *=
dev, struct nvbios *bios, unsi
 	if (bmplength > 143)
 		bios->pll_limit_tbl_ptr =3D ROM16(bmp[142]);
=20
+	if (bmplength > 148)
+		bios->pm.pm_modes_tbl_ptr =3D ROM16(bmp[148]);
+
+	if (bmplength > 152)
+		bios->pm.voltage_tbl_ptr =3D ROM16(bmp[152]);
+
 	if (bmplength > 157)
 		bios->fp.duallink_transition_clk =3D ROM16(bmp[156]) * 10;
=20
diff --git a/drivers/gpu/drm/nouveau/nouveau_bios.h b/drivers/gpu/drm/nou=
veau/nouveau_bios.h
index c1de2f3..f2252d4 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bios.h
+++ b/drivers/gpu/drm/nouveau/nouveau_bios.h
@@ -210,6 +210,28 @@ struct pll_lims {
 	int refclk;
 };
=20
+struct pm_mode_info {
+	uint8_t id_enabled;
+	uint8_t fan_duty;
+	uint8_t voltage; /* *10mV */
+	uint32_t coreclk; /* kHz */
+	uint32_t shaderclk; /* kHz */
+	uint32_t memclk; /* kHz */
+};
+
+struct pm_voltage_entry {
+	uint8_t voltage; /* *10mV */
+	uint8_t index;
+};
+
+struct pm_temp_sensor_setup {
+	uint16_t temp_constant;
+	int16_t offset_mult;
+	uint16_t offset_div;
+	uint16_t slope_mult;
+	uint16_t slope_div;
+};
+
 struct nvbios {
 	struct drm_device *dev;
=20
@@ -299,6 +321,25 @@ struct nvbios {
=20
 		uint16_t lvds_single_a_script_ptr;
 	} legacy;
+
+	struct {
+		uint16_t pm_modes_tbl_ptr;
+		uint16_t voltage_tbl_ptr;
+		uint16_t temperature_tbl_ptr;
+
+		uint8_t mode_info_count;
+		struct pm_mode_info pm_modes[4];
+
+		uint8_t voltage_entry_count;
+		uint8_t voltage_mask;
+		struct pm_voltage_entry* voltages;
+
+		/* Temperature */
+		uint16_t temp_critical;
+		uint16_t temp_throttling;
+		uint16_t temp_fan_boost;
+		struct pm_temp_sensor_setup sensor_setup;
+	} pm;
 };
=20
 #endif
diff --git a/drivers/gpu/drm/nouveau/nouveau_biosP.h b/drivers/gpu/drm/no=
uveau/nouveau_biosP.h
new file mode 100644
index 0000000..222e17a
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nouveau_biosP.h
@@ -0,0 +1,44 @@
+/*
+ * Copyright 2005-2006 Erik Waling
+ * Copyright 2006 Stephane Marchesin
+ * Copyright 2007-2009 Stuart Bennett
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining=
 a
+ * copy of this software and associated documentation files (the "Softwa=
re"),
+ * to deal in the Software without restriction, including without limita=
tion
+ * the rights to use, copy, modify, merge, publish, distribute, sublicen=
se,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be includ=
ed in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRE=
SS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILI=
TY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SH=
ALL
+ * THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
+ * WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OU=
T OF
+ * OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN TH=
E
+ * SOFTWARE.
+ */
+
+#ifndef __NOUVEAU_BIOSP_H__
+#define __NOUVEAU_BIOSP_H__
+
+/* these defines are made up */
+#define NV_CIO_CRE_44_HEADA 0x0
+#define NV_CIO_CRE_44_HEADB 0x3
+#define FEATURE_MOBILE 0x10	/* also FEATURE_QUADRO for BMP */
+#define LEGACY_I2C_CRT 0x80
+#define LEGACY_I2C_PANEL 0x81
+#define LEGACY_I2C_TV 0x82
+
+#define EDID1_LEN 128
+
+#define BIOSLOG(sip, fmt, arg...) NV_DEBUG(sip->dev, fmt, ##arg)
+#define LOG_OLD_VALUE(x)
+
+#define ROM16(x) le16_to_cpu(*(uint16_t *)&(x))
+#define ROM32(x) le32_to_cpu(*(uint32_t *)&(x))
+
+#endif
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouv=
eau/nouveau_drv.h
index b7440f8..d7f86bb 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -855,6 +855,7 @@ extern struct dcb_connector_table_entry *
 nouveau_bios_connector_entry(struct drm_device *, int index);
 extern int get_pll_limits(struct drm_device *, uint32_t limit_match,
 			  struct pll_lims *);
+extern int setPLL(struct nvbios *bios, uint32_t reg, uint32_t clk);
 extern int nouveau_bios_run_display_table(struct drm_device *,
 					  struct dcb_entry *,
 					  uint32_t script, int pxclk);
@@ -868,6 +869,7 @@ extern int run_tmds_table(struct drm_device *, struct=
 dcb_entry *,
 			  int head, int pxclk);
 extern int call_lvds_script(struct drm_device *, struct dcb_entry *, int=
 head,
 			    enum LVDS_script, int pxclk);
+extern int vbios_parse_pmtable(struct drm_device *dev);
=20
 /* nouveau_ttm.c */
 int nouveau_ttm_global_init(struct drm_nouveau_private *);
diff --git a/drivers/gpu/drm/nouveau/nouveau_pm.c b/drivers/gpu/drm/nouve=
au/nouveau_pm.c
new file mode 100644
index 0000000..ef49cec
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nouveau_pm.c
@@ -0,0 +1,677 @@
+#include "drmP.h"
+#include "nouveau_pm.h"
+
+#include "nouveau_drv.h"
+#include "nouveau_bios.h"
+
+static uint32_t
+nouveau_get_pll_refclk(struct drm_device *dev, uint32_t reg)
+{
+	struct pll_lims pll;
+	if (get_pll_limits(dev, reg, &pll))
+		NV_ERROR(dev, "Failed to get pll limits\n");
+=09
+	return pll.refclk;
+}
+
+static void
+nouveau_parse_clock_regs(uint32_t reg0, uint32_t reg1,
+					   uint32_t *m, uint32_t *n, uint32_t *p) {
+	*p =3D (reg0 & 0x70000) >> 16;
+	*m =3D reg1 & 0xff;
+	*n =3D (reg1 & 0xff00) >> 8;
+}
+
+static uint32_t
+nouveau_calculate_frequency(struct drm_device *dev,
+						  uint32_t refclk, uint32_t reg0, uint32_t reg1)
+{
+	uint32_t p,m,n;
+	nouveau_parse_clock_regs(reg0, reg1, &m, &n, &p);
+
+	/*NV_INFO(dev, "nouveau_calculate_frequency: ref_clk=3D0x%x, reg0=3D0x%=
x, reg1=3D0x%x, p=3D0x%x, m=3D0x%x, n=3D0x%x\n",
+			refclk, reg0, reg1, p, m, n);*/
+
+	return ((n*refclk/m) >> p);
+}
+
+static uint32_t
+nouveau_get_core_clocks(struct drm_device *dev)
+{
+	uint32_t reg0=3Dnv_rd32(dev, 0x4028);
+	uint32_t reg1=3Dnv_rd32(dev, 0x402c);
+	uint32_t refclk=3Dnouveau_get_pll_refclk(dev, 0x4028);
+
+	return nouveau_calculate_frequency(dev, refclk, reg0, reg1);
+}
+
+static uint32_t
+nouveau_set_core_clocks(struct drm_device *dev, uint32_t clock_speed)
+{
+	return setPLL(dev->dev_private, 0x4028, clock_speed);
+}
+
+static uint32_t
+nouveau_get_shader_clocks(struct drm_device *dev)
+{
+	uint32_t reg0=3Dnv_rd32(dev, 0x4020);
+	uint32_t reg1=3Dnv_rd32(dev, 0x4024);
+	uint32_t refclk=3Dnouveau_get_pll_refclk(dev, 0x4020);
+
+	return nouveau_calculate_frequency(dev, refclk, reg0, reg1);
+}
+
+static uint32_t
+nouveau_set_shader_clocks(struct drm_device *dev, uint32_t clock_speed)
+{
+	return setPLL(dev->dev_private, 0x4020, clock_speed);
+}
+
+static uint32_t
+nouveau_get_core_unknown_clocks(struct drm_device *dev)
+{
+	uint32_t reg0=3Dnv_rd32(dev, 0x4030);
+	uint32_t reg1=3Dnv_rd32(dev, 0x4034);
+	uint32_t refclk=3Dnouveau_get_pll_refclk(dev, 0x4030);
+
+	return nouveau_calculate_frequency(dev, refclk, reg0, reg1);
+}
+
+/*static uint32_t
+nouveau_set_core_unknown_clocks(struct drm_device *dev, uint32_t clock_s=
peed)
+{
+	return setPLL(dev->dev_private, 0x4030, clock_speed);
+}*/
+
+static uint32_t
+nouveau_get_memory_clocks(struct drm_device *dev)
+{
+	uint32_t reg0=3Dnv_rd32(dev, 0x4008);
+	uint32_t reg1=3Dnv_rd32(dev, 0x400c);
+	uint32_t refclk=3Dnouveau_get_pll_refclk(dev, 0x4008);
+
+	return nouveau_calculate_frequency(dev, refclk, reg0, reg1);
+}
+
+static uint32_t
+nouveau_set_memory_clocks(struct drm_device *dev, uint32_t clock_speed)
+{
+	return setPLL(dev->dev_private, 0x4008, clock_speed);
+}
+
+static uint32_t
+nouveau_nv40_sensor_setup(struct drm_device *dev)
+{
+	struct drm_nouveau_private *dev_p =3D dev->dev_private;
+	struct pm_temp_sensor_setup *sensor_setup =3D &dev_p->vbios.pm.sensor_s=
etup;
+	uint32_t offset =3D sensor_setup->offset_mult / sensor_setup->offset_di=
v;
+	uint32_t sensor_calibration;
+=09
+	/* set up the sensors */
+	sensor_calibration =3D 120 - offset - sensor_setup->temp_constant;
+	sensor_calibration =3D sensor_calibration * sensor_setup->slope_div /
+							sensor_setup->slope_mult;
+	if (dev_p->chipset >=3D 0x46) {
+		sensor_calibration |=3D 0x80000000;
+	} else {
+		sensor_calibration |=3D 0x10000000;
+	}
+	nv_wr32(dev, 0x0015b0, sensor_calibration);
+=09
+	/* Wait for the sensor to update */
+	msleep(5);
+=09
+	/* read */
+	return nv_rd32(dev, 0x0015b4);
+}
+
+static uint32_t
+nouveau_get_gpu_temperature(struct drm_device *dev)
+{
+	struct drm_nouveau_private *dev_p =3D dev->dev_private;
+
+	if (dev_p->chipset >=3D 0x84) {
+		return nv_rd32(dev, 0x20400);
+	} else if(dev_p->chipset >=3D 0x40) {
+		struct pm_temp_sensor_setup *sensor_setup =3D &dev_p->vbios.pm.sensor_=
setup;
+		uint32_t offset =3D sensor_setup->offset_mult / sensor_setup->offset_d=
iv;
+		uint32_t temp;
+
+		if(dev_p->chipset >=3D 0x50) {
+			temp =3D nv_rd32(dev, 0x20008);
+		} else {
+			temp =3D nv_rd32(dev, 0x0015b4);
+		}
+
+		/* Setup the sensor if the temperature is 0 */
+		if (temp =3D=3D 0)
+			temp =3D nouveau_nv40_sensor_setup(dev);
+
+		temp =3D temp * sensor_setup->slope_mult / sensor_setup->slope_div;
+		temp =3D temp + offset + sensor_setup->temp_constant;
+
+		/* TODO: Check the returned value. Please report any issue.*/
+	=09
+		return temp;=20
+	} else {
+		NV_ERROR(dev, "Temperature cannot be retrieved from an nv%x card\n", d=
ev_p->chipset);
+		return 0;
+	}
+}
+
+/*
+ * The voltage returned is in 10mV
+ *
+ * Due to masking the index (before writing it) it's possible that the f=
uncion
+ * does not return the correct voltage
+ */
+static uint32_t
+nouveau_get_voltage(struct drm_device *dev)
+{
+	struct drm_nouveau_private *dev_p =3D dev->dev_private;
+	uint8_t voltage_entry_count =3D dev_p->vbios.pm.voltage_entry_count;
+	uint32_t tmp_index, index, i, reg;
+
+	if (dev_p->chipset < 0x50) {
+		NV_INFO(dev, "PM: Voltage readings are not currently supported"
+					 " on chipset nv%x\n",
+				dev_p->chipset);
+		return -EINVAL;
+	}
+
+	tmp_index =3D (nv_rd32(dev, 0xe104) & ~0x666fffff) >> 20;
+	/* A lovely conversion of the voltage index
+	 * Feel free to introduce a better solution
+	 */
+	switch (tmp_index) {
+	case 0x000:
+		index =3D 0;
+		break;
+	case 0x001:
+		index =3D 1;
+		break;
+	case 0x010:
+		index =3D 2;
+		break;
+	case 0x011:
+		index =3D 3;
+		break;
+	case 0x100:
+		index =3D 4;
+		break;
+	case 0x101:
+		index =3D 5;
+		break;
+	case 0x110:
+		index =3D 6;
+		break;
+	case 0x111:
+		index =3D 7;
+		break;
+	default:
+		index =3D 0xfe;
+	}
+
+	for (i =3D 0; i < voltage_entry_count; i++) {
+		if (dev_p->vbios.pm.voltages[i].index =3D=3D index)
+			return dev_p->vbios.pm.voltages[i].voltage;
+	}
+
+	/* None found printf message and exit */
+	reg =3D dev_p->chipset>=3D0x50?0xe104:0x60081c;
+	NV_ERROR(dev, "PM: The current voltage's id used by the card is unknown=
."
+				  "Please report reg 0x%x=3D0x%x to nouveau devs.\n",
+				  reg, nv_rd32(dev, reg));
+			=09
+	return -EINVAL;
+}
+
+/*
+ * The voltage should be in 10mV
+ */
+static uint32_t
+nouveau_set_voltage(struct drm_device *dev, uint8_t voltage)
+{
+	struct drm_nouveau_private *dev_p =3D dev->dev_private;
+	uint8_t voltage_entry_count =3D dev_p->vbios.pm.voltage_entry_count;
+	uint8_t voltage_mask =3D dev_p->vbios.pm.voltage_mask;
+	uint32_t tmp_index, i;
+
+	if (dev_p->chipset < 0x50) {
+		NV_INFO(dev, "PM: Voltage writes are not currently supported"
+					 " on chipset nv%x\n",
+				dev_p->chipset);
+		return -EINVAL;
+	}
+
+	if (!voltage) {
+		NV_INFO(dev, "PM: voltage should not be zero - Aborting \n");
+		return 0;
+	}
+	if (nouveau_get_voltage(dev) =3D=3D voltage) {
+		NV_INFO(dev, "PM: The same voltage has already been set\n");
+		return 0;
+	}
+
+	for (i =3D 0; i < voltage_entry_count; i++) {
+		if (dev_p->vbios.pm.voltages[i].voltage =3D=3D voltage) {
+			switch (dev_p->vbios.pm.voltages[i].index & voltage_mask) {
+			case 0:
+				tmp_index =3D 0x000;
+				break;
+			case 1:
+				tmp_index =3D 0x001;
+				break;
+			case 2:
+				tmp_index =3D 0x010;
+				break;
+			case 3:
+				tmp_index =3D 0x011;
+				break;
+			case 4:
+				tmp_index =3D 0x100;
+				break;
+/* The following are unconfirmed
+ * XXX: Is there a VID over 8?
+ */
+			case 5:
+				tmp_index =3D 0x101;
+				break;
+			case 6:
+				tmp_index =3D 0x110;
+				break;
+			case 7:
+				tmp_index =3D 0x111;
+				break;
+			default:
+				NV_ERROR(dev, "PM: Voltage index %d does not appear to be valid."
+							  "Please report to nouveau devs\n",
+							  dev_p->vbios.pm.voltages[i].index);
+				return -EINVAL;
+			}
+			nv_wr32(dev, 0xe104, (nv_rd32(dev, 0xe104)&0x666fffff) | (tmp_index<<=
 20));
+			return 0;
+		}
+	}
+	/* None found printf message and exit */
+	NV_ERROR(dev, "The specified Voltage %dmV does not have a index\n",
+			 voltage*10);
+	return -EINVAL;
+}
+
+/******************************************
+ *              Sysfs Fun                 *
+ *****************************************/
+
+static int
+nouveau_is_the_current_pm_entry(struct drm_device *dev,
+							  struct pm_mode_info* pm_mode)
+{
+	uint32_t cur_gpu_clock =3D nouveau_get_core_clocks(dev);
+
+	uint32_t clock_diff =3D pm_mode->coreclk - cur_gpu_clock;
+	clock_diff =3D clock_diff>0?clock_diff:-clock_diff;
+
+	return clock_diff<pm_mode->coreclk/100;
+}
+
+static ssize_t
+nouveau_pm_mode_to_string(struct drm_device *dev, unsigned id,
+						char *buf, ssize_t len)
+{
+	struct drm_nouveau_private *dev_p =3D dev->dev_private;
+	struct pm_mode_info* pm_mode;
+
+	if (id >=3D dev_p->vbios.pm.mode_info_count)
+		return 0;
+
+	pm_mode =3D &dev_p->vbios.pm.pm_modes[id];
+=09
+	return snprintf(buf, len, "%s%u: core %u MHz/shader %u MHz/memory %u MH=
z/%u mV\n",
+					nouveau_is_the_current_pm_entry(dev, pm_mode)?"*":" ",
+					id, pm_mode->coreclk/1000, pm_mode->shaderclk/1000,
+					pm_mode->memclk/1000, pm_mode->voltage*10);
+}
+
+static ssize_t
+nouveau_voltage_to_string(struct drm_device *dev, unsigned id,
+						char *buf, ssize_t len)
+{
+	struct drm_nouveau_private *dev_p =3D dev->dev_private;
+	struct pm_voltage_entry* v_entry;
+
+	if (id >=3D dev_p->vbios.pm.voltage_entry_count)
+		return 0;
+
+	v_entry =3D &dev_p->vbios.pm.voltages[id];
+
+	return snprintf(buf, len, "%s%u: %u mV\n",
+					v_entry->voltage=3D=3Dnouveau_get_voltage(dev)?"*":" ",
+					id,
+					v_entry->voltage*10);
+}
+
+static ssize_t
+nouveau_sysfs_get_pm_status(struct device *dev,
+				    struct device_attribute *attr,
+				    char *buf)
+{
+	struct drm_device *ddev =3D pci_get_drvdata(to_pci_dev(dev));
+	struct drm_nouveau_private *dev_p =3D ddev->dev_private;
+	int ret_length=3D0, i=3D0;
+
+	ret_length +=3D snprintf(buf, PAGE_SIZE, "--- Clocks ---\n"
+									"Core    : %u kHz\n"
+									"Core-UNK: %u kHz\n"
+									"Shader  : %u kHz\n"
+									"Memory  : %u kHz\n"
+									"\n"
+									"--- Temperatures ---\n"
+									"Core    : %u =C2=B0C\n"
+									"\n"
+									"Fan boost temp     : %u =C2=B0C\n"
+									"GPU throttling temp: %u =C2=B0C\n"
+									"GPU critical temp  : %u =C2=B0C\n"
+									"\n"
+									"--- Voltages ---\n",
+									nouveau_get_core_clocks(ddev),
+									nouveau_get_core_unknown_clocks(ddev),
+									nouveau_get_shader_clocks(ddev),
+									nouveau_get_memory_clocks(ddev),
+									nouveau_get_gpu_temperature(ddev),
+									dev_p->vbios.pm.temp_fan_boost,
+									dev_p->vbios.pm.temp_throttling,
+									dev_p->vbios.pm.temp_critical
+					);
+
+	for (i=3D0; i<dev_p->vbios.pm.voltage_entry_count; i++)
+		ret_length +=3D nouveau_voltage_to_string(ddev, i,
+											 buf+ret_length, PAGE_SIZE-ret_length);
+
+	ret_length +=3D snprintf(buf+ret_length, PAGE_SIZE-ret_length,
+						   "\n--- PM Modes ---\n");
+
+	for (i=3D0; i<dev_p->vbios.pm.mode_info_count; i++)
+		ret_length +=3D nouveau_pm_mode_to_string(ddev, i,
+											 buf+ret_length, PAGE_SIZE-ret_length);
+=09
+	return ret_length;
+}
+static DEVICE_ATTR(pm_status, S_IRUGO, nouveau_sysfs_get_pm_status, NULL=
);
+
+
+static ssize_t
+nouveau_sysfs_get_pm_mode(struct device *dev,
+				    struct device_attribute *attr,
+				    char *buf)
+{
+	struct drm_device *ddev =3D pci_get_drvdata(to_pci_dev(dev));
+	struct drm_nouveau_private *dev_priv =3D ddev->dev_private;
+	unsigned pos=3D0, i=3D0;
+=09
+	for (i=3D0; i<dev_priv->vbios.pm.mode_info_count; i++)
+		pos +=3D nouveau_pm_mode_to_string(ddev, i, buf+pos, PAGE_SIZE-pos);
+
+	return pos;
+}
+static ssize_t
+nouveau_sysfs_set_pm_mode(struct device *dev,
+				    struct device_attribute *attr,
+				    const char *buf,
+				    size_t count)
+{
+	struct drm_device *ddev =3D pci_get_drvdata(to_pci_dev(dev));
+	struct drm_nouveau_private *dev_p =3D ddev->dev_private;
+	struct pm_mode_info* pm_mode;
+	int profile =3D buf[0]-'0';
+
+	if (profile < dev_p->vbios.pm.mode_info_count) {
+		pm_mode =3D &dev_p->vbios.pm.pm_modes[profile];
+
+		nouveau_set_core_clocks(ddev, pm_mode->coreclk);
+		nouveau_set_shader_clocks(ddev, pm_mode->shaderclk);
+		nouveau_set_memory_clocks(ddev, pm_mode->memclk);
+		nouveau_set_voltage(ddev, pm_mode->voltage);
+
+		/* TODO: Set the core unknown speed */
+
+		/* TODO: Set the timings */
+
+		/* TODO: Fan Setting */
+	}
+=09
+	return count;
+}
+static DEVICE_ATTR(pm_mode, S_IRUGO | S_IWUSR, nouveau_sysfs_get_pm_mode=
,
+				   nouveau_sysfs_set_pm_mode);
+
+static ssize_t
+nouveau_sysfs_get_temperature(struct device *dev,
+				    struct device_attribute *attr,
+				    char *buf)
+{
+	struct drm_device *ddev =3D pci_get_drvdata(to_pci_dev(dev));
+
+	return snprintf(buf, PAGE_SIZE, "%u =C2=B0C\n", nouveau_get_gpu_tempera=
ture(ddev));
+}
+static DEVICE_ATTR(temp_gpu, S_IRUGO, nouveau_sysfs_get_temperature, NUL=
L);
+
+static ssize_t
+nouveau_sysfs_get_critical_temperature(struct device *dev,
+				    struct device_attribute *attr,
+				    char *buf)
+{
+	struct drm_device *ddev =3D pci_get_drvdata(to_pci_dev(dev));
+	struct drm_nouveau_private *dev_p =3D ddev->dev_private;
+
+	return snprintf(buf, PAGE_SIZE, "%u =C2=B0C\n", dev_p->vbios.pm.temp_cr=
itical);
+}
+static ssize_t
+nouveau_sysfs_set_critical_temperature(struct device *dev,
+				    struct device_attribute *attr,
+				    const char *buf,
+				    size_t count)
+{
+	struct drm_device *ddev =3D pci_get_drvdata(to_pci_dev(dev));
+	struct drm_nouveau_private *dev_p =3D ddev->dev_private;
+	unsigned long value;
+
+	/* get the value */
+	if (strict_strtoul(buf, 10, &value) =3D=3D -EINVAL) {
+		return count;
+	}
+
+	/* Do not let the user set stupid values */
+	if (value < 90) {
+		value =3D 90;
+	} else if (value > 120) {
+		value =3D 120;
+	}
+
+	dev_p->vbios.pm.temp_critical =3D value;
+
+	return count;
+}
+static DEVICE_ATTR(temp_critical, S_IRUGO | S_IWUSR,
+				   nouveau_sysfs_get_critical_temperature,
+				   nouveau_sysfs_set_critical_temperature
+  				);
+
+static ssize_t
+nouveau_sysfs_get_throttling_temperature(struct device *dev,
+				    struct device_attribute *attr,
+				    char *buf)
+{
+	struct drm_device *ddev =3D pci_get_drvdata(to_pci_dev(dev));
+	struct drm_nouveau_private *dev_p =3D ddev->dev_private;
+
+	return snprintf(buf, PAGE_SIZE, "%u =C2=B0C\n", dev_p->vbios.pm.temp_th=
rottling);
+}
+static ssize_t
+nouveau_sysfs_set_throttling_temperature(struct device *dev,
+				    struct device_attribute *attr,
+				    const char *buf,
+				    size_t count)
+{
+	struct drm_device *ddev =3D pci_get_drvdata(to_pci_dev(dev));
+	struct drm_nouveau_private *dev_p =3D ddev->dev_private;
+	unsigned long value;
+
+	/* get the value */
+	if (strict_strtoul(buf, 10, &value) =3D=3D -EINVAL) {
+		return count;
+	}
+
+	/* Do not let the user set stupid values */
+	if (value < 60) {
+		value =3D 60;
+	} else if (value > 115) {
+		value =3D 115;
+	}
+
+	dev_p->vbios.pm.temp_throttling =3D value;
+
+	return count;
+}
+static DEVICE_ATTR(temp_throttling, S_IRUGO | S_IWUSR,
+				   nouveau_sysfs_get_throttling_temperature,
+				   nouveau_sysfs_set_throttling_temperature
+  				);
+
+static ssize_t
+nouveau_sysfs_get_fan_boost_temperature(struct device *dev,
+				    struct device_attribute *attr,
+				    char *buf)
+{
+	struct drm_device *ddev =3D pci_get_drvdata(to_pci_dev(dev));
+	struct drm_nouveau_private *dev_p =3D ddev->dev_private;
+
+	return snprintf(buf, PAGE_SIZE, "%u =C2=B0C\n", dev_p->vbios.pm.temp_fa=
n_boost);
+}
+static ssize_t
+nouveau_sysfs_set_fan_boost_temperature(struct device *dev,
+				    struct device_attribute *attr,
+				    const char *buf,
+				    size_t count)
+{
+	struct drm_device *ddev =3D pci_get_drvdata(to_pci_dev(dev));
+	struct drm_nouveau_private *dev_p =3D ddev->dev_private;
+	unsigned long value;
+
+	/* get the value */
+	if (strict_strtoul(buf, 10, &value) =3D=3D -EINVAL) {
+		return count;
+	}
+
+	/* Do not let the user set stupid values */
+	if (value < 30) {
+		value =3D 30;
+	} else if (value > 100) {
+		value =3D 100;
+	}
+
+	dev_p->vbios.pm.temp_fan_boost =3D value;
+
+	return count;
+}
+static DEVICE_ATTR(temp_fan_boost, S_IRUGO | S_IWUSR,
+				   nouveau_sysfs_get_fan_boost_temperature,
+				   nouveau_sysfs_set_fan_boost_temperature
+  				);
+
+static ssize_t
+nouveau_sysfs_get_voltage(struct device *dev,
+				    struct device_attribute *attr,
+				    char *buf)
+{
+	struct drm_device *ddev =3D pci_get_drvdata(to_pci_dev(dev));
+	struct drm_nouveau_private *dev_priv =3D ddev->dev_private;
+	unsigned pos=3D0, i=3D0;
+
+	for (i=3D0; i<dev_priv->vbios.pm.voltage_entry_count; i++)
+		pos +=3D nouveau_voltage_to_string(ddev, i, buf+pos, PAGE_SIZE-pos);
+
+	return pos;
+}
+static ssize_t
+nouveau_sysfs_set_voltage(struct device *dev,
+				    struct device_attribute *attr,
+				    const char *buf,
+				    size_t count)
+{
+	struct drm_device *ddev =3D pci_get_drvdata(to_pci_dev(dev));
+	struct drm_nouveau_private *dev_p =3D ddev->dev_private;
+	struct pm_voltage_entry* v_entry;
+	int id =3D buf[0]-'0';
+
+	if (id >=3D dev_p->vbios.pm.voltage_entry_count)
+		return count;
+
+	v_entry =3D &dev_p->vbios.pm.voltages[id];
+	nouveau_set_voltage(ddev, v_entry->voltage);
+
+	return count;
+}
+static DEVICE_ATTR(pm_voltage, S_IRUGO | S_IWUSR, nouveau_sysfs_get_volt=
age,
+				   nouveau_sysfs_set_voltage);
+
+/******************************************
+ *            Main functions              *
+ *****************************************/
+
+int
+nouveau_pm_init(struct drm_device* dev)
+{
+	/*struct drm_nouveau_private *dev_priv =3D dev->dev_private;*/
+	int ret;
+
+	/* Parse the vbios PM-related bits */
+	vbios_parse_pmtable(dev);
+
+	/* Set-up the sys entries */
+	ret =3D device_create_file(dev->dev, &dev_attr_pm_status);
+	if (ret)
+		NV_ERROR(dev, "failed to create device file for pm_status\n");
+
+	ret =3D device_create_file(dev->dev, &dev_attr_pm_mode);
+	if (ret)
+		NV_ERROR(dev, "failed to create device file for pm_mode\n");
+
+	ret =3D device_create_file(dev->dev, &dev_attr_temp_gpu);
+	if (ret)
+		NV_ERROR(dev, "failed to create device file for temperature\n");
+
+	ret =3D device_create_file(dev->dev, &dev_attr_temp_critical);
+	if (ret)
+		NV_ERROR(dev, "failed to create device file for critical_temp.\n");
+
+	ret =3D device_create_file(dev->dev, &dev_attr_temp_throttling);
+	if (ret)
+		NV_ERROR(dev, "failed to create device file for throttling_temp.\n");
+
+	ret =3D device_create_file(dev->dev, &dev_attr_temp_fan_boost);
+	if (ret)
+		NV_ERROR(dev, "failed to create device file for fan_boost_temp.\n");
+
+	ret =3D device_create_file(dev->dev, &dev_attr_pm_voltage);
+	if (ret)
+		NV_ERROR(dev, "failed to create device file for fan_boost_temp.\n");
+
+	return 0;
+}
+
+int
+nouveau_pm_fini(struct drm_device* dev)
+{
+	/*struct drm_nouveau_private *dev_priv =3D dev->dev_private;*/
+
+	device_remove_file(dev->dev, &dev_attr_pm_status);
+	device_remove_file(dev->dev, &dev_attr_pm_mode);
+	device_remove_file(dev->dev, &dev_attr_temp_gpu);
+	device_remove_file(dev->dev, &dev_attr_temp_critical);
+	device_remove_file(dev->dev, &dev_attr_temp_throttling);
+	device_remove_file(dev->dev, &dev_attr_temp_fan_boost);
+	device_remove_file(dev->dev, &dev_attr_pm_voltage);
+=09
+	return 0;
+}
diff --git a/drivers/gpu/drm/nouveau/nouveau_pm.h b/drivers/gpu/drm/nouve=
au/nouveau_pm.h
new file mode 100644
index 0000000..23ba87f
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nouveau_pm.h
@@ -0,0 +1,9 @@
+#ifndef __PSCNV_PM_H__
+#define __PSCNV_PM_H__
+
+#include "drm.h"
+
+int nouveau_pm_init(struct drm_device* dev);
+int nouveau_pm_fini(struct drm_device* dev);
+
+#endif
\ No newline at end of file
diff --git a/drivers/gpu/drm/nouveau/nouveau_state.c b/drivers/gpu/drm/no=
uveau/nouveau_state.c
index be85960..3e1548c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_state.c
+++ b/drivers/gpu/drm/nouveau/nouveau_state.c
@@ -37,6 +37,7 @@
 #include "nouveau_fbcon.h"
 #include "nouveau_ramht.h"
 #include "nv50_display.h"
+#include "nouveau_pm.h"
=20
 static void nouveau_stub_takedown(struct drm_device *dev) {}
 static int nouveau_stub_init(struct drm_device *dev) { return 0; }
@@ -604,6 +605,10 @@ nouveau_card_init(struct drm_device *dev)
 	if (ret)
 		NV_ERROR(dev, "Error %d registering backlight\n", ret);
=20
+	if (nouveau_pm_init(dev)) {
+		NV_ERROR(dev, "Failed to initialize power management\n");
+	}
+
 	nouveau_fbcon_init(dev);
 	drm_kms_helper_poll_init(dev);
 	return 0;
@@ -929,6 +934,10 @@ int nouveau_unload(struct drm_device *dev)
 	engine->display.destroy(dev);
 	nouveau_card_takedown(dev);
=20
+	if (nouveau_pm_fini(dev)) {
+		NV_ERROR(dev, "Failed to initialize power management\n");
+	}
+
 	iounmap(dev_priv->mmio);
 	iounmap(dev_priv->ramin);
=20
diff --git a/drivers/gpu/drm/nouveau/vbios/vbios_pm.c b/drivers/gpu/drm/n=
ouveau/vbios/vbios_pm.c
new file mode 100644
index 0000000..4c54a06
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/vbios/vbios_pm.c
@@ -0,0 +1,358 @@
+#include "drmP.h"
+#define NV_DEBUG_NOTRACE
+#include "vbios_pm.h"
+#include "../nouveau_drv.h"
+#include "../nouveau_hw.h"
+#include "../nouveau_encoder.h"
+#include "../nouveau_reg.h"
+#include "../nouveau_bios.h"
+#include "../nouveau_biosP.h"
+
+static int
+vbios_pmtable_parse_temperatures(struct drm_device *dev, struct nvbios *=
bios)
+{
+	struct drm_nouveau_private *dev_p =3D dev->dev_private;
+
+	uint16_t data_ptr =3D bios->pm.temperature_tbl_ptr;
+	/*uint8_t version =3D bios->data[data_ptr+0];*/
+	uint8_t header_length =3D bios->data[data_ptr+1];
+	uint8_t entry_size =3D bios->data[data_ptr+2];
+	uint8_t entry_count =3D bios->data[data_ptr+3];
+	uint8_t i, e;
+
+	if (entry_size !=3D 3 ) {
+		NV_ERROR(dev,
+			"Unknow temperature table entry size(%i instead of 3)."
+			" Please send your vbios to the nouveau devs.\n",
+			entry_size);
+
+		return -EINVAL;
+	}
+
+	/* Set the known default values to setup the temperature sensor */
+	bios->pm.sensor_setup.temp_constant =3D 0;
+	if (dev_p->card_type >=3D NV_40) {
+		switch(dev_p->chipset) {
+			case 0x43:
+				bios->pm.sensor_setup.offset_mult =3D 32060;
+				bios->pm.sensor_setup.offset_div =3D 1000;
+				bios->pm.sensor_setup.slope_mult =3D 792;
+				bios->pm.sensor_setup.slope_div =3D 1000;
+				break;
+
+			case 0x44:
+			case 0x47:
+				bios->pm.sensor_setup.offset_mult =3D 27839;
+				bios->pm.sensor_setup.offset_div =3D 1000;
+				bios->pm.sensor_setup.slope_mult =3D 780;
+				bios->pm.sensor_setup.slope_div =3D 1000;
+				break;
+
+			case 0x46:
+				bios->pm.sensor_setup.offset_mult =3D -24775;
+				bios->pm.sensor_setup.offset_div =3D 100;
+				bios->pm.sensor_setup.slope_mult =3D 467;
+				bios->pm.sensor_setup.slope_div =3D 10000;
+				break;
+
+			case 0x49:
+				bios->pm.sensor_setup.offset_mult =3D -25051;
+				bios->pm.sensor_setup.offset_div =3D 100;
+				bios->pm.sensor_setup.slope_mult =3D 458;
+				bios->pm.sensor_setup.slope_div =3D 10000;
+				break;
+
+			case 0x4b:
+				bios->pm.sensor_setup.offset_mult =3D -24088;
+				bios->pm.sensor_setup.offset_div =3D 100;
+				bios->pm.sensor_setup.slope_mult =3D 442;
+				bios->pm.sensor_setup.slope_div =3D 10000;
+				break;
+
+			case 0x50:
+				bios->pm.sensor_setup.offset_mult =3D -22749;
+				bios->pm.sensor_setup.offset_div =3D 100;
+				bios->pm.sensor_setup.slope_mult =3D 431;
+				bios->pm.sensor_setup.slope_div =3D 10000;
+				break;
+
+			default:
+				bios->pm.sensor_setup.offset_mult =3D 1;
+				bios->pm.sensor_setup.offset_div =3D 1;
+				bios->pm.sensor_setup.slope_mult =3D 1;
+				bios->pm.sensor_setup.slope_div =3D 1;
+		}
+	}
+
+	/* Set sane default values */
+	bios->pm.temp_critical =3D 110;
+	bios->pm.temp_throttling =3D 100;
+	bios->pm.temp_fan_boost =3D 90;
+
+	/* Read the entries from the table */
+	for (i=3D0, e=3D0; i<entry_count; i++) {
+		uint16_t value;
+
+		/* set data_ptr to the entry start point */
+		data_ptr =3D bios->pm.temperature_tbl_ptr +
+					header_length + i*entry_size;
+
+		value =3D ROM16(bios->data[data_ptr+1]);
+		switch(bios->data[data_ptr+0])
+		{
+			case 0x01:
+				value =3D (value&0x8f) =3D=3D 0 ? (value >> 9) & 0x7f : 0;
+				bios->pm.sensor_setup.temp_constant =3D value;
+				break;
+
+			case 0x04:
+				bios->pm.temp_critical =3D (value&0x0ff0) >> 4;
+				break;
+
+			case 0x07:
+				bios->pm.temp_throttling =3D (value&0x0ff0) >> 4;
+				break;
+
+			case 0x08:
+				bios->pm.temp_fan_boost =3D (value&0x0ff0) >> 4;
+				break;
+
+			case 0x10:
+				bios->pm.sensor_setup.offset_mult =3D value;
+				break;
+
+			case 0x11:
+				bios->pm.sensor_setup.offset_div =3D value;
+				break;
+
+			case 0x12:
+				bios->pm.sensor_setup.slope_mult =3D value;
+				break;
+
+			case 0x13:
+				bios->pm.sensor_setup.slope_div =3D value;
+				break;
+		}
+	}
+
+	/* Check the values written in the table */
+	if (bios->pm.temp_critical > 120)
+		bios->pm.temp_critical =3D 120;
+	if (bios->pm.temp_throttling > 110)
+		bios->pm.temp_throttling =3D 110;
+	if (bios->pm.temp_fan_boost > 100)
+		bios->pm.temp_fan_boost =3D 100;
+
+	return 0;
+}
+
+static int
+vbios_pmtable_parse_voltages(struct drm_device *dev, struct nvbios *bios=
)
+{
+	uint16_t data_ptr =3D bios->pm.voltage_tbl_ptr;
+	uint8_t version =3D bios->data[data_ptr+0];
+	uint8_t header_length;
+	uint8_t entry_size;
+	uint8_t i;
+
+	bios->pm.voltage_entry_count =3D 0;
+
+	if (version =3D=3D 0x10 || version =3D=3D 0x12) {
+		/* Geforce 5(FX)/6/7 */
+		header_length =3D 5;
+		entry_size =3D bios->data[data_ptr+1];
+		bios->pm.voltage_entry_count =3D bios->data[data_ptr+2];
+		bios->pm.voltage_mask =3D bios->data[data_ptr+4];
+	} else if (version =3D=3D 0x20 || version =3D=3D 0x30) {
+		/* Geforce 8/9/GT200 */
+		header_length =3D bios->data[data_ptr+1];
+		bios->pm.voltage_entry_count =3D bios->data[data_ptr+2];
+		entry_size =3D bios->data[data_ptr+3];
+		bios->pm.voltage_mask =3D bios->data[data_ptr+5];
+	} else {
+		NV_ERROR(dev, "PM: Unsupported voltage table 0x%x\n", version);
+		return -EINVAL;
+	}
+
+	if (entry_size < 2) {
+		NV_ERROR(dev, "PM: Voltage table entry size is too small."
+					  "Please report\n");
+		return -EINVAL;
+	}
+
+	/* Read the entries */
+	if (bios->pm.voltage_entry_count > 0) {
+		bios->pm.voltages =3D (struct pm_voltage_entry*)kzalloc(
+			bios->pm.voltage_entry_count*sizeof(struct pm_voltage_entry),
+													GFP_KERNEL);
+
+		if (!bios->pm.voltages) {
+			NV_ERROR(dev, "PM: Cannot allocate memory for voltage entries\n");
+			return -EINVAL;
+		}
+
+		data_ptr =3D bios->pm.voltage_tbl_ptr + header_length;
+		for (i=3D0; i<bios->pm.voltage_entry_count; i++) {
+			bios->pm.voltages[i].voltage =3D bios->data[data_ptr+0];
+			bios->pm.voltages[i].index =3D bios->data[data_ptr+1];
+
+			/* In v30 (bios.major_version 0x70) the index, should be shifted
+			* to indicate the value that is being used */
+			if (version =3D=3D 0x30)
+					bios->pm.voltages[i].index >>=3D 2;
+			data_ptr +=3D entry_size;
+		}
+	}
+
+	return 0;
+}
+
+static int
+vbios_pmtable_parse_pm_modes(struct drm_device *dev, struct nvbios *bios=
)
+{
+	if (bios->major_version < 0x60) {
+		/* Geforce 5 mode_info header table */
+		int i,e;
+		uint8_t table_version, header_length, mode_info_length;
+		uint16_t data_ptr;
+
+		table_version =3D bios->data[bios->pm.pm_modes_tbl_ptr+1];
+		if (table_version !=3D 0x12 &&
+			table_version !=3D 0x13 &&
+			table_version !=3D 0x15) {
+			NV_ERROR(dev, "PM: Unsupported PM-mode table version 0x%x."
+						  "Please report to nouveau devs.\n", table_version);
+			return -EINVAL;
+		}
+
+		bios->pm.mode_info_count =3D bios->data[bios->pm.pm_modes_tbl_ptr+2];
+
+		/* Calculate the data ptr */
+		header_length =3D bios->data[bios->pm.pm_modes_tbl_ptr+0];
+		mode_info_length =3D bios->data[bios->pm.pm_modes_tbl_ptr+3];
+
+		/* Populate the modes */
+		for (i=3D0, e=3D0; i < bios->pm.mode_info_count; i++) {
+			uint8_t id;
+			/* Calculate the offset of the current mode_info */
+			data_ptr =3D bios->pm.pm_modes_tbl_ptr + mode_info_length*i +
+				header_length;
+
+			bios->pm.pm_modes[e].id_enabled =3D bios->data[data_ptr+0];
+			bios->pm.pm_modes[e].coreclk =3D bios->data[data_ptr+1]*10;
+			bios->pm.pm_modes[e].memclk =3D bios->data[data_ptr+3]*10;
+			bios->pm.pm_modes[e].shaderclk =3D 0;
+			bios->pm.pm_modes[e].fan_duty =3D bios->data[data_ptr+55];
+			bios->pm.pm_modes[e].voltage =3D bios->data[data_ptr+56];
+
+			/* Check the validity of the entry */
+			id =3D bios->pm.pm_modes[e].id_enabled;
+			if (id =3D=3D 0x20 || id =3D=3D 0x60 || id =3D=3D 0x80)
+				e++;
+		}
+
+		/* Update the real mode count (containing only the valid ones */
+		bios->pm.mode_info_count =3D e;
+	} else {
+		/* Geforce 6+ mode_info header table */
+		int i,e;
+		uint8_t table_version, header_length, mode_info_length;
+		uint8_t extra_data_count, extra_data_length;
+		uint16_t data_ptr;
+
+		table_version =3D bios->data[bios->pm.pm_modes_tbl_ptr+0];
+		if (table_version < 0x21 || table_version > 0x35) {
+			NV_ERROR(dev, "PM: Unsupported PM-mode table version 0x%x."
+						  "Please report to nouveau devs.\n", table_version);
+			return -EINVAL;
+		}
+
+		bios->pm.mode_info_count =3D bios->data[bios->pm.pm_modes_tbl_ptr+2];
+
+		/* Calculate the data ptr */
+		header_length =3D bios->data[bios->pm.pm_modes_tbl_ptr+1];
+		mode_info_length =3D bios->data[bios->pm.pm_modes_tbl_ptr+3];
+		extra_data_count =3D bios->data[bios->pm.pm_modes_tbl_ptr+4];
+		extra_data_length =3D bios->data[bios->pm.pm_modes_tbl_ptr+5];
+
+		/* Populate the modes */
+		for (i=3D0, e=3D0; i < bios->pm.mode_info_count; i++) {
+			/* Calculate the offset of the current mode_info */
+			data_ptr =3D bios->pm.pm_modes_tbl_ptr +
+				(mode_info_length+(extra_data_count*extra_data_length))*i +
+				header_length;
+
+			if (table_version < 0x25) {
+				bios->pm.pm_modes[e].id_enabled =3D bios->data[data_ptr+0];
+				bios->pm.pm_modes[e].fan_duty =3D bios->data[data_ptr+4];
+				bios->pm.pm_modes[e].voltage =3D bios->data[data_ptr+5];
+				bios->pm.pm_modes[e].coreclk =3D ROM16(bios->data[data_ptr+6])*1000;
+				bios->pm.pm_modes[e].shaderclk =3D 0;
+				bios->pm.pm_modes[e].memclk =3D ROM16(bios->data[data_ptr+11])*1000;
+			} else if (table_version =3D=3D 0x25) {
+				bios->pm.pm_modes[e].id_enabled =3D bios->data[data_ptr+0];
+				bios->pm.pm_modes[e].fan_duty =3D bios->data[data_ptr+4];
+				bios->pm.pm_modes[e].voltage =3D bios->data[data_ptr+5];
+				bios->pm.pm_modes[e].coreclk =3D ROM16(bios->data[data_ptr+6])*1000;
+				bios->pm.pm_modes[e].shaderclk =3D ROM16(bios->data[data_ptr+10])*10=
00;
+				bios->pm.pm_modes[e].memclk =3D ROM16(bios->data[data_ptr+12])*1000;
+			} else if (table_version =3D=3D 0x30 || table_version =3D=3D 0x35) {
+				bios->pm.pm_modes[e].id_enabled =3D bios->data[data_ptr+0];
+				bios->pm.pm_modes[e].fan_duty =3D bios->data[data_ptr+6];
+				bios->pm.pm_modes[e].voltage =3D bios->data[data_ptr+7];
+				bios->pm.pm_modes[e].coreclk =3D ROM16(bios->data[data_ptr+8])*1000;
+				bios->pm.pm_modes[e].shaderclk =3D ROM16(bios->data[data_ptr+10])*10=
00;
+				bios->pm.pm_modes[e].memclk =3D ROM16(bios->data[data_ptr+12])*1000;
+			}
+
+			/* Check the validity of the entry */
+			if (table_version =3D=3D 0x35) {
+				uint8_t id =3D bios->pm.pm_modes[e].id_enabled;
+				if (id =3D=3D 0x03 || id =3D=3D 0x05 || id =3D=3D 0x07 || id =3D=3D =
0x0f)
+					e++;
+			} else {
+				uint8_t id =3D bios->pm.pm_modes[e].id_enabled;
+				if (id >=3D 0x20 && id < 0x24)
+					e++;
+			}
+		}
+
+		/* Update the real mode count (containing only the valid ones */
+		bios->pm.mode_info_count =3D e;
+	}
+
+	return 0;
+}
+
+int
+vbios_parse_pmtable(struct drm_device *dev)
+{
+	struct drm_nouveau_private *dev_p =3D dev->dev_private;
+	struct nvbios *bios =3D &dev_p->vbios;
+=09
+	/* parse the thermal table */
+	if (bios->pm.temperature_tbl_ptr) {
+		vbios_pmtable_parse_temperatures(dev, bios);
+	} else {
+		NV_ERROR(dev, "PM: This card doesn't have a temperature table."
+					  "Please report to nouveau devs.\n");
+	}
+
+	/* parse the voltage table */
+	if (bios->pm.voltage_tbl_ptr) {
+		vbios_pmtable_parse_voltages(dev, bios);
+	} else {
+		NV_ERROR(dev, "PM: This card doesn't have a voltage table.\n"
+					  "Please report to nouveau devs.\n");
+	}
+
+	/* Parse the pm modes table */
+	if (bios->pm.pm_modes_tbl_ptr) {
+		vbios_pmtable_parse_pm_modes(dev, bios);
+	} else {
+			NV_ERROR(dev, "PM: This card doesn't have a PM mode table\n"
+						  "Please report to nouveau devs.\n");
+	}
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/nouveau/vbios/vbios_pm.h b/drivers/gpu/drm/n=
ouveau/vbios/vbios_pm.h
new file mode 100644
index 0000000..dd2ad88
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/vbios/vbios_pm.h
@@ -0,0 +1,34 @@
+/*
+ * Copyright (C) 2010 Martin Peres.
+ * All Rights Reserved.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining
+ * a copy of this software and associated documentation files (the
+ * "Software"), to deal in the Software without restriction, including
+ * without limitation the rights to use, copy, modify, merge, publish,
+ * distribute, sublicense, and/or sell copies of the Software, and to
+ * permit persons to whom the Software is furnished to do so, subject to
+ * the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the
+ * next paragraph) shall be included in all copies or substantial
+ * portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
+ * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
+ * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT=
.
+ * IN NO EVENT SHALL THE COPYRIGHT OWNER(S) AND/OR ITS SUPPLIERS BE
+ * LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTIO=
N
+ * OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
+ * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
+ *
+ */
+
+#ifndef __VBIOS_PM_H__
+#define __VBIOS_PM_H__
+
+#include "../nouveau_bios.h"
+
+int vbios_parse_pmtable(struct drm_device *dev);
+
+#endif
--=20
1.7.2


--------------090608000307020004070702
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--------------090608000307020004070702--

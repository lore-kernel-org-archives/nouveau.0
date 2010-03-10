From: Francesco Marella <francesco.marella-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC] nouveau: Add basic i2c sensor chip support
Date: Wed, 10 Mar 2010 17:46:33 +0100
Message-ID: <1268239593.13804.0.camel@deimos>
References: <1258671589-2079-1-git-send-email-mjg@redhat.com>
	<20091120184325.GA29058@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-p84KHZ0Ot6HueExrvFsa"
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20091120184325.GA29058-1xO5oi07KQx4cg9Nei1l7Q@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Matthew Garrett <mjg59-1xO5oi07KQx4cg9Nei1l7Q@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--=-p84KHZ0Ot6HueExrvFsa
Content-Type: text/plain
Content-Transfer-Encoding: 7bit




--=-p84KHZ0Ot6HueExrvFsa
Content-Disposition: attachment; filename="0001-nouveau:-Add-basic-i2c-sensor-chip-support.patch"
Content-Type: text/x-patch; name="0001-nouveau:-Add-basic-i2c-sensor-chip-support.patch"; charset="UTF-8"
Content-Transfer-Encoding: 7bit

updated patch on top of
http://cgit.freedesktop.org/nouveau/linux-2.6/commit/?id=df7f943388cd40cb7a249a97ffa82b669157638f

---
 drivers/gpu/drm/nouveau/Makefile          |    2 +-
 drivers/gpu/drm/nouveau/nouveau_bios.c    |   68 ++++++-
 drivers/gpu/drm/nouveau/nouveau_bios.h    |   10 +
 drivers/gpu/drm/nouveau/nouveau_drv.h     |    3 +
 drivers/gpu/drm/nouveau/nouveau_reg.h     |    2 +
 drivers/gpu/drm/nouveau/nouveau_state.c   |    9 +-
 drivers/gpu/drm/nouveau/nouveau_thermal.c |  326 +++++++++++++++++++++++++++++
 drivers/gpu/drm/nouveau/nouveau_thermal.h |    7 +
 8 files changed, 423 insertions(+), 4 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/nouveau_thermal.c
 create mode 100644 drivers/gpu/drm/nouveau/nouveau_thermal.h

diff --git a/drivers/gpu/drm/nouveau/Makefile b/drivers/gpu/drm/nouveau/Makefile
index 7f0d807..e6818c9 100644
--- a/drivers/gpu/drm/nouveau/Makefile
+++ b/drivers/gpu/drm/nouveau/Makefile
@@ -9,7 +9,7 @@ nouveau-y := nouveau_drv.o nouveau_state.o nouveau_channel.o nouveau_mem.o \
              nouveau_bo.o nouveau_fence.o nouveau_gem.o nouveau_ttm.o \
              nouveau_hw.o nouveau_calc.o nouveau_bios.o nouveau_i2c.o \
              nouveau_display.o nouveau_connector.o nouveau_fbcon.o \
-             nouveau_dp.o nouveau_grctx.o \
+             nouveau_dp.o nouveau_grctx.o nouveau_thermal.o \
              nv04_timer.o \
              nv04_mc.o nv40_mc.o nv50_mc.o \
              nv04_fb.o nv10_fb.o nv40_fb.o nv50_fb.o \
diff --git a/drivers/gpu/drm/nouveau/nouveau_bios.c b/drivers/gpu/drm/nouveau/nouveau_bios.c
index aed6068..3799561 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bios.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bios.c
@@ -4588,6 +4588,60 @@ parse_bit_M_tbl_entry(struct drm_device *dev, struct nvbios *bios,
 	return 0;
 }
 
+static int parse_bit_temp_tbl_entry(struct drm_device *dev, struct nvbios *bios, uint16_t tbl_ptr)
+{
+       uint8_t version, headerlen, entrylen, num_entries;
+       uint16_t offset = tbl_ptr;
+       int i;
+
+       bios->sensor.diode_offset_mult = -1;
+       bios->sensor.diode_offset_div = -1;
+       bios->sensor.slope_mult = -1;
+       bios->sensor.slope_div = -1;
+
+       version = bios->data[tbl_ptr];
+       headerlen = bios->data[tbl_ptr+1];
+       entrylen = bios->data[tbl_ptr+2];
+       num_entries = bios->data[tbl_ptr+3];
+
+       offset += headerlen;
+
+       for (i = 0; i < num_entries; i++) {
+               uint8_t id = bios->data[offset+entrylen*i];
+               int16_t val = ROM16(bios->data[offset+1+entrylen*i]);
+
+               switch (id) {
+               case 0x1:
+                       if ((val & 0x8f) == 0)
+                               bios->sensor.temp_correction =
+                                       ((val >> 9) & 0x7f);
+                       break;
+               case 0x10:
+                       bios->sensor.diode_offset_mult = val;
+                       break;
+               case 0x11:
+                       bios->sensor.diode_offset_div = val;
+                       break;
+               case 0x12:
+                       bios->sensor.slope_mult = val;
+                       break;
+               case 0x13:
+                       bios->sensor.slope_div = val;
+                       break;
+               }
+       }
+       return 0;
+}
+
+static int parse_bit_performance_tbl_entry(struct drm_device *dev, struct nvbios *bios, struct bit_entry *bitentry)
+{
+       uint16_t temp_tbl_ptr = ROM16(bios->data[bitentry->offset + 0xc]);
+
+       parse_bit_temp_tbl_entry(dev, bios, temp_tbl_ptr);
+
+       return 0;
+}
+
 static int parse_bit_tmds_tbl_entry(struct drm_device *dev, struct nvbios *bios, struct bit_entry *bitentry)
 {
 	/*
@@ -4743,6 +4797,7 @@ parse_bit_structure(struct nvbios *bios, const uint16_t bitoffset)
 	parse_bit_table(bios, bitoffset, &BIT_TABLE('T', tmds));
 	parse_bit_table(bios, bitoffset, &BIT_TABLE('U', U));
 	parse_bit_table(bios, bitoffset, &BIT_TABLE('d', displayport));
+	parse_bit_table(bios, bitoffset, &BIT_TABLE('P', performance));
 
 	return 0;
 }
@@ -5727,8 +5782,19 @@ parse_dcb_table(struct drm_device *dev, struct nvbios *bios, bool twoHeads)
 		NV_WARN(dev, "No pointer to DCB I2C port table\n");
 	else {
 		dcb->i2c_table = &bios->data[i2ctabptr];
-		if (dcb->version >= 0x30)
+		if (dcb->version >= 0x30) {
+			int address;
+
 			dcb->i2c_default_indices = dcb->i2c_table[4];
+
+			if (dev_priv->card_type < NV_50)
+				address = 0x2;
+			else
+				address = dcb->i2c_default_indices & 0xf;
+
+			read_dcb_i2c_entry(dev, dcb->version, dcb->i2c_table,
+							address, &dcb->management_i2c);
+		}
 	}
 
 	if (entries > DCB_MAX_NUM_ENTRIES)
diff --git a/drivers/gpu/drm/nouveau/nouveau_bios.h b/drivers/gpu/drm/nouveau/nouveau_bios.h
index 4f88e69..c0670bd 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bios.h
+++ b/drivers/gpu/drm/nouveau/nouveau_bios.h
@@ -138,6 +138,7 @@ struct dcb_table {
 
 	uint8_t *i2c_table;
 	uint8_t i2c_default_indices;
+	struct dcb_i2c_entry management_i2c;
 	struct dcb_i2c_entry i2c[DCB_MAX_NUM_I2C_ENTRIES];
 
 	uint16_t gpio_table_ptr;
@@ -294,6 +295,15 @@ struct nvbios {
 
 		uint16_t lvds_single_a_script_ptr;
 	} legacy;
+
+	struct {
+		int32_t slope_div;
+		int32_t slope_mult;
+		int32_t diode_offset_div;
+		int32_t diode_offset_mult;
+		int32_t temp_correction;
+	} sensor;
+
 };
 
 #endif
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index 6238e25..a1675df 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -624,6 +624,9 @@ struct drm_nouveau_private {
 	struct backlight_device *backlight;
 	bool acpi_dsm;
 
+	struct device *hwmon_dev;
+	int (*get_gpu_temperature)(struct drm_device *dev);
+
 	struct nouveau_channel *evo;
 
 	struct {
diff --git a/drivers/gpu/drm/nouveau/nouveau_reg.h b/drivers/gpu/drm/nouveau/nouveau_reg.h
index aa9b310..b731f24 100644
--- a/drivers/gpu/drm/nouveau/nouveau_reg.h
+++ b/drivers/gpu/drm/nouveau/nouveau_reg.h
@@ -101,6 +101,8 @@
 #    define NV_PMC_ENABLE_UNK13                               (1<<13)
 #define NV40_PMC_GRAPH_UNITS				   0x00001540
 #define NV40_PMC_BACKLIGHT				   0x000015f0
+#define NV40_PMC_TEMP_DATA                                0x000015b0
+#define NV40_PMC_TEMP_VALUE                               0x000015b4
 #	define NV40_PMC_BACKLIGHT_MASK			   0x001f0000
 #define NV40_PMC_1700                                      0x00001700
 #define NV40_PMC_1704                                      0x00001704
diff --git a/drivers/gpu/drm/nouveau/nouveau_state.c b/drivers/gpu/drm/nouveau/nouveau_state.c
index f4ea3e6..0d370ab 100644
--- a/drivers/gpu/drm/nouveau/nouveau_state.c
+++ b/drivers/gpu/drm/nouveau/nouveau_state.c
@@ -33,6 +33,7 @@
 #include "nouveau_drv.h"
 #include "nouveau_drm.h"
 #include "nv50_display.h"
+#include "nouveau_thermal.h"
 
 static void nouveau_stub_takedown(struct drm_device *dev) {}
 
@@ -483,8 +484,10 @@ nouveau_card_init(struct drm_device *dev)
 
 	dev_priv->init_state = NOUVEAU_CARD_INIT_DONE;
 
-	if (drm_core_check_feature(dev, DRIVER_MODESET))
+	if (drm_core_check_feature(dev, DRIVER_MODESET)) {
 		drm_helper_initial_config(dev);
+		nouveau_thermal_init(dev);
+	}
 
 	return 0;
 
@@ -550,8 +553,10 @@ static void nouveau_card_takedown(struct drm_device *dev)
 		nouveau_mem_close(dev);
 		engine->instmem.takedown(dev);
 
-		if (drm_core_check_feature(dev, DRIVER_MODESET))
+		if (drm_core_check_feature(dev, DRIVER_MODESET)) {
+			nouveau_thermal_exit(dev);
 			drm_irq_uninstall(dev);
+		}
 
 		nouveau_gpuobj_late_takedown(dev);
 		nouveau_bios_takedown(dev);
diff --git a/drivers/gpu/drm/nouveau/nouveau_thermal.c b/drivers/gpu/drm/nouveau/nouveau_thermal.c
new file mode 100644
index 0000000..429e42e
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nouveau_thermal.c
@@ -0,0 +1,326 @@
+/*
+ * Copyright 2009 Red Hat Inc <mjg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA
+ *
+ * Contains code derived from nvclock (http://nvclock.sourceforge.net)
+ *
+ * nvclock code is:
+ *  Copyright(C) 2001-2007 Roderick Colenbrander
+ *  Copyright(C) 2005 Hans-Frieder Vogt
+ */
+
+#include "drmP.h"
+#include "drm.h"
+#include "nouveau_drv.h"
+#include "nouveau_drm.h"
+#include "nouveau_i2c.h"
+#include <linux/hwmon.h>
+#include <linux/hwmon-sysfs.h>
+
+static int nouveau_thermal_nv40_setup_sensor(struct drm_device *dev)
+{
+       struct drm_nouveau_private *dev_priv = dev->dev_private;
+       struct nvbios *bios = &dev_priv->vbios;
+       int offset_mult, offset_div, slope_mult, slope_div, temp;
+       int offset = 0;
+       int correction = bios->sensor.temp_correction;
+
+       /*
+        * If we didn't get values from the BIOS then we need to use some
+        * default values. Set these up.
+        */
+
+       switch (dev_priv->chipset) {
+       case 0x43:
+               offset_mult = 32060;
+               offset_div = 1000;
+               slope_mult = 792;
+               slope_div = 1000;
+               break;
+       case 0x44:
+       case 0x47:
+               offset_mult = 27839;
+               offset_div = 1000;
+               slope_mult = 780;
+               slope_div = 1000;
+               break;
+       case 0x46:
+               offset_mult = -24775;
+               offset_div = 100;
+               slope_mult = 467;
+               slope_div = 10000;
+               break;
+       case 0x49:
+               offset_mult = -25051;
+               offset_div = 100;
+               slope_mult = 458;
+               slope_div = 10000;
+               break;
+       case 0x4b:
+               offset_mult = -24088;
+               offset_div = 100;
+               slope_mult = 442;
+               slope_div = 10000;
+               break;
+       }
+       if (bios->sensor.diode_offset_mult == -1)
+               bios->sensor.diode_offset_mult = offset_mult;
+       if (bios->sensor.diode_offset_div == -1)
+               bios->sensor.diode_offset_div = offset_div;
+       if (bios->sensor.slope_mult == -1)
+               bios->sensor.slope_mult = slope_mult;
+       if (bios->sensor.slope_div == -1)
+               bios->sensor.slope_div = slope_div;
+
+       if (dev_priv->chipset >= 0x46)
+               temp = nv_rd32(dev, NV40_PMC_TEMP_VALUE) & 0x1fff;
+       else
+               temp = nv_rd32(dev, NV40_PMC_TEMP_VALUE) & 0xfff;
+
+       if (bios->sensor.diode_offset_div)
+               offset = bios->sensor.diode_offset_mult /
+                       bios->sensor.diode_offset_div;
+
+       if ((temp & 0xfff) == 0) {
+               /* Set up the sensor */
+               int max_temp;
+
+               if (bios->sensor.slope_mult)
+                       max_temp = (120 - offset - correction) *
+                               bios->sensor.slope_div /
+                               bios->sensor.slope_mult;
+               else
+                       max_temp = 120 - offset - correction;
+
+               if (dev_priv->chipset >= 0x46)
+                       nv_wr32(dev, NV40_PMC_TEMP_DATA,
+                               max_temp | 0x80000000);
+               else
+                       nv_wr32(dev, NV40_PMC_TEMP_DATA,
+                               max_temp | 0x10000000);
+               msleep(5);
+       }
+
+       /* If we fail here, there's probably no sensor */
+       temp = nv_rd32(dev, NV40_PMC_TEMP_VALUE) & 0xfff;
+
+       if (!temp)
+               return -ENODEV;
+
+       return 0;
+}
+
+static int nouveau_thermal_nv40_read_temp(struct drm_device *dev)
+{
+       struct drm_nouveau_private *dev_priv = dev->dev_private;
+       struct nvbios *bios = &dev_priv->vbios;
+       int temp;
+       int correction = bios->sensor.temp_correction;
+       int offset = 0;
+
+       if (dev_priv->chipset >= 0x46)
+               temp = nv_rd32(dev, NV40_PMC_TEMP_VALUE) & 0x1fff;
+       else
+               temp = nv_rd32(dev, NV40_PMC_TEMP_VALUE) & 0xfff;
+
+       if (bios->sensor.diode_offset_div)
+               offset = bios->sensor.diode_offset_mult /
+                       bios->sensor.diode_offset_div;
+
+       if (bios->sensor.slope_div) {
+               temp *= bios->sensor.slope_mult;
+               temp /= bios->sensor.slope_div;
+       }
+
+       temp += offset + correction;
+
+       return temp;
+}
+
+static int nouveau_thermal_nv50_read_temp(struct drm_device *dev)
+{
+       int temp = nv_rd32(dev, 0x20008) & 0x1fff;
+
+       temp = temp * 430 / 10000 - 227;
+       return temp;
+}
+
+static int nouveau_thermal_g84_read_temp(struct drm_device *dev)
+{
+       return nv_rd32(dev, 0x20400);
+}
+
+static int nouveau_thermal_i2c_xfer(struct i2c_adapter *adapter, int addr)
+{
+       int ret;
+       ret = i2c_smbus_xfer(adapter, addr, 0, 0, 0, I2C_SMBUS_QUICK, NULL);
+
+       if (ret)
+               return ret;
+
+       return 0;
+}
+
+static int nouveau_thermal_i2c_probe(struct i2c_adapter *adapter, int addr)
+{
+       struct i2c_board_info info = { };
+
+       if (nouveau_thermal_i2c_xfer(adapter, addr))
+               return -ENODEV;
+
+       switch (addr) {
+       case 0x2d:
+#ifndef CONFIG_SENSORS_W83781D
+               request_module("w83781d");
+#endif
+               strlcpy(info.type, "w83781d", sizeof(info.type));
+               info.addr = addr;
+               if (i2c_new_device(adapter, &info))
+                       return 0;
+#ifndef CONFIG_SENSORS_W83L785TS
+               request_module("i2c:w83l785ts");
+#endif
+               strlcpy(info.type, "w83l785ts", sizeof(info.type));
+               info.addr = addr;
+               if (i2c_new_device(adapter, &info))
+                       return 0;
+               break;
+       case 0x2e:
+#ifndef CONFIG_SENSORS_F75375S
+               request_module("i2c:f75375");
+#endif
+               strlcpy(info.type, "f75375", sizeof(info.type));
+               info.addr = addr;
+               if (i2c_new_device(adapter, &info))
+                       return 0;
+#ifndef CONFIG_SENSORS_ADT7473
+               request_module("i2c:adt7473");
+#endif
+               strlcpy(info.type, "adt7473", sizeof(info.type));
+               info.addr = addr;
+               if (i2c_new_device(adapter, &info))
+                       return 0;
+               break;
+       case 0x4c:
+#ifndef CONFIG_SENSORS_LM90
+               request_module("i2c:lm99");
+#endif
+               strlcpy(info.type, "lm99", sizeof(info.type));
+               info.addr = addr;
+               if (i2c_new_device(adapter, &info))
+                       return 0;
+               break;
+       }
+       return -ENODEV;
+}
+
+
+int nouveau_thermal_i2c_create(struct drm_device *dev)
+{
+       struct drm_nouveau_private *dev_priv = dev->dev_private;
+       struct nvbios *bios = &dev_priv->vbios;
+       struct i2c_adapter *adapter;
+       int address;
+
+       if (dev_priv->card_type < NV_50)
+               address = 2;
+       else
+               address = bios->dcb.i2c_default_indices & 0xf;
+
+       if (nouveau_i2c_init(dev, &bios->dcb.management_i2c, address))
+               return -ENODEV;
+
+       adapter = &bios->dcb.management_i2c.chan->adapter;
+
+       nouveau_thermal_i2c_probe(adapter, 0x2d);
+       nouveau_thermal_i2c_probe(adapter, 0x2e);
+       nouveau_thermal_i2c_probe(adapter, 0x4c);
+       return 0;
+}
+
+static ssize_t nouveau_thermal_hwmon_show(struct device *dev,
+                                         struct device_attribute *devattr,
+                                         char *buf)
+{
+       struct drm_device *drm_dev = dev_get_drvdata(dev);
+       struct drm_nouveau_private *dev_priv = drm_dev->dev_private;
+
+       return sprintf(buf, "%u\n", dev_priv->get_gpu_temperature(drm_dev) *
+                      1000);
+}
+
+static ssize_t nouveau_thermal_hwmon_show_name(struct device *dev,
+                                              struct device_attribute *devattr,
+                                              char *buf)
+{
+       return sprintf(buf, "nouveau\n");
+}
+
+SENSOR_DEVICE_ATTR(temp1_input, S_IRUGO, nouveau_thermal_hwmon_show, NULL, 0);
+SENSOR_DEVICE_ATTR(name, S_IRUGO, nouveau_thermal_hwmon_show_name, NULL, 0);
+
+static struct attribute *hwmon_attributes[] = {
+       &sensor_dev_attr_temp1_input.dev_attr.attr,
+       &sensor_dev_attr_name.dev_attr.attr,
+       NULL,
+};
+
+static struct attribute_group hwmon_attribute_group = {
+       .attrs = hwmon_attributes
+};
+
+int nouveau_thermal_init(struct drm_device *dev)
+{
+       struct drm_nouveau_private *dev_priv = dev->dev_private;
+       int err;
+
+       nouveau_thermal_i2c_create(dev);
+
+       if (dev_priv->chipset >= 0x84) {
+               dev_priv->get_gpu_temperature = nouveau_thermal_g84_read_temp;
+       } else if (dev_priv->card_type == NV_50) {
+               dev_priv->get_gpu_temperature = nouveau_thermal_nv50_read_temp;
+       } else if (dev_priv->card_type == NV_40) {
+               dev_priv->get_gpu_temperature = nouveau_thermal_nv40_read_temp;
+               if (nouveau_thermal_nv40_setup_sensor(dev))
+                       dev_priv->get_gpu_temperature = NULL;
+       }
+
+       if (dev_priv->get_gpu_temperature) {
+               dev_priv->hwmon_dev = hwmon_device_register(&dev->pdev->dev);
+               dev_set_drvdata(dev_priv->hwmon_dev, dev);
+               err = sysfs_create_group(&dev_priv->hwmon_dev->kobj,
+                                        &hwmon_attribute_group);
+               if (err)
+                       NV_ERROR(dev, "Unable to create hwmon sysfs file: %d\n",
+                                err);
+       }
+
+       return 0;
+}
+
+void nouveau_thermal_exit(struct drm_device *dev)
+{
+       struct drm_nouveau_private *dev_priv = dev->dev_private;
+       struct nvbios *bios = &dev_priv->vbios;
+
+       if (dev_priv->hwmon_dev) {
+               sysfs_remove_group(&dev_priv->hwmon_dev->kobj,
+                                        &hwmon_attribute_group);
+               hwmon_device_unregister(dev_priv->hwmon_dev);
+       }
+       nouveau_i2c_fini(dev, &bios->dcb.management_i2c);
+}
diff --git a/drivers/gpu/drm/nouveau/nouveau_thermal.h b/drivers/gpu/drm/nouveau/nouveau_thermal.h
new file mode 100644
index 0000000..f2cc3c8
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nouveau_thermal.h
@@ -0,0 +1,7 @@
+#ifndef __NOUVEAU_THERMAL_H
+#define __NOUVEAU_THERMAL_H
+
+int nouveau_thermal_init(struct drm_device *dev);
+void nouveau_thermal_exit(struct drm_device *dev);
+
+#endif
-- 
1.7.0


--=-p84KHZ0Ot6HueExrvFsa
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--=-p84KHZ0Ot6HueExrvFsa--

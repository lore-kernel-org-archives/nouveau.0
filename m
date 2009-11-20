From: Robert Noland <rnoland-4LXSwLOGEL8@public.gmane.org>
Subject: Re: [RFC] nouveau: Add basic i2c sensor chip support
Date: Fri, 20 Nov 2009 13:59:37 -0600
Message-ID: <1258747177.31202.5.camel@balrog.2hip.net>
References: <1258671589-2079-1-git-send-email-mjg@redhat.com>
	<20091120184325.GA29058@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20091120184325.GA29058-1xO5oi07KQx4cg9Nei1l7Q@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
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

On Fri, 2009-11-20 at 18:43 +0000, Matthew Garrett wrote:
> This one works better, including some amount of support for the internal 
> GPU sensor. It seems to give reasonable results on all the cards I have 
> here.

So, I obviously have concerns/objections to allowing GPL code into drm.
Especially, since this code doesn't do anything interesting or
innovative that I can see.  It just reads registers via i2c... I mean
how else would you do it?

robert.

> diff --git a/drivers/gpu/drm/nouveau/Makefile b/drivers/gpu/drm/nouveau/Makefile
> index e12b4ff..3296739 100644
> --- a/drivers/gpu/drm/nouveau/Makefile
> +++ b/drivers/gpu/drm/nouveau/Makefile
> @@ -9,6 +9,7 @@ nouveau-y := nouveau_drv.o nouveau_state.o nouveau_channel.o nouveau_mem.o \
>               nouveau_bo.o nouveau_fence.o nouveau_gem.o nouveau_ttm.o \
>               nouveau_hw.o nouveau_calc.o nouveau_bios.o nouveau_i2c.o \
>  	     nouveau_display.o nouveau_connector.o nouveau_fbcon.o \
> +	     nouveau_thermal.o \
>               nv04_timer.o \
>               nv04_mc.o nv40_mc.o nv50_mc.o \
>               nv04_fb.o nv10_fb.o nv40_fb.o \
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bios.c b/drivers/gpu/drm/nouveau/nouveau_bios.c
> index 1079508..80d3a43 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bios.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bios.c
> @@ -4531,6 +4531,60 @@ static int parse_bit_M_tbl_entry(struct drm_device *dev, struct nvbios *bios, st
>  	return 0;
>  }
>  
> +static int parse_bit_temp_tbl_entry(struct drm_device *dev, struct nvbios *bios, uint16_t tbl_ptr)
> +{
> +	uint8_t version, headerlen, entrylen, num_entries;
> +	uint16_t offset = tbl_ptr;
> +	int i;
> +
> +	bios->sensor.diode_offset_mult = -1;
> +	bios->sensor.diode_offset_div = -1;
> +	bios->sensor.slope_mult = -1;
> +	bios->sensor.slope_div = -1;
> +
> +	version = bios->data[tbl_ptr];
> +	headerlen = bios->data[tbl_ptr+1];
> +	entrylen = bios->data[tbl_ptr+2];
> +	num_entries = bios->data[tbl_ptr+3];
> +
> +	offset += headerlen;
> +
> +	for (i = 0; i < num_entries; i++) {
> +		uint8_t id = bios->data[offset+entrylen*i];
> +		int16_t val = ROM16(bios->data[offset+1+entrylen*i]);
> +
> +		switch (id) {
> +		case 0x1:
> +			if ((val & 0x8f) == 0)
> +				bios->sensor.temp_correction =
> +					((val >> 9) & 0x7f);
> +			break;
> +		case 0x10:
> +			bios->sensor.diode_offset_mult = val;
> +			break;
> +		case 0x11:
> +			bios->sensor.diode_offset_div = val;
> +			break;
> +		case 0x12:
> +			bios->sensor.slope_mult = val;
> +			break;
> +		case 0x13:
> +			bios->sensor.slope_div = val;
> +			break;
> +		}
> +	}
> +	return 0;
> +}
> +
> +static int parse_bit_performance_tbl_entry(struct drm_device *dev, struct nvbios *bios, struct bit_entry *bitentry)
> +{
> +	uint16_t temp_tbl_ptr = ROM16(bios->data[bitentry->offset + 0xc]);
> +
> +	parse_bit_temp_tbl_entry(dev, bios, temp_tbl_ptr);
> +
> +	return 0;
> +}
> +
>  static int parse_bit_tmds_tbl_entry(struct drm_device *dev, struct nvbios *bios, struct bit_entry *bitentry)
>  {
>  	/*
> @@ -4675,6 +4729,7 @@ static int parse_bit_structure(struct drm_device *dev, struct nvbios *bios,
>  	parse_bit_table(dev, bios, bitoffset, &BIT_TABLE('L', lvds));
>  	parse_bit_table(dev, bios, bitoffset, &BIT_TABLE('T', tmds));
>  	parse_bit_table(dev, bios, bitoffset, &BIT_TABLE('U', U));
> +	parse_bit_table(dev, bios, bitoffset, &BIT_TABLE('P', performance));
>  
>  	return 0;
>  }
> @@ -5252,6 +5307,7 @@ static int parse_dcb_table(struct drm_device *dev, struct nvbios *bios, bool two
>  {
>  	struct bios_parsed_dcb *bdcb = &bios->bdcb;
>  	struct parsed_dcb *dcb;
> +	struct drm_nouveau_private *dev_priv = dev->dev_private;
>  	uint16_t dcbptr, i2ctabptr = 0;
>  	uint8_t *dcbtable;
>  	uint8_t headerlen = 0x4, entries = DCB_MAX_NUM_ENTRIES;
> @@ -5357,8 +5413,19 @@ static int parse_dcb_table(struct drm_device *dev, struct nvbios *bios, bool two
>  		NV_WARN(dev, "No pointer to DCB I2C port table\n");
>  	else {
>  		bdcb->i2c_table = &bios->data[i2ctabptr];
> -		if (bdcb->version >= 0x30)
> +		if (bdcb->version >= 0x30) {
> +			int address;
> +
>  			bdcb->i2c_default_indices = bdcb->i2c_table[4];
> +
> +			if (dev_priv->card_type < NV_50)
> +				address = 0x2;
> +			else
> +				address = bdcb->i2c_default_indices & 0xf;
> +
> +			read_dcb_i2c_entry(dev, bdcb->version, bdcb->i2c_table,
> +					   address, &bdcb->management_i2c);
> +		}
>  	}
>  
>  	if (entries > DCB_MAX_NUM_ENTRIES)
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bios.h b/drivers/gpu/drm/nouveau/nouveau_bios.h
> index 1ffda97..e92f3d9 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bios.h
> +++ b/drivers/gpu/drm/nouveau/nouveau_bios.h
> @@ -77,6 +77,7 @@ struct bios_parsed_dcb {
>  	uint16_t init8e_table_ptr;
>  	uint8_t *i2c_table;
>  	uint8_t i2c_default_indices;
> +	struct dcb_i2c_entry management_i2c;
>  };
>  
>  enum nouveau_encoder_type {
> @@ -231,6 +232,15 @@ struct nvbios {
>  
>  		uint16_t lvds_single_a_script_ptr;
>  	} legacy;
> +
> +	struct {
> +		int32_t slope_div;
> +		int32_t slope_mult;
> +		int32_t diode_offset_div;
> +		int32_t diode_offset_mult;
> +		int32_t temp_correction;
> +	} sensor;
> +
>  };
>  
>  #endif
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
> index e33fdd3..bf0330e 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drv.h
> +++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
> @@ -581,6 +581,9 @@ struct drm_nouveau_private {
>  	struct backlight_device *backlight;
>  	bool acpi_dsm;
>  
> +	struct device *hwmon_dev;
> +	int (*get_gpu_temperature)(struct drm_device *dev);
> +
>  	struct nouveau_channel *evo;
>  
>  	struct {
> diff --git a/drivers/gpu/drm/nouveau/nouveau_reg.h b/drivers/gpu/drm/nouveau/nouveau_reg.h
> index 3a5f43a..2db408f 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_reg.h
> +++ b/drivers/gpu/drm/nouveau/nouveau_reg.h
> @@ -99,6 +99,8 @@
>   * the card will hang early on in the X init process.
>   */
>  #    define NV_PMC_ENABLE_UNK13                               (1<<13)
> +#define NV40_PMC_TEMP_DATA				   0x000015b0
> +#define NV40_PMC_TEMP_VALUE				   0x000015b4
>  #define NV40_PMC_BACKLIGHT				   0x000015f0
>  #	define NV40_PMC_BACKLIGHT_MASK			   0x001f0000
>  #define NV40_PMC_1700                                      0x00001700
> diff --git a/drivers/gpu/drm/nouveau/nouveau_state.c b/drivers/gpu/drm/nouveau/nouveau_state.c
> index ac29298..3a3a2de 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_state.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_state.c
> @@ -32,6 +32,7 @@
>  #include "nouveau_drv.h"
>  #include "nouveau_drm.h"
>  #include "nv50_display.h"
> +#include "nouveau_thermal.h"
>  
>  static int nouveau_stub_init(struct drm_device *dev) { return 0; }
>  static void nouveau_stub_takedown(struct drm_device *dev) {}
> @@ -434,8 +435,10 @@ nouveau_card_init(struct drm_device *dev)
>  
>  	dev_priv->init_state = NOUVEAU_CARD_INIT_DONE;
>  
> -	if (drm_core_check_feature(dev, DRIVER_MODESET))
> +	if (drm_core_check_feature(dev, DRIVER_MODESET)) {
>  		drm_helper_initial_config(dev);
> +		nouveau_thermal_init(dev);
> +	}
>  
>  	return 0;
>  }
> @@ -470,8 +473,10 @@ static void nouveau_card_takedown(struct drm_device *dev)
>  		nouveau_mem_close(dev);
>  		engine->instmem.takedown(dev);
>  
> -		if (drm_core_check_feature(dev, DRIVER_MODESET))
> +		if (drm_core_check_feature(dev, DRIVER_MODESET)) {
> +			nouveau_thermal_exit(dev);
>  			drm_irq_uninstall(dev);
> +		}
>  
>  		nouveau_gpuobj_late_takedown(dev);
>  		nouveau_bios_takedown(dev);
> diff --git a/drivers/gpu/drm/nouveau/nouveau_thermal.c b/drivers/gpu/drm/nouveau/nouveau_thermal.c
> new file mode 100644
> index 0000000..6c017d5
> --- /dev/null
> +++ b/drivers/gpu/drm/nouveau/nouveau_thermal.c
> @@ -0,0 +1,326 @@
> +/*
> + * Copyright 2009 Red Hat Inc <mjg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program; if not, write to the Free Software
> + * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA
> + *
> + * Contains code derived from nvclock (http://nvclock.sourceforge.net)
> + *
> + * nvclock code is:
> + *  Copyright(C) 2001-2007 Roderick Colenbrander
> + *  Copyright(C) 2005 Hans-Frieder Vogt
> + */
> +
> +#include "drmP.h"
> +#include "drm.h"
> +#include "nouveau_drv.h"
> +#include "nouveau_drm.h"
> +#include "nouveau_i2c.h"
> +#include <linux/hwmon.h>
> +#include <linux/hwmon-sysfs.h>
> +
> +static int nouveau_thermal_nv40_setup_sensor(struct drm_device *dev)
> +{
> +	struct drm_nouveau_private *dev_priv = dev->dev_private;
> +	struct nvbios *bios = &dev_priv->VBIOS;
> +	int offset_mult, offset_div, slope_mult, slope_div, temp;
> +	int offset = 0;
> +	int correction = bios->sensor.temp_correction;
> +
> +	/*
> +	 * If we didn't get values from the BIOS then we need to use some
> +	 * default values. Set these up.
> +	 */
> +
> +	switch (dev_priv->chipset) {
> +	case 0x43:
> +		offset_mult = 32060;
> +		offset_div = 1000;
> +		slope_mult = 792;
> +		slope_div = 1000;
> +		break;
> +	case 0x44:
> +	case 0x47:
> +		offset_mult = 27839;
> +		offset_div = 1000;
> +		slope_mult = 780;
> +		slope_div = 1000;
> +		break;
> +	case 0x46:
> +		offset_mult = -24775;
> +		offset_div = 100;
> +		slope_mult = 467;
> +		slope_div = 10000;
> +		break;
> +	case 0x49:
> +		offset_mult = -25051;
> +		offset_div = 100;
> +		slope_mult = 458;
> +		slope_div = 10000;
> +		break;
> +	case 0x4b:
> +		offset_mult = -24088;
> +		offset_div = 100;
> +		slope_mult = 442;
> +		slope_div = 10000;
> +		break;
> +	}
> +	if (bios->sensor.diode_offset_mult == -1)
> +		bios->sensor.diode_offset_mult = offset_mult;
> +	if (bios->sensor.diode_offset_div == -1)
> +		bios->sensor.diode_offset_div = offset_div;
> +	if (bios->sensor.slope_mult == -1)
> +		bios->sensor.slope_mult = slope_mult;
> +	if (bios->sensor.slope_div == -1)
> +		bios->sensor.slope_div = slope_div;
> +
> +	if (dev_priv->chipset >= 0x46)
> +		temp = nv_rd32(dev, NV40_PMC_TEMP_VALUE) & 0x1fff;
> +	else
> +		temp = nv_rd32(dev, NV40_PMC_TEMP_VALUE) & 0xfff;
> +
> +	if (bios->sensor.diode_offset_div)
> +		offset = bios->sensor.diode_offset_mult /
> +			bios->sensor.diode_offset_div;
> +
> +	if ((temp & 0xfff) == 0) {
> +		/* Set up the sensor */
> +		int max_temp;
> +
> +		if (bios->sensor.slope_mult)
> +			max_temp = (120 - offset - correction) *
> +				bios->sensor.slope_div /
> +				bios->sensor.slope_mult;
> +		else
> +			max_temp = 120 - offset - correction;
> +
> +		if (dev_priv->chipset >= 0x46)
> +			nv_wr32(dev, NV40_PMC_TEMP_DATA,
> +				max_temp | 0x80000000);
> +		else
> +			nv_wr32(dev, NV40_PMC_TEMP_DATA,
> +				max_temp | 0x10000000);
> +		msleep(5);
> +	}
> +
> +	/* If we fail here, there's probably no sensor */
> +	temp = nv_rd32(dev, NV40_PMC_TEMP_VALUE) & 0xfff;
> +
> +	if (!temp)
> +		return -ENODEV;
> +
> +	return 0;
> +}
> +
> +static int nouveau_thermal_nv40_read_temp(struct drm_device *dev)
> +{
> +	struct drm_nouveau_private *dev_priv = dev->dev_private;
> +	struct nvbios *bios = &dev_priv->VBIOS;
> +	int temp;
> +	int correction = bios->sensor.temp_correction;
> +	int offset = 0;
> +
> +	if (dev_priv->chipset >= 0x46)
> +		temp = nv_rd32(dev, NV40_PMC_TEMP_VALUE) & 0x1fff;
> +	else
> +		temp = nv_rd32(dev, NV40_PMC_TEMP_VALUE) & 0xfff;
> +
> +	if (bios->sensor.diode_offset_div)
> +		offset = bios->sensor.diode_offset_mult /
> +			bios->sensor.diode_offset_div;
> +
> +	if (bios->sensor.slope_div) {
> +		temp *= bios->sensor.slope_mult;
> +		temp /= bios->sensor.slope_div;
> +	}
> +
> +	temp += offset + correction;
> +
> +	return temp;
> +}
> +
> +static int nouveau_thermal_nv50_read_temp(struct drm_device *dev)
> +{
> +	int temp = nv_rd32(dev, 0x20008) & 0x1fff;
> +
> +	temp = temp * 430 / 10000 - 227;
> +	return temp;
> +}
> +
> +static int nouveau_thermal_g84_read_temp(struct drm_device *dev)
> +{
> +	return nv_rd32(dev, 0x20400);
> +}
> +
> +static int nouveau_thermal_i2c_xfer(struct i2c_adapter *adapter, int addr)
> +{
> +	int ret;
> +	ret = i2c_smbus_xfer(adapter, addr, 0, 0, 0, I2C_SMBUS_QUICK, NULL);
> +
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static int nouveau_thermal_i2c_probe(struct i2c_adapter *adapter, int addr)
> +{
> +	struct i2c_board_info info = { };
> +
> +	if (nouveau_thermal_i2c_xfer(adapter, addr))
> +		return -ENODEV;
> +
> +	switch (addr) {
> +	case 0x2d:
> +#ifndef CONFIG_SENSORS_W83781D
> +		request_module("w83781d");
> +#endif
> +		strlcpy(info.type, "w83781d", sizeof(info.type));
> +		info.addr = addr;
> +		if (i2c_new_device(adapter, &info))
> +			return 0;
> +#ifndef CONFIG_SENSORS_W83L785TS
> +		request_module("i2c:w83l785ts");
> +#endif
> +		strlcpy(info.type, "w83l785ts", sizeof(info.type));
> +		info.addr = addr;
> +		if (i2c_new_device(adapter, &info))
> +			return 0;
> +		break;
> +	case 0x2e:
> +#ifndef CONFIG_SENSORS_F75375S
> +		request_module("i2c:f75375");
> +#endif
> +		strlcpy(info.type, "f75375", sizeof(info.type));
> +		info.addr = addr;
> +		if (i2c_new_device(adapter, &info))
> +			return 0;
> +#ifndef CONFIG_SENSORS_ADT7473
> +		request_module("i2c:adt7473");
> +#endif
> +		strlcpy(info.type, "adt7473", sizeof(info.type));
> +		info.addr = addr;
> +		if (i2c_new_device(adapter, &info))
> +			return 0;
> +		break;
> +	case 0x4c:
> +#ifndef CONFIG_SENSORS_LM90
> +		request_module("i2c:lm99");
> +#endif
> +		strlcpy(info.type, "lm99", sizeof(info.type));
> +		info.addr = addr;
> +		if (i2c_new_device(adapter, &info))
> +			return 0;
> +		break;
> +	}
> +	return -ENODEV;
> +}
> +
> +
> +int nouveau_thermal_i2c_create(struct drm_device *dev)
> +{
> +	struct drm_nouveau_private *dev_priv = dev->dev_private;
> +	struct nvbios *bios = &dev_priv->VBIOS;
> +	struct i2c_adapter *adapter;
> +	int address;
> +
> +	if (dev_priv->card_type < NV_50)
> +		address = 2;
> +	else
> +		address = bios->bdcb.i2c_default_indices & 0xf;
> +
> +	if (nouveau_i2c_init(dev, &bios->bdcb.management_i2c, address))
> +		return -ENODEV;
> +
> +	adapter = &bios->bdcb.management_i2c.chan->adapter;
> +
> +	nouveau_thermal_i2c_probe(adapter, 0x2d);
> +	nouveau_thermal_i2c_probe(adapter, 0x2e);
> +	nouveau_thermal_i2c_probe(adapter, 0x4c);
> +	return 0;
> +}
> +
> +static ssize_t nouveau_thermal_hwmon_show(struct device *dev,
> +					  struct device_attribute *devattr,
> +					  char *buf)
> +{
> +	struct drm_device *drm_dev = dev_get_drvdata(dev);
> +	struct drm_nouveau_private *dev_priv = drm_dev->dev_private;
> +
> +	return sprintf(buf, "%u\n", dev_priv->get_gpu_temperature(drm_dev) *
> +		       1000);
> +}
> +
> +static ssize_t nouveau_thermal_hwmon_show_name(struct device *dev,
> +					       struct device_attribute *devattr,
> +					       char *buf)
> +{
> +	return sprintf(buf, "nouveau\n");
> +}
> +
> +SENSOR_DEVICE_ATTR(temp1_input, S_IRUGO, nouveau_thermal_hwmon_show, NULL, 0);
> +SENSOR_DEVICE_ATTR(name, S_IRUGO, nouveau_thermal_hwmon_show_name, NULL, 0);
> +
> +static struct attribute *hwmon_attributes[] = {
> +	&sensor_dev_attr_temp1_input.dev_attr.attr,
> +	&sensor_dev_attr_name.dev_attr.attr,
> +	NULL,
> +};
> +
> +static struct attribute_group hwmon_attribute_group = {
> +	.attrs = hwmon_attributes
> +};
> +
> +int nouveau_thermal_init(struct drm_device *dev)
> +{
> +	struct drm_nouveau_private *dev_priv = dev->dev_private;
> +	int err;
> +
> +	nouveau_thermal_i2c_create(dev);
> +
> +	if (dev_priv->chipset >= 0x84) {
> +		dev_priv->get_gpu_temperature = nouveau_thermal_g84_read_temp;
> +	} else if (nv_arch(dev) == NV_50) {
> +		dev_priv->get_gpu_temperature = nouveau_thermal_nv50_read_temp;
> +	} else if (nv_arch(dev) == NV_40) {
> +		dev_priv->get_gpu_temperature = nouveau_thermal_nv40_read_temp;
> +		if (nouveau_thermal_nv40_setup_sensor(dev))
> +			dev_priv->get_gpu_temperature = NULL;
> +	}
> +
> +	if (dev_priv->get_gpu_temperature) {
> +		dev_priv->hwmon_dev = hwmon_device_register(&dev->pdev->dev);
> +		dev_set_drvdata(dev_priv->hwmon_dev, dev);
> +		err = sysfs_create_group(&dev_priv->hwmon_dev->kobj,
> +					 &hwmon_attribute_group);
> +		if (err)
> +			NV_ERROR(dev, "Unable to create hwmon sysfs file: %d\n",
> +				 err);
> +	}
> +
> +	return 0;
> +}
> +
> +void nouveau_thermal_exit(struct drm_device *dev)
> +{
> +	struct drm_nouveau_private *dev_priv = dev->dev_private;
> +	struct nvbios *bios = &dev_priv->VBIOS;
> +
> +	if (dev_priv->hwmon_dev) {
> +		sysfs_remove_group(&dev_priv->hwmon_dev->kobj,
> +					 &hwmon_attribute_group);
> +		hwmon_device_unregister(dev_priv->hwmon_dev);
> +	}
> +	nouveau_i2c_fini(dev, &bios->bdcb.management_i2c);
> +}
> diff --git a/drivers/gpu/drm/nouveau/nouveau_thermal.h b/drivers/gpu/drm/nouveau/nouveau_thermal.h
> new file mode 100644
> index 0000000..f2cc3c8
> --- /dev/null
> +++ b/drivers/gpu/drm/nouveau/nouveau_thermal.h
> @@ -0,0 +1,7 @@
> +#ifndef __NOUVEAU_THERMAL_H
> +#define __NOUVEAU_THERMAL_H
> +
> +int nouveau_thermal_init(struct drm_device *dev);
> +void nouveau_thermal_exit(struct drm_device *dev);
> +
> +#endif
> 
-- 
Robert Noland <rnoland-4LXSwLOGEL8@public.gmane.org>
2Hip Networks

From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: [PATCHv2 06/10] drm/nouveau: Parse some more BIOS
	parameters needed for TV-out.
Date: Thu, 13 Aug 2009 14:01:33 +0200
Message-ID: <1250164897-7871-6-git-send-email-currojerez@riseup.net>
References: <1250164897-7871-1-git-send-email-currojerez@riseup.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1250164897-7871-1-git-send-email-currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
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


Signed-off-by: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_bios.c |   21 +++++++++++++++++++--
 drivers/gpu/drm/nouveau/nouveau_bios.h |    4 ++++
 2 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bios.c b/drivers/gpu/drm/nouveau/nouveau_bios.c
index e9e1e8f..ec0614f 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bios.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bios.c
@@ -33,6 +33,7 @@
 #define FEATURE_MOBILE 0x10	/* also FEATURE_QUADRO for BMP */
 #define LEGACY_I2C_CRT 0x80
 #define LEGACY_I2C_PANEL 0x81
+#define LEGACY_I2C_TV 0x82
 
 #define EDID1_LEN 128
 
@@ -3960,8 +3961,8 @@ static int parse_bit_i_tbl_entry(struct drm_device *dev, struct nvbios *bios, st
 	if (!daccmpoffset)
 		return 0;
 
-	/* The first value in the table, following the header, is the comparison value
-	 * Purpose of subsequent values unknown -- TV load detection?
+	/* The first value in the table, following the header, is the comparison value,
+	 * the second entry is a comparison value for TV load detection.
 	 */
 
 	dacver = bios->data[daccmpoffset];
@@ -3974,6 +3975,7 @@ static int parse_bit_i_tbl_entry(struct drm_device *dev, struct nvbios *bios, st
 	}
 
 	bios->pub.dactestval = ROM32(bios->data[daccmpoffset + dacheaderlen]);
+	bios->pub.tvdactestval = ROM32(bios->data[daccmpoffset + dacheaderlen + 4]);
 
 	return 0;
 }
@@ -4561,6 +4563,15 @@ parse_dcb20_entry(struct drm_device *dev, struct bios_parsed_dcb *bdcb,
 		}
 		break;
 		}
+	case OUTPUT_TV:
+	{
+		if (bdcb->version >= 0x30)
+			entry->tvconf.has_component_output = conf & (0x8 << 4);
+		else
+			entry->tvconf.has_component_output = false;
+
+		break;
+	}
 	case 0xe:
 		/* weird g80 mobile type that "nv" treats as a terminator */
 		bdcb->dcb.entries--;
@@ -4626,6 +4637,10 @@ parse_dcb15_entry(struct drm_device *dev, struct parsed_dcb *dcb,
 		/* invent a DVI-A output, by copying the fields of the DVI-D
 		 * output; reported to work by math_b on an NV20(!) */
 		fabricate_vga_output(dcb, entry->i2c_index, entry->heads);
+		break;
+	case OUTPUT_TV:
+		entry->tvconf.has_component_output = false;
+		break;
 	}
 
 	return true;
@@ -4835,6 +4850,8 @@ static void fixup_legacy_i2c(struct nvbios *bios)
 			dcb->entry[i].i2c_index = bios->legacy.i2c_indices.crt;
 		if (dcb->entry[i].i2c_index == LEGACY_I2C_PANEL)
 			dcb->entry[i].i2c_index = bios->legacy.i2c_indices.panel;
+		if (dcb->entry[i].i2c_index == LEGACY_I2C_TV)
+			dcb->entry[i].i2c_index = bios->legacy.i2c_indices.tv;
 	}
 }
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_bios.h b/drivers/gpu/drm/nouveau/nouveau_bios.h
index 24fc305..e187ba6 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bios.h
+++ b/drivers/gpu/drm/nouveau/nouveau_bios.h
@@ -50,6 +50,9 @@ struct dcb_entry {
 			bool use_straps_for_mode;
 			bool use_power_scripts;
 		} lvdsconf;
+		struct {
+			bool has_component_output;
+		} tvconf;
 	};
 	bool i2c_upper_default;
 };
@@ -145,6 +148,7 @@ struct nouveau_bios_info {
 	uint8_t chip_version;
 
 	uint32_t dactestval;
+	uint32_t tvdactestval;
 	uint8_t digital_min_front_porch;
 	bool fp_no_ddc;
 };
-- 
1.6.3.3

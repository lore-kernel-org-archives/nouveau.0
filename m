From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/2] drm/nouveau: Rework parse_bmp_structure()
Date: Mon, 18 Apr 2011 13:53:21 +0100
Message-ID: <1303131201-15861-2-git-send-email-emil.l.velikov@gmail.com>
References: <1303131201-15861-1-git-send-email-emil.l.velikov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1303131201-15861-1-git-send-email-emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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

Nuke unneeded parameter 'offset' (value already stored in
'bios->offset')

Signed-off-by: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_bios.c |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bios.c b/drivers/gpu/drm/nouveau/nouveau_bios.c
index 943c622..3c0ce01 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bios.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bios.c
@@ -5562,7 +5562,7 @@ parse_bit_structure(struct nvbios *bios)
 	return 0;
 }
 
-static int parse_bmp_structure(struct drm_device *dev, struct nvbios *bios, unsigned int offset)
+static int parse_bmp_structure(struct drm_device *dev, struct nvbios *bios)
 {
 	/*
 	 * Parses the BMP structure for useful things, but does not act on them
@@ -5607,7 +5607,7 @@ static int parse_bmp_structure(struct drm_device *dev, struct nvbios *bios, unsi
 	 * offset + 156: minimum pixel clock for LVDS dual link
 	 */
 
-	uint8_t *bmp = &bios->data[offset], bmp_version_major, bmp_version_minor;
+	uint8_t *bmp = &bios->data[bios->offset], bmp_version_major, bmp_version_minor;
 	uint16_t bmplength;
 	uint16_t legacy_scripts_offset, legacy_i2c_offset;
 
@@ -5701,7 +5701,7 @@ static int parse_bmp_structure(struct drm_device *dev, struct nvbios *bios, unsi
 	 */
 	bios->feature_byte = bmp[9];
 
-	parse_bios_version(dev, bios, offset + 10);
+	parse_bios_version(dev, bios, bios->offset + 10);
 
 	if (bmp_version_major < 5 || bmp_version_minor < 0x10)
 		bios->old_style_init = true;
@@ -5719,7 +5719,7 @@ static int parse_bmp_structure(struct drm_device *dev, struct nvbios *bios, unsi
 
 	legacy_i2c_offset = 0x48;	/* BMP version 2 & 3 */
 	if (bmplength > 61)
-		legacy_i2c_offset = offset + 54;
+		legacy_i2c_offset = bios->offset + 54;
 	bios->legacy.i2c_indices.crt = bios->data[legacy_i2c_offset];
 	bios->legacy.i2c_indices.tv = bios->data[legacy_i2c_offset + 1];
 	bios->legacy.i2c_indices.panel = bios->data[legacy_i2c_offset + 2];
@@ -5737,7 +5737,7 @@ static int parse_bmp_structure(struct drm_device *dev, struct nvbios *bios, unsi
 		bios->fminvco = ROM32(bmp[71]);
 	}
 	if (bmplength > 88)
-		parse_script_table_pointers(bios, offset + 75);
+		parse_script_table_pointers(bios, bios->offset + 75);
 	if (bmplength > 94) {
 		bios->tmds.output0_script_ptr = ROM16(bmp[89]);
 		bios->tmds.output1_script_ptr = ROM16(bmp[91]);
@@ -6781,7 +6781,7 @@ static int nouveau_parse_vbios_struct(struct drm_device *dev)
 		NV_TRACE(dev, "BMP BIOS found\n");
 		bios->type = NVBIOS_BMP;
 		bios->offset = offset;
-		return parse_bmp_structure(dev, bios, offset);
+		return parse_bmp_structure(dev, bios);
 	}
 
 	NV_ERROR(dev, "No known BIOS signature found\n");
-- 
1.7.1

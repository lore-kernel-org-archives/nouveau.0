From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/2] drm/nouveau: Remove unnecessary argument from
	parse_bit_*()
Date: Mon, 18 Apr 2011 13:53:20 +0100
Message-ID: <1303131201-15861-1-git-send-email-emil.l.velikov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
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

Purge bitoffset as we already store the type (bit,bmp)
as well as the offset (inside struct nvbios)

Signed-off-by: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_bios.c |   27 +++++++++++++--------------
 1 files changed, 13 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bios.c b/drivers/gpu/drm/nouveau/nouveau_bios.c
index 8486dc6..943c622 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bios.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bios.c
@@ -5518,8 +5518,7 @@ bit_table(struct drm_device *dev, u8 id, struct bit_entry *bit)
 }
 
 static int
-parse_bit_table(struct nvbios *bios, const uint16_t bitoffset,
-		struct bit_table *table)
+parse_bit_table(struct nvbios *bios, struct bit_table *table)
 {
 	struct drm_device *dev = bios->dev;
 	struct bit_entry bitentry;
@@ -5532,7 +5531,7 @@ parse_bit_table(struct nvbios *bios, const uint16_t bitoffset,
 }
 
 static int
-parse_bit_structure(struct nvbios *bios, const uint16_t bitoffset)
+parse_bit_structure(struct nvbios *bios)
 {
 	int ret;
 
@@ -5542,23 +5541,23 @@ parse_bit_structure(struct nvbios *bios, const uint16_t bitoffset)
 	 * functions shouldn't be actually *doing* anything apart from pulling
 	 * data from the image into the bios struct, thus no interdependencies
 	 */
-	ret = parse_bit_table(bios, bitoffset, &BIT_TABLE('i', i));
+	ret = parse_bit_table(bios, &BIT_TABLE('i', i));
 	if (ret) /* info? */
 		return ret;
 	if (bios->major_version >= 0x60) /* g80+ */
-		parse_bit_table(bios, bitoffset, &BIT_TABLE('A', A));
-	ret = parse_bit_table(bios, bitoffset, &BIT_TABLE('C', C));
+		parse_bit_table(bios, &BIT_TABLE('A', A));
+	ret = parse_bit_table(bios, &BIT_TABLE('C', C));
 	if (ret)
 		return ret;
-	parse_bit_table(bios, bitoffset, &BIT_TABLE('D', display));
-	ret = parse_bit_table(bios, bitoffset, &BIT_TABLE('I', init));
+	parse_bit_table(bios, &BIT_TABLE('D', display));
+	ret = parse_bit_table(bios, &BIT_TABLE('I', init));
 	if (ret)
 		return ret;
-	parse_bit_table(bios, bitoffset, &BIT_TABLE('M', M)); /* memory? */
-	parse_bit_table(bios, bitoffset, &BIT_TABLE('L', lvds));
-	parse_bit_table(bios, bitoffset, &BIT_TABLE('T', tmds));
-	parse_bit_table(bios, bitoffset, &BIT_TABLE('U', U));
-	parse_bit_table(bios, bitoffset, &BIT_TABLE('d', displayport));
+	parse_bit_table(bios, &BIT_TABLE('M', M)); /* memory? */
+	parse_bit_table(bios, &BIT_TABLE('L', lvds));
+	parse_bit_table(bios, &BIT_TABLE('T', tmds));
+	parse_bit_table(bios, &BIT_TABLE('U', U));
+	parse_bit_table(bios, &BIT_TABLE('d', displayport));
 
 	return 0;
 }
@@ -6773,7 +6772,7 @@ static int nouveau_parse_vbios_struct(struct drm_device *dev)
 		NV_TRACE(dev, "BIT BIOS found\n");
 		bios->type = NVBIOS_BIT;
 		bios->offset = offset;
-		return parse_bit_structure(bios, offset + 6);
+		return parse_bit_structure(bios);
 	}
 
 	offset = findstr(bios->data, bios->length,
-- 
1.7.1

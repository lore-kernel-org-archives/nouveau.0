From: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
Subject: [PATCH 1/2] PM: NV50-NV98.a1 correct/implement many
	additional memtimings Nearly consistent with envytools. Added
	stepping to drm_nouveau_private to make sure newer NV98
	(105M) is zero rather than incorrect.
Date: Tue, 29 Mar 2011 02:18:03 +0200
Message-ID: <1301357884-29551-2-git-send-email-martin.peres@free.fr>
References: <1301357884-29551-1-git-send-email-martin.peres@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1301357884-29551-1-git-send-email-martin.peres-GANU6spQydw@public.gmane.org>
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
Cc: Roy Spliet <r.spliet-oe7qfRrRQfeEZXFvZSAUrfP6llvjuJOh@public.gmane.org>
List-Id: nouveau.vger.kernel.org

From: Roy Spliet <r.spliet-oe7qfRrRQfeEZXFvZSAUrfP6llvjuJOh@public.gmane.org>

---
 drivers/gpu/drm/nouveau/nouveau_drv.h   |    2 +
 drivers/gpu/drm/nouveau/nouveau_mem.c   |   42 +++++++++++++++++++++---------
 drivers/gpu/drm/nouveau/nouveau_state.c |    2 +
 3 files changed, 33 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index 383093e..aca960e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -466,6 +466,7 @@ struct nouveau_pm_memtiming {
 	u32 reg_100234;
 	u32 reg_100238;
 	u32 reg_10023c;
+	u32 reg_100240;
 };
 
 struct nouveau_pm_memtimings {
@@ -637,6 +638,7 @@ struct drm_nouveau_private {
 	enum nouveau_card_type card_type;
 	/* exact chipset, derived from NV_PMC_BOOT_0 */
 	int chipset;
+	int stepping;
 	int flags;
 
 	void __iomem *mmio;
diff --git a/drivers/gpu/drm/nouveau/nouveau_mem.c b/drivers/gpu/drm/nouveau/nouveau_mem.c
index 405f990..3636529 100644
--- a/drivers/gpu/drm/nouveau/nouveau_mem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_mem.c
@@ -597,9 +597,9 @@ nouveau_mem_timing_init(struct drm_device *dev)
 	if (!memtimings->timing)
 		return;
 
-	/* Get "some number" from the timing reg for NV_40
+	/* Get "some number" from the timing reg for NV_40 and NV_50
 	 * Used in calculations later */
-	if (dev_priv->card_type == NV_40) {
+	if (dev_priv->card_type >= NV_40 && dev_priv->chipset < 0x98) {
 		magic_number = (nv_rd32(dev, 0x100228) & 0x0f000000) >> 24;
 	}
 
@@ -643,7 +643,7 @@ nouveau_mem_timing_init(struct drm_device *dev)
 		/* XXX: I don't trust the -1's and +1's... they must come
 		 *      from somewhere! */
 		timing->reg_100224 = (tUNK_0 + tUNK_19 + 1 + magic_number) << 24 |
-				      tUNK_18 << 16 |
+				      max(tUNK_18, (u8) 1) << 16 |
 				      (tUNK_1 + tUNK_19 + 1 + magic_number) << 8;
 		if (dev_priv->chipset == 0xa8) {
 			timing->reg_100224 |= (tUNK_2 - 1);
@@ -654,15 +654,25 @@ nouveau_mem_timing_init(struct drm_device *dev)
 		timing->reg_100228 = (tUNK_12 << 16 | tUNK_11 << 8 | tUNK_10);
 		if (dev_priv->chipset >= 0xa3 && dev_priv->chipset < 0xaa) {
 			timing->reg_100228 |= (tUNK_19 - 1) << 24;
-		}
+		} else {
+			timing->reg_100228 |= magic_number << 24;
+		 }
 
 		if (dev_priv->card_type == NV_40) {
 			/* NV40: don't know what the rest of the regs are..
 			 * And don't need to know either */
-			timing->reg_100228 |= 0x20200000 | magic_number << 24;
+			timing->reg_100228 |= 0x20200000;
 		} else if (dev_priv->card_type >= NV_50) {
-			/* XXX: reg_10022c */
-			timing->reg_10022c = tUNK_2 - 1;
+			if(dev_priv->chipset < 0x98 ||
+				(dev_priv->chipset == 0x98 && dev_priv->stepping <= 0xa1)) {
+				timing->reg_10022c = (0x14 + tUNK_2) << 24 |
+							0x16 << 16 |
+							(tUNK_2 - 1) << 8 |
+							(tUNK_2 - 1);
+			} else {
+				/* XXX: reg_10022c for recentish cards */
+				timing->reg_10022c = tUNK_2 - 1;
+			}
 
 			timing->reg_100230 = (tUNK_20 << 24 | tUNK_21 << 16 |
 						  tUNK_13 << 8  | tUNK_13);
@@ -670,23 +680,27 @@ nouveau_mem_timing_init(struct drm_device *dev)
 			timing->reg_100234 = (tRAS << 24 | tRC);
 			timing->reg_100234 += max(tUNK_10, tUNK_11) << 16;
 
-			if (dev_priv->chipset < 0xa3) {
+			if (dev_priv->chipset < 0x98 ||
+				(dev_priv->chipset == 0x98 && dev_priv->stepping <= 0xa1)) {
 				timing->reg_100234 |= (tUNK_2 + 2) << 8;
 			} else {
 				/* XXX: +6? */
 				timing->reg_100234 |= (tUNK_19 + 6) << 8;
 			}
 
-			/* XXX; reg_100238, reg_10023c
-			 * reg_100238: 0x00??????
-			 * reg_10023c: 0x!!??0202 for NV50+ cards (empirical evidence) */
+			/* XXX; reg_100238
+			 * reg_100238: 0x00?????? */
 			timing->reg_10023c = 0x202;
-			if (dev_priv->chipset < 0xa3) {
+			if (dev_priv->chipset < 0x98 ||
+				(dev_priv->chipset == 0x98 && dev_priv->stepping <= 0xa1)) {
 				timing->reg_10023c |= 0x4000000 | (tUNK_2 - 1) << 16;
 			} else {
-				/* currently unknown
+				/* XXX: reg_10023c
+				 * currently unknown
 				 * 10023c seen as 06xxxxxx, 0bxxxxxx or 0fxxxxxx */
 			}
+
+			/* XXX: reg_100240? */
 		}
 
 		NV_DEBUG(dev, "Entry %d: 220: %08x %08x %08x %08x\n", i,
@@ -695,6 +709,8 @@ nouveau_mem_timing_init(struct drm_device *dev)
 		NV_DEBUG(dev, "         230: %08x %08x %08x %08x\n",
 			 timing->reg_100230, timing->reg_100234,
 			 timing->reg_100238, timing->reg_10023c);
+		NV_DEBUG(dev, "         240: %08x\n",
+			 timing->reg_100240);
 	}
 
 	memtimings->nr_timing = entries;
diff --git a/drivers/gpu/drm/nouveau/nouveau_state.c b/drivers/gpu/drm/nouveau/nouveau_state.c
index e162514..d8297c0 100644
--- a/drivers/gpu/drm/nouveau/nouveau_state.c
+++ b/drivers/gpu/drm/nouveau/nouveau_state.c
@@ -922,11 +922,13 @@ int nouveau_load(struct drm_device *dev, unsigned long flags)
 
 	/* Time to determine the card architecture */
 	reg0 = nv_rd32(dev, NV03_PMC_BOOT_0);
+	dev_priv->stepping = 0; /* XXX: add stepping for pre-NV10? */
 
 	/* We're dealing with >=NV10 */
 	if ((reg0 & 0x0f000000) > 0) {
 		/* Bit 27-20 contain the architecture in hex */
 		dev_priv->chipset = (reg0 & 0xff00000) >> 20;
+		dev_priv->stepping = (reg0 & 0xff);
 	/* NV04 or NV05 */
 	} else if ((reg0 & 0xff00fff0) == 0x20004000) {
 		if (reg0 & 0x00f00000)
-- 
1.7.4.1

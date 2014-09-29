From: Roy Spliet <rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org>
Subject: [PATCH 3/7] fb/ramnva3: Ressurect timing calculation code
Date: Mon, 29 Sep 2014 19:27:15 +0200
Message-ID: <1412011639-3210-4-git-send-email-rspliet@eclipso.eu>
References: <1412011639-3210-1-git-send-email-rspliet@eclipso.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1412011639-3210-1-git-send-email-rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org>
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
 .../drm/nouveau/core/include/subdev/bios/ramcfg.h  | 20 ++++++
 drivers/gpu/drm/nouveau/core/subdev/bios/timing.c  | 42 +++++++++--
 drivers/gpu/drm/nouveau/core/subdev/fb/ramnva3.c   | 81 +++++++++++++++++++---
 3 files changed, 129 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/core/include/subdev/bios/ramcfg.h b/drivers/gpu/drm/nouveau/core/include/subdev/bios/ramcfg.h
index a685bbd..0b4bdc2 100644
--- a/drivers/gpu/drm/nouveau/core/include/subdev/bios/ramcfg.h
+++ b/drivers/gpu/drm/nouveau/core/include/subdev/bios/ramcfg.h
@@ -95,9 +95,29 @@ struct nvbios_ramcfg {
 	union {
 		struct {
 			unsigned timing_10_WR:8;
+			unsigned timing_10_WTR:8;
 			unsigned timing_10_CL:8;
+			unsigned timing_10_RC:8;
+			/*empty: 4 */
+			unsigned timing_10_RFC:8;        /* Byte 5 */
+			/*empty: 6 */
+			unsigned timing_10_RAS:8;        /* Byte 7 */
+			/*empty: 8 */
+			unsigned timing_10_RP:8;         /* Byte 9 */
+			unsigned timing_10_RCDRD:8;
+			unsigned timing_10_RCDWR:8;
+			unsigned timing_10_RRD:8;
+			unsigned timing_10_13:8;
 			unsigned timing_10_ODT:3;
+			/* empty: 15 */
+			unsigned timing_10_16:8;
+			/* empty: 17 */
+			unsigned timing_10_18:8;
 			unsigned timing_10_CWL:8;
+			unsigned timing_10_20:8;
+			unsigned timing_10_21:8;
+			/* empty: 22, 23 */
+			unsigned timing_10_24:8;
 		};
 		struct {
 			unsigned timing_20_2e_03:2;
diff --git a/drivers/gpu/drm/nouveau/core/subdev/bios/timing.c b/drivers/gpu/drm/nouveau/core/subdev/bios/timing.c
index 46d955e..8521eca 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/bios/timing.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/bios/timing.c
@@ -93,10 +93,44 @@ nvbios_timingEp(struct nouveau_bios *bios, int idx,
 	p->timing_hdr = *hdr;
 	switch (!!data * *ver) {
 	case 0x10:
-		p->timing_10_WR = nv_ro08(bios, data + 0x00);
-		p->timing_10_CL = nv_ro08(bios, data + 0x02);
-		p->timing_10_ODT = nv_ro08(bios, data + 0x0e) & 0x07;
-		p->timing_10_CWL = nv_ro08(bios, data + 0x13);
+		p->timing_10_WR    = nv_ro08(bios, data + 0x00);
+		p->timing_10_WTR   = nv_ro08(bios, data + 0x01);
+		p->timing_10_CL    = nv_ro08(bios, data + 0x02);
+		p->timing_10_RC    = nv_ro08(bios, data + 0x03);
+		p->timing_10_RFC   = nv_ro08(bios, data + 0x05);
+		p->timing_10_RAS   = nv_ro08(bios, data + 0x07);
+		p->timing_10_RP    = nv_ro08(bios, data + 0x09);
+		p->timing_10_RCDRD = nv_ro08(bios, data + 0x0a);
+		p->timing_10_RCDWR = nv_ro08(bios, data + 0x0b);
+		p->timing_10_RRD   = nv_ro08(bios, data + 0x0c);
+		p->timing_10_13    = nv_ro08(bios, data + 0x0d);
+		p->timing_10_ODT   = nv_ro08(bios, data + 0x0e) & 0x07;
+
+		p->timing_10_24  = 0xff;
+		p->timing_10_21  = 0;
+		p->timing_10_20  = 0;
+		p->timing_10_CWL = 0;
+		p->timing_10_18  = 0;
+		p->timing_10_16  = 0;
+
+		switch (min_t(u8, *hdr, 25)) {
+		case 25:
+			p->timing_10_24  = nv_ro08(bios, data + 0x18);
+		case 24:
+		case 23:
+		case 22:
+			p->timing_10_21  = nv_ro08(bios, data + 0x15);
+		case 21:
+			p->timing_10_20  = nv_ro08(bios, data + 0x14);
+		case 20:
+			p->timing_10_CWL = nv_ro08(bios, data + 0x13);
+		case 19:
+			p->timing_10_18  = nv_ro08(bios, data + 0x12);
+		case 18:
+		case 17:
+			p->timing_10_16  = nv_ro08(bios, data + 0x10);
+		}
+
 		break;
 	case 0x20:
 		p->timing[0] = nv_ro32(bios, data + 0x00);
diff --git a/drivers/gpu/drm/nouveau/core/subdev/fb/ramnva3.c b/drivers/gpu/drm/nouveau/core/subdev/fb/ramnva3.c
index 719a09b..a4fe7a4 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/fb/ramnva3.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/fb/ramnva3.c
@@ -343,6 +343,66 @@ nva3_link_train_fini(struct nouveau_fb *pfb)
 		pfb->ram->put(pfb, &ram->ltrain.mem);
 }
 
+/*
+ * RAM reclocking
+ */
+#define T(t) cfg->timing_10_##t
+static int
+nva3_ram_timing_calc(struct nouveau_fb *pfb, u32 *timing)
+{
+	struct nva3_ram *ram = (void *)pfb->ram;
+	struct nvbios_ramcfg *cfg = &ram->base.target.bios;
+	int tUNK_base;
+	u32 cur3, cur7, cur8;
+
+	cur3 = nv_rd32(pfb, 0x10022c);
+	cur7 = nv_rd32(pfb, 0x10023c);
+	cur8 = nv_rd32(pfb, 0x100240);
+
+	if (T(CWL) == 0)
+		T(CWL) = ((nv_rd32(pfb, 0x100228) & 0x0f000000) >> 24) + 1;
+
+	tUNK_base =  ((cur7 & 0x00ff0000) >> 16) -
+		     (cur3 & 0x000000ff) - 1;
+
+	timing[0] = (T(RP) << 24 | T(RAS) << 16 | T(RFC) << 8 | T(RC));
+	timing[1] = (T(WR) + 1 + T(CWL)) << 24 |
+		    max_t(u8,T(18), 1) << 16 |
+		    (T(WTR) + 1 + T(CWL)) << 8 |
+		    (5 + T(CL) - T(CWL));
+	timing[2] = (T(CWL) - 1) << 24 |
+		    (T(RRD) << 16) |
+		    (T(RCDWR) << 8) |
+		    T(RCDRD);
+	timing[3] = (cur3 & 0x00ff0000) |
+		    (0x30 + T(CL)) << 24 |
+		    (0xb + T(CL)) << 8 |
+		    (T(CL) - 1);
+	timing[4] = T(20) << 24 |
+		    T(21) << 16 |
+		    T(13) << 8 |
+		    T(13);
+	timing[5] = T(RFC) << 24 |
+		    max_t(u8,T(RCDRD), T(RCDWR)) << 16 |
+		    (T(CWL) + 6) << 8 |
+		    T(RP);
+	timing[6] = (0x5a + T(CL)) << 16 |
+		    (6 - T(CL) + T(CWL)) << 8 |
+		    (0x50 + T(CL) - T(CWL));
+	timing[7] = (cur7 & 0xff000000) |
+		    ((tUNK_base + T(CL)) << 16) |
+		    0x202;
+	timing[8] = cur8 & 0xffffff00;
+
+	nv_debug(pfb, "Entry: 220: %08x %08x %08x %08x\n",
+			timing[0], timing[1], timing[2], timing[3]);
+	nv_debug(pfb, "  230: %08x %08x %08x %08x\n",
+			timing[4], timing[5], timing[6], timing[7]);
+	nv_debug(pfb, "  240: %08x\n", timing[8]);
+	return 0;
+}
+#undef T
+
 static int
 nva3_ram_calc(struct nouveau_fb *pfb, u32 freq)
 {
@@ -519,16 +579,17 @@ nva3_ram_calc(struct nouveau_fb *pfb, u32 freq)
 	ram_mask(fuc, mr[0], 0x00000000, 0x00000000);
 	ram_nsec(fuc, 1000);
 
-	ram_mask(fuc, 0x100220[3], 0x00000000, 0x00000000);
-	ram_mask(fuc, 0x100220[1], 0x00000000, 0x00000000);
-	ram_mask(fuc, 0x100220[6], 0x00000000, 0x00000000);
-	ram_mask(fuc, 0x100220[7], 0x00000000, 0x00000000);
-	ram_mask(fuc, 0x100220[2], 0x00000000, 0x00000000);
-	ram_mask(fuc, 0x100220[4], 0x00000000, 0x00000000);
-	ram_mask(fuc, 0x100220[5], 0x00000000, 0x00000000);
-	ram_mask(fuc, 0x100220[0], 0x00000000, 0x00000000);
-	ram_mask(fuc, 0x100220[8], 0x00000000, 0x00000000);
-
+	ram_wr32(fuc, 0x100220[3], timing[3]);
+	ram_wr32(fuc, 0x100220[1], timing[1]);
+	ram_wr32(fuc, 0x100220[6], timing[6]);
+	ram_wr32(fuc, 0x100220[7], timing[7]);
+	ram_wr32(fuc, 0x100220[2], timing[2]);
+	ram_wr32(fuc, 0x100220[4], timing[4]);
+	ram_wr32(fuc, 0x100220[5], timing[5]);
+	ram_wr32(fuc, 0x100220[0], timing[0]);
+	ram_wr32(fuc, 0x100220[8], timing[8]);
+
+	/* Misc */
 	ram_mask(fuc, 0x100200, 0x00001000, !next->bios.ramcfg_10_02_08 << 12);
 
 	unk714 = ram_rd32(fuc, 0x100714) & ~0xf0000010;
-- 
1.9.3

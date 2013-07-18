From: Roy Spliet <r.spliet-oe7qfRrRQfeEZXFvZSAUrfP6llvjuJOh@public.gmane.org>
Subject: [PATCH 02/11] drm/nv50/pm: Fix last timing register in
	NVA3+, fix typo in NV50
Date: Thu, 18 Jul 2013 13:58:14 +0200
Message-ID: <1374148694-2782-1-git-send-email-r.spliet@student.tudelft.nl>
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
To: Maarten Lankhorst <m.b.lankhorst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Nouveau Mailinglist <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Roy Spliet <r.spliet-oe7qfRrRQfeEZXFvZSAUrfP6llvjuJOh@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Also fix some timings for NVA0

Signed-off-by: Roy Spliet <r.spliet-oe7qfRrRQfeEZXFvZSAUrfP6llvjuJOh@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_mem.c | 45 +++++++++++++++++++----------------
 1 file changed, 25 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_mem.c b/drivers/gpu/drm/nouveau/nouveau_mem.c
index 4f6a572..35b5858 100644
--- a/drivers/gpu/drm/nouveau/nouveau_mem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_mem.c
@@ -73,7 +73,8 @@ nv50_mem_timing_calc(struct drm_device *dev, u32 freq,
 	struct nouveau_fb *pfb = nouveau_fb(device);
 	struct nouveau_drm *drm = nouveau_drm(dev);
 	struct bit_entry P;
-	uint8_t unk18 = 1, unk20 = 0, unk21 = 0, tmp7_3;
+	uint8_t unk18 = 1, unk20 = 0, unk21 = 0, tUnk_3_2;
+	int tUNK_base;
 
 	if (bit_table(dev, 'P', &P))
 		return -EINVAL;
@@ -91,6 +92,11 @@ nv50_mem_timing_calc(struct drm_device *dev, u32 freq,
 		break;
 	}
 
+	tUnk_3_2 = (boot->reg[3] & 0x00ff0000) >> 16;
+	if(tUnk_3_2 == 0) {
+		tUnk_3_2 = 0x16;
+	}
+
 	t->reg[0] = (e->tRP << 24 | e->tRAS << 16 | e->tRFC << 8 | e->tRC);
 
 	t->reg[1] = (e->tWR + 2 + (t->tCWL - 1)) << 24 |
@@ -102,7 +108,9 @@ nv50_mem_timing_calc(struct drm_device *dev, u32 freq,
 		    e->tRCDWR << 8 |
 		    e->tRCDRD);
 
-	t->reg[4] = e->tUNK_13 << 8  | e->tUNK_13;
+	t->reg[3] = (tUnk_3_2 << 16) | (e->tCL - 1);
+
+	t->reg[4] = (unk20 << 24 | unk21 << 16) | e->tUNK_13 << 8  | e->tUNK_13;
 
 	t->reg[5] = (e->tRFC << 24 | max(e->tRCDRD, e->tRCDWR) << 16 | e->tRP);
 
@@ -111,16 +119,16 @@ nv50_mem_timing_calc(struct drm_device *dev, u32 freq,
 	if (P.version == 1) {
 		t->reg[1] |= (e->tCL + 2 - (t->tCWL - 1));
 
-		t->reg[3] = (0x14 + e->tCL) << 24 |
-			    0x16 << 16 |
-			    (e->tCL - 1) << 8 |
-			    (e->tCL - 1);
-
-		t->reg[4] |= boot->reg[4] & 0xffff0000;
+		t->reg[3] |= (tUnk_3_2 + e->tCL - 2) << 24 |
+						 (e->tCL - 1) << 8;
 
-		t->reg[6] = (0x33 - t->tCWL) << 16 |
-			    t->tCWL << 8 |
-			    (0x2e + e->tCL - t->tCWL);
+		if(device->chipset == 0xa0) {
+			t->reg[6] = (0x2c + e->tCL) << 16 |
+				    (0x2e + e->tCL);
+		} else {
+			t->reg[6] = (0x33 - t->tCWL) << 16 |
+				    (0x2e + e->tCL - t->tCWL);
+		}
 
 		t->reg[7] = 0x4000202 | (e->tCL - 1) << 16;
 
@@ -138,12 +146,8 @@ nv50_mem_timing_calc(struct drm_device *dev, u32 freq,
 		t->reg[1] |= (5 + e->tCL - (t->tCWL));
 
 		/* XXX: 0xb? 0x30? */
-		t->reg[3] = (0x30 + e->tCL) << 24 |
-			    (boot->reg[3] & 0x00ff0000)|
-			    (0xb + e->tCL) << 8 |
-			    (e->tCL - 1);
-
-		t->reg[4] |= (unk20 << 24 | unk21 << 16);
+		t->reg[3] |= (0x30 + e->tCL) << 24 |
+			     (0xb + e->tCL) << 8;
 
 		/* XXX: +6? */
 		t->reg[5] |= (t->tCWL + 6) << 8;
@@ -152,9 +156,10 @@ nv50_mem_timing_calc(struct drm_device *dev, u32 freq,
 			    (6 - e->tCL + t->tCWL) << 8 |
 			    (0x50 + e->tCL - t->tCWL);
 
-		tmp7_3 = (boot->reg[7] & 0xff000000) >> 24;
-		t->reg[7] = (tmp7_3 << 24) |
-			    ((tmp7_3 - 6 + e->tCL) << 16) |
+		tUNK_base = ((boot->reg[7] & 0x00ff0000) >> 16) -
+			    (boot->reg[3] & 0x000000ff) - 1;
+		t->reg[7] = (boot->reg[7] & 0xff000000) |
+			    ((tUNK_base + e->tCL) << 16) |
 			    0x202;
 	}
 
-- 
1.8.3.1

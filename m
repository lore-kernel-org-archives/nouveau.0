From: Roy Spliet <r.spliet-oe7qfRrRQfeEZXFvZSAUrfP6llvjuJOh@public.gmane.org>
Subject: [PATCH 2/2] drm/nv50/pm: Assortment of timing fixes
Date: Mon, 25 Jun 2012 20:51:05 +0200
Message-ID: <1340650265-2232-2-git-send-email-r.spliet@student.tudelft.nl>
References: <1340650265-2232-1-git-send-email-r.spliet@student.tudelft.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1340650265-2232-1-git-send-email-r.spliet-oe7qfRrRQfeEZXFvZSAUrfP6llvjuJOh@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Nouveau Mailinglist <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Cc: Roy Spliet <r.spliet-oe7qfRrRQfeEZXFvZSAUrfP6llvjuJOh@public.gmane.org>
List-Id: nouveau.vger.kernel.org

- Last timing problem with NVA3:NVC0
- Typo fix in NV50 path
- Fix debug output

Signed-off-by: Roy Spliet <r.spliet-oe7qfRrRQfeEZXFvZSAUrfP6llvjuJOh@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_mem.c |   15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_mem.c b/drivers/gpu/drm/nouveau/nouveau_mem.c
index 1d290ab..538e958 100644
--- a/drivers/gpu/drm/nouveau/nouveau_mem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_mem.c
@@ -352,7 +352,8 @@ nv50_mem_timing_calc(struct nouveau_device *ndev, u32 freq,
 {
 	struct nouveau_fb *pfb = nv_subdev(ndev, NVDEV_SUBDEV_FB);
 	struct bit_entry P;
-	u8 unk18 = 1, unk20 = 0, unk21 = 0, tmp7_3;
+	u8 unk18 = 1, unk20 = 0, unk21 = 0;
+	int tUnk_base;
 
 	if (bit_table(ndev, 'P', &P))
 		return -EINVAL;
@@ -398,7 +399,6 @@ nv50_mem_timing_calc(struct nouveau_device *ndev, u32 freq,
 		t->reg[4] |= boot->reg[4] & 0xffff0000;
 
 		t->reg[6] = (0x33 - t->tCWL) << 16 |
-			    t->tCWL << 8 |
 			    (0x2e + e->tCL - t->tCWL);
 
 		t->reg[7] = 0x4000202 | (e->tCL - 1) << 16;
@@ -431,9 +431,10 @@ nv50_mem_timing_calc(struct nouveau_device *ndev, u32 freq,
 			    (6 - e->tCL + t->tCWL) << 8 |
 			    (0x50 + e->tCL - t->tCWL);
 
-		tmp7_3 = (boot->reg[7] & 0xff000000) >> 24;
-		t->reg[7] = (tmp7_3 << 24) |
-			    ((tmp7_3 - 6 + e->tCL) << 16) |
+		tUnk_base = ((boot->reg[7] & 0x00ff0000) >> 16) -
+			    (boot->reg[3] & 0x000000ff) - 1;
+		t->reg[7] = (boot->reg[7] & 0xff000000) |
+			    ((tUnk_base + e->tCL) << 16) |
 			    0x202;
 	}
 
@@ -687,6 +688,9 @@ nouveau_mem_timing_calc(struct nouveau_device *ndev, u32 freq,
 	e = (struct nouveau_pm_tbl_entry *)ptr;
 
 	t->tCWL = boot->tCWL;
+	ramcfg = nouveau_perf_ramcfg(ndev, freq, &ver, &len);
+	if(ramcfg)
+		t->id = ramcfg[1];
 
 	switch (ndev->card_type) {
 	case NV_40:
@@ -722,7 +726,6 @@ nouveau_mem_timing_calc(struct nouveau_device *ndev, u32 freq,
 		break;
 	}
 
-	ramcfg = nouveau_perf_ramcfg(ndev, freq, &ver, &len);
 	if (ramcfg) {
 		int dll_off;
 
-- 
1.7.10.2

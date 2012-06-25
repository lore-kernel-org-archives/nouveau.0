From: Roy Spliet <r.spliet-oe7qfRrRQfeEZXFvZSAUrfP6llvjuJOh@public.gmane.org>
Subject: [PATCH 1/2] drm/nouveau/pm: Prepare for more GDDR5 MR
	values
Date: Mon, 25 Jun 2012 20:51:04 +0200
Message-ID: <1340650265-2232-1-git-send-email-r.spliet@student.tudelft.nl>
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
To: Nouveau Mailinglist <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Cc: Roy Spliet <r.spliet-oe7qfRrRQfeEZXFvZSAUrfP6llvjuJOh@public.gmane.org>
List-Id: nouveau.vger.kernel.org

v2: style fixes

Signed-off-by: Roy Spliet <r.spliet-oe7qfRrRQfeEZXFvZSAUrfP6llvjuJOh@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_drv.h |    2 +-
 drivers/gpu/drm/nouveau/nouveau_mem.c |   25 +++++++++++++++++++------
 2 files changed, 20 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index b8fa77d..fe242a3 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -352,7 +352,7 @@ struct nouveau_pm_memtiming {
 	int id;
 
 	u32 reg[9];
-	u32 mr[4];
+	u32 mr[9];
 
 	u8 tCWL;
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_mem.c b/drivers/gpu/drm/nouveau/nouveau_mem.c
index 1e1483e..1d290ab 100644
--- a/drivers/gpu/drm/nouveau/nouveau_mem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_mem.c
@@ -626,6 +626,7 @@ nouveau_mem_gddr5_mr(struct nouveau_device *ndev, u32 freq,
 		     struct nouveau_pm_memtiming *boot,
 		     struct nouveau_pm_memtiming *t)
 {
+	u8 add_term; /* CMD/ADD termination */
 	if (len < 15) {
 		t->drive_strength = boot->drive_strength;
 		t->odt = boot->odt;
@@ -644,18 +645,24 @@ nouveau_mem_gddr5_mr(struct nouveau_device *ndev, u32 freq,
 		return -ERANGE;
 	}
 
-	if (t->odt > 3) {
+	if (t->odt > 2) {
 		NV_WARN(ndev, "(%u) Invalid odt value, assuming autocal: %x",
 			t->id, t->odt);
 		t->odt = 0;
 	}
 
+	if(t->odt)
+		add_term = t->odt;
+	else
+		add_term = 3;
+
 	t->mr[0] = (boot->mr[0] & 0x007) |
 		   ((e->tCL - 5) << 3) |
 		   ((e->tWR - 4) << 8);
-	t->mr[1] = (boot->mr[1] & 0x1007f0) |
+	t->mr[1] = (boot->mr[1] & 0x1007c0) |
 		   t->drive_strength |
-		   (t->odt << 2);
+		   (t->odt << 2) |
+		   (add_term << 4);
 
 	NV_DEBUG(ndev, "(%u) MR: %08x %08x", t->id, t->mr[0], t->mr[1]);
 	return 0;
@@ -783,9 +790,15 @@ nouveau_mem_timing_read(struct nouveau_device *ndev, struct nouveau_pm_memtiming
 	}
 
 	t->mr[0] = nv_rd32(ndev, mr_base);
-	t->mr[1] = nv_rd32(ndev, mr_base + 0x04);
-	t->mr[2] = nv_rd32(ndev, mr_base + 0x20);
-	t->mr[3] = nv_rd32(ndev, mr_base + 0x24);
+	if (pfb->ram.type == NV_MEM_TYPE_GDDR5 &&
+		ndev->card_type >= 0xC0) {
+		for (i = 0; i < 8; i++)
+			t->mr[i+1] = nv_rd32(ndev, mr_base + 0x30 + (i * 4));
+	} else {
+		t->mr[1] = nv_rd32(ndev, mr_base + 0x04);
+		t->mr[2] = nv_rd32(ndev, mr_base + 0x20);
+		t->mr[3] = nv_rd32(ndev, mr_base + 0x24);
+	}
 
 	t->odt = 0;
 	t->drive_strength = 0;
-- 
1.7.10.2

From: Alistair Popple <apopple-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 4/5] drm/nouveau: FIFO interrupt fixes for Turing
Date: Fri, 30 Oct 2020 13:36:44 +1100
Message-ID: <20201030023645.10114-5-apopple@nvidia.com>
References: <20201030023645.10114-1-apopple@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20201030023645.10114-1-apopple-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Alistair Popple <apopple-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
List-Id: nouveau.vger.kernel.org

Some of the low level FIFO interrupt status bits have changed for
Turing. Update the handling of these to match the hardware.

Signed-off-by: Alistair Popple <apopple-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 .../gpu/drm/nouveau/nvkm/engine/fifo/tu102.c  | 78 +++----------------
 1 file changed, 9 insertions(+), 69 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/tu102.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/tu102.c
index 2924381a6b3c..f2f20a25182f 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/tu102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/tu102.c
@@ -393,40 +393,21 @@ tu102_fifo_fault(struct nvkm_fifo *base, struct nvkm_fault_data *info)
 	spin_unlock_irqrestore(&fifo->base.lock, flags);
 }
 
-static const struct nvkm_enum
-tu102_fifo_sched_reason[] = {
-	{ 0x0a, "CTXSW_TIMEOUT" },
-	{}
-};
-
 static void
-tu102_fifo_intr_sched_ctxsw(struct gk104_fifo *fifo)
+tu102_fifo_intr_ctxsw_timeout(struct gk104_fifo *fifo)
 {
 	struct nvkm_device *device = fifo->base.engine.subdev.device;
-	unsigned long flags, engm = 0;
+	unsigned long flags, engm;
 	u32 engn;
 
-	/* We need to ACK the SCHED_ERROR here, and prevent it reasserting,
-	 * as MMU_FAULT cannot be triggered while it's pending.
-	 */
 	spin_lock_irqsave(&fifo->base.lock, flags);
-	nvkm_mask(device, 0x002140, 0x00000100, 0x00000000);
-	nvkm_wr32(device, 0x002100, 0x00000100);
 
-	for (engn = 0; engn < fifo->engine_nr; engn++) {
-		struct gk104_fifo_engine_status status;
+	engm = nvkm_rd32(device, 0x2a30);
+	nvkm_wr32(device, 0x2a30, engm);
 
-		gk104_fifo_engine_status(fifo, engn, &status);
-		if (!status.busy || !status.chsw)
-			continue;
-
-		engm |= BIT(engn);
-	}
-
-	for_each_set_bit(engn, &engm, fifo->engine_nr)
+	for_each_set_bit(engn, &engm, 32)
 		tu102_fifo_recover_engn(fifo, engn);
 
-	nvkm_mask(device, 0x002140, 0x00000100, 0x00000100);
 	spin_unlock_irqrestore(&fifo->base.lock, flags);
 }
 
@@ -437,18 +418,8 @@ tu102_fifo_intr_sched(struct gk104_fifo *fifo)
 	struct nvkm_device *device = subdev->device;
 	u32 intr = nvkm_rd32(device, 0x00254c);
 	u32 code = intr & 0x000000ff;
-	const struct nvkm_enum *en =
-		nvkm_enum_find(tu102_fifo_sched_reason, code);
-
-	nvkm_error(subdev, "SCHED_ERROR %02x [%s]\n", code, en ? en->name : "");
 
-	switch (code) {
-	case 0x0a:
-		tu102_fifo_intr_sched_ctxsw(fifo);
-		break;
-	default:
-		break;
-	}
+	nvkm_error(subdev, "SCHED_ERROR %02x\n", code);
 }
 
 static void
@@ -466,10 +437,9 @@ tu102_fifo_intr(struct nvkm_fifo *base)
 		stat &= ~0x00000001;
 	}
 
-	if (stat & 0x00000010) {
-		nvkm_error(subdev, "PIO_ERROR\n");
-		nvkm_wr32(device, 0x002100, 0x00000010);
-		stat &= ~0x00000010;
+	if (stat & 0x00000002) {
+		tu102_fifo_intr_ctxsw_timeout(fifo);
+		stat &= ~0x00000002;
 	}
 
 	if (stat & 0x00000100) {
@@ -484,36 +454,6 @@ tu102_fifo_intr(struct nvkm_fifo *base)
 		stat &= ~0x00010000;
 	}
 
-	if (stat & 0x00800000) {
-		nvkm_error(subdev, "FB_FLUSH_TIMEOUT\n");
-		nvkm_wr32(device, 0x002100, 0x00800000);
-		stat &= ~0x00800000;
-	}
-
-	if (stat & 0x01000000) {
-		nvkm_error(subdev, "LB_ERROR\n");
-		nvkm_wr32(device, 0x002100, 0x01000000);
-		stat &= ~0x01000000;
-	}
-
-	if (stat & 0x08000000) {
-		gk104_fifo_intr_dropped_fault(fifo);
-		nvkm_wr32(device, 0x002100, 0x08000000);
-		stat &= ~0x08000000;
-	}
-
-	if (stat & 0x10000000) {
-		u32 mask = nvkm_rd32(device, 0x00259c);
-
-		while (mask) {
-			u32 unit = __ffs(mask);
-			fifo->func->intr.fault(&fifo->base, unit);
-			nvkm_wr32(device, 0x00259c, (1 << unit));
-			mask &= ~(1 << unit);
-		}
-		stat &= ~0x10000000;
-	}
-
 	if (stat & 0x20000000) {
 		u32 mask = nvkm_rd32(device, 0x0025a0);
 
-- 
2.20.1

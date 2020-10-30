From: Alistair Popple <apopple-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 2/5] drm/nouveau: Remove Turing interrupt hack
Date: Fri, 30 Oct 2020 13:36:42 +1100
Message-ID: <20201030023645.10114-3-apopple@nvidia.com>
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

This is no longer needed now that tu102_mc_intr_stat has been updated to
look at the correct top-level interrupt bits.

Signed-off-by: Alistair Popple <apopple-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/mc/base.c  |  3 ---
 drivers/gpu/drm/nouveau/nvkm/subdev/mc/priv.h  |  1 -
 drivers/gpu/drm/nouveau/nvkm/subdev/mc/tu102.c | 16 ----------------
 3 files changed, 20 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mc/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mc/base.c
index 0e57ab2a709f..09f669ac6630 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mc/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mc/base.c
@@ -108,9 +108,6 @@ nvkm_mc_intr(struct nvkm_device *device, bool *handled)
 	if (stat)
 		nvkm_error(&mc->subdev, "intr %08x\n", stat);
 	*handled = intr != 0;
-
-	if (mc->func->intr_hack)
-		mc->func->intr_hack(mc, handled);
 }
 
 static u32
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mc/priv.h b/drivers/gpu/drm/nouveau/nvkm/subdev/mc/priv.h
index 4aab753a6040..0d01b2c419ff 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mc/priv.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mc/priv.h
@@ -26,7 +26,6 @@ struct nvkm_mc_func {
 	void (*intr_mask)(struct nvkm_mc *, u32 mask, u32 stat);
 	/* retrieve pending interrupt mask (NV_PMC_INTR) */
 	u32 (*intr_stat)(struct nvkm_mc *);
-	void (*intr_hack)(struct nvkm_mc *, bool *handled);
 	const struct nvkm_mc_map *reset;
 	void (*unk260)(struct nvkm_mc *, u32);
 };
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mc/tu102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mc/tu102.c
index cda924d56a2a..af0afd1ad6ee 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mc/tu102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mc/tu102.c
@@ -100,21 +100,6 @@ tu102_mc_intr_stat(struct nvkm_mc *mc)
 	return intr0 | intr1;
 }
 
-static void
-tu102_mc_intr_hack(struct nvkm_mc *mc, bool *handled)
-{
-	struct nvkm_device *device = mc->subdev.device;
-	u32 stat = nvkm_rd32(device, 0xb81010);
-
-	if (stat & 0x00000050) {
-		struct nvkm_subdev *subdev =
-			nvkm_device_subdev(device, NVKM_SUBDEV_FAULT);
-		nvkm_wr32(device, 0xb81010, stat & 0x00000050);
-		if (subdev)
-			nvkm_subdev_intr(subdev);
-		*handled = true;
-	}
-}
 
 static const struct nvkm_mc_func
 tu102_mc = {
@@ -124,7 +109,6 @@ tu102_mc = {
 	.intr_rearm = tu102_mc_intr_rearm,
 	.intr_mask = tu102_mc_intr_mask,
 	.intr_stat = tu102_mc_intr_stat,
-	.intr_hack = tu102_mc_intr_hack,
 	.reset = gk104_mc_reset,
 };
 
-- 
2.20.1

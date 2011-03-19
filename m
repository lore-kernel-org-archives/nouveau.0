From: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
Subject: [PATCH 1/2] Add pm.(un)pause functions
Date: Sat, 19 Mar 2011 23:14:16 +0100
Message-ID: <1300572857-8712-2-git-send-email-martin.peres@free.fr>
References: <1300572857-8712-1-git-send-email-martin.peres@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1300572857-8712-1-git-send-email-martin.peres-GANU6spQydw@public.gmane.org>
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
Cc: Martin Peres <martin.peres-Iz16wY1oaNPLSKGbIzaifA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

From: Martin Peres <martin.peres-Iz16wY1oaNPLSKGbIzaifA@public.gmane.org>

With this patch, cards without internal memory (IONs and other IGPs)
and cards with no memory reclock (a lot of nv40) should support
safe reclocking while gaming.

This should work on all hardware(< nva3), report bugs if it doesn't.

v2: Fix missing symbol at compilation on x86_32 systems

Signed-off-by: Martin Peres <martin.peres-Iz16wY1oaNPLSKGbIzaifA@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_drv.h   |    9 ++
 drivers/gpu/drm/nouveau/nouveau_pm.c    |   24 ++++-
 drivers/gpu/drm/nouveau/nouveau_pm.h    |    4 +
 drivers/gpu/drm/nouveau/nouveau_reg.h   |    3 +
 drivers/gpu/drm/nouveau/nouveau_state.c |   15 +++-
 drivers/gpu/drm/nouveau/nv04_pm.c       |  126 ++++++++++++++++++++++
 drivers/gpu/drm/nouveau/nv50_pm.c       |  172 +++++++++++++++++++++++++++++++
 7 files changed, 350 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index 0611188..823aee3 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -474,6 +474,10 @@ struct nouveau_pm_memtimings {
 	int nr_timing;
 };
 
+struct nouveau_pm_pause_card_state {
+	u32 reg_c040;
+};
+
 struct nouveau_pm_engine {
 	struct nouveau_pm_voltage voltage;
 	struct nouveau_pm_level perflvl[NOUVEAU_PM_MAX_LEVEL];
@@ -488,6 +492,11 @@ struct nouveau_pm_engine {
 	struct device *hwmon;
 	struct notifier_block acpi_nb;
 
+	struct nouveau_pm_pause_card_state pause_state;
+
+	int (*pause)(struct drm_device *);
+	void (*unpause)(struct drm_device *);
+
 	int (*clock_get)(struct drm_device *, u32 id);
 	void *(*clock_pre)(struct drm_device *, struct nouveau_pm_level *,
 			   u32 id, int khz);
diff --git a/drivers/gpu/drm/nouveau/nouveau_pm.c b/drivers/gpu/drm/nouveau/nouveau_pm.c
index 0b1caeb..76ada6c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_pm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_pm.c
@@ -45,6 +45,10 @@ nouveau_pm_clock_set(struct drm_device *dev, struct nouveau_pm_level *perflvl,
 	if (khz == 0)
 		return 0;
 
+	/* Do no reclock the memory if the frequencies didn't change */
+	if (id == PLL_MEMORY && pm->cur->memory == khz)
+		return 0;
+
 	pre_state = pm->clock_pre(dev, perflvl, id, khz);
 	if (IS_ERR(pre_state))
 		return PTR_ERR(pre_state);
@@ -60,10 +64,13 @@ nouveau_pm_perflvl_set(struct drm_device *dev, struct nouveau_pm_level *perflvl)
 	struct drm_nouveau_private *dev_priv = dev->dev_private;
 	struct nouveau_pm_engine *pm = &dev_priv->engine.pm;
 	int ret;
+	uint64_t start = nv04_timer_read(dev);
 
 	if (perflvl == pm->cur)
 		return 0;
 
+	NV_INFO(dev, "setting performance level: %s\n", perflvl->name);
+
 	if (pm->voltage.supported && pm->voltage_set && perflvl->voltage) {
 		ret = pm->voltage_set(dev, perflvl->voltage);
 		if (ret) {
@@ -72,13 +79,27 @@ nouveau_pm_perflvl_set(struct drm_device *dev, struct nouveau_pm_level *perflvl)
 		}
 	}
 
+	ret = pm->pause(dev);
+	if (ret)
+		return ret;
+
 	nouveau_pm_clock_set(dev, perflvl, PLL_CORE, perflvl->core);
 	nouveau_pm_clock_set(dev, perflvl, PLL_SHADER, perflvl->shader);
 	nouveau_pm_clock_set(dev, perflvl, PLL_MEMORY, perflvl->memory);
 	nouveau_pm_clock_set(dev, perflvl, PLL_UNK05, perflvl->unk05);
 
+	/* Wait for PLLs to stabilize */
+	udelay(100);
+
 	pm->cur = perflvl;
-	return 0;
+	ret = 0;
+
+	pm->unpause(dev);
+
+	NV_DEBUG(dev, "Reclocking took %lluns\n",
+		 (nv04_timer_read(dev) - start));
+
+	return ret;
 }
 
 static int
@@ -112,7 +133,6 @@ nouveau_pm_profile_set(struct drm_device *dev, const char *profile)
 			return -EINVAL;
 	}
 
-	NV_INFO(dev, "setting performance level: %s\n", profile);
 	return nouveau_pm_perflvl_set(dev, perflvl);
 }
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_pm.h b/drivers/gpu/drm/nouveau/nouveau_pm.h
index 4a9838dd..566f72d 100644
--- a/drivers/gpu/drm/nouveau/nouveau_pm.h
+++ b/drivers/gpu/drm/nouveau/nouveau_pm.h
@@ -51,12 +51,16 @@ int nv04_pm_clock_get(struct drm_device *, u32 id);
 void *nv04_pm_clock_pre(struct drm_device *, struct nouveau_pm_level *,
 			u32 id, int khz);
 void nv04_pm_clock_set(struct drm_device *, void *);
+int nv04_pm_pause(struct drm_device *dev);
+void nv04_pm_unpause(struct drm_device *dev);
 
 /* nv50_pm.c */
 int nv50_pm_clock_get(struct drm_device *, u32 id);
 void *nv50_pm_clock_pre(struct drm_device *, struct nouveau_pm_level *,
 			u32 id, int khz);
 void nv50_pm_clock_set(struct drm_device *, void *);
+int nv50_pm_pause(struct drm_device *dev);
+void nv50_pm_unpause(struct drm_device *dev);
 
 /* nva3_pm.c */
 int nva3_pm_clock_get(struct drm_device *, u32 id);
diff --git a/drivers/gpu/drm/nouveau/nouveau_reg.h b/drivers/gpu/drm/nouveau/nouveau_reg.h
index 04e8fb7..5cf817e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_reg.h
+++ b/drivers/gpu/drm/nouveau/nouveau_reg.h
@@ -695,8 +695,11 @@
 #define NV50_PROM__ESIZE                                       0x10000
 
 #define NV50_PGRAPH                                         0x00400000
+#define NV50_PGRAPH_CONTROL                                 0x00400500
+#define NV50_PGRAPH_FIFO_STATUS                             0x00400504
 #define NV50_PGRAPH__LEN                                           0x1
 #define NV50_PGRAPH__ESIZE                                     0x10000
+#define NV50_PFIFO_FREEZE                                       0x2504
 
 #define NV50_PDISPLAY                                                0x00610000
 #define NV50_PDISPLAY_OBJECTS                                        0x00610010
diff --git a/drivers/gpu/drm/nouveau/nouveau_state.c b/drivers/gpu/drm/nouveau/nouveau_state.c
index 9582165..2a190d4 100644
--- a/drivers/gpu/drm/nouveau/nouveau_state.c
+++ b/drivers/gpu/drm/nouveau/nouveau_state.c
@@ -98,6 +98,8 @@ static int nouveau_init_engine_ptrs(struct drm_device *dev)
 		engine->pm.clock_get		= nv04_pm_clock_get;
 		engine->pm.clock_pre		= nv04_pm_clock_pre;
 		engine->pm.clock_set		= nv04_pm_clock_set;
+		engine->pm.pause		= nv04_pm_pause;
+		engine->pm.unpause		= nv04_pm_unpause;
 		engine->crypt.init		= nouveau_stub_init;
 		engine->crypt.takedown		= nouveau_stub_takedown;
 		engine->vram.init		= nouveau_mem_detect;
@@ -157,6 +159,8 @@ static int nouveau_init_engine_ptrs(struct drm_device *dev)
 		engine->pm.clock_get		= nv04_pm_clock_get;
 		engine->pm.clock_pre		= nv04_pm_clock_pre;
 		engine->pm.clock_set		= nv04_pm_clock_set;
+		engine->pm.pause		= nv04_pm_pause;
+		engine->pm.unpause		= nv04_pm_unpause;
 		engine->crypt.init		= nouveau_stub_init;
 		engine->crypt.takedown		= nouveau_stub_takedown;
 		engine->vram.init		= nouveau_mem_detect;
@@ -216,6 +220,8 @@ static int nouveau_init_engine_ptrs(struct drm_device *dev)
 		engine->pm.clock_get		= nv04_pm_clock_get;
 		engine->pm.clock_pre		= nv04_pm_clock_pre;
 		engine->pm.clock_set		= nv04_pm_clock_set;
+		engine->pm.pause		= nv04_pm_pause;
+		engine->pm.unpause		= nv04_pm_unpause;
 		engine->crypt.init		= nouveau_stub_init;
 		engine->crypt.takedown		= nouveau_stub_takedown;
 		engine->vram.init		= nouveau_mem_detect;
@@ -277,6 +283,8 @@ static int nouveau_init_engine_ptrs(struct drm_device *dev)
 		engine->pm.clock_set		= nv04_pm_clock_set;
 		engine->pm.voltage_get		= nouveau_voltage_gpio_get;
 		engine->pm.voltage_set		= nouveau_voltage_gpio_set;
+		engine->pm.pause		= nv04_pm_pause;
+		engine->pm.unpause		= nv04_pm_unpause;
 		engine->crypt.init		= nouveau_stub_init;
 		engine->crypt.takedown		= nouveau_stub_takedown;
 		engine->vram.init		= nouveau_mem_detect;
@@ -340,6 +348,8 @@ static int nouveau_init_engine_ptrs(struct drm_device *dev)
 		engine->pm.voltage_get		= nouveau_voltage_gpio_get;
 		engine->pm.voltage_set		= nouveau_voltage_gpio_set;
 		engine->pm.temp_get		= nv40_temp_get;
+		engine->pm.pause		= nv04_pm_pause;
+		engine->pm.unpause		= nv04_pm_unpause;
 		engine->crypt.init		= nouveau_stub_init;
 		engine->crypt.takedown		= nouveau_stub_takedown;
 		engine->vram.init		= nouveau_mem_detect;
@@ -432,6 +442,8 @@ static int nouveau_init_engine_ptrs(struct drm_device *dev)
 		}
 		engine->pm.voltage_get		= nouveau_voltage_gpio_get;
 		engine->pm.voltage_set		= nouveau_voltage_gpio_set;
+		engine->pm.pause		= nv50_pm_pause;
+		engine->pm.unpause		= nv50_pm_unpause;
 		if (dev_priv->chipset >= 0x84)
 			engine->pm.temp_get	= nv84_temp_get;
 		else
@@ -507,6 +519,8 @@ static int nouveau_init_engine_ptrs(struct drm_device *dev)
 		engine->gpio.irq_register	= nv50_gpio_irq_register;
 		engine->gpio.irq_unregister	= nv50_gpio_irq_unregister;
 		engine->gpio.irq_enable		= nv50_gpio_irq_enable;
+		engine->pm.pause		= nv04_pm_pause;
+		engine->pm.unpause		= nv04_pm_unpause;
 		engine->crypt.init		= nouveau_stub_init;
 		engine->crypt.takedown		= nouveau_stub_takedown;
 		engine->vram.init		= nvc0_vram_init;
@@ -1169,4 +1183,3 @@ bool nouveau_wait_for_idle(struct drm_device *dev)
 
 	return true;
 }
-
diff --git a/drivers/gpu/drm/nouveau/nv04_pm.c b/drivers/gpu/drm/nouveau/nv04_pm.c
index eb1c70d..6f5ad051 100644
--- a/drivers/gpu/drm/nouveau/nv04_pm.c
+++ b/drivers/gpu/drm/nouveau/nv04_pm.c
@@ -88,3 +88,129 @@ nv04_pm_clock_set(struct drm_device *dev, void *pre_state)
 	kfree(state);
 }
 
+int
+nv04_pm_pause(struct drm_device *dev)
+{
+	struct drm_nouveau_private *dev_priv = dev->dev_private;
+	struct nouveau_pm_engine *pm = &dev_priv->engine.pm;
+	unsigned long irq_flags, hold_spin = 0;
+	/* initial guess... */
+	uint32_t mask300 = 0xffffffff;
+	uint32_t mask700 = 0xffffbfff;
+	uint64_t start = nv04_timer_read(dev);
+
+	/* Do not allow the card to allocate/destroy a
+	 * new channel while reclocking.
+	 *
+	 * We try to hold it for the shortest period of time possible
+	 */
+	spin_lock_irqsave(&dev_priv->context_switch_lock, irq_flags);
+	hold_spin = 1;
+
+	/* Don't context switch */
+	nv04_fifo_reassign(dev, false);
+
+	/* PDISPLAY magic */
+	nv_mask(dev, NV50_PDISPLAY_PIO_CTRL, 0x0, 0x1);
+
+	/* Pause PFIFO's puller */
+	nv04_fifo_cache_pull(dev, false);
+
+	/* Wait for PFIFO's DMA_PUSH to deplete (Not busy) */
+	if (!nouveau_wait_eq(dev, 100000, NV04_PFIFO_CACHE1_DMA_PUSH,
+				0x100, 0x100)) {
+		NV_ERROR(dev, "PFIFO DMA_PUSH never depletes (0x%x)\n",
+			nv_rd32(dev, NV04_PFIFO_CACHE1_DMA_PUSH));
+		goto err_pfifo_freeze;
+	}
+	nv_mask(dev, NV04_PFIFO_CACHE1_DMA_PUSH, 0x1, 0);
+
+	/* Pause PGRAPH's FIFO */
+	nv_wr32(dev, NV04_PGRAPH_FIFO, 0);
+
+	/* Now that the card is paused,
+	 * there is no problem with channel creation
+	 */
+	spin_unlock_irqrestore(&dev_priv->context_switch_lock, irq_flags);
+	hold_spin = 0;
+
+	/* Wait for PGRAPH to be really stopped */
+	if (!nouveau_wait_eq(dev, 1000000, 0x400300, mask300, 0x4) ||
+		!nouveau_wait_eq(dev, 8000000, NV04_PGRAPH_STATUS,
+				mask700, 0x0)) {
+		/* if you see this message,
+		* mask* above probably need to be adjusted
+		* to not contain the bits you see failing */
+		NV_ERROR(dev,
+		    "PGRAPH: wait for idle fail: %08x %08x!\n",
+		    nv_rd32(dev, NV04_PGRAPH_STATUS),
+		    nv_rd32(dev, 0x400300));
+
+		goto err_pgraph;
+	}
+
+	if (dev_priv->card_type == NV_40)
+		pm->pause_state.reg_c040 = nv_mask(dev, 0xc040, 0x333, 0);
+
+	NV_DEBUG(dev, "PM.pause took %lluns\n",
+		(nv04_timer_read(dev) - start));
+
+	return 0;
+
+err_pgraph:
+	nv_wr32(dev, NV04_PGRAPH_FIFO, 1);
+
+	nv_mask(dev, NV04_PFIFO_CACHE1_DMA_PUSH, 0, 0x1);
+
+err_pfifo_freeze:
+	nv04_fifo_cache_pull(dev, true);
+	nv04_fifo_reassign(dev, true);
+
+	/* PDISPLAY magic */
+	nv_mask(dev, NV50_PDISPLAY_PIO_CTRL, 0x1, 0x0);
+
+	if (hold_spin)
+		spin_unlock_irqrestore(&dev_priv->context_switch_lock,
+					irq_flags);
+
+	return -EAGAIN;
+}
+
+void
+nv04_pm_unpause(struct drm_device *dev)
+{
+	struct drm_nouveau_private *dev_priv = dev->dev_private;
+	struct nouveau_pm_engine *pm = &dev_priv->engine.pm;
+	unsigned long irq_flags;
+
+	/* Do not allow the card to allocate/destroy a
+	 * new channel while unpausing.
+	 */
+	spin_lock_irqsave(&dev_priv->context_switch_lock, irq_flags);
+
+	if (dev_priv->card_type == NV_40) {
+		nv_wr32(dev, 0xc040, pm->pause_state.reg_c040);
+		nv_wr32(dev, 0xc04c, nv_rd32(dev, 0xc04c));
+	}
+
+	/* Unpause PGRAPH */
+	nv_wr32(dev, NV04_PGRAPH_FIFO, 1);
+
+	/* Unpause pfifo caches */
+	nv_mask(dev, NV04_PFIFO_CACHE1_DMA_PUSH, 0, 0x1);
+	nv04_fifo_cache_pull(dev, true);
+	nv04_fifo_reassign(dev, true);
+
+	/* PDISPLAY magic */
+	nv_mask(dev, NV50_PDISPLAY_PIO_CTRL, 0x1, 0x0);
+
+	/* TODO: De-activated for the moment, it makes things unstable */
+#if 0
+	if (dev_priv->card_type == NV_40) {
+		nv_wr32(dev, 0x1580, nv_rd32(dev, 0x1580));
+		nv_wr32(dev, 0xc044, nv_rd32(dev, 0xc44));
+	}
+#endif
+
+	spin_unlock_irqrestore(&dev_priv->context_switch_lock, irq_flags);
+}
diff --git a/drivers/gpu/drm/nouveau/nv50_pm.c b/drivers/gpu/drm/nouveau/nv50_pm.c
index 7dbb305..535aaf1a 100644
--- a/drivers/gpu/drm/nouveau/nv50_pm.c
+++ b/drivers/gpu/drm/nouveau/nv50_pm.c
@@ -115,6 +115,7 @@ nv50_pm_clock_set(struct drm_device *dev, void *pre_state)
 		nv_wr32(dev, 0x100210, 0);
 		nv_wr32(dev, 0x1002dc, 1);
 	}
+	/* TODO: Tweek 0x4700 before reclocking UNK05 */
 
 	tmp  = nv_rd32(dev, reg + 0) & 0xfff8ffff;
 	tmp |= 0x80000000 | (P << 16);
@@ -129,3 +130,174 @@ nv50_pm_clock_set(struct drm_device *dev, void *pre_state)
 	kfree(state);
 }
 
+int
+nv50_pm_pause(struct drm_device *dev)
+{
+	struct drm_nouveau_private *dev_priv = dev->dev_private;
+	struct nouveau_pm_engine *pm = &dev_priv->engine.pm;
+	unsigned long irq_flags, hold_spin = 0;
+	/* initial guess... */
+	uint32_t mask380 = 0xffffffff;
+	uint32_t mask384 = 0xffffffff;
+	uint32_t mask388 = 0xffffffff;
+	uint32_t mask504 = 0x00000001;
+	uint32_t mask700 = 0x00000001;
+	int i = 0;
+	uint64_t start = nv04_timer_read(dev);
+
+	/* Do not allow the card to allocate/destroy a
+	 * new channel while reclocking.
+	 *
+	 * We try to hold it for the shortest period of time possible
+	 */
+	spin_lock_irqsave(&dev_priv->context_switch_lock, irq_flags);
+	hold_spin = 1;
+
+	/* Don't context switch */
+	nv04_fifo_reassign(dev, false);
+
+	/* PDISPLAY magic */
+	nv_mask(dev, NV50_PDISPLAY_PIO_CTRL, 0x0, 0x1);
+
+	nv_wr32(dev, NV50_PFIFO_FREEZE, 1);
+	if (!nouveau_wait_eq(dev, 100000, NV50_PFIFO_FREEZE, 0x10, 0x10)) {
+		NV_ERROR(dev, "PFIFO freeze failed\n");
+		goto err_pfifo_freeze;
+	}
+
+	/* Wait for PFIFO's DMA_PUSH to deplete */
+	if (!nouveau_wait_eq(dev, 100000, NV04_PFIFO_CACHE1_DMA_PUSH,
+				0x100, 0x100)) {
+		NV_ERROR(dev, "PFIFO DMA_PUSH never depleted (0x%x)\n",
+			nv_rd32(dev, NV04_PFIFO_CACHE1_DMA_PUSH));
+		goto err_pfifo_freeze;
+	}
+
+	/* Pause PFIFO's caches */
+	nv04_fifo_cache_pull(dev, false);
+	nv_mask(dev, NV04_PFIFO_CACHE1_DMA_PUSH, 0x1, 0);
+
+	/* Empty PGRAPH's FIFO */
+	do {
+		/* Un-pause PGRAPH's FIFO (in case it was) */
+		nv_mask(dev, NV50_PGRAPH_CONTROL, 0, 0x1);
+
+		/* Wait for PGRAPH's FIFO to deplete */
+		if (!nouveau_wait_eq(dev, 100000, NV50_PGRAPH_FIFO_STATUS,
+					mask504, 0x1)) {
+			if (nv_rd32(dev, NV04_PGRAPH_STATUS) & 0x100) {
+				NV_ERROR(dev,
+				"PGRAPH: PGRAPH paused while running a ctxprog,"
+				" NV40_PGRAPH_CTXCTL_0310 = 0x%x\n",
+				nv_rd32(dev, NV40_PGRAPH_CTXCTL_0310));
+			}
+
+			goto err_ctx_prog_playing;
+		}
+
+		/* Pause PGRAPH's FIFO */
+		nv_mask(dev, NV50_PGRAPH_CONTROL, 0x1, 0);
+
+		/* Limit the number of loops to 2 */
+		i++;
+		if (i > 1)
+			goto err_pgraph_stop;
+	} while ((nv_rd32(dev, NV50_PGRAPH_FIFO_STATUS) & mask504) == 0);
+
+	/* Now that the PGRAPH's FIFO is paused,
+	 * there is no problem with channel creation.
+	 */
+	spin_unlock_irqrestore(&dev_priv->context_switch_lock, irq_flags);
+	hold_spin = 0;
+
+	/* Wait for PGRAPH engines to stop */
+	if (!nouveau_wait_eq(dev, 100000, 0x400380, mask380, 0x0) ||
+	    !nouveau_wait_eq(dev, 100000, 0x400384, mask384, 0x0) ||
+	    !nouveau_wait_eq(dev, 100000, 0x400388, mask388, 0x0) ||
+	    !nouveau_wait_eq(dev, 500000, NV04_PGRAPH_STATUS, mask700, 0x0)) {
+		/* if you see this message,
+		* mask* above probably need to be adjusted
+		* to not contain the bits you see failing */
+		NV_ERROR(dev,
+		    "PGRAPH: wait for idle fail: %08x %08x %08x %08x %08x!\n",
+		    nv_rd32(dev, 0x400380),
+		    nv_rd32(dev, 0x400384),
+		    nv_rd32(dev, 0x400388),
+		    nv_rd32(dev, NV50_PGRAPH_FIFO_STATUS),
+		    nv_rd32(dev, NV04_PGRAPH_STATUS));
+
+		goto err_pgraph_stop;
+	}
+
+	/* De-activate the PLLs */
+	pm->pause_state.reg_c040 = nv_mask(dev, 0xc040, 0x30, 0x100000);
+
+	NV_DEBUG(dev, "PM.pause took %lluns\n",
+		   (nv04_timer_read(dev) - start));
+
+	return 0;
+
+err_pgraph_stop:
+	nv_mask(dev, NV50_PGRAPH_CONTROL, 0, 0x1);
+
+err_ctx_prog_playing:
+	nv_mask(dev, NV04_PFIFO_CACHE1_DMA_PUSH, 0, 0x1);
+	nv04_fifo_cache_pull(dev, true);
+
+err_pfifo_freeze:
+	nv_wr32(dev, NV50_PFIFO_FREEZE, 0);
+
+	nv_mask(dev, NV50_PDISPLAY_PIO_CTRL, 0x1, 0x0);
+
+	nv04_fifo_reassign(dev, true);
+
+	if (hold_spin)
+		spin_unlock_irqrestore(&dev_priv->context_switch_lock,
+					irq_flags);
+	return -EAGAIN;
+}
+
+void
+nv50_pm_unpause(struct drm_device *dev)
+{
+	struct drm_nouveau_private *dev_priv = dev->dev_private;
+	struct nouveau_pm_engine *pm = &dev_priv->engine.pm;
+	unsigned long irq_flags;
+
+	/* Do not allow the card to allocate/destroy a
+	 * new channel while unpausing.
+	 */
+	spin_lock_irqsave(&dev_priv->context_switch_lock, irq_flags);
+
+	/* Restore the PLL supervisor state */
+	nv_wr32(dev, 0xc040, pm->pause_state.reg_c040);
+	nv_wr32(dev, 0xc04c, 0x10);
+	nv_wr32(dev, 0xc040, pm->pause_state.reg_c040);
+
+	/* Unpause pfifo caches */
+	nv_mask(dev, NV04_PFIFO_CACHE1_DMA_PUSH, 0, 0x1);
+	nv04_fifo_cache_pull(dev, true);
+
+	/* Unpause PGRAPH */
+	nv_mask(dev, NV50_PGRAPH_CONTROL, 0, 0x1);
+
+	/* Un-pause PFIFO */
+	nv_wr32(dev, NV50_PFIFO_FREEZE, 0);
+
+	/* PDISPLAY magic */
+	nv_wr32(dev, 0x616308, 0x10);
+	nv_wr32(dev, 0x616b08, 0x10);
+	nv_mask(dev, NV50_PDISPLAY_PIO_CTRL, 0x1, 0x0);
+
+	/* Re-allow context switch */
+	nv04_fifo_reassign(dev, true);
+
+	/* the blob also clear c040's bit 26 using PMS when the
+	 * performance level is set to 0.
+	 * I haven't seen difference in power consumption, so,
+	 * I leave it for later.
+	 */
+	nv_wr32(dev, 0xc040, pm->pause_state.reg_c040);
+
+	spin_unlock_irqrestore(&dev_priv->context_switch_lock, irq_flags);
+}
-- 
1.7.4.1

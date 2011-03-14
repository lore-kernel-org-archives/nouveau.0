From: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
Subject: Re: [Patch] Yet another version of the card pausing patch
Date: Mon, 14 Mar 2011 01:29:21 +0100
Message-ID: <4D7D6161.4000603@free.fr>
References: <4D3C37BA.6050503@free.fr>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------000303090409000501080801"
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4D3C37BA.6050503-GANU6spQydw@public.gmane.org>
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

This is a multi-part message in MIME format.
--------------000303090409000501080801
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi everyone,

This is another update following to Ben's feedback.

Looking forward to some testing on your side (nv30 -> nva0).

Martin

--------------000303090409000501080801
Content-Type: text/x-patch;
 name="0001-Add-pm.-un-pause-functions.patch"
Content-Disposition: attachment;
 filename="0001-Add-pm.-un-pause-functions.patch"
Content-Transfer-Encoding: quoted-printable

From 84fd9da1e34c1bc863d0274b3928333e4db39a20 Mon Sep 17 00:00:00 2001
From: Martin Peres <martin.peres-Iz16wY1oaNPLSKGbIzaifA@public.gmane.org>
Date: Wed, 19 Jan 2011 10:03:08 +0100
Subject: [PATCH 1/3] Add pm.(un)pause functions

With this patch, cards without internal memory (IONs and other IGPs)
and cards with no memory reclock (a lot of nv40) should support
safe reclocking while gaming.

This should work on all hardware(< nva3), report bugs if it doesn't.

Signed-off-by: Martin Peres <martin.peres-Iz16wY1oaNPLSKGbIzaifA@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_drv.h   |    9 ++
 drivers/gpu/drm/nouveau/nouveau_pm.c    |   24 ++++-
 drivers/gpu/drm/nouveau/nouveau_pm.h    |    4 +
 drivers/gpu/drm/nouveau/nouveau_reg.h   |    3 +
 drivers/gpu/drm/nouveau/nouveau_state.c |   15 +++-
 drivers/gpu/drm/nouveau/nv04_pm.c       |  126 ++++++++++++++++++++++
 drivers/gpu/drm/nouveau/nv50_pm.c       |  172 +++++++++++++++++++++++++=
++++++
 7 files changed, 350 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouv=
eau/nouveau_drv.h
index 0611188..823aee3 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -474,6 +474,10 @@ struct nouveau_pm_memtimings {
 	int nr_timing;
 };
=20
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
=20
+	struct nouveau_pm_pause_card_state pause_state;
+
+	int (*pause)(struct drm_device *);
+	void (*unpause)(struct drm_device *);
+
 	int (*clock_get)(struct drm_device *, u32 id);
 	void *(*clock_pre)(struct drm_device *, struct nouveau_pm_level *,
 			   u32 id, int khz);
diff --git a/drivers/gpu/drm/nouveau/nouveau_pm.c b/drivers/gpu/drm/nouve=
au/nouveau_pm.c
index 4399e2f..e2cde2a 100644
--- a/drivers/gpu/drm/nouveau/nouveau_pm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_pm.c
@@ -45,6 +45,10 @@ nouveau_pm_clock_set(struct drm_device *dev, struct no=
uveau_pm_level *perflvl,
 	if (khz =3D=3D 0)
 		return 0;
=20
+	/* Do no reclock the memory if the frequencies didn't change */
+	if (id =3D=3D PLL_MEMORY && pm->cur->memory =3D=3D khz)
+		return 0;
+
 	pre_state =3D pm->clock_pre(dev, perflvl, id, khz);
 	if (IS_ERR(pre_state))
 		return PTR_ERR(pre_state);
@@ -60,10 +64,13 @@ nouveau_pm_perflvl_set(struct drm_device *dev, struct=
 nouveau_pm_level *perflvl)
 	struct drm_nouveau_private *dev_priv =3D dev->dev_private;
 	struct nouveau_pm_engine *pm =3D &dev_priv->engine.pm;
 	int ret;
+	uint64_t start =3D nv04_timer_read(dev);
=20
 	if (perflvl =3D=3D pm->cur)
 		return 0;
=20
+	NV_INFO(dev, "setting performance level: %s\n", perflvl->name);
+
 	if (pm->voltage.supported && pm->voltage_set && perflvl->voltage) {
 		ret =3D pm->voltage_set(dev, perflvl->voltage);
 		if (ret) {
@@ -72,13 +79,27 @@ nouveau_pm_perflvl_set(struct drm_device *dev, struct=
 nouveau_pm_level *perflvl)
 		}
 	}
=20
+	ret =3D pm->pause(dev);
+	if (ret)
+		return ret;
+
 	nouveau_pm_clock_set(dev, perflvl, PLL_CORE, perflvl->core);
 	nouveau_pm_clock_set(dev, perflvl, PLL_SHADER, perflvl->shader);
 	nouveau_pm_clock_set(dev, perflvl, PLL_MEMORY, perflvl->memory);
 	nouveau_pm_clock_set(dev, perflvl, PLL_UNK05, perflvl->unk05);
=20
+	/* Wait for PLLs to stabilize */
+	udelay(100);
+
 	pm->cur =3D perflvl;
-	return 0;
+	ret =3D 0;
+
+	pm->unpause(dev);
+
+	NV_DEBUG(dev, "Reclocking took %llu=C2=B5s\n",
+		 (nv04_timer_read(dev) - start)/1000);
+
+	return ret;
 }
=20
 static int
@@ -112,7 +133,6 @@ nouveau_pm_profile_set(struct drm_device *dev, const =
char *profile)
 			return -EINVAL;
 	}
=20
-	NV_INFO(dev, "setting performance level: %s\n", profile);
 	return nouveau_pm_perflvl_set(dev, perflvl);
 }
=20
diff --git a/drivers/gpu/drm/nouveau/nouveau_pm.h b/drivers/gpu/drm/nouve=
au/nouveau_pm.h
index 4a9838dd..566f72d 100644
--- a/drivers/gpu/drm/nouveau/nouveau_pm.h
+++ b/drivers/gpu/drm/nouveau/nouveau_pm.h
@@ -51,12 +51,16 @@ int nv04_pm_clock_get(struct drm_device *, u32 id);
 void *nv04_pm_clock_pre(struct drm_device *, struct nouveau_pm_level *,
 			u32 id, int khz);
 void nv04_pm_clock_set(struct drm_device *, void *);
+int nv04_pm_pause(struct drm_device *dev);
+void nv04_pm_unpause(struct drm_device *dev);
=20
 /* nv50_pm.c */
 int nv50_pm_clock_get(struct drm_device *, u32 id);
 void *nv50_pm_clock_pre(struct drm_device *, struct nouveau_pm_level *,
 			u32 id, int khz);
 void nv50_pm_clock_set(struct drm_device *, void *);
+int nv50_pm_pause(struct drm_device *dev);
+void nv50_pm_unpause(struct drm_device *dev);
=20
 /* nva3_pm.c */
 int nva3_pm_clock_get(struct drm_device *, u32 id);
diff --git a/drivers/gpu/drm/nouveau/nouveau_reg.h b/drivers/gpu/drm/nouv=
eau/nouveau_reg.h
index 04e8fb7..5cf817e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_reg.h
+++ b/drivers/gpu/drm/nouveau/nouveau_reg.h
@@ -695,8 +695,11 @@
 #define NV50_PROM__ESIZE                                       0x10000
=20
 #define NV50_PGRAPH                                         0x00400000
+#define NV50_PGRAPH_CONTROL                                 0x00400500
+#define NV50_PGRAPH_FIFO_STATUS                             0x00400504
 #define NV50_PGRAPH__LEN                                           0x1
 #define NV50_PGRAPH__ESIZE                                     0x10000
+#define NV50_PFIFO_FREEZE                                       0x2504
=20
 #define NV50_PDISPLAY                                                0x0=
0610000
 #define NV50_PDISPLAY_OBJECTS                                        0x0=
0610010
diff --git a/drivers/gpu/drm/nouveau/nouveau_state.c b/drivers/gpu/drm/no=
uveau/nouveau_state.c
index 9582165..2a190d4 100644
--- a/drivers/gpu/drm/nouveau/nouveau_state.c
+++ b/drivers/gpu/drm/nouveau/nouveau_state.c
@@ -98,6 +98,8 @@ static int nouveau_init_engine_ptrs(struct drm_device *=
dev)
 		engine->pm.clock_get		=3D nv04_pm_clock_get;
 		engine->pm.clock_pre		=3D nv04_pm_clock_pre;
 		engine->pm.clock_set		=3D nv04_pm_clock_set;
+		engine->pm.pause		=3D nv04_pm_pause;
+		engine->pm.unpause		=3D nv04_pm_unpause;
 		engine->crypt.init		=3D nouveau_stub_init;
 		engine->crypt.takedown		=3D nouveau_stub_takedown;
 		engine->vram.init		=3D nouveau_mem_detect;
@@ -157,6 +159,8 @@ static int nouveau_init_engine_ptrs(struct drm_device=
 *dev)
 		engine->pm.clock_get		=3D nv04_pm_clock_get;
 		engine->pm.clock_pre		=3D nv04_pm_clock_pre;
 		engine->pm.clock_set		=3D nv04_pm_clock_set;
+		engine->pm.pause		=3D nv04_pm_pause;
+		engine->pm.unpause		=3D nv04_pm_unpause;
 		engine->crypt.init		=3D nouveau_stub_init;
 		engine->crypt.takedown		=3D nouveau_stub_takedown;
 		engine->vram.init		=3D nouveau_mem_detect;
@@ -216,6 +220,8 @@ static int nouveau_init_engine_ptrs(struct drm_device=
 *dev)
 		engine->pm.clock_get		=3D nv04_pm_clock_get;
 		engine->pm.clock_pre		=3D nv04_pm_clock_pre;
 		engine->pm.clock_set		=3D nv04_pm_clock_set;
+		engine->pm.pause		=3D nv04_pm_pause;
+		engine->pm.unpause		=3D nv04_pm_unpause;
 		engine->crypt.init		=3D nouveau_stub_init;
 		engine->crypt.takedown		=3D nouveau_stub_takedown;
 		engine->vram.init		=3D nouveau_mem_detect;
@@ -277,6 +283,8 @@ static int nouveau_init_engine_ptrs(struct drm_device=
 *dev)
 		engine->pm.clock_set		=3D nv04_pm_clock_set;
 		engine->pm.voltage_get		=3D nouveau_voltage_gpio_get;
 		engine->pm.voltage_set		=3D nouveau_voltage_gpio_set;
+		engine->pm.pause		=3D nv04_pm_pause;
+		engine->pm.unpause		=3D nv04_pm_unpause;
 		engine->crypt.init		=3D nouveau_stub_init;
 		engine->crypt.takedown		=3D nouveau_stub_takedown;
 		engine->vram.init		=3D nouveau_mem_detect;
@@ -340,6 +348,8 @@ static int nouveau_init_engine_ptrs(struct drm_device=
 *dev)
 		engine->pm.voltage_get		=3D nouveau_voltage_gpio_get;
 		engine->pm.voltage_set		=3D nouveau_voltage_gpio_set;
 		engine->pm.temp_get		=3D nv40_temp_get;
+		engine->pm.pause		=3D nv04_pm_pause;
+		engine->pm.unpause		=3D nv04_pm_unpause;
 		engine->crypt.init		=3D nouveau_stub_init;
 		engine->crypt.takedown		=3D nouveau_stub_takedown;
 		engine->vram.init		=3D nouveau_mem_detect;
@@ -432,6 +442,8 @@ static int nouveau_init_engine_ptrs(struct drm_device=
 *dev)
 		}
 		engine->pm.voltage_get		=3D nouveau_voltage_gpio_get;
 		engine->pm.voltage_set		=3D nouveau_voltage_gpio_set;
+		engine->pm.pause		=3D nv50_pm_pause;
+		engine->pm.unpause		=3D nv50_pm_unpause;
 		if (dev_priv->chipset >=3D 0x84)
 			engine->pm.temp_get	=3D nv84_temp_get;
 		else
@@ -507,6 +519,8 @@ static int nouveau_init_engine_ptrs(struct drm_device=
 *dev)
 		engine->gpio.irq_register	=3D nv50_gpio_irq_register;
 		engine->gpio.irq_unregister	=3D nv50_gpio_irq_unregister;
 		engine->gpio.irq_enable		=3D nv50_gpio_irq_enable;
+		engine->pm.pause		=3D nv04_pm_pause;
+		engine->pm.unpause		=3D nv04_pm_unpause;
 		engine->crypt.init		=3D nouveau_stub_init;
 		engine->crypt.takedown		=3D nouveau_stub_takedown;
 		engine->vram.init		=3D nvc0_vram_init;
@@ -1169,4 +1183,3 @@ bool nouveau_wait_for_idle(struct drm_device *dev)
=20
 	return true;
 }
-
diff --git a/drivers/gpu/drm/nouveau/nv04_pm.c b/drivers/gpu/drm/nouveau/=
nv04_pm.c
index eb1c70d..6189321 100644
--- a/drivers/gpu/drm/nouveau/nv04_pm.c
+++ b/drivers/gpu/drm/nouveau/nv04_pm.c
@@ -88,3 +88,129 @@ nv04_pm_clock_set(struct drm_device *dev, void *pre_s=
tate)
 	kfree(state);
 }
=20
+int
+nv04_pm_pause(struct drm_device *dev)
+{
+	struct drm_nouveau_private *dev_priv =3D dev->dev_private;
+	struct nouveau_pm_engine *pm =3D &dev_priv->engine.pm;
+	unsigned long irq_flags, hold_spin =3D 0;
+	/* initial guess... */
+	uint32_t mask300 =3D 0xffffffff;
+	uint32_t mask700 =3D 0xffffbfff;
+	uint64_t start =3D nv04_timer_read(dev);
+
+	/* Do not allow the card to allocate/destroy a
+	 * new channel while reclocking.
+	 *
+	 * We try to hold it for the shortest period of time possible
+	 */
+	spin_lock_irqsave(&dev_priv->context_switch_lock, irq_flags);
+	hold_spin =3D 1;
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
+	hold_spin =3D 0;
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
+	if (dev_priv->card_type =3D=3D NV_40)
+		pm->pause_state.reg_c040 =3D nv_mask(dev, 0xc040, 0x333, 0);
+
+	NV_DEBUG(dev, "PM.pause took %llu=C2=B5s\n",
+		(nv04_timer_read(dev) - start)/1000);
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
+	struct drm_nouveau_private *dev_priv =3D dev->dev_private;
+	struct nouveau_pm_engine *pm =3D &dev_priv->engine.pm;
+	unsigned long irq_flags;
+
+	/* Do not allow the card to allocate/destroy a
+	 * new channel while unpausing.
+	 */
+	spin_lock_irqsave(&dev_priv->context_switch_lock, irq_flags);
+
+	if (dev_priv->card_type =3D=3D NV_40) {
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
+	if (dev_priv->card_type =3D=3D NV_40) {
+		nv_wr32(dev, 0x1580, nv_rd32(dev, 0x1580));
+		nv_wr32(dev, 0xc044, nv_rd32(dev, 0xc44));
+	}
+#endif
+
+	spin_unlock_irqrestore(&dev_priv->context_switch_lock, irq_flags);
+}
diff --git a/drivers/gpu/drm/nouveau/nv50_pm.c b/drivers/gpu/drm/nouveau/=
nv50_pm.c
index 7dbb305..a0d9d08 100644
--- a/drivers/gpu/drm/nouveau/nv50_pm.c
+++ b/drivers/gpu/drm/nouveau/nv50_pm.c
@@ -115,6 +115,7 @@ nv50_pm_clock_set(struct drm_device *dev, void *pre_s=
tate)
 		nv_wr32(dev, 0x100210, 0);
 		nv_wr32(dev, 0x1002dc, 1);
 	}
+	/* TODO: Tweek 0x4700 before reclocking UNK05 */
=20
 	tmp  =3D nv_rd32(dev, reg + 0) & 0xfff8ffff;
 	tmp |=3D 0x80000000 | (P << 16);
@@ -129,3 +130,174 @@ nv50_pm_clock_set(struct drm_device *dev, void *pre=
_state)
 	kfree(state);
 }
=20
+int
+nv50_pm_pause(struct drm_device *dev)
+{
+	struct drm_nouveau_private *dev_priv =3D dev->dev_private;
+	struct nouveau_pm_engine *pm =3D &dev_priv->engine.pm;
+	unsigned long irq_flags, hold_spin =3D 0;
+	/* initial guess... */
+	uint32_t mask380 =3D 0xffffffff;
+	uint32_t mask384 =3D 0xffffffff;
+	uint32_t mask388 =3D 0xffffffff;
+	uint32_t mask504 =3D 0x00000001;
+	uint32_t mask700 =3D 0x00000001;
+	int i =3D 0;
+	uint64_t start =3D nv04_timer_read(dev);
+
+	/* Do not allow the card to allocate/destroy a
+	 * new channel while reclocking.
+	 *
+	 * We try to hold it for the shortest period of time possible
+	 */
+	spin_lock_irqsave(&dev_priv->context_switch_lock, irq_flags);
+	hold_spin =3D 1;
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
+				" NV40_PGRAPH_CTXCTL_0310 =3D 0x%x\n",
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
+	} while ((nv_rd32(dev, NV50_PGRAPH_FIFO_STATUS) & mask504) =3D=3D 0);
+
+	/* Now that the PGRAPH's FIFO is paused,
+	 * there is no problem with channel creation.
+	 */
+	spin_unlock_irqrestore(&dev_priv->context_switch_lock, irq_flags);
+	hold_spin =3D 0;
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
+	pm->pause_state.reg_c040 =3D nv_mask(dev, 0xc040, 0x30, 0x100000);
+
+	NV_DEBUG(dev, "PM.pause took %llu=C2=B5s\n",
+		   (nv04_timer_read(dev) - start)/1000);
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
+	struct drm_nouveau_private *dev_priv =3D dev->dev_private;
+	struct nouveau_pm_engine *pm =3D &dev_priv->engine.pm;
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
--=20
1.7.4.1


--------------000303090409000501080801
Content-Type: text/x-patch;
 name="0002-Don-t-forget-to-name-the-boot-perflvl-boot.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0002-Don-t-forget-to-name-the-boot-perflvl-boot.patch"

From de7bd5e2a8cdbc4c033ed04b907c9e6f24fe1d5d Mon Sep 17 00:00:00 2001
From: Martin Peres <martin.peres-Iz16wY1oaNPLSKGbIzaifA@public.gmane.org>
Date: Thu, 3 Feb 2011 00:51:00 +0100
Subject: [PATCH 2/3] Don't forget to name the boot perflvl "boot"

---
 drivers/gpu/drm/nouveau/nouveau_pm.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_pm.c b/drivers/gpu/drm/nouveau/nouveau_pm.c
index e2cde2a..dfb9288 100644
--- a/drivers/gpu/drm/nouveau/nouveau_pm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_pm.c
@@ -510,6 +510,7 @@ nouveau_pm_init(struct drm_device *dev)
 	/* determine current ("boot") performance level */
 	ret = nouveau_pm_perflvl_get(dev, &pm->boot);
 	if (ret == 0) {
+		strcpy(pm->boot.name, "boot");
 		pm->cur = &pm->boot;
 
 		nouveau_pm_perflvl_info(&pm->boot, info, sizeof(info));
-- 
1.7.4.1


--------------000303090409000501080801
Content-Type: text/x-patch;
 name="0003-Reclock-memory-using-PMS-on-nv50.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0003-Reclock-memory-using-PMS-on-nv50.patch"

From c32d7435fa4d0a3107a1d3b63717435d0fca1e2d Mon Sep 17 00:00:00 2001
From: Martin Peres <martin.peres-Iz16wY1oaNPLSKGbIzaifA@public.gmane.org>
Date: Mon, 7 Feb 2011 00:18:26 +0100
Subject: [PATCH 3/3] Reclock memory using PMS on nv50

Signed-off-by: Martin Peres <martin.peres-Iz16wY1oaNPLSKGbIzaifA@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_pms.h |   98 +++++++++++++++++++++++++
 drivers/gpu/drm/nouveau/nv50_pm.c     |  127 +++++++++++++++++++++++++++++----
 2 files changed, 212 insertions(+), 13 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/nouveau_pms.h

diff --git a/drivers/gpu/drm/nouveau/nouveau_pms.h b/drivers/gpu/drm/nouveau/nouveau_pms.h
new file mode 100644
index 0000000..6e9f2ca
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nouveau_pms.h
@@ -0,0 +1,98 @@
+/*
+ * Copyright 2010 Red Hat Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * Authors: Ben Skeggs
+ */
+
+#ifndef __NOUVEAU_PMS_H__
+#define __NOUVEAU_PMS_H__
+
+struct pms_ucode {
+	u8 data[256];
+	union {
+		u8  *u08;
+		u16 *u16;
+		u32 *u32;
+	} ptr;
+	u16 len;
+
+	u32 reg;
+	u32 val;
+};
+
+static inline void
+pms_init(struct pms_ucode *pms)
+{
+	pms->ptr.u08 = pms->data;
+	pms->reg = 0xffffffff;
+	pms->val = 0xffffffff;
+}
+
+static inline void
+pms_fini(struct pms_ucode *pms)
+{
+	do {
+		*pms->ptr.u08++ = 0x7f;
+		pms->len = pms->ptr.u08 - pms->data;
+	} while (pms->len & 3);
+	pms->ptr.u08 = pms->data;
+}
+
+static inline void
+pms_unkn(struct pms_ucode *pms, u8 v0)
+{
+	*pms->ptr.u08++ = v0;
+}
+
+static inline void
+pms_op5f(struct pms_ucode *pms, u8 v0, u8 v1)
+{
+	*pms->ptr.u08++ = 0x5f;
+	*pms->ptr.u08++ = v0;
+	*pms->ptr.u08++ = v1;
+}
+
+static inline void
+pms_wr32(struct pms_ucode *pms, u32 reg, u32 val)
+{
+	if (val != pms->val) {
+		if ((val & 0xffff0000) == (pms->val & 0xffff0000)) {
+			*pms->ptr.u08++ = 0x42;
+			*pms->ptr.u16++ = (val & 0x0000ffff);
+		} else {
+			*pms->ptr.u08++ = 0xe2;
+			*pms->ptr.u32++ = val;
+		}
+
+		pms->val = val;
+	}
+
+	if ((reg & 0xffff0000) == (pms->reg & 0xffff0000)) {
+		*pms->ptr.u08++ = 0x40;
+		*pms->ptr.u16++ = (reg & 0x0000ffff);
+	} else {
+		*pms->ptr.u08++ = 0xe0;
+		*pms->ptr.u32++ = reg;
+	}
+	pms->reg = reg;
+}
+
+#endif
\ No newline at end of file
diff --git a/drivers/gpu/drm/nouveau/nv50_pm.c b/drivers/gpu/drm/nouveau/nv50_pm.c
index a0d9d08..e28f939 100644
--- a/drivers/gpu/drm/nouveau/nv50_pm.c
+++ b/drivers/gpu/drm/nouveau/nv50_pm.c
@@ -26,9 +26,11 @@
 #include "nouveau_drv.h"
 #include "nouveau_bios.h"
 #include "nouveau_pm.h"
+#include "nouveau_pms.h"
 
 struct nv50_pm_state {
 	struct nouveau_pm_level *perflvl;
+	struct pms_ucode ucode;
 	struct pll_lims pll;
 	enum pll_types type;
 	int N, M, P;
@@ -58,14 +60,20 @@ void *
 nv50_pm_clock_pre(struct drm_device *dev, struct nouveau_pm_level *perflvl,
 		  u32 id, int khz)
 {
+	struct drm_nouveau_private *dev_priv = dev->dev_private;
 	struct nv50_pm_state *state;
-	int dummy, ret;
+	struct pms_ucode *pms;
+	u32 reg0_old, reg0_new;
+	u32 crtc_mask;
+	u32 reg_c040;
+	int ret, dummy, i;
 
 	state = kzalloc(sizeof(*state), GFP_KERNEL);
 	if (!state)
 		return ERR_PTR(-ENOMEM);
 	state->type = id;
 	state->perflvl = perflvl;
+	pms = &state->ucode;
 
 	ret = get_pll_limits(dev, id, &state->pll);
 	if (ret < 0) {
@@ -80,20 +88,79 @@ nv50_pm_clock_pre(struct drm_device *dev, struct nouveau_pm_level *perflvl,
 		return ERR_PTR(ret);
 	}
 
+	reg0_old = nv_rd32(dev, state->pll.reg + 0);
+	reg0_new = 0x80000000 | (state->P << 16) | (reg0_old & 0xfff8ffff);
+
+	reg_c040 = nv_rd32(dev, 0xc040);
+
+	crtc_mask = 0;
+	for (i = 0; i < 2; i++) {
+		if (nv_rd32(dev, NV50_PDISPLAY_CRTC_C(i, CLOCK)))
+			crtc_mask |= (1 << i);
+	}
+
+	pms_init(pms);
+
+	switch (state->type) {
+	case PLL_MEMORY:
+		/* Wait for vblank on all the CRTCs */
+		if (crtc_mask) {
+			pms_op5f(pms, crtc_mask, 0x00);
+			pms_op5f(pms, crtc_mask, 0x01);
+		}
+
+		pms_unkn(pms, 0x06); /* unknown */
+		pms_unkn(pms, 0xb0); /* Disable bus access */
+
+		pms_wr32(pms, 0x100210, 0x00000000);
+		pms_wr32(pms, 0x1002dc, 0x00000001);
+		pms_wr32(pms, state->pll.reg + 0, reg0_old | 0x00000200);
+		pms_wr32(pms, state->pll.reg + 4, (state->N << 8) | state->M);
+		pms_wr32(pms, state->pll.reg + 0, reg0_new | 0x00000200);
+		pms_wr32(pms, state->pll.reg + 0, reg0_new);
+		pms_wr32(pms, 0x1002dc, 0x00000000);
+		pms_wr32(pms, 0x100210, 0x80000000);
+		pms_unkn(pms, 0x07); /* unknown */
+
+		pms_unkn(pms, 0xd0); /* Enable bus access again */
+		break;
+	default:
+		pms_unkn(pms, 0xb0); // Disable bus access
+
+		pms_wr32(pms, 0xc040, (reg_c040 & ~(1 << 5 | 1 << 4)) | (1 << 20));
+		pms_wr32(pms, state->pll.reg + 0, reg0_new);
+		pms_wr32(pms, state->pll.reg + 4, (state->N << 8) | state->M);
+		pms_unkn(pms, 0x0e);
+
+		pms_wr32(pms, 0xc040, reg_c040);
+		pms_wr32(pms, 0xc040, 0x10);
+
+		pms_wr32(pms, 0xc040, reg_c040);
+
+		pms_unkn(pms, 0xd0); /* Enable bus access again */
+		break;
+	}
+	pms_fini(pms);
+
 	return state;
 }
 
 void
 nv50_pm_clock_set(struct drm_device *dev, void *pre_state)
 {
+	struct drm_nouveau_private *dev_priv = dev->dev_private;
 	struct nv50_pm_state *state = pre_state;
 	struct nouveau_pm_level *perflvl = state->perflvl;
-	u32 reg = state->pll.reg, tmp;
+	struct pms_ucode *pms = &state->ucode;
 	struct bit_entry BIT_M;
+	u32 pbus1098, r100b0c, r619f00;
+	u32 pms_data, pms_kick;
 	u16 script;
+	u32 reg = state->pll.reg, tmp;
 	int N = state->N;
 	int M = state->M;
 	int P = state->P;
+	int i;
 
 	if (state->type == PLL_MEMORY && perflvl->memscript &&
 	    bit_table(dev, 'M', &BIT_M) == 0 &&
@@ -111,20 +178,54 @@ nv50_pm_clock_set(struct drm_device *dev, void *pre_state)
 		nouveau_bios_run_init_table(dev, perflvl->memscript, NULL);
 	}
 
+	/* only use PMS for changing the memory clocks */
 	if (state->type == PLL_MEMORY) {
-		nv_wr32(dev, 0x100210, 0);
-		nv_wr32(dev, 0x1002dc, 1);
-	}
-	/* TODO: Tweek 0x4700 before reclocking UNK05 */
-
-	tmp  = nv_rd32(dev, reg + 0) & 0xfff8ffff;
-	tmp |= 0x80000000 | (P << 16);
-	nv_wr32(dev, reg + 0, tmp);
-	nv_wr32(dev, reg + 4, (N << 8) | M);
+		if (dev_priv->chipset < 0x90) {
+			pms_data = 0x001400;
+			pms_kick = 0x00000003;
+		} else {
+			pms_data = 0x080000;
+			pms_kick = 0x00000001;
+		}
 
-	if (state->type == PLL_MEMORY) {
-		nv_wr32(dev, 0x1002dc, 0);
-		nv_wr32(dev, 0x100210, 0x80000000);
+		/* upload ucode */
+		pbus1098 = nv_mask(dev, 0x001098, 0x00000008, 0x00000000);
+		nv_wr32(dev, 0x001304, 0x00000000);
+		for (i = 0; i < pms->len / 4; i++)
+			nv_wr32(dev, pms_data + (i * 4), pms->ptr.u32[i]);
+		nv_wr32(dev, 0x001098, pbus1098 | 0x18);
+
+		nv_mask(dev, 0x616308, 0x00000000, 0x00000010);
+		nv_mask(dev, 0x616b08, 0x00000000, 0x00000010);
+
+		/* and run it! there's some pre and post script operations that
+		* nvidia do too, need to figure those out
+		*/
+		nv_mask(dev, 0x100200, 0x00000800, 0x00000000);
+		r100b0c = nv_mask(dev, 0x100b0c, 0x000000ff, 0x00000012);
+		r619f00 = nv_mask(dev, 0x619f00, 0x00000008, 0x00000000);
+		nv_wr32(dev, 0x00130c, pms_kick);
+		if (!nv_wait(dev, 0x001308, 0x00000100, 0x00000000)) {
+			NV_ERROR(dev, "pms ucode exec timed out\n");
+			NV_ERROR(dev, "0x001308: 0x%08x\n", nv_rd32(dev, 0x001308));
+			for (i = 0; i < pms->len / 4; i++) {
+				NV_ERROR(dev, "0x%06x: 0x%08x\n", 0x1400 + (i * 4),
+					nv_rd32(dev, 0x001400 + (i * 4)));
+			}
+		}
+		nv_wr32(dev, 0x619f00, r619f00);
+		nv_wr32(dev, 0x100b0c, r100b0c);
+		nv_mask(dev, 0x616308, 0x00000000, 0x00000010);
+		nv_mask(dev, 0x616b08, 0x00000000, 0x00000010);
+		nv_mask(dev, 0x100200, 0x00000000, 0x00000800);
+
+	} else {
+		/* TODO: Tweek 0x4700 before reclocking UNK05 */
+
+		tmp  = nv_rd32(dev, reg + 0) & 0xfff8ffff;
+		tmp |= 0x80000000 | (P << 16);
+		nv_wr32(dev, reg + 0, tmp);
+		nv_wr32(dev, reg + 4, (N << 8) | M);
 	}
 
 	kfree(state);
-- 
1.7.4.1


--------------000303090409000501080801
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--------------000303090409000501080801--

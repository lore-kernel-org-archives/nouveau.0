From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: [PATCH 6/6] drm/nouveau: use MSI interrupts
Date: Wed, 28 Aug 2013 02:00:50 +0200
Message-ID: <1377648050-6649-7-git-send-email-dev@lynxeye.de>
References: <1377648050-6649-1-git-send-email-dev@lynxeye.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1377648050-6649-1-git-send-email-dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
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
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

MSIs were only problematic on some old, broken chipsets. But now that we
already see systems where PCI legacy interrupts are somewhat flaky, it's
really time to move to MSIs.

Signed-off-by: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
---
 drivers/gpu/drm/nouveau/core/include/subdev/mc.h |  1 +
 drivers/gpu/drm/nouveau/core/subdev/mc/base.c    | 17 +++++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/core/include/subdev/mc.h b/drivers/gpu/drm/nouveau/core/include/subdev/mc.h
index 9d2cd20..ce6569f 100644
--- a/drivers/gpu/drm/nouveau/core/include/subdev/mc.h
+++ b/drivers/gpu/drm/nouveau/core/include/subdev/mc.h
@@ -12,6 +12,7 @@ struct nouveau_mc_intr {
 struct nouveau_mc {
 	struct nouveau_subdev base;
 	const struct nouveau_mc_intr *intr_map;
+	bool use_msi;
 };
 
 static inline struct nouveau_mc *
diff --git a/drivers/gpu/drm/nouveau/core/subdev/mc/base.c b/drivers/gpu/drm/nouveau/core/subdev/mc/base.c
index ec9cd6f..02b337e 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/mc/base.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/mc/base.c
@@ -23,6 +23,7 @@
  */
 
 #include <subdev/mc.h>
+#include <core/option.h>
 
 static irqreturn_t
 nouveau_mc_intr(int irq, void *arg)
@@ -43,6 +44,9 @@ nouveau_mc_intr(int irq, void *arg)
 		map++;
 	}
 
+	if (pmc->use_msi)
+		nv_wr08(pmc->base.base.parent, 0x00088068, 0xff);
+
 	if (intr) {
 		nv_error(pmc, "unknown intr 0x%08x\n", stat);
 	}
@@ -75,6 +79,8 @@ _nouveau_mc_dtor(struct nouveau_object *object)
 	struct nouveau_device *device = nv_device(object);
 	struct nouveau_mc *pmc = (void *)object;
 	free_irq(device->pdev->irq, pmc);
+	if (pmc->use_msi)
+		pci_disable_msi(device->pdev);
 	nouveau_subdev_destroy(&pmc->base);
 }
 
@@ -96,6 +102,17 @@ nouveau_mc_create_(struct nouveau_object *parent, struct nouveau_object *engine,
 
 	pmc->intr_map = intr_map;
 
+	pmc->use_msi = nouveau_boolopt(device->cfgopt, "NvMSI", true);
+	if (pmc->use_msi) {
+		ret = pci_enable_msi(device->pdev);
+		if (ret) {
+			pmc->use_msi = false;
+		} else {
+			nv_wr08(device, 0x00088068, 0xff);
+			nv_info(pmc, "MSI interrupts enabled\n");
+		}
+	}
+
 	ret = request_irq(device->pdev->irq, nouveau_mc_intr,
 			  IRQF_SHARED, "nouveau", pmc);
 	if (ret < 0)
-- 
1.8.3.1

From: Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Subject: [PATCH 2/3] nouveau: add software methods to e0
Date: Fri, 27 Jul 2012 14:19:20 +0200
Message-ID: <50128748.1090700@canonical.com>
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
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

In this case, no class is available but the bind methods is sent too,
so use it to keep track of what channel is 'bound' and find the
software class id from it.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
---
calim can I get a tested-by?

 drivers/gpu/drm/nouveau/nouveau_software.h |    1 +
 drivers/gpu/drm/nouveau/nvc0_software.c    |   35 ++++++++++++++++++++++++++++
 drivers/gpu/drm/nouveau/nve0_fifo.c        |    5 ++++
 3 files changed, 41 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_software.h b/drivers/gpu/drm/nouveau/nouveau_software.h
index 2fb8c27..4c17291 100644
--- a/drivers/gpu/drm/nouveau/nouveau_software.h
+++ b/drivers/gpu/drm/nouveau/nouveau_software.h
@@ -53,5 +53,6 @@ int nv50_software_create(struct drm_device *);
 int nvc0_software_create(struct drm_device *);
 u64 nvc0_software_crtc(struct nouveau_channel *, int crtc);
 bool nvc0_software_method(struct drm_device *, u32, u32, u32, u32);
+bool nve0_software_method(struct drm_device *, u32, u32, u32, u32);
 
 #endif
diff --git a/drivers/gpu/drm/nouveau/nvc0_software.c b/drivers/gpu/drm/nouveau/nvc0_software.c
index a029de5..4fd14cf 100644
--- a/drivers/gpu/drm/nouveau/nvc0_software.c
+++ b/drivers/gpu/drm/nouveau/nvc0_software.c
@@ -38,6 +38,7 @@ struct nvc0_software_priv {
 struct nvc0_software_chan {
 	struct nouveau_software_chan base;
 	struct nouveau_vma dispc_vma[4];
+	u32 class[8];
 };
 
 u64
@@ -67,6 +68,40 @@ nvc0_software_method(struct drm_device *dev, u32 chid, u32 class, u32 mthd, u32
 	return handled;
 }
 
+bool
+nve0_software_method(struct drm_device *dev, u32 chid, u32 subc, u32 mthd, u32 data)
+{
+	struct nouveau_fifo_priv *pfifo = nv_engine(dev, NVOBJ_ENGINE_FIFO);
+	struct drm_nouveau_private *dev_priv = dev->dev_private;
+	struct nvc0_software_chan *pch;
+	struct nouveau_channel *chan;
+	unsigned long flags;
+	bool handled = false;
+
+	spin_lock_irqsave(&dev_priv->channels.lock, flags);
+	if (chid >= pfifo->channels || !(chan = dev_priv->channels.ptr[chid]))
+		goto out;
+
+	pch = chan->engctx[NVOBJ_ENGINE_SW];
+	if (!mthd) {
+		if (data && data != 0x906e)
+			goto out;
+
+		handled = true;
+		pch->class[subc] = data;
+	} else {
+		u32 class = pch->class[subc];
+		if (!class)
+			goto out;
+
+		handled = !nouveau_gpuobj_mthd_call(chan, class, mthd, data);
+	}
+
+out:
+	spin_unlock_irqrestore(&dev_priv->channels.lock, flags);
+	return handled;
+}
+
 static int
 nvc0_software_context_new(struct nouveau_channel *chan, int engine)
 {
diff --git a/drivers/gpu/drm/nouveau/nve0_fifo.c b/drivers/gpu/drm/nouveau/nve0_fifo.c
index e98d144..a007489 100644
--- a/drivers/gpu/drm/nouveau/nve0_fifo.c
+++ b/drivers/gpu/drm/nouveau/nve0_fifo.c
@@ -27,6 +27,7 @@
 #include "nouveau_drv.h"
 #include "nouveau_mm.h"
 #include "nouveau_fifo.h"
+#include "nouveau_software.h"
 
 #define NVE0_FIFO_ENGINE_NUM 32
 
@@ -331,6 +332,10 @@ nve0_fifo_isr_subfifo_intr(struct drm_device *dev, int unit)
 		}
 	}
 
+	if (stat & 0x00800000 &&
+	    nve0_software_method(dev, chid, subc, mthd, data))
+		show &= ~0x00800000;
+
 	if (show) {
 		NV_INFO(dev, "PFIFO%d:", unit);
 		nouveau_bitfield_print(nve0_fifo_subfifo_intr, show);

From: Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Subject: [PATCH 1/3] nouveau: add software methods to c0
Date: Fri, 27 Jul 2012 14:16:38 +0200
Message-ID: <501286A6.7030004@canonical.com>
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

Handle the INVALID_CLASS error that happens when you try
to execute software commands.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
---

 drivers/gpu/drm/nouveau/nouveau_software.h |    1 +
 drivers/gpu/drm/nouveau/nvc0_graph.c       |    9 ++++++---
 drivers/gpu/drm/nouveau/nvc0_software.c    |   21 +++++++++++++++++++++
 3 files changed, 28 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_software.h b/drivers/gpu/drm/nouveau/nouveau_software.h
index 709e5ac..2fb8c27 100644
--- a/drivers/gpu/drm/nouveau/nouveau_software.h
+++ b/drivers/gpu/drm/nouveau/nouveau_software.h
@@ -52,5 +52,6 @@ int nv04_software_create(struct drm_device *);
 int nv50_software_create(struct drm_device *);
 int nvc0_software_create(struct drm_device *);
 u64 nvc0_software_crtc(struct nouveau_channel *, int crtc);
+bool nvc0_software_method(struct drm_device *, u32, u32, u32, u32);
 
 #endif
diff --git a/drivers/gpu/drm/nouveau/nvc0_graph.c b/drivers/gpu/drm/nouveau/nvc0_graph.c
index 2a01e6e..a929888 100644
--- a/drivers/gpu/drm/nouveau/nvc0_graph.c
+++ b/drivers/gpu/drm/nouveau/nvc0_graph.c
@@ -30,6 +30,7 @@
 #include "nouveau_drv.h"
 #include "nouveau_mm.h"
 #include "nouveau_fifo.h"
+#include "nouveau_software.h"
 
 #include "nvc0_graph.h"
 #include "nvc0_grhub.fuc.h"
@@ -681,9 +682,11 @@ nvc0_graph_isr(struct drm_device *dev)
 	}
 
 	if (stat & 0x00000020) {
-		NV_INFO(dev, "PGRAPH: ILLEGAL_CLASS ch %d [0x%010llx] subc %d "
-			     "class 0x%04x mthd 0x%04x data 0x%08x\n",
-			chid, inst, subc, class, mthd, data);
+		if (class != 0x906e ||
+		    !nvc0_software_method(dev, chid, class, mthd, data))
+			NV_INFO(dev, "PGRAPH: ILLEGAL_CLASS ch %d [0x%010llx]"
+				"subc %d class 0x%04x mthd 0x%04x data 0x%08x"
+				"\n", chid, inst, subc, class, mthd, data);
 		nv_wr32(dev, 0x400100, 0x00000020);
 		stat &= ~0x00000020;
 	}
diff --git a/drivers/gpu/drm/nouveau/nvc0_software.c b/drivers/gpu/drm/nouveau/nvc0_software.c
index 93e8c16..a029de5 100644
--- a/drivers/gpu/drm/nouveau/nvc0_software.c
+++ b/drivers/gpu/drm/nouveau/nvc0_software.c
@@ -27,6 +27,7 @@
 #include "nouveau_drv.h"
 #include "nouveau_ramht.h"
 #include "nouveau_software.h"
+#include "nouveau_fifo.h"
 
 #include "nv50_display.h"
 
@@ -46,6 +47,26 @@ nvc0_software_crtc(struct nouveau_channel *chan, int crtc)
 	return pch->dispc_vma[crtc].offset;
 }
 
+bool
+nvc0_software_method(struct drm_device *dev, u32 chid, u32 class, u32 mthd, u32 data)
+{
+	struct nouveau_fifo_priv *pfifo = nv_engine(dev, NVOBJ_ENGINE_FIFO);
+	struct drm_nouveau_private *dev_priv = dev->dev_private;
+	struct nouveau_channel *chan = NULL;
+	unsigned long flags;
+	bool handled = false;
+
+	spin_lock_irqsave(&dev_priv->channels.lock, flags);
+	if (chid < pfifo->channels)
+		chan = dev_priv->channels.ptr[chid];
+
+	if (chan)
+		handled = !nouveau_gpuobj_mthd_call(chan, class, mthd, data);
+
+	spin_unlock_irqrestore(&dev_priv->channels.lock, flags);
+	return handled;
+}
+
 static int
 nvc0_software_context_new(struct nouveau_channel *chan, int engine)
 {

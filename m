From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: [RFC] drm/nouveau: optimize code emission of inline
	functions
Date: Mon, 10 Aug 2009 20:40:25 +0300
Message-ID: <20090810204025.66a72124@iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.orgnouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: dri-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
List-Id: nouveau.vger.kernel.org

From 8fb4fecbdf912abdde82bfff40443c9a57c32e26 Mon Sep 17 00:00:00 2001
From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Date: Mon, 10 Aug 2009 19:44:58 +0300
Subject: [PATCH] drm/nouveau: optimize code emission of inline functions

When a call into a static inline function cannot be inlined, the
function is emitted as a regular function into the object file. When
object files are linked in a kernel module file *.ko, it may end up
containing multiple copies of the same static inline function. For
instance, the non-inlined functions nv_rd32 and nv_wr32 have almost
30 copies in nouveau.ko.

This patch moves some inline functions from nouveau_drv.h into a
separate header nouveau_inlines.h, and changes the 'static inline' into
'extern inline'. Gcc uses the extern inline definitions for function
inlining, and otherwise generates a call to an external symbol. The
external symbols need to be defined once, this is done in nouveau_drv.c
by including nouveau_inlines.h the second time, omitting the 'extern
inline' specifiers.

The end result is reduction in code size, as the non-inlined function
definitions are emitted only once.

Signed-off-by: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
---

Before this patch:

$ objdump -t nouveau.ko --section=.text | cut -f2 | sort -k2 | uniq -d -c
      4 
      9 0000000000000010 BEGIN_RING
      5 0000000000000051 FIRE_RING
      2 00000000000000b3 NVLockVgaCrtcs
      4 000000000000008b NVReadVgaCrtc
      2 000000000000008c NVReadVgaCrtc
      2 0000000000000011 NVVgaSeqReset
      2 000000000000006b NVWriteCRTC
      2 0000000000000066 NVWriteRAMDAC
      4 0000000000000081 NVWriteVgaCrtc
      3 0000000000000082 NVWriteVgaCrtc
     11 000000000000001a OUT_RING
      9 0000000000000028 RING_SPACE
      2 0000000000000019 crtc_wr_cio_state
      3 0000000000000012 drm_gem_object_unreference
      2 0000000000000005 kmalloc
      3 000000000000000b kzalloc
      4 0000000000000051 nouveau_bo_ref
      2 0000000000000050 nvReadMC
      2 0000000000000052 nvWriteMC
      3 0000000000000029 nv_gf4_disp_arch
      4 000000000000001b nv_rd08
      3 000000000000001c nv_rd08
     29 0000000000000012 nv_rd32
      2 0000000000000012 nv_ri32
      5 000000000000001c nv_ro32
      4 000000000000008b nv_two_heads
     11 0000000000000022 nv_wo32
      8 0000000000000015 nv_wr08
     29 0000000000000014 nv_wr32
      2 0000000000000013 pci_read_config_dword

After this patch:

$ objdump -t nouveau.ko --section=.text | cut -f2 | sort -k2 | uniq -d -c
      4 
      9 0000000000000010 BEGIN_RING
      5 0000000000000051 FIRE_RING
      2 00000000000000b3 NVLockVgaCrtcs
      5 00000000000000a7 NVReadVgaCrtc
      2 0000000000000011 NVVgaSeqReset
      2 0000000000000073 NVWriteCRTC
      3 0000000000000072 NVWriteRAMDAC
      4 0000000000000091 NVWriteVgaCrtc
      3 0000000000000092 NVWriteVgaCrtc
     11 000000000000001a OUT_RING
      9 0000000000000028 RING_SPACE
      2 0000000000000019 crtc_wr_cio_state
      3 0000000000000012 drm_gem_object_unreference
      2 0000000000000005 kmalloc
      3 000000000000000b kzalloc
      3 0000000000000051 nouveau_bo_ref
      2 0000000000000052 nouveau_bo_ref
      3 000000000000005d nvReadMC
      2 000000000000005c nvWriteMC
      3 0000000000000029 nv_gf4_disp_arch
      4 000000000000008b nv_two_heads
      2 0000000000000013 pci_read_config_dword

As you can see, the static inline functions changed to extern
inline functions no longer appear many times in the final kernel
module. But, at the same time nouveau.ko file size
before: 583683 B (.text size 0x000312c8)
after:  681075 B (.text size 0x00039474)
That's .text size increase by 32 kB.

So something is definitely inlined a lot more. This was tested on
x86_64, gcc 4.1.2, CONFIG_OPTIMIZE_INLINING=y,
CONFIG_CC_OPTIMIZE_FOR_SIZE=y.

Now, I'm not sure if this patch would be a good thing or not.
Comments?

I can convert more static inline functions, if this is deemed a
good idea.

 drivers/gpu/drm/nouveau/nouveau_drv.c     |    4 ++
 drivers/gpu/drm/nouveau/nouveau_drv.h     |   51 +----------------------
 drivers/gpu/drm/nouveau/nouveau_inlines.h |   64 +++++++++++++++++++++++++++++
 3 files changed, 69 insertions(+), 50 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/nouveau_inlines.h

diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.c b/drivers/gpu/drm/nouveau/nouveau_drv.c
index f766ca9..c903e9d 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.c
@@ -364,3 +364,7 @@ module_exit(nouveau_exit);
 MODULE_AUTHOR(DRIVER_AUTHOR);
 MODULE_DESCRIPTION(DRIVER_DESC);
 MODULE_LICENSE("GPL and additional rights");
+
+#define NOUVEAU_WANT_UNINLINED
+#include "nouveau_inlines.h"
+
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index 381cadd..d8eac47 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -1005,60 +1005,11 @@ extern int nouveau_gem_ioctl_info(struct drm_device *, void *,
 #define nvchan_rd32(reg) \
 	ioread32_native((void __force __iomem *)chan->user->handle + (reg))
 
-/* register access */
-static inline u32 nv_rd32(struct drm_device *dev, unsigned reg)
-{
-	struct drm_nouveau_private *dev_priv = dev->dev_private;
-	return ioread32_native(dev_priv->mmio + reg);
-}
-
-static inline void nv_wr32(struct drm_device *dev, unsigned reg, u32 val)
-{
-	struct drm_nouveau_private *dev_priv = dev->dev_private;
-	iowrite32_native(val, dev_priv->mmio + reg);
-}
-
-static inline u8 nv_rd08(struct drm_device *dev, unsigned reg)
-{
-	struct drm_nouveau_private *dev_priv = dev->dev_private;
-	return ioread8(dev_priv->mmio + reg);
-}
-
-static inline void nv_wr08(struct drm_device *dev, unsigned reg, u8 val)
-{
-	struct drm_nouveau_private *dev_priv = dev->dev_private;
-	iowrite8(val, dev_priv->mmio + reg);
-}
+#include "nouveau_inlines.h"
 
 #define nv_wait(reg,mask,val) nouveau_wait_until(dev, 2000000000ULL, (reg),    \
 						 (mask), (val))
 
-/* PRAMIN access */
-static inline u32 nv_ri32(struct drm_device *dev, unsigned offset)
-{
-	struct drm_nouveau_private *dev_priv = dev->dev_private;
-	return ioread32_native(dev_priv->ramin + offset);
-}
-
-static inline void nv_wi32(struct drm_device *dev, unsigned offset, u32 val)
-{
-	struct drm_nouveau_private *dev_priv = dev->dev_private;
-	iowrite32_native(val, dev_priv->ramin + offset);
-}
-
-/* object access */
-static inline u32 nv_ro32(struct drm_device *dev, struct nouveau_gpuobj *obj,
-				unsigned index)
-{
-	return nv_ri32(dev, obj->im_pramin->start + index * 4);
-}
-
-static inline void nv_wo32(struct drm_device *dev, struct nouveau_gpuobj *obj,
-				unsigned index, u32 val)
-{
-	nv_wi32(dev, obj->im_pramin->start + index * 4, val);
-}
-
 /* logging */
 #define NV_PRINTK(level, d, fmt, arg...) \
 	printk(level "nouveau %s: " fmt, pci_name(d->pdev), ##arg)
diff --git a/drivers/gpu/drm/nouveau/nouveau_inlines.h b/drivers/gpu/drm/nouveau/nouveau_inlines.h
new file mode 100644
index 0000000..557d1cf
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nouveau_inlines.h
@@ -0,0 +1,64 @@
+/*
+ * No inclusion guards, since this header must be included twice for
+ * nouveau_drv.c.
+ */
+
+#ifdef NOUVEAU_WANT_UNINLINED
+#define NVINLINE
+#else
+#define NVINLINE extern inline
+#endif
+
+/* register access */
+NVINLINE u32 nv_rd32(struct drm_device *dev, unsigned reg)
+{
+	struct drm_nouveau_private *dev_priv = dev->dev_private;
+	return ioread32_native(dev_priv->mmio + reg);
+}
+
+NVINLINE void nv_wr32(struct drm_device *dev, unsigned reg, u32 val)
+{
+	struct drm_nouveau_private *dev_priv = dev->dev_private;
+	iowrite32_native(val, dev_priv->mmio + reg);
+}
+
+NVINLINE u8 nv_rd08(struct drm_device *dev, unsigned reg)
+{
+	struct drm_nouveau_private *dev_priv = dev->dev_private;
+	return ioread8(dev_priv->mmio + reg);
+}
+
+NVINLINE void nv_wr08(struct drm_device *dev, unsigned reg, u8 val)
+{
+	struct drm_nouveau_private *dev_priv = dev->dev_private;
+	iowrite8(val, dev_priv->mmio + reg);
+}
+
+/* PRAMIN access */
+NVINLINE u32 nv_ri32(struct drm_device *dev, unsigned offset)
+{
+	struct drm_nouveau_private *dev_priv = dev->dev_private;
+	return ioread32_native(dev_priv->ramin + offset);
+}
+
+NVINLINE void nv_wi32(struct drm_device *dev, unsigned offset, u32 val)
+{
+	struct drm_nouveau_private *dev_priv = dev->dev_private;
+	iowrite32_native(val, dev_priv->ramin + offset);
+}
+
+/* object access */
+NVINLINE u32 nv_ro32(struct drm_device *dev, struct nouveau_gpuobj *obj,
+				unsigned index)
+{
+	return nv_ri32(dev, obj->im_pramin->start + index * 4);
+}
+
+NVINLINE void nv_wo32(struct drm_device *dev, struct nouveau_gpuobj *obj,
+				unsigned index, u32 val)
+{
+	nv_wi32(dev, obj->im_pramin->start + index * 4, val);
+}
+
+#undef NVINLINE
+
-- 
1.6.3.3

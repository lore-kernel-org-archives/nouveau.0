From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: [PATCH 3/4] drm/nouveau: remove NVRead and NVWrite
Date: Sun,  6 Sep 2009 21:16:02 +0300
Message-ID: <1252260963-5163-3-git-send-email-pq@iki.fi>
References: <1252260963-5163-1-git-send-email-pq@iki.fi>
	<1252260963-5163-2-git-send-email-pq@iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1252260963-5163-2-git-send-email-pq-X3B1VOXEql0@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

These functions were effectively nv_rd32 and nv_wr32 with a debug print,
and they were never used. Remove them.

Signed-off-by: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_drv.c |    7 ++++---
 drivers/gpu/drm/nouveau/nouveau_drv.h |   11 +++++------
 drivers/gpu/drm/nouveau/nouveau_hw.h  |   13 -------------
 3 files changed, 9 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.c b/drivers/gpu/drm/nouveau/nouveau_drv.c
index d17b16c..684c296 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.c
@@ -66,9 +66,10 @@ MODULE_PARM_DESC(tv_norm, "Default TV norm.\n"
 char *nouveau_tv_norm = NULL;
 module_param_named(tv_norm, nouveau_tv_norm, charp, 0400);
 
-MODULE_PARM_DESC(reg_debug, "Reg debug bitmask: 0x1 mc, 0x2 video, 0x4 fb, 0x8 extdev,\n"
-		"\t\t0x10 misc regs, 0x20 crtc, 0x40 ramdac, 0x80 vgacrtc,\n"
-		"\t\t0x100 rmvio, 0x200 vgaattr.\n");
+MODULE_PARM_DESC(reg_debug, "Register access debug bitmask:\n"
+		"\t\t0x1 mc, 0x2 video, 0x4 fb, 0x8 extdev,\n"
+		"\t\t0x10 crtc, 0x20 ramdac, 0x40 vgacrtc, 0x80 rmvio,\n"
+		"\t\t0x100 vgaattr. ");
 int nouveau_reg_debug;
 module_param_named(reg_debug, nouveau_reg_debug, int, 0600);
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index aed773e..b717c1c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -1118,12 +1118,11 @@ enum {
 	NOUVEAU_REG_DEBUG_VIDEO          = 0x2,
 	NOUVEAU_REG_DEBUG_FB             = 0x4,
 	NOUVEAU_REG_DEBUG_EXTDEV         = 0x8,
-	NOUVEAU_REG_DEBUG_REG            = 0x10,
-	NOUVEAU_REG_DEBUG_CRTC           = 0x20,
-	NOUVEAU_REG_DEBUG_RAMDAC         = 0x40,
-	NOUVEAU_REG_DEBUG_VGACRTC        = 0x80,
-	NOUVEAU_REG_DEBUG_RMVIO          = 0x100,
-	NOUVEAU_REG_DEBUG_VGAATTR        = 0x200,
+	NOUVEAU_REG_DEBUG_CRTC           = 0x10,
+	NOUVEAU_REG_DEBUG_RAMDAC         = 0x20,
+	NOUVEAU_REG_DEBUG_VGACRTC        = 0x40,
+	NOUVEAU_REG_DEBUG_RMVIO          = 0x80,
+	NOUVEAU_REG_DEBUG_VGAATTR        = 0x100,
 };
 
 #define NV_REG_DEBUG(type, dev, fmt, arg...) do { \
diff --git a/drivers/gpu/drm/nouveau/nouveau_hw.h b/drivers/gpu/drm/nouveau/nouveau_hw.h
index a27e0d0..d24fad0 100644
--- a/drivers/gpu/drm/nouveau/nouveau_hw.h
+++ b/drivers/gpu/drm/nouveau/nouveau_hw.h
@@ -115,19 +115,6 @@ nvWriteEXTDEV(struct drm_device *dev, uint32_t reg, uint32_t val)
 	nv_wr32(dev, reg, val);
 }
 
-static inline uint32_t NVRead(struct drm_device *dev, uint32_t reg)
-{
-	uint32_t val = nv_rd32(dev, reg);
-	NV_REG_DEBUG(REG, dev, "reg %08x val %08x\n", reg, val);
-	return val;
-}
-
-static inline void NVWrite(struct drm_device *dev, uint32_t reg, uint32_t val)
-{
-	NV_REG_DEBUG(REG, dev, "reg %08x val %08x\n", reg, val);
-	nv_wr32(dev, reg, val);
-}
-
 static inline uint32_t NVReadCRTC(struct drm_device *dev,
 					int head, uint32_t reg)
 {
-- 
1.6.3.3

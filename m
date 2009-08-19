From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: [PATCHv3 1/2] drm/nouveau: Define some 16bit BO accessors.
Date: Wed, 19 Aug 2009 20:33:49 +0200
Message-ID: <1250706830-11092-1-git-send-email-currojerez@riseup.net>
References: <1250701360-5619-1-git-send-email-currojerez@riseup.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1250701360-5619-1-git-send-email-currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
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


Signed-off-by: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_bo.c  |   25 +++++++++++++++++++++++++
 drivers/gpu/drm/nouveau/nouveau_drv.h |    6 ++++++
 2 files changed, 31 insertions(+), 0 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index eba257a..358a9aa 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -187,6 +187,30 @@ nouveau_bo_unmap(struct nouveau_bo *nvbo)
 	ttm_bo_kunmap(&nvbo->kmap);
 }
 
+u16
+nouveau_bo_rd16(struct nouveau_bo *nvbo, unsigned index)
+{
+	bool is_iomem;
+	u16 *mem = ttm_kmap_obj_virtual(&nvbo->kmap, &is_iomem);
+	mem = &mem[index];
+	if (is_iomem)
+		return ioread16_native((void __force __iomem *)mem);
+	else
+		return *mem;
+}
+
+void
+nouveau_bo_wr16(struct nouveau_bo *nvbo, unsigned index, u16 val)
+{
+	bool is_iomem;
+	u16 *mem = ttm_kmap_obj_virtual(&nvbo->kmap, &is_iomem);
+	mem = &mem[index];
+	if (is_iomem)
+		iowrite16_native(val, (void __force __iomem *)mem);
+	else
+		*mem = val;
+}
+
 u32
 nouveau_bo_rd32(struct nouveau_bo *nvbo, unsigned index)
 {
@@ -210,6 +234,7 @@ nouveau_bo_wr32(struct nouveau_bo *nvbo, unsigned index, u32 val)
 	else
 		*mem = val;
 }
+
 static struct ttm_backend *
 nouveau_bo_create_ttm_backend_entry(struct ttm_bo_device *bdev)
 {
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index 5aca302..737e374 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -967,6 +967,8 @@ extern int nouveau_bo_pin(struct nouveau_bo *, uint32_t flags);
 extern int nouveau_bo_unpin(struct nouveau_bo *);
 extern int nouveau_bo_map(struct nouveau_bo *);
 extern void nouveau_bo_unmap(struct nouveau_bo *);
+extern u16 nouveau_bo_rd16(struct nouveau_bo *nvbo, unsigned index);
+extern void nouveau_bo_wr16(struct nouveau_bo *nvbo, unsigned index, u16 val);
 extern u32 nouveau_bo_rd32(struct nouveau_bo *nvbo, unsigned index);
 extern void nouveau_bo_wr32(struct nouveau_bo *nvbo, unsigned index, u32 val);
 
@@ -1013,9 +1015,13 @@ extern int nouveau_gem_ioctl_info(struct drm_device *, void *,
 
 #ifndef ioread32_native
 #ifdef __BIG_ENDIAN
+#define ioread16_native ioread16be
+#define iowrite16_native iowrite16be
 #define ioread32_native  ioread32be
 #define iowrite32_native iowrite32be
 #else /* def __BIG_ENDIAN */
+#define ioread16_native ioread16
+#define iowrite16_native iowrite16
 #define ioread32_native  ioread32
 #define iowrite32_native iowrite32
 #endif /* def __BIG_ENDIAN else */
-- 
1.6.3.3

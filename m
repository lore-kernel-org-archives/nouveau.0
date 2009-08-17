From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: [PATCH 1/8] drm/nouveau: bo read/write wrappers for
	nv04_crtc.c
Date: Mon, 17 Aug 2009 16:42:37 +0300
Message-ID: <1250516564-14193-2-git-send-email-pq@iki.fi>
References: <1250516564-14193-1-git-send-email-pq@iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1250516564-14193-1-git-send-email-pq-X3B1VOXEql0@public.gmane.org>
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

Introduce accessors for TTM buffer object memory that has been mapped
into the kernel virtual address space or as IO memory. IO memory needs
to be accessed via special accessor functions, not by dereferencing the
iomem cookie. The wrappers hide the details of 32-bit access and honour
the TTM map type.

nv04_crtc_cursor_set() is changed to use the new wrappers. 'cursor' is
received from user space, which means we cannot assume that it is or is
not iomem. 'nv_crtc->cursor.nvbo' should always be iomem, and as such
the access is relatively slow. Therefore using the wrappers for it, too,
should not cost much.

Signed-off-by: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_bo.c  |   23 +++++++++++++++++++++++
 drivers/gpu/drm/nouveau/nouveau_drv.h |    2 ++
 drivers/gpu/drm/nouveau/nv04_crtc.c   |    7 ++-----
 3 files changed, 27 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index a7b2a61..e7a8d60 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -188,6 +188,29 @@ nouveau_bo_unmap(struct nouveau_bo *nvbo)
 	ttm_bo_kunmap(&nvbo->kmap);
 }
 
+u32
+nouveau_bo_rd32(struct nouveau_bo *nvbo, unsigned index)
+{
+	bool is_iomem;
+	u32 *mem = ttm_kmap_obj_virtual(&nvbo->kmap, &is_iomem);
+	mem = &mem[index];
+	if (is_iomem)
+		return ioread32_native((void __force __iomem *)mem);
+	else
+		return *mem;
+}
+
+void
+nouveau_bo_wr32(struct nouveau_bo *nvbo, unsigned index, u32 val)
+{
+	bool is_iomem;
+	u32 *mem = ttm_kmap_obj_virtual(&nvbo->kmap, &is_iomem);
+	mem = &mem[index];
+	if (is_iomem)
+		iowrite32_native(val, (void __force __iomem *)mem);
+	else
+		*mem = val;
+}
 static struct ttm_backend *
 nouveau_bo_create_ttm_backend_entry(struct ttm_bo_device *bdev)
 {
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index b2f69bc..fe6a0a1 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -958,6 +958,8 @@ extern int nouveau_bo_pin(struct nouveau_bo *, uint32_t flags);
 extern int nouveau_bo_unpin(struct nouveau_bo *);
 extern int nouveau_bo_map(struct nouveau_bo *);
 extern void nouveau_bo_unmap(struct nouveau_bo *);
+extern u32 nouveau_bo_rd32(struct nouveau_bo *nvbo, unsigned index);
+extern void nouveau_bo_wr32(struct nouveau_bo *nvbo, unsigned index, u32 val);
 
 /* nouveau_fence.c */
 struct nouveau_fence;
diff --git a/drivers/gpu/drm/nouveau/nv04_crtc.c b/drivers/gpu/drm/nouveau/nv04_crtc.c
index dfe9003..4e56c25 100644
--- a/drivers/gpu/drm/nouveau/nv04_crtc.c
+++ b/drivers/gpu/drm/nouveau/nv04_crtc.c
@@ -848,7 +848,6 @@ nv04_crtc_cursor_set(struct drm_crtc *crtc, struct drm_file *file_priv,
 	struct nouveau_crtc *nv_crtc = nouveau_crtc(crtc);
 	struct nouveau_bo *cursor = NULL;
 	struct drm_gem_object *gem;
-	uint32_t *src, *dst, pixel;
 	int ret = 0, alpha, i;
 
 	if (width != 64 || height != 64)
@@ -867,8 +866,6 @@ nv04_crtc_cursor_set(struct drm_crtc *crtc, struct drm_file *file_priv,
 	ret = nouveau_bo_map(cursor);
 	if (ret)
 		goto out;
-	src = cursor->kmap.virtual;
-	dst = nv_crtc->cursor.nvbo->kmap.virtual;
 
 	/* nv11+ supports premultiplied (PM), or non-premultiplied (NPM) alpha
 	 * cursors (though NPM in combination with fp dithering may not work on
@@ -877,7 +874,7 @@ nv04_crtc_cursor_set(struct drm_crtc *crtc, struct drm_file *file_priv,
 	 * blob uses, however we get given PM cursors so we use PM mode
 	 */
 	for (i = 0; i < 64 * 64; i++) {
-		pixel = *src++;
+		uint32_t pixel = nouveau_bo_rd32(cursor, i);
 
 		/* hw gets unhappy if alpha <= rgb values.  for a PM image "less
 		 * than" shouldn't happen; fix "equal to" case by adding one to
@@ -897,7 +894,7 @@ nv04_crtc_cursor_set(struct drm_crtc *crtc, struct drm_file *file_priv,
 		}
 #endif
 
-		*dst++ = pixel;
+		nouveau_bo_wr32(nv_crtc->cursor.nvbo, i, pixel);
 	}
 
 	nouveau_bo_unmap(cursor);
-- 
1.6.3.3

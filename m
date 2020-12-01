From: Alistair Popple <apopple-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] drm/nouveau/svm: Only map migrating pages
Date: Tue, 1 Dec 2020 12:29:36 +1100
Message-ID: <20201201012936.9046-1-apopple@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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
Cc: rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Alistair Popple <apopple-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
List-Id: nouveau.vger.kernel.org

Only pages which were actually migrated should be mapped on the GPU.
migrate_vma_pages() clears MIGRATE_PFN_MIGRATE in the src_pfn array, so
test this prior to mapping the pages on the GPU. If any pages failed to
migrate don't install any mappings - the GPU will demand fault any as
required.

Fixes: e3d8b0890469 ("drm/nouveau/svm: map pages after migration")
Signed-off-by: Alistair Popple <apopple-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_dmem.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
index 92987daa5e17..a2169644f114 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -618,8 +618,9 @@ static void nouveau_dmem_migrate_chunk(struct nouveau_drm *drm,
 		dma_addr_t *dma_addrs, u64 *pfns)
 {
 	struct nouveau_fence *fence;
-	unsigned long addr = args->start, nr_dma = 0, i;
+	unsigned long addr = args->start, nr_dma = 0, i, npages;
 
+	npages = (args->end - args->start) >> PAGE_SHIFT;
 	for (i = 0; addr < args->end; i++) {
 		args->dst[i] = nouveau_dmem_migrate_copy_one(drm, svmm,
 				args->src[i], dma_addrs + nr_dma, pfns + i);
@@ -631,7 +632,16 @@ static void nouveau_dmem_migrate_chunk(struct nouveau_drm *drm,
 	nouveau_fence_new(drm->dmem->migrate.chan, false, &fence);
 	migrate_vma_pages(args);
 	nouveau_dmem_fence_done(&fence);
-	nouveau_pfns_map(svmm, args->vma->vm_mm, args->start, pfns, i);
+
+	for (i = 0; i < npages; i++)
+		if (!(args->src[i] & MIGRATE_PFN_MIGRATE))
+			break;
+
+	/* If all pages were migrated successfully map them on the GPU. If any
+	 * failed just let the GPU fault to create the mapping.
+	 */
+	if (i == npages)
+		nouveau_pfns_map(svmm, args->vma->vm_mm, args->start, pfns, npages);
 
 	while (nr_dma--) {
 		dma_unmap_page(drm->dev->dev, dma_addrs[nr_dma], PAGE_SIZE,
-- 
2.20.1

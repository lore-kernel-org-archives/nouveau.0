From: Ralph Campbell <rcampbell@nvidia.com>
Subject: [PATCH] nouveau/hmm: fix migrate zero page to GPU
Date: Wed, 20 May 2020 11:36:52 -0700
Message-ID: <20200520183652.21633-1-rcampbell@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: nouveau@lists.freedesktop.org, linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Jerome Glisse <jglisse@redhat.com>, John Hubbard <jhubbard@nvidia.com>, Christoph Hellwig <hch@lst.de>, Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>
List-Id: nouveau.vger.kernel.org

When calling OpenCL clEnqueueSVMMigrateMem() on a region of memory that
is backed by pte_none() or zero pages, migrate_vma_setup() will fill the
source PFN array with an entry indicating the source page is zero.
Use this to optimize migration to device private memory by allocating
GPU memory and zero filling it instead of failing to migrate the page.

Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
---

This patch applies cleanly to Jason's Gunthorpe's hmm tree plus two
patches I posted earlier. The first is queued in Ben Skegg's nouveau
tree and the second is still pending review/not queued.
[1] ("nouveau/hmm: map pages after migration")
https://lore.kernel.org/linux-mm/20200304001339.8248-5-rcampbell@nvidia.com=
/
[2] ("nouveau/hmm: fix nouveau_dmem_chunk allocations")
https://lore.kernel.org/lkml/20200421231107.30958-1-rcampbell@nvidia.com/

 drivers/gpu/drm/nouveau/nouveau_dmem.c | 75 ++++++++++++++++++++++----
 1 file changed, 66 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouve=
au/nouveau_dmem.c
index cbc71567f9a5..e5c230d9ae24 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -56,6 +56,8 @@ enum nouveau_aper {
 typedef int (*nouveau_migrate_copy_t)(struct nouveau_drm *drm, u64 npages,
 				      enum nouveau_aper, u64 dst_addr,
 				      enum nouveau_aper, u64 src_addr);
+typedef int (*nouveau_clear_page_t)(struct nouveau_drm *drm, u32 length,
+				      enum nouveau_aper, u64 dst_addr);
=20
 struct nouveau_dmem_chunk {
 	struct list_head list;
@@ -67,6 +69,7 @@ struct nouveau_dmem_chunk {
=20
 struct nouveau_dmem_migrate {
 	nouveau_migrate_copy_t copy_func;
+	nouveau_clear_page_t clear_func;
 	struct nouveau_channel *chan;
 };
=20
@@ -436,6 +439,52 @@ nvc0b5_migrate_copy(struct nouveau_drm *drm, u64 npage=
s,
 	return 0;
 }
=20
+static int
+nvc0b5_migrate_clear(struct nouveau_drm *drm, u32 length,
+		     enum nouveau_aper dst_aper, u64 dst_addr)
+{
+	struct nouveau_channel *chan =3D drm->dmem->migrate.chan;
+	u32 launch_dma =3D (1 << 10) /* REMAP_ENABLE_TRUE */ |
+			 (1 << 8) /* DST_MEMORY_LAYOUT_PITCH. */ |
+			 (1 << 7) /* SRC_MEMORY_LAYOUT_PITCH. */ |
+			 (1 << 2) /* FLUSH_ENABLE_TRUE. */ |
+			 (2 << 0) /* DATA_TRANSFER_TYPE_NON_PIPELINED. */;
+	u32 remap =3D (4 <<  0) /* DST_X_CONST_A */ |
+		    (5 <<  4) /* DST_Y_CONST_B */ |
+		    (3 << 16) /* COMPONENT_SIZE_FOUR */ |
+		    (1 << 24) /* NUM_DST_COMPONENTS_TWO */;
+	int ret;
+
+	ret =3D RING_SPACE(chan, 12);
+	if (ret)
+		return ret;
+
+	switch (dst_aper) {
+	case NOUVEAU_APER_VRAM:
+		BEGIN_IMC0(chan, NvSubCopy, 0x0264, 0);
+			break;
+	case NOUVEAU_APER_HOST:
+		BEGIN_IMC0(chan, NvSubCopy, 0x0264, 1);
+		break;
+	default:
+		return -EINVAL;
+	}
+	launch_dma |=3D 0x00002000; /* DST_TYPE_PHYSICAL. */
+
+	BEGIN_NVC0(chan, NvSubCopy, 0x0700, 3);
+	OUT_RING(chan, 0);
+	OUT_RING(chan, 0);
+	OUT_RING(chan, remap);
+	BEGIN_NVC0(chan, NvSubCopy, 0x0408, 2);
+	OUT_RING(chan, upper_32_bits(dst_addr));
+	OUT_RING(chan, lower_32_bits(dst_addr));
+	BEGIN_NVC0(chan, NvSubCopy, 0x0418, 1);
+	OUT_RING(chan, length >> 3);
+	BEGIN_NVC0(chan, NvSubCopy, 0x0300, 1);
+	OUT_RING(chan, launch_dma);
+	return 0;
+}
+
 static int
 nouveau_dmem_migrate_init(struct nouveau_drm *drm)
 {
@@ -445,6 +494,7 @@ nouveau_dmem_migrate_init(struct nouveau_drm *drm)
 	case  VOLTA_DMA_COPY_A:
 	case TURING_DMA_COPY_A:
 		drm->dmem->migrate.copy_func =3D nvc0b5_migrate_copy;
+		drm->dmem->migrate.clear_func =3D nvc0b5_migrate_clear;
 		drm->dmem->migrate.chan =3D drm->ttm.chan;
 		return 0;
 	default:
@@ -487,21 +537,28 @@ static unsigned long nouveau_dmem_migrate_copy_one(st=
ruct nouveau_drm *drm,
 	unsigned long paddr;
=20
 	spage =3D migrate_pfn_to_page(src);
-	if (!spage || !(src & MIGRATE_PFN_MIGRATE))
+	if (!(src & MIGRATE_PFN_MIGRATE))
 		goto out;
=20
 	dpage =3D nouveau_dmem_page_alloc_locked(drm);
 	if (!dpage)
 		goto out;
=20
-	*dma_addr =3D dma_map_page(dev, spage, 0, PAGE_SIZE, DMA_BIDIRECTIONAL);
-	if (dma_mapping_error(dev, *dma_addr))
-		goto out_free_page;
-
 	paddr =3D nouveau_dmem_page_addr(dpage);
-	if (drm->dmem->migrate.copy_func(drm, 1, NOUVEAU_APER_VRAM,
-			paddr, NOUVEAU_APER_HOST, *dma_addr))
-		goto out_dma_unmap;
+	if (spage) {
+		*dma_addr =3D dma_map_page(dev, spage, 0, page_size(spage),
+					 DMA_BIDIRECTIONAL);
+		if (dma_mapping_error(dev, *dma_addr))
+			goto out_free_page;
+		if (drm->dmem->migrate.copy_func(drm, page_size(spage),
+			NOUVEAU_APER_VRAM, paddr, NOUVEAU_APER_HOST, *dma_addr))
+			goto out_dma_unmap;
+	} else {
+		*dma_addr =3D DMA_MAPPING_ERROR;
+		if (drm->dmem->migrate.clear_func(drm, page_size(dpage),
+			NOUVEAU_APER_VRAM, paddr))
+			goto out_free_page;
+	}
=20
 	*pfn =3D NVIF_VMM_PFNMAP_V0_V | NVIF_VMM_PFNMAP_V0_VRAM |
 		((paddr >> PAGE_SHIFT) << NVIF_VMM_PFNMAP_V0_ADDR_SHIFT);
@@ -528,7 +585,7 @@ static void nouveau_dmem_migrate_chunk(struct nouveau_d=
rm *drm,
 	for (i =3D 0; addr < args->end; i++) {
 		args->dst[i] =3D nouveau_dmem_migrate_copy_one(drm, args->src[i],
 				dma_addrs + nr_dma, pfns + i);
-		if (args->dst[i])
+		if (!dma_mapping_error(drm->dev->dev, dma_addrs[nr_dma]))
 			nr_dma++;
 		addr +=3D PAGE_SIZE;
 	}
--=20
2.20.1

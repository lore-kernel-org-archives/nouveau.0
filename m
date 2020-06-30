From: Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 3/5] nouveau: fix mapping 2MB sysmem pages
Date: Tue, 30 Jun 2020 12:57:35 -0700
Message-ID: <20200630195737.8667-4-rcampbell@nvidia.com>
References: <20200630195737.8667-1-rcampbell@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-rdma-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200630195737.8667-1-rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-rdma-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kselftest-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Jerome Glisse <jglisse-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, John Hubbard <jhubbard-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>, Jason Gunthorpe <jgg-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Shuah Khan <shuah-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

The nvif_object_ioctl() method NVIF_VMM_V0_PFNMAP wasn't correctly
setting the hardware specific GPU page table entries for 2MB sized
pages. Fix this by adding functions to set and clear PD0 GPU page
table entries.

Signed-off-by: Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c |  5 +-
 .../drm/nouveau/nvkm/subdev/mmu/vmmgp100.c    | 82 +++++++++++++++++++
 2 files changed, 84 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c b/drivers/gpu/dr=
m/nouveau/nvkm/subdev/mmu/vmm.c
index 199f94e15c5f..19a6804e3989 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
@@ -1204,7 +1204,6 @@ nvkm_vmm_pfn_unmap(struct nvkm_vmm *vmm, u64 addr, u6=
4 size)
 /*TODO:
  * - Avoid PT readback (for dma_unmap etc), this might end up being dealt
  *   with inside HMM, which would be a lot nicer for us to deal with.
- * - Multiple page sizes (particularly for huge page support).
  * - Support for systems without a 4KiB page size.
  */
 int
@@ -1220,8 +1219,8 @@ nvkm_vmm_pfn_map(struct nvkm_vmm *vmm, u8 shift, u64 =
addr, u64 size, u64 *pfn)
 	/* Only support mapping where the page size of the incoming page
 	 * array matches a page size available for direct mapping.
 	 */
-	while (page->shift && page->shift !=3D shift &&
-	       page->desc->func->pfn =3D=3D NULL)
+	while (page->shift && (page->shift !=3D shift ||
+	       page->desc->func->pfn =3D=3D NULL))
 		page++;
=20
 	if (!page->shift || !IS_ALIGNED(addr, 1ULL << shift) ||
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c b/drivers/g=
pu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c
index d86287565542..ed37fddd063f 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c
@@ -258,12 +258,94 @@ gp100_vmm_pd0_unmap(struct nvkm_vmm *vmm,
 	VMM_FO128(pt, vmm, pdei * 0x10, 0ULL, 0ULL, pdes);
 }
=20
+static void
+gp100_vmm_pd0_pfn_unmap(struct nvkm_vmm *vmm,
+			struct nvkm_mmu_pt *pt, u32 ptei, u32 ptes)
+{
+	struct device *dev =3D vmm->mmu->subdev.device->dev;
+	dma_addr_t addr;
+
+	nvkm_kmap(pt->memory);
+	while (ptes--) {
+		u32 datalo =3D nvkm_ro32(pt->memory, pt->base + ptei * 16 + 0);
+		u32 datahi =3D nvkm_ro32(pt->memory, pt->base + ptei * 16 + 4);
+		u64 data   =3D (u64)datahi << 32 | datalo;
+
+		if ((data & (3ULL << 1)) !=3D 0) {
+			addr =3D (data >> 8) << 12;
+			dma_unmap_page(dev, addr, 1UL << 21, DMA_BIDIRECTIONAL);
+		}
+		ptei++;
+	}
+	nvkm_done(pt->memory);
+}
+
+static bool
+gp100_vmm_pd0_pfn_clear(struct nvkm_vmm *vmm,
+			struct nvkm_mmu_pt *pt, u32 ptei, u32 ptes)
+{
+	bool dma =3D false;
+
+	nvkm_kmap(pt->memory);
+	while (ptes--) {
+		u32 datalo =3D nvkm_ro32(pt->memory, pt->base + ptei * 16 + 0);
+		u32 datahi =3D nvkm_ro32(pt->memory, pt->base + ptei * 16 + 4);
+		u64 data   =3D (u64)datahi << 32 | datalo;
+
+		if ((data & BIT_ULL(0)) && (data & (3ULL << 1)) !=3D 0) {
+			VMM_WO064(pt, vmm, ptei * 16, data & ~BIT_ULL(0));
+			dma =3D true;
+		}
+		ptei++;
+	}
+	nvkm_done(pt->memory);
+	return dma;
+}
+
+static void
+gp100_vmm_pd0_pfn(struct nvkm_vmm *vmm, struct nvkm_mmu_pt *pt,
+		  u32 ptei, u32 ptes, struct nvkm_vmm_map *map)
+{
+	struct device *dev =3D vmm->mmu->subdev.device->dev;
+	dma_addr_t addr;
+
+	nvkm_kmap(pt->memory);
+	while (ptes--) {
+		u64 data =3D 0;
+
+		if (!(*map->pfn & NVKM_VMM_PFN_W))
+			data |=3D BIT_ULL(6); /* RO. */
+
+		if (!(*map->pfn & NVKM_VMM_PFN_VRAM)) {
+			addr =3D *map->pfn >> NVKM_VMM_PFN_ADDR_SHIFT;
+			addr =3D dma_map_page(dev, pfn_to_page(addr), 0,
+					    1UL << 21, DMA_BIDIRECTIONAL);
+			if (!WARN_ON(dma_mapping_error(dev, addr))) {
+				data |=3D addr >> 4;
+				data |=3D 2ULL << 1; /* SYSTEM_COHERENT_MEMORY. */
+				data |=3D BIT_ULL(3); /* VOL. */
+				data |=3D BIT_ULL(0); /* VALID. */
+			}
+		} else {
+			data |=3D (*map->pfn & NVKM_VMM_PFN_ADDR) >> 4;
+			data |=3D BIT_ULL(0); /* VALID. */
+		}
+
+		VMM_WO064(pt, vmm, ptei++ * 16, data);
+		map->pfn++;
+	}
+	nvkm_done(pt->memory);
+}
+
 static const struct nvkm_vmm_desc_func
 gp100_vmm_desc_pd0 =3D {
 	.unmap =3D gp100_vmm_pd0_unmap,
 	.sparse =3D gp100_vmm_pd0_sparse,
 	.pde =3D gp100_vmm_pd0_pde,
 	.mem =3D gp100_vmm_pd0_mem,
+	.pfn =3D gp100_vmm_pd0_pfn,
+	.pfn_clear =3D gp100_vmm_pd0_pfn_clear,
+	.pfn_unmap =3D gp100_vmm_pd0_pfn_unmap,
 };
=20
 static void
--=20
2.20.1

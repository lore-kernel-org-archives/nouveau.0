From: Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v3 1/5] nouveau: fix storing invalid ptes
Date: Tue, 21 Jul 2020 14:31:15 -0700
Message-ID: <20200721213119.32344-2-rcampbell@nvidia.com>
References: <20200721213119.32344-1-rcampbell@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-rdma-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200721213119.32344-1-rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-rdma-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, kvm-ppc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kselftest-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Jerome Glisse <jglisse-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, John Hubbard <jhubbard-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>, Jason Gunthorpe <jgg-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Shuah Khan <shuah-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Bharata B Rao <bharata-tEXmvtCZX7AybS5Ee8rs3A@public.gmane.org>, Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

When migrating a range of system memory to device private memory, some
of the pages in the address range may not be migrating. In this case,
the non migrating pages won't have a new GPU MMU entry to store but
the nvif_object_ioctl() NVIF_VMM_V0_PFNMAP method doesn't check the input
and stores a bad valid GPU page table entry.
Fix this by skipping the invalid input PTEs when updating the GPU page
tables.

Signed-off-by: Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c b/drivers/g=
pu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c
index ed37fddd063f..7eabe9fe0d2b 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c
@@ -79,8 +79,12 @@ gp100_vmm_pgt_pfn(struct nvkm_vmm *vmm, struct nvkm_mmu_=
pt *pt,
 	dma_addr_t addr;
=20
 	nvkm_kmap(pt->memory);
-	while (ptes--) {
+	for (; ptes; ptes--, map->pfn++) {
 		u64 data =3D 0;
+
+		if (!(*map->pfn & NVKM_VMM_PFN_V))
+			continue;
+
 		if (!(*map->pfn & NVKM_VMM_PFN_W))
 			data |=3D BIT_ULL(6); /* RO. */
=20
@@ -100,7 +104,6 @@ gp100_vmm_pgt_pfn(struct nvkm_vmm *vmm, struct nvkm_mmu=
_pt *pt,
 		}
=20
 		VMM_WO064(pt, vmm, ptei++ * 8, data);
-		map->pfn++;
 	}
 	nvkm_done(pt->memory);
 }
@@ -310,9 +313,12 @@ gp100_vmm_pd0_pfn(struct nvkm_vmm *vmm, struct nvkm_mm=
u_pt *pt,
 	dma_addr_t addr;
=20
 	nvkm_kmap(pt->memory);
-	while (ptes--) {
+	for (; ptes; ptes--, map->pfn++) {
 		u64 data =3D 0;
=20
+		if (!(*map->pfn & NVKM_VMM_PFN_V))
+			continue;
+
 		if (!(*map->pfn & NVKM_VMM_PFN_W))
 			data |=3D BIT_ULL(6); /* RO. */
=20
@@ -332,7 +338,6 @@ gp100_vmm_pd0_pfn(struct nvkm_vmm *vmm, struct nvkm_mmu=
_pt *pt,
 		}
=20
 		VMM_WO064(pt, vmm, ptei++ * 16, data);
-		map->pfn++;
 	}
 	nvkm_done(pt->memory);
 }
--=20
2.20.1

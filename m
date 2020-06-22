From: Ralph Campbell <rcampbell@nvidia.com>
Subject: [RESEND PATCH 2/3] nouveau: fix mixed normal and device private page migration
Date: Mon, 22 Jun 2020 16:38:53 -0700
Message-ID: <20200622233854.10889-3-rcampbell@nvidia.com>
References: <20200622233854.10889-1-rcampbell@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200622233854.10889-1-rcampbell@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Jerome Glisse <jglisse@redhat.com>, John Hubbard <jhubbard@nvidia.com>, Christoph Hellwig <hch@lst.de>, Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>
List-Id: nouveau.vger.kernel.org

The OpenCL function clEnqueueSVMMigrateMem(), without any flags, will
migrate memory in the given address range to device private memory. The
source pages might already have been migrated to device private memory.
In that case, the source struct page is not checked to see if it is
a device private page and incorrectly computes the GPU's physical
address of local memory leading to data corruption.
Fix this by checking the source struct page and computing the correct
physical address.

Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
---
 drivers/gpu/drm/nouveau/nouveau_dmem.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouve=
au/nouveau_dmem.c
index cc9993837508..f6a806ba3caa 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -540,6 +540,12 @@ static unsigned long nouveau_dmem_migrate_copy_one(str=
uct nouveau_drm *drm,
 	if (!(src & MIGRATE_PFN_MIGRATE))
 		goto out;
=20
+	if (spage && is_device_private_page(spage)) {
+		paddr =3D nouveau_dmem_page_addr(spage);
+		*dma_addr =3D DMA_MAPPING_ERROR;
+		goto done;
+	}
+
 	dpage =3D nouveau_dmem_page_alloc_locked(drm);
 	if (!dpage)
 		goto out;
@@ -560,6 +566,7 @@ static unsigned long nouveau_dmem_migrate_copy_one(stru=
ct nouveau_drm *drm,
 			goto out_free_page;
 	}
=20
+done:
 	*pfn =3D NVIF_VMM_PFNMAP_V0_V | NVIF_VMM_PFNMAP_V0_VRAM |
 		((paddr >> PAGE_SHIFT) << NVIF_VMM_PFNMAP_V0_ADDR_SHIFT);
 	if (src & MIGRATE_PFN_WRITE)
@@ -615,6 +622,7 @@ nouveau_dmem_migrate_vma(struct nouveau_drm *drm,
 	struct migrate_vma args =3D {
 		.vma		=3D vma,
 		.start		=3D start,
+		.src_owner	=3D drm->dev,
 	};
 	unsigned long i;
 	u64 *pfns;
--=20
2.20.1
